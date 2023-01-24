Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c511800b003d9de0c39fasm19331828wms.36.2023.01.24.10.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 10:06:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id DA12B1FFC8;
	Tue, 24 Jan 2023 18:01:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Ed Maste <emaste@freebsd.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	Jagannathan Raman <jag.raman@oracle.com>,
	John G Johnson <john.g.johnson@oracle.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bandan Das <bsd@redhat.com>,
	Elena Ufimtseva <elena.ufimtseva@oracle.com>,
	Michael Roth <michael.roth@amd.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	qemu-arm@nongnu.org,
	Yanan Wang <wangyanan55@huawei.com>,
	Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 18/35] MAINTAINERS: Fix the entry for tests/tcg/nios2
Date: Tue, 24 Jan 2023 18:01:10 +0000
Message-Id: <20230124180127.1881110-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124180127.1881110-1-alex.bennee@linaro.org>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: KkPIwioRAX69

From: Thomas Huth <thuth@redhat.com>

tests/tcg/nios2/Makefile.target has accidentally been added
to the Microblaze section. Move it into the correct nios2
section instead - and while we're at it, it should also cover
the whole folder, and not only the Makefile.

Fixes: 67f80eb4d0 ("tests/tcg: enable debian-nios2-cross for test building")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230119130326.2030297-1-thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c581c11a64..629ab5bbb1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,7 +240,6 @@ F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
 F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
-F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
@@ -262,6 +261,7 @@ F: hw/nios2/
 F: disas/nios2.c
 F: configs/devices/nios2-softmmu/default.mak
 F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
+F: tests/tcg/nios2/
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
-- 
2.34.1
