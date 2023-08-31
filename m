Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp5076115ejc;
        Thu, 31 Aug 2023 06:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvjt6RsS6QT237t+Dic96sniUySMm2r+n3rw76GLWsBgkRtSKZhXOBejRLGTpFPHuNXEzd
X-Received: by 2002:a05:620a:4553:b0:76d:b2d9:ae4b with SMTP id u19-20020a05620a455300b0076db2d9ae4bmr3273064qkp.13.1693487016958;
        Thu, 31 Aug 2023 06:03:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693487016; cv=none;
        d=google.com; s=arc-20160816;
        b=0P2GKAiYZjP1HUKsEAvtwxzGoKgk/K0NAy7mCKtI3yITzL1OhofEXzdPpcu1iuyepn
         x+BNErtsaOXOjPoxbp2QvUen1iKyj50vvkma9LMLLKkoD4WHeZlRFlpSBRdnTCf6JjXT
         KTBS1URnTo/le689JOWff9Dje4wCTY70cwSYvLOKBqwMYVUdnA4QVLs+qKRf03b6fCUm
         jq/3FkvftOIZp5Vmc2EdUYhuRovHvf27yvKnlpBryzkx5DT5hMlqxFxWIiekTYC793dI
         5OJcAUg6iUIvh8Hnbo00r1Pl0JVRT3vBs4Khx4N67xAb3ArQ9wqSSvFdyvJaSrDulTGN
         LCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ltDvR2BAZ2X9usEMn+DOp5maTDaOUlNKujgVGnXvoz0=;
        fh=VjG573EgGAsaBW2kGScQR4gyST8ub8MoFdZGdiyWK50=;
        b=YkC2EIsxqSWL12FetmD8cDJy1cKDQvypud8/Prdz/EF+slVw4gjuAwW4fFA6EWVG2R
         21OWV4HVAwCSKOzPKvILBe29pu7hEIMosWkkgn30iBauOFRcMxUxMfacnznkfR+zyW/G
         6W3ANUneNS8xq8zkJa7APG0JCpl9NVWbJzipFpNMuE3g7Yaer3LBnC0Mw3wsEA2IXgD0
         TwPu95NZ+RuKw0P2iMth556tVK91OBLSP32NFDWs9+uMAhJMr1LK7NTIw+RF5nLaeBav
         /+hBLhGgMfJMIIPbP6wSKGBcVvzBM5ygarN61azvEFh4bWEouy0g5Y5uFMOpKBrRwZtx
         xGLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQWvn9mT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020a05620a24c800b0076f08f689e5si966231qkn.502.2023.08.31.06.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Aug 2023 06:03:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQWvn9mT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qbhJQ-00054O-1E; Thu, 31 Aug 2023 09:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhG8-0003vR-2H
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:53 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qbhG2-0005hY-QX
 for qemu-arm@nongnu.org; Thu, 31 Aug 2023 08:58:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-401b5516104so7035745e9.2
 for <qemu-arm@nongnu.org>; Thu, 31 Aug 2023 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693486725; x=1694091525; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ltDvR2BAZ2X9usEMn+DOp5maTDaOUlNKujgVGnXvoz0=;
 b=RQWvn9mTH7BAPI1Z4djAcIBodSx0Bth8vAMbZI/6sVBPZ5U9CdNkWHKcImlsBO1zci
 v080mo36q2Yotz9lXXdR3ddHOlZQ74jLaPCul3VAGq2flLVkumw3Oi0IQBMxgB6inTSN
 AYmVf6E5nT/cMM0hRzOq8FzAZwKJc7TmAh3mquts90ZIKdOqPa/IT9lsJpiapoKmbR/p
 TaoqjZgf9xg7iLlo1g2Q0mg1avNIq9e2Tcry2qsZ60Q1Bgw5elHQcfPpWwM9EP5YLgPr
 1X7rAOLfLH/GE1+IXSB+pq9M0QnHAqQK5Yj9dwbhl32JPNniEIeuHO8t5iQY9vyMtZTA
 AbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693486725; x=1694091525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ltDvR2BAZ2X9usEMn+DOp5maTDaOUlNKujgVGnXvoz0=;
 b=UCD28DARpddCkE5QUMoeiKLq7kppjWZIz+bY2fIfgJdmnEZvjlTmtn/OyzNTONQcSR
 Cn21uXUfdqOLgh73/kn7KXU1T/RClFPxqeyyyviaTgMp2Wi8ZYnJLWwguTGPiV2E2cN6
 APOKdNYQuK1QnD6x5o+hIYzPyO7Thcb6Kd6ojHRcHx3jGI0nHAhLIrMkYRsIWq3I0sMs
 A0PLfrnMAt+GhrAW4k1LL1xSS8+AKrRgGBEpik80C3rmbH9RySLB2BGo6bvaLsFpbOVY
 3MowFW/gZJItn3geggvQU467znAyfGOZPSPhAb07x4rQu+rqOpnK+BSRrvFpPPMgcNnx
 pDyw==
