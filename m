Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp498931lfo;
        Wed, 3 Feb 2021 11:28:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWs5EXtNv+/N9iFKMrdfMxXFYcmAY2gu+aV72TFqyZXVVJO875uu7qo574LyEgOH9VHsOx
X-Received: by 2002:a25:fc2:: with SMTP id 185mr7074892ybp.385.1612380501404;
        Wed, 03 Feb 2021 11:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380501; cv=none;
        d=google.com; s=arc-20160816;
        b=Vz69eGjTqlmuHSQTZFGMG1TTP6YNOi6QGTdK2fUQzakjw0G0t27sFVg0C/0MaIcfWE
         uOIViB2wsUavA5a/evIU5RM4fisAZe4gGmSk/BiLFS83mIy4YDpR/6hSdN3Gep42q1rT
         sPbKq4sK5KHXhaeZd+aLlLvZ/cjTqdzAspbV9EwgIWRuNH1qP5jRQtaBYd8HzW5uh6OH
         NOZdh2bgtlPzj2yCOWbFy6r/4jYQywbhd0hWXhx1XRXBTyLQV9ve7lROPi0eTgRJshjM
         p32DcMOV7d9gg2B3F3IqUetiAfrT6Nmm2i+PEZaLn9pfLATr0OOPUV4YrwoodtWkxtWD
         onYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NmqOnFZ3gzFTWfhEXE/IEZcCHdcqEoHvbx2VhkXYfn0=;
        b=kupJva6N+LvmoCo1mOX22ODFcKb9IU2daJtcRzUTh9B586ity5p/qBM29dW+rziBWY
         zPs4ay+6Yg5x6xhwnEBPJ7h+6CVBYEUArU60LsBabAOD2BkUF/LMSbbRL7nQ6c0Mf99O
         v0G0BJEJdd6q6gZjoJvfy0jr/bsw1pe/DL/sHvHeqAmHkX3wrBSEonXzOhU8s4pMcSKa
         jg1fKiprh+qmyQGOmNKvUtA3MB3xCodCvyamK4xjr/oSNbiins8UuQYUeY/3eJNC5hVj
         mUfMRWGpCYtesiVze596G9tgOildkK2cQoDMzyjHr061EbzUp+SezFAamsxn/ee5fY0K
         PZLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uECkAftb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si2290170ybn.373.2021.02.03.11.28.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uECkAftb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Np6-0003ui-Mn
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:28:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0007Ti-3C
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:13 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:52054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOa-0001mQ-Pq
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 14:01:06 -0500
Received: by mail-pj1-x1036.google.com with SMTP id a20so235706pjs.1
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 11:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmqOnFZ3gzFTWfhEXE/IEZcCHdcqEoHvbx2VhkXYfn0=;
 b=uECkAftbpnvvKJ64aKpKmMwKz/mv6M0YgeqSCqBKJjZZqIz9ljKvh9tLEKwjqBI8Yi
 sGUP8OTVeSBzKQNBkBW+mhiwqOUHq2zPfoj16LvIAPupWSIcBbxTWe7k88rSrhGZOgno
 8gVecHi1otxt807rvdrbvwrZA0XL9dJ82CmTI+VEsJS7Jyt+l+ZW1dWUR7E3rHdpWN2T
 Pmg7gy36jtySD67SiCN4tupO/DpEsz2qOtn44eNFFZOnSpDrAGWwzwqFmBIKtaPFryhW
 4IcN5sXZKJ+8AUGRMpAx5akT0/S9iHz18uXtzCvurA3tM4gYzT7nd7o0+4TRWlhdkwbj
 HYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmqOnFZ3gzFTWfhEXE/IEZcCHdcqEoHvbx2VhkXYfn0=;
 b=Wzwpgn3arQR5HA0NWEG6AZM84oZeKL+hfOLyxu9VLsm52sDowX4EOTkquZmFz/WRz3
 PSbEJtXP78H5bNAhd6APb6ujxqJtHrwH/U8RKmpANlr04IcpxOrCbq15svuUiVQykNsC
 lIh9uZN/8BwlLbaA0auvMvbyI2rhBaDZR4Srk4al1IacmIB7bec82fCfAGNsnnfePiqb
 OPgoncVzLTq8E1OisMUlIYxJcwM4r4qzyewVibtOZTH9ZyVDkexkmIAIM4W66yqjKTRH
 P1wBl4td+iy+yDKWCFsL234KEjgvoU3aKYIcwDaU157UYlnNrupW63DaefOX0VCiIn87
 U1yw==
