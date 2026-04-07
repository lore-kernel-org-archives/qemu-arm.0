Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83266FB5180
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 02:31:31 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w9wAo-0007bp-Nj; Mon, 06 Apr 2026 22:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAl-0007Ym-GR
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:11 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w9wAf-0006xq-I3
 for qemu-arm@nongnu.org; Mon, 06 Apr 2026 22:28:09 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-c76af7b0f94so2932146a12.1
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 19:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775528883; x=1776133683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpOML7tmZexsHhxO8SKUFq6iYscD6sM9NhAFa5aVm2s=;
 b=I4EeEOUajF6KyjGQLJoX17d8draXy32nUDzxcBLdaNCUC2zIgzMBKxXjivN4dylKNt
 uZ0WxNWk0nqJv7TglgJsmveCaVBtksw/u7Km8K8VQ6gqPkUFWJKTXqHNt9vkg7Bqlew9
 hqQKpFUQfnoA0hjrI1nEgo+D1VlJW1O4p68RPpLU/r1Nj8GH/NB8bCiknKeo1oQdIrM5
 Hzha6T1Q0s7/VZlkpdNc70VoVjCZg3ttbnO7hEjmkBAehtaUWKGPXnDTiiGC0x8N0nxN
 MUTJBmNLPWgue9oQMzhY3DY0xEauC88T3X5s0bQtj9SmaFvt55rjpuoFYNKXGfjQ3thv
 jomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775528883; x=1776133683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bpOML7tmZexsHhxO8SKUFq6iYscD6sM9NhAFa5aVm2s=;
 b=TaoalWWWj+7B3gKn7aV6x00OOwZz46d6ZbFy+aHfPwp3Qf5cEIWm1EhY1A2pdKL3XX
 JmYgWI9woSNVzadvXyq5lzgyyc/jyQ1/4/V6LR4CtVkrDNG8GJ3Dj1YdTO+CvCl9AwdI
 9oZGiGKyGf2LtaPyw/qWxAFsvv4K4Vm2rH6ZXNSlh67zyp4aOYbWBQc+fTZiGj45QS+3
 vXzZEffvjjRtReeacBOwQivpc7YLFc4gMrbRxAU+WIYOwoL07K49sQQ8ill/4LEA3PNq
 PUObvC0mnYqj1iBhWJGsPdCm+sIPZxSVhQ2tFEvhkUF5F36SsMNWwnzgh7djZCxOyZ1T
 av1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLKgmvGz8+BWCXkhlcKBIBlA5Iu/5W0w9n6GglF1jr6JOlAjMQ2dIOZlgEoK/o8XveLS3EQVboaQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx9tGOislygDK1HxUJh7xuxXZZ/Gkg7D22MTos2Vnw+3SlTMnKY
 hMfD4LFIg9HQ9w9fodS56UM7oWr3nuVaTsUE9CmFZGklmqkqiujd2FOhLcZksoFL/6k=
X-Gm-Gg: AeBDieuVxm0lB+M6IzwU5DqvJJvtPj3fd+bs0BULUutmsRz480Rc77NXgigdoI6W0ja
 ribI3Chss/bP4ZsZJeL6vf0lp8kjg2cKcoZT51/V63A57vj5wb52EVPX4wKXgHVvuS6DfX8g7UL
 6sX0PWgw6MgR1n7T9QuTw2SClkGdU3dd11M85EyGlDn1IAQBfBf9B6xXI6bzFSmrwxpsTYVb0dZ
 s9vrjSppRCOQqzh6U/n6/GkryCxMZi7OYskxqY8VH7oMENOTFm9fGf1YCs9PBryu4AJRo/ktR9W
 e8IPcZCkFKoqQePHFP/iCAmydEYYzij2n8oTHSi4de21ZNybu7OpXoxystjghOrG0Nl/7qK59bF
 cgxsc7UjTFEgB/rpQceMkqVrzl0HxvAPMesYgA9ZpMeYrWYf9OGnko3Wmy93CfQ9kyaWY7kNXcN
 h+WlqcVTx4qq+s6EajXtPGwRYxUD344cE/CwoHBCcJZIwvAc/IkwAQK2FlC/hL+lcGoWdTPLzos
 U07
X-Received: by 2002:a17:903:185:b0:2b2:41a9:8e10 with SMTP id
 d9443c01a7336-2b2819180d1mr156638005ad.23.1775528882358; 
 Mon, 06 Apr 2026 19:28:02 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749794e8sm161423685ad.53.2026.04.06.19.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2026 19:28:02 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
Subject: [PATCH v9 07/20] target/arm/tcg/translate-mve.c: make compilation
 unit common
Date: Mon,  6 Apr 2026 19:27:35 -0700
Message-ID: <20260407022748.57629-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x534.google.com
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