X-Gm-Message-State: AOJu0Yx6uG6L5wHuerRJJUM99C8FkAhqk3tkGDbXI3tgxMP492Bjp+pD
 vhfXdxzCKj9ITBgi7X1pIX0r/Q==
X-Received: by 2002:a7b:c3d2:0:b0:401:d947:c8a4 with SMTP id
 t18-20020a7bc3d2000000b00401d947c8a4mr3797191wmj.29.1693486724996; 
 Thu, 31 Aug 2023 05:58:44 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a05600c220800b003fe29dc0ff2sm1930778wml.21.2023.08.31.05.58.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Aug 2023 05:58:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Amit Shah <amit@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 20/41] hw/char: Have FEWatchFunc handlers return
 G_SOURCE_CONTINUE/REMOVE
Date: Thu, 31 Aug 2023 14:56:22 +0200
Message-ID: <20230831125646.67855-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831125646.67855-1-philmd@linaro.org>
References: <20230831125646.67855-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rKoxRrzanJjo

GLib recommend to use G_SOURCE_REMOVE / G_SOURCE_CONTINUE
for GSourceFunc callbacks. Our FEWatchFunc is a GSourceFunc
returning such value. Use such definitions which are
"more memorable" [*].

[*] https://docs.gtk.org/glib/callback.SourceFunc.html#return-value

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20230705133139.54419-5-philmd@linaro.org>
---
 hw/char/cadence_uart.c   | 8 ++++----
 hw/char/cmsdk-apb-uart.c | 6 +++---
 hw/char/ibex_uart.c      | 8 ++++----
 hw/char/nrf51_uart.c     | 4 ++--
 hw/char/serial.c         | 2 +-
 hw/char/virtio-console.c | 2 +-
 hw/usb/redirect.c        | 2 +-
 monitor/monitor.c        | 2 +-
 net/vhost-user.c         | 2 +-
 9 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 807e398541..eff0304a18 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -307,11 +307,11 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
     /* instant drain the fifo when there's no back-end */
     if (!qemu_chr_fe_backend_connected(&s->chr)) {
         s->tx_count = 0;
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     if (!s->tx_count) {
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_count);
@@ -326,12 +326,12 @@ static gboolean cadence_uart_xmit(void *do_not_use, GIOCondition cond,
                                         cadence_uart_xmit, s);
         if (!r) {
             s->tx_count = 0;
-            return FALSE;
+            return G_SOURCE_REMOVE;
         }
     }
 
     uart_update_status(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_write_tx_fifo(CadenceUARTState *s, const uint8_t *buf,
diff --git a/hw/char/cmsdk-apb-uart.c b/hw/char/cmsdk-apb-uart.c
index f8dc89ee3d..d466cd93de 100644
--- a/hw/char/cmsdk-apb-uart.c
+++ b/hw/char/cmsdk-apb-uart.c
@@ -199,7 +199,7 @@ static gboolean uart_transmit(void *do_not_use, GIOCondition cond, void *opaque)
     s->watch_tag = 0;
 
     if (!(s->ctrl & R_CTRL_TX_EN_MASK) || !(s->state & R_STATE_TXFULL_MASK)) {
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     ret = qemu_chr_fe_write(&s->chr, &s->txbuf, 1);
@@ -215,7 +215,7 @@ static gboolean uart_transmit(void *do_not_use, GIOCondition cond, void *opaque)
         }
         /* Transmit pending */
         trace_cmsdk_apb_uart_tx_pending();
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
 buffer_drained:
@@ -227,7 +227,7 @@ buffer_drained:
         s->intstatus |= R_INTSTATUS_TX_MASK;
     }
     cmsdk_apb_uart_update(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_cancel_transmit(CMSDKAPBUART *s)
diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
index f70adb5308..51708c0836 100644
--- a/hw/char/ibex_uart.c
+++ b/hw/char/ibex_uart.c
@@ -147,7 +147,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
     /* instant drain the fifo when there's no back-end */
     if (!qemu_chr_fe_backend_connected(&s->chr)) {
         s->tx_level = 0;
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     if (!s->tx_level) {
@@ -156,7 +156,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
         s->uart_intr_state |= R_INTR_STATE_TX_EMPTY_MASK;
         s->uart_intr_state &= ~R_INTR_STATE_TX_WATERMARK_MASK;
         ibex_uart_update_irqs(s);
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
     ret = qemu_chr_fe_write(&s->chr, s->tx_fifo, s->tx_level);
@@ -171,7 +171,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
                                         ibex_uart_xmit, s);
         if (!r) {
             s->tx_level = 0;
-            return FALSE;
+            return G_SOURCE_REMOVE;
         }
     }
 
@@ -192,7 +192,7 @@ static gboolean ibex_uart_xmit(void *do_not_use, GIOCondition cond,
     }
 
     ibex_uart_update_irqs(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_write_tx_fifo(IbexUartState *s, const uint8_t *buf,
diff --git a/hw/char/nrf51_uart.c b/hw/char/nrf51_uart.c
index 3c6f982de9..dfe2276d71 100644
--- a/hw/char/nrf51_uart.c
+++ b/hw/char/nrf51_uart.c
@@ -93,13 +93,13 @@ static gboolean uart_transmit(void *do_not_use, GIOCondition cond, void *opaque)
              */
             goto buffer_drained;
         }
-        return FALSE;
+        return G_SOURCE_REMOVE;
     }
 
 buffer_drained:
     s->reg[R_UART_TXDRDY] = 1;
     s->pending_tx_byte = false;
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void uart_cancel_transmit(NRF51UARTState *s)
diff --git a/hw/char/serial.c b/hw/char/serial.c
index 270e1b1094..f3094f860f 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -226,7 +226,7 @@ static gboolean serial_watch_cb(void *do_not_use, GIOCondition cond,
     SerialState *s = opaque;
     s->watch_tag = 0;
     serial_xmit(s);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static void serial_xmit(SerialState *s)
diff --git a/hw/char/virtio-console.c b/hw/char/virtio-console.c
index dd5a02e339..dbe0b28e60 100644
--- a/hw/char/virtio-console.c
+++ b/hw/char/virtio-console.c
@@ -45,7 +45,7 @@ static gboolean chr_write_unblocked(void *do_not_use, GIOCondition cond,
 
     vcon->watch = 0;
     virtio_serial_throttle_port(VIRTIO_SERIAL_PORT(vcon), false);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 /* Callback function that's called when the guest sends us data */
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 39fbaaab16..4bbf8afb33 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -278,7 +278,7 @@ static gboolean usbredir_write_unblocked(void *do_not_use, GIOCondition cond,
     dev->watch = 0;
     usbredirparser_do_write(dev->parser);
 
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 static int usbredir_write(void *priv, uint8_t *data, int count)
diff --git a/monitor/monitor.c b/monitor/monitor.c
index dc352f9e9d..941f87815a 100644
--- a/monitor/monitor.c
+++ b/monitor/monitor.c
@@ -144,7 +144,7 @@ static gboolean monitor_unblocked(void *do_not_use, GIOCondition cond,
     QEMU_LOCK_GUARD(&mon->mon_lock);
     mon->out_watch = 0;
     monitor_flush_locked(mon);
-    return FALSE;
+    return G_SOURCE_REMOVE;
 }
 
 /* Caller must hold mon->mon_lock */
diff --git a/net/vhost-user.c b/net/vhost-user.c
index 5993e4afca..12555518e8 100644
--- a/net/vhost-user.c
+++ b/net/vhost-user.c
@@ -239,7 +239,7 @@ static gboolean net_vhost_user_watch(void *do_not_use, GIOCondition cond,
 
     qemu_chr_fe_disconnect(&s->chr);
 
-    return TRUE;
+    return G_SOURCE_CONTINUE;
 }
 
 static void net_vhost_user_event(void *opaque, QEMUChrEvent event);
-- 
2.41.0

