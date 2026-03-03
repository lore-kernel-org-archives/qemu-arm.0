Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8FAEDEBF5
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY84-0004iN-AL; Tue, 03 Mar 2026 17:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY81-0004ga-UN
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:09 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY80-0002Q4-8q
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:09 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso65964635e9.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576527; x=1773181327; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJx9Hj31eX7Y3Z+9nYTXa1xFEWa58APXwA1Xzcuwa6k=;
 b=RqflqJbzeXicS5hH7gdBzOH8KJVlFMtKHt1WY2kXulGOncBCwz8GP5bozCLcuPN14t
 LnfvcR1ldNdA+R+YUjrHoJUP70LQPavRhmA5wwqDpQKid3ftbtFKG/eTt4xN7KP3FEvx
 cmYT36lMrKDEf0NmjeeMJO414oVoO++P7YdV+0y6RBsBTkz4paRd6/dJX31D1oOx7gg2
 yeOckhLTMUQxGacuQd+2xw67dfosvgay2YtZhAjnUub9covp4MJiCrdpZThm9wnRn1UX
 Gpn8ZgTS4Sp6krLTIn8Y2b8a8Bt57qee9KD/sMRyBnH+dVxVwkg2Cztufu36n2xvOl/a
 564g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576527; x=1773181327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CJx9Hj31eX7Y3Z+9nYTXa1xFEWa58APXwA1Xzcuwa6k=;
 b=R4DlFMugFDc/DWZO5rVfifqnIhaHSPoFS5rzXsxtsyhjYPCt62U2GNn0pq8R0fr0KB
 vVQpwdeSaCCF2Q21ujkf4B9mwdgGqjcqmvJjf67OvUCIVNK4f7v22+1s1/zIr+lde6UL
 bM9v6PYo+3LR3Q1JWQ4UwrceJIVgs3QC8wa/PGGGu2VMmJoADnB1+rarmkXesbolmy//
 bHqtpAIiADdm+FREJnqmsRlpuphTXUGb0MmY8uxI3pzHsR0vr+rLoNjQQHdNvh9gcngF
 oOR8gmJB0/ZxMy7xZ9efUcI6FL59sEUxSOpsyzsEX908uwX/e4oCwRKkUqltqMVtMcip
 HvLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP6T4ZUsdBxKk5fF9dIz1Rv9TKxBVKMa6qJI9OYx4c+ddc/gjbfwg24/RpqHF3OCM52eVr8bTIdw==@nongnu.org
X-Gm-Message-State: AOJu0Yy6OC5KQUAGcwsKKJpsA1Mtu+CkNy0CTyuc83VYJNIheG4jZILR
 X79d9+SI5X9MH7WkTBMAOyucd5ou5BlgNjxW0N5LX+S6nieAUb/E6O+z
X-Gm-Gg: ATEYQzzr5GlIcWnAz9K1HH2YQVMTHdEHrqUvgU30Edk6Rr1CtDXGH6LJMLt/Yt49BhA
 4TEeWL+6GMBGkKsEFlwphpDIQ/ar27Pea2DZ1rW+dsnw8iVma2r7QCKKSwDeap/CY8OK+n4pook
 37Zju4nDZ70LCYjYPaSPQtuo1/8tKrkNf5Fdfl96dBvJue2TPuQX1aX49rrKPX5NowyHtyFxrvn
 3c6bRFurdzx6qA77SQz3xrX9mUb1U0gB76m689KUeA7IWSmWGFUpzCkKAhGjrRKMiBP9Es+h6h4
 5mcasqL64e6+a3f+ifuY/j2mdIG+6+EoMrVtSPycBQhekNJLg2/oNZ7Dcr0S4/w/uMaylPzB4jL
 a74ShRpdb0CvUspDgxivXgkGeaNMIjhqxG/R/djknhLYNortDpOYbDQuFAB/dR7mcrMQ0dQFcdB
 ULU4wj6BhcCSWvdgeXFdDibpntsyRfHG3ZCJVbjB6M+Hkt/Jr0ZTwjMeamZ8TPTzr1lz/C4LCUD
 3NvDj2kABWJCw+TtnqCOxrlkhZB5Uk=
X-Received: by 2002:a05:600c:8b44:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-48513c76ea4mr57049865e9.15.1772576526557; 
 Tue, 03 Mar 2026 14:22:06 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:06 -0800 (PST)
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
Subject: [PATCH v2 04/13] hw/char/serial: Remove explicit cast from void
 pointer
Date: Tue,  3 Mar 2026 23:21:34 +0100
Message-ID: <20260303222143.142741-5-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303222143.142741-1-shentey@gmail.com>
References: <20260303222143.142741-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x331.google.com
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


