Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o6sm13811824wra.27.2019.07.12.04.18.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 04:18:51 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 7D7A61FF91;
	Fri, 12 Jul 2019 12:18:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Fam Zheng <fam@euphon.net>
Subject: [PATCH  v1 4/7] tests/docker: Install Ubuntu images noninteractively
Date: Fri, 12 Jul 2019 12:18:46 +0100
Message-Id: <20190712111849.9006-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190712111849.9006-1-alex.bennee@linaro.org>
References: <20190712111849.9006-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2zG1dQieHfo7

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We correctly use the DEBIAN_FRONTEND environment variable on
the Debian images, but forgot the Ubuntu ones are based on it.

Since building docker images is not interactive, we need to
inform the APT tools about it using the DEBIAN_FRONTEND
environment variable (we already use it on our Debian images).

This fixes:

  $ make docker-image-ubuntu V=1
  [...]
  Setting up tzdata (2019b-0ubuntu0.19.04) ...
  debconf: unable to initialize frontend: Dialog
  debconf: (TERM is not set, so the dialog frontend is not usable.)
  debconf: falling back to frontend: Readline
  Configuring tzdata
  ------------------

  Please select the geographic area in which you live. Subsequent configuration
  questions will narrow this down by presenting a list of cities, representing
  the time zones in which they are located.

    1. Africa      4. Australia  7. Atlantic  10. Pacific  13. Etc
    2. America     5. Arctic     8. Europe    11. SystemV
    3. Antarctica  6. Asia       9. Indian    12. US
  Geographic area: 12
  [HANG]

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190711124805.26476-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu.docker     | 2 +-
 tests/docker/dockerfiles/ubuntu1804.docker | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu.docker b/tests/docker/dockerfiles/ubuntu.docker
index 2500ec84b6f..a4f601395c8 100644
--- a/tests/docker/dockerfiles/ubuntu.docker
+++ b/tests/docker/dockerfiles/ubuntu.docker
@@ -66,6 +66,6 @@ ENV PACKAGES flex bison \
     texinfo \
     xfslibs-dev
 RUN apt-get update && \
-    apt-get -y install $PACKAGES
+    DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
 ENV FEATURES clang pyyaml sdl2
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 0bb8088658d..44bbf0f77ae 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -53,6 +53,6 @@ ENV PACKAGES flex bison \
     texinfo \
     xfslibs-dev
 RUN apt-get update && \
-    apt-get -y install $PACKAGES
+    DEBIAN_FRONTEND=noninteractive apt-get -y install $PACKAGES
 RUN dpkg -l $PACKAGES | sort > /packages.txt
 ENV FEATURES clang pyyaml sdl2
-- 
2.20.1
