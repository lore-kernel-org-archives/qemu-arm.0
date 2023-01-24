Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294556ejc;
        Mon, 23 Jan 2023 16:02:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu0si21UWRAiSPwLhI2l/mR8M9Hurn/H3Qt40pH/TPj7fI0Cghgs7rZ93MDdQNFw5L8A3ou
X-Received: by 2002:a05:6830:1498:b0:67a:1598:de18 with SMTP id s24-20020a056830149800b0067a1598de18mr13801688otq.6.1674518530472;
        Mon, 23 Jan 2023 16:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518530; cv=none;
        d=google.com; s=arc-20160816;
        b=cZz7bPEkZwu6DWjoZsZui/2rOLM/Yi0kWYR7B6sbCj6S5FIbrsOyjke28Hdc15I/HT
         oBspkF5wpPMt0+1D55Za8FgF7mGmlo5aA5d9SmNkn/4QXZNkmNKoW9tgYzG/KjlJFJP2
         cv/BjmFC9INjdGuJ+Zod1p/J0z7Bl5ktIAfgbF6JGOOQ7sbaa3PXrnEXNVGQObdA6jgV
         R8zHaCFWWcllstumqc9G64EWjFYxVNYyba94FwOrCSpOaCFBTvj09f77Puds8JNDvPrc
         JoyoTx+ZwenMiCCYmlAeSe3tOQIXAfLuO3C5vlw/n6fvqcqV3P8FjpVKkRnQtxVuB71j
         rBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zT9ks933YUCHx0wzfAy0gOfp0dAuk0lKbcEhOOr94PI=;
        b=WA3qO17IEkwF4QhENNm62BxymNuRhNIEvUcpAVGtVS5kSHcBSwoZ55z+dGLW9osIOs
         FOYRHGvdFoe8b10zEIFSJgQAkUL0GXlOM1in9f6PfVxsCt0HBHTL6S4PhfO3yfk/mJl8
         HFAu2vPeCbp92AR4cpDEF13YS4XZLzH55y5/KALdQCO/2GuYxKhmtNGbtE+dKZ2znq1J
         EmmRzUPfMAV9CCEBOC5vnlpErwYoY5XhfiaikR+qnbDnFgIi13cgphFpHqSIkDJDlQ9O
         LF54R/L1r1Fs3mNv9WVa4RLyxMf15B1mUmuRTe2m2jlmM9GcWYbbKyKCpkOGiPKtbilP
         HjAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GgE/umvE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h123-20020a375381000000b0070677776aefsi440683qkb.674.2023.01.23.16.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:02:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GgE/umvE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kM-0000HA-Ss; Mon, 23 Jan 2023 19:01:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kL-0000BU-P2
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:05 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kJ-0001td-Mg
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:05 -0500
Received: by mail-pg1-x535.google.com with SMTP id d10so10220361pgm.13
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zT9ks933YUCHx0wzfAy0gOfp0dAuk0lKbcEhOOr94PI=;
 b=GgE/umvEtUJcw0PutPqsQC1Z4PPOlEnJxBjuXLX7wEn9Kf3Y1DHfxqq9x+lf//IaVr
 ciQvabzZXJegZ9Rl9yPTFMWcK0hJtAmZE6T0hprtUjOD4TMaVcaNjGcmqQ/7RG6p5vOE
 X9+knOAfs2nwEVW2KNJY1ywtC+/81QJbOuAjJM7aEX4YDmVbym1f0/pOSrYSUkkV5aB1
 tdnMDFMVI8BPt2QCxMD7uEoH89/XD5LpSRUNiRMfAPDYtnBWjvzwWAXpfCmDU5c2+QuW
 oE7BsBXIWvZ6pQASmULUggJwbUMOLTkDM2BnrxTZfFzTV8qANi6OYqsfdcExqWPsuXf/
 PZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zT9ks933YUCHx0wzfAy0gOfp0dAuk0lKbcEhOOr94PI=;
 b=paNCucVW1vJiA4Hq1++4slaoW6HQLUMvTLNI4l+6/hvLHBLGpvhG6xLEKGwPqaymkt
 /ePFJWI8iblH5CZ3Vxnx+TUmUrWEkgP9HncVBQB5hvPvU8Kt5n2o3J674I2nIc122Jtw
 3eIUihWk/wu33OKYXF40RHCVA8RcZDUtD/nh83dMRb22ydHuwQKwIjtulbHvjA9qCe+A
 YGTFUtQxzvMjRXI/T32pEf866+My0jE6ENx8cc3mvkSQghfyQhuh0r/URHIYHHDLY56e
 h/Uie7vH0xu5LfrWFqX/+rqa4oD3cIqn3vYjAMuz5LUA1DmwP82kTxjlpK+ZMgZGiSS8
 OFAQ==
