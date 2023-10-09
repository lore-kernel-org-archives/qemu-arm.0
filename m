Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c280700b004047ac770d1sm13913102wmb.8.2023.10.09.09.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 09:41:11 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D4BE31FFBD;
	Mon,  9 Oct 2023 17:41:07 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Brad Smith <brad@comstyle.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	David Hildenbrand <david@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	John Snow <jsnow@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	qemu-arm@nongnu.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Beraldo Leal <bleal@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Song Gao <gaosong@loongson.cn>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 23/25] contrib/plugins: fix coverity warning in cache
Date: Mon,  9 Oct 2023 17:41:02 +0100
Message-Id: <20231009164104.369749-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009164104.369749-1-alex.bennee@linaro.org>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Pp+PwiSyh+k3

Coverity complains that appends_stats_line can be fed a 0 leading
to the undefined behaviour of a divide by 0.

Fixes: CID 1519044
Fixes: CID 1519047
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/cache.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 4fca3edd07..9e7ade3b37 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -535,15 +535,13 @@ static void caches_free(Cache **caches)
     }
 }
 
-static void append_stats_line(GString *line, uint64_t l1_daccess,
-                              uint64_t l1_dmisses, uint64_t l1_iaccess,
-                              uint64_t l1_imisses,  uint64_t l2_access,
-                              uint64_t l2_misses)
+static void append_stats_line(GString *line,
+                              uint64_t l1_daccess, uint64_t l1_dmisses,
+                              uint64_t l1_iaccess, uint64_t l1_imisses,
+                              uint64_t l2_access, uint64_t l2_misses)
 {
-    double l1_dmiss_rate, l1_imiss_rate, l2_miss_rate;
-
-    l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
-    l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
+    double l1_dmiss_rate = ((double) l1_dmisses) / (l1_daccess) * 100.0;
+    double l1_imiss_rate = ((double) l1_imisses) / (l1_iaccess) * 100.0;
 
     g_string_append_printf(line, "%-14" PRIu64 " %-12" PRIu64 " %9.4lf%%"
                            "  %-14" PRIu64 " %-12" PRIu64 " %9.4lf%%",
@@ -554,8 +552,8 @@ static void append_stats_line(GString *line, uint64_t l1_daccess,
                            l1_imisses,
                            l1_iaccess ? l1_imiss_rate : 0.0);
 
-    if (use_l2) {
-        l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
+    if (l2_access && l2_misses) {
+        double l2_miss_rate =  ((double) l2_misses) / (l2_access) * 100.0;
         g_string_append_printf(line,
                                "  %-12" PRIu64 " %-11" PRIu64 " %10.4lf%%",
                                l2_access,
-- 
2.39.2
