node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Update GIT') {
            script {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                     withCredentials([usernamePassword(credentialsId: 'github', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        sh "cat my-k8sapp-chart/values.yaml"
                        sh "sed -i 's+aleksandrov22/k8s-app.*+aleksandrov22/k8s-app:${DOCKERTAG}+g' my-k8sapp-chart/values.yaml"
                        sh "cat my-k8sapp-chart/values.yaml"
                        sh "git add ."
                        sh "git commit -m 'Done by Jenkins Job change helm: ${env.BUILD_NUMBER}'"
                        sh "git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/${GIT_USERNAME}/argocd-helm.git HEAD:main"
      }
    }
  }
 }
}
