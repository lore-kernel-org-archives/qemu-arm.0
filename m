Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B1CC9EC94
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:59:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJl-0007mX-5W; Mon, 12 Jan 2026 09:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJf-0007e3-DN
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:48 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJb-0001WR-Pd
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:47 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so1070120866b.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229682; x=1768834482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wscBRTm7STUtvNgIyID3EdUtTJO2sL4HdK1iLXIRQS0=;
 b=bHV8lMkWX/RmKvbRUBv5KAvQQp9XTqy6wDaFa2hHlbbNLFzM4bjuzSnk+SWQGWStKi
 2rkiDpXA4GtnVteK9EwOujzNbsx15L4iQAemrIc7hqwL8llVUWGySQb/NwSSQ4Eor4B+
 jIRXKP0wAxgYCHrhpJOhkOL2GZ2Yw8ryeuBiQPdkWHvHb6gSfkQMmX04l3bPWPUgBvSG
 1ILkoxLjr9agvKyZ8j9M1g2yw/WBfXT23rAOYvS0rGQNQFszQM2epThXK7m2Hv8Z7Lb3
 4GiJ6Itb3/dfIw5yxGRpXbtwPEBaKf6cNMRUDzkf/BTpf4wqzER52uCJ6zFn5Zza61dB
 3GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229682; x=1768834482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wscBRTm7STUtvNgIyID3EdUtTJO2sL4HdK1iLXIRQS0=;
 b=Ixa+S6E0o3ukseYEsu+LmelRWzkf0vWbfyfBVh7rEOQsRKqLtqsvOVbHwmc8/mcAXM
 b7jKVjtUTMX4yk5YFhaADh1kv/FSg8Lt/OWJEeHrzHR1BvoIWEAQe+vgd0/j5/4VUOa7
 +tKHYwnVTIDkHWdGh/zapovgrZZHGeopefds0Q3XdxJcNYA9NpRyO0UGHKCj6YtRMrR2
 GaSbVlI6F3mj0svYZVZ4KhlIX04cPtqEye32cIqGJDU9Xj+JfQ3DmhnxB1czgyCOUi3a
 ZS/qH9vRUIJ5HjROfRLtupyGYO4+be6vR4TVIszayAfKUEfbAvVQ27TxhXZCtfCcU/Kf
 1LrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOgyKPnZ111PfR6ju/cIQ6txJqb7qqJmLA08QyhwvZ0/7pXOrUizdsiFJbI2R7kXpbeEdFAc1FAw==@nongnu.org
X-Gm-Message-State: AOJu0YyEQF7QCuAQqJoMfbkKJo9kdNPhXVXXDItn2yhbWRGgzdJVgQtn
 UiNpaQ1HMQdZj+xUMJb6tfHTTSWNs+EyMKpsnjJ5MNN8SIfoogtQm4Dq
X-Gm-Gg: AY/fxX7/N715LN60rSiu6KyyTg5n1JulrIYf3q1mcU2yY02n6RNcfk7bS56BMYNpOex
 PyQlQ5px1f78nC88UD10EpgvRUu+MXLcbwUKU35vziv9NtQBrxIts4jOfFaDjanUsmG3flIsNRw
 kOgI5s2uJA2FeBW/YUgDrRktE+nAwB0rWWNEAPn7Sx6i7KdmgGCRRLFpBZL7Ir9IGB5DWaANUKr
 b7axLZpJYxL9WOii2eLoQvI2Ug2cqZnXChi+9YFO0tEb1OdoO8LlUp02DKciRmTFxW3HdpazICl
 sNiVLOGFtnj6SdtnPxFF6O/F8XRl2qPPQmETonKncQix+kRhh35hKYMlTZpLdVayvJjRd9hJj66
 URpHzEY07Foe1aAaAU6iQDdNr53iZX3mck2dv4SyipXGR1pai8EWEn1NDV2GBs0ckUO9Y3Eo4vq
 A012+odSpPJzt44oOJ/Hb/vztTauEkwiCNnzDr6tssy+zVvHLyFuhuEkgGws3h+TzoWCpynTnz
X-Google-Smtp-Source: AGHT+IEwu7WuTSHRhbEc9ACkxzfgXWJE7fekxK9tOyd5vaLjmsb2OmmWD9RV/pRI8f0kHh56EQdteQ==
X-Received: by 2002:a17:906:4fd1:b0:b4f:e12e:aa24 with SMTP id
 a640c23a62f3a-b8444cce26fmr1917157366b.22.1768229681474; 
 Mon, 12 Jan 2026 06:54:41 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:40 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 04/14] hw/arm/fsl-imx25: Apply missing reset quirk
Date: Mon, 12 Jan 2026 15:54:08 +0100
Message-ID: <20260112145418.220506-5-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Just like the Freescale MPC8569E SoC the i.MX25 features an eSDHC but
as little-endian variant. According to the datasheet TYPE_FSL_IMX25 requires
the same reset quirk as the e500 machines. The quirk was introduced in
d060b2789f71 ("hw/sd/sdhci: Set reset value of interrupt registers") for the
e500 machines, so reuse it now in TYPE_FSL_IMX25.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/fsl-imx25.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
index dd670827ff..9e02063533 100644
--- a/hw/arm/fsl-imx25.c
+++ b/hw/arm/fsl-imx25.c
@@ -243,6 +243,8 @@ static void fsl_imx25_realize(DeviceState *dev, Error **errp)
                                  &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), "capareg",
                                  IMX25_ESDHC_CAPABILITIES, &error_abort);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), "vendor",
+                                 SDHCI_VENDOR_FSL, &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->esdhc[i]), errp)) {
             return;
         }
-- 
2.52.0


