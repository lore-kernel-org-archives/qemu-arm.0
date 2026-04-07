Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600D0FF5138
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:03:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaZ-0004O4-7M; Tue, 07 Apr 2026 15:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaX-0004KL-Ke
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:53 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaV-0007RI-Vr
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:53 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-358d80f60ccso3518550a91.3
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591991; x=1776196791; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U5qEYDYbzP6gv3T4kUPVLqSQIA87qzuUGpDgD/WJ/SI=;
 b=p/keu7koIJNdjJUmFrUazSH1F4eRkMFNq13ngCjDgd4lxFZAErICKiQ/IVZmupX39R
 qbNoXE/hIW0+34AOdcVCxmofbeD//zl0frQO7/3g6UTW+PtRiQBeMPLuIUCFd87HGLxh
 jjqk5A9xtGFKchLMBZunX9X7a+3jdzOJgnpBxBR34ltSNa2Z+kz2cuLLX1t3QM2muQou
 cOoARyez7rEr3Dqk7oRtlkMU1AfrJ0yHRKfurzzkDAUINyMqW+J6qweqnFkioCOakKS+
 zV0lYSoanQLHR0Nc22/++yW/TvYr0El46x983NSfUmTgORftxShZnlGOooeu3ka5X6TT
 KrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591991; x=1776196791;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U5qEYDYbzP6gv3T4kUPVLqSQIA87qzuUGpDgD/WJ/SI=;
 b=QazPMkTwmxfwpjnJ8BF4YYW0+HopzgwZw7Wy8lSc8WFuSNxlL1gYybhljcPhDAaDI/
 ZiFKaRqPWRkzv1UFXSjujeGXZFZrXVlk6qGfCQZSk9XZx7Qx97RokmAPwu3AuHi/Jfem
 uGOLE4avVxZL37T0QN8E+mMq657jgCLKH0bIW/KpastYSu+ct7gwfVE1UdxptSj391EW
 xXsXEQm0qhEfCOsL80GXx96wETsd8ypJ9K/92W8kXO2YeOJyWMTqv2A+OYBQ0bN31RuU
 10OPGkq6jXDzJpZ/pKR2rWWWC3vwRf5Wv5dYipzKg1/9+QwgncoHQSH7iN21VCz/U5Hb
 Di1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgVhhVz1IvQsp1nHTr4ZDN1V2BVuJlwZSQgaXfCYfV5VpbGPZd0nhkHFZpEhAtmEAz7JGSeczxZw==@nongnu.org
X-Gm-Message-State: AOJu0YzrsH96sF232o18aHF183R7ThC8y3+RA2Q7SyyQcklubXlEnQfE
 AHJmhERQ4+BToBMawpfk0Su1QQZFljs54xwqyDaJEBtfom/ehTD4/3CodHYOLajSE2t5zf6Ey5b
 3egcfUFc=
X-Gm-Gg: AeBDiets2spMKAc8vywW/AEmKfozCjhGjNQLxS6/NAODNQe0ixLLmSHUBN6pmVHYuif
 rvOWjJLofV7XxMPikWrxnFzZFCZBQrp7jBqV5q2IzbI1lYvLkwKb5enZHB6FTfvqEc7cY0fEr3T
 pfGVV80xug9wW/s9teEX946PExmewLPdJ8p+ecZsueUBWALBksvJZqKX0RkWcIq/S1dZWIh5ob+
 9nxoD1AWkQ8P7HHq0EbLyCGOpcOStwGqiBRAmTnZNn1JKVs23tGR1dZ03shcLMxggZyNKKjqNtH
 P9BRI2/BSKCdGaG0066jJuaTKYK0SPDprDVmD5cmK2L2MKFUX9hDF1MJ/9/ZUZbBzP8E+POMTCg
 +MD+5cv8325vpPz8MNlfE+yvdaTuvJpCPiaMeh+V9MuFhXod6vjWfRuNO7Er8jD4M+zVpcyVPTT
 wi2gI+1v0WYc3FOZbMVpoxK67uESh2Nb23N0bqSwp0Fd4fQ81lq8/gxCvXRAHpRdnbDrlQncIL3
 c5c
X-Received: by 2002:a17:90b:3d4b:b0:34c:c514:ee1f with SMTP id
 98e67ed59e1d1-35de682776emr18252335a91.11.1775591990507; 
 Tue, 07 Apr 2026 12:59:50 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:49 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 21/21] target/arm/tcg/translate.c: make compilation unit
 common
Date: Tue,  7 Apr 2026 12:59:22 -0700
Message-ID: <20260407195922.196410-22-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1035.google.com
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

We removed all target specifics, and can finally compile this file only
once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 0740de92c1a..506f031f1aa 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -20,20 +20,18 @@ mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
 
 m_nocp_d = decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp')
 
-gen_a32 = [
+translate32_d = [
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
   decodetree.process('t16.decode', extra_args: ['-w', '16', '--static-decode=disas_t16']),
 ]
 
-arm_ss.add(gen_a32)
 arm_ss.add(when: 'TARGET_AARCH64', if_true: gen_a64)
 arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'translate.c',
   'm_helper.c',
   'mve_helper.c',
 ))
@@ -66,6 +64,7 @@ arm_common_system_ss.add(
   m_nocp_d,
   mve_d,
   neon_d,
+  translate32_d,
   vfp_d,
   files(
   'cpregs-at.c',
@@ -77,6 +76,7 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
@@ -88,6 +88,7 @@ arm_user_ss.add(
   m_nocp_d,
   mve_d,
   neon_d,
+  translate32_d,
   vfp_d,
   files(
   'debug.c',
@@ -96,6 +97,7 @@ arm_user_ss.add(
   'neon_helper.c',
   'op_helper.c',
   'tlb_helper.c',
+  'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
-- 
2.47.3


