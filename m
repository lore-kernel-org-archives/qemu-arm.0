Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F51F513E1
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 22:11:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyGt0-000192-9O; Thu, 05 Mar 2026 17:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGss-00011P-F2
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:30 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vyGsq-0002FR-TN
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 17:09:30 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-483487335c2so71874305e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2026 14:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772748567; x=1773353367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JOiFzMYt3nqjzzSrXRu86P7xq+XKX8Q8xCa2W8q3YHY=;
 b=D2zMpfj+NJwRli0CBo8oYz5wjWOQZv9h4VLd/K+6Vs1Poc6e2WAqsniLwe3P67ZY7a
 +sHC0rKCwWrA8RGfTKOr0Vmq0hgxiRSEgwsjs/I6SygtJ/JfAWH3/IeZdiRVSQbm1+uS
 M4CFOlI3TSPjlx5f3koGvV777UeKT4VaFoOgePyoSetNtyeLI6f1vv4q3GxN7imO9kjt
 os120g8c3+7rtun/MSDTqvoNXjws/SVl9c0jJ8as1UU+t9p1/plYrW/yBB/LarLeGE6s
 02VuL/XzUSERyW+dKcgygAPSxxucqKYmQB7rK5lsLlffduaOPRjoylCL1Jxs9MdRBIPj
 Wd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772748567; x=1773353367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JOiFzMYt3nqjzzSrXRu86P7xq+XKX8Q8xCa2W8q3YHY=;
 b=TQyX1VtMsuNBAVaoaMlwMrVDRrB2miD/nt9QZbRxqY0S7zahRJGsomOcjAyfAZ2eXH
 cFsi3FCfSU6CR2izdsOiu6zrKXB9HtTjYIVDf6rgoOF/L97f5RxldjJRxZZZTHL4XABw
 a+8wXUgj5VyNjFHxtr0faJiJZwFN6Xfxva+JAGppnC5og5rh60OZF7pM8dxyZKTpN6o3
 6VDep8/bv6E6QOEnaSpZYRjWzzkSKRCGSGY2BLF7iGVTLcsLmy/hkvHxnl3R2Wbh3eqG
 lDyg5ZxXKj2YlQiWK5QGWHMMpp0K+W3CbzqSE4kyH5Zgrb+goriE+sBmCgwb/xsAZdZt
 etGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRQH3UHZ5/BpSVPeRH2sN5gZ0FFS6k1W3f4uBBa955pBinTJSEutWtmtj9IyRf493hBSn/IVYQUw==@nongnu.org
X-Gm-Message-State: AOJu0Yy3iDbCq9+T9MTw5t2+I72cBPvyCZv8f13k3+VvSGYFPS4cYeZp
 WZxLajD6eSUibf/D2+lPjBjPCG3pLYa8GAxzZ4/XHegWyO5AV9uIUZmt
X-Gm-Gg: ATEYQzxGFCd8fu1VIlLMtUlzVcAUJwDZbmPAOQwQkKTTNA7rmA73m/RhCVeqKk7VaHf
 Q2vlJBIAntMzm/P4GQiaOKn7xW5qTTT0cw14ny4Ku/KNeNjbkRNp8WsCn1W+T7kiWH1//uG5nu3
 qZQANSJsTpqgN2HferaWolm1elz1QFFT6b+EHFj4NqeZ6Ljbiq3f0UKbRJVkPZ1K/TXGTrI4n0/
 s0jVtnpllAcJwA7i7Ca0+j9eFLFqUs8fzjqUM5bw6Ou1CCyh85oImBOhss+JtLCmYhog8qaqX/5
 aR8lJvbugH35yWyHJ2iPFpOUgliZqZ5tniWGJYMrhuvum66KC0yK62TN4yI3OodGgDeqCYFB4by
 E1zYAtR8eOrjfqjHTV9g12fciHBukZNXXS+FNTjWA9wkLvlVasrsUSDo2/Pa4hgs3xjIMJ26KJm
 Xw7MV2knzY9ePatGOGS6wCYQ3oaAeGcZAi+R+CkNXTtazoI0KyAsFozaqJmTpEanTSbtWXjcOdc
 +zLV9a4/mvCCPxTh+spJFz0Tk14UF/tf8fpjj3ZLvGtW2o=
X-Received: by 2002:a05:600c:528e:b0:483:a895:9d85 with SMTP id
 5b1f17b1804b1-48519828c69mr136498285e9.2.1772748566767; 
 Thu, 05 Mar 2026 14:09:26 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-2a02-3100-2989-c400-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:2989:c400:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fa87e56sm67419615e9.0.2026.03.05.14.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 14:09:26 -0800 (PST)
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
Subject: [PATCH v3 06/14] hw/char/serial: Prefer fifo8 methods over open-coding
Date: Thu,  5 Mar 2026 23:09:03 +0100
Message-ID: <20260305220911.131508-7-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305220911.131508-1-shentey@gmail.com>
References: <20260305220911.131508-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32e.google.com
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

Use fifo8_is_empty() and fifo8_is_full() to improve readability of the
code.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/serial.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 0f2e79dfba..20f68fd2f8 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -239,7 +239,7 @@ static void serial_xmit(SerialState *s)
             if (s->fcr & UART_FCR_FE) {
                 assert(!fifo8_is_empty(&s->xmit_fifo));
                 s->tsr = fifo8_pop(&s->xmit_fifo);
-                if (!s->xmit_fifo.num) {
+                if (fifo8_is_empty(&s->xmit_fifo)) {
                     s->lsr |= UART_LSR_THRE;
                 }
             } else {
@@ -481,7 +481,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
             if(s->fcr & UART_FCR_FE) {
                 ret = fifo8_is_empty(&s->recv_fifo) ?
                             0 : fifo8_pop(&s->recv_fifo);
-                if (s->recv_fifo.num == 0) {
+                if (fifo8_is_empty(&s->recv_fifo)) {
                     s->lsr &= ~(UART_LSR_DR | UART_LSR_BI);
                 } else {
                     timer_mod(s->fifo_timeout_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + s->char_transmit_time * 4);
@@ -555,7 +555,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
 static int serial_can_receive(SerialState *s)
 {
     if(s->fcr & UART_FCR_FE) {
-        if (s->recv_fifo.num < UART_FIFO_LENGTH) {
+        if (!fifo8_is_full(&s->recv_fifo)) {
             /*
              * Advertise (fifo.itl - fifo.count) bytes when count < ITL, and 1
              * if above. If UART_FIFO_LENGTH - fifo.count is advertised the
@@ -585,7 +585,7 @@ static void serial_receive_break(SerialState *s)
 /* There's data in recv_fifo and s->rbr has not been read for 4 char transmit times */
 static void fifo_timeout_int (void *opaque) {
     SerialState *s = opaque;
-    if (s->recv_fifo.num) {
+    if (!fifo8_is_empty(&s->recv_fifo)) {
         s->timeout_ipending = 1;
         serial_update_irq(s);
     }
-- 
2.53.0


