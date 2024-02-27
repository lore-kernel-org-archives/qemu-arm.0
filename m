Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id w10-20020adff9ca000000b0033d1b760125sm11684409wrr.92.2024.02.27.06.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 06:43:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3B4925F930;
	Tue, 27 Feb 2024 14:43:38 +0000 (GMT)
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
Subject: [PATCH v4 29/29] docs/devel: plugins can trigger a tb flush
Date: Tue, 27 Feb 2024 14:43:35 +0000
Message-Id: <20240227144335.1196131-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227144335.1196131-1-alex.bennee@linaro.org>
References: <20240227144335.1196131-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: m+H9v/Dx+ndK

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

When scoreboards need to be reallocated.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240213094009.150349-8-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/multi-thread-tcg.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 7302c3bf534..1420789fff3 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -109,6 +109,7 @@ including:
   - debugging operations (breakpoint insertion/removal)
   - some CPU helper functions
   - linux-user spawning its first thread
+  - operations related to TCG Plugins
 
 This is done with the async_safe_run_on_cpu() mechanism to ensure all
 vCPUs are quiescent when changes are being made to shared global
-- 
2.39.2
