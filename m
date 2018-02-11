Received: by 10.28.71.27 with SMTP id u27csp3696825wma;
        Sun, 11 Feb 2018 13:05:17 -0800 (PST)
X-Google-Smtp-Source: AH8x224/5XP0qUEVW3qExuUR6NaBMVksSv0H8wRMmRqUYKJATrE/UOxrtWZ8FMJe6ty1RXAeyvuj
X-Received: by 10.13.214.141 with SMTP id y135mr2041840ywd.0.1518383117345;
        Sun, 11 Feb 2018 13:05:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518383117; cv=none;
        d=google.com; s=arc-20160816;
        b=L6zP4nPudM1T7Lr3lQgKVZm2XHO/jSLMogAs9eySHAK+Gyp0ZImJp63H9HTZ1XDrMY
         KTGl56cvaMqAkX6myra4HXtGWIMxLCo5eAa1HBZVguNvcGNN0Tx9ZkqrmHQhff8KVY9U
         l37a+GgT3IvXzX2QbBv0qSCIs8TSVh+jtP75Z0OJ7mqmH0eYUpuDWi6A7rUaWwzcOg/y
         NYmX+r+ve5SOjrcEBojhsuEwUCycDwJtWJZQ8nsVIXbuIJOoQMbEmvSOJBqLmGLmdI3V
         /fQNEDsMAmlNrZMKwie4LnYcpe44RWNPphLGnbONkiZ3SQuylivge3B5Zt+TIbRy+0WH
         ctMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=u9SJZsEYOcc3Fv1vUr4knqPF5dvb+F9pFsuL2qHHgwA=;
        b=GSs8BefUfNkqDWd8X+jqV85Hd6TOpOl5H4UMUS2fUre4XC2HfOVQ/faRQ0PGvW1F+P
         2MRGLQGwmY6ZqjOx+BBpeGzSGxfTyAONiaicgh9/bpUVo9z0laN6z+GiFk7YAVtRWEGu
         UlgpgsWwnxl7FaF/8wpJ9oRj/7Jy8fLyqtVW4xKFdhJvXo8XeRLfYUcKIlacfcE5ffeN
         GUF+VsYvp8Bd6WZajMh0NA+gscF5LVrEAVmwBEvJpUIswUda/97rPqZMVjeVbbTaBWd6
         zwOwJrm7P4l+HlbH6xojdWdtL+0vp9AO3J3ZFDh/G0TuNNGUd8CmLvIeYehn7iDlfkPN
         aGAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YyWZqkJF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o203si464914yba.484.2018.02.11.13.05.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 13:05:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YyWZqkJF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekyoG-00033R-OU
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 16:05:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyiC-0006mr-7q
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:59:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyiB-0004HS-0A
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:59:00 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:38070)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekyiA-0004G0-Mu
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:58:58 -0500
Received: by mail-pg0-x243.google.com with SMTP id l24so115214pgc.5
	for <qemu-devel@nongnu.org>; Sun, 11 Feb 2018 12:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u9SJZsEYOcc3Fv1vUr4knqPF5dvb+F9pFsuL2qHHgwA=;
	b=YyWZqkJFVAvIA0Y6tM2lbWiZ9uIPntv2jzsPXGpYZgzDEMmz9bh90WJORDgMmvpQGW
	IWraHn5tOfNtApZEO4JhTaDAgWxKDceNaXnse7UAf5zjdoeybgofgUFeI+1G6LE3AM6w
	kR17xWhCNz09q7Ak/PRm1ixp07buIyxOZzevc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=u9SJZsEYOcc3Fv1vUr4knqPF5dvb+F9pFsuL2qHHgwA=;
	b=rG6CtM4jwC6FlkYq5VkCXzadTnWfV9/PZPoD85fBOVnyQxNMqMiaL23o8xFLFzHo23
	P2vq0HZitVT8AXnW1zs9NQ3p+6xCrw9nGnpsfxLZkJNb+O2ncB/64B5SdQE5KLCaiFqs
	Jrw4Nae9FDG1r/FH6mYN3UjAKeSITTU42lv7E4kOJcVBR3aJhhdd8S3mfR2Acl9GLeSA
	ueHtYpCs8FlvmeDVnIJk0nlKeygkf06swmFKfqmTeSkTZKQiBGfamL6OVXl5ODgimmu5
	0UnVbj/vwA+dolNuGp0pc71DV91QIz49FBfUEgMjzQedCpPgJviEGjV4TLx3c7PmG5nu
	oRDA==
X-Gm-Message-State: APf1xPAaXWJWNvfm2qMeiqaaR8826pvB6stQ962Bzqs9nC0Ab4feLDQ6
	mcmNS8Z3TH5iG0gYYmy2LEuS9Z70ymY=
