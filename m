Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2891158ocg;
        Mon, 10 Oct 2022 20:40:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6dDCgNmBVSavgN8iEZgEgO8CS5r/Sj9O1ZLDVusDb4/HZ1/4zW59qw6hfZYU3GqqMh7Nnk
X-Received: by 2002:a05:6214:268b:b0:4b4:4912:3e5 with SMTP id gm11-20020a056214268b00b004b4491203e5mr1237021qvb.125.1665459613293;
        Mon, 10 Oct 2022 20:40:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665459613; cv=none;
        d=google.com; s=arc-20160816;
        b=fY44SqDzTz/k4p13n2022LTb2Dbjzspogc3nIAn17k7jU/ofMWh9AprUQsQLEekdsz
         RA5fbe5mVQDFAqNM5D9Azm2MaPxBRKWK/7VeTs7niRXN7H2Z2SdDuoDBNYDlq39rTNts
         zvnUmr//D6sQqp7AuMegBQG7RqHdMg+mL0rBc04CIUocUW1xWW1f+HYUXnhBlZ56h9ED
         G/LND5WAZPpOB9HR1ZYyu71UJEGGyVGe0hOy7Sp6RMgEii5oYcLDajQQBSPPSLTdqqc6
         CVTvXm/6luNx1vK2aBleohWUkKN2AlVcquWWKzsZGNB8ZVkZJCP9Z5aBBQ6IiOJNu6iN
         pmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VLe0nDHpVS96XvP1AbTdyi1WQJxRc5tYeD+d8MqDnjY=;
        b=PXw92EgnkQS6RAnkzZy/vgtvcCbi+V4S3oIcO5MBnZA6Qchl1MJiPSZhmuLbNYg02u
         8IV7xoKyabmpXjMBjgHV5yXUMorm8FEMDSIMdY8Nq8ZfyAS/a7bHegPvk8i7RvYmP+cS
         0687E7ASwPHt0kT+7jZShbHxmageBGQwo5lKwEr2cudAc9L/MdvzCcZLR8SEIjfxT/+w
         gjy8ILqGkOr2uxOAMlfzF44iCU8dAW/jXFKXjkQXXw6Me4QQu+5Bw5o844WAMGpXIL0+
         BlQex/OWuIfp0shIvUkg8qW7qoEMrXJm0hNhifJF3H53AbrtHY8HtQJ6pHI0GITgJgbE
         4u/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DUdS4FOF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4-20020a056214194400b004b32bd25187si6865883qvk.580.2022.10.10.20.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:40:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DUdS4FOF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi67o-0002RM-QL
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oJ-00038b-S9
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:20:04 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oI-00033L-6m
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 23:20:03 -0400
Received: by mail-pg1-x531.google.com with SMTP id q1so3434417pgl.11
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 20:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLe0nDHpVS96XvP1AbTdyi1WQJxRc5tYeD+d8MqDnjY=;
 b=DUdS4FOFPcPSBGQ6Zv64sPOYcwWK5FwQ7+X6mwkn3IoJpMuXJmxEnIsa05GAJ6dAXK
 zN1kGmdiaFSTXOp9ddq5/UF2KBF98s3R1HfznuNZwI7tstoEEaQPZ6EMuKxbF2oQjlVX
 zdR3++MGdd2xmy0i9Wn7+xPA4sNyIIdd4yZucB0XLMKOMCpzNuE0L4pO5IgeJluWvS0K
 gkHqwSWWuRfgdyl7kbJoNHw4+e1zbNwg3/IloXwPYgZpcZdSswA6RMQHg6Qwyx0c83tu
 UgczDbRFfj6VqtgYsxTA/Dfci7weFx4K+iV7QgMS/zvkD8D0OAgg17tXiEVb8vUdJvW2
 unbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLe0nDHpVS96XvP1AbTdyi1WQJxRc5tYeD+d8MqDnjY=;
 b=ROhPq0TiIiaJTzcsFp/RjdsUGRIntjLSwVkHWDDoc5b63+kjqonZWFEacLaC0rxs8I
 hRHbaetVlhKVXTNffbuIH93cnG91121//ZjJlrgqzQJYLVLpQZhW0mCbdAZRs0xwb0Hh
 EFJVfcDR0tJDFsPU2HFpu/M/YI2rEe1pz+u8Fz3AdEJRhzKltdy4ZkHXIQTWf+JKnjJM
 9fjPsheTcfhuamq8mzHOynFqSE1mYlECr9O3HPzORzt0K/bcgc6YPG7n2sWXwPI8IXe1
 xyH9UmLirPewgqp3yt8L8eM8v98Apiy9Cr5AE0fsXPW+8yY2npOETM2l6vHXOYFZlHKi
 Ha8Q==
X-Gm-Message-State: ACrzQf2k6ZA5qTwJrDHfq6o1urCk+GTtvupqdp++ryuGRy+CLmmEukZ7
 /wfd1+uNbmY9xR4gSZUG03VEO7QiY8AZQA==
X-Received: by 2002:a65:5801:0:b0:45d:bbd8:e872 with SMTP id
 g1-20020a655801000000b0045dbbd8e872mr17915832pgr.343.1665458401361; 
 Mon, 10 Oct 2022 20:20:01 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:20:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 23/24] target/arm: Implement FEAT_HAFDBS, dirty bit portion
Date: Mon, 10 Oct 2022 20:19:10 -0700
Message-Id: <20221011031911.2408754-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iFhQrh9b3LO/

Perform the atomic update for hardware management of the dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c |  2 +-
 target/arm/ptw.c   | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index fe1369fe96..0732796559 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1165,7 +1165,7 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 1);   /* FEAT_HAFDBS, AF only */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HAFDBS, 2);   /* FEAT_HAFDBS */
     t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
     t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
     t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 82b6ab029e..0dbbb7d4d4 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1484,10 +1484,30 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     ap = extract32(attrs, 6, 2);
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
+        if (param.hd
+            && extract64(attrs, 51, 1)  /* DBM */
+            && access_type == MMU_DATA_STORE) {
+            /*
+             * Pre-emptively set S2AP[1], so that we compute EXEC properly.
+             * C.f. AArch64.S2ApplyOutputPerms, which does the same thing.
+             */
+            ap |= 2;
+            new_descriptor |= 1ull << 7;
+        }
         ns = mmu_idx == ARMMMUIdx_Stage2;
         xn = extract64(attrs, 54, 2);
         result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
+        if (param.hd
+            && extract64(attrs, 51, 1)  /* DBM */
+            && access_type == MMU_DATA_STORE) {
+            /*
+             * Pre-emptively clear AP[2], so that we compute EXEC properly.
+             * C.f. AArch64.S1ApplyOutputPerms, which does the same thing.
+             */
+            ap &= ~2;
+            new_descriptor &= ~(1ull << 7);
+        }
         ns = extract32(attrs, 5, 1);
         xn = extract64(attrs, 54, 1);
         pxn = extract64(attrs, 53, 1);
-- 
2.34.1

