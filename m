Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id z10-20020a5d44ca000000b002c6e8af1037sm10606277wrr.104.2023.02.28.11.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1801D1FFB7;
	Tue, 28 Feb 2023 19:06:54 +0000 (GMT)
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
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 07/24] tests: don't run benchmarks for the tsan build
Date: Tue, 28 Feb 2023 19:06:36 +0000
Message-Id: <20230228190653.1602033-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lgRX4QyM29uf

All we are really doing here is checking that TSAN builds compile and are
therefor a tool available to developers. The benchmarks are not
representative of QEMU's actual threading behaviour and they burn
precious CI time. Indeed switching to check-unit reveals many
unaddressed issues which have been logged at:

  https://gitlab.com/qemu-project/qemu/-/issues/1496

So for now disable the make check and make this a build only
test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221094558.2864616-9-alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest.yml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index d903c42798..7b92767689 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -463,7 +463,6 @@ tsan-build:
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10
           --enable-trace-backends=ust --disable-slirp
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
-    MAKE_CHECK_ARGS: bench V=1
 
 # gcov is a GCC features
 gcov:
-- 
2.39.2
