Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212f9b9ef1sm114083595e9.9.2024.06.03.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:53:31 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id F2F595F9F4;
	Mon,  3 Jun 2024 18:53:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>
Subject: [PATCH v3 05/12] scripts/ci: remove CentOS bits from common build-environment
Date: Mon,  3 Jun 2024 18:53:21 +0100
Message-Id: <20240603175328.3823123-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603175328.3823123-1-alex.bennee@linaro.org>
References: <20240603175328.3823123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: LSaGQvbkVGoN

Although I've just removed the CentOS specific build-environment its
probably a bit too confusing to have multiple distros mixed up in one
place. Prior to moving clean-up what will be just for ubuntu.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240529160934.982373-6-alex.bennee@linaro.org>
---
 scripts/ci/setup/build-environment.yml | 98 --------------------------
 1 file changed, 98 deletions(-)

diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index de0d866a1e..e82097b465 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -184,101 +184,3 @@
         - ansible_facts['distribution_version'] == '22.04'
         - ansible_facts['architecture'] == 'aarch64'
 
-    - name: Enable EPEL repo on EL8
-      dnf:
-        name:
-          - epel-release
-        state: present
-      when:
-        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
-        - ansible_facts['distribution_major_version'] == '8'
-
-    - name: Enable PowerTools repo on CentOS 8
-      ini_file:
-        path: /etc/yum.repos.d/CentOS-Stream-PowerTools.repo
-        section: powertools
-        option: enabled
-        value: "1"
-      when:
-        - ansible_facts['distribution_file_variety'] == 'CentOS'
-        - ansible_facts['distribution_major_version'] == '8'
-
-    - name: Install basic packages to build QEMU on EL8
-      dnf:
-        # This list of packages start with tests/docker/dockerfiles/centos8.docker
-        # but only include files that are common to all distro variants and present
-        # in the standard repos (no add-ons)
-        name:
-          - bzip2
-          - bzip2-devel
-          - capstone-devel
-          - dbus-daemon
-          - device-mapper-multipath-devel
-          - diffutils
-          - gcc
-          - gcc-c++
-          - genisoimage
-          - gettext
-          - git
-          - glib2-devel
-          - glusterfs-api-devel
-          - gnutls-devel
-          - libaio-devel
-          - libcap-ng-devel
-          - libcurl-devel
-          - libepoxy-devel
-          - libfdt-devel
-          - libgcrypt-devel
-          - libiscsi-devel
-          - libpmem-devel
-          - librados-devel
-          - librbd-devel
-          - libseccomp-devel
-          - libssh-devel
-          - libxkbcommon-devel
-          - lzo-devel
-          - make
-          - mesa-libEGL-devel
-          - nettle-devel
-          - ninja-build
-          - nmap-ncat
-          - numactl-devel
-          - pixman-devel
-          - python38
-          - python3-sphinx
-          - rdma-core-devel
-          - redhat-rpm-config
-          - snappy-devel
-          - spice-glib-devel
-          - systemd-devel
-          - systemtap-sdt-devel
-          - tar
-          - zlib-devel
-        state: present
-      when:
-        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
-        - ansible_facts['distribution_version'] == '8'
-
-    - name: Install packages only available on x86 and aarch64
-      dnf:
-        # Spice server not available in ppc64le
-        name:
-          - spice-server
-          - spice-server-devel
-        state: present
-      when:
-        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
-        - ansible_facts['distribution_version'] == '8'
-        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
-
-    - name: Check whether the Python runtime version is managed by alternatives
-      stat:
-        path: /etc/alternatives/python3
-      register: python3
-
-    - name: Set default Python runtime to 3.8 on EL8
-      command: alternatives --set python3 /usr/bin/python3.8
-      when:
-        - ansible_facts['distribution_file_variety'] in ['RedHat', 'CentOS']
-        - ansible_facts['distribution_version'] == '8'
-        - python3.stat.islnk and python3.stat.lnk_target != '/usr/bin/python3.8'
-- 
2.39.2
