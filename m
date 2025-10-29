Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562B8CCF9EB
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 21:56:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEE93-0001Mr-HI; Wed, 29 Oct 2025 17:55:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE92-0001K2-89
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:55:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vEE8r-0008Fp-3G
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 17:55:51 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso3587395e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 14:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761774932; x=1762379732; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOPF1zFpZ0IVButgmQFJplfYa1Vz8SXRSfLGOFADvUA=;
 b=tgGHM3mGmJyVwgKqVCCWWtIUOLmpFS/PaieEZwfgVj9hqyjhadtu/zP/9an//y4nls
 OSI7PEKPFDT9KshToiKCKMXjgwcpJmtdKUYBz65DQmHLY7EZzUR8sXOWfHHnIFK85jaL
 7DguQGGfy1H+pJNBRgyl1nRhyBuaGfQLE2bXmCtgQu6jK5eE1b7l+gBSuK2E61fOmRki
 c8+Rr8xaZxoabKV2C23sEiDNBnFRs1sOA8pYF7N+0aRexZ+J1ok/V0dMLeP8kHD5lnsy
 4mq+UX/6aC7jFBsJps8AWbkSmpPibJq8R/eJvllQQ5W0SlEnj7jqeBB5YuoryIR9AQds
 ZH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761774932; x=1762379732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EOPF1zFpZ0IVButgmQFJplfYa1Vz8SXRSfLGOFADvUA=;
 b=ALQeVHb6l/GLcOZDm/6VBjErzP4YgG9qziAKaCnbCsLxKzUjzc/ppj5e/ozfzRxhZ8
 ZO8BYpNl1xXHV8mYOynFXjMrG3gQarSWnBwPzJdoRBHpCFwPK7WVOuJaN9OcBYGS+xof
 1jPgVZtcFoqpqUDzsyb3aLQc3jrbPnYE2upbiRZpBnik9Oo0oTJImPG3gcToutRNfQ12
 6XlqNUtiHRC9bwKXTifnl++P22vppY1/941f8osjyjDE8764886CFIbO/o8vY+2LYgp2
 xV94U6lWwlUrAjC5tiNBCo5Tu0sKNmLJZS9bS/fm19JL9oYaFLYt9YPoJOKa5Rg/i9cA
 g5xw==
X-Gm-Message-State: AOJu0YytsFse277uy1+mirZrrcqmdY3QhYNwCiEf7ZnTAv1l7ZyUNYrZ
 AeqWZBiLpx8Dyhh897EJW+dkOhcNNcyyc5yGMypfJyKy0qiWBv0zc4GEj7N8wTLPRb7gCu9Pyxl
 8IfWuLcY=
X-Gm-Gg: ASbGnctIGmO7qcgrWr4ikq72dMZyFN1/6SpNzAIn1DS4VB8WHZ7QUQVU3s8h5CK9Ib4
 Nniy7f6a0MPo2QS4Q2/xtebDfHRKjjMy4HU/bjxX49dBquiNpuFSiys1EK1oFQ41V5Dj/44sJL8
 cYjvEMIV/6j2goxoxWgDA35zJ1W69eTovYHC4PaCKXQT+u94BIGNox3lc24ekkSdDrEM676Yef3
 SEQ6RHlQW/QK76bx5R03Ek0qkR9LI2qATNUlHfqs/LWkqWrGbrWKTpSn4SXUEwx2+2Z4XELxc1Y
 Sp5IcLQ1z8OtPhtzMgfsy9taawikv986PVOgfpI0fnPEV/DIO5BjwKSLGf2NMTdVAawLQh0brgS
 s+gZFfVSb+JWjO+6+QgOl3uM/ty5RW4AR3V5QlDMOAoZPEnxDxkG9hcBjNU7HyckBgymw4Qn2Lr
 ZXtJhKkmhh6WSm2Uu+0Hqi9+Q48wIS1MK0xR8ZH8Y5f3665MKhsg==
X-Google-Smtp-Source: AGHT+IEl4nUv2n4I+KrswPcLjQvm2w+xDSmJHfLBFVN5aeuMLEmDwo3pmxbxmfUOW76fgzkvzkSriA==
X-Received: by 2002:a05:6000:2307:b0:429:8d28:4079 with SMTP id
 ffacd0b85a97d-429af002489mr4416430f8f.62.1761774931664; 
 Wed, 29 Oct 2025 14:55:31 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47728a97656sm3936615e9.9.2025.10.29.14.55.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 14:55:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PULL 15/23] hw/arm/sbsa-ref: Build only once
Date: Wed, 29 Oct 2025 22:39:52 +0100
Message-ID: <20251029214001.99824-16-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029214001.99824-1-philmd@linaro.org>
References: <20251029214001.99824-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
Acked-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20251021210144.58108-7-philmd@linaro.org>
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


