Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id o1sm42693540wjm.11.2016.04.15.07.23.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 15 Apr 2016 07:23:58 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 287C63E05A3;
	Fri, 15 Apr 2016 15:24:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: mttcg@listserver.greensocs.com,
	fred.konrad@greensocs.com,
	a.rigo@virtualopensystems.com,
	serge.fdrv@gmail.com,
	cota@braap.org
Cc: qemu-devel@nongnu.org,
	mark.burton@greensocs.com,
	pbonzini@redhat.com,
	jan.kiszka@siemens.com,
	rth@twiddle.net,
	peter.maydell@linaro.org,
	claudio.fontana@huawei.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM)
Subject: [RFC v1 10/12] arm: use tlb_flush_page_all for tlbimva[a]
Date: Fri, 15 Apr 2016 15:23:49 +0100
Message-Id: <1460730231-1184-12-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1460730231-1184-1-git-send-email-alex.bennee@linaro.org>
References: <1460730231-1184-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: T+acC6GQiJud

From: KONRAD Frederic <fred.konrad@greensocs.com>

Instead of flushing each individual vCPU use the tlb_flush_page_all
functions which is async enabled for MTTCG.

Signed-off-by: KONRAD Frederic <fred.konrad@greensocs.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/exec/exec-all.h |  3 +++
 target-arm/helper.c     | 12 ++----------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 858055b..bc97683 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -208,6 +208,9 @@ static inline void tlb_flush_page_by_mmuidx(CPUState *cpu,
 static inline void tlb_flush_by_mmuidx(CPUState *cpu, ...)
 {
 }
+static inline void tlb_flush_page_all(target_ulong addr)
+{
+}
 #endif
 
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 19d5d52..bc9fbda 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -554,21 +554,13 @@ static void tlbiasid_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void tlbimva_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    CPUState *other_cs;
-
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
-    }
+    tlb_flush_page_all(value & TARGET_PAGE_MASK);
 }
 
 static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
-    CPUState *other_cs;
-
-    CPU_FOREACH(other_cs) {
-        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
-    }
+    tlb_flush_page_all(value & TARGET_PAGE_MASK);
 }
 
 static const ARMCPRegInfo cp_reginfo[] = {
-- 
2.7.4
