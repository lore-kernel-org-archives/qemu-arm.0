Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b003db0ad636d1sm19450082wms.28.2023.02.28.11.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:07:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 048121FFC5;
	Tue, 28 Feb 2023 19:06:55 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>,
	qemu-block@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Laurent Vivier <lvivier@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v3 15/24] gitlab: Use plain docker in container-template.yml
Date: Tue, 28 Feb 2023 19:06:44 +0000
Message-Id: <20230228190653.1602033-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Rb7fkqPBpL8L

From: Fabiano Rosas <farosas@suse.de>

Our dockerfiles no longer reference layers from other qemu images so
we can now use 'docker build' on them.

Also reinstate the caching that was disabled due to bad interactions
with certain runners. See commit 6ddc3dc7a8 ("tests/docker: don't use
BUILDKIT in GitLab either"). We now believe those issues to be fixed.

The COMMON_TAG needed to be fixed for the caching to work. The
docker.py script was not using the variable, but constructing the
correct URL directly.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Tested-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230227151110.31455-2-farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/container-template.yml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index c434b9c8f3..519b8a9482 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -6,17 +6,16 @@
     - docker:dind
   before_script:
     - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
     - apk add python3
     - docker info
     - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
   script:
     - echo "TAG:$TAG"
     - echo "COMMON_TAG:$COMMON_TAG"
-    - ./tests/docker/docker.py --engine docker build
-          -t "qemu/$NAME" -f "tests/docker/dockerfiles/$NAME.docker"
-          -r $CI_REGISTRY/qemu-project/qemu
-    - docker tag "qemu/$NAME" "$TAG"
+    - docker build --tag "$TAG" --cache-from "$TAG" --cache-from "$COMMON_TAG"
+      --build-arg BUILDKIT_INLINE_CACHE=1
+      -f "tests/docker/dockerfiles/$NAME.docker" "."
     - docker push "$TAG"
   after_script:
     - docker logout
-- 
2.39.2
