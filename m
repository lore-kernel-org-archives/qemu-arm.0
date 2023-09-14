Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id f21-20020a7bcd15000000b003fe24441e23sm2320842wmj.24.2023.09.14.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 08:54:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C66921FFBE;
	Thu, 14 Sep 2023 16:54:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 3/9] tests/docker: Update docker-loongarch-cross toolchain
Date: Thu, 14 Sep 2023 16:54:16 +0100
Message-Id: <20230914155422.426639-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914155422.426639-1-alex.bennee@linaro.org>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Gzvs9uLvyM9y

From: Richard Henderson <richard.henderson@linaro.org>

Update from clfs 5.0 to clfs 8.1, which includes updates
to binutils 2.41, gcc 13.2, and glibc 2.38.

See https://github.com/loongson/build-tools

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230829220228.928506-2-richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/debian-loongarch-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-loongarch-cross.docker b/tests/docker/dockerfiles/debian-loongarch-cross.docker
index 9d957547b5..b4bf265717 100644
--- a/tests/docker/dockerfiles/debian-loongarch-cross.docker
+++ b/tests/docker/dockerfiles/debian-loongarch-cross.docker
@@ -20,7 +20,7 @@ RUN apt-get update && \
         git \
         python3-minimal
 
-RUN curl -#SL https://github.com/loongson/build-tools/releases/download/2022.05.29/loongarch64-clfs-5.0-cross-tools-gcc-glibc.tar.xz \
+RUN curl -#SL https://github.com/loongson/build-tools/releases/download/2023.08.08/CLFS-loongarch64-8.1-x86_64-cross-tools-gcc-glibc.tar.xz \
     | tar -xJC /opt
 
 ENV PATH $PATH:/opt/cross-tools/bin
-- 
2.39.2
