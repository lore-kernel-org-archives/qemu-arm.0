Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3069489ejn;
        Sun, 23 Oct 2022 23:21:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5uaJCExR5g647xdcImouEege/f53tkiOmaXHJhMl3jeByu54LU2oAanoe5hYnApEuv6My1
X-Received: by 2002:a05:622a:394:b0:39c:dcd7:ae69 with SMTP id j20-20020a05622a039400b0039cdcd7ae69mr26066979qtx.546.1666592499292;
        Sun, 23 Oct 2022 23:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666592499; cv=none;
        d=google.com; s=arc-20160816;
        b=HEMajGhupta4pYX+jvyX+s8NuHJhZFAqeK0ImC5/nI9pgpzIuPqw8Yv9vZjgmK0toM
         TODxtZhdtY0sSLyTbEJwSDhfiPMXI59MfKNMUs3taCcmKKo+LxtU814pcPATe8M0lef/
         1Xtf5MmGSfunFjodad3UuilNIYggkWwDzrYAsn3Co2DamldTVy8As7CfpI4MxdtuPpMq
         wjrxYW5aI8JTtudiGiiC1IPcZ0Tbv3wFyxSPLqRMUBz2jI8bvlxcJjhmdod3Ro5P9Sfg
         4UWZHaSC++AFGHzqOk52tovBu06tKMOkaaTBiB95sHM8O9CN3h04L7nF1/0DsKpGyzwU
         YWaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
        b=UJbYmqn2TOTnbu0cP5BZBsaduu90zr+7cO+6flUYanMKoSnzap5b78CLczxI8rtkyH
         FvZX9xOvExLqqcQ40q1mNQeBBVHv1WItzRUP1rIVl0UrcTnOOVZPQKT/G0z1Dzak3T82
         Qycsby5JrQeMq+V//XEzrmUtQCWL0M7b9CGrFYHKynqTvzQbj5qm9cEGYdmd7TXGjWzl
         +OP63k1MGeO3rt5uDJF6pE7zlsJXiGkL2ngFsQFGPgFE9djnV5GjtqZ1j40cNceiKUn1
         YggOZTOGDtPDU0tzJpKOufrn7/CzyFLwumq0pvpnIJYNYLgK7THdWid7LhKQqz3OZGue
         JL6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfYYdXX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11-20020a05621421eb00b0049f65f06561si16122940qvj.293.2022.10.23.23.21.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 23:21:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IfYYdXX5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omps2-0006hY-Aa; Mon, 24 Oct 2022 01:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompro-0006ak-RM
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprl-0002LZ-8O
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 i3-20020a17090a3d8300b00212cf2e2af9so7064306pjc.1
 for <qemu-arm@nongnu.org>; Sun, 23 Oct 2022 22:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
 b=IfYYdXX5BP6H2RKB06MWo2FGklxdm07IL/N5UXRPwLBGTAEP0hqm7919yy3GVGqKjd
 uaD75kv6DQqxgbZf5VyT0kdfFeTX2Cw4eOAkIIg9ITJdmArWCGyKJcTqEsH6R69cslJy
 oruTjvQQqUYgs0jrjaXKqb5smIVyxVJwENHfbH8Q7sUgbu2CgUGIXLJbA4gErK1KHQH8
 tcxw6VuFgGhQuYc69C//SKX4J9c/07HSugvm/2EVoVAZmRfEQTOAjKPBYWlWnyNrEKw3
 AYPSnVcrBCBI1F03zgDwWtz7ZqBnlmB0lzLFLnRN4GPSuYZ86Q5tcAqu9b6HFA06VtdS
 yIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4OEjLGxioHnK53AFYFEVfccxIYEwGKi33iPaWC9c5ZM=;
 b=dwc0r0dQGy+u1g7itrSEeLVfzm4AF3FA3U5B1teJ+d5HGeysj7hh31cQVEa+5mEjqA
 WnGKO3CrXhTfNuMkYTXXyOFpw1MXPJ4RJvIsyB0uktOb6Y9JZ5u9wEYvna2kXgfpilO7
 FIjRZ1U8dudMkKZO6x9tukS9ukkVOasQrNQ1GEhTb6+pldCHWpmWjLueXc60zB72JmD9
 hSgXj6RAJZ0Ims85NPORYazO5T0RVhaHnKrB9lrzYflNU6we1y3UCZtHh8aUXLr1H8Q2
 redWtCPaeDf1cqMBvoS2h6IcpbxGr8Ajrt9yO3Cq8RkktUzoKd80TRv21r1/IpnrHScf
 wNAQ==
X-Gm-Message-State: ACrzQf28Igsn0qMt/665xHpeBgVfe1a9HN7eXiW8REIgqH9O6j1zXM/9
 EEVQiOfhP8pqrZYvWA2NBFvrsPFrFYqHUj5y
X-Received: by 2002:a17:903:283:b0:186:8a20:c1b6 with SMTP id
 j3-20020a170903028300b001868a20c1b6mr10784768plr.119.1666588751667; 
 Sun, 23 Oct 2022 22:19:11 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 05/14] target/arm: Move S1_ptw_translate outside
 arm_ld[lq]_ptw
Date: Mon, 24 Oct 2022 15:18:42 +1000
Message-Id: <20221024051851.3074715-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rx/HyN6fP5cb

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

