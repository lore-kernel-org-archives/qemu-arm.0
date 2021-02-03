Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp494975lfo;
        Wed, 3 Feb 2021 11:21:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQvY5DVhaeW70201RQiun8bWQ7Ej0t9ofSi4+Iw+FAvWO0v955TH4WGi5Qr3VRXp3JrCwm
X-Received: by 2002:a25:f40e:: with SMTP id q14mr6723748ybd.230.1612380098769;
        Wed, 03 Feb 2021 11:21:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380098; cv=none;
        d=google.com; s=arc-20160816;
        b=vRbZ0BQKVrcD+4O9nUsoOuFP0fnhqppN7In+Hx5e7FQSp1Gzt2RpdiZOKGInTJH6lN
         jN3I3+jRb1C0WxvzCZM8WoGHlKdpkrEkaQfBkMzbBPjyXUZMmz6lAwDDc17r0hGXXLes
         +j4BNgDVJYmnekIYvwkrC6Pq1vHb508tmg4UQjW8rdcVAnr+FH4bvJjkegflWsfTdtrT
         sxnS7/2TMutNYRCRyXqTBFRT8zEYPaPMBaWquH5u3uiZOBPTK9VjtN29c0W5+U3acDKa
         NxxvGH0fGd3c3XrIWMAOzQy7Qpe6beUEi0fb06oTtRKTWZRfauIJ9W28nbR53PlNnXl0
         D+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ec4hlo+gP8szg6yNPIbUNNDP2CtNSFlAatcye+QT23Y=;
        b=00Q/tWwKGhj3BaC2zw5i/qQHIqCcE1qbiBJ2XczO2X0fgeKITgaemgCO74cWJbgZVY
         4LS4AXygNUXW8wq2iQ9Hmix+WCPKo4ONXPgV7CtwVdbWfq36ExsMndxdpQXPxU+QyaM9
         dmsG6duGIuWDS//3ZDe68GIL+EjEPUuyAfkmqp+pzZP1qX+0mu+j3QY8vuJZB2V46dnH
         xPiQNeg3OnsN0I1MXUj8r6iSBNsTQm7JkDFqsA33DTwA0A8/fDYCs6x0+vJB7gBeafcl
         nL1t2gxBLz1i9hLGO1GptbTG9CNaWozai0YYjE/VggBoCY+Rz4W3j/nP88S5rAU8lWkH
         Eq6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZtbjJpXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si2953646ybc.381.2021.02.03.11.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:21:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZtbjJpXp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7Nic-0005q0-5p
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOz-0007av-2T
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:21 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:45390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOr-0001og-IX
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:20 -0500
Received: by mail-pl1-x62e.google.com with SMTP id b8so363386plh.12
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ec4hlo+gP8szg6yNPIbUNNDP2CtNSFlAatcye+QT23Y=;
 b=ZtbjJpXpy57+a65uZ9LnPatVYCxemrZm2Ci9dJNIT9Sn+5ZVzgefWAiCfR2UL37szG
 vvPbGDT2lJOv5cfqJ9DjFdljVQ7Q9NraHBS8Werf8IwBMZ4dtNcls+ku5RPtal9AMyDL
 W0OQgnkBzi1IMNa7v6rrBEEdMRbzJcbExy72i5kVVGi0QcMwHIBWy4wR0Ie0KEnyx/2S
 H0KO04s/kqn3WhDQjvipnVZhCXcdokNcGal/IJY8jZ7VW6pynrIJtiO9VyTg/1RHr21m
 5THzf8qr8JGpKstacQQqEBNJCI34CCa46s8UxuWytK7AHVH01eH5I+mlVNHrnX4H6EcF
 XBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ec4hlo+gP8szg6yNPIbUNNDP2CtNSFlAatcye+QT23Y=;
 b=S9AkztJImCKyPIiamMxzeVjyc8F8zw4j2Tj8hREImtgEnt1o/apynqKhL254FG02zy
 NY94biu0Nsi+xrQbVH1dlOnXBTYHVSb/2RXFhsj1AKC66QPpoO/o91LJnlPQU98pyjMP
 8VC+7x05bfM6yIhkgkgPkpEu6Vqhlt7fW9JjiJmVP3m9+gbawl+WbpSkofuFujBbHte/
 AxofTqRduwgEww3gD5juwGN82YgBtSR8GAltaILJuoWmFTr5WYGQLEIgMmBPlVfCFu7Q
 kjNKXpug9Q1B9RKWnFbBM6Guac3DeTnAGe/7hGISjOMXeslyGFGpCBgJLHH4uUHWe4WR
 rFTw==
X-Gm-Message-State: AOAM533MvSB6gbWtDH8yTCFZbtzpDtJ0/JLh8yAFVvgagYoPScgsa+HC
 4GrwzvMhzlPDxtH97BUUamllCNuq6taDJw9R
