Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A82A10F284F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AOs-0006Ht-T6; Fri, 27 Mar 2026 12:51:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOe-00068V-Sx
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:56 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOd-0005Fh-CD
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:56 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso1246565a91.0
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630254; x=1775235054; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvXc5w4/HrhK32EYEuNiFYOfrNSSsMEH7KaGOeb7ixs=;
 b=PA9zzlcaN4Lik4PHyxXgjrpUSAop+wR5Rb9nB3UXD0kRCDxVrrLkX1n7Tdx7m72ESL
 DX6q3S4tyqA9X0/1D5WANxWXPvMm1f9HnVIiO3M4uolsqpnHjKMM8u2SEMwpvsRib8ev
 5VN9kQ90bH7QZxhHJ1aCzVv5oFE+8VtS1rKLFhNmOTPk7B2UylYBtpBTUWLsRwVVk+/j
 1BUPAr6DjuHfDYdBeJKJfdJEBmoJ/3duEqMMV7qOy4LpaX6iHfSN2vV/21b4eNt3bJ9t
 lQvTFA4BeOOFXHDbvtb+QXBujMhkn+z56/i4Ug8xgXMCqbc7Qdw7qQ8oQ9GI4Vgb2jQ+
 p3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630254; x=1775235054;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GvXc5w4/HrhK32EYEuNiFYOfrNSSsMEH7KaGOeb7ixs=;
 b=X0hnAjsmeo8x7+fpiNZjHEMuJHn0S+5FBysN9+XJ+QrBoghPuhmzSGJ3eywns58+Pc
 bWv5RpIvTHlqMdU1pwXU4/NLdiCLV3TyTGFyGIhsAZZ2pnWCA0G619uhZIo2V/QYnjRb
 X4qtEosFFgq/AbfvPAake2tfWWprdOOf3+c5xYkQgYCTHv6r9YfPxhva+ghi2cZ+bpbR
 S+9RW5F0tf7xcSq3ji5OIi0dSzmwxDrfA61WjsDhcyew86DOwc0eQ30ZUCQPWzF4GF/w
 Ee86CufMbMdyRZ0/umNV7eKtknfRri3vU0tuAIc3wCCf0YkTJ1V+4ge/Uw9PEe3wOqZB
 q/hw==
X-Gm-Message-State: AOJu0Yz8aPVeJmkjtiJ88ojo/77Ba4sremTY4D7LlGurn6cA5rO7WzYT
 MjGonANsPYccXTfD6TPpTP9zMVI4ysIABtTvlL2oyhROcbiUYA/YuJNScb1xPFwMmmo=
X-Gm-Gg: ATEYQzwn9er14/QO6tpFwx1egc/kwHRYDUo9JhMChyX1aV9GvzCpreyQPtmU0fuDQ/8
 3Ttj4pmAESljfJ7+aNRmx5/10ZK60xrBZXs7zUI22ETGC7inBDB1CzvDLeaMdYC2LqP7ku++Me/
 1jgO5x7W+zADUaqaw7dbcrPBqG1hOYELYOGZ6i5Pb/faXwf0N5OtLYfIq/GNE5Zh6oO5EkCvpTs
 zCyyNCDB+5b+yoOI8FV/RIcwjKeEaxxbmJJyZn9CUIDl0sgy4eKHw3msUwADtQftPqvFnGNXTFW
 7umxePyVuegGdIppeQEs1Cbm8uqxmF9aO+Q5RVBRpJKDNTedsDNuem3iEVSXC7UambSXLVq9Q9Q
 p427kHnxSRdApdLBOvWzQy+hf+5wdAn56c3Eh3AUTqhaYBh6o2/Tm0EVkSeO0RRN6c+5QaxwCWY
 LztUW1f835SqdzNkvIDewzGWHRhiuULdLF8x4YfAc2zEO6mykjM6QKxPbQS2OIQKpvG9FaYhoLe
 NxC
X-Received: by 2002:a05:6a20:a12a:b0:398:95b7:c41a with SMTP id
 adf61e73a8af0-39c8794c0b4mr3643922637.20.1774630253493; 
 Fri, 27 Mar 2026 09:50:53 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:53 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 06/12] target/arm/tcg/translate-neon.c: make compilation
 unit common
Date: Fri, 27 Mar 2026 09:50:36 -0700
Message-ID: <20260327165042.604105-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 46bf4a6d76b..c14c9242df5 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -29,7 +29,6 @@ arm_ss.add(files(
   'translate.c',
   'translate-m-nocp.c',
   'translate-mve.c',
-  'translate-neon.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -60,6 +59,9 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  decodetree.process('neon-shared.decode', extra_args: '--decode=disas_neon_shared'),
+  decodetree.process('neon-dp.decode', extra_args: '--decode=disas_neon_dp'),
+  decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
   decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
   decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
   files(
@@ -70,6 +72,7 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
@@ -79,6 +82,7 @@ arm_user_ss.add(files(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
-- 
2.47.3


