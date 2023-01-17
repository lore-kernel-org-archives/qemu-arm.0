Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2784698ejc;
        Tue, 17 Jan 2023 14:06:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvVeLtDsHQX71KwMNNF0/QUB40JinhE/PNgEFDlOW0aYNu/N1dTEMOypi0XDtqKqHYfoUNj
X-Received: by 2002:ac8:4b6d:0:b0:3b6:2b6f:fbef with SMTP id g13-20020ac84b6d000000b003b62b6ffbefmr13914201qts.48.1673993206508;
        Tue, 17 Jan 2023 14:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673993206; cv=none;
        d=google.com; s=arc-20160816;
        b=AOmqJO+oUSZLnTlvsIKRFvrQO6q8ktuBc0rL+RJ6yg5NZIhkbKOvNG6u/L5q2Sm9DX
         WyEyLutaRhc+xLmBfUCT8RelLTkibxIJ8eWkntimZOgVGeBPIgwp1/3UlQIK7K3nRoFN
         E7Yl/NrqMA51ABk5hbpNMwLZfI0KtNYV4BAhpIL7FXEORepzuLcJdabl8xL7iLEwRYbG
         PkcvzzxYwZMUzBm3wffzswXT8eBPxJ3qahqwJOWt4dIPV2nTy4AQ/byH1a3QFmR8F9S4
         Qh5IB4CJ5RaiIcBvqhC0b/AZ85gcc0S9uH+f6pxvDXXamfz/hLjL6JTX8lAVBh+GdzRq
         XpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:dkim-filter;
        bh=8xKBflc6IJYkTg6cf5JZjy/Tiro6yetQ/aEWtsvCihM=;
        b=BMYb+J9l9Iy/qiJXFE1TAPlBfAuWaNIduPTZA1W5eCK5GzoZfjfb9fdzqrn+2ciVym
         wUUBYdovx285nUqbY2Zxd90NOcsqtH6CJJiJLBfA3wM5rmuSSmm0DLsMp4qJ1oq+OxOp
         vBVhwuRUN/EpfuDKApoUAuUwu1ZToSiK7ua7l7Sm/B1YenABJiYp07l6uu6MHOjEaK4S
         H3grAa2+mVBLKJH6otzbsiPtWpNdTuUmc6a7/U+32pHk4pqYN0Ruo+0LKpExfqF6o4D0
         tK10KN4v7BvnRwbhNJ8rmijVphaCvmZhU2+aMc2sCz7vdnuLr09P5EofFy5HgUny8rec
         NsQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b="Xt/aqXpa";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020ac84998000000b003a57f6a1e68si9114764qtq.204.2023.01.17.14.06.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 14:06:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b="Xt/aqXpa";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHu5S-0003gT-Da; Tue, 17 Jan 2023 17:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5K-0003d5-SA; Tue, 17 Jan 2023 17:05:40 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pHu5I-0006sj-Sd; Tue, 17 Jan 2023 17:05:38 -0500
Received: from localhost.localdomain (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 35BA820E09E0;
 Tue, 17 Jan 2023 14:05:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 35BA820E09E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1673993135;
 bh=8xKBflc6IJYkTg6cf5JZjy/Tiro6yetQ/aEWtsvCihM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xt/aqXpa9wKJUPWh4lt1zHEp4s3SPEftD0ldZx1km/3z50MkS+sVL9B3QTDG2bjIS
 pZQ5EZeoUiiLxBGLXKChtqHJQetU7PHZ9VNLtFjmiqW01aMnS5tYhSMTSYjt80T7U6
 Ysa/53bQSZrXYoRCZbb1q3Vden2kAJzSI6hIJ3uY=
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 4/4] hw/char/pl011: check if UART is enabled before RX or
 TX operation
Date: Tue, 17 Jan 2023 23:05:23 +0100
Message-Id: <20230117220523.20911-5-eiakovlev@linux.microsoft.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
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
X-TUID: YJ4JMYlji+Rv

UART should be enabled in general and have RX enabled specifically to be
able to receive data from peripheral device. Same goes for transmitting
data to peripheral device and a TXE flag.

Check if UART CR register has EN and RXE or TXE bits enabled before
trying to receive or transmit data.

Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
---
 hw/char/pl011.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 3184949d69..522f36e4f3 100644
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
@@ -203,6 +208,11 @@ static void pl011_trace_baudrate_change(const PL011State *s)
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
@@ -213,7 +223,9 @@ static void pl011_write(void *opaque, hwaddr offset,
 
     switch (offset >> 2) {
     case 0: /* UARTDR */
-        /* ??? Check if transmitter is enabled.  */
+        if (!pl011_can_transmit(s)) {
+            break;
+        }
         ch = value;
         /* XXX this blocks entire thread. Rewrite to use
          * qemu_chr_fe_write and background I/O callbacks */
@@ -284,7 +296,11 @@ static int pl011_can_receive(void *opaque)
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
@@ -429,7 +445,7 @@ static void pl011_reset(DeviceState *dev)
     s->fbrd = 0;
     s->read_trigger = 1;
     s->ifl = 0x12;
-    s->cr = 0x300;
+    s->cr = PL011_CR_RXE | PL011_CR_TXE;
     pl011_reset_pipe(s);
 
     for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
-- 
2.34.1

