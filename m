Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B18310FCACE
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:22:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8184-0006eX-Rt; Wed, 01 Apr 2026 15:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817t-0006Ux-Qp
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:20 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w817o-0002zq-Ks
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:14 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-3591cc98871so22539a91.3
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071270; x=1775676070; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vFNeKLfPVTPjZKcH+bT6MZF9OfhNOz5eheGTRcQVsPI=;
 b=mvkrKA4ugbSGnz65KsUnhQ2X+S5ax5f8R8VP6fOwlxcDx6jSj/iT+wOBZajzBjyD9g
 bUoWMB0j/SZVL/vKBCDcOHHVB9I7wilfu/P435lrjKt84rmHSpYXbDqDsk6oRFDTdeTJ
 COI4t/jlW3tmFXpHv8Nd5jprsSBadamIJd8ZPLoO8FHQ7frWVZkrkG2PAk/VGTT9Pabn
 AmPIgpZ8YBMfrHM8TIpKn+Zed1VTl50Bdj9qN6qFcwNnhZPhvLq5Usa8bQiuVCuF3W+k
 O+DTH3cXjTyGt3EAxDnepQqKAZc0w5ltkYzyolqOgRFyC6v9uqS9qv1wSaxnRMy8OKQV
 q9sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071270; x=1775676070;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vFNeKLfPVTPjZKcH+bT6MZF9OfhNOz5eheGTRcQVsPI=;
 b=cEslkKIHyyRxzqaRLjj1FYYF3eLg/ZLHzlhyku7oF6LeGvjhfkI73S6V5UEl/lLpst
 cT3sJBVqd9fpnoD+1AjO7rQheKMuQIhFhgABaAcpa+Z5aPI0WqRpKaXbFGqOirIDp2C0
 Zkik8qa+RDipgbnC+N1Nr0IwpJNfnbClZYjOCIDaoG6Xj6SJqgFN4hA9hyAPjXucA2iC
 AUzUTiKaBKXa8dz1mHWN86SOqOliaLla2SftkSt547LwKBdEX/TZyFPFpRM5C2XatrYC
 OQJptFIYygxnDoZiXy0tRX6lbZFp2pwdfvn3g5CQLkEIrrycYAmXqvlNRDsOZX+eDiov
 vVAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCRqlnI+X6QASsXO8tcACQYJMD5IxmqjUEP+qF1gB0F4fp0b784FNmZDLU0moP+CkK2nK2DI/y7w==@nongnu.org
X-Gm-Message-State: AOJu0Yy4K2az0CWbOO4Cs/oZkW1m1DfMb+IJzG/IQlkhI4p5B10YA8h8
 NK6/Pq8fcTsgki3s571TG2aPtKkVF8erdDa7v7xf84VrfWahyYsotUurRoaL1feAzPE=
X-Gm-Gg: ATEYQzzLclYuexMyIBaMJC6TBYpfZxD64s67iEALrz0L431iWuMt0NclkkDiEgVcTXL
 FTA5ks1TG1xQggjuBRVQd0IJ67s75cdczxKQWYRk5Y87rHxlzyxaWA+hmkUbBvw3o3/rvMK750K
 7SpxI8mkbYrT1mCv5RHPG2s3ka9CaBeKzCGuS0LAlv2AvIGXgkGsVMTQ5Q1dvZTQ5XEGImMuhDi
 bFvjCzrHnQTJFBTzoS6urPXB91YxrfX/acShavwbeZw8TtCCDi+LQo8QqYkxtPZHQBFTWEQ2i5Y
 EMLW5RFXn0dCm/fxzLVxb46u3ragdv2hYLsgRVsa6B7Sqfv1tUVdhhb5OlT3ZoDetDNdxKVipOc
 jOk3c0FHV2QRAsmKPNYMTwqvnYETfXHXnt8Y9u+SE3W1xBnYTwQVxGNYgvwR5kuol5JB3pcj7yy
 uRDD5BNia0dpEoO2XpEQ6pUUehjtGO2jK4FC5AFx6DOqElULha/I0xq/wNfFBUHWEZtjTsbIx69
 XkC
X-Received: by 2002:a17:90b:48c1:b0:359:fdc0:4621 with SMTP id
 98e67ed59e1d1-35dd4024f09mr494336a91.11.1775071269472; 
 Wed, 01 Apr 2026 12:21:09 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:09 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 06/12] target/arm/tcg/translate-neon.c: make compilation
 unit common
Date: Wed,  1 Apr 2026 12:20:51 -0700
Message-ID: <20260401192057.1182724-7-pierrick.bouvier@linaro.org>
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


