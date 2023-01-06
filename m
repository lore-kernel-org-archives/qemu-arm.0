Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b003cf5ec79bf9sm1891574wmo.40.2023.01.06.05.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 05:24:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5EA1E1FFB7;
	Fri,  6 Jan 2023 13:24:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] scripts/ci: update gitlab-runner playbook to use latest runner
Date: Fri,  6 Jan 2023 13:24:00 +0000
Message-Id: <20230106132401.2544543-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 6rz5OVN19T+M

We were using quite and old runner on our machines and running into
issues with stalling jobs. Gitlab in the meantime now reliably provide
the latest packaged versions of the runner under a stable URL. This
update:

  - creates a per-arch subdir for builds
  - switches from binary tarballs to deb packages
  - re-uses the same binary for the secondary runner
  - updates distro check for second to 22.04

So far I've tested on aarch64.ci.qemu.org but I shall do s390x next as
its having issues with stale runners as well.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 42 ++++++++++++++++--------------
 scripts/ci/setup/vars.yml.template |  2 --
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 33128be85d..05cdb2ae4b 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -30,6 +30,11 @@
         home: /home/gitlab-runner
         shell: /bin/bash
 
+    - name: Create working directories for build
+      file:
+        path: "/home/gitlab-runner/{{ ansible_facts[\"architecture\"] }}"
+        state: directory
+
     - name: Remove the .bash_logout file when on Ubuntu systems
       file:
         path: /home/gitlab-runner/.bash_logout
@@ -50,17 +55,17 @@
 
     - name: Download the matching gitlab-runner
       get_url:
-        dest: /usr/local/bin/gitlab-runner
-        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-{{ gitlab_runner_arch }}"
-        owner: gitlab-runner
-        group: gitlab-runner
-        mode: u=rwx,g=rwx,o=rx
+        dest: "/root/"
+        url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_{{ gitlab_runner_arch }}.deb"
+
+    - name: Install gitlab-runner via package manager
+      apt: deb="/root/gitlab-runner_{{ gitlab_runner_arch }}.deb"
 
     - name: Register the gitlab-runner
-      command: "/usr/local/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
 
     - name: Install the gitlab-runner service using its own functionality
-      command: /usr/local/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner
+      command: "/usr/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner/{{ ansible_facts[\"architecture\"] }}"
       register: gitlab_runner_install_service_result
       failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
 
@@ -70,33 +75,30 @@
         state: started
         enabled: yes
 
-    - name: Download secondary gitlab-runner
-      get_url:
-        dest: /usr/local/bin/gitlab-runner-arm
-        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-arm"
-        owner: gitlab-runner
-        group: gitlab-runner
-        mode: u=rwx,g=rwx,o=rx
+    - name: Create working directories secondary runner
+      file:
+        path: "/home/gitlab-runner/arm"
+        state: directory
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
 
     - name: Register secondary gitlab-runner
-      command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+      command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
 
     - name: Install the secondary gitlab-runner service using its own functionality
-      command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
+      command: /usr/bin/gitlab-runner install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
       register: gitlab_runner_install_service_result
       failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
 
     - name: Enable the secondary gitlab-runner service
       service:
@@ -106,4 +108,4 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] == 'aarch64'
-        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['distribution_version'] == '22.04'
diff --git a/scripts/ci/setup/vars.yml.template b/scripts/ci/setup/vars.yml.template
index e48089761f..4b355fb80f 100644
--- a/scripts/ci/setup/vars.yml.template
+++ b/scripts/ci/setup/vars.yml.template
@@ -1,5 +1,3 @@
-# The version of the gitlab-runner to use
-gitlab_runner_version: 13.12.0
 # The URL of the gitlab server to use, usually https://gitlab.com unless you're
 # using a private GitLab instance
 gitlab_runner_server_url: https://gitlab.com
-- 
2.34.1
