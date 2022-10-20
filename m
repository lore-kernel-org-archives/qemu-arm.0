Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp643674ejn;
        Thu, 20 Oct 2022 15:37:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7nFZrQObmCrUp1Smtm+8DHuGaeSNBFuAzZR9HelC0om8Fyd0li3UsE57pmcjSEsrrGBGNm
X-Received: by 2002:a05:622a:13d1:b0:39c:f911:7ad4 with SMTP id p17-20020a05622a13d100b0039cf9117ad4mr11871934qtk.661.1666305442523;
        Thu, 20 Oct 2022 15:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666305442; cv=none;
        d=google.com; s=arc-20160816;
        b=FodnyBsp6W9HG8KhD5QmIlNvDtP7ZkJCDvUGjqxvN5qDcrFHjeh6Zmz8B5dlSa1W5p
         seMnPPDAjysPrXou1OMov/5aaoOO3Ac1Gy2WDRFXLOrhr+mGujK1yUJH1ibPBzDOjAMD
         1SNcymycjx723zafmTw2KikMq641IxfZJZ0myhnx49BfNiHm+PoE0gUVNmb8TRSuVpHu
         TFvwzJ8CkPtINhPkU2G/C5wjfNTuiDGeZc0ZO1LHYTLEIqfXvYMFhETLSBBa15fxu9QX
         AWE6Rtpyq1NiCBIVIH/+VduBB86k6ePsgIVQ4K8q7Dq5+Wu2sEnefR+jYo4hAhudPqQ+
         mNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
        b=VeT6Qfu+qKQGz6EIIrXbLFVlNNg4TOVtafGuxfxjPVaGIN0k6iJQrxZmJ895mXecu6
         sbYuE/dqsp2Foed7O7aNx/85qIwwcsd3JpHzJCO14dSMrLP+hbZXjSDKiEImo259PwVQ
         JySbmg2/KPR9BPAsTbQgCQfvjgck7q+Lhdvn68o+cm7Y0dyUIN+Z7RlZhDmqGNjDT1yU
         W15xU4dEXQOdTfJLmvvU3y1iKBlwEjuwobnCDYmbQS+GpjVt3/Cu+ncZkSUl2QHbCIAu
         zJMHqxx4yv5jZY8Gy9TkY6Tsuof8TxSHtB5D27jh+U1/DRIBXPMheYYl9aHaucO/MZJ4
         bqAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f+7zdT4C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iy12-20020a0562140f6c00b004afb3181744si12194299qvb.438.2022.10.20.15.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f+7zdT4C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleAC-0008TG-Uj
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:37:20 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ole9k-0006jW-4Z
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:36:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9d-0006PW-M8
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:47 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9b-000117-Uf
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 p6-20020a17090a748600b002103d1ef63aso1069465pjk.1
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
 b=f+7zdT4CBN2FP77eUVaivjZiIMDB+oaQ8IhO8QEWynrV/DqVQemXhcSV3ofRONJAHw
 3fUGFlY1pODuT/Q4h7os9NYxhOhjw5SgyCLif1iXD9lCNCunh2SCeEL6BXO2fp6LkhHB
 mV9e3txH34ecC4p6NkEj+MU5izvtMePeAgBL18eq63lfUPE3fZrn+ZfrylQIpM1NJOmv
 wKDL7su7vR7aKO2Tr2BFukm7SmZcVG+4UEaxTAYZUv3lgtleg/LhiYoijYxMle77hTwt
 D92lh5V1SAvwZkVbSyr83IBPPzeT50D2Kz0rZqEfaL1aMPhuyEeY52I0H3rc5LATZVCK
 5B0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
 b=Vd9jSdiagqCByKQEFVDg1TAjJnFXdaHk/HDv+rtxwsIIsR/Q/HQuwSnHJ1QH/MCmgm
 YOlZHaWWT2Kpb1jCBzXXgW6TbCzIWj7Rw3gfOmUedfY9I1Xyl8YmdEdY5w12PcqJPrXB
 F+enqmdfqzjGdETdQ/7aqb30IIRC2v7LVzuzVzTHiofgXXTqEPeM3iJRVy1xNXdfnzIR
 tsz4kFWwGu+ClKqFnWIVwRikXeIt6Fg4NUJaP/aLNsXWa5tyYTbKk4m8fyb3ccySoL2W
 wfgD3BknBeo3/YHIpBK8Hizbtudh8Xb3rk/t0XKkjbWZ+aAXILSwksBcDdqcB57K/7K0
 JnAw==
X-Gm-Message-State: ACrzQf2+3xrxb6gcD8NdRZgLXPN7jjblce3aLf9Pd0Pf8S3J2ILVnJFh
 Y6yCBigUybNN918HhEKDNu9xoBQ748nVgROd
X-Received: by 2002:a17:903:4ca:b0:179:d21f:f04b with SMTP id
 jm10-20020a17090304ca00b00179d21ff04bmr16218531plb.7.1666305402564; 
 Thu, 20 Oct 2022 15:36:42 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 05/14] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Fri, 21 Oct 2022 08:35:39 +1000
Message-Id: <20221020223548.2310496-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020223548.2310496-1-richard.henderson@linaro.org>
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FBZlf2dHhqM8

Separate S1 translation from the actual lookup.
Will enable lpae hardware updates.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 161b7922e3..36524b35ef 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -319,18 +319,12 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 }
 
 /* All loads done in the course of a page table walk go through here. */
-static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     uint32_t data;
 
-    if (!S1_ptw_translate(env, ptw, addr, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
     if (likely(ptw->out_host)) {
         /* Page tables are in RAM, and we have the host address. */
         if (ptw->out_be) {
@@ -358,18 +352,12 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     return data;
 }
 
-static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
+static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
                             ARMMMUFaultInfo *fi)
 {
     CPUState *cs = env_cpu(env);
     uint64_t data;
 
-    if (!S1_ptw_translate(env, ptw, addr, fi)) {
-        /* Failure. */
-        assert(fi->s1ptw);
-        return 0;
-    }
-
     if (likely(ptw->out_host)) {
         /* Page tables are in RAM, and we have the host address. */
         if (ptw->out_be) {
@@ -526,7 +514,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, ptw, table, fi);
+    if (!S1_ptw_translate(env, ptw, table, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, ptw, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -564,7 +555,10 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, ptw, table, fi);
+        if (!S1_ptw_translate(env, ptw, table, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -649,7 +643,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, ptw, table, fi);
+    if (!S1_ptw_translate(env, ptw, table, fi)) {
+        goto do_fault;
+    }
+    desc = arm_ldl_ptw(env, ptw, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -702,7 +699,10 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
         ns = extract32(desc, 3, 1);
         /* Lookup l2 entry.  */
         table = (desc & 0xfffffc00) | ((address >> 10) & 0x3fc);
-        desc = arm_ldl_ptw(env, ptw, table, fi);
+        if (!S1_ptw_translate(env, ptw, table, fi)) {
+            goto do_fault;
+        }
+        desc = arm_ldl_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -1291,7 +1291,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             ptw->in_ptw_idx &= ~1;
             ptw->in_secure = false;
         }
-        descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
+        if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
+            goto do_fault;
+        }
+        descriptor = arm_ldq_ptw(env, ptw, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
-- 
2.34.1

