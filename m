Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69A3F513E4
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:09:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGsz-00017H-54; Thu, 05 Mar 2026 17:09:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsr-00010T-4m
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:29 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsp-0002F1-1c
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:28 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48379a42f76so73937895e9.0
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748566; x=1773353366; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJx9Hj31eX7Y3Z+9nYTXa1xFEWa58APXwA1Xzcuwa6k=;
 b=ItokNzedvc7ofVgkURsvuc2LN9/GGusoWA0AeW7ldzUnaDwl+BWTWdT6W5eV0rAWz3
 t3A3/E+HBlA061VSMWlj2oAA+3UCEJOfYNrWE7fqMeGNAd2LN+RD/dNzZJRrED5JJnSZ
 g3/shh8cd8ODUeWdDXc0w/syQZjldX6Da453ne2g7ueA8D98dvWp+4yTb0mMU/mPXiys
 loii/tYXvNmJ7iJRIuKvlPA/BcUAqNG/7CtL+KY6ICjOGXRHLTDeV4YjN2GDB90lhPDM
 Kh+bptIt5B87Dz4EoLhfVYDnuwRmofB9YWEEETCopf6mdsUHSuImQMVtt7acmOtfSwJ9
 /6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748566; x=1773353366;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CJx9Hj31eX7Y3Z+9nYTXa1xFEWa58APXwA1Xzcuwa6k=;
 b=BjmCJfIAKQ7l5QOoH/5dDftNxLhKFrTSz41CqCa81epkz/087QVao4tL/vC9D5W7Kt
 Q+KGRRivqFOXCynz+xenOo2E5HUmLzGT4u/6P/XATGYvDB54ETLMVJvlZhJTX907zZbV
 imOIY//SXkL3TzmpnMnZ/JcUy+KGbsR9yEcXTnRVPND5IqukhSir0UZ2Hbg+BOHkyrUi
 76uAmLGeGjC06773BWA5zEoK2BjwW1gFk1PFJer/pT+JASQqjZCJQh0kXHG8uMok3WFx
 BLcHHihcMK3zJ4afB+L6tYfJaIOURn2lzmz55cf3/GgMNrextwDexIzKzwGtNaQXo3zS
 hsxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8YbUMYIO55XIciSVKFb41iFmGFuf0ZBdAW4TvqSv3nMzjg8Hlif9H+jcH+D8XGG8WGbRuKF+o/Q==@nongnu.org
X-Gm-Message-State: AOJu0YyHJNQEoZ59SORYItjUzcbFzysofhbAG4vY8ntq10DGuWF165D6
 g3MfOV39u1eFTXXcX4s4x4TFgaI51Pqgme8WaCSsk/Jp4SnFeZ0lxXzE
X-Gm-Gg: ATEYQzwBQGfmQHBenTQ0tYM5TVruFMK2twb9uwlGHxiwjSEg1ugwS9iFrmmfQTByvvR
 fCIjQbouekXS2xp/1M5t3Xl9+RW9sin+OneLZT6XOGuDYtZbfeicwIyHNdSwmTke3rNw4aVoA5X
 zzR0876769t32PwmZEZKUXf58UiAiAomwLdrpUQ63E0hCsVDeT4xFpMgRI23PP3e3XOEu3n+bBA
 CfKltFApi0SB3mGbm296xuOYLfCIH8alZkev+k+DaWaWOYEGpBImod4ZON57f8poWzivDW/uY4v
 +4e0qBsWTKfdnSX6yjJSozAVA8jpnK1l7+gO1uATJ6QEISWG8ufo9DbohMbHmkX5c2tmE7+qn0G
 +qoPJT7LGukeUhxOfvEL3RbFEFy6E1MC2w2ypq6d0SjVy1DWe2R5R53w81kwU6FwM1k/SK0ulq8
 hr+6/43BrVx61GUpKUrciVpCZDxugHSTId7QIn1dQOq2ULQi2LzhzxRllLo8E5VE1DwjVehtHm9
 f1A4g+3fDssUFW5ikL8KeEcxyYNxozhVh0V1E/Ip34dBwg=
X-Received: by 2002:a05:600c:138c:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-485197e7678mr141539665e9.0.1772748565495; 
 Thu, 05 Mar 2026 14:09:25 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:25 -0800 (PST)
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
Subject: [PATCH v3 05/14] hw/char/serial: Remove explicit cast from void
 pointer
Date: Thu,  5 Mar 2026 23:09:02 +0100
Message-ID: <20260305220911.131508-6-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
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

A void pointer asks for being casted, so C allows for omitting the
explicit cast. Take advantage of that.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index adbd1d1d4a..0f2e79dfba 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -715,7 +715,7 @@ static const VMStateDescription vmstate_serial_thr_ipending = {
 
 static bool serial_tsr_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return s->tsr_retry != 0;
 }
 
@@ -734,7 +734,7 @@ static const VMStateDescription vmstate_serial_tsr = {
 
 static bool serial_recv_fifo_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return !fifo8_is_empty(&s->recv_fifo);
 
 }
@@ -752,7 +752,7 @@ static const VMStateDescription vmstate_serial_recv_fifo = {
 
 static bool serial_xmit_fifo_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return !fifo8_is_empty(&s->xmit_fifo);
 }
 
@@ -769,7 +769,7 @@ static const VMStateDescription vmstate_serial_xmit_fifo = {
 
 static bool serial_fifo_timeout_timer_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return timer_pending(s->fifo_timeout_timer);
 }
 
@@ -786,7 +786,7 @@ static const VMStateDescription vmstate_serial_fifo_timeout_timer = {
 
 static bool serial_timeout_ipending_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return s->timeout_ipending != 0;
 }
 
@@ -803,7 +803,7 @@ static const VMStateDescription vmstate_serial_timeout_ipending = {
 
 static bool serial_poll_needed(void *opaque)
 {
-    SerialState *s = (SerialState *)opaque;
+    SerialState *s = opaque;
     return s->poll_msl >= 0;
 }
 
-- 
2.53.0


