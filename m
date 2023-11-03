Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b00405c7591b09sm3572232wmq.35.2023.11.03.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:06:05 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BEB5965758;
	Fri,  3 Nov 2023 19:59:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Brian Cain <bcain@quicinc.com>,
	qemu-ppc@nongnu.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Cleber Rosa <crosa@redhat.com>,
	qemu-s390x@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Nicholas Piggin <npiggin@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Bin Meng <bin.meng@windriver.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Greg Manning <gmanning@rapitasystems.com>
Subject: [PATCH 28/29] plugins: disable lockstep plugin on windows
Date: Fri,  3 Nov 2023 19:59:55 +0000
Message-Id: <20231103195956.1998255-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231103195956.1998255-1-alex.bennee@linaro.org>
References: <20231103195956.1998255-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OpPTDr03dXB/

From: Greg Manning <gmanning@rapitasystems.com>

The lockstep plugin uses unix sockets and would require a different
communication mechanism to work on Windows.

Signed-off-by: Greg Manning <gmanning@rapitasystems.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20231102172053.17692-4-gmanning@rapitasystems.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 751fa38619..1783750cf6 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -17,7 +17,13 @@ NAMES += execlog
 NAMES += hotblocks
 NAMES += hotpages
 NAMES += howvec
+
+# The lockstep example communicates using unix sockets,
+# and can't be easily made to work on windows.
+ifneq ($(CONFIG_WIN32),y)
 NAMES += lockstep
+endif
+
 NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
-- 
2.39.2
