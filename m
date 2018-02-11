Received: by 10.28.71.27 with SMTP id u27csp3697576wma;
        Sun, 11 Feb 2018 13:06:12 -0800 (PST)
X-Google-Smtp-Source: AH8x224vak9MWvE8+N6+JHUk0KyoLCTlY1q8XMAH1PQjKuTQ22zWcXGrzmJnsdsZY21otxxJutgg
X-Received: by 10.13.231.1 with SMTP id q1mr6308274ywe.359.1518383172577;
        Sun, 11 Feb 2018 13:06:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518383172; cv=none;
        d=google.com; s=arc-20160816;
        b=xiYN6OK4gQ3mpf08BUj2XfPMVyQ4harZ5YOXzFmFsouHbshSIAseOE1fAP4F3G0eKo
         hfXEe7y+l+y69SlXTfM7c2aWWuF1XptWGr50HhTRR5dyXEtEpBiD9GbC5QkuWnAbn9xP
         rpoQxx7QkZPNP1//mnwggfSlieNFTJmXgI4StcINDgVm1lEkewhLFBwERXPggcaiwfRo
         /NMQ6WFvCfZlG7xyGU6curtBqeUkJmvw65uSyWX2IMf5T5Z76QbIQRO8HdEehbDGO3Xc
         C0FyfKGIWnkQ+f0hVXTOly96USaBGaBcMUrHAxslwcG4i92Zj54vEDfv0mwl5b37VKMa
         wV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=XNE6HRogROpjH970mSZvci6V/G9pwgU/mAd5NppeIP0=;
        b=xQljvmWT9l00UTHW5mQQei0WIjzREz4NpDiRWu9KcPSEzDkeflytf1fkOlTRuylteE
         MtvbTBhhYEI9Y0opqJqTMEw8UE+itMrEu2DHo24AeMWL+HNS8xmOnBerSqtiT0IIsGee
         wra5NOSKhuu9Ksx0xYTtdvDwdNCCiW2OBxMCrbrABNeC8zYH/vmusPni/maNFCJrhClr
         yZIUEtC+1k13scXaf/8sI3srRNk8zjlP/o/bV8OeAM3+6NLnJZz9Q6n6x1MepWWrKT08
         7o5pnYExxs7Vw5T2utduCbwSmN86WPXQC2X3WuXF2r0qZn7ZN2PQsOhyHhGJ7dtfgT+Q
         xolA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ay9geIMU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u189si1287231ywd.753.2018.02.11.13.06.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 13:06:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ay9geIMU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekypA-00041C-1Q
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 16:06:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyiG-0006v2-IB
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:59:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyiF-0004Qj-Bu
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:59:04 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:37033)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekyiF-0004Op-4d
	for qemu-devel@nongnu.org; Sun, 11 Feb 2018 15:59:03 -0500
Received: by mail-pl0-x243.google.com with SMTP id ay8so4067412plb.4
	for <qemu-devel@nongnu.org>; Sun, 11 Feb 2018 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XNE6HRogROpjH970mSZvci6V/G9pwgU/mAd5NppeIP0=;
	b=Ay9geIMU7SCGT2QjCa77oVuAxxIqykoEwuHiZ1b8TQsyySc7FR/3P6IQ9BKnnIsAkA
	H8DZT3nSvg8G2+0QH1MfLl0PvSt7cVzYyDZGTA/z+xvCaLNEj5C/4WhMV/MiftwUZV9t
	tt/nsK+bey9EJg7+ILTE/kn4zFbQVXw8iXqho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XNE6HRogROpjH970mSZvci6V/G9pwgU/mAd5NppeIP0=;
	b=cs5lNd84yVYXtn+BxkI7J9tGpJgk1v9NG8EMgz8eaB/m+Z6NxZPsi/eAZB5gwh9xRx
	Tzke039aofGXm0EVKl/GubgbtBXDtOLuo4Kzhs/1TIReDGxmQpzXMSYDmAGt4Qd8POzF
	4tTnew8UKtSx0Fwk17g0ppRuvD85dE/8qhKtOlh9i3B0CIaWOecavOsoL9XXp9XXGVH2
	csnN7l63sMnkpkssrz3cg+o+9cfrOP92c14PuCU15TuvrFLJUjB3Z6RSybwdTufz7Tw5
	VbKp1XTlRBHXMt5RLyBQe5vt35GQzU2dgV9VFyKmAF+RmH+kNIdxUkwiXKl5rhGj8hlE
	kkeg==
X-Gm-Message-State: APf1xPAIpY3tKTRlOwjeV4li3N4jgfZ5XgHwPfSFwwsBiD3/V5XO07rY
	ynAVidxk5jUZcBGUQ2WUdAURtI3BVtI=
