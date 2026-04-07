Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24DA10F9969
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:26:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYWb-0007o2-5P; Wed, 08 Apr 2026 15:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY71-0007Vp-Ps
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:58:51 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoS-0000nv-6X
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:26 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2aaf59c4f7cso25783725ad.1
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600543; x=1776205343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EDjkncN0A5+3a5tlX7QauSsXmI5/2falsiVKhMVXUw=;
 b=eYdaCW5wUI9hMShiTwyQtvVcm0cD2j/lUQXB/IQH5iFzSoaO0SmXlbnbpJIrlaimoK
 +dbmUfC+Yr12uiZZenTmTZt4O51gWRpPedJpC+c1w7DKPYSHTUfjmh5yERMCdGmCgMYz
 YMsMSZgtox6jEIab7+8Gq9bLPd/WUUd+wQ+DT5KcA1XhkFlRg0ErWFg6lA4tDlglgBd8
 07iqF6mHKnOiH6BsZXOMa+xeCG6EgmyBmVJECWlS/eo5Xs7JhG5szF7jxjFAFNaJ8dJ5
 87XrS++ws+70EnDv7wjxr1h8bkgNMoavHYNXeCjNhFmdKtAwk4e6Ct3nFEo27JNoEOrg
 2+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600543; x=1776205343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2EDjkncN0A5+3a5tlX7QauSsXmI5/2falsiVKhMVXUw=;
 b=oIaW8imxXwJWkE4vdyMBRxvP4GNf8d7QJ2bgz6CqZneX1R1Og6rSiuUusVKNuaDE5u
 4LHs8Ca16RwZ6A88JNEWFkdjepSvio3Ek9HDOfiIVGheld++X/KAPgqDMOb+ExlKTHa8
 mBXdwMrurVPDLU1/aCRzcQb1y3KUpiVhManoIU3WR8r8NipcJwonHrmufIP2dt8Qfo45
 32h3hmuWruw5XfF5HAU1IEEAMdi6TRNQYhhREq3H6Stsjy7xs//WkkmtvJklrigsPRbB
 EQlUk5iVeYLA12frn7pmHicGJUvskZH6kCwsXGc9tgzS2vbmy3rhB+G50Pk+apw6S8Lr
 UesQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr6+sWIWOSEQvMoe03diRB+46Bjo3J73rQFDzhBCHkXD/F9TpefZ7J5mro2fn0dO4nDpX2K9rOhA==@nongnu.org
X-Gm-Message-State: AOJu0YxezkIawKZHg7iBLzUdlxTNuJzGZk06yGYHuH5zpHFPm2eOTAny
 aQfrQ9fY8uB8Ua8xvlNew1vbhD16YiuN0IoQXDsrJ+PLeQ0V2pAUVfMVl5c0CnM6GRk=
X-Gm-Gg: AeBDieubJaJ5O2N90fXhR/3uyfmLETA2Bo8LuskKp1amXl5HxHcp5nQcuZhA5fkfwMW
 m5DTbOLnGlp+2kVlEaK0XF1BfCvEafp7t/mUE5+RXpvrnJ9MsQFC4yypfh244jPtW9Vq5gHOrQN
 1yXaRI3G4rMZWslA81opC/e5pk274Ui2iIIxQaHQqlSE9O6N/zV3q52KJqaJCkvR87GA2hp9F2M
 mQK5iQYbbxTA90yYHuX35K//AiXvNTtxfR5r1hhgLM009uyYgFCT3qxpUFl3s4lLMV5jLQAk30u
 92NBf9cuCUJtMOiz9sJ0CuhcnQm5bP0Pc8B3PLHvP2GDl6QWAHjO9TUESLGG2dduEIwe2sB6vWJ
 X/B8GPZXppJUsgjpY/CwkjgaPp/bgtKZeylCugXok1YQ1nz3WRlNhtuUpnWQ3dDcpsRYAsU2iko
 m0KQNRnFrn9yhwuza266EQ4dmIJz95XmK2tjZlyTzCLBsLRb0aOFJlb+WBS2oFJeScOSokd5BTl
 +zb
X-Received: by 2002:a17:903:2acc:b0:2ae:826f:2c50 with SMTP id
 d9443c01a7336-2b281679199mr206438935ad.12.1775600542591; 
 Tue, 07 Apr 2026 15:22:22 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:21 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 07/21] target/arm/tcg/translate-mve.c: make compilation
 unit common
Date: Tue,  7 Apr 2026 15:21:54 -0700
Message-ID: <20260407222208.271838-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x634.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 8d9112f6da2..89c3b476822 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -16,9 +16,10 @@ neon_d = [
   decodetree.process('neon-ls.decode', extra_args: '--decode=disas_neon_ls'),
 ]
 
+mve_d = decodetree.process('mve.decode', extra_args: '--decode=disas_mve')
+
 gen_a32 = [
   decodetree.process('m-nocp.decode', extra_args: '--decode=disas_m_nocp'),
-  decodetree.process('mve.decode', extra_args: '--decode=disas_mve'),
   decodetree.process('a32.decode', extra_args: '--static-decode=disas_a32'),
   decodetree.process('a32-uncond.decode', extra_args: '--static-decode=disas_a32_uncond'),
   decodetree.process('t32.decode', extra_args: '--static-decode=disas_t32'),
@@ -34,7 +35,6 @@ arm_ss.add(files(
   'gengvec.c',
   'translate.c',
   'translate-m-nocp.c',
-  'translate-mve.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -65,6 +65,7 @@ arm_common_ss.add(files(
 ))
 
 arm_common_system_ss.add(
+  mve_d,
   neon_d,
   vfp_d,
   files(
@@ -75,12 +76,14 @@ arm_common_system_ss.add(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
 arm_user_ss.add(
+  mve_d,
   neon_d,
   vfp_d,
   files(
@@ -88,6 +91,7 @@ arm_user_ss.add(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-mve.c',
   'translate-neon.c',
   'translate-vfp.c',
   'vec_helper.c',
-- 
2.47.3


