qa_deploy_user:
   user.present:
       - name: {{ salt['pillar.get']('users:qa_user', 'qa-deploy-user') }}
       - password: {{ pillar['users']['qa_user_password'] }}