X-Received: by 2002:a17:902:7297:: with SMTP id
	d23-v6mr2607507pll.417.1518382741763; 
	Sun, 11 Feb 2018 12:59:01 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	y129sm8850354pgb.27.2018.02.11.12.59.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Feb 2018 12:59:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 11 Feb 2018 12:58:48 -0800
Message-Id: <20180211205848.4568-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180211205848.4568-1-richard.henderson@linaro.org>
References: <20180211205848.4568-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-devel] [PATCH v2 7/7] linux-user: Implement aarch64
 PR_SVE_SET/GET_VL
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
X-TUID: mjlrQDEOORY+

As an implementation choice, widening VL has zeroed the
previously inaccessible portion of the sve registers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  2 ++
 linux-user/syscall.c | 20 +++++++++++++++++
 target/arm/cpu64.c   | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 51a3e16275..8e1016cfd6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -842,6 +842,8 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+unsigned aarch64_get_sve_vlen(CPUARMState *env);
+unsigned aarch64_set_sve_vlen(CPUARMState *env, unsigned vlen);
 #endif
 
 target_ulong do_arm_semihosting(CPUARMState *env);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 82b35a6bdf..4840bf502f 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10659,6 +10659,26 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
             break;
         }
 #endif
+#ifdef TARGET_AARCH64
+        case 50: /* PR_SVE_SET_VL */
+            /* We cannot support either PR_SVE_SET_VL_ONEXEC
+               or PR_SVE_VL_INHERIT.  Therefore, anything above
+               ARM_MAX_VQ results in EINVAL.  */
+            if (!arm_feature(cpu_env, ARM_FEATURE_SVE)
+                || arg2 > ARM_MAX_VQ * 16 || arg2 & 15) {
+                ret = -TARGET_EINVAL;
+            } else {
+                ret = aarch64_set_sve_vlen(cpu_env, arg2);
+            }
+            break;
+        case 51: /* PR_SVE_GET_VL */
+            if (arm_feature(cpu_env, ARM_FEATURE_SVE)) {
+                ret = aarch64_get_sve_vlen(cpu_env);
+            } else {
+                ret = -TARGET_EINVAL;
+            }
+            break;
+#endif /* AARCH64 */
         case PR_GET_SECCOMP:
         case PR_SET_SECCOMP:
             /* Disable seccomp to prevent the target disabling syscalls we
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1c330adc28..6dee78f006 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -363,3 +363,64 @@ static void aarch64_cpu_register_types(void)
 }
 
 type_init(aarch64_cpu_register_types)
+
+/* Return the current cumulative SVE VLEN.  */
+unsigned aarch64_get_sve_vlen(CPUARMState *env)
+{
+    return ((env->vfp.zcr_el[1] & 0xf) + 1) * 16;
+}
+
+/* Set the cumulative ZCR.EL to VLEN, or the nearest supported value.
+   Return the new value.  */
+unsigned aarch64_set_sve_vlen(CPUARMState *env, unsigned vl)
+{
+    unsigned vq = vl / 16;
+    unsigned old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+
+    if (vq < 1) {
+        vq = 1;
+    } else if (vq > ARM_MAX_VQ) {
+        vq = ARM_MAX_VQ;
+    }
+    env->vfp.zcr_el[1] = vq - 1;
+
+    /* The manual sez that when SVE is enabled and VL is widened the
+     * implementation is allowed to zero the previously inaccessible
+     * portion of the registers.  The corollary to that is that when
+     * SVE is enabled and VL is narrowed we are also allowed to zero
+     * the now inaccessible portion of the registers.
+     *
+     * The intent of this is that no predicate bit beyond VL is ever set.
+     * Which means that some operations on predicate registers themselves
+     * may operate on full uint64_t or even unrolled across the maximum
+     * uint64_t[4].  Performing 4 bits of host arithmetic unconditionally
+     * may well be cheaper than conditionals to restrict to the operation
+     * to the relevant portion of a uint16_t[16].
+     *
+     * ??? Need to move this somewhere else, so that it applies to
+     * changes to the real system registers and EL state changes.
+     */
+    if (vq < old_vq) {
+        unsigned i, j;
+        uint64_t pmask;
+
+        /* Zap the high bits of the zregs.  */
+        for (i = 0; i < 32; i++) {
+            memset(&env->vfp.zregs[i].d[2 * vq], 0, 16 * (ARM_MAX_VQ - vq));
+        }
+
+        /* Zap the high bits of the pregs and ffr.  */
+        pmask = 0;
+        if (vq & 3) {
+            pmask = ~(-1ULL << (16 * (vq & 3)));
+        }
+        for (j = vq / 4; j < ARM_MAX_VQ / 4; j++) {
+            for (i = 0; i < 17; ++i) {
+                env->vfp.pregs[i].p[j] &= pmask;
+            }
+            pmask = 0;
+        }
+    }
+
+    return vq * 16;
+}
-- 
2.14.3

