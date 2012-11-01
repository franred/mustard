% if detail == 'list':
  <a class="workitem" href="/work-items#{{path}}">{{item.title}} <span>{{path}}</span></a>
% elif detail == 'full':
  <dt><h2 id="{{path}}">{{item.title}} <span>{{path}}</span></h2></dt>
  <dd>
    <table cellspacing="0" cellpadding="0">
      % if item.description:
        <tr>
          <th>Description</th>
          <td>{{!item.description}}</td>
        </tr>
      % end
      % if item.tags:
        <tr>
          <th>Tags</th>
          <td>
            <ul>
              % for path, tag in item.tags.iteritems():
                <li>
                  % include tag path=path, tag=tag, detail='list'
                </li>
              % end
            </ul>
          </td>
        </tr>
      % end
      % include links element=item
    </table>
  </dd>
% end