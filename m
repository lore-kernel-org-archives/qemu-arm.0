Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416FC606A31E
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Nov 2026 17:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZfXZYQRZ
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWGxu-00064N-NR; Wed, 25 Nov 2026 12:39:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWGxi-00060n-T4
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 12:39:20 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1xWGxh-0007XT-69
 for qemu-arm@nongnu.org; Wed, 25 Nov 2026 12:39:18 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c4cb6834eaaso138764166b.2
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 09:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795628355; x=1796233155; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=6LN7/nCBl3R7cqbbjDjb7Btx7TMGK/ZL8KbhpfUhEzA=;
 b=ZfXZYQRZtXjyE/vKKyJE+TyWPFX62hZNTflSOWQHNlch1D5odYqYv1j+ovex2GmE4s
 h9/jDDoClqEOQK7VPMqagFXZ3rouT/FG9zBjSBMkucElUtK+HYqSOK1VAbCT6OxXo/Jo
 t1nhMOOr/yY2jpPzUKtVpCVc8aYoaDqTqKuLYybOUwibIr6Yq+r6dNeOXVWYS7sNBrfL
 skkqsKZOPUpJmvwqQkC5dZi6UZggK6xVapgr1GbdweyP0cvuL5dgQqipVN09F2jhOWRB
 v8GzVG4zHcGnCPE30opiYVTZj6PHX8ODXwVItftMhBMqeX+MXnDFkok1N9cxNNry66Rb
 m3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795628355; x=1796233155;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6LN7/nCBl3R7cqbbjDjb7Btx7TMGK/ZL8KbhpfUhEzA=;
 b=lisEAjDzGEurUBaO0Y6Qz0ZbS8ddYKrtCwdpEtfKUNoZjOIlvQEhYKknojNGTAtp/A
 Iip90ig0arUIUQ7ZKcIJR28UvirJ7QO3o5j3j5cHx4iszgL7gZHT+gmKhKB3Q4WFtCFe
 7ClWzqMEDCFLHibPaly5X3uaKc5C52lEO1L5fDiF/6jSvweryVM5oNbeQI2zc2C5oFWW
 WRqY8SiO32nGflFqewrQ2OMn44TtYrks4lM/l3REhzi1Rk3Laf30lvuEWWYhbuRt5S9p
 CFQ5Lny135ox5vJRJCWh2BqMtR7viI818i/rdgLU0p9HwV8Gk7O0awkSYz8g5i9mYy7i
 PoyA==
X-Forwarded-Encrypted: i=1;
 AL+hErH8LrnattpRBB4GUFy8LEYJ4SmoXhUXSxVW0oLm2INgKCZpurnDUBjca+PR+L0QvSeyYoIS5ZnCrw==@nongnu.org
X-Gm-Message-State: APuU4Z8xetKblQv/cJCOiBUlgrF1st5sBro7tba9wcCK86EgvLYbIRQd
 Vceja61IcgC2GmFklF+NntRqgdq4+VsRemzWOY+J1Ls9ddht+npYt/GsX0ovkHVIYlY=
X-Gm-Gg: AZFdTZcai4D2QlqC8wF4mmUwnlY4WgTSZjvS4F6JQ5EYXA+gTaRpxrsKT3zIw2SJWq2
 4vePzJFS3GVZwIp7Q7x/vQhYLJjXs3O3d7fitvi9ZnLeb62CAH6Fb1BIgv3ZbrqmcNWcYvjgxl8
 Dl71zCCmU/38UgfehdM7JUNZpKJtBW+cyS/VBMNkQFP+ZDqSDmkZ250PM7w54TTVlbSu4K8tmPX
 W+aMRRBUHVYIv8BCUMLji/fmCMPOSHzYTcMWmr4R5GYIy6Hm4Yega/F3Kj/uQPWxE+y0LYC0TKr
 EfRfVX11+A8ZYaokugVPFTeXnpQqR38phqvPBsMAetKb1+Kv8Vb3i6dIQfsYMVzUt967/UdFyp7
 CUOgt5E6mIPar2usEIWmPYmltVgCurQrk5VvAzVZOO5rR3M/P8cKqHgx5xSMMnfc2IG9MvkC9nc
 6918WqWpxPdAr3GaEJbgnixDU+sky1ybkDQ/Spp9qq6wBr2FDERqhZK6Ef+eFcHmhAxV5cbYWhI
 se7gdHpMImtXnRVv+djATcSAsPxjQ0K4D1H/GyNZ8Pzq8u0xXu7H/eYz2ynXh7y0XFFuHNxRH7Z
 ZojM2g8j1+datZXm8WduPKukDYZP1MdOGLeoW0mJkvRsmKR3jt59AA==
X-Received: by 2002:a17:907:1041:b0:c3e:d0ca:d2fd with SMTP id
 a640c23a62f3a-c513a5ecdafmr1041976566b.12.1795628355604; 
 Wed, 25 Nov 2026 09:39:15 -0800 (PST)
Received: from [127.0.1.1] ([2a10:d582:31e:0:82ba:bf15:3b4:e45b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513acfeda1sm709675566b.6.2026.11.25.09.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 09:39:15 -0800 (PST)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 25 Nov 2026 17:39:10 +0000
Subject: [PATCH v2 2/2] hw/arm/sbsa-ref.c: Increase SMMU space for Root
 registers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-jmac-smmu-root-registers-v2-2-9ce0f6aa5097@linaro.org>
References: <20261125-jmac-smmu-root-registers-v2-0-9ce0f6aa5097@linaro.org>
In-Reply-To: <20261125-jmac-smmu-root-registers-v2-0-9ce0f6aa5097@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
 Gustavo Romero <gromero@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.17-dev-6be7c
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=jim.macarthur@linaro.org; helo=mail-ej1-x62f.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In our implementation, SMMU Root registers are directly after the
non-optional SMMU registers. Realms registers will be added above the
root registers later.

Also force x-root on for sbsa-ref, which will allocate the extra
space necessary and allow access to the Root registers.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 158b461eb4..ca1ffe5f94 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -129,7 +129,7 @@ static const MemMapEntry sbsa_ref_memmap[] = {
     [SBSA_GPIO] =               { 0x60020000, 0x00001000 },
     [SBSA_SECURE_UART] =        { 0x60030000, 0x00001000 },
     [SBSA_SECURE_UART_MM] =     { 0x60040000, 0x00001000 },
-    [SBSA_SMMU] =               { 0x60050000, 0x00020000 },
+    [SBSA_SMMU] =               { 0x60050000, 3 * SMMUV3_PAGE_SIZE },
     /* Space here reserved for more SMMUs */
     [SBSA_AHCI] =               { 0x60100000, 0x00010000 },
     [SBSA_XHCI] =               { 0x60110000, 0x00010000 },
@@ -630,6 +630,7 @@ static void create_smmu(const SBSAMachineState *sms, PCIBus *bus,
                              &error_abort);
     object_property_set_link(OBJECT(dev), "secure-memory", OBJECT(secure_sysmem),
                              &error_abort);
+    object_property_set_bool(OBJECT(dev), "x-root", true, &error_abort);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
     for (i = 0; i < NUM_SMMU_IRQS; i++) {

-- 
2.43.0


