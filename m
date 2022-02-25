Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id bd3-20020a056402206300b00410a4ac2802sm1597170edb.66.2022.02.25.09.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:20:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 648D61FFC6;
	Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
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
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-s390x@nongnu.org (open list:S390 general arch...)
Subject: [PATCH  v2 14/18] travis.yml: Update the s390x jobs to Ubuntu Focal
Date: Fri, 25 Feb 2022 17:20:17 +0000
Message-Id: <20220225172021.3493923-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Nb2UCuUCjjfB

From: Thomas Huth <thuth@redhat.com>

QEMU will soon drop the support for Ubuntu 18.04, so let's update
the Travis jobs that were still using this version to 20.04 instead.

While we're at it, also remove an obsolete comment about Ubuntu
Xenial being the default for our Travis jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220221153423.1028465-1-thuth@redhat.com>
---
 .travis.yml | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 41010ebe6b..c3c8048842 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -1,6 +1,3 @@
-# The current Travis default is a VM based 16.04 Xenial on GCE
-# Additional builds with specific requirements for a full VM need to
-# be added as additional matrix: entries later on
 os: linux
 dist: focal
 language: c
@@ -190,7 +187,7 @@ jobs:
 
     - name: "[s390x] GCC check-tcg"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -233,7 +230,7 @@ jobs:
 
     - name: "[s390x] GCC (other-softmmu)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libaio-dev
@@ -263,10 +260,11 @@ jobs:
 
     - name: "[s390x] GCC (user)"
       arch: s390x
-      dist: bionic
+      dist: focal
       addons:
         apt_packages:
           - libgcrypt20-dev
+          - libglib2.0-dev
           - libgnutls28-dev
           - ninja-build
       env:
@@ -274,7 +272,7 @@ jobs:
 
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
-      dist: bionic
+      dist: focal
       compiler: clang
       addons:
         apt_packages:
-- 
2.30.2
