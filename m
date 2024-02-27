Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a2-20020a5d5702000000b0033ce5b3390esm11537174wrv.38.2024.02.27.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 06:43:36 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 9CA7F5F8F7;
	Tue, 27 Feb 2024 14:43:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-arm@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Michael Rolnik <mrolnik@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	qemu-s390x@nongnu.org,
	Kyle Evans <kevans@freebsd.org>,
	Brad Smith <brad@comstyle.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Bin Meng <bin.meng@windriver.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PATCH v4 02/29] tests/tcg: bump TCG test timeout to 120s
Date: Tue, 27 Feb 2024 14:43:08 +0000
Message-Id: <20240227144335.1196131-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227144335.1196131-1-alex.bennee@linaro.org>
References: <20240227144335.1196131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: cXRUwsZRUDK6

This is less than ideal but easier than making sure we get all the
iterations of the memory test. Update the comment accordingly.

Message-Id: <20240223162202.1936541-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/Makefile.target | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 8cf65f68dd8..a4c25908fb7 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -93,12 +93,9 @@ QEMU_OPTS=
 
 
 # If TCG debugging, or TCI is enabled things are a lot slower
-# ??? Makefile no longer has any indication that TCI is enabled,
-# but for the record:
-#   15s    original default
-#   60s    with --enable-debug
-#   90s    with --enable-tcg-interpreter
-TIMEOUT=90
+# so we have to set our timeout for that. The current worst case
+# offender is the system memory test running under TCI.
+TIMEOUT=120
 
 ifeq ($(filter %-softmmu, $(TARGET)),)
 # The order we include is important. We include multiarch first and
-- 
2.39.2
