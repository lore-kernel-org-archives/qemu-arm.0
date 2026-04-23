Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62742FDEE2C
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 17:06:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFxTi-00028o-0J; Thu, 23 Apr 2026 13:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxT9-0001Sd-AU
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:04:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFxT2-0005jd-SF
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 13:04:01 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43fe3e22e33so4556537f8f.0
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 10:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776963835; x=1777568635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZCFQzooRNCLAU0lxbQyFXKr+3+SaXX5+jlkuAyFk6Qg=;
 b=io4xn7R/SmxpXazT0G6JihMVClWhfblgSELzjJ2T9I6R8z72Ll3TtzUhGBHwjkhSTO
 DpPcNEKiuC0a4WwpyNut/F94QufjFmK4D/Bs4WiLWQx2nQyF6s4fZNECGHxi3FjmCTXW
 MConiZCjTz0YU8u5En+pK3NLsuwJ+CK4ccgm8nPGboaQkt3paLiYTk9Y+P7NdLR+/gI6
 HMfddqwqQWiCuZiQhhEelInVV1spQZ/PGJSu3a11+gUhAH5jIzkbKrvkBWpH+X3mYrjK
 KEKCll51CHy3EB2ziSK1lccxa1JmFUKcnyCLXtMJC2WFeTlhpb0nOmX/fCXYXhAuS0lp
 SPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776963835; x=1777568635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZCFQzooRNCLAU0lxbQyFXKr+3+SaXX5+jlkuAyFk6Qg=;
 b=geSnh559r02E3NfdeoDPtFMT6cRMP2NqUQaW6Yw5RM2WoY+qzsXUyXYLPVIuoIt+zB
 wttyqqJAdDRg+ZRe8ywyWVqUksXPC9dvf7gzus2TfacwAKXhDaOs3lnr/PWEcy9q9uCH
 14C1yhBfuRlVIWcD2ImWIjtcIC/18sgjUROlUbKuzeotrbZhIMZ8C8CNl0oDIxJy3bKh
 6RAfEXmobY3YBTzQ85xEotNBM1K9BhENweCJDUNyqqKpjmgG62kH3vaIhRBFgktUS/GB
 1p7qa23YdJGZ8O4Q5rPnP5Lmy4ptn4pR0WdR/OywftNtSN1222JgN2OIGTljZm4PMLxV
 3/uQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/fFwDLbMm4k5Unx+NNk4EvyU1uII5S5SmeVHZsTF9nMsyd53wk2F9c1Tun0qCRC6qiAUvom50Rgw==@nongnu.org
X-Gm-Message-State: AOJu0YyOFsw+xkLmj/OW/XG4Podcur8HM1BGoh3DbKCWI6p1wGXAir6W
 QpUfiFt9CCSfvT5ZgsoYVWyGKjHPCIenhrfeMiRBOOftC9kRa6a7dourGe6qPaFizWA=
X-Gm-Gg: AeBDievea43zXvQAA0yZRJZO0bwWSdhPM0/TB/pay/UQI4KCBqQloDCWDn/GJY8nnu/
 fWhGkVHhBGiSOl4cwVS6kDcaMfx+RX+dX4Yvfn3A1VrVrAFCKaXrlXB8WQH7kbVfpDGg3NJ7zph
 al2Ki4mEY/MAZNyks0prQerDMNxW//npeFvJRaR+7PeZjayUi4HNA+YN2aGn1JA/SG179bqp52r
 xUohLYy0P15o2cZxYpPrdXEx0U/wv42obxA5HkEpxYCpfLOYYjdeLM4+RRAgb780ix+mEIHcn19
 qcuKR9mW5X4h7H/cpPCPYzrINWL8M+OsJDrIT6pCRZF/LzqMh7Ayqexi0bkmRCZnJJuEZ3oPRs7
 +/Q6aM91Sj6Hib8o3PEBGJ+3lrM8nVJZmCmPqRUNjE/NHnb8G9BeAcYswlaCcRnUzP7IJ0jBLlc
 Ppemh4DwEensAjzazS6jB30JiNvc2G0JlWLf0mXoNZcnQ6GcvFLdtwqjbQOJA0/P4t3caiMGmsO
 /O36ekGvM4NPg/8cAvhGA==
X-Received: by 2002:a05:6000:2909:b0:43d:733f:aee6 with SMTP id
 ffacd0b85a97d-43fe3dbecebmr42817355f8f.10.1776963835241; 
 Thu, 23 Apr 2026 10:03:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e3a174sm59920785f8f.18.2026.04.23.10.03.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 10:03:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 11/16] target/arm: Only set CPU_INTERRUPT_EXITTB for TCG
Date: Thu, 23 Apr 2026 19:02:23 +0200
Message-ID: <20260423170229.64655-12-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260423170229.64655-1-philmd@linaro.org>
References: <20260423170229.64655-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Commit 34c45d53026 ("target-arm: kvm - re-inject guest debug
exceptions") removed CPU_INTERRUPT_EXITTB from KVM, but it
also appears on HVF. Better to restrict it to TCG.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20250630130937.3487-2-philmd@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7389f2988c4..45183df4449 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9577,7 +9577,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 
     arm_call_el_change_hook(cpu);
 
-    if (!kvm_enabled()) {
+    if (tcg_enabled()) {
         cpu_set_interrupt(cs, CPU_INTERRUPT_EXITTB);
     }
 
-- 
2.53.0


