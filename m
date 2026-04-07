Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13B4FF5138
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 20:02:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wACaS-00049O-2q; Tue, 07 Apr 2026 15:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaP-00045V-3H
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:45 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1wACaL-0007Lj-8a
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 15:59:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-358e3cc5e7eso2679647a91.0
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2026 12:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775591980; x=1776196780; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BgMYgINs/yOfuuVgzjug5JMD/7kH4ZvROycWlRvKO9k=;
 b=g+Oy3vezTTSADIs0NPa38Y17KpDKdRSHrAfQbf5y7Br3YgM8g2koGwRhH6hbO2IhiS
 i/pSwG1DA9z3SpMr0vzREQL1YomN38+cHCf/1/ouyn0cQ9xrO3h0IUc48W/MN7Z7Dv9S
 C+fGMLTHQ7WQBzxSv15JHcfg7boeC7gZ3do5QoSuXWudaluW64A8OF2FIVirqAaEmANr
 a+XHmqHeyMn8ErAgCl62da2DbGYdQsruqKoHrahutEgKL94vUhtBNX6VCo6/svbEMD91
 hil2jv9xCmYMC0D6pyBIRmjPLU/tyFFmH09RmPaQNMnJw3jBs7m1B2UaYgBFtah8M9kV
 b+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775591980; x=1776196780;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BgMYgINs/yOfuuVgzjug5JMD/7kH4ZvROycWlRvKO9k=;
 b=Jy5XZXuy8D5lJkRmEbURJoV47GgTPWjfhjYxjenNhMoyMufq1KcBKIbMa/0QCfqZA8
 ORj1wpdaC4mRz8Oz7QdeoaJUcM7TExNza1DYdlOfvKZcWlNDi1P3iiFmmV+HWLC22C/h
 ky9hlmXrzYyhM8nT0dBOx2+P4QIK3uFXKngOVwduCwjFcpcxg9+A2Vs5BGtXPVnyxWj4
 MQovmXNetLP3Kv34r4TpOY2NPlHOJnPzkhLqUtKRQE8N3i3wkTUJSdv74vHrLTzi8znL
 78nrsh/OPC5Hu2oy8yuTU2IE25yt7e77ovOTLTbGLUdUHZlOIqbSEcZdzLkfoKWW8puq
 EWcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtzsCO6SPo+cHgmBMWpsSgFKCj7w5o7ngtfasPx3lOtBFAqK3d81vpEh/KDlHWR1/LL2H3CfmHig==@nongnu.org
X-Gm-Message-State: AOJu0YwFCKAn0oVx/MGGK5j5Bt7RmfvT0emGbz14+KJCwd287Y6hYQ/t
 E44WXuMpoMYNHe+8SuDhBBQ81EkY9QsdW9qlqpw64NSjMfbPpHKttQ+Vipa6VclyXpavYZrt6tO
 AwGHGF/k=
X-Gm-Gg: AeBDieu4cQnBj4AHxWYIN1OA9rBgvLv9oNJO2y4kjGyGCcPEFRIf6pvwoPfs4J8iX/L
 VKA0fuDBd/c46+0K4i3LN5a6u1k6W5NWOsxcVGHFWE4/pMtiox2PGTfm0fjfHtGucm8Qx2x217C
 Bh6vs3EzVIH5mEf+FlOoqO9OjMX8sePAnlnPCxHzvMhFOFzxzpUnkuQT5AsVbZb6iSmIhbW0Wm/
 tXfrFbp7N7Z749QVcZoHViaWBWdqN6odzNc/eOB/R1CkmFZ/elGwrzCRBX2BMJqHDg715Bgv8Ng
 xKtBSfrHQuD5pbcTZiwLENeOO/tdCZ8RJ4ESi87/p1FrMy+3Lu0TFfK3QAX67pggkvlbRjKX8LF
 u7gqnb4NMW2zLal/WzuXSMCrgEyfW9/Diiqfef5bv2BJrsR6Ofyp//0MKYjm9NZIzFuOBwrD4c0
 WPpUjxhceUUivZTV6Km4vrgVHy3HwGO6J3oYRaLopUcOl5WMykJQVEcXVe3gIjy7/p2QUr1NuFy
 0NQcuNpbiudF9o=
X-Received: by 2002:a17:90b:6cd:b0:35d:9560:3f09 with SMTP id
 98e67ed59e1d1-35de69a5c3fmr16049044a91.24.1775591979659; 
 Tue, 07 Apr 2026 12:59:39 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35e27c9855csm126911a91.3.2026.04.07.12.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2026 12:59:39 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>, philmd@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 10/21] target/arm/tcg/gengvec.c: make compilation unit
 common
Date: Tue,  7 Apr 2026 12:59:11 -0700
Message-ID: <20260407195922.196410-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
References: <20260407195922.196410-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1031.google.com
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
 target/arm/tcg/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1fa26670587..0740de92c1a 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'gengvec.c',
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
@@ -72,6 +71,7 @@ arm_common_system_ss.add(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
+  'gengvec.c',
   'neon_helper.c',
   'op_helper.c',
   'psci.c',
@@ -91,6 +91,7 @@ arm_user_ss.add(
   vfp_d,
   files(
   'debug.c',
+  'gengvec.c',
   'hflags.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.47.3