X-Received: by 2002:a17:90a:7143:: with SMTP id
 g3mr4574392pjs.196.1612378861314; 
 Wed, 03 Feb 2021 11:01:01 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:01:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 23/31] linux-user/aarch64: Implement PR_MTE_TCF and
 PR_MTE_TAG
Date: Wed,  3 Feb 2021 09:00:02 -1000
Message-Id: <20210203190010.759771-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lv2gylU0YNJH

These prctl fields are required for the function of MTE.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_syscall.h |  9 ++++++
 linux-user/syscall.c                | 43 +++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/linux-user/aarch64/target_syscall.h b/linux-user/aarch64/target_syscall.h
index 820601dfcc..76f6c3391d 100644
--- a/linux-user/aarch64/target_syscall.h
+++ b/linux-user/aarch64/target_syscall.h
@@ -33,5 +33,14 @@ struct target_pt_regs {
 #define TARGET_PR_SET_TAGGED_ADDR_CTRL 55
 #define TARGET_PR_GET_TAGGED_ADDR_CTRL 56
 # define TARGET_PR_TAGGED_ADDR_ENABLE  (1UL << 0)
+/* MTE tag check fault modes */
+# define TARGET_PR_MTE_TCF_SHIFT       1
+# define TARGET_PR_MTE_TCF_NONE        (0UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_SYNC        (1UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_ASYNC       (2UL << TARGET_PR_MTE_TCF_SHIFT)
+# define TARGET_PR_MTE_TCF_MASK        (3UL << TARGET_PR_MTE_TCF_SHIFT)
+/* MTE tag inclusion mask */
+# define TARGET_PR_MTE_TAG_SHIFT       3
+# define TARGET_PR_MTE_TAG_MASK        (0xffffUL << TARGET_PR_MTE_TAG_SHIFT)
 
 #endif /* AARCH64_TARGET_SYSCALL_H */
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ba4da7f8a6..61bf6148e7 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -10985,17 +10985,53 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             {
                 abi_ulong valid_mask = TARGET_PR_TAGGED_ADDR_ENABLE;
                 CPUARMState *env = cpu_env;
+                ARMCPU *cpu = env_archcpu(env);
+
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    valid_mask |= TARGET_PR_MTE_TCF_MASK;
+                    valid_mask |= TARGET_PR_MTE_TAG_MASK;
+                }
 
                 if ((arg2 & ~valid_mask) || arg3 || arg4 || arg5) {
                     return -TARGET_EINVAL;
                 }
                 env->tagged_addr_enable = arg2 & TARGET_PR_TAGGED_ADDR_ENABLE;
+
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    switch (arg2 & TARGET_PR_MTE_TCF_MASK) {
+                    case TARGET_PR_MTE_TCF_NONE:
+                    case TARGET_PR_MTE_TCF_SYNC:
+                    case TARGET_PR_MTE_TCF_ASYNC:
+                        break;
+                    default:
+                        return -EINVAL;
+                    }
+
+                    /*
+                     * Write PR_MTE_TCF to SCTLR_EL1[TCF0].
+                     * Note that the syscall values are consistent with hw.
+                     */
+                    env->cp15.sctlr_el[1] =
+                        deposit64(env->cp15.sctlr_el[1], 38, 2,
+                                  arg2 >> TARGET_PR_MTE_TCF_SHIFT);
+
+                    /*
+                     * Write PR_MTE_TAG to GCR_EL1[Exclude].
+                     * Note that the syscall uses an include mask,
+                     * and hardware uses an exclude mask -- invert.
+                     */
+                    env->cp15.gcr_el1 =
+                        deposit64(env->cp15.gcr_el1, 0, 16,
+                                  ~arg2 >> TARGET_PR_MTE_TAG_SHIFT);
+                    arm_rebuild_hflags(env);
+                }
                 return 0;
             }
         case TARGET_PR_GET_TAGGED_ADDR_CTRL:
             {
                 abi_long ret = 0;
                 CPUARMState *env = cpu_env;
+                ARMCPU *cpu = env_archcpu(env);
 
                 if (arg2 || arg3 || arg4 || arg5) {
                     return -TARGET_EINVAL;
@@ -11003,6 +11039,13 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                 if (env->tagged_addr_enable) {
                     ret |= TARGET_PR_TAGGED_ADDR_ENABLE;
                 }
+                if (cpu_isar_feature(aa64_mte, cpu)) {
+                    /* See above. */
+                    ret |= (extract64(env->cp15.sctlr_el[1], 38, 2)
+                            << TARGET_PR_MTE_TCF_SHIFT);
+                    ret = deposit64(ret, TARGET_PR_MTE_TAG_SHIFT, 16,
+                                    ~env->cp15.gcr_el1);
+                }
                 return ret;
             }
 #endif /* AARCH64 */
-- 
2.25.1

