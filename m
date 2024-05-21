Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781cd7asm1630614266b.10.2024.05.21.05.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 05:53:15 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id EE37F5FA1A;
	Tue, 21 May 2024 13:53:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Beraldo Leal <bleal@redhat.com>,
	qemu-s390x@nongnu.org,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Thomas Huth <thuth@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 2/4] docs/devel: update references to centos to later version
Date: Tue, 21 May 2024 13:53:12 +0100
Message-Id: <20240521125314.1255403-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240521125314.1255403-1-alex.bennee@linaro.org>
References: <20240521125314.1255403-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yoJhbggt0hgh

From the website:

"After May 31, 2024, CentOS Stream 8 will be archived and no further
updates will be provided."

We have updated a few bits but there are still references that need
fixing.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/testing.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fa28e3ecb2..c312465fa7 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -387,9 +387,9 @@ make target):
 
 .. code::
 
-  make docker-test-build@centos8
+  make docker-test-build@centos9
 
-This will create a container instance using the ``centos8`` image (the image
+This will create a container instance using the ``centos9`` image (the image
 is downloaded and initialized automatically), in which the ``test-build`` job
 is executed.
 
@@ -410,8 +410,8 @@ locally by using the ``NOCACHE`` build option:
 Images
 ~~~~~~
 
-Along with many other images, the ``centos8`` image is defined in a Dockerfile
-in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
+Along with many other images, the ``centos9`` image is defined in a Dockerfile
+in ``tests/docker/dockerfiles/``, called ``centos9.docker``. ``make docker-help``
 command will list all the available images.
 
 A ``.pre`` script can be added beside the ``.docker`` file, which will be
-- 
2.39.2
