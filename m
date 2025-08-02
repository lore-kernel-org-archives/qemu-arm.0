Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BD5C87FD3
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:36:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLiQ-0001S6-Da; Sat, 02 Aug 2025 19:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgX-0006fU-N7
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:42 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLgV-0004su-V0
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:30:41 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-30174a93186so2672194fac.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177438; x=1754782238; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnUxL1l7S/Ogxnuq3Rb6QT2pyV+tUJh+XdG2c+057PU=;
 b=qYnjF8iwUZd+22UOyM/LPOOz3R6DTwT4qypIf+7F0o5EoE3cZukr2PmFqsUIWAO0kr
 MAJs39QszrvARlcXlNq/H+IlcYDTtVj9CEFBZvAVjzfmOT4X6KbdArCnlDdFWS3eOk/K
 YNXfzIcS0nX6ECXXXVg4HSO1LjMXIQPhEbxSn9i7MQoB0tlWPXUQ74bwG3/1MPcrObC7
 GI9wIZxmWRzHiMGtKvFFOTCE+6QP+ipNn643qGNZ/kapd1NU1cB8j8CPF3LGiGNl0DEK
 KO5btQmwOg8RJKUaIIdG3n4sdwYO9dkLopYD8/LAHKYPGLjbJmOonJeFaEKIiYNTSx/L
 5n1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177438; x=1754782238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnUxL1l7S/Ogxnuq3Rb6QT2pyV+tUJh+XdG2c+057PU=;
 b=Vq6tCBjQwyGrRUtdjIP6IYYX18qhtU7qi/G7VXdRHvbFUU5OqEMm59fDT8vcsmbHe+
 d/EV2JUjuKOt8Y4V4GYr78KVeZPv2RGrvMIoStMQTVVWotuZ6NU2G3owXNW9x+vUzWI9
 3MUB5pS4WFUquw5AXJpq49voFiIk3gfjp4p+yUimGyWlx5UhUFChFXWguO1jEj54g3LB
 L79BsiP2/HZAwy7GifkYoFRHQilm6WDykaLXei/DAI1dvXuKwYoq8MgaAL62XFSPYjl2
 y6u4UtkVDhrstNJ2uyW12ocMv6bJeSrOcwnGlkWnzQCto1mTosT/EnhCrQRIYwoKJ17T
 vSSw==
X-Gm-Message-State: AOJu0YzFKKtHWP5loSTlVhKoW1KJmTz0KNv7Y/k1xy8/lbhx9MsFxREO
 Xx5Q3cRYh1JPJ9WFTAjW7zfd0VNvtpOvkyJUAHZea5hTFIzyDTebm1I4H3k8L38k+h5szlURtSo
 U3AMhzZE=
X-Gm-Gg: ASbGncuqIbubj/bSDEhfzofGMrBJTFPTtQEyCvCSWar6wQo+z3s0OKTLMJc696NDqhz
 DyD37Xogfm11adDfD3VoWuhF3oH54bpOB/87LPSNgQh7BXrcWMd8durEq3cfZriQ83wxbeAQQeI
 mEtbjFwWVPcMnfuZMN/L1ztoC+mnR7G4ZCjfgyV0YImSVv4q49D+/4rC/gsU36F44/3ERHtkS7M
 1EoJydRoBKBwF8lqgdCfKxpRZ/C+IXUX6OfIgolTIM85qco3sdZeLtEfZhRm/H2eN3yGuRdqFfm
 Gg9sdrfY0Ki2T0KbkzHCov+fBX0jWrTMmt4iUKEbZQ49hFzIIdU8CIT4E+BbPQC8e06AVxrsUNP
 dEnop7yi9n/uKa9r3KRzNc0ED/gP+mmon1D6sMBDPKQR842Nlxbsv4NBmMmFAAxg=
X-Google-Smtp-Source: AGHT+IHoiu6XO5QRvLVQQTNGMtzF4JzaCSclU5xAcnXUA2FCeurFHBRdoFP9byfWuBF8Evciwx1obg==
X-Received: by 2002:a05:6871:a701:b0:30b:85a0:eb66 with SMTP id
 586e51a60fabf-30b85a14575mr529391fac.12.1754177438431; 
 Sat, 02 Aug 2025 16:30:38 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:30:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 08/85] target/arm: Skip AF and DB updates for AccessType_AT
Date: Sun,  3 Aug 2025 09:28:36 +1000
Message-ID: <20250802232953.413294-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x29.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We are required to skip DB update for AT instructions, and
we are allowed to skip AF updates.  Choose to skip both.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1866c494ef..efbad7af1f 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -58,6 +58,12 @@ typedef struct S1Translate {
      * and will not change the state of the softmmu TLBs.
      */
     bool in_debug;
+    /*
+     * in_at: is this AccessType_AT?
+     * This is also set for debug, because at heart that is also
+     * an address translation, and simplifies a test.
+     */
+    bool in_at;
     /*
      * If this is stage 2 of a stage 1+2 page table walk, then this must
      * be true if stage 1 is an EL0 access; otherwise this is ignored.
@@ -1929,7 +1935,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
 
-    if (likely(!ptw->in_debug)) {
+    /*
+     * For AccessType_AT, DB is not updated (AArch64.SetDirtyFlag),
+     * and it is IMPLEMENTATION DEFINED whether AF is updated
+     * (AArch64.SetAccessFlag; qemu chooses to not update).
+     */
+    if (likely(!ptw->in_at)) {
         /*
          * Access flag.
          * If HA is enabled, prepare to update the descriptor below.
@@ -3553,6 +3564,7 @@ bool get_phys_addr_for_at(CPUARMState *env, vaddr address,
     S1Translate ptw = {
         .in_mmu_idx = mmu_idx,
         .in_space = space,
+        .in_at = true,
         .in_prot_check = prot_check,
     };
     /*
@@ -3653,6 +3665,7 @@ static hwaddr arm_cpu_get_phys_page(CPUARMState *env, vaddr addr,
         .in_mmu_idx = mmu_idx,
         .in_space = arm_mmu_idx_to_security_space(env, mmu_idx),
         .in_debug = true,
+        .in_at = true,
         .in_prot_check = 0,
     };
     GetPhysAddrResult res = {};
-- 
2.43.0


