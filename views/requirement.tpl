% if detail == 'list':
  % if requirement:
    <a class="requirement" href="/{{requirement.repository.state.identifier}}/requirements#{{path}}">
      {{!'<span class="error">☐</span>' if not [x for x in requirement.mapped_to.itervalues() if x.kind == 'component'] else '☑'}} {{requirement.title}} <span>{{path}}</span>
    </a>
  % else:
    % include pathnotfound path=path, detail=detail
  % end
% elif detail == 'full':
  % if requirement:
    <dt><h2 id="{{path}}">{{!'<span class="error">☐</span>' if not [x for x in requirement.mapped_to.itervalues() if x.kind == 'component'] else '☑'}} {{requirement.title}} <span>{{path}}</span></h2></dt>
    <dd>
      <table cellspacing="0" cellpadding="0">
        <tr>
          <th>Description</th>
          <td>{{!requirement.description}}</td>
        </tr>
        % if requirement.tags:
          <tr>
            <th>Tags</th>
            <td>
              <ul>
                % for path, tag in requirement.tags.iteritems():
                  <li>
                    %include tag path=path, tag=tag, detail='list'
                  </li>
                % end
              </ul>
            </td>
          </tr>
        % end
        % if requirement.parent[0]:
          <tr>
            <th>Parent</th>
            <td>
              <p>
                % path, parent = requirement.parent
                % include requirement path=path, requirement=parent, detail='list'
              </p>
            </td>
          </tr>
        % end
        % if requirement.subrequirements:
          <tr>
            <th>Subrequirements</th>
            <td>
              <ul>
                % for path, other in requirement.subrequirements.iteritems():
                  <li>
                    % include requirement path=path, requirement=other, detail='list'
                  </li>
                % end
              </ul>
            </td>
          </tr>
        % end
        <tr>
          <th>Mapped To</th>
          <td>
            % if requirement.mapped_to:
              <ul>
                % for path, element in requirement.mapped_to.iteritems():
                  <li>
                    % include element path=path, element=element, detail='list'
                  </li>
                % end
              </ul>
            % end
            % if not [x for x in requirement.mapped_to.itervalues() if x.kind == 'component']:
              <p class="error">Not mapped to any components yet.</p>
            % end
          </td>
        </tr>
        % if requirement.work_items:
          <tr>
            <th>Work Items</th>
            <td>
              <ul>
                % for path, item in requirement.work_items.iteritems():
                  <li>
                    % include workitem path=path, item=item, detail='list'
                  </li>
                % end
              </ul>
            </td>
          </tr>
        % end
      </table>
    </dd>
  % else:
    % include pathnotfound path=path, detail=detail
  % end
% end
