Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C09EA3F38
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 10:17:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpknw-0001BP-2R; Tue, 10 Feb 2026 05:17:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpkns-0001AP-G7
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 05:17:09 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpknp-0002JI-Qi
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 05:17:08 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4834826e5a0so7410825e9.2
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 02:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770718624; x=1771323424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=IwbOHvrrzpGMbGAUKbGftHqrOlOGZFCWb0ibIgC3XdQ=;
 b=Q1a7qSzHehl0f53aDZy0M6XlbNEPp39IPzHTj1EfQxiGi6PIN8mBfUvRIL8ysEEvyP
 80xLr/JuruJYv/GNv8l/KcI28VQ6gGLNZcEWDW7yFw8VEV92r/LpIrNsebf/G94zQzBF
 j9YcUY5zCyaA/SQDpY5vgP4trOtDaQE68cbBB1wjG0DXcUjImH0lrwEBR97WQflegDya
 JmYSzahD9TxFdQIFQK5nrP7tn7GEjqHKAmSt/Vcp2lmlSdnBSCGLKnICqKVVk2aGQkjw
 Rkp0WKfj+FrpXgTIMRN2jwELQCFOf3i2wf30M8JH1llRERIBjQ4oRJnyLy0AfzJp+TrJ
 8Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770718624; x=1771323424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IwbOHvrrzpGMbGAUKbGftHqrOlOGZFCWb0ibIgC3XdQ=;
 b=CpiTQNTfSM4bGwKmWxXnI5T0TCW8lKnGSB0c//9yayWn49m6rUJYJNPW95n1VhSBip
 Td9ty7s/xK6XPp0Y0L9eBjiOmvy4Ij822FT8PisqvP7ly1M5jujCKU5KnURXri6ZoYpQ
 HC5Y37zYQzrfjj+a1WzwgKCMoy16qc6D1YcvUwF9PyPM2iiqr8M462hXH11TJ92I6YXz
 +eCUVwoVg/QyVxyM7geFgRezw+KtKN2O4qUJ1zoHb3kHcewkMbvTUqC6WneuGb3sxnxE
 hpn7lhSxreSDt2Y/cao5VWdbPz+A18BKsrYFW/qY/Pb285FkcTavLxpg4V8mYwAEpuC0
 Ibwg==
X-Gm-Message-State: AOJu0YxcHCi5V2xOfaybs7rUrTiwd3atnLbjgvE1mxF1rMPu3e8MZdKh
 fw5wimvZuwttBAmYy7MR3zyELnyeJwlQlXj//UGdOW8NCIcS59k842XgQUrqPm2SGhA98cBzd1Q
 K4B3O
X-Gm-Gg: AZuq6aK2VV2DrmOtapOqLNtUQy50oEYklokChXEuUr4fOSGVjEK7laXwJzZ82BSyDOa
 tc8Qh2QEA+rp0yR7Es/rd8luh7ikVAjW76jx3JZ396/x8eaA6iBfieQcR2qNtxGtcd8f43BKaFr
 3CZEkqvH+xuimRHW8e7D60q2tUd0R/8v2EoqQl408rmhVwZPZWUN2ILs0heYenmXPyuA9yavZvt
 NggDumSSoIZqyVCdSWu2kQrzWrO2JI4U++Kn9fDBCgf7U7Rus1f0yakx1zTSIA9h4XoIOIVJNpp
 gJ39PaQfZtp1agO9c4EZm612dIHMpjF7qbgriBfYK4ljtE64zjyRS6cUzLCt0ePAv6Ovx9XZ4iO
 ge+08gNVVF5S2nAaPjyCyg2zu4JGvOVI6IGapvdXKQrKeHC3zg0U8BxIP6539FdkkUXCi0LgHpy
 a33rmTdmX//sIsnc6TepRBVi4wmx1onqpRX5eLCqnM8VJVsKHNnwhrlviWCyQSsSb451kUgjm10
 8zq0ip0wFSipobgb5ql8KNSdmtaogaCe9CjKFEXgA==
X-Received: by 2002:a05:600c:c05a:b0:483:456a:514b with SMTP id
 5b1f17b1804b1-483456a51dbmr58762355e9.12.1770718623878; 
 Tue, 10 Feb 2026 02:17:03 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320410b78sm176406295e9.2.2026.02.10.02.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 02:17:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/char/pl011: Only log "data written to disabled UART" once
Date: Tue, 10 Feb 2026 10:17:02 +0000
Message-ID: <20260210101702.3980804-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

We log a GUEST_ERROR message "PL011 data written to disabled UART" if
the guest writes data to the TX FIFO when it has not set the enable
bit in the UART.  The idea is to note that the guest has done
something dubious but let it work anyway.  However, since we print
this message for every output character, it floods the logs when
running a guest that does this.

Keep a note of whether we've printed the log message or not, so we
only output it once.  If the guest actively disables the UART, we
re-arm the log message.

Notably, the Linux kernel does not bother to enable the UART if it is
used for earlycon, relying on the firmware having already done that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The log messages here were getting in my way trying to debug something
else, but I didn't want to just delete them completely.

 hw/char/pl011.c         | 24 ++++++++++++++++++++++--
 include/hw/char/pl011.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index b2ca68e3e8..cb12c3e224 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -227,10 +227,25 @@ static void pl011_loopback_tx(PL011State *s, uint32_t value)
 static void pl011_write_txdata(PL011State *s, uint8_t data)
 {
     if (!(s->cr & CR_UARTEN)) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "PL011 data written to disabled UART\n");
+        /*
+         * Only log this message once, not every time the guest outputs:
+         * otherwise we would flood the logs with this message, making
+         * harder to debug guests. (Some very popular guests like Linux
+         * don't actively enable the UART.)
+         */
+        if (!s->logged_disabled_uart) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "PL011 data written to disabled UART\n");
+            s->logged_disabled_uart = true;
+        }
     }
     if (!(s->cr & CR_TXE)) {
+        /*
+         * We don't bother with the only-log-once machinery for this check
+         * because TXE is enabled by default from PL011 reset, so there
+         * isn't likely to be existing in-the-wild guest code that trips
+         * over this one.
+         */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "PL011 data written to disabled TX UART\n");
     }
@@ -457,6 +472,10 @@ static void pl011_write(void *opaque, hwaddr offset,
         break;
     case 12: /* UARTCR */
         /* ??? Need to implement the enable bit.  */
+        if ((s->cr ^ value) & CR_UARTEN) {
+            /* Re-arm the log warning when the guest toggles UARTEN */
+            s->logged_disabled_uart = false;
+        }
         s->cr = value;
         pl011_loopback_mdmctrl(s);
         break;
@@ -665,6 +684,7 @@ static void pl011_reset(DeviceState *dev)
     s->ifl = 0x12;
     s->cr = 0x300;
     s->flags = 0;
+    s->logged_disabled_uart = false;
     pl011_reset_rx_fifo(s);
     pl011_reset_tx_fifo(s);
 }
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index ff735b5234..5695787650 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -51,6 +51,7 @@ struct PL011State {
     qemu_irq irq[6];
     Clock *clk;
     bool migrate_clk;
+    bool logged_disabled_uart;
     const unsigned char *id;
     /*
      * Since some users embed this struct directly, we must
-- 
2.43.0


