Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4198C44515
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 23:26:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkrts-0001X4-FZ; Fri, 17 Jul 2026 19:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrtr-0001W6-EG
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:23 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wkrto-0006yo-S7
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 19:23:23 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2cf41bab353so8709635ad.0
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 16:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784330596; x=1784935396; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JU4rrR299+XISy9LcAmasYIokW518EoY+ALWFUyVnMI=;
 b=wISbja5fsNzhH05Ke1YWjE3YN8lVnpAtdLMXqetUZHuVaiQMZeMh4OjsS47f31sNEg
 tEJlNZ0KlLgSHKXVyiii6r1a+MxHSQuzZGqkS05k7zbg5R2tRD9yG+C8hzh4ZfavcTrk
 +0x5M8n06P4TzR5R7Rjvuh1wkMKi7/CvQ++hqHfzoZSbgbD8nBPa8XhnNUzjLNIhiaCB
 IOU9iG/WpsEoPPGFj0cJWkx7x5qvF23bSmK+iGU7GbKRVSbmDYef2fOk5q43j26q0En5
 Zdtmw7ckIwgQnIJ+tT0e2GWYmb75FdELMsHcjgQQTTJyHEEzM2+3EOkRgUpWRVimwbgr
 t6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784330596; x=1784935396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=JU4rrR299+XISy9LcAmasYIokW518EoY+ALWFUyVnMI=;
 b=bxJiHSyVp6gBj35pWsfck+NeCsRyMZajY4lOc01eT/uzbqT5msPwC8yK4FQw3OTcUR
 L10UauFIzt19PoX+UPNxasNDiE7FRSpVzjazpHlh/4rsIFPCrxzN6R8sBQlIalsvlKbA
 kM97aFKQlvkZuU76tdLpws5m6FdMc/qHvcp8JSGfbnP520uM3MeVphAtcNf4HIZOpv77
 3sq9y040HbZA3dXaKG6KPUZTKI6MSf4BZxWiEu/+zFe7vlb5udTBMtH4ae3YzIkSOkSV
 O4FPaT7ULm668hOWYz4J6u3sUskQ4Hx45KCg9fRm3xTyGOXN5JPcvA8yve/sz2MK5mvw
 bLdw==
X-Gm-Message-State: AOJu0Yzur/Ojt5Ebf1lj32BLVchCSu6LCK9Ay4ajVFRUfJjbEb2AfmwM
 RJNwRv04GoWv9Ow00dz+53UJCjaGyRIHSd7vYxP+ttDiEPqOB0dD93n6xQEV0YnQOto315zGsmF
 jFpFE
X-Gm-Gg: AfdE7cn+flH2Q6Y2u2GzB0VcL5Ju5K4P75NFJSffYmHDp4VogWzr0TavKVEHDUFezw6
 /U+aPws+MQUG4VKt8k87FRYeuCYturcHO7fHcsWAoExprDfiQ30tA3XHyC3emsDkZ00VEDPx2rM
 o7I87wZyCBDP8BTA2D88aW+EqaVEQ7h1q6ShSvNehw92Q2ZhrJXO1YcTryljBzPz2UFyjxbO5ap
 n3u5sbqV8rWFnsSr177x5HawRQK/OUTGquom3wDZ8HcLdIyz5Ypzp1719AXGTwL+vMvYtpUM8GF
 l+JkjcVe9Vvj4bLXysn8KfSCfAXME6MtZwUC+cR+39saYBWr/vDu4rrxyVdIu/KiZZ9dZ/HDnT2
 HUymx2MXJQF5M1nf9Ko4fi93zZ7h2bV+Q/T4Og/hpr3IW4obvxOUmVeAmsx4rKq7HJuzxUwG+uC
 EUwqI201Q=
X-Received: by 2002:a17:90b:5588:b0:38d:a150:ee04 with SMTP id
 98e67ed59e1d1-38e4b55aabfmr4944229a91.30.1784330596237; 
 Fri, 17 Jul 2026 16:23:16 -0700 (PDT)
Received: from stoup.. ([32.140.233.50]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13ce2a18a47sm8186261c88.8.2026.07.17.16.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 16:23:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/17] target/arm: Simplify invalid page test in
 allocation_tag_mem_internal
Date: Fri, 17 Jul 2026 16:22:54 -0700
Message-ID: <20260717232306.378988-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717232306.378988-1-richard.henderson@linaro.org>
References: <20260717232306.378988-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/mte_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 905e9d7eaf..8f7a222b9c 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -133,10 +133,10 @@ allocation_tag_mem_internal(CPUARMState *env, int ptr_mmu_idx,
      */
     flags = probe_access_full(env, ptr, 0, ptr_access, ptr_mmu_idx,
                               ra == 0, &host, &full, ra);
-    if (probe && (flags & TLB_INVALID_MASK)) {
+    if (unlikely(flags & TLB_INVALID_MASK)) {
+        assert(probe);
         return NULL;
     }
-    assert(!(flags & TLB_INVALID_MASK));
 
     switch (full->extra.arm.pte_attrs) {
     case 0xf0: /* Tagged */
-- 
2.43.0


