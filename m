Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646C210F9974
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:22:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYSh-0003XB-Tt; Wed, 08 Apr 2026 15:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAY3m-00064X-SR
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:55:30 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wAEoQ-0000ni-UP
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 18:22:25 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2b256a4c6b5so33369765ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 15:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775600542; x=1776205342; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pt4XMBpnPMV9xBPksdczSsyXltFdkMDiM7rgCsFJ8VA=;
 b=PHU/8VIWwl5N81rZ+2t79IQElwRHErk47ZbFJaRyjBC3nL7nUBNafDgsdr83sfO8Wy
 sa8ux+LSN4qK+qGlt5FvSPupu7Hf6G4eWOsKr0fTXgjwQENtCOQGJQD70EFmQF9Rko0/
 0so5DHcJJrSZRSk+76EgTTgXucqW0gNm8IUHqUwEGSg3sMhuumb+bhlo/grjl3FytQcr
 3HZuiPZ7cU6LL8zNKWiDU//mJV4wA5mlg2Zd/OAnF+qfwa93NIrDr79B/5uezJIgiWXO
 AZMV/fsZppbznn5so/NT4RXekoM7jbBUsmzE0sj6e1AcNfyGIr/N3LrDQCbK9MXHePY0
 1BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775600542; x=1776205342;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pt4XMBpnPMV9xBPksdczSsyXltFdkMDiM7rgCsFJ8VA=;
 b=QPYAJdzW89aG7RuIDScYT07ytKze4I3NYsN74TqNXpKxMQiqFCVUkn5w5gWmlslRZH
 EJxkNgveJBQha8IdGAxKq+rjWRkCHdZX0dkIQIBrNFSqL6m7g8stGdiJu7XO2/nY74qg
 g9+ZYcwY0HHnU5UfZTWCVvHHJtMKE1G41sYFdHh1h5sEbdyNQIKJBCfX7XVrsAavEsTn
 aR63SNkG/362EZe3ygTLo6+zWaIepZ3OflgjEl4PsxuOw3Qfr/ORKuSeiA25t85h7+ms
 D8EZHyrfzr04ICeVY7mkBvIiD3xU43N3P2XKlZJmQ2h/UPcX7bu9/L+qTWdUAePD5tkC
 e89w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP7khDHpQa9zzNb6SM7u/3Xzme0AUjW9Cp9NcK5Oxq9z+l/d3gV9naELVnjIDk1Vg+GwZXMJmaIw==@nongnu.org
X-Gm-Message-State: AOJu0Yyfx0/m+U2QEXDVWJJImGwApzcykOjnvJ5s99XEKFyk4d6MM0np
 kpvS5tsiWS66G4YGUPkSoGoekllDv8zg/g1z8sGJZsCt5BeV0YoXDtv53l1t+ybf0qE=
X-Gm-Gg: AeBDievaNaWXNVEIf1BGWOewDuCzhnK0RMnMplDUy62DkY08k0kjURxXXN1dxFF7mOA
 zR39xlh0E9TeYlJ6mpFTgxfyN1/UqWtzdnkvRV9rb3B9gB6wuy2E2QSgrh6U//+YMK/6chs81JM
 4897CygFix4SXA7a/KHlcu/dOk5Uyws5V55qf2OszcVixXXBmppsUTR5gTnLFPf44yKqi3krkFk
 a8LXh9k0KRIDPLUUL3nnnC+zDtQVRjQQJ16f3bnu3DSMyip9VaOc2skhIDTvuYvoyRos37uWToN
 /LfTMtDtXtYZs6U8ejTMgKCTlmPADpuCsxlcAtIbfrQNwZ7DAaiqVGRvdpAqhLyXc/dRkmGmz0Q
 tJRI+s7kOzCAj7hHbzkdzl8X5VwMzRt3BKAufXQ2I4NdC2RDVYXe1rnJFPJjiqZ9+o8aah63ml/
 H2f9yuLOZkpJoO8tpt+RGIJClHcWNVjwQ4TX7l2MSN8jB0PxNPb0hkGFKifz2gdQbJxaJAPYo9o
 zBg
X-Received: by 2002:a17:902:778d:b0:2b0:af2f:b26e with SMTP id
 d9443c01a7336-2b28176a432mr132424985ad.28.1775600541533; 
 Tue, 07 Apr 2026 15:22:21 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b274979d5csm180412065ad.38.2026.04.07.15.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 15:22:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v11 06/21] target/arm/tcg/translate-neon.c: make compilation
 unit common
Date: Tue,  7 Apr 2026 15:21:53 -0700
Message-ID: <20260407222208.271838-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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


