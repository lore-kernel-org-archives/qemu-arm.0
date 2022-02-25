Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id u1-20020aa7d0c1000000b004132c0a9ee3sm1596730edo.84.2022.02.25.09.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3CACA1FFBB;
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
Subject: [PATCH  v2 03/18] tests/lcitool: update to latest version
Date: Fri, 25 Feb 2022 17:20:06 +0000
Message-Id: <20220225172021.3493923-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kG/ad1VR+FSW

We will need an update shortly for some new images.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220211160309.335014-4-alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/opensuse-leap.docker | 3 +--
 tests/docker/dockerfiles/ubuntu1804.docker    | 3 +--
 tests/docker/dockerfiles/ubuntu2004.docker    | 3 +--
 tests/lcitool/libvirt-ci                      | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/tests/docker/dockerfiles/opensuse-leap.docker b/tests/docker/dockerfiles/opensuse-leap.docker
index 1b78d8369a..e1ad9434a3 100644
--- a/tests/docker/dockerfiles/opensuse-leap.docker
+++ b/tests/docker/dockerfiles/opensuse-leap.docker
@@ -127,8 +127,7 @@ RUN zypper update -y && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 699f2dfc6a..0a622b467c 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -134,8 +134,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 87513125b8..b9d06cb040 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -136,8 +136,7 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
     ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
 
-RUN pip3 install \
-         meson==0.56.0
+RUN pip3 install meson==0.56.0
 
 ENV LANG "en_US.UTF-8"
 ENV MAKE "/usr/bin/make"
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index 6dd9b6fab1..f83b916d5e 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit 6dd9b6fab1fe081b16bc975485d7a02c81ba5fbe
+Subproject commit f83b916d5efa4bd33fbf4b7ea41bf6d535cc63fb
-- 
2.30.2
