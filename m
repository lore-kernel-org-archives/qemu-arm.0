Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A937C9EC8D
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 14:58:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfJJl-0007mt-N8; Mon, 12 Jan 2026 09:54:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJi-0007jH-JI
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:50 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vfJJe-0001Y4-HP
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 09:54:50 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b871cfb49e6so160514766b.1
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 06:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768229685; x=1768834485; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NZ8E/vLXW/n+4mH8Q0iJxaZz9OiFrfoLpfuE5uF7VSk=;
 b=CN2H+i3MDRtsZeQF2HNHqA3OFkPX48k/GibIgdl5KCyaziTW5lccoYNnAFL3hH5/j7
 a/6nUgFAqXG9ViMF5plNQw6aU/bnadbnQcd31Bu7Q2UCcYWcP5CaERP5F1x9QZYrwarT
 gUvRRNY7qCh5g4f3t2sxTp64ASLP6tYf8mvnlfn5ki2s1HeNXAcv6BZsPVCNlyR5RZeL
 WxTnKjOSKquAJaYQh5NeFAzYRs/AuesIvSbibulIbWV/d+NNG92XTvsf8DvgcbB4Y6kt
 5iAazAluVlbtQiAWIybGV35Hsoq5TiAsB9V0u1hv1Ywb0bg0txzt5AA9aga77po9l5If
 XRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768229685; x=1768834485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NZ8E/vLXW/n+4mH8Q0iJxaZz9OiFrfoLpfuE5uF7VSk=;
 b=BRyPV/apNcqpflaD4gPo5LuW/wXZpMaYKp4i3AtRBWoExYzFyl4W7AXiArDQB/r6Wv
 0HoJm63QhI4/PIDb/XijAfeiglUciNY3oSOPKMHbCEyiwiGj3jqLee3W3zVOMh0Q06bC
 +9OnFjPqfoEJuy4gZOf3PutH2GWUaqy8qWAsn6g99Wer8b0bQEPPhEtbXTJl3+W+/mO3
 aoTRDRqoFKZGyKcbaMEykcfx63+hBxSzt89tw6Z0UB1F8wgoZqe2dJ+6tOy4qMZHm/A8
 Iw5/g52xYo1A3c/2Foyoy7FZwEjbuwL69RBuKNMF6pGYIS+47CgIDjvRJsw0z0aQep1S
 JiVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO4atV9Nynh5PYpWn5cq+0Q3MXClRzlzOjic0mWrtzsP2Y2OuR1fvMx1tZojYMlNhMicuBD9GvOg==@nongnu.org
X-Gm-Message-State: AOJu0Yzg6NaQNvwkUIxPIQRrew0Xe0Wi6ErWXxliQQe5liww0lAIef6f
 Auy1aHOYNXaeZO6kRuLL+c2DNUKMjbmjNBW1PtGvPAJ5k4rqLl1ZusnV
X-Gm-Gg: AY/fxX68fFMZRJt44Le1Sx+KV5NQxFXso8fGIr83L6m/wgsX8gbVCbiFiTYwEGM/V8v
 /zF+NaIDGh7zvQRK7bznRqoDLb70OxAxLgZxif9exSSZHAy3ebs1oDTSlecHHZmzItjaXcQ7+4A
 ZTAIciyT1BFMButjNOtxAD0l3rhCr903PBPW/fGgRgtKmccqVbyqgFSRKD7jdTqx40NQyNFVKSl
 xwNPu8WhblqTD33iu/tSzYIM4jkV/RkWIsM0S85MRhSlHs2nkIt6iLXajgk8+9f+cxAH6D1qLve
 W6pSaED4rYUAFyH5jdpnwk/omru6Rj+sI0K/Pl0xOgMWvuf5uEcvTSDcz4vSYtq8XfgGoY/VOea
 o+HocA0XevWqbJGTzwz2olmvKBl/aNIiAQUoJgtfjob21sfcXK+e+sszHKidrn6W5UiYVUOQy56
 kzm5zeY0uWvxfZvs/jtt0fn1zUW/GIpGAvT4qC9S+pHOyYsgDRdsiSvjNWs7GtmXpxyfp0jd4F
X-Google-Smtp-Source: AGHT+IHsRslvJQAddX3envb+UZTEs4NgJTW38nwMX013zXf1mqEFwfqYAI4cCC+kyWDYSBBNCsEBDA==
X-Received: by 2002:a17:906:f58d:b0:b87:1b23:cad3 with SMTP id
 a640c23a62f3a-b871b23cd09mr283903566b.9.1768229684803; 
 Mon, 12 Jan 2026 06:54:44 -0800 (PST)
Received: from archlinux (dynamic-077-188-226-222.77.188.pool.telefonica.de.
 [77.188.226.222]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8731f0718asm37387966b.67.2026.01.12.06.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 06:54:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
 Bin Meng <bmeng.cn@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH 07/14] hw/sd/sdhci: Rename usdhc_ functions
Date: Mon, 12 Jan 2026 15:54:11 +0100
Message-ID: <20260112145418.220506-8-shentey@gmail.com>
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

The next patches will introduce eSDHC device models (big and little endian).
Prepare for that by renaming the functions. Also, this makes the code have
similar conventions as in Linux and U-Boot.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 779f411bab..531dd3c291 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1659,7 +1659,7 @@ static void sdhci_bus_class_init(ObjectClass *klass, const void *data)
 #define ESDHC_PRNSTS_SDSTB              (1 << 3)
 #define ESDHC_PRNSTS_CLOCK_GATE_OFF     BIT(7)
 
-static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
+static uint64_t esdhc_read(void *opaque, hwaddr offset, unsigned size)
 {
     SDHCIState *s = SYSBUS_SDHCI(opaque);
     uint32_t ret;
@@ -1673,7 +1673,7 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
         /*
          * For a detailed explanation on the following bit
          * manipulation code see comments in a similar part of
-         * usdhc_write()
+         * esdhc_write()
          */
         hostctl1 = SDHC_DMA_TYPE(s->hostctl1) << (8 - 3);
 
@@ -1716,7 +1716,7 @@ static uint64_t usdhc_read(void *opaque, hwaddr offset, unsigned size)
 }
 
 static void
-usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+esdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 {
     SDHCIState *s = SYSBUS_SDHCI(opaque);
     uint8_t hostctl1;
@@ -1872,8 +1872,8 @@ usdhc_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
 }
 
 static const MemoryRegionOps usdhc_mmio_ops = {
-    .read = usdhc_read,
-    .write = usdhc_write,
+    .read = esdhc_read,
+    .write = esdhc_write,
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4,
-- 
2.52.0


