Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42221EDEBFB
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY8A-0004lv-UM; Tue, 03 Mar 2026 17:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY89-0004kr-By
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:17 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY86-0002St-3l
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:17 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so52539995e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576533; x=1773181333; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oh5fF1cD60o2GgdhvxUuihszrtUOa2nx4hPj7KeeMlk=;
 b=Z4MJj1jItB2b6+MVJ2itEdJ622WN7SoECrzsgwypAqG9kWGo6002Pl+/NY1uYH0Mbj
 maZLVRbDkDC7tnDnPAlKMmIN1WI17QQFaHuTucYx4/8K5aKV3g15+UGadm666MQCVAG9
 vcKbq21mnX3PnawkPVFcbasscjZNPWtON1T+SaY+tWn/vfwz1L9pUzzFVb/1xD+dbsld
 7SkjXAc2R7/naAB3b0wc0h46PZVvPvRxxD+plGqxs9Jk/ntLhipx/XZ5dIV3dHAlFWHg
 gZbFBls/2K5D/iGenfl9uB0Wjd24I34pXii+O9n5Ua1d7kGW32pbpAsAmh897EmIe6r6
 bbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576533; x=1773181333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oh5fF1cD60o2GgdhvxUuihszrtUOa2nx4hPj7KeeMlk=;
 b=K/qwgt4lfbwlVp7XjndpVLrBkbrgePN0qh7AlKbzZPiznIaog3CytwWmX80EGDKR6x
 tGKNDeWfjGbehuZR9ykUnRfusxiVH+cut9X0jEyLM9d8+zF6YSJNtFfBEEIQsVwG6IYh
 qX5DQEIssDCCwoHRh9gp/WA+p1iL/qZrlRiQaRNQiFHIFG1pgPt09At2li1ENj9S7YeF
 RDXMsbcbv24tSIPdAWuq8Y5xuzNwNZOky1ZKJOxu3Ol/nBp/38407eLfHOyaTrJUXjkk
 Rw+AHIvO1EzuM5P6HcaTwltARC4A9CSuI29kXG6zLwtJIOfWXzUpKkNoVlJn/tjx9TOX
 5YrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvGXVwUCBtw8Lypl7rROKUbWJQr1uNn1o3t8gkRI3UT6vVTubxDqh8WpqlCLG439S3skrKjaQr6A==@nongnu.org
X-Gm-Message-State: AOJu0YzszgcthO31+qiyXnK0XtJwi5IhJWvgQ+Ff4lOQ6mfpuh+NCqaf
 KE0zb0zfMapydxuG5lw0dRQeBxgW75DwrsZBCzGw+z1607TzYJ3TzXiTHzlNrg==
X-Gm-Gg: ATEYQzxgmrS0rYL3XTPd80x0eZWSEPXiDzmE4j1eyh6fwOXCyMKWThvGiiZhKfkyfwl
 d9v4HFN2jmGUGfW+Id3s03MJzHGzrh7N/Vfw8iYgOE/xxAZFzFUKuiLZqFpRpLjGoNz2KYZq1Rw
 FhceldVAGHwStxRqSLtFWtRNZ9XqIXQ/UnNIebWlCQi8TIFU5puIxTMhdvlBsHg09tvdzyoiNKa
 QiTxcWqXC5TBT9FsGYGBZs8vsXG4yDJPYOkj8ta0pbuQXrMBig/SXpMnXJ88cRD5tjZQmt6sFCq
 FjbzzxUlXZR5zlpk5uXDuoEGI1rL/Suaj7rK5ePQ+LXgZjpNm2p4nUdQYskVE752GDRfACfKaGR
 hzNfwDmd0NWQMg0Ipr4xOyUsNupiTYC87ewSuklwgO830SBUMHvcbYHeUaVxRW9g1h4T2G+hFMF
 jdAkal2maEw/g71CxuX7Wim3k/ppq/IkZkVvribjcER9af+gzFXcZgZ5x1NTXiwfeZEwcukq6hs
 0jd7si8uhh4Izsg2i7Bt1CAn0SAbL0=
X-Received: by 2002:a05:600c:6992:b0:47e:e981:78b4 with SMTP id
 5b1f17b1804b1-48513c71087mr62255885e9.12.1772576532552; 
 Tue, 03 Mar 2026 14:22:12 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:12 -0800 (PST)
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
Subject: [PATCH v2 09/13] hw/char/serial: Remove redundant reset
Date: Tue,  3 Mar 2026 23:21:39 +0100
Message-ID: <20260303222143.142741-10-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222143.142741-1-shentey@gmail.com>
References: <20260303222143.142741-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x329.google.com
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

There is no need to invoke the reset method in realize since the reset
framework will do so anyway before the machine starts.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 485b98f03f..0f3469a1e8 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -934,7 +934,6 @@ static void serial_realize(DeviceState *dev, Error **errp)
                              serial_event, serial_be_change, s, NULL, true);
     fifo8_create(&s->recv_fifo, UART_FIFO_LENGTH);
     fifo8_create(&s->xmit_fifo, UART_FIFO_LENGTH);
-    serial_reset(s);
 }
 
 static void serial_unrealize(DeviceState *dev)
-- 
2.53.0


