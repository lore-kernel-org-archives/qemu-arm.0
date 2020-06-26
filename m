Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp48719lfm;
        Thu, 25 Jun 2020 20:34:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcRd/VUx4bJ23nLsrAwBXma+iv22uPAuK046dp7kGlI50qOvz9dIxCkDqJeoA+xcA7Y+0d
X-Received: by 2002:a25:db03:: with SMTP id g3mr1907201ybf.100.1593142443638;
        Thu, 25 Jun 2020 20:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142443; cv=none;
        d=google.com; s=arc-20160816;
        b=D9NMPz9Av+qV0jOIEhbK54jCIYOOtSKWOwf5E3A4UVlKoxpR0RWSddIFzSUkJzV7hQ
         R5w4b9pAuh5wpY+04XaDztgEVXMqcKwWj/CkNV/DUDoXRf90qEYib/y19RNwzBt7TWeb
         IffQkfbzuAH4A7pjwM4YHRYI/CZ8G18qVda/RZVZRufcUNIGXIxuusxhFG6j3gLPz5G3
         vncjnOOBAqtyxnr8TvSotccPzLj3MI2nikqEGqcP96BSnPvB50nq4h+p2t6Zj+uu8q7p
         BIUn4VIX+RqiqrS8PIf2iA7jlZwzdUhvS8uLQsGEN4EiuN0Q+egrdFu5911G6eVsS929
         9dFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EvczOnAfxPHKCoq8QmzQnZTQg2ANuenqwvd4b2Y4ULo=;
        b=Xj5P/lWrJ5dgwhTszUCRL04j8kPOugXh+L5zqJgy8ZOe9WKRsWj4tnEdKUt2SzHfvp
         DKqQaj05U4PIzAnk4mNRzSvgUU3BIRVwDXwjfHt0rfODQGeCbxHLvJcW7aaG3PUfWQOb
         o6l2b5YQ8xT7vlV24zzDvpaCEvwvvYjaBUYf9OsdWq24UikDrbp0+j4pT0/yMPwxy/8O
         eYbdKlLRplQIsY6GSrxbxoNmPbeJIT8ilUa1929T+oRpQIG2lXZM7WwDrH5H64PIKlia
         cC8s1T00fBdFUN++uJQAHihO5l35E1+VNtZkG3jq9apDuTEMm0gtVXtd4OtRII+P5SgD
         pwdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KVwiFYAq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e1si23424263ybo.482.2020.06.25.20.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:34:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KVwiFYAq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jof7r-0003bP-0U
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:34:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5l-0007jy-K2
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:53 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:43076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5j-0001iE-Uq
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:53 -0400
Received: by mail-pg1-x542.google.com with SMTP id w2so3552659pgg.10
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvczOnAfxPHKCoq8QmzQnZTQg2ANuenqwvd4b2Y4ULo=;
 b=KVwiFYAqhie8JlXC/CLOjQ713UderJ6XXowbCerHsc2qnFPmXZyiVcDhJDYMNm2mDb
 3MO7/Wr0xBQ7pIlf77bA3FkcsLFpbBOdyhctaIGeHD7aN5feP6bqBc+lAMF9qK0GPf+q
 5ZgE4wdOL2cKF/zoFTrVLJkS5JE1npTfqxUl/3GAN7DKun/lLtfHod/sRR/avdiG+9VT
 nlx+mfwMwi6k25WqeaFi92fskF7uIflUtUTMmhfG376idewT9MGeTjMwLozZWrgkr/PH
 mAs06No4Q3y3AnPVG88VB4y47mczg8qWADbFUoIMoqBf+r8EY/HxxsdkIX1hJX7ixFrD
 nnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvczOnAfxPHKCoq8QmzQnZTQg2ANuenqwvd4b2Y4ULo=;
 b=DjZba3U08vrEfayS5OEVY2ZGiOnfsBWYoNWd/FjBDuKwBFPFgbKq4kd0cz1wpxv8Vf
 hUQXGmGrlR3qGPX/xQmS2j/3moD7XC9tAQVearKKObPkwZwwHkC8wRslrFODV8A7aJ9H
 WA/V/kQeALAT6Y0AM6G5UEz9HZ+l3Ix9koMFFbT+j+AfDK3DuK5/6A3PU4L4oulYD3zA
 2kfmSnlmyehLIKaDrH/LzqsaDCd3HDD2LbCuqvO6th3FmYHfANLEzL8OH7FzyuuzYx5k
 YqcnDodcd63FMD0ozTPXrEGjoq4xZKt7kSBmOsmwpsjNRnEuPwaI839TJxqMU5yGCqdS
 dogA==
X-Gm-Message-State: AOAM531azIGcB9ZvchWjuIqdyeYPUC0Yi7GuF06vE0JR5ArOnxZhEKYb
 MnmgWWXOvIPb7Ac1JB8zNsuHyg==
X-Received: by 2002:a63:580c:: with SMTP id m12mr906307pgb.446.1593142310713; 
 Thu, 25 Jun 2020 20:31:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.31.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:31:50 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/46] target/arm: Add support for MTE to SCTLR_ELx
Date: Thu, 25 Jun 2020 20:31:01 -0700
Message-Id: <20200626033144.790098-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XzpN3O1Ybl7P

This does not attempt to rectify all of the res0 bits, but does
clear the mte bits when not enabled.  Since there is no high-part
mapping of SCTLR, aa32 mode cannot write to these bits.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a29f0a28d8..8a0fb01581 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4698,6 +4698,22 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     ARMCPU *cpu = env_archcpu(env);
 
+    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
+        /* M bit is RAZ/WI for PMSA with no MPU implemented */
+        value &= ~SCTLR_M;
+    }
+
+    /* ??? Lots of these bits are not implemented.  */
+
+    if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
+        if (ri->opc1 == 6) { /* SCTLR_EL3 */
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
+        } else {
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
+                       SCTLR_ATA0 | SCTLR_ATA);
+        }
+    }
+
     if (raw_read(env, ri) == value) {
         /* Skip the TLB flush if nothing actually changed; Linux likes
          * to do a lot of pointless SCTLR writes.
@@ -4705,13 +4721,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
-        /* M bit is RAZ/WI for PMSA with no MPU implemented */
-        value &= ~SCTLR_M;
-    }
-
     raw_write(env, ri, value);
-    /* ??? Lots of these bits are not implemented.  */
+
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
 
-- 
2.25.1

