Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40196EDEBFA
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 22:24:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxY8D-0004oA-Vm; Tue, 03 Mar 2026 17:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY8C-0004mv-QU
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:20 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxY8B-0002Uv-79
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 17:22:20 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48370174e18so36003865e9.2
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 14:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772576538; x=1773181338; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ov4Nf1FlvKPPTI6Fk3jlGNb+uvop9rtwW4FuxRgecD4=;
 b=IxXpAeLwCU4Hz6r+z3kFEs32Ofu34lAPVJUYCT3Lq2DBVYmk3MB6eyoTQ54Nq3nuUr
 cGeswy0PQFaZTLD0ZdC3qY0k5e2qTTWHwxqFqt4T9bTOrX7nBYHzlNMdMnAnQtJrDXTB
 cDVSRmuvNpv89Knv9kTiPR5dP7C/S1Uax19/QyZ15mvlQ4+iAt57wb/4L4MfF+0ScLeQ
 SZgGVU59DyOJ5llJFfPCHqcYjgoaoC4mlyjMx0l9D5Zs2dL/8xBdpH+KIwjMQn/3Vs9m
 V7ZXGUFuEaOifPOtwDQtvKIJ7wv5Zf1rmg8c/4GL7ikDRIxVO5VCQ0cvbA11rltbLwWg
 FQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772576538; x=1773181338;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ov4Nf1FlvKPPTI6Fk3jlGNb+uvop9rtwW4FuxRgecD4=;
 b=eCRxUUnBgDHYPvlgzx5cMmyc9eJL2kPzma4nCq02n6m+0SbFizBUXz5WmCAUoyOVed
 wNB3ti6evfkyIEBScKrQGFJkoGfM4NTUdqjrFp5FKfzFuIkWjEi5QiVUvFDUgNgv7Hit
 9Vxl2B35ZzFKezLkFJ3R5L/YG/WtZuuZWRIFeAdy7lyVxFA2iRrrhh2FlSrMQAiRFGIJ
 /Ycve4B9rPFbT+yCDUiigr5VnDvCjrWofc3aDhIdzhhnc5qNvinVpA4gt7vDtZtoly5r
 GHDfMz7ZS1KTN8sV0F8tMbbZbQ7hyDm8fqLWu63qhm3IeplecslmzHYzsXlokMDSadQn
 W+hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3aJd5AiKXYmjbl7NoFVUeSIuUtOKt8k4rTBqSTdP2/yVH5H/iNDO68zmtcRfM7VnuxA/rG+SXAw==@nongnu.org
X-Gm-Message-State: AOJu0YzshvSvR5W0l1Tcs8uPYj/oJZOGHNxlyzT2NmN+atVdPD79b98l
 mDXgApEai83EDDJugUo0mn8l/TTjy37YU1KEbZGKTY/wWDFJ7QKxuUfh
X-Gm-Gg: ATEYQzzu+lw8wjwotOq3GHinYTjcYk4YaI06cSJOE9rcu2ecEpIkCxj33C9RALK9m9e
 waFpjZWwRaQa88IuHt06cPGjrKogWafo2JB1vUi4Gjo6gQLplgQQnsas+zUvNhKqXI38rA4eLIk
 2qnClmO51Nrt+cLCVf/tGVy5HbWssAu66yw+28xp1WZqtmO9qC9VHeRqrR/fa06/CSurXfdgz4m
 Kn18j8nf0TtPA1aoYRS2KbrVUDfzFVTb/kqBuDllf02E/dODAFjEc3F0kxnsckL0W1mTdmYpt/p
 YHq4UYdewQPAwCG45MNwZ/1HEWh1wWo8d2kYwXc3DYq2c/pDsui2/Dn35gYjlbFMPNIkn2k+PNf
 mL80JCvIs4xEffT+CJPzylWEGIujLRzUnn0DeBjAuNh+azfYd7IEWyvce1srPW2vc2OjogtjozV
 iRKIa17AaDvzpm5a9/11nyd+PICJour6saUHq+7wWSz+8MbzRDD1OYCiKrGI4Fxe1vzMM63hRVn
 +JpOrd/nsd+FnXK4w3q2TnbL4pPRKQ=
X-Received: by 2002:a05:600c:4e0f:b0:483:103c:b1ee with SMTP id
 5b1f17b1804b1-483c9b9d925mr281291425e9.8.1772576537542; 
 Tue, 03 Mar 2026 14:22:17 -0800 (PST)
Received: from Provence
 (dynamic-2a02-3100-1c79-b600-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c79:b600:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485187c81adsm7577715e9.6.2026.03.03.14.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 14:22:17 -0800 (PST)
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
Subject: [PATCH v2 13/13] hw/char/serial: Plug into reset framework
Date: Tue,  3 Mar 2026 23:21:43 +0100
Message-ID: <20260303222143.142741-14-shentey@gmail.com>
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

Now that SerialState inherits from SysBusDevice we can take advantage of
having the reset method called by the bus hierarchy rather than having
to plug and unplug it manually.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/char/serial.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index fc92897376..31ce3c7b40 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -31,7 +31,6 @@
 #include "chardev/char-serial.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
-#include "system/reset.h"
 #include "system/runstate.h"
 #include "qemu/error-report.h"
 #include "trace.h"
@@ -853,9 +852,9 @@ const VMStateDescription vmstate_serial = {
     }
 };
 
-static void serial_reset(void *opaque)
+static void serial_reset(DeviceState *dev)
 {
-    SerialState *s = opaque;
+    SerialState *s = SERIAL(dev);
 
     if (s->watch_tag > 0) {
         g_source_remove(s->watch_tag);
@@ -985,7 +984,6 @@ static void serial_realize(DeviceState *dev, Error **errp)
     s->modem_status_poll = timer_new_ns(QEMU_CLOCK_VIRTUAL, (QEMUTimerCB *) serial_update_msl, s);
 
     s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, (QEMUTimerCB *) fifo_timeout_int, s);
-    qemu_register_reset(serial_reset, s);
 
     qemu_chr_fe_set_handlers(&s->chr, serial_can_receive1, serial_receive1,
                              serial_event, serial_be_change, s, NULL, true);
@@ -1008,8 +1006,6 @@ static void serial_unrealize(DeviceState *dev)
 
     fifo8_destroy(&s->recv_fifo);
     fifo8_destroy(&s->xmit_fifo);
-
-    qemu_unregister_reset(serial_reset, s);
 }
 
 static const Property serial_properties[] = {
@@ -1032,6 +1028,7 @@ static void serial_class_init(ObjectClass *klass, const void *data)
     dc->user_creatable = false;
     dc->realize = serial_realize;
     dc->unrealize = serial_unrealize;
+    device_class_set_legacy_reset(dc, serial_reset);
     device_class_set_props(dc, serial_properties);
 }
 
-- 
2.53.0


