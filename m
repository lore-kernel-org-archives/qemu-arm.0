Received: by 10.28.91.67 with SMTP id p64csp727779wmb;
        Sat, 3 Mar 2018 06:39:06 -0800 (PST)
X-Google-Smtp-Source: AG47ELt/7PsgTQK/Xcm8XYIrvxLjgN/g+xwBSSH+bvMHLMxKce7fBzp8Q7w3o8FsjxKFLeltdGyC
X-Received: by 2002:a25:ef48:: with SMTP id w8-v6mr5747615ybm.323.1520087946541;
        Sat, 03 Mar 2018 06:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520087946; cv=none;
        d=google.com; s=arc-20160816;
        b=FpD20scvFWcUAsVkbigsFjMNF1jqt1hvOHi3egx1RGZOj1aVIKpq+nCDNdgrCSfP4c
         5TmhKax8CYhqm1UmP/uyutFufzaR7yIILmqveoe3UVEKGlKfHmZYL6PGFFrOaRr4qLws
         z3WH2lWGuu5g9jfwfKUv6Pr7fXMaIVNk0QjhJfJP8UmamC4SsMHNEuQ+bJ/QQHbP7WWi
         JWFr1FtZgvQxNImNrhjyUt7CuRD1D9sNd6ugRsXG4AqbIHfctKkhORfvgYbfCvm6fQkK
         2ElZ73hhscgGSnXvjKUIh7ANDBQXZXnoRYC2/fE7UbAKg/aUNmMeNL8KxXMjd6a+vxZB
         M66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=3W+0UfNwdSg96itJXuLWSpeeh0QF5UQDLf/FVgeft4c=;
        b=A8Vhdsi8lBJRPm/3oIXz6l9TxRuv2sWFRwELMhAq/TVkGOhUDExrZ+wZ8pyKtgL+9q
         GSAi83kyJPw0t1zWDHMnrinOtGfnqbAX0mK1ZaTBe8iHgjV8+nAQooHC/NxfTcIQZ9UH
         /EL9Q4zyMCsM8w2rBLp0aBE3/Q9p4isKVB3XVc/WcufFruzEhcfCi4341sggFN77Rbfq
         Trz8HzP9xw5+Rpgg0jDFVf+HRn5wwokHsIrLtgso1LBY4ypsYoyvs0uioZXfOqgAaxnQ
         +I5mxDgSBbbueTupcmeR/FMsc7n3nddp+YudoS4Vm92yYstw6LxtVdW8CdL3SbniRk6x
         X9bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C6Fi6m0j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si319027ywd.416.2018.03.03.06.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 03 Mar 2018 06:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=C6Fi6m0j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1es8JV-00067Y-Qo
	for alex.bennee@linaro.org; Sat, 03 Mar 2018 09:39:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8Iy-000627-BE
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1es8Iw-0003vE-NK
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:32 -0500
Received: from mail-wr0-x244.google.com ([2a00:1450:400c:c0c::244]:40832)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1es8Iw-0003v0-Dj
	for qemu-devel@nongnu.org; Sat, 03 Mar 2018 09:38:30 -0500
Received: by mail-wr0-x244.google.com with SMTP id o76so12871014wrb.7
	for <qemu-devel@nongnu.org>; Sat, 03 Mar 2018 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3W+0UfNwdSg96itJXuLWSpeeh0QF5UQDLf/FVgeft4c=;
	b=C6Fi6m0jcwey5mICCIIMUpGwwNSDdRNE/+eOdYf0d3o44siyOg0xjizGyBw9thUMTe
	GVsh4a4RV4Nlzzsbaae/0OsMDj72+XtML1JJcDi95B4INsD9FbCQqT+h4fIoKt7WCyyR
	ZFj6eeudM21/3MyR94HyLVeGR7Oj6HW3bP3jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3W+0UfNwdSg96itJXuLWSpeeh0QF5UQDLf/FVgeft4c=;
	b=kaTDo4CfPbzuu0wE1dHh4m/q917s79tUzGj9NMgdoBeXfK3kZfiLfpYlzoPxj2IZrH
	7ex/t6GNeLS1jC2RSq5h1KV4fAqFo7CFe4+qEMCb7G69jMUqqWIKXBC9GMbNTux/Upex
	x3zCKEmELsn+hVHWbg5OqtaRrXWpe6KXFc6aXtEGeLRoQkq+HyXcnfjy70oh4dse+Vax
	a7jO+BA9lhK6OkW4a/LPOCeb83RYCBoZo5iZM/35vSMeDORSSUsdoer0+5OABJ3sldot
	37THoPmZc6ZEe5vcwJ0uiHOO5iXAebDZX2BR7mNP+i7BOR7yjRtaKsewynxprmZxT5aN
	C54g==
X-Gm-Message-State: APf1xPD90VaETEqB+JfjDZBLZwAYtJUSaoCqgvOIvCOFnneyC+TNJmfo
	WU6y1K0lziRZ1ffonjrMysWVhMcH0rU=
