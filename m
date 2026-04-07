Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D716FB5185
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:32:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAn-0007aB-EF; Mon, 06 Apr 2026 22:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAj-0007Y7-JW
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:11 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAf-0006xz-Im
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:08 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2b24fdac394so45889565ad.3
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528883; x=1776133683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EreTPxkuDGzkWgW1EVVjJMJZdSsPzYH3Oe6Wk0cickk=;
 b=pgLpy1KfO3h5MJkq95T673olfBvPAZGvDygv7q1JMO469ArDh3TRX0mc0eJbzu9taU
 kvhQQ/EUrzAxnDcuFA5/bU0nnbyFOhUxtSs7Ff4y1gx8pXaNizDnNSOLEJll5/xN0teH
 zKPo4Fi/AZEzigwpRaE2BTsKpA678+SzroQoE7BF8zo7jwQok6BcjRs4IxQBn/q7j3PE
 i+wjvhdUlCnswoyr8z064YHeLiveTVUxP9EMwkQO2Dp3OtzNgnjHiBiuP2ecVsz97gBD
 NRdPgHO2ic05nw3Q72iqRZMpGUvdFo5FTOs68XrDBskjnIXMwTpnQEg3enLDQwmcacTP
 UtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528883; x=1776133683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EreTPxkuDGzkWgW1EVVjJMJZdSsPzYH3Oe6Wk0cickk=;
 b=JmSJBgSIxcjjPgZUaepNhLRnPdcosASbj5mTZ4E8rkPmNC7OxkVLIXoCQvY34EaSle
 o+fdzRavDyftjhAX/JTYS5eqfrfGM8goFDkNECsliNASChCP6IvkehFFcIfh9fxwFHHN
 NOss7UXb1l39hElxs09D/9UwDd8W0H8is9UjoxOaMb9w2ynflWj0Rz08+9FMMvfuw1G2
 G9p8xbRll18KXoYTUGgIUulW157dAstvsmFkDALNs7L594nhdN20QiUlOuXPl8MxpFHU
 icoGcQcpPc45615l78Puoj9P1tI6zBr2xdPiqxnX6WApxh3+6l5N4KzVKLNxM4jZyW+u
 hLhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWm6K0AHk//YeJC0S7nipM7LUBgOFy8fAlq4T3gRCLa/w8Fj9ZA5QUc5BfO3JzYIybHsUIvWV+CeA==@nongnu.org
X-Gm-Message-State: AOJu0YxEsMA1e6bSw0odrxGWB4rw6IdGnvFwyRm0gylNm1u/LZz7kETF
 wbVfGAbtcza7A15ObIp9im1AZEC7/9KfnfhysVOA0v3+yU3t3kG13vm0pVN9zZO1E0Pod3y5KMK
 6TWJd+OkGGA==
X-Gm-Gg: AeBDietNcwcSuUXTH4edu4gKHMw5o60CRWPFqlMB+L9k2bZKohmwhJw9penRdrNaarB
 xy+PiA/nbtCpvG6jCot65XpyWlYy932xLLouH9tx0my26rBo1/XUIq/6OHjC4UDn85lXLDufKTT
 ivTZDbYFjD0leswwu510l7JFtspBajCzqyyofQkxQ9RHokKxBoIUuT8GlNzNoQkZ5Lnkqa3bOEZ
 x7PiQqiB0wSWJ5+BtUfDGb3XP3B4IUEayr6PJo3BWFcr1LBhzGeMY7SJO7mN/oCS1K1qtMP3ttf
 8ZDsiSN9DoWBjFaBxL7dDqnYAFru5HMUkKn2LKcpETn8BF6Tpnag1Tc1tvc8OMUnbro2D3VsrfU
 GRPO1XvcnnfSujDM4OD4PmRIAo6+KgWR7RRZ8xQxztu1dCBR0O9CbeUFffAFYnguPy3sT7tG8YY
 8Q/kpeYCfvucKWf355iXTeawwK19P4DIGdAttlp/XpDXLxM8UHiKDR8M1v8sakkkbmozKmWI8aC
 Hyg
X-Received: by 2002:a17:903:38cd:b0:2b0:5cee:c421 with SMTP id
 d9443c01a7336-2b281672acfmr168511665ad.4.1775528883155; 
 Mon, 06 Apr 2026 19:28:03 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:02 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 08/20] target/arm/tcg/translate-m-nocp.c: make compilation
 unit common
Date: Mon,  6 Apr 2026 19:27:36 -0700
Message-ID: <20260407022748.57629-9-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


