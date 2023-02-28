
node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Update GIT') {
        script {
            catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                    sh "git config user.email aleks.alexandrov@amusnet.com"
                    sh "git config user.name aleks.alexandrov"
                    sh "cat webapp/values.yaml"
                    sh "sed -i 's+aleks.alexandrov/webapp.*+aleks.alexandrov/webapp:${DOCKERTAG}+g' webapp/values.yaml"
                    sh "cat webapp/values.yaml"
                    sh "git add ."
                    sh "git commit -m 'Done by Jenkins Job change heml: ${env.BUILD_NUMBER}'"
                    sh 'git rev-parse HEAD >> version.txt'
                    sh 'echo ${BUILD_TIMESTAMP} >> version.txt'
                    sh "git add version.txt"
                    sh "git commit -m 'Update version.txt'"
                    sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/argocd-helm.git  HEAD:main"
                }
            }
        }
    }
}
