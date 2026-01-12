Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6D5C9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 15:01:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJj-0007kl-9o; Mon, 12 Jan 2026 09:54:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJc-0007c2-7x
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:44 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJZ-0001VY-6H
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:43 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8719aeebc8so179764266b.3
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229680; x=1768834480; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/Bc8ruLWvUKFLbKbwJTV3mI2vIezZtb/awn2u9R0Sc=;
 b=Japl+Vg0wDdi7c/DAp76R/u2Z02OBRMDSSBoAMon+P55D1xxTlv97LfDDaKrVeszI7
 8pZTx6n9V29xq/2GP650ZyCT6/sDd2DNccMGsLVwgTviOSlE7K5YcQO0Os9eWIpdPU4x
 xfDo4Zh9OGwQC6EtrV5Odq2IZQ2/Ye19IJcdlcTTRpI8UZyBEsinsqWA4tML+T8Aq0QT
 kMRuiZmJJR1EfT9b917wh6Vne02IA/s0jhmEbDF74c4X92SRAeN++/iF74aq86fQkDoD
 1BdiG2HBKeFr8jthfSixexDWRjzHN3MiE7d5m7WFJqVNIVssR+VC7MQz57ZsVEzDVNdl
 MTkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229680; x=1768834480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K/Bc8ruLWvUKFLbKbwJTV3mI2vIezZtb/awn2u9R0Sc=;
 b=PT43P1lsBFIWoguqdG14u4/9MMdKH5CeG5JGnY/hFdSp9YQiw5SSIrNhC6YMs/TcXB
 uAWP8httzBtMogIIFH7owgW2z/gw+aMy32i/1Qzti67Kvu88Bo34w5/+0c8TfcLZ09vN
 13AnkwtCHG1f7/tfQtsHlOuJqqfSv3h7TF+ZOPrq1/pbqBKDxb8s7f7cQGNTOfhFX4zU
 hyOIr6xJ679bVRSUACMHY1xn6hYTxrsFDf71HdQb2DoY379liAstlLM7dMwgML/5mvQQ
 BWsA3XPpEWaTJQY+EZlN6HqHmhe4zVzgx6lWEi8PGhWhoZa60FJyQXRR3XCwF0UmwlpD
 X81Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy792qpCzYlFjjxpE8T+mA3Zt8Ik9fQvzJKtkWscOlgcqhEu7RtPLGydiNHVpb8IM3IHj7esM+FQ==@nongnu.org
X-Gm-Message-State: AOJu0YxDvjF4dUloQzqiV/UPMPqc/3SdlJX217U3MJYn27aw4vJN1rPe
 nSgddpvaJ0HBfARC2cX9+a46kkjPPnc7g1wgmbJv6P+Mc90lu2NE1dCv
X-Gm-Gg: AY/fxX5PPa2epbNUno6rwU5kUmIMVbSrXhV3aeYzCwFdFFkRtUy1rfotNWEQ1iiYjBg
 id8/Tg8p5XN3YL1uPFZr69t6V/e4pnB6cssjx7GVWfoV3RAuWrKgaMfWwLlywrtEmP7rjTEdehy
 tI5TTEVVC06kvYNvok791jN8s2I2vKZV+eGrJjcxpVrQ4AYNI5hk9I4iqm77dTT5AY7tsGQDHkO
 mFfWDcZpNuPbaMsEzgdUlZMNyX7vJvS5PprNgiIjxTtZQkInb79hRMbrUnMVHBQappSjCmFb434
 AbCml1Lq5N0dI/4bej6e1Izi6njtbOdoO7S2SH5dmhzH3nAMR/G/IbtNgfCb4tayId5hb7AtFWj
 sDqersFvSHvhbNY5E9eEwygplU7axlgLlhXHjVx1xX91ckM0wd6YN5Z2H18aRtZ2vVJvC5TGifl
 hhjXsT1sDH/9pl+GcY2mfp5E1aP0oLG6Fsgt4gmlk/vFR0LWGXAhd/DArSdMyVC75TcD++izrO
X-Google-Smtp-Source: AGHT+IFiSdFwTXIhd5gYIuSg1GPgu2PpSZsMBZMIssC6s2idbJNbLr9CJghzMhIYm1T/jXyRlH/1IQ==
X-Received: by 2002:a17:907:689e:b0:b86:ef31:c2c7 with SMTP id
 a640c23a62f3a-b86ef31ccf3mr507569666b.42.1768229679538; 
 Mon, 12 Jan 2026 06:54:39 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:39 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 02/14] hw/arm/fsl-imx6: Remove now redundant setting of
 "sd-spec-version" property
Date: Mon, 12 Jan 2026 15:54:06 +0100
Message-ID: <20260112145418.220506-3-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112145418.220506-1-shentey@gmail.com>
References: <20260112145418.220506-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Now that TYPE_IMX_USDHC sets this property internally it is not needed
on the SoC level any longer.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/fsl-imx6.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index f3aa1d8150..46967b7488 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -323,8 +323,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
         };
 
         /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
-        object_property_set_uint(OBJECT(&s->esdhc[i]), "sd-spec-version", 3,
-                                 &error_abort);
         object_property_set_uint(OBJECT(&s->esdhc[i]), "capareg",
                                  IMX6_ESDHC_CAPABILITIES, &error_abort);
         if (!sysbus_realize(SYS_BUS_DEVICE(&s->esdhc[i]), errp)) {
-- 
2.52.0


