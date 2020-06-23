Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4340953lfm;
        Tue, 23 Jun 2020 12:37:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNdCXtjppNCs7rJtGvJA+Kh5tbGUF7oIVAZ/v50t6NyMHLmJJQvYte52gEaiqHsHX/PL+f
X-Received: by 2002:a25:21d6:: with SMTP id h205mr22218520ybh.460.1592941041005;
        Tue, 23 Jun 2020 12:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941041; cv=none;
        d=google.com; s=arc-20160816;
        b=jLzwiV7YV0xQfm4ubtF58TKTr2mpCUTcU2ap2qa9wR6D4xzskFHJkshMaep07UUicg
         RjFALnheYZt1iLMx5zbj32ZZ/njbB5spcG+eVkEFZaDKpoe8bB0iWC1QVlvPdMsCSxCE
         l027lzU/RvXEdsxkrgFVVz3M34TOFdTJ3nnFKeW6f07JsCJQxgb/u998SfdIHNekRkUl
         OcZzAz1z2TxxL7xNEzDy/4wXYmDq5bs6OL24unGezE+To05Jp9XGV/0A5UGUY3+wrEj+
         sFBKU3J5TDPwih3/cH8m0tsZ4v6NyQJ/ItHAviH6ZtHlFV8NxbQ9fwkYR1xjBB3/Ug8p
         buEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=EvczOnAfxPHKCoq8QmzQnZTQg2ANuenqwvd4b2Y4ULo=;
        b=hIfJk8BzW0o2FzN3VMvsBVp5RdWDulchS7+Z0dGBQlIDQvFJa4wJ0swIeg7/+ucWeQ
         fES369CquS3RhfAzkkzGMrwdxuE+MP/h/GuQBsu2c81Rf5JATOljBk9B9eIIkrxzImhQ
         gjxkQQm9JLsyYT0mSwGi+t9A2upSGc04LIkDUIIq8y8jwsnxhHr4E4Z0fVmQrxZafSlB
         4PlL/bZxqDKEOkajyXkAzGiz7kUO0HnA27AT/NHqk5ie1q62LkZSYv8W9YIbP6idH2TQ
         KdE/d+svPw1TaM9pioDNdVa0QL7pfg8jQNeEO2YQVck3+W7ltPVpMx0f1NqFo4jEkC82
         a6Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="C37wksQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si17624133ybn.268.2020.06.23.12.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="C37wksQ/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnojQ-0003EX-5v
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojD-0003Bm-S1
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:07 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojC-0005VR-6M
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:07 -0400
Received: by mail-pf1-x443.google.com with SMTP id h185so10566149pfg.2
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EvczOnAfxPHKCoq8QmzQnZTQg2ANuenqwvd4b2Y4ULo=;
 b=C37wksQ/ia+O5QNVRIEnqHzhTbw+WDCqLPZFh/ejlfHjeToU0mEElUy6C0gNK5k1dT
 joJ05wjVAPEbqT8E0t/0cuLKHD2/omirCFN0wIC7/nF9RGnEiTfkRbfyrTjaXfIbGVH6
 7IwK+TELeB0BjNwKqyKmvJZ5tI2HuX1dChPHdVomQbdpOhbU8KcMdCaNpZA6VKOeJeVq
 5Lhh7jIiltMxmdyYi42KhKHPeWw0bAf/39hFL6fpuhC2jzsx+sq9TeVt94j0Pcs3frRN
 eQYDRnqjtR6CtUUcobqIoqjlvFHgD+ufaPyifvczodBBG4yNf+7lYMfDryPn5RzwEEUO
 eiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EvczOnAfxPHKCoq8QmzQnZTQg2ANuenqwvd4b2Y4ULo=;
 b=Pw8Dn3rNpyJ0xK6yfBGmLy/1CqhyJ+PoeG0WdVUj1uUHWBqWGfXTmt5YRpEnpRUc6B
 482BF9sfRMXWuyzdg+y/RTfLTWd1b0tkDYLSLuicy1HKBmTISb3LJGQf9MeNLTFCW3CD
 ZbdtPUSSdQz2InuQuJ8D1d+yKb2MRtu/mMN03brsbEGM9kpp/z74+IyyYmljxSDDHuA8
 ozEN5Hi4fzRryp4HTpaxpZ2P4euac4zySMvT83hB1HEQR9Ug27l+ZXDJS0g+IXPWliFM
 IhXJ/njZFFum5+HONOV+ViAvJvU29b6YpgkNHLCFG6fWe3i9E/kdKPI14SZF9t7ssH02
 raGw==
X-Gm-Message-State: AOAM530tUSeHiebg2GzL3dEOG/3Yu3U/+c5rhWFHVAnTV9zAJmEDoWaZ
 s+Qg1PVwOFHd3V73VSfgHpu6ArwFvp0=
X-Received: by 2002:a63:80c8:: with SMTP id j191mr17689613pgd.38.1592941024867; 
 Tue, 23 Jun 2020 12:37:04 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 03/45] target/arm: Add support for MTE to SCTLR_ELx
Date: Tue, 23 Jun 2020 12:36:16 -0700
Message-Id: <20200623193658.623279-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
X-TUID: FaaceJK0K9iR

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

