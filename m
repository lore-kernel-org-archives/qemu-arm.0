Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id gk6sm5210778ejb.159.2022.02.11.08.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 08:03:14 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6B2FF1FFBF;
	Fri, 11 Feb 2022 16:03:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net,
	berrange@redhat.com,
	f4bug@amsat.org,
	aurelien@aurel32.net,
	pbonzini@redhat.com,
	stefanha@redhat.com,
	crosa@redhat.com,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 07/11] scripts/ci: allow for a secondary runner
Date: Fri, 11 Feb 2022 16:03:05 +0000
Message-Id: <20220211160309.335014-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211160309.335014-1-alex.bennee@linaro.org>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: UfiIFq699LBU

Some HW can run multiple architecture profiles so we can install a
secondary runner to build and run tests for those profiles. This
allows setting up secondary service.

[AJB: this is a fairly ugly hack, I'm sure this could be expressed in
a neater way]

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/setup/gitlab-runner.yml | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
index 1127db516f..19bfd68f7e 100644
--- a/scripts/ci/setup/gitlab-runner.yml
+++ b/scripts/ci/setup/gitlab-runner.yml
@@ -69,3 +69,37 @@
         name: gitlab-runner
         state: started
         enabled: yes
+
+    - name: Download secondary gitlab-runner
+      get_url:
+        dest: /usr/local/bin/gitlab-runner-arm
+        url: "https://s3.amazonaws.com/gitlab-runner-downloads/v{{ gitlab_runner_version  }}/binaries/gitlab-runner-{{ gitlab_runner_os }}-arm"
+        owner: gitlab-runner
+        group: gitlab-runner
+        mode: u=rwx,g=rwx,o=rx
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Register secondary gitlab-runner
+      command: "/usr/local/bin/gitlab-runner-arm register --non-interactive --url {{ gitlab_runner_server_url }} --registration-token {{ gitlab_runner_registration_token }} --executor shell --tag-list aarch32,{{ ansible_facts[\"distribution\"]|lower }}_{{ ansible_facts[\"distribution_version\"] }} --description '{{ ansible_facts[\"distribution\"] }} {{ ansible_facts[\"distribution_version\"] }} {{ ansible_facts[\"architecture\"] }} ({{ ansible_facts[\"os_family\"] }})'"
+
+    - name: Install the secondary gitlab-runner service using its own functionality
+      command: /usr/local/bin/gitlab-runner-arm install --user gitlab-runner --working-directory /home/gitlab-runner/arm -n gitlab-runner-arm
+      register: gitlab_runner_install_service_result
+      failed_when: "gitlab_runner_install_service_result.rc != 0 and \"already exists\" not in gitlab_runner_install_service_result.stderr"
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
+    - name: Enable the secondary gitlab-runner service
+      service:
+        name: gitlab-runner-arm
+        state: started
+        enabled: yes
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
-- 
2.30.2
