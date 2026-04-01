Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B7A107639C
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:23:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8186-0006h0-SW; Wed, 01 Apr 2026 15:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817y-0006WA-G0
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:22 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817w-00032D-Ta
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:22 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-35d99bae2ebso47362a91.3
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071280; x=1775676080; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0fDP2nwiyg2vZwXC56hH/sK/HIplitCN3e2/hegKD5A=;
 b=eFabo77AS9XuZyW7b5BndYU5CmiX84S0HTzWt//qmq5uQ7dWl30FSZ8Yy78nwVbr/3
 tJ0AbFDzcafp7mRiMY97Vzs7rmwoKdCqlXMazJj4UuwfK34TbXbhYcduo0OpwkjxFpRO
 bZFBGBeg7qkcpxk4eIUubHEEAoZySr49aUfpjN/OW0VlLlDczvZO8SuEyrbDokaJ3WIe
 DueiNtueUNr8hzREpXhYAvuFM8LMkPyBwv/wST8GZkpdNe7QfoWj0jimse+5CDnxTuDz
 h0PZq2zxfFuG978/Y6oJyu6aOSXPcBpR/MKepvYlmYBh9kjK0kC0tHz4AGAfXwnV2Cva
 HHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071280; x=1775676080;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0fDP2nwiyg2vZwXC56hH/sK/HIplitCN3e2/hegKD5A=;
 b=mVsz/MplLxkVl2uMnRkHa3FSAXsLs43Ap6wbLAJ49b/BpCKDCGcpVgCoYJgqep/MAA
 NbaBPm1abkTmyO+g/uxHtXIh9hVb7+cx9zFMdXmNKTPFLkt1UACO2XliiJIXoikQt1uY
 2e8R8gZW2cb2FyRzgzntYCkF3aO6Iz4k0lziT+55pz0roJAklz/sQ5sPyE4mSGaui1kP
 BFV1r2m45Udc5uVU6L8Wn791i4NDW3glXh9mzQJk3KJFOcIVTlOMjDguEMqcpWfsDeWd
 /4u2FcjUK5N4Y/iMk5jLo6OTIn904laQuL7qSsfI8QfWbYUNhKWYRAfx8oeH+I41ETWm
 wvCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHDi1tP5N/R+lyV6pRYENE5hew2dL0HoU8yAYztOavlLLlLp4Ue+BIakC3Oaouz2QChgYzGZD5HQ==@nongnu.org
X-Gm-Message-State: AOJu0YyMnBkpLUM2FYJKPGq1wLUs3WaB4MVkIt9wm1cyVcxpWi83BWWB
 u5ejtjhRv6LqlI1swj5YU2FAJ6hlM5ZrlOZZ1pEVypbGPAXqbYxGcZlRmIgUIUmP3r0=
X-Gm-Gg: ATEYQzyLEfbUxvY1jRslyX+u6gLgEfGSke+Js5DC21Pfu6NUeih0FHXIiSD7L9xWXgc
 fjjlPeS2pbmgd+AI4eQcGOZ+uQr7IlQ45vwhDIVDKHuBlJNqv4dvbSOi4R/tscIA7i5petZ1FlG
 sjuZy17z+VcTrwVwUxVaExdACQQMMbeDKvZEgHIOekguCXp4G6fNbeWwN7YUf0LyYS4dDFBs7TT
 0LSr9PXbeVQ39lbfPUcSYvhrrNmBHctToejxk3v3340pTS2Xbgknijn1Y/M9GcW5YMUzw9QWrQI
 XIyIFKlDlEpgO4m4J3rDHomSFFIIJOAqhPOPdbgJcuJT0TFon8ghml+y9FCkh+CnUjGL6g0JQb+
 OTw7cc/CO5Dp5gf2vJTT+c4k/ceUxDyAkLMBvjbdN70sKuu1CvNdxjWC4HXrIHumn60gLchb4K1
 JSIZaRp/Bs7TNb23dBpjM3Yjh3+sfkpXi0aeInVJo5oeSqbOXdMawt9z6aOnQJZdsHOArhVH5rm
 7Vl
X-Received: by 2002:a17:90b:164a:b0:35b:b52d:f34d with SMTP id
 98e67ed59e1d1-35dd4020621mr557735a91.5.1775071279536; 
 Wed, 01 Apr 2026 12:21:19 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:19 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 08/12] target/arm/tcg/translate-m-nocp.c: make compilation
 unit common
Date: Wed,  1 Apr 2026 12:20:53 -0700
Message-ID: <20260401192057.1182724-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1030.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 89c3b476822..70beec7a6c9 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -18,8 +18,9 @@ neon_d = [
 
 mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
 
+m_nocp_d = decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp')
+
 gen_a32 = [
-  decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -34,7 +35,6 @@ arm_ss.add(files(
   'cpu32.c',
   'gengvec.c',
   'translate.c',
-  'translate-m-nocp.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -65,6 +65,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  m_nocp_d,
   mve_d,
   neon_d,
   vfp_d,
@@ -76,6 +77,7 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
@@ -83,6 +85,7 @@ arm_common_system_ss.add(
   'vfp_helper.c',
 ))
 arm_user_ss.add(
+  m_nocp_d,
   mve_d,
   neon_d,
   vfp_d,
@@ -91,6 +94,7 @@ arm_user_ss.add(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
-- 
2.47.3