X-Received: by 10.223.173.18 with SMTP id p18mr8371316wrc.29.1520087909112;
	Sat, 03 Mar 2018 06:38:29 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.gmail.com with ESMTPSA id 4sm2732686wmz.31.2018.03.03.06.38.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Mar 2018 06:38:27 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  3 Mar 2018 14:38:19 +0000
Message-Id: <20180303143823.27055-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180303143823.27055-1-richard.henderson@linaro.org>
References: <20180303143823.27055-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::244
Subject: [Qemu-devel] [PATCH v4 1/5] linux-user: Implement aarch64
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vLRlkcphON5O

As an implementation choice, widening VL has zeroed the
previously inaccessible portion of the sve registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  3 +++
 target/arm/cpu.h                    |  1 +
 linux-user/syscall.c                | 27 ++++++++++++++++++++++++
 target/arm/cpu64.c                  | 41 +++++++++++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 604ab99b14..205265e619 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -19,4 +19,7 @@ struct target_pt_regs {
 #define TARGET_MLOCKALL_MCL_CURRENT 1
 #define TARGET_MLOCKALL_MCL_FUTURE  2
 
+#define TARGET_PR_SVE_SET_VL  50
+#define TARGET_PR_SVE_GET_VL  51
+
 #endif /* AARCH64_TARGET_SYSCALL_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 8dd6b788df..5f4566f017 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -861,6 +861,7 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 #ifdef TARGET_AARCH64
 int aarch64_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
 int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
 #endif
 
 target_ulong do_arm_semihosting(CPUARMState *env);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e24f43c4a2..38f40e2692 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10670,6 +10670,33 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
             break;
         }
 #endif
+#ifdef TARGET_AARCH64
+        case TARGET_PR_SVE_SET_VL:
+            /* We cannot support either PR_SVE_SET_VL_ONEXEC
+               or PR_SVE_VL_INHERIT.  Therefore, anything above
+               ARM_MAX_VQ results in EINVAL.  */
+            ret = -TARGET_EINVAL;
+            if (arm_feature(cpu_env, ARM_FEATURE_SVE)
+                && arg2 >= 0 && arg2 <= ARM_MAX_VQ * 16 && !(arg2 & 15)) {
+                CPUARMState *env = cpu_env;
+                int old_vq = (env->vfp.zcr_el[1] & 0xf) + 1;
+                int vq = MAX(arg2 / 16, 1);
+
+                if (vq < old_vq) {
+                    aarch64_sve_narrow_vq(env, vq);
+                }
+                env->vfp.zcr_el[1] = vq - 1;
+                ret = vq * 16;
+            }
+            break;
+        case TARGET_PR_SVE_GET_VL:
+            ret = -TARGET_EINVAL;
+            if (arm_feature(cpu_env, ARM_FEATURE_SVE)) {
+                CPUARMState *env = cpu_env;
+                ret = ((env->vfp.zcr_el[1] & 0xf) + 1) * 16;
+            }
+            break;
+#endif /* AARCH64 */
         case PR_GET_SECCOMP:
         case PR_SET_SECCOMP:
             /* Disable seccomp to prevent the target disabling syscalls we
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 4228713b19..74b485b382 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -366,3 +366,44 @@ static void aarch64_cpu_register_types(void)
 }
 
 type_init(aarch64_cpu_register_types)
+
+/* The manual says that when SVE is enabled and VQ is widened the
+ * implementation is allowed to zero the previously inaccessible
+ * portion of the registers.  The corollary to that is that when
+ * SVE is enabled and VQ is narrowed we are also allowed to zero
+ * the now inaccessible portion of the registers.
+ *
+ * The intent of this is that no predicate bit beyond VQ is ever set.
+ * Which means that some operations on predicate registers themselves
+ * may operate on full uint64_t or even unrolled across the maximum
+ * uint64_t[4].  Performing 4 bits of host arithmetic unconditionally
+ * may well be cheaper than conditionals to restrict the operation
+ * to the relevant portion of a uint16_t[16].
+ *
+ * TODO: Need to call this for changes to the real system registers
+ * and EL state changes.
+ */
+void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq)
+{
+    int i, j;
+    uint64_t pmask;
+
+    assert(vq >= 1 && vq <= ARM_MAX_VQ);
+
+    /* Zap the high bits of the zregs.  */
+    for (i = 0; i < 32; i++) {
+        memset(&env->vfp.zregs[i].d[2 * vq], 0, 16 * (ARM_MAX_VQ - vq));
+    }
+
+    /* Zap the high bits of the pregs and ffr.  */
+    pmask = 0;
+    if (vq & 3) {
+        pmask = ~(-1ULL << (16 * (vq & 3)));
+    }
+    for (j = vq / 4; j < ARM_MAX_VQ / 4; j++) {
+        for (i = 0; i < 17; ++i) {
+            env->vfp.pregs[i].p[j] &= pmask;
+        }
+        pmask = 0;
+    }
+}
-- 
2.14.3

