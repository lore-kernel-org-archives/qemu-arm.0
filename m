Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B0EEDEBFC
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY7z-0004f3-Jy; Tue, 03 Mar 2026 17:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY7y-0004e3-En
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY7w-0002OX-FN
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso93197165e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576523; x=1773181323; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyEy/g1PEDGl9OT2R7W8yjv5uTeT+1EIBQ0lv6lijmM=;
 b=Ce1tyRBtBpTBlK1hgT8eC3gMyjG9sNafd+cZf2i2gI9dRCde4yCU3J1c8LXTAMDNeg
 jElp5F/+ax45IAbFmO4BOEYOy2cyroGxp+JVMsVY2yrmOgCwL8b4cCi1Br/cbkKdXCq4
 pAFb/7aaB3+dZXmDAiNi2z91k0cFQ1/CuhhNN314dUGOjlXxLfH3RcR7N/eMMsWZSEnB
 XV+7zOfNsNOwwHDdFSk1nBVEpGXGxPJUb9sBtmLroaBLDrHzjta8ONvOch8rzXaeYv7K
 WbveopJ55b8JtNGUJjMZmjl9U+On4hoGVGg5VjtAt3YsXAt2FAeN5RZ0J+au9YT+ubl0
 cYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576523; x=1773181323;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UyEy/g1PEDGl9OT2R7W8yjv5uTeT+1EIBQ0lv6lijmM=;
 b=LswOY1aIKaBoC/C3/2yfUlsOl3rF0ZD/ECK+3nWBwQa5mWxq6F0RtQXM71vLZV7Xyk
 GS+0l7pUG8y97CKv9cMdAuQzFdGQc5UyOHqYmx0ylrEZySKu2HYWl5RXo+V5dp2xmd8E
 Z1SSa6opTfOh+tZmW9PKBVZNFU1/qlDHYOfHdZpSKJU4pjlK66P7pz/K0i3id17ZN33e
 3n4fvdbiCi8U4c07Zmq82pww2FSp55RSvh+ng2xFIHcCQdMLQ/HcRkfbtJu5Yc/98xVA
 sHb6xDSMoglePTNz9OnVGtWydhKaBCFntY8FPKHu5F7Y89i0q7mn7UxK05tYJbcuUsoH
 L18A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdn0MTV/Nn9jbwxqJvrg3aMaRdBUI/neLd7ZzYWNHH1jL1Y9Ypkmilgyf60y/ZuZUw2A6DHGUc6g==@nongnu.org
X-Gm-Message-State: AOJu0YzGs+USh82rj/M5SkTEYjNjNh8ZRQUv5v8k4j5UWF6uorQJvhj4
 s9yUeYTRZt7m2aUOAl+OJ0p+TI81ApfKhWi/pvHo6Bc0OSCd2hm4scoT
X-Gm-Gg: ATEYQzxHLDHuzHJc3lMWhGJYgResOL6N02skIX6hxo2jlQ/s6vRGSSFtCJ6QPIiWl3E
 KX9bEJO55ddyDKwyjFhiBR4WUVC7XJxEVtEVCUA5jHkBNbRZVJvWnqeGAbaujwPP8U/R7TU9Ru9
 hMAPm7RNYHqDb6RkFkqz8KgUdCOddCwndk3I2RwUNp7HAgwIOtk6cVMJiKzKT9YU97qTzN5b4uX
 0E5QhpJ6k4b72Sn3ozsLgkVszel50JI98VgUXb//UbImpks3rhC89hk/CDS6QHsAICsbk884oQq
 lxaEopl/g5d59DOPTPFqjTdXoewWnjYEzaNghB7BX7pv73gnJLDTwVn3w9Y4SYHBZCP6JvacZTJ
 rnF3Grq6WyAt3ZONgTu4b2Coth+gbq5B9BfY52iIixXKZXW5l88Mh2XwBPPFFovcsfmWp0pQ+/z
 yfnDvHmeZCQkGYCbM3LpNvjzbCz6IOt31v2XAiDebIJxBcE2RHcPv8ZNQ1qYDsQOEz/Q1giUwh4
 y1JXKaI7VhMbzKDiOTbmhSQ9EtBIMak4SXEFiTUFg==
X-Received: by 2002:a05:600c:3103:b0:477:5c58:3d42 with SMTP id
 5b1f17b1804b1-483c9bc19a4mr306193725e9.10.1772576522717; 
 Tue, 03 Mar 2026 14:22:02 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:02 -0800 (PST)
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
Subject: [PATCH v2 01/13] hw/arm/Kconfig: Fix serial selection for NPCM8XX
Date: Tue,  3 Mar 2026 23:21:31 +0100
Message-ID: <20260303222143.142741-2-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222143.142741-1-shentey@gmail.com>
References: <20260303222143.142741-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x330.google.com
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

CONFIG_SERIAL selects the internal TYPE_SERIAL device which is akin to
an "IP block" that needs to be integrated with glue logic. In case of
NPCM8XX this glue logic is TYPE_SERIAL_MM which the code uses already.
Fix Kconfig to select CONFIG_SERIAL_MM which matches TYPE_SERIAL_MM.

Fixes: ae0c4d1a1290 ("hw/arm: Add NPCM8XX SoC")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index c66c452737..20e99e52b1 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -493,7 +493,7 @@ config NPCM8XX
     select SMBUS
     select PL310  # cache controller
     select NPCM7XX
-    select SERIAL
+    select SERIAL_MM
     select SSI
     select UNIMP
 
-- 
2.53.0


