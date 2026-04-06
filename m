Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FF4F46C47
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 15:05:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9lVh-000343-1R; Mon, 06 Apr 2026 11:05:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVf-00031v-Ez
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:03 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9lVd-0003ss-Rj
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 11:05:03 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2b24fdac394so40663705ad.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775487900; x=1776092700; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uukBbBYYNyrggNOyo7VdnlUk/PBaz4ldLT648BT7MPc=;
 b=N3mK/b0MmET7r7p1v/qKL048e+Cn9MtTcoed3107+RQU4QkEzo2ZyJom2YFA2zC0GU
 FKFDA+6B7ycnvphULZcO1lLuPo7QvgJeLMKBQSaBzBbIWqsmTXK1EcM3a2J4pRakSAqw
 2FwqADjgrjzrCt/o90z9gNPfRUzgaE7VVSPb0KiJ+BMklzwy5cW6BCYB0NO3B6tkQ8WF
 MDWuvqoE9RzHECLol93OQK4BPBGh+pfIRyAkNZVlQA7qdSyDzcuuXAacUkT8HmlztZ18
 9kLb5E+l7YoZ+DOX86m4LguxtLHcnBBmu6U5iFcIu/9CL7DjRDe5ZEljWeyEgw7aXfUO
 Q7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775487900; x=1776092700;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uukBbBYYNyrggNOyo7VdnlUk/PBaz4ldLT648BT7MPc=;
 b=aQQQ5lkf6cgIumaSKeSS5lWwyaf684VCekgQRxUduSuDnS2KWpkl3OaAU7DdbVbh4W
 vUrM35JoDkdgLWcdglSnTIhWI59kZWsk/qfxOxIUvUt2b61Lu5h19LIx70KPPBDg5hyM
 N9sJliFpIslXxo1Sf7vt+YAAtiVGqFnLd6mz4lhr5tXg9ZQzqhXVWREExgApJ6WzjUgv
 Z3L6ANoNLdxEK7HNodLvK1AAp1mo9CCzw8U0ZWYkuBmmo4KdtuuWkEvyMkPLSMDsuQOO
 BbieihFLOlbGcTDdS5NDXx5xmJKU5KzQDPlNyMjg4xvan6LNtnvnq2nlsIyBAt8c0KmR
 cjLA==
X-Gm-Message-State: AOJu0YwIa35iOhcrSltMi82Yey08mMBqj4ojrODblmZjJRT/1dQUT8cW
 u6GwVv0rG3uVMZ6Qyt4ugDJaPk1EArLYOjJs2JLIkB3BXiRIWEghcXDeMuoc1qLJ5+c=
X-Gm-Gg: AeBDies+jxAJg0G4NQQUTqO1zEd6QofR5ZI8bWLgtZwTkQAHuEnqScMNFwqbTnkLj4t
 EBk7XozQrvlxmN+W+8E6ojAZt3CJ2MI61O15/zfJDzeimt5yhwA3HcXErUAAmyM9o51zQ9Ohzm1
 MX1/bWPFpJUVe2+hoq54/hXrw1sfiWfKPDP9yOHj7+zpqPDallom4kL4pIAWjdGCbFfHh/gFx7l
 I9x9xu8fbsQ4zeWEfppSLtjpFdvEYhvxsDbjhnmSmb5TG4Pf1/JL5SCI5WBtdiI5ycdKeMnTVgP
 ZLuKwduZHJR8yX85wsEtpv+g6duj/EMZUmf0wUzBNSiShXO8Blg+aLDC6zdKKW8cL3E64CzWL/0
 9eYsFqgF+V88jBq6Iz8mxBbNutC3ZOZlZ74H1qzm5HCTCTRUh16mQZSEObO/5FXqdbjD6tqBHRK
 TC8mTdC9wtzX+DPGOVKc1dVgo4elVIWnCTwUbE9avfSbhec/UraoDWFpW/2CYlasHwJOP6lw+zL
 KEst7aIQjOmHLc=
X-Received: by 2002:a17:902:e749:b0:2b0:6e12:bb21 with SMTP id
 d9443c01a7336-2b2817ef051mr147747355ad.41.1775487900211; 
 Mon, 06 Apr 2026 08:05:00 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d72sm137770075ad.51.2026.04.06.08.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 08:04:47 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org,
 jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 06/14] target/arm/tcg/translate-neon.c: make compilation
 unit common
Date: Mon,  6 Apr 2026 08:04:26 -0700
Message-ID: <20260406150434.407201-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
References: <20260406150434.407201-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=unavailable autolearn_force=no
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 5f33ecd76e0..8d9112f6da2 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -10,10 +10,13 @@ vfp_d = [
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
 ]
 
-gen_a32 = [
+neon_d = [
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
+]
+
+gen_a32 = [
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
@@ -32,7 +35,6 @@ arm_ss.add(files(
   'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-  'translate-neon.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -63,6 +65,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  neon_d,
   vfp_d,
   files(
   'cpregs-at.c',
@@ -72,17 +75,20 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
 arm_user_ss.add(
+  neon_d,
   vfp_d,
   files(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
-- 
2.47.3


