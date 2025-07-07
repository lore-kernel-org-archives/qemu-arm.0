Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF8FC8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:06:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsyc-0008Hf-Qu; Mon, 07 Jul 2025 17:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsL6-0005GA-Gp
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:30 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsL3-0004GB-5p
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:23 -0400
Received: by mail-qk1-x730.google.com with SMTP id
 af79cd13be357-7d9e2f85b51so29944085a.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919678; x=1752524478; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LzMBUEbl+3VWF66SKBZpNZgDJtHw0n855alyoLGWaQs=;
 b=fB9dquTq3WOahSBtWIYwUFaDJnKf0sUAtJILoTu7yGenyMSQa9Kfz9dPO2EIXq5996
 2K2ej8JcKF5vW7BYZUp/iGbcxovR1WxBbmM4R0COceBZQlhZXkJzh3g/sgAaq7DMnx3R
 0DVMV5TslFQ/voafukNnXr/ClBRXbc7KX311xpi9g33sRaL3g+Nz5OlEdiHVvYAhhSHo
 uGPFWPG3Xfp0QD4bbpGDK3ft/an4IK5d0XnzLhPCR6KCWmGl0omaDuTbRAQCeesPUfAk
 K2f5ziYXh67KYsovzf+sBhw4y9ceQ0zi0GxnIedcxQsMz0X9wSHhPIBpylafl4qqJy7j
 SxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919678; x=1752524478;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LzMBUEbl+3VWF66SKBZpNZgDJtHw0n855alyoLGWaQs=;
 b=vcI1p0C1t6aJH1IK94vGRA6gXfTL4WFk2YL9gPAy2IaSTWEj4hgTswu3rULI2fhqKG
 RleuLqz7OWwkWk4UMJQS/cFm3JiZxbXomXB2gWoAFvREk3H2azMcUQfxmt2KBf/Z5DFB
 8+i5MFnFEzv1rbzKtTDOuK5vPKMkq/7zypahTSKyQj41JPavEwJDlYyXz4AePpVQvtes
 NklEVXAIUtkbqfxQocFgb5hPqRUAlTeXBcXSPt+HmCC2IMKhuC80JHLhNY90OJlhgzcB
 n8+4NtB6MfodO4su2sqLsEYBe9AOZ3kAV70IE2zoLEslKqTHXa0YZmIzUN2qHOKRaLco
 NBSw==
X-Gm-Message-State: AOJu0YzSUWJXQUqUgrl9NBQ/tfoC4poIH/yt9H7nZDvGuAng4vbLvbMs
 rq+UZYg8+IHh/p/Fdy3pl3peAedvvKLEtrg1IOQQTcW6WmHcBp6u5+onhiC3px0GM18=
X-Gm-Gg: ASbGncuj1mwY1liYd0Cpiikan7cTSk+1g/WIU2YHiQuPYTCVSkvYFS/qWS8XPsX8Jbj
 btDbJSxh2Li/Lbv1xzN1u5S3Arn+a9jTzsKrongsLTSJDoDvC+Io0A8Ij3w8HsLQ2ItHoAtncDQ
 KmyaJdDHnhQcK3H6i45iAOJoTYwOO/0R4w8FTIeMQaAKlitBGwofHTPxPanp9huwmSRwKSdbJNC
 YYeKMlqLDYmBKhEUn8mkPQgzmVOlgi8bV3/02+NWtcsa0TPBYBjLRfUP25OW0THWYPe1e8oVsbC
 8j7GUNgI6UGPX+wZKE6TM8Ut6F2ZxEyYb21mSOk1J0f7iMnC7w6YDDjlGRnu49/LU+5ejrl04gv
 xcvG6WWhe6UfeYcps
X-Google-Smtp-Source: AGHT+IESCbZ3ukPiWIgaXRqsAEyQ1DIGhWLKyM9EvGHIfnry+3ZdbUVP5Mv9VqbF5afDc1LIDzPYNQ==
X-Received: by 2002:a05:620a:4885:b0:7d3:8ba0:614f with SMTP id
 af79cd13be357-7da034a5a72mr70375585a.26.1751919678115; 
 Mon, 07 Jul 2025 13:21:18 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 02/20] target/arm: Convert get_phys_addr_v6 to access_perm
Date: Mon,  7 Jul 2025 14:20:53 -0600
Message-ID: <20250707202111.293787-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 760387b4da..39ecc093a5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1103,7 +1103,7 @@ do_fault:
 }
 
 static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
-                             uint32_t address, MMUAccessType access_type,
+                             uint32_t address, unsigned access_perm,
                              GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1243,7 +1243,7 @@ static bool get_phys_addr_v6(CPUARMState *env, S1Translate *ptw,
 
         result->f.prot = get_S1prot(env, mmu_idx, false, user_rw, prot_rw,
                                     xn, pxn, result->f.attrs.space, out_space);
-        if (!(result->f.prot & (1 << access_type))) {
+        if (access_perm & ~result->f.prot) {
             /* Access permission fault.  */
             fi->type = ARMFault_Permission;
             goto do_fault;
@@ -3513,7 +3513,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                                   memop, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
-        return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
+        return get_phys_addr_v6(env, ptw, address, 1 << access_type, result, fi);
     } else {
         return get_phys_addr_v5(env, ptw, address, 1 << access_type, result, fi);
     }
-- 
2.43.0


