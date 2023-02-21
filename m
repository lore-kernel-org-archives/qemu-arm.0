Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id hn29-20020a05600ca39d00b003db03725e86sm4137663wmb.8.2023.02.21.01.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:46:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A7CD41FFC4;
	Tue, 21 Feb 2023 09:46:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yonggang Luo <luoyonggang@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	qemu-block@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alexander Bulekov <alxndr@bu.edu>,
	Darren Kenny <darren.kenny@oracle.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	John Snow <jsnow@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 14/14] cirrus.yml: Improve the windows_msys2_task
Date: Tue, 21 Feb 2023 09:45:58 +0000
Message-Id: <20230221094558.2864616-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221094558.2864616-1-alex.bennee@linaro.org>
References: <20230221094558.2864616-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: YYEKHtt0YvMp

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
