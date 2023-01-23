Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3045897ejc;
        Mon, 23 Jan 2023 08:23:50 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtJlHX2yA6W1jIpGBXl3UMz11JhaJNTYdNnKG4K6ZW7D++WaVl1DoIplz/DRJhlp2pjRWmt
X-Received: by 2002:ac8:72d8:0:b0:3ac:c2b8:e with SMTP id o24-20020ac872d8000000b003acc2b8000emr37201477qtp.19.1674491030091;
        Mon, 23 Jan 2023 08:23:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674491030; cv=none;
        d=google.com; s=arc-20160816;
        b=lkzvIDlXccaYKPKil+xoh1c3rBYfinr9Qgh/0yLowIiFVF+Dz95ptS2BcbcCtNMKUl
         raEJS2AtuMCcurRzLw5GPc2D29a5ueuoqojXafrK1Ctbbcy8Cb6U7OYcHZs5b+nVExQj
         GfMCsT/jO2gTEQ66l0DY95DzeykDi8JE67Y0/CGi9OirljpVnaOoqRvD4+pJdRDsw0We
         b3LPBtkOMbL9ExEv07j+v+pu0gjLcJ91fyAYUrJ/yiFNzkKSiF80KrKDz2N/Y0qcz93x
         WtsOfKOib2HlYWntWd+8UauJzfLjcE17C6R1oe8tk2Is8mERL2ankmYPs4Bn5W/A24iX
         3/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=fverqNREmS5s4/SjpzVdZQq3nCNdpcGWovixM90mnW4=;
        b=emWZoYceZ3eqSa/qWjbFu9cxm+9zVceRuLw3vg5iBvq3J5Usb8GPLwOdG7CEaaDs+X
         hSgsFQpNYBsHkHKZJ8lA7sWDB3yfwiTieXnTjhk8q4F+OhNOkP9A0swRssdq1DEuln4S
         3uZD9bGsVqTBtKMEBUcowtTPwz7KQ+UOTM+eehK0Ww6xKoehD+Yb0qkPJFCh1viyqO3w
         vev1WZDgyGBwr3hoWF9A7Qj7VqLL65WWMbTmvpdBXNsE0sAWxD7aGzKaRlGcc7I0+5SM
         mMG7jW/s7zdZyAh81Z2bIpP+q6R7+sWWEtS+bqDjR4zKS3CuxAcapR62yGhe0U14C0pg
         eKuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=MLy3M1vx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05622a104100b003b63c1ab226si14370621qte.535.2023.01.23.08.23.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:23:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=MLy3M1vx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJzbR-0007hS-QZ; Mon, 23 Jan 2023 11:23:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbM-0007eh-Qc; Mon, 23 Jan 2023 11:23:20 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzbK-0003b2-U1; Mon, 23 Jan 2023 11:23:20 -0500
Received: from localhost.localdomain (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id EC35C20E2C01;
 Mon, 23 Jan 2023 08:23:16 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC35C20E2C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490998;
 bh=fverqNREmS5s4/SjpzVdZQq3nCNdpcGWovixM90mnW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MLy3M1vxEZpNrrdx22R8T7tW0thWmDtwToVlTTAbYqoeDTP6suBYs9Ra7cRQ0IL9W
 2xebo0ojvqUE9l/Zg6GmUJhi/pKkq4bQLLPqSo9nSxINYlFqy5Y9gHldpiz1+S9uOX
 v+PwNF4ke+6esc5zEQsHaIfs8nHy/FczkuLjeOFE=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org,
	philmd@linaro.org
Subject: [PATCH v4 5/5] hw/char/pl011: check if UART is enabled before RX or
 TX operation
Date: Mon, 23 Jan 2023 17:23:04 +0100
Message-Id: <20230123162304.26254-6-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
References: <20230123162304.26254-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -197
X-Spam_score: -19.8
X-Spam_bar: -------------------
X-Spam_report: (-19.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NSICGCJrOZz+

UART should be enabled in general and have RX enabled specifically to be
able to receive data from peripheral device. Same goes for transmitting
data to peripheral device and a TXE flag.

Check if UART CR register has EN and RXE or TXE bits enabled before
trying to receive or transmit data.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c | 36 +++++++++++++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c15cb7af20..28ba242e2f 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -54,6 +54,11 @@
 #define INT_E (INT_OE | INT_BE | INT_PE | INT_FE)
 #define INT_MS (INT_RI | INT_DSR | INT_DCD | INT_CTS)
 
+/* UARTCR bits */
+#define PL011_CR_UARTEN (1 << 0)
+#define PL011_CR_TXE    (1 << 8)
+#define PL011_CR_RXE    (1 << 9)
+
 static const unsigned char pl011_id_arm[8] =
   { 0x11, 0x10, 0x14, 0x00, 0x0d, 0xf0, 0x05, 0xb1 };
 static const unsigned char pl011_id_luminary[8] =
@@ -211,6 +216,16 @@ static void pl011_trace_baudrate_change(const PL011State *s)
                                 s->ibrd, s->fbrd);
 }
 
+static inline bool pl011_can_transmit(PL011State *s)
+{
+    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
+}
+
+static inline bool pl011_can_receive(PL011State *s)
+{
+    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
+}
+
 static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
@@ -221,7 +236,9 @@ static void pl011_write(void *opaque, hwaddr offset,
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
+        if (!pl011_can_transmit(s)) {
+            break;
+        }
         ch = value;
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
@@ -287,12 +304,21 @@ static void pl011_write(void *opaque, hwaddr offset,
     }
 }
 
-static int pl011_can_receive(void *opaque)
+static int pl011_receive_capacity(void *opaque)
 {
     PL011State *s = (PL011State *)opaque;
     int r;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if (!pl011_can_receive(s)) {
+        r = 0;
+    } else {
+        /*
+         * Capacity is deliberately maxed to 1 here even though we could have
+         * more fifo space. This is something we can optimize, but for now
+         * pl011_receive expects to handle exactly one element at a time.
+         */
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
@@ -443,7 +469,7 @@ static void pl011_realize(DeviceState *dev, Error **errp)
 {
     PL011State *s = PL011(dev);
 
-    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
+    qemu_chr_fe_set_handlers(&s->chr, pl011_receive_capacity, pl011_receive,
                              pl011_event, NULL, s, NULL, true);
 }
 
@@ -461,7 +487,7 @@ static void pl011_reset(DeviceState *dev)
     s->fbrd = 0;
     s->read_trigger = 1;
     s->ifl = 0x12;
-    s->cr = 0x300;
+    s->cr = PL011_CR_RXE | PL011_CR_TXE;
     s->flags = 0;
     pl011_reset_fifo(s);
 }
-- 
2.34.1

