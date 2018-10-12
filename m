Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp906824wrt;
        Fri, 12 Oct 2018 07:52:26 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60GF1YoZsJEL05FOfR3kQXN479/n/lZ4c+KAhg0Pl/EqaiMqSDdHQu25QKh/4H925lptKSD
X-Received: by 2002:ac8:1bf2:: with SMTP id m47-v6mr6146601qtk.234.1539355946512;
        Fri, 12 Oct 2018 07:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539355946; cv=none;
        d=google.com; s=arc-20160816;
        b=VEEmFsn5atRAJ9ViC7whbSXux6330UZil00z2oieAxDaFKcBHhnUkZidZ3sqVWW/pI
         ru7cUW/E7ZD1msbIb845oa92QiM5cvUIkZTGMcGGyScMhuk9Omx408vYHyBuaNAMCFCF
         JVOWrHyi4Do6imQprucWx/uaRiH0EUVF90FrqUx5fZF0bqIxqtsgebL6VD0GgS6Y1kK7
         IoDvmA46lPbulln/jVf6xZGMjYp745lwbulRfnrAY0369XEnuZT0JHcrJUEpXYp6V9GX
         ul1zcr9nA0q/8z26L9h5lBbvmWelAN+jTGWojeHrZhpE4pBzd+cnPwEY6o3/AP9QBZx4
         GnoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iou+UBXP+eQFdyool2gb/5TStsa+qgoBYA3ItGGn5wY=;
        b=K7OhTyZbG3a9fUmO13zqT2enZ4vEkNkTa7LFYAfjUmrI5+S9zMVQr0JQnfxFtHWDdO
         +SzxyBo+H+wPj7/MJlTFafFRI6hwTGbHncpz1I6MYtJigc7Pl7OkX3pqz/VSEz82BjOU
         MYNO0H/etayMtcxYmDk9uL4jjJk4HYmeb6IYnjUsN6HDmhfdYZp4qw6gOlM09Lk5HosB
         G8apea9yfUcpcEEi4RCfPR3ALxEvIHXtJ2cC2LZwhlLzDc9cUiOq+uL87dpm5oYpWC5z
         RvJoLTVTGmcMrm+gx+T4jY1l2zZrUsRlFnrUnQ0E9C6P/Zji2O0K/MWGoyccDNgECq4C
         5kNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l78-v6si1303354qke.136.2018.10.12.07.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Oct 2018 07:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAyni-00073T-12
	for alex.bennee@linaro.org; Fri, 12 Oct 2018 10:52:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeT-000864-Ku
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gAyeS-00034P-IU
	for qemu-arm@nongnu.org; Fri, 12 Oct 2018 10:42:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gAyeS-00031c-8C; Fri, 12 Oct 2018 10:42:52 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gAyeQ-0000QD-BJ; Fri, 12 Oct 2018 15:42:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri, 12 Oct 2018 15:42:35 +0100
Message-Id: <20181012144235.19646-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181012144235.19646-1-peter.maydell@linaro.org>
References: <20181012144235.19646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 10/10] target/arm: Report correct syndrome for
 FP/SIMD traps to Hyp mode
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Omsp+34OAFiq

For traps of FP/SIMD instructions to AArch32 Hyp mode, the syndrome
provided in HSR has more information than is reported to AArch64.
Specifically, there are extra fields TA and coproc which indicate
whether the trapped instruction was FP or SIMD. Add this extra
information to the syndromes we construct, and mask it out when
taking the exception to AArch64.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/internals.h | 14 +++++++++++++-
 target/arm/helper.c    |  9 +++++++++
 target/arm/translate.c |  8 ++++----
 3 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index cd8bc1ec3d4..960dfb3c06a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -288,6 +288,9 @@ static inline uint32_t syn_get_ec(uint32_t syn)
  * few cases the value in HSR for exceptions taken to AArch32 Hyp
  * mode differs slightly, and we fix this up when populating HSR in
  * arm_cpu_do_interrupt_aarch32_hyp().
+ * The exception is FP/SIMD access traps -- these report extra information
+ * when taking an exception to AArch32. For those we include the extra coproc
+ * and TA fields, and mask them out when taking the exception to AArch64.
  */
 static inline uint32_t syn_uncategorized(void)
 {
@@ -387,9 +390,18 @@ static inline uint32_t syn_cp15_rrt_trap(int cv, int cond, int opc1, int crm,
 
 static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
 {
+    /* AArch32 FP trap or any AArch64 FP/SIMD trap: TA == 0 coproc == 0xa */
     return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
         | (is_16bit ? 0 : ARM_EL_IL)
-        | (cv << 24) | (cond << 20);
+        | (cv << 24) | (cond << 20) | 0xa;
+}
+
+static inline uint32_t syn_simd_access_trap(int cv, int cond, bool is_16bit)
+{
+    /* AArch32 SIMD trap: TA == 1 coproc == 0 */
+    return (EC_ADVSIMDFPACCESSTRAP << ARM_EL_EC_SHIFT)
+        | (is_16bit ? 0 : ARM_EL_IL)
+        | (cv << 24) | (cond << 20) | (1 << 5);
 }
 
 static inline uint32_t syn_sve_access_trap(void)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0b659171b07..43afdd082e1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8540,6 +8540,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
     case EXCP_HVC:
     case EXCP_HYP_TRAP:
     case EXCP_SMC:
+        if (syn_get_ec(env->exception.syndrome) == EC_ADVSIMDFPACCESSTRAP) {
+            /*
+             * QEMU internal FP/SIMD syndromes from AArch32 include the
+             * TA and coproc fields which are only exposed if the exception
+             * is taken to AArch32 Hyp mode. Mask them out to get a valid
+             * AArch64 format syndrome.
+             */
+            env->exception.syndrome &= ~MAKE_64BIT_MASK(0, 20);
+        }
         env->cp15.esr_el[new_el] = env->exception.syndrome;
         break;
     case EXCP_IRQ:
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 7c7d920e331..d71597796f5 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4948,7 +4948,7 @@ static int disas_neon_ls_insn(DisasContext *s, uint32_t insn)
      */
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+                           syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
 
@@ -5727,7 +5727,7 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
      */
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+                           syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
 
@@ -7840,7 +7840,7 @@ static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
 
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+                           syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
     if (!s->vfp_enabled) {
@@ -7926,7 +7926,7 @@ static int disas_neon_insn_2reg_scalar_ext(DisasContext *s, uint32_t insn)
 
     if (s->fp_excp_el) {
         gen_exception_insn(s, 4, EXCP_UDEF,
-                           syn_fp_access_trap(1, 0xe, false), s->fp_excp_el);
+                           syn_simd_access_trap(1, 0xe, false), s->fp_excp_el);
         return 0;
     }
     if (!s->vfp_enabled) {
-- 
2.19.0

