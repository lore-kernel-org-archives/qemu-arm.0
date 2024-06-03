Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212f05157esm113652885e9.20.2024.06.03.10.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 10:53:35 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 86CAA5FA06;
	Mon,  3 Jun 2024 18:53:29 +0100 (BST)
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
Subject: [PATCH v3 10/12] tests/lcitool: Install mingw-w64-tools for the Windows cross-builds
Date: Mon,  3 Jun 2024 18:53:26 +0100
Message-Id: <20240603175328.3823123-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603175328.3823123-1-alex.bennee@linaro.org>
References: <20240603175328.3823123-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 23Z9O5EJ7f6d

From: Thomas Huth <thuth@redhat.com>

Beside g++ we also need the mingw-w64-tools for properly building
the code in qga/vss-win32/ , so let's install that package now, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20240601070543.37786-5-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
 tests/lcitool/projects/qemu-win-installer.yml      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
index fef846d5a6..007e1574bd 100644
--- a/tests/docker/dockerfiles/fedora-win64-cross.docker
+++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
@@ -75,6 +75,7 @@ ENV NINJA "/usr/bin/ninja"
 ENV PYTHON "/usr/bin/python3"
 
 RUN nosync dnf install -y \
+               mingw-w64-tools \
                mingw32-nsis \
                mingw64-SDL2 \
                mingw64-SDL2_image \
diff --git a/tests/lcitool/projects/qemu-win-installer.yml b/tests/lcitool/projects/qemu-win-installer.yml
index 86aa22297c..f3663ba030 100644
--- a/tests/lcitool/projects/qemu-win-installer.yml
+++ b/tests/lcitool/projects/qemu-win-installer.yml
@@ -2,3 +2,4 @@
 ---
 packages:
  - g++
+ - mingw-w64-tools
-- 
2.39.2
