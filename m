Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA77EDEBFA
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:23:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY8C-0004mh-1C; Tue, 03 Mar 2026 17:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY8A-0004lA-5A
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:18 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY87-0002TM-8B
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:17 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso46546745e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576534; x=1773181334; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQcKbngO5gEYvP1cyAmsSZ3twrSC/3ssI8QyeEW5Z+s=;
 b=S9Ln4QA8uSGDVFlR8QxMcuS1IKxS0uhVBEA+LbwDjJ16cfOMW1vxPISkdXBQr2oNAM
 rY9hDQcP9e4QK5inIC2GAGS9OSL1Is1c6BIs6lsQqYsa5qloL9+LcWcyvA2gXwo2ol/2
 ci8S2Viy30MCAthkVdMLyFtLjbUbKKybiNTyW2eAVcluQ9Le7uBgzbTU/0fN6+9URCiv
 95DliXLyAa9740P5BqESTBDl60C0UAFVRlkYYmmlSkesvLHnFTTvEnm1Vf9WuzKO5nIJ
 i32GIBI1i6R8ZVEcXr8PzUk1y6f4m1yCy5whFlwuHDk0sg8xr+19+rShF3cvQaOpfAHB
 /P3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576534; x=1773181334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kQcKbngO5gEYvP1cyAmsSZ3twrSC/3ssI8QyeEW5Z+s=;
 b=g4WW6vgA0GwCPWpnmTqgFHeO8S9P0jOytXpVJKd/eB5lbmccBHJOna3E8/Wx3hos6u
 pG57QDFxVEgCMMNrOEp8qDbtQ8XxMw9LQ59rJsyk7d1xW3I2oTDi9AadTn/srBuSS8fo
 9Y/zbGJ6Db201MBPddrz/JTBgzYleMEbFQWeHHF/G4YQZw4WiIv0cCJJuIWPqiPgfpzO
 h6Ke0dcMkROFyrYmvg2Wb5pLlTQyy/9ZYP/U5LxaGijN2MrDbUpq8yfgDRQhQpi3Ziew
 4KjGlgu8NviACCPHeNH8DkS6xTj/Z+rT8MrJLbqbstNov9JxXPcFMPKZNKOuvMnRk93c
 dDDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZ5I3vQDd8iqf50vglEaBg/i2uvWGi7/7ixLi96HTxbpq99XlbOKGGmCck2KKeJLVbUICsV3dJSg==@nongnu.org
X-Gm-Message-State: AOJu0YyVbiN2/SMdCFFDJt8lJHQhbc/CGluj8wOSjG6LxhF+iJ8ZQO2O
 FWq1yCB19Fc+2GmDBQEyVu0D+oiYMAAlrDSaV4OaTr49DAHY+ycHKPE/OQn8Ew==
X-Gm-Gg: ATEYQzx/DL+avv5X2Bvo5evALQa+v2i6X+dDfNMbXcq0kSYWiZS4S6n83l24u6iUcgF
 RT+3qrX89CJUQeltaIOz+7+HjqOX4TmNPrtO/WowYxsRWfb7GzvzLEWvxvzIqszj7RqKGTu+2WR
 yKYQm5DYNFlIrddRzqIprF8DTDPnwF/DUtSfcOhisd97Fy11yXPIauBLUJE6slVmk8eMArdfmI9
 RAQ6TlGs9WYLEIxxvgwPS2zc2vaUsm9WlE4VtiL2zRWli+zWSy/5T717dv+QBzJjK53N/gmtf7j
 EBBGvTipLpf3DUBpXE99kY60RTUw7E9spovJNpr6YfyzbgVksPf/eupdMuVKD5UAwJUsWTcGV1H
 SBRlATRu2YBX6i2kjgTfw3hCADxVrdJNR4SN+rfoX8Qob8AShfaE+04A6l+I/raSw8/K/8rJrDb
 xlKAAV45l/w7m692TTiBJf+d4PL1JzakJxYmzyFKOIMO+dRf0YD90kqdDcucNcAN3quShj2z/vm
 RoRDQIVBIWR5sY+20Lv4csoHLA9j5aGHL6i1wGqwQ==
X-Received: by 2002:a05:600c:444d:b0:480:4a90:1afe with SMTP id
 5b1f17b1804b1-483c9c2be1dmr286021745e9.34.1772576533734; 
 Tue, 03 Mar 2026 14:22:13 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:13 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Troy Lee <leetroy@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-arm@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 10/13] hw/char/serial: Avoid implicit conversion when
 tracing
Date: Tue,  3 Mar 2026 23:21:40 +0100
Message-ID: <20260303222143.142741-11-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222143.142741-1-shentey@gmail.com>
References: <20260303222143.142741-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x336.google.com
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


