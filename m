Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D91F46C66
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Apr 2026 18:28:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9oei-0007QL-IK; Mon, 06 Apr 2026 14:26:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeX-0007KT-Hd
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9oeV-0002Lv-Tq
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 14:26:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-354bc7c2c46so2512720a91.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775499982; x=1776104782; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0wgNLa9n9Vgc0kuCG4RsEiFVidf8BLE6jw9JT+iAmc=;
 b=rnAyOWAsZkIqWa3P7oz6UaGzxadOECYv4+5hXvo2gJMcAbMxjQzMNhI1QVfmCfvnae
 FHZm3+x+GEupDLlq6rtZUKDsfSxDpviDPa+670hbrTwGFotPgalvfnibstSaFmLE3JZ3
 vk4V6lBRAEdjFwBDCEZd4xCWcPiBEckH8Qt9OdnSA6TuOZVFoj43eloGcu6WpDtOWlp7
 2pQh4prnkqx4212fsczG2E+qNJehUsbuhkGtifEoz3ebV4waScscmwNaxW7hNxEgCd3w
 MfC5eB8Oa/f0yYZdXleLSPwFe+jRXQVUsQGVIM5XHxNeWs0E446aByZU/a4UMyuXBtdq
 tSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775499982; x=1776104782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n0wgNLa9n9Vgc0kuCG4RsEiFVidf8BLE6jw9JT+iAmc=;
 b=bGbpJh/T5dxZFhuouoI8BGnGu+wymA2lpqdXxT9sHuyVmPWhucrCYRBb5gp580f2jQ
 vRU7NPoVTgzPEuD4OGDH67HNN+GayjLjX10Dw4a/sDOnkh7Ez2LChKWStJK2IGH7WvNF
 6CmwDMOtrnMBYI6qQtEjCVvK3ACN/gy41t5zwEnulcwh+edPBFY0cAzSSg7SX21h2Ug5
 G532nW8igWUACWa0cuRELljkN/L32XQ1Qi3otDG63cqr6qux8f9509cayATeABCaKQa1
 MdPsMoepfWCApDzyw2dNyOjrm4xk0G86dOKxMa9ns/Bhlgtcnt2lwUb8cvVtZLwxtRvZ
 ICww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL7fHY5pMybN8+/rDPMyaUFVvSWEGfrn6dSiaM/Z09kZOo60ZUsS2AqSrC1zpOGp3arJgTfkrkWQ==@nongnu.org
X-Gm-Message-State: AOJu0YyAjTxKHMPWZvlWGhyZF5K50QLxaqdvDiWuSFvwUDvysbYrK13B
 yV4CofJplUrJuE7EIkpsjeqYjQgu5uqZR9M0NeFfJBjxULybR8f/NCh8/8BuAh/73MA=
X-Gm-Gg: AeBDieslOGfu+eTLUhKqPuBtmA7bTOv2coiaswFeOcsEr3luuSaOtT6Fs4eq9c3VHN3
 UuMyMNq2CM0j6AGeeE3aAHSpTcnMZD3mx2rDYIMjiKUChUICRaQtuw2TtV7wJrOx9NuCq40k6VC
 itayT4vIsl4EzTrOtxpW3BdRjd7TC9KaMtOI1heplky8AB3g0d57gOSowVmsjoc3tthZL4rH9gt
 d40lryRp4wPzIysXeO8w3H/aY5jkQSxUjXqOLfypflDkGVvCbtyfyQztS86ObwhgqBDbX3cToj/
 SuPHhJA/BrJBB46RLhGWFpyboxiYoNoCcyTmywjzc945x+ohKCUr7vDYKyWz+56lh+dyJY38C2I
 vwicquBLlV1/oNJvS4YYv1pCpjDw9N7cQQTiO4OJLFPNNoJM27gJVJEhdXnX7G2Pi9OxbmMD2FM
 tGeL7mLj84fB/42iohGO0KCkyKTLMpggnH3oG6uXzRLcyQeb0jSHHLpWKtcRB7X8WrdNCapCC58
 4Th
X-Received: by 2002:a17:90b:4b89:b0:35d:a9bd:1ff6 with SMTP id
 98e67ed59e1d1-35de695fa86mr13044803a91.23.1775499982363; 
 Mon, 06 Apr 2026 11:26:22 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c6561fe9sm12765080a12.15.2026.04.06.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 11:26:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v8 05/20] target/arm/tcg/translate-vfp.c: make compilation
 unit common
Date: Mon,  6 Apr 2026 11:25:54 -0700
Message-ID: <20260406182609.193886-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102a.google.com
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

Generated decode files must be duplicated between user and system, as
they are generated in private folders per libs, and can't be included
otherwise, as meson does not give control on output folder.
Indeed, meson generator is a different approach than custom_target, and
this is a limitation by design.

They were already duplicated between arch variants anyway, so nothing
new here. They will now be compiled once for system binaries, and still
per target for user binaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 3e96c77df73..5f33ecd76e0 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -5,12 +5,15 @@ gen_a64 = [
   decodetree.process('sme-fa64.decode', extra_args: '--static-decode=disas_sme_fa64'),
 ]
 
+vfp_d = [
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
+]
+
 gen_a32 = [
   decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
   decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
-  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
-  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
@@ -30,7 +33,6 @@ arm_ss.add(files(
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
-  'translate-vfp.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -60,7 +62,9 @@ arm_common_ss.add(files(
   'crypto_helper.c',
 ))
 
-arm_common_system_ss.add(files(
+arm_common_system_ss.add(
+  vfp_d,
+  files(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
@@ -68,14 +72,18 @@ arm_common_system_ss.add(files(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
-arm_user_ss.add(files(
+arm_user_ss.add(
+  vfp_d,
+  files(
   'debug.c',
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
-- 
2.47.3


