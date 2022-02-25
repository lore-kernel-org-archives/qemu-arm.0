Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906521000b006d58773e992sm1230799ejm.188.2022.02.25.09.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:29 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AA4B51FFBF;
	Fri, 25 Feb 2022 17:20:22 +0000 (GMT)
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
	richard.henderson@linaro.org,
	sw@weilnetz.de,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 07/18] scripts/ci: add build env rules for aarch32 on aarch64
Date: Fri, 25 Feb 2022 17:20:10 +0000
Message-Id: <20220225172021.3493923-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: an4h9dRYO6tc

At least the current crop of Aarch64 HW can support running 32 bit EL0
code. Before we can build and test we need a minimal set of packages
installed. We can't use "apt build-dep" because it currently gets
confused trying to keep two sets of build-deps installed at once.
Instead we install a minimal set of libraries that will allow us to
continue.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-7-alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 599896cc5b..9182e0c253 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -19,6 +19,13 @@
           - '((ansible_version.major == 2) and (ansible_version.minor >= 8)) or (ansible_version.major >= 3)'
         msg: "Unsuitable ansible version, please use version 2.8.0 or later"
 
+    - name: Add armhf foreign architecture to aarch64 hosts
+      command: dpkg --add-architecture armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['architecture'] == 'aarch64'
+        - ansible_facts['distribution_version'] == '20.04'
+
     - name: Update apt cache / upgrade packages via apt
       apt:
         update_cache: yes
@@ -115,6 +122,24 @@
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['distribution_version'] == '20.04'
 
+    - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 20.04
+      package:
+        name:
+          - binutils-arm-linux-gnueabihf
+          - gcc-arm-linux-gnueabihf
+          - libblkid-dev:armhf
+          - libc6-dev:armhf
+          - libffi-dev:armhf
+          - libglib2.0-dev:armhf
+          - libmount-dev:armhf
+          - libpcre2-dev:armhf
+          - libpixman-1-dev:armhf
+          - zlib1g-dev:armhf
+      when:
+        - ansible_facts['distribution'] == 'Ubuntu'
+        - ansible_facts['distribution_version'] == '20.04'
+        - ansible_facts['architecture'] == 'aarch64'
+
     - name: Install basic packages to build QEMU on EL8
       dnf:
         # This list of packages start with tests/docker/dockerfiles/centos8.docker
-- 
2.30.2
