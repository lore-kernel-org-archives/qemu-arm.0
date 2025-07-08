Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A15C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 20:58:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFF1-0000gH-UU; Tue, 08 Jul 2025 16:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZDrH-0007s2-CE
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:20:03 -0400
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uZDr6-00086H-FP
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:19:57 -0400
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-6fabe9446a0so45091226d6.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002354; x=1752607154; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=nh4K83BCOakJ5XXA29pCLwszfOv10O2HVUmBrG4keb/Jk9Y7NLfk7JcKRPTW8itMFR
 oe/1T3PiTpswA+ar4EVsl8T+HaA+diLUgm/zzRm79OIJkOVOcynOMyf21o7+qxzfNoU0
 jvYyFh6dVjJ9jDMBB+loBg3xr7i+gNFt0e1M+xW2bvd//IEpQ53369fc+413nYk+Bui7
 wYg0PKEBgx9u7EdMWYOGl141qOzcr0wj1NiUAtdKOyJ5OG0pT1g/YS1nrvKgUHROOXcP
 QLpY6PchjhBzXcMCry9tWqhPW6AsH4oQ7rOrYUHpKloVeHHgRkyZKKHHVqMTJ530s0zs
 Z3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002354; x=1752607154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vSHu2C6AHkdi6I2MI+MN+9VTwDs09gk+qY11owIPdS8=;
 b=HJ/YFaBO5iB5WtfVOSu16cPd3CyXe+XOx3j2Y6hOOtbgWtm3w2NVRNMDS/EvnGZqfN
 WsGidIWQpNfk7D1+jwz8xssN//+hJmFySNlH+/h8fu3ZFdn168l3sNU6vxcAbC1Hk64n
 fDnMUC97C4t7s4XqcKekZ/Br3EPzJog34TTY8WTBKx5ZRHDuVfVoETQRXKoEBj+G3ux/
 MXs0sjtlHQTT7AixK43+78HMsvlECIatmf5fKC/RIil7OiMGL6Ib1n435OBBL/ylfk6N
 Ufw+tHgn5hMHSjauiBqFsWQfWdW4LAfyON1Z8xDrgad7CgooXSJZjaXQITbVIvHGyHNg
 lEJg==
X-Gm-Message-State: AOJu0YywiS14I+aGOKCOL2SZ4SyGAJQQiERbn65UrZDUV9xvAdVsNfRv
 25QYo1L5r3a2Lu/nQMD20nGyCIoUGeyOUSIoK1H4zS6fHWe7EeOatTwBSD7yi1K1lSaTXmi32dh
 RaNtl8sk=
X-Gm-Gg: ASbGnctRg2UrA4d6jevtfiQEAKRIkVB/EuY9j7g3EFZOGyM7wBdtV/0AwSLVfGmRrQ7
 dGABnxa4GpaMNCkEoHLkVF0N1cZZfxwwUPfqi0Tx9c1FnN3zWU0nbZrHVmG8A3LpWn3iyvvsrWP
 tGlVsum4q93K96zNoKRwbZoI96pCzkyIRu3DsPYIz759zdwcrQAQ7MMX1aIz2zPzcVipR3iizn8
 AViMTe/QV4Q0AATTrHG50P0HwZMDbUmh7g03iFPJ81fN7ilys2aTWIjc76OmfZ/y8ZIZIQ5WFxo
 y0CkSyvdMkyuUzU8MCu07RR/Tb5qmo7MFEcoDRtN9z/bXO3VZ8Ia+V/7+xMGKsK04Oo=
X-Google-Smtp-Source: AGHT+IEPVtapxFZtywAliaVxF1CHWD1ZAc5Em284q4ol+mGChMbTsCoMBELPXXvtyKtgjOyuBt2igA==
X-Received: by 2002:a05:6214:31a0:b0:6fb:1fc:788e with SMTP id
 6a1803df08f44-70489abc6bcmr10112406d6.2.1752002353700; 
 Tue, 08 Jul 2025 12:19:13 -0700 (PDT)
Received: from gromero0.. ([189.110.24.38]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-702d638846asm56289096d6.22.2025.07.08.12.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 12:19:13 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org
Cc: qemu-devel@nongnu.org,
	gustavo.romero@linaro.org
Subject: [RFC PATCH-for-10.1 v3 1/5] target/arm: Add the MECEn SCR_EL3 bit
Date: Tue,  8 Jul 2025 19:17:00 +0000
Message-Id: <20250708191704.1068604-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708191704.1068604-1-gustavo.romero@linaro.org>
References: <20250708191704.1068604-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-qv1-xf2d.google.com
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

The MECEn bit in SCR_EL3 enables access to the EL2 MECID registers from
EL2, so add it to the SCR mask list to use it later on.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c8cf0ab417..0f64c7b163 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1717,6 +1717,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
 
 /* Return the current FPSCR value.  */
-- 
2.34.1


