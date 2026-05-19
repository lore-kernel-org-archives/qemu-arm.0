Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D95CD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 14:48:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPLjc-0002ME-18; Tue, 19 May 2026 10:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLjG-0000vM-SL
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:34 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wPLj7-0007wO-3S
 for qemu-arm@nongnu.org; Tue, 19 May 2026 10:47:24 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so43655955e9.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779202038; x=1779806838; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SS8dMyDjoox81LYiCY5mlEBMje5OFAuSHdoJLo5BrGA=;
 b=py6hyU458MG/m8nukbg17DO1aro4xOQXsL5V3FtsegScNd4uNdxO3AhlKv/WhG64Yb
 WJxdPEpvtJX70pjhWRHPyv0m3SlYKfagEA4WB/GXjTxslcmhfLw+FnNT7wRajDq8aih2
 CDL4obTgTMEv+q5I1Krtheh4hZOyX+FsHsGn7//F+4oCxo3UiHHsoMw4eIdDSpFBkyHz
 s35nD1S9RFMZRPg2SmJ1Tv0FnDTQeYtH8ngU3WkF6FoGe5t9F1xEIcvbt2lo+SOgOJfe
 M0pKzO5IM+JN9jNUrnP8IDe7k3G5a00Kjh/b3lQ0NUOEOT1ewspCNKQ/BSS48aFNE6ih
 baeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779202038; x=1779806838;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SS8dMyDjoox81LYiCY5mlEBMje5OFAuSHdoJLo5BrGA=;
 b=rPDSxDFehb8JSyxoHvaRh8hxIOmoMARmcICOXjYGV0WcoputXVtMWZ2dKvXKR2xb8i
 Qg99HNesT8CBJf9ZP1fQiYXbrvWw2Dg9msiWZcVSH4yO/+/SxKxPKoO+xn66Vjjm4eWz
 Gf8zjobcxNdX6+PxrkXhnJilo808KBY7sbhh/BY2rHZ/czwkbet6E67+Xok+5zq0vBd3
 YGJhS8uREhCs1U/G6IPNWtLMhROV7JAWLJGb8+gCPg7NyyhwOvNXdSjWWwLu5h4PoWye
 Tgljm1n+WrtxBzF5VFf0mZGydp7unf10Li5F/d2SrRcOm25ykLExGlCgu4+b8mH9OvAw
 JGfA==
X-Gm-Message-State: AOJu0YzEYlUjwb6s+SaLvl4fv291AhEfoCIgGF1NiJouJUu3qYLjOgmL
 K17+XuNMqB3LHT8vET8uUgiLuOSvTgaLRZ66TCJzZ2lItom5IYEsPHo28fnAkdoyI78QV+iW8ae
 rInEI8gU=
X-Gm-Gg: Acq92OGQ5k/4t9Yh0eOiJIrJOQ3VUDMob6Xiu7TlTaVp4TzyvVIPtbjxPmDRBCYw1dc
 OqrSAbDrDrnQetFrMBOhpEMXFaOp0g1k/zTN2UnkQU5+3Tyeb2UwgqV5ahweiOgaPg4u/RQDEIV
 S8vOwlycy6NGoNau7PHA/W8JNdGnrzbdGVujDNVADiJpYcQIdHdGz/SW5vVSclMlDcjvHZDX5Nq
 N0G5gdEr1CAM3IHYUVp9V9EwI2H/V4haMdLTNFu/6s9OHYkmoqn5NIq6yZ2eiAnURe+HbjA7Z1X
 9pQzLyPX1XUAXXfxDAuDw1KJQvFzwShlzM8uSwSO3Q4XvGAsytvUcBU8QxmwoEsaG+tzoUaN6JZ
 lkLhNi4Pzb8d99U07PWa5JHQwrYxvCymVQAr0X+J5H0/KYrY4nDAQFJyLAwlEp6KRjL0ooVpdfC
 vK92bcgBahtjtjYf5lNkBmFoizFepYmlRMkpImlJcMK7KwWI6mdYXj3HfbBQ4cJLrCMKB+rW56
X-Received: by 2002:a05:600c:8905:b0:48e:5d91:cffb with SMTP id
 5b1f17b1804b1-48fe60e7d6emr255041275e9.10.1779202037523; 
 Tue, 19 May 2026 07:47:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b60csm158156585e9.6.2026.05.19.07.47.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 19 May 2026 07:47:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v8 12/18] target/arm: Implement DBGDEVID* registers in max
 AArch32 CPU
Date: Tue, 19 May 2026 16:45:47 +0200
Message-ID: <20260519144553.91483-13-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519144553.91483-1-philmd@linaro.org>
References: <20260519144553.91483-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

32-bit ARM max CPU is a 'Cortex-A57 advertising none of the AArch64
features'. Keep it as close as possible as the A57, by implementing
the debug ID registers, following the changes in aarch64_a57_initfn
added by commits 48eb3ae64b3 ("target-arm: Adjust debug ID registers
per-CPU") and 09754ca867f ("target/arm: Implement AArch32 DBGDEVID,
DBGDEVID1, DBGDEVID2").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/arm/tcg/cpu32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index cf643ce43b1..2e8afc28602 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -755,6 +755,9 @@ static void arm_max_initfn(Object *obj)
     SET_IDREG(isar, ID_ISAR4, 0x00011142);
     SET_IDREG(isar, ID_ISAR5, 0x00011121);
     SET_IDREG(isar, ID_ISAR6, 0);
+    cpu->isar.dbgdidr = 0x3516d000;
+    cpu->isar.dbgdevid = 0x01110f13;
+    cpu->isar.dbgdevid1 = 0x2;
     cpu->isar.reset_pmcr_el0 = 0x41013000;
     SET_IDREG(isar, CLIDR, 0x0a200023);
     /* 32KB L1 dcache */
-- 
2.53.0