X-Gm-Message-State: AOAM5304dOaIlzGCFc+6N0kSGkOqpNcuMGRPOLtM2OZOlydOInr/TMr1
 Q2MUxJFX5ejRe6Z8EZvpvYJ6xaj5TCGRakG2
X-Received: by 2002:a17:90a:4611:: with SMTP id
 w17mr4502783pjg.18.1612378855264; 
 Wed, 03 Feb 2021 11:00:55 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/31] linux-user/aarch64: Implement PR_TAGGED_ADDR_ENABLE
Date: Wed,  3 Feb 2021 08:59:59 -1000
Message-Id: <20210203190010.759771-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pt05iVqJ1erZ

This is the prctl bit that controls whether syscalls accept tagged
addresses.  See Documentation/arm64/tagged-address-abi.rst in the
linux kernel.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  4 ++++
 target/arm/cpu-param.h              |  3 +++
 target/arm/cpu.h                    | 31 +++++++++++++++++++++++++++++
 linux-user/syscall.c                | 24 ++++++++++++++++++++++
 4 files changed, 62 insertions(+)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 3194e6b009..820601dfcc 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -30,4 +30,8 @@ struct target_pt_regs {
 # define TARGET_PR_PAC_APDBKEY   (1 << 3)
 # define TARGET_PR_PAC_APGAKEY   (1 << 4)
 
+#define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
+#define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
+# define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
+
 #endif /* AARCH64_TARGET_SYSCALL_H */
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 00e7d9e937..7f38d33b8e 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -20,6 +20,9 @@
 
 #ifdef CONFIG_USER_ONLY
 #define TARGET_PAGE_BITS 12
+# ifdef TARGET_AARCH64
+#  define TARGET_TAGGED_ADDRESSES
+# endif
 #else
 /*
  * ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d080239863..558ad1466b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -721,6 +721,11 @@ typedef struct CPUARMState {
     const struct arm_boot_info *boot_info;
     /* Store GICv3CPUState to access from this struct */
     void *gicv3state;
+
+#ifdef TARGET_TAGGED_ADDRESSES
+    /* Linux syscall tagged address support */
+    bool tagged_addr_enable;
+#endif
 } CPUARMState;
 
 static inline void set_feature(CPUARMState *env, int feature)
@@ -3602,6 +3607,32 @@ static inline MemTxAttrs *typecheck_memtxattrs(MemTxAttrs *x)
  */
 #define PAGE_BTI  PAGE_TARGET_1
 
+#ifdef TARGET_TAGGED_ADDRESSES
+/**
+ * cpu_untagged_addr:
+ * @cs: CPU context
+ * @x: tagged address
+ *
+ * Remove any address tag from @x.  This is explicitly related to the
+ * linux syscall TIF_TAGGED_ADDR setting, not TBI in general.
+ *
+ * There should be a better place to put this, but we need this in
+ * include/exec/cpu_ldst.h, and not some place linux-user specific.
+ */
+static inline target_ulong cpu_untagged_addr(CPUState *cs, target_ulong x)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    if (cpu->env.tagged_addr_enable) {
+        /*
+         * TBI is enabled for userspace but not kernelspace addresses.
+         * Only clear the tag if bit 55 is clear.
+         */
+        x &= sextract64(x, 0, 56);
+    }
+    return x;
+}
+#endif
+
 /*
  * Naming convention for isar_feature functions:
  * Functions which test 32-bit ID registers should have _aa32_ in
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24fc1daf02..ba4da7f8a6 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10981,6 +10981,30 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 }
             }
             return -TARGET_EINVAL;
+        case TARGET_PR_SET_TAGGED_ADDR_CTRL:
+            {
+                abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
+                CPUARMState *env = cpu_env;
+
+                if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
+                    return -TARGET_EINVAL;
+                }
+                env->tagged_addr_enable = arg2 & TARGET_PR_TAGGED_ADDR_ENABLE;
+                return 0;
+            }
+        case TARGET_PR_GET_TAGGED_ADDR_CTRL:
+            {
+                abi_long ret = 0;
+                CPUARMState *env = cpu_env;
+
+                if (arg2 || arg3 || arg4 || arg5) {
+                    return -TARGET_EINVAL;
+                }
+                if (env->tagged_addr_enable) {
+                    ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
+                }
+                return ret;
+            }
 #endif /* AARCH64 */
         case PR_GET_SECCOMP:
         case PR_SET_SECCOMP:
-- 
2.25.1

