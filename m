Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4213ab7ca26sm59434535e9.25.2024.06.03.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:53:29 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AAD925F8F7;
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
Subject: [PATCH v3 02/12] docs/devel: update references to centos to non-versioned container
Date: Mon,  3 Jun 2024 18:53:18 +0100
Message-Id: <20240603175328.3823123-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603175328.3823123-1-alex.bennee@linaro.org>
References: <20240603175328.3823123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AVsLovy5DIMO

>>From the website:

"After May 31, 2024, CentOS Stream 8 will be archived and no further
updates will be provided."

We have updated a few bits but there are still references that need
fixing. Rather than bump I've replaced them with references to the
Debian image so we don't have to bump at the next update.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240521125314.1255403-3-alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240529160934.982373-3-alex.bennee@linaro.org>
---
 docs/devel/testing.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fa28e3ecb2..23d3f44f52 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -387,9 +387,9 @@ make target):
 
 .. code::
 
-  make docker-test-build@centos8
+  make docker-test-build@debian
 
-This will create a container instance using the ``centos8`` image (the image
+This will create a container instance using the ``debian`` image (the image
 is downloaded and initialized automatically), in which the ``test-build`` job
 is executed.
 
@@ -410,8 +410,8 @@ locally by using the ``NOCACHE`` build option:
 Images
 ~~~~~~
 
-Along with many other images, the ``centos8`` image is defined in a Dockerfile
-in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
+Along with many other images, the ``debian`` image is defined in a Dockerfile
+in ``tests/docker/dockerfiles/``, called ``debian.docker``. ``make docker-help``
 command will list all the available images.
 
 A ``.pre`` script can be added beside the ``.docker`` file, which will be
-- 
2.39.2
