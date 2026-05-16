Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EF5CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:17:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIdk-0005Xl-04; Sat, 16 May 2026 13:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIdc-0005MA-7S
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:21 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIda-0008MZ-M7
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:17:19 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43d7e23defbso391155f8f.0
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951837; x=1779556637; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SS8dMyDjoox81LYiCY5mlEBMje5OFAuSHdoJLo5BrGA=;
 b=o6EOgSE6yJxEIp9FCvdOUDVKSswAN+ABrb0+C3UE2tcm9tix/qjCVzi/nBTuE2jlzd
 4PwrEDjm83/6zEm3AtrEn2gL+Xc7s6elqI5slpkKQYy9xXfClbGOLNKxKxK67I3Gx8ON
 VtZd8jy7Bj02A19FlBXESY+/uTy7ZlKnCotNIYJaChqEaykEGxo1a7O+QPbCBhau64J9
 sEDW7MLtmm+s9QvMtAOp4V9FfopTKKASike1nWyTPnwN7R88RMl+TxsLvcjB/6LhreoD
 uFQT9XS5yerUuoew1uY2hgH6EsX0RNQd6uTdWp78kYtkjHlD8j+nyDs/LcB4ejRvkkF3
 Q+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951837; x=1779556637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SS8dMyDjoox81LYiCY5mlEBMje5OFAuSHdoJLo5BrGA=;
 b=HatRJLcsNnwNI6XC4dcW2VujHZjDLExx7vpqakY4v9nMTERKVOI0Ve2IoQGowbL75w
 MBA5YNjYcwItZFWcr12c60ZBYp/DAAfvgX4/3fZEkjAG7G5eA726buKrmVl6VEgjK3oM
 LCJbw10mezq7SfIBVGv8WkHn9bp+//MqMaFa5hvt5aVE7fORFq7uHQAXKsrtiqq4F10n
 z4dPkrWFcgYGX7g6DgHejuNMbShIDLVIdtItSZsA0uIHR75hkx+Dqz3kJoN0QiQAcND/
 ykKSAI+riiLQsTRMwjPPn8Jwd9Z2IW8MufgafbMBWSrWcW45uuyf0MOYHvW2vOBmeiIx
 T90Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+AXoF3Qpl8lhWuGppRKPNpyENgG1+PuvXcoSj91qjbv9qHLT+KDpzx7NsAnPOK8WPWc5R3KScxzQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNKxvG8Z31OpvZe2J7mQ2/cSyZh8XNCcXy6PCpyhMeETwEF4pW
 2dPv2tiqiXKdSSR8v+edg6f2MrJsS3thYiMjagBJaJ8uBdPIZjPPC0lUGM4FNISqMLc=
X-Gm-Gg: Acq92OHTaP0yOgQVzpepj9zsXQwg17nQFaeCMeFQZWMyrMJ3OBaTQ+w2c9dlkrGGnrt
 o4tDS43sFQBjkZ5oU3rOC8XOXZMmhMdo0T426FVwoY7VGdlteuCCF+tEm7AjvDzv4TJ8oLyw60L
 ovG99FnGMJ8CdgN+Ah4K/5UCQNfc5DEh+gTK2B9aFJ3zZvODtiVOY2wm+7AQZy/pEb8nJESpI33
 bg6kvHkQUEY1bVqGsX757FCOcDR+Q49gRMOUabOEBZ7U7cBCo38NtuiubvVYdxHO09eXwhpNZ5v
 tphjD+/NTIGpo2SkMgb2GQCPw9O2HxbYAhVr7dxlusLMUUQhyC7SSi6FV7AX5iDwbCsNIOIjGwE
 XoYYwEcfTbdo1lc0G9fcuir8Iz/BKpg5w3nR5XVRtjORK33g4JHIoZ/WautHMdMMWDcShx2hE2T
 3tUwBQq2uUpp291UsAwD8zTL+Rr3xmakBTQavjiB4zH+sLbsVc7zn47hrzh+jF+duPGUoWnFgu
X-Received: by 2002:a05:6000:2383:b0:43f:dbbf:6d93 with SMTP id
 ffacd0b85a97d-45e5c5f2032mr11787940f8f.27.1778951837035; 
 Sat, 16 May 2026 10:17:17 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45e6a135f0csm5607369f8f.27.2026.05.16.10.17.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:17:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v7 15/21] target/arm: Implement DBGDEVID* registers in max
 AArch32 CPU
Date: Sat, 16 May 2026 19:15:17 +0200
Message-ID: <20260516171524.19184-16-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
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


