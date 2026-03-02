Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00455EB363C
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Mar 2026 22:04:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxBMI-0000Rm-Ca; Mon, 02 Mar 2026 17:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBMH-0000R9-HG
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:21 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vxBMG-0001An-1M
 for qemu-arm@nongnu.org; Mon, 02 Mar 2026 17:03:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-4375d4fb4d4so3620951f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2026 14:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772488999; x=1773093799; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I3pSiajhTDR+3+VSpc4ntxNFFZn7kZ6nNzxA+ROJWxI=;
 b=TWV+lkWdY1I69pyTximCnHHM8006+JsBcXcSRraKI1v0xHKzbpEql4K/wS17w3z2wP
 0kj1dLAd6j8Yd4uX9z7AfHcaOld3CCi+V8npL7ZvO5FXjNOjr3/2ujcNYb93qVaOHRaF
 F1JoDsMYagszyQ/SwA2ZSOY8G9Xkd0hTd8ndxVSXOybzxByUFqQcto1lYR+g962uyQyL
 VLK3HKYWhL4SwaPlDcdPCGJK/qqiCBB3tfpMbwtBqTID44agRsyXzfbaHvHVHWA+5Fe3
 /L+vR00EWTcKsoglL2mxvR7Plt94HzeeTGoxiXgG2B2fKs1sGKqtA/QCgMW4FAcIHWvE
 v0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772488999; x=1773093799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I3pSiajhTDR+3+VSpc4ntxNFFZn7kZ6nNzxA+ROJWxI=;
 b=gC/Lmy2y7zfDFflZL/IfaWF5eZTPAVHAsHgfKByIed/WqYdBpZqrSxjF1yV0+VVXlL
 sSyTYFyHwcuddGajXVTILBAvlVuASiPEmRbnsX1c5fNUxxaxcbSXvgx0PWbMdmJUlghR
 RCCjOkFqvwbcDVUw6M5o8/mgT+ApCN4kHPojQWHzrfoypXarRdOmXfdkj2r9eZPIqebJ
 M0nLOgyakfaW1BgqX/Mm1efuEiZaZrNozeSbq7zlZi6JvxuIbLv5BMLQrqo6XWDURPWA
 RAe9q5YGbkEE1B2sWHCmYwSz88UpMsecJeWDiIXg8/UJaFfySSBdHteBacuzbWOiu4Xc
 /H6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd04pHGmRrPOEqna0y0oWcOr6ae1KugZtf2Gt/a78YGVrkjh1+4/tiQqYpJ7YU+78qmZ13XM3gqA==@nongnu.org
X-Gm-Message-State: AOJu0YzfPOPGx4NccCq0XVf+b5ELo14GRSySY8ptC6tOsRSZA5v4M+rc
 svqNmEtfx/T4JZSeHCPuxSKuopPINRVfsgH1yo7SUStrSScJNDdM9Of7
X-Gm-Gg: ATEYQzxCGYBztXcd+uEjqSj2Xy6UYepopVRwgiRm+ylOwZRDIQXT/zAtscTQ1SUaVQT
 E0HUJ+RgS8oVnvES3WfKWD5B5Rth9wRucUo01HbGTIwXPtCHOMDoaXA3fXRLFFD8UdF8WTFqwLI
 ogAl4TKLeav7o07GicF9LdfkaV5SLiBaELjq/kSAWbAmPNR5gMhdfvKvErrYBNenKNw9hSBnYeF
 Ax2Y9Jl6TjO6Xmv68KTu4OXixLCHuoY90FKDFEzdSTrqVxvmoyz3IPVB6wsnMTEbnluPPOzLNwd
 BfqeNyvj2lETHc0nG3RCIgQo7NHDYl6aEdzMTqr+QxFZzWd3rvS34rRAtRC1+xnnAjZqAGEimS3
 8MLBZg4Oi4+v7MQj52nTuRX+ntkzbzeQJ2ZpfDXo9PB10nOxU7nSA31/2jipfPQWMh7snKL7fQF
 V9cRCHx89LjqkVV7QMJsdMGd6o2vQorXtg0dig6lp2GAsY2Gu9PIFWOs/GTu9tSUSeW5eGF4R+i
 c7EHPjGqHKUKJKzYUNLqApPiZqOkSXaxLJupK/QbZRqm+vIuhQZJE4JJA==
X-Received: by 2002:a05:6000:2502:b0:439:abcd:b2f6 with SMTP id
 ffacd0b85a97d-439abcdb576mr15242115f8f.27.1772488998506; 
 Mon, 02 Mar 2026 14:03:18 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2e0b-4800-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2e0b:4800:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4399c765c38sm29308102f8f.31.2026.03.02.14.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 14:03:17 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Helge Deller <deller@gmx.de>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Troy Lee <leetroy@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 12/12] hw/char/serial: Plug into reset framework
Date: Mon,  2 Mar 2026 23:02:54 +0100
Message-ID: <20260302220254.1166849-13-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302220254.1166849-1-shentey@gmail.com>
References: <20260302220254.1166849-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x435.google.com
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
index c58337bd20..c4537e5764 100644
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
@@ -928,7 +927,6 @@ static void serial_realize(DeviceState *dev, Error **errp)
     s->modem_status_poll = timer_new_ns(QEMU_CLOCK_VIRTUAL, (QEMUTimerCB *) serial_update_msl, s);
 
     s->fifo_timeout_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, (QEMUTimerCB *) fifo_timeout_int, s);
-    qemu_register_reset(serial_reset, s);
 
     qemu_chr_fe_set_handlers(&s->chr, serial_can_receive1, serial_receive1,
                              serial_event, serial_be_change, s, NULL, true);
@@ -951,8 +949,6 @@ static void serial_unrealize(DeviceState *dev)
 
     fifo8_destroy(&s->recv_fifo);
     fifo8_destroy(&s->xmit_fifo);
-
-    qemu_unregister_reset(serial_reset, s);
 }
 
 const MemoryRegionOps serial_io_ops = {
@@ -982,6 +978,7 @@ static void serial_class_init(ObjectClass *klass, const void *data)
     dc->user_creatable = false;
     dc->realize = serial_realize;
     dc->unrealize = serial_unrealize;
+    device_class_set_legacy_reset(dc, serial_reset);
     device_class_set_props(dc, serial_properties);
 }
 
-- 
2.53.0