X-Received: by 10.99.113.75 with SMTP id b11mr7982380pgn.271.1518382737273;
	Sun, 11 Feb 2018 12:58:57 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	y129sm8850354pgb.27.2018.02.11.12.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Feb 2018 12:58:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 11 Feb 2018 12:58:45 -0800
Message-Id: <20180211205848.4568-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180211205848.4568-1-richard.henderson@linaro.org>
References: <20180211205848.4568-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-devel] [PATCH v2 4/7] target/arm: Enforce access to ZCR_EL at
 translation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sJC4Bni5WPVg

This also makes sure that we get the correct ordering of
SVE vs FP exceptions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  3 ++-
 target/arm/internals.h     |  6 ++++++
 target/arm/helper.c        | 22 ++++------------------
 target/arm/translate-a64.c | 16 ++++++++++++++++
 4 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e966a57f8a..51a3e16275 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1750,10 +1750,11 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
 #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
 #define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
 #define ARM_CP_FPU               0x1000
+#define ARM_CP_SVE               0x2000
 /* Used only as a terminator for ARMCPRegInfo lists */
 #define ARM_CP_SENTINEL          0xffff
 /* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x10ff
+#define ARM_CP_FLAG_MASK         0x30ff
 
 /* Valid values for ARMCPRegInfo state field, indicating which of
  * the AArch32 and AArch64 execution states this register is visible in.
diff --git a/target/arm/internals.h b/target/arm/internals.h
index 89f5d2fe12..47cc224a46 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -243,6 +243,7 @@ enum arm_exception_class {
     EC_AA64_HVC               = 0x16,
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
+    EC_SVEACCESSTRAP          = 0x19,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -381,6 +382,11 @@ static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
         | (cv << 24) | (cond << 20);
 }
 
+static inline uint32_t syn_sve_access_trap(void)
+{
+    return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index e0184c7162..550dc3d290 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4335,20 +4335,6 @@ static int sve_exception_el(CPUARMState *env)
     return 0;
 }
 
-static CPAccessResult zcr_access(CPUARMState *env, const ARMCPRegInfo *ri,
-                                 bool isread)
-{
-    switch (sve_exception_el(env)) {
-    case 3:
-        return CP_ACCESS_TRAP_EL3;
-    case 2:
-        return CP_ACCESS_TRAP_EL2;
-    case 1:
-        return CP_ACCESS_TRAP;
-    }
-    return CP_ACCESS_OK;
-}
-
 static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
@@ -4359,7 +4345,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static const ARMCPRegInfo zcr_el1_reginfo = {
     .name = "ZCR_EL1", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL1_RW, .accessfn = zcr_access,
+    .access = PL1_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[1]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
@@ -4367,7 +4353,7 @@ static const ARMCPRegInfo zcr_el1_reginfo = {
 static const ARMCPRegInfo zcr_el2_reginfo = {
     .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW, .accessfn = zcr_access,
+    .access = PL2_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[2]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
@@ -4375,14 +4361,14 @@ static const ARMCPRegInfo zcr_el2_reginfo = {
 static const ARMCPRegInfo zcr_no_el2_reginfo = {
     .name = "ZCR_EL2", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL2_RW,
+    .access = PL2_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .readfn = arm_cp_read_zero, .writefn = arm_cp_write_ignore
 };
 
 static const ARMCPRegInfo zcr_el3_reginfo = {
     .name = "ZCR_EL3", .state = ARM_CP_STATE_AA64,
     .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 0,
-    .access = PL3_RW, .accessfn = zcr_access,
+    .access = PL3_RW, .type = ARM_CP_SVE | ARM_CP_FPU,
     .fieldoffset = offsetof(CPUARMState, vfp.zcr_el[3]),
     .writefn = zcr_write, .raw_writefn = raw_write
 };
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 89f50558a7..e3881d4999 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1182,6 +1182,19 @@ static inline bool fp_access_check(DisasContext *s)
     return false;
 }
 
+/* Check that SVE access is enabled.  If it is, return true.
+ * If not, emit code to generate an appropriate exception and return false.
+ */
+static inline bool sve_access_check(DisasContext *s)
+{
+    if (s->sve_excp_el) {
+        gen_exception_insn(s, 4, EXCP_UDEF, syn_sve_access_trap(),
+                           s->sve_excp_el);
+        return false;
+    }
+    return true;
+}
+
 /*
  * This utility function is for doing register extension with an
  * optional shift. You will likely want to pass a temporary for the
@@ -1631,6 +1644,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     default:
         break;
     }
+    if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
+        return;
+    }
     if ((ri->type & ARM_CP_FPU) && !fp_access_check(s)) {
         return;
     }
-- 
2.14.3

