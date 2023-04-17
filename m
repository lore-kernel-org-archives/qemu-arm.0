Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c228800b003edef091b17sm11997056wmf.37.2023.04.17.06.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:43:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 421431FFBC;
	Mon, 17 Apr 2023 14:43:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Markus Armbruster <armbru@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org
Subject: [PATCH v4 4/6] gitlab-ci: Avoid to re-run "configure" in the device-crash-test jobs
Date: Mon, 17 Apr 2023 14:43:19 +0100
Message-Id: <20230417134321.3627231-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AcP3TgdgBp9w

From: Thomas Huth <thuth@redhat.com>

After "make check-venv" had been added to these jobs, they started
to re-run "configure" each time since our logic in the makefile
thinks that some files are out of date here. Avoid it with the same
trick that we are using in buildtest-template.yml already by disabling
the up-to-date check via NINJA=":".

Fixes: 1d8cf47e5b ("tests: run 'device-crash-test' from tests/venv")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230414145845.456145-2-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ba6f551752..333eea9dd3 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -102,7 +102,7 @@ crash-test-debian:
     IMAGE: debian-amd64
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
@@ -145,7 +145,7 @@ crash-test-fedora:
     IMAGE: fedora
   script:
     - cd build
-    - make check-venv
+    - make NINJA=":" check-venv
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-ppc
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
-- 
2.39.2
