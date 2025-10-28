Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67731CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:18:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoGK-0000qc-V0; Tue, 28 Oct 2025 14:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoF8-0008Qi-C3
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:16:28 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoEz-000243-1z
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:16:26 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-475dd54d7cdso14117035e9.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675369; x=1762280169; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MMOoNQ4yfP8zRjN/wkqFcQTswPDQJkEjRZPyBLzoOO4=;
 b=mBL6CLxA2L+RZlV9pzJ1CbK9eJTwCmMSHctZOe0EuyvLFVImmCocLgjtxEQlR3nbxE
 9YAUrfno+siznb2VRG7aS6Dsv/TjvmZIHQKeyREjhi02m9D7QvEtgCdV3Ky6YiVkewv3
 0wjvd+3P4bumVRu5Zuvl8kGMYfifk0pHPpmpIaYgKu3nJb6IPaXvk/I6UfALjouODPxA
 QBFHUY6qZfeNq2D/2pLH13JcqCi2MbF98xZLi9qpYM+m2GY5FJpkAHDgqGznAJoJB89N
 vMCIu/XI2QAvap/9kjptXGpflkJuZy7FN7nBfsb3shu0MTYB0QzsGn8b7036+6o9M5Om
 W8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675369; x=1762280169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MMOoNQ4yfP8zRjN/wkqFcQTswPDQJkEjRZPyBLzoOO4=;
 b=lp2MZmch1cCIlq78XjG+piivkkrP/12mXoU2tlOoBAq4XZqauiGWzXP/VBi2XXE5tf
 +gZCDdF/aqpxA4r1a9OHYXz0rLuJG9wZSVNxvvXBbRUPeeZ8ThNoqVXmOzPM3ND725vu
 6c1CeY8sAtYlqrl4PGY7dUONwKkvn/e/mrLng4YBil+nr9oD+JZZp2BQ4jVibcPBUhsP
 80++LJGc48fnXef5htxaFsIU6XuL5zCfl4AhEWaywr20OsVVbvfkRiiCtgxoIbRvFsb9
 ya9OBzUwG7HNJE/U1EkvEY1u+qHfe/vjw2+kQcr6r3nbB2DboNwTVvgm9xrBcsqTtpT3
 Lxgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwj8VETGd9sYLlHnIoPmJxC8mQVvSpOZpw8NnLdpL113feMQ12m8TsSHeeMHexHAT21rvNJzKV8Q==@nongnu.org
X-Gm-Message-State: AOJu0YxBp+zY1pha4cb0toJqoPBWJeDWcQDb8M/KQGJCjjiWjwRQ/rYp
 EVlelLxkNLhsCTGmW2V2wYibHucSE21EHHkkyBKRT2npEP4alkX0Y4Uzjkpt87tSdus=
X-Gm-Gg: ASbGncsD4kRBj5gAjwGGXKeyPk0RGyNLSz7pbIBVVbLas5WFmu3rrlZ1s2k11PsCshI
 QWG/nJbNJ5Eytn68EHfMATjfPD4TLUw5yN7e86XVsNXKVFPzCQUCAPEcTlU54Ngz53eBvuxlbuC
 0/7+GXr/E3UYNE0Bq4b0WMYGpabN1e5r4aFL1YBwnajsDi8qyRzEhhzV+5y1rdkUSTe6Dwz9rBk
 1/LcYaTJR0afRTDUa6msii+kgit8jjzYJC2ioKBZv0uocgxnL5Y0ai2LZScHhi2xHGbgNihfs0Y
 NDqAu/5wyzo1a91BRWXhKCEwGjYag+mvnTFx4/OSqhadswXxTArm/gaFSWnj/9Ajk+adt28fC2K
 T3YSZRMBPBspGGyW28rH6Id0dOzk7O5n/9h6WLuNm8vouQhVRUDOg//q+k9wQmgR8v68aAre6Hx
 fcFKjImJ6HSy/aZCUbR1+vsY8aT8VPzzHrVGiHXUunUoFZxL0AYA==
X-Google-Smtp-Source: AGHT+IEjfV7sF/zvHFmsLDmAn/faukg/F1LWBSlaDOpKZ7DB2WWlIEcz69CsAWaVreP4Y8dnZflKXQ==
X-Received: by 2002:a05:6000:40e1:b0:429:89c2:d944 with SMTP id
 ffacd0b85a97d-429aef82febmr23492f8f.15.1761675369423; 
 Tue, 28 Oct 2025 11:16:09 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952cb7d1sm21956221f8f.16.2025.10.28.11.16.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:16:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 03/25] hw/timer/hpet: Use proper SysBus accessors
Date: Tue, 28 Oct 2025 19:12:37 +0100
Message-ID: <20251028181300.41475-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

SysBusDevice::mmio[] is private data of SysBusDevice, use
sysbus_mmio_get_region() to access it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/timer/hpet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1acba4fa9db..c1b96d0a89f 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -654,7 +654,7 @@ static const MemoryRegionOps hpet_ram_ops = {
 static void hpet_reset(DeviceState *d)
 {
     HPETState *s = HPET(d);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(d);
+    MemoryRegion *mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(d), 0);
     int i;
 
     for (i = 0; i < s->num_timers; i++) {
@@ -677,7 +677,7 @@ static void hpet_reset(DeviceState *d)
     s->hpet_offset = 0ULL;
     s->config = 0ULL;
     hpet_fw_cfg.hpet[s->hpet_id].event_timer_block_id = (uint32_t)s->capability;
-    hpet_fw_cfg.hpet[s->hpet_id].address = sbd->mmio[0].addr;
+    hpet_fw_cfg.hpet[s->hpet_id].address = mr->addr;
 
     /* to document that the RTC lowers its output on reset as well */
     s->rtc_irq_level = 0;
-- 
2.51.0


