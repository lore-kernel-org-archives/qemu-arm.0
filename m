Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCABF513E4
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:11:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGt7-0001GF-JF; Thu, 05 Mar 2026 17:09:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsz-00017J-9x
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsx-0002IG-Mx
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-483a233819aso84167235e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748574; x=1773353374; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mfHZMVt3w+CNCstm9dcEqkFY9F06DbEsvAYeYDdgYzI=;
 b=k4WXf/5HA09mBG6VleDQlftXYW2gCjpAyGy6eVuqAG/Lpv5iv+0m4JUqN2n2whVR4u
 MDkQ3ssiIJgasSTNB1OeKVl6oXi5seE8jUnc5NCs7qbZ5b1gxjm6d3J7lNVfJjac9bB8
 wOoJoP2FA5lOCwp89TcF2xlnOAEURHGZymZlGM9HlHHFpRBC/yzMUzWRN5ctZtIsPcK8
 kkSBYEC+S+p95uMzVnfC7mbGk8/EeuyUJSof9GJBY/FY2Pf5XrlJSgAQgkowzgxeQMiE
 ObwpVPTDcEDEoHAHkYxP8wbRasqAbDolR1ZiunSyoJsI1PB35PPp1XRWHBNl63a8sD32
 fJvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748574; x=1773353374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mfHZMVt3w+CNCstm9dcEqkFY9F06DbEsvAYeYDdgYzI=;
 b=jdXiDMaGNWkdOADarpmM3GVj68h14moWv8NVcgd1t8YKySXGq63SZLWja5XHWGuFgP
 JLL64VUx/sLsq+KJRkXWAYq0z0LRI/rDCK5zd5TDKMyB/4Ddd9nIg0x33DA9QlKODDX5
 tPAWJ4qF2xTM3eD9EBpECpltDsgL0YTK2sd95gWKc/ec0NdvkodrQNCpKiVXRy1TUscu
 LKxGiRV7m/g5ALQZUxulLZqTEsT90NGmc94OpzAMVlKYQtEKI1qDipNcqSEzk+h8MCKG
 G1KVrE1IRjKzYigFRzIqPSkM4Op0YaL5YorvaTC4O80KdyEgIJto1xCWbrAZNhZoXw3P
 oJ1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj1Y8v1+5lqPwYliptw0OedU1dnZ0PjCsU6HMAmsC3vp2umuZi9XxE+eyx5nlGvu/Tj/O++WiBBw==@nongnu.org
X-Gm-Message-State: AOJu0Yyzp1MAnm4c3FgeZVdaPWONEdjfiOTNo5CEwi+Bc3tYnlrzIq/A
 2vqnJTZNOb85G6oEuHgWIvLVZY850Rg9zCpfgCW12rvlFJ5KsyPoQ93d
X-Gm-Gg: ATEYQzyaLKDmMfr+tdDUHGjG5ZJxw2RrmSTFHNIMAkDED7TYF5ASoDd3ZRbbK/poWpT
 XHFVLRHeBKwfVdj6E1gUvO8Uy+PBVvjs68c5gIB1WgKGO4N/aCfyX50/2suF4SzNGcZ9vkBpnZ6
 zFIgXmr2HbWkjI1HzjaI91cpVyTg/ovRoFKBbvRlu23murYeSDVu+eKHYygjrsNWSKG+boZSM3l
 LYo25nAcJyQnvTAVUcu0IelV+O141lbI93CnH7hkOYn2nGDgo5ZZqh3+LT58qQPh1oek8IW/SJR
 a29OFmve6yYMy7AYDiKt8b/NCJXrMxH8rA3rASs7/4nfr4VBdryEv08zMrhmwzNjyeE+ubfVMy+
 oU/LYlDEG68lFrxhlE+wZ3qAt6Da8GlxplBAqd8H8l2JE3tCXSQBBlWqDIIg6/hkpbfg2LmA0Ni
 lHeDx/lF3ePu56knMG93nPcPSwhENJuTbv9OQN1CzmquOpYHTOFhgMOxQrclECEExwYyK51lDN2
 xafPNf9feUNm8amFRBwoo3RwEy3MLEaiMszkkbv5fLZXUA=
X-Received: by 2002:a05:600c:1f88:b0:480:4a90:1afe with SMTP id
 5b1f17b1804b1-4852360e3d2mr18066675e9.34.1772748574239; 
 Thu, 05 Mar 2026 14:09:34 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:33 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 11/14] hw/char/serial: Avoid implicit conversion when
 tracing
Date: Thu,  5 Mar 2026 23:09:08 +0100
Message-ID: <20260305220911.131508-12-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
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

On 64 bit targets, the MemoryRegion API passes an address and a value as
uint64_t, so use that for tracing. Keep the uint8_t for reading since
this is what the device model produces. On targets with less than 64
bits, uint64_t is wide enough to avoid narrowing.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/trace-events | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/char/trace-events b/hw/char/trace-events
index 9e74be2c14..a3fcc77287 100644
--- a/hw/char/trace-events
+++ b/hw/char/trace-events
@@ -5,8 +5,8 @@ parallel_ioport_read(const char *desc, uint16_t addr, uint8_t value) "read [%s]
 parallel_ioport_write(const char *desc, uint16_t addr, uint8_t value) "write [%s] addr 0x%02x val 0x%02x"
 
 # serial.c
-serial_read(uint16_t addr, uint8_t value) "read addr 0x%02x val 0x%02x"
-serial_write(uint16_t addr, uint8_t value) "write addr 0x%02x val 0x%02x"
+serial_read(uint64_t addr, uint8_t value) "[0x%02" PRIx64 "] -> 0x%02" PRIx8
+serial_write(uint64_t addr, uint64_t value) "[0x%02" PRIx64 "] <- 0x%02" PRIx64
 serial_update_parameters(uint64_t baudrate, char parity, int data_bits, int stop_bits) "baudrate=%"PRIu64" parity='%c' data=%d stop=%d"
 
 # virtio-serial-bus.c
-- 
2.53.0


