Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b4-20020a5d4b84000000b002c55b0e6ef1sm7193127wrt.4.2023.02.15.11.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 11:25:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D34D61FFC1;
	Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Darren Kenny <darren.kenny@oracle.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 11/12] cirrus.yml: Improve the windows_msys2_task
Date: Wed, 15 Feb 2023 19:25:29 +0000
Message-Id: <20230215192530.299263-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: AVzY8byuJOM7

From: Thomas Huth <thuth@redhat.com>

There's no need to run a full-blown bash just to create a directory.
And we can skip the "cd build" each time by doing it once at the
beginning.

Additionally, let's exclude some targets (that we already compile-test
with MinGW in the gitlab jobs) from the build, since the build time of
this task is very long already (between 80 and 90 minutes).

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230208103046.618154-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .cirrus.yml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 4895987da4..5fb00da73d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -100,9 +100,11 @@ windows_msys2_task:
       tar xf C:\tools\archive\msys64.tar
       Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
   script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
+    - mkdir build
+    - cd build
+    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
+        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"
+    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"
     - exit $LastExitCode
   test_script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
-- 
2.39.1
