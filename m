Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1184887ejc;
        Fri, 20 Jan 2023 07:55:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsfiOHKXsBVA6o5JmYJKvfEC2jhdZro2+0OaCMLzodFlf1/vbaYVbWHh2/RhSGxrcxKS2Qz
X-Received: by 2002:ac8:7295:0:b0:3a7:648d:23d8 with SMTP id v21-20020ac87295000000b003a7648d23d8mr20743563qto.5.1674230153015;
        Fri, 20 Jan 2023 07:55:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674230152; cv=none;
        d=google.com; s=arc-20160816;
        b=MJmmypM87XRXafFRONGx6kdZJ8AjifZF2zAayGTHnB70OGRJh3aOK5vOLaYO/sYcWT
         VV7R9gs+Y4NjJcwRQxVbOj3bZDFm4t8Il0tktbJFSAbG2KNnIrsE8hQV7EyA2n4O2RBl
         4UwnK03qEUjgml9lzc24ZLewWp8z+3lNTD1Msop98ZvY64sD+NcfPt23q3GBtS02yVsr
         E0JwnJCLDMld61AMiFsUIkmZ1N/LgxqgtmBKNX4adgq8NoULT4ygSizh+uL7l7LD8Rpl
         lgAK62IKgK8o7voPfVzLhXRCOoHNcuJG/12vzp5KVQdXCO7K5KXxQMSGGpOKi9ARPtOz
         FjCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=dWvIutc+5rAT34AQVUWgIustPc04Zc+nyFtBP8ELUp0=;
        b=nRJdvnVEOUiMvMYGpRcCLDT5tf00SXOqHy6/rGkss8Q4fLuJwyHYXhDj4o+ZZeF01c
         hGDfw5FaZkW1R+/XaI5yEvRFcqV1hNZmdHQc/ITg5FMec265D6kHy40j+EU41J4+Z753
         QF+xeFayTOrkRNLPJrvHPgzMXHWbugFgD6ZYsnKdsQiworOU6WWXwzdwz1oZOMOZyT+r
         +GF7/6lR07/Gr7BVkppz/nIZtWpThf0nq6mbKY1uZY2ZPwmGBOp7m3MaFTWy9B3iRGCM
         zyOwspbRkuEbmXn+jpqudL7txnrIl6ixgLQP6VCGAj3JHFUeiihRvU5s6BD6F7TvyW6G
         s6mw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=sd8+bIJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z40-20020a05620a262800b00706b4163b4fsi5641042qko.141.2023.01.20.07.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 07:55:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=sd8+bIJw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pItjR-0004cP-7i; Fri, 20 Jan 2023 10:55:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjK-0004ae-AU; Fri, 20 Jan 2023 10:55:02 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pItjI-00069b-P0; Fri, 20 Jan 2023 10:55:02 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id DF38520E1A49;
 Fri, 20 Jan 2023 07:54:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DF38520E1A49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674230099;
 bh=dWvIutc+5rAT34AQVUWgIustPc04Zc+nyFtBP8ELUp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sd8+bIJwRtekvXRes90kaggZWhh6FtEzvTuA3v3Kg9Sl6dban/9XQpuTKy5kH/9fj
 PKKX36L6HS936HTRHB3Rmr2d6OKADejSksE4bSydvXFLQdGrL4PxABHeZbHAFe7t39
 FOOr2UOtdYJboYHL9bX+pyO2ur0kMV263jUxYyO0=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX or
 TX operation
Date: Fri, 20 Jan 2023 16:54:47 +0100
Message-Id: <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
MIME-Version: 1.0
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
X-TUID: XXen/tgJ6uBE

UART should be enabled in general and have RX enabled specifically to be
able to receive data from peripheral device. Same goes for transmitting
data to peripheral device and a TXE flag.

Check if UART CR register has EN and RXE or TXE bits enabled before
trying to receive or transmit data.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/pl011.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c72fbb7d50..dd20b76609 100644
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
@@ -211,6 +216,11 @@ static void pl011_trace_baudrate_change(const PL011State *s)
                                 s->ibrd, s->fbrd);
 }
 
+static inline bool pl011_can_transmit(PL011State *s)
+{
+    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
+}
+
 static void pl011_write(void *opaque, hwaddr offset,
                         uint64_t value, unsigned size)
 {
@@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr offset,
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
+        if (!pl011_can_transmit(s)) {
+            break;
+        }
         ch = value;
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
@@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
     PL011State *s = (PL011State *)opaque;
     int r;
 
-    r = s->read_count < pl011_get_fifo_depth(s);
+    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
+        r = 0;
+    } else {
+        r = s->read_count < pl011_get_fifo_depth(s);
+    }
     trace_pl011_can_receive(s->lcr, s->read_count, r);
     return r;
 }
@@ -461,7 +477,7 @@ static void pl011_reset(DeviceState *dev)
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

