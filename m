Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB9310F2853
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:52:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AOh-0006Aj-IT; Fri, 27 Mar 2026 12:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOd-00067n-TX
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:56 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOc-0005FB-6N
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:50:55 -0400
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-c74244dc0b3so1628199a12.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630253; x=1775235053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9hNSssL71icxnCVZy3/O+/Sz6YGQHHE5H5XHwyq5DTo=;
 b=lUDek4kG33K6msCEAUEKXrO28A95rhB/QBY9KcEB+IYTsZ2tLzI4qfABNxc5pi+LAC
 V/LIS2h9Df/K0kYsSWfypk6ZUksKdZOWCLuKUj+WRV3lpX1ENLqbvAadLZS2NKVea0sw
 RisQXrauj+pcwj3xuNYokXlK0bzbpxSJ6a0KaAZdt+I4uzzI31F5w+Lt5ij3qYJvKlp4
 qbydrMAqskLJazgw0uT4p9+eynIGwBOm/tJUI2FQSuU735jtJtITjpW3vghwsks5ZAgR
 nP2tSte4xv1i2epOCtCJVA+CEWIdwH6UfTL7p95EWm8L5c5G+jXb9JenSPJ/3nq+dwIz
 RWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630253; x=1775235053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9hNSssL71icxnCVZy3/O+/Sz6YGQHHE5H5XHwyq5DTo=;
 b=D8TKzSX+rCrce2TfjFIZCoccsyqTS+54tS+952IfGJjvpAcUkhl5qxzkM8t6IBasoz
 M77+7CfzcfaJ11dqgg6BgiLerFEY6r6VWnstSJcD1YwtmCbYW9qFUsiS01fIgw/yFfTw
 HfktQ56WPcStpebs5wjxv127Q4cn70GutvvrfzX/1/FW4W+BtDp1+LDBvEMs0AvrFTqw
 hhCbk173lhuF5nly5s6qO3yqTsJk/fVb3iTqachHxD25exr1pUASgY8JaiSR6Gap2E63
 YU0dJfaZ9oQopQ33bavzVDqYXZ34boBYnrZJPO5KHld+EPOu39eZ/yufDZ6NgKVxJlgU
 aQEA==
X-Gm-Message-State: AOJu0Yy21NG3l+l3iQaVvrOC0mRxtEcjbIFo/B3v8zNocQA1SPsVMJOx
 26JePi5Sx8qBoI/BmPTPI/MkFapYBpk9aiDHYMaE8t+wIll6YsKSP3SZ1FQK2fpwPAeEqRuAlAQ
 Zv9ahi0M=
X-Gm-Gg: ATEYQzz3umPgLxA+VU8J44BUeooC4iDWhpweRfm2PRgoVKIaP31TfCAQpU93wTDGYxM
 bSBZq8froeAkFcnGKAgutImPj0hsUE+tVg/sFknUVAkYqgc2ACuA16p/KAVi9mO8MtR9k3hCi4e
 k5ASO6flNRtafTGYdPx5xNLQXXDtr0N4auu3q/vBaiBrw4e40kp6qvL5D/MjWgXRhct9qoADOSD
 4nmrfAi9bL0VS17Qiuhlw9CCdSkzDHPcIIJZWeRY9PRudntTEGJAafbmU8keivFR9NEIlugD40C
 a11KuDMRLyhfDN8JID55AShCCZHJILbcAzn7rTW6REL3yu4mOiF7snlCtNw7K3ty/Z6fonp1ezs
 eJx06qnASLEEFJkNdE6W1mQFzgEQYoMYgX8CX+jjKiO1OYLBoW0uQRJWbeQIWU9fMjFYYJND3IV
 EdKCktCFyj8k6/hCztKKLPhpnTV4JlXu7fPYdk1+9BV23i/EeHH1JBY5Kx2OgRdYxaXSxIM7S/I
 eVGUM0/S+sYpqg=
X-Received: by 2002:a05:6a20:e292:b0:39b:dea7:562b with SMTP id
 adf61e73a8af0-39c87880250mr3587402637.18.1774630252691; 
 Fri, 27 Mar 2026 09:50:52 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:52 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 05/12] target/arm/tcg/translate-vfp.c: make compilation
 unit common
Date: Fri, 27 Mar 2026 09:50:35 -0700
Message-ID: <20260327165042.604105-6-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52c.google.com
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
new here.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 3e96c77df73..46bf4a6d76b 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -30,7 +30,6 @@ arm_ss.add(files(
   'translate-m-nocp.c',
   'translate-mve.c',
   'translate-neon.c',
-  'translate-vfp.c',
   'm_helper.c',
   'mve_helper.c',
   'op_helper.c',
@@ -60,7 +59,10 @@ arm_common_ss.add(files(
   'crypto_helper.c',
 ))
 
-arm_common_system_ss.add(files(
+arm_common_system_ss.add(
+  decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp'),
+  decodetree.process('vfp-uncond.decode', extra_args: '--decode=disas_vfp_uncond'),
+  files(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
@@ -68,6 +70,7 @@ arm_common_system_ss.add(files(
   'psci.c',
   'tlb_helper.c',
   'tlb-insns.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
@@ -76,6 +79,7 @@ arm_user_ss.add(files(
   'hflags.c',
   'neon_helper.c',
   'tlb_helper.c',
+  'translate-vfp.c',
   'vec_helper.c',
   'vfp_helper.c',
 ))
-- 
2.47.3


