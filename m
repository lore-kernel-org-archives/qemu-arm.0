Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D85FB5181
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:30:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAi-0007Xl-WF; Mon, 06 Apr 2026 22:28:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAh-0007WT-Q3
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:07 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAd-0006xR-MS
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:07 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ab46931cf1so36446245ad.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528882; x=1776133682; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uukBbBYYNyrggNOyo7VdnlUk/PBaz4ldLT648BT7MPc=;
 b=DA9CtgToY2HXPCZjrUZ8ZZVv4x2NOetoQfxYCYr5sUg0k0gfEeFDmWq0QlhAfiWVC0
 qgz4QebRH40wXABJXFzyPaV177jcBkx1vq/530nV+0bKRNbP1K9YIu6ph9D6AxAYuD4P
 16jJScM84/0/zFOMkR0iFxNcOXhJ6zc5dxCypm+9RuaRq2eW4/CQzEZ0tepzBx/h+rNu
 HxPQM+ahErW0aLbXi0rgGtoNqLXYOquqob6AdwOhWCkVASqpsNB0okHVpSlTSrTLlUFE
 ktRvqgmmealkxvYnYJkIZzeWK+Drm/xCeBjCpsROniylgI1arP3zUgMfs1GVANOCrbRm
 rJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528882; x=1776133682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uukBbBYYNyrggNOyo7VdnlUk/PBaz4ldLT648BT7MPc=;
 b=V2SPfTWBYg0+rf+iHIDsSCpLK3CRMZdXthBUbv3/fFZHLiGIlRJyott3aeegn7cycw
 aH99D3oxtcHGIWXKxbKN8bUvY6EKJplI+67yTL9B9pf8qcVgX/u8gd6VVz5Ycc2fxBXy
 50cgqneaEpmsCTzvqz90wQyhpb14FzQeQDbugrgKTe9NRaqheiMQy+HNwzX8Ho3ErRzj
 H/GrfprwNn55Il37bZ1/8LLDWHJUhDbd3ccZJPxynvBKhv9iBwM5s4AaFwsDrO1dXsRm
 Lnef2zhq6y0XCPUdZeegIrnsygDL9/woHsveZUMWAFSyEIy4cSm/PGU0pyPYHDCb6GHm
 srFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHInlXJmRoYwMRfRmuHu6j83jOhCHLYScY9lZlgjjq3CTwZ33YicLLL4Ik2Z/127L0LwOsJCSwTw==@nongnu.org
X-Gm-Message-State: AOJu0Yz6jWwjYxCF5gFlXEsNk3qbNZ0nAEmdmwSI/AEKTf1K2Wsj/K04
 8d3t8ajxHaYnQZ/r+D3uW7pOUYMZb3R6u7hIsyq8ip06PnseAlEdbsrRs4uldp03p8I=
X-Gm-Gg: AeBDievSieVezQAiqSXy9SI9E5kG2HGtZ2N5S+BAW8r58DX9v+BDqa6ZyfQQTzszy8Y
 Ief7AaKxE46EMF9VASLmvGHHvBCwKA+2DIcQMYOP9CTLJiIQYWJOjIO3fwfoM+W0zotqf6r/rEr
 yx8gtGzifTphby4ZW8ItdBNIx/H6YzDK0rt/gzEcH4mMBi8EBCKSMiZE84shR8/s8p7+wfPtGfn
 fajSostmyg3ZTxE2ZHfL0ydTVKZwkLEuvJU+3OQIlmgp8oF6TnR1ayakY5D/QP/2fAAu695jSsl
 +BAEhi1joPdDbhH/bko8voixI+xVkDXDHyQxtQjoef/gNAKJwQjTLJTuPs7fkYptYkXnL4p+2HF
 3khawwqA/QLZjI4oSs/AOfXeGf/kxyTUdG/xbWFeZdbS5sL3d4HbZIuK0wpqULw/wg5lxkqj8R8
 n8SoaWrHHPU7hPQ6E7wRy3UJ8HX6lPxW44CUshdp33h+GB3EpBZ+XxCh/7DnZ++64jrXrxuLrUh
 bpx
X-Received: by 2002:a17:903:98b:b0:2ae:47b0:dc80 with SMTP id
 d9443c01a7336-2b277daaf35mr153549455ad.11.1775528881673; 
 Mon, 06 Apr 2026 19:28:01 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:01 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 06/20] target/arm/tcg/translate-neon.c: make compilation
 unit common
Date: Mon,  6 Apr 2026 19:27:34 -0700
Message-ID: <20260407022748.57629-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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


