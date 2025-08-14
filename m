Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF89CA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:17:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXXP-0001Mi-1y; Thu, 14 Aug 2025 08:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXN-0001Le-Eg
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:33 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXK-0004CY-4U
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:33 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-323266d74b0so802623a91.0
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176307; x=1755781107; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnUxL1l7S/Ogxnuq3Rb6QT2pyV+tUJh+XdG2c+057PU=;
 b=NRDPQGx1ul3iqlXKzAN9IXJK3LbThPD+Jjz7u0RTP+BtkLiUHLENzid67z+thzyV3/
 7JRl9StfYn9ylyqndYdkIufCFSVjVA4FgiCp01cbOi0ceRjclyMzTg9cyvTiUSKOeglU
 7fV/9fbfuO6zoho019f4WhgOY+3hPs8moqaY0JEnpYnNXAefwJhw1NechAdZbafcOzE6
 4aDRZnHOAjLYj8t0icCx81PlDtJud9VPoFbOd4zI5QMZ9B+jgK1iNF5hGcGvogbB0bD1
 2PAyI/J8goWghVnodpoKA7EdWtrexRKYDMfAJGWzsLWlr71rPI9oyRlWGJav0LQ6A9rQ
 pwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176307; x=1755781107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnUxL1l7S/Ogxnuq3Rb6QT2pyV+tUJh+XdG2c+057PU=;
 b=kF6vzt1uQF3n++u8FAyE305mcPsJOr5bojxzUBdHWjsNfd4aWgR25ur/c1LK3aI+gI
 eVBsqjn9i5QVTMVe/F7xNFx4KON1KusAwJGIRdpPQ59CgNKDvVopsoRB/aQvMKfcoJOX
 ZVW4Vg9GFdbep9Xd+BREkeaDoGrvvGSZ3QAiDaijGIFZ+oWAeFvDzQUmO/bwk1A5nNPN
 dyoVTlkl86uVhOz9m+OR//Wxpk6qp89giQN3glr8cgwF4rU/02QzWdw0O/NAfIQbn2bY
 ZQyeJ7v8tF02ELxwo+kRCzxZdw/tk73LEaG40F8aVcrsAr+mz6+/fhcz/tnvtQ7E9NpB
 jyHg==
X-Gm-Message-State: AOJu0YyxidFuh3MUtjspoM/KwFMPVE1HF37Yrur5jZGGnz9TUi01rDf5
 xSi04EE9E5w1mLkgYK8rJfoMWRJ3UuUtsYXBZq0c4F3BbMC59YA28CfI/LicmrG+xs1i2W2Jd75
 ujs/EAYo=
X-Gm-Gg: ASbGncvPMcfGSYpyaK4/grf6px1bAz2eO4L0lovRSW6SECknIghW7pWg063bBIlAclf
 n+R8q7le1C4gUCfuGX1QNeT8T9sZHku+PFQfZgxYrfwvLyknpJX52Lt4R+FOmEme+uC94REq2hg
 z7YU5iNE36zbTA5cwnHvMD4Givam8skAlCgaXUYqG22HNvv3wp77sXmCURizqyulugWvcWS1kNU
 8paKW6KstDES7VhhX/sdy6gz4ExmisqarIv1IF68AhKtfO1I47bcq60is6p3AvLNMdgIMjlUGkC
 0z4y7poc//c+DZekOrLGliaoSoIWMdrznVAeCSmleKo6f4w6/a2Tf3EetO5V530RhhhD/FY6bNm
 mej2WnKag3fD2NMnhn4G5ZY5KKk5NzHSTgAADqwol7ZhcunEEsa8xQ8y9Ow==
X-Google-Smtp-Source: AGHT+IECq0JE5COud0a+nzlFdnsijjbMdL0xA7g4PhadWGlBtWnVyjtO9zQPvjGS9wyG+/kyrlsCfw==
X-Received: by 2002:a17:90b:2b8f:b0:31f:22f:a23e with SMTP id
 98e67ed59e1d1-32327a9455amr4348588a91.27.1755176306889; 
 Thu, 14 Aug 2025 05:58:26 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 08/85] target/arm: Skip AF and DB updates for AccessType_AT
Date: Thu, 14 Aug 2025 22:56:35 +1000
Message-ID: <20250814125752.164107-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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


