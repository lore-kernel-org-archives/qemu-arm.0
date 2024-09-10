Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d64880sm480900266b.219.2024.09.10.07.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 07:07:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 0BCDA5F9CC;
	Tue, 10 Sep 2024 15:07:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Zhao Liu <zhao1.liu@intel.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 04/26] scripts/ci: update the gitlab-runner playbook
Date: Tue, 10 Sep 2024 15:07:11 +0100
Message-Id: <20240910140733.4007719-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240910140733.4007719-1-alex.bennee@linaro.org>
References: <20240910140733.4007719-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: R7f4ytMWS5F4

The upstream install instructions:

  https://docs.gitlab.com/runner/install/linux-repository.html

Now refer to repositories and a setup script. Modernise the playbook
to use the preferred delivery method.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 39 +++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 7bdafab511..57e7faebf1 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -49,30 +49,51 @@
     - debug:
         msg: gitlab-runner arch is {{ gitlab_runner_arch }}
 
-    - name: Download the matching gitlab-runner (DEB)
+    # Debian/Ubuntu setup
+    - name: Get gitlab-runner repo setup script (DEB)
       get_url:
         dest: "/root/"
-        url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_{{ gitlab_runner_arch }}.deb"
+        url: "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh"
+        mode: 0755
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
 
-    - name: Download the matching gitlab-runner (RPM)
+    - name: Run gitlab-runner repo setup script (DEB)
+      shell: "/root/script.deb.sh"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    - name: Install gitlab-runner (DEB)
+      ansible.builtin.apt:
+          name: gitlab-runner
+          update_cache: yes
+          state: present
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+
+    # RPM setup
+    - name: Get gitlab-runner repo setup script (RPM)
       get_url:
         dest: "/root/"
-        url: "https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_{{ gitlab_runner_arch }}.rpm"
+        url: "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh"
+        mode: 0755
       when:
         - ansible_facts['distribution'] == 'CentOS'
 
-    - name: Install gitlab-runner via package manager (DEB)
-      apt: deb="/root/gitlab-runner_{{ gitlab_runner_arch }}.deb"
+    - name: Run gitlab-runner repo setup script (RPM)
+      shell: "/root/script.rpm.sh"
       when:
-        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution'] == 'CentOS'
 
-    - name: Install gitlab-runner via package manager (RPM)
-      yum: name="/root/gitlab-runner_{{ gitlab_runner_arch }}.rpm"
+    - name: Install gitlab-runner (RPM)
+      yum:
+        name: gitlab-runner
+        update_cache: yes
+        state: present
       when:
         - ansible_facts['distribution'] == 'CentOS'
 
+    # Register Runners
     - name: Register the gitlab-runner
       command: "/usr/bin/gitlab-runner register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list {{ ansible_facts[\"architecture\"] }},{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
 
-- 
2.39.2