X-Gm-Message-State: AFqh2krhneAgS57dcC4zkO7Pb0Unzu0dA9CgSlfk3B3ZzQEZ2zULwuzE
 9XBG5qDRvYfbAFV3sQZqMO9MgByJpHo6DQnR
X-Received: by 2002:a62:1751:0:b0:56b:3758:a2d9 with SMTP id
 78-20020a621751000000b0056b3758a2d9mr27115102pfx.21.1674518462315; 
 Mon, 23 Jan 2023 16:01:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 09/22] target/arm: Adjust the order of Phys and Stage2
 ARMMMUIdx
Date: Mon, 23 Jan 2023 14:00:14 -1000
Message-Id: <20230124000027.3565716-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O/E4/i6aeFe+

It will be helpful to have ARMMMUIdx_Phys_* to be in the same
relative order as ARMSecuritySpace enumerators. This requires
the adjustment to the nstable check. While there, check for being
in secure state rather than rely on clearing the low bit making
no change to non-secure state.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 12 ++++++------
 target/arm/ptw.c | 10 ++++------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cfc62d60b0..0114e1ed87 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3057,18 +3057,18 @@ typedef enum ARMMMUIdx {
     ARMMMUIdx_E2        = 6 | ARM_MMU_IDX_A,
     ARMMMUIdx_E3        = 7 | ARM_MMU_IDX_A,
 
-    /* TLBs with 1-1 mapping to the physical address spaces. */
-    ARMMMUIdx_Phys_NS   = 8 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Phys_S    = 9 | ARM_MMU_IDX_A,
-
     /*
      * Used for second stage of an S12 page table walk, or for descriptor
      * loads during first stage of an S1 page table walk.  Note that both
      * are in use simultaneously for SecureEL2: the security state for
      * the S2 ptw is selected by the NS bit from the S1 ptw.
      */
-    ARMMMUIdx_Stage2    = 10 | ARM_MMU_IDX_A,
-    ARMMMUIdx_Stage2_S  = 11 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2_S  = 8 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Stage2    = 9 | ARM_MMU_IDX_A,
+
+    /* TLBs with 1-1 mapping to the physical address spaces. */
+    ARMMMUIdx_Phys_S    = 10 | ARM_MMU_IDX_A,
+    ARMMMUIdx_Phys_NS   = 11 | ARM_MMU_IDX_A,
 
     /*
      * These are not allocated TLBs and are used only for AT system
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 437f6fefa9..59cf64d0a6 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1410,16 +1410,14 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr |= (address >> (stride * (4 - level))) & indexmask;
     descaddr &= ~7ULL;
     nstable = extract32(tableattrs, 4, 1);
-    if (nstable) {
+    if (nstable && ptw->in_secure) {
         /*
          * Stage2_S -> Stage2 or Phys_S -> Phys_NS
          * Assert that the non-secure idx are even, and relative order.
          */
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
-        QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
-        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
-        ptw->in_ptw_idx &= ~1;
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_S + 1 != ARMMMUIdx_Phys_NS);
+        QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2_S + 1 != ARMMMUIdx_Stage2);
+        ptw->in_ptw_idx += 1;
         ptw->in_secure = false;
     }
     if (!S1_ptw_translate(env, ptw, descaddr, fi)) {
-- 
2.34.1

