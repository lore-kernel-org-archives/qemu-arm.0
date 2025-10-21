Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60741CCD1AA
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Oct 2025 21:03:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBJVY-0005hK-5E; Tue, 21 Oct 2025 17:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVV-0005Yi-LD
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:03:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBJVT-00030L-S1
 for qemu-arm@nongnu.org; Tue, 21 Oct 2025 17:03:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47106fc51faso71684465e9.0
 for <qemu-arm@nongnu.org>; Tue, 21 Oct 2025 14:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761080578; x=1761685378; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GtB2ocPB+ydPrqCO0K5hO1zGMiPWbUCMmwjdYL4GuVA=;
 b=jbMk/LgK2oPm3w0fu4LaSvl3rfM1wIsT4/0D9RlF7C6Ts+SOB+memnkTe9DQNrGUvb
 ySWK6j65Zqv6VpenFRcYqgOsRRvX1f8dkMuqzIKjcCVCdwTEWmvAMDYZYhNDXYX7eike
 z/kF9R+Cam3MP5e9M0Z5xPVKhxOsJykJdRgmNVgW+eIB6flLocq0TUCgxHQlflDNnRFM
 pZ5yJolVlA90WEiw4jVIgLmY+DeTca4/ANeHJImi5fddfDQs0ux6hPdEjZZuEQwuE2Vi
 J8SJtDtZZFsow1TI0Mdu47ZiwyZaZIxHmzhCE7q1O4+gY95rqE6ZZaUFSppYrPkHnMLT
 +psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761080578; x=1761685378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GtB2ocPB+ydPrqCO0K5hO1zGMiPWbUCMmwjdYL4GuVA=;
 b=WpqIWa0jSUV6YdFQDV1g5U4igGfF3rzU86c6x00rtCt6dEb+dmQmIhBrzBJpBUObL/
 Ql9CQbcR6ZakwA0aasIS8uTZd9L3Aas0mpSWLEEACCrd7japQl/FgZsK7nO7XilyvrYn
 f/ujY2CxlXNQqPifGg6nNbYKZhcgC/PRPvw6+ilD08pB66AXJXbdHmtXF0IbsO8N0Q1b
 h95VgdzO2E6zHyIzLU2rhLc5PJMg9ALDyUdQOfd6Rg+pStDfXmgsD9eyaw4/y+I+OTdV
 FOjt8oZhFx5DsOICaWhxpfGgdsRfB+X6xyOkrUp6WAYcai+fjJygmE7tTapn86Ud26Lw
 3Jyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVsS34J2OIAcILgItlFyg2885SKWPTMulAUPVpdR9gEyGHSKU3YDan7F+QoLaVTffhmzOo3ofSqw==@nongnu.org
X-Gm-Message-State: AOJu0YyXv1LbMJvrx/CdVE5tsjfmALcTQn+0a+aO/qkJyHt2gWqtaRhL
 WL5I3DDAoKaOWeW8Q2nBQwNWbNlj2GKQ9/xAPCcj6uRdlP0UwNfjn+VhIsIzlGWbvig=
X-Gm-Gg: ASbGnctCZCu3JgPfj5YKcYtexdYEDvqMG4Hn4GTD3Pq3EpWQjjBWSvnMMAYo20i1IHP
 LiCh3HA6/sHsuvWPbTODyhN5j24jxm1ddMWSNtpP51zL6vSULB39E7b4YAm0wpn66Om6P/0Sjia
 Td2OglMd2ydL3l9QGGgy1gmWndABBWHkKttFdobo+cV+RVGVX8jBKe84CwEJ3WHe9i26uziLZQ2
 9spKJXY61gM6wUdVaeEduY+NIJ5fzl72TvvU21+iCRt30L5SBi8fq+WSZa/4DlcDV7EnP6kjJXK
 Um5gs7dkBmLsUjAescdWHviSl75aZOp7WJ2aIR9uoCTjJzmMug87GxWDTx0QV3FvwbbwAJ/ZvWq
 z/z+6Dg7nrVn5Zt0dGfSKv/E2evHQxt4BipAiAsqFFKLVKpQ/HxMXdiAZPFYvVbw6maIIfs300D
 CEuFeTqDsdXrJcze4QBEisgIy1lMi1YsrICQTUTe6hgt9zjDaO1s0dr4OgPCeR
X-Google-Smtp-Source: AGHT+IFfGsWANV7nTCUNayZ9qyL7IwEb8TOh/i/VrPGVuE8HVwdG+R96ozNxvHySuGJ5G4pQ8jBmJg==
X-Received: by 2002:a05:600c:1d9c:b0:45d:d1a3:ba6a with SMTP id
 5b1f17b1804b1-471179174dcmr153550595e9.33.1761080578080; 
 Tue, 21 Oct 2025 14:02:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427c3bfsm12269185e9.3.2025.10.21.14.02.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Oct 2025 14:02:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Luc Michel <luc.michel@amd.com>, Peter Maydell <peter.maydell@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v7 15/19] hw/arm/sbsa-ref: Build only once
Date: Tue, 21 Oct 2025 23:01:39 +0200
Message-ID: <20251021210144.58108-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251021205741.57109-1-philmd@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

Since previous commit allowed the use of accelerator definitions
in common code, we can now move sbsa-ref.c to arm_common_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 hw/arm/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index b88b5b06d7e..531a635936a 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -14,7 +14,7 @@ arm_common_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32
 arm_common_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
 arm_common_ss.add(when: 'CONFIG_NPCM8XX', if_true: files('npcm8xx.c', 'npcm8xx_boards.c'))
 arm_common_ss.add(when: 'CONFIG_REALVIEW', if_true: files('realview.c'))
-arm_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
+arm_common_ss.add(when: 'CONFIG_SBSA_REF', if_true: files('sbsa-ref.c'))
 arm_common_ss.add(when: 'CONFIG_STELLARIS', if_true: files('stellaris.c'))
 arm_common_ss.add(when: 'CONFIG_STM32VLDISCOVERY', if_true: files('stm32vldiscovery.c'))
 arm_common_ss.add(when: 'CONFIG_ZYNQ', if_true: files('xilinx_zynq.c'))
-- 
2.51.0


