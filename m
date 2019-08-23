Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp941276wrs;
        Fri, 23 Aug 2019 11:59:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzf5DTdSNO0FV4U/T0mB+Ci/TLl9SqpfglWwuvvr4q3645GtjKo25JzPd2SoHXrzTOGNnKi
X-Received: by 2002:ac8:2652:: with SMTP id v18mr6440064qtv.40.1566586743740;
        Fri, 23 Aug 2019 11:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566586743; cv=none;
        d=google.com; s=arc-20160816;
        b=P0wWC7WHxQPhjh63DxRgBY2as0kllYxN541bbn4XGteVBABO+BVyjS9wzhGOGr5Hnm
         /b1sVjr3GCHZnWbj3gW9HlOi9RHsdFahK81wBlm17/iEj1UQxF+DB5yaQutKga9YVKTk
         rVkhqth5UZm16SwkkEUYHhVz34VGG9ZdiP7s2ynLHo0uOvO+W6uGJjaZBIBau5pB4twJ
         TMU8dNDfZ94GWN0mz0Kq7uu8erICuuUBQ1Y94auy3nBLdofHORd4bUmJnyB6HpcEBsFS
         c8+glPkC9P3vs3IiVyAr0yr6YPlI51ipoQDOhBYB7awr9YgVItc72YrhO7v6zZfWmaOO
         g7pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=wjEie56xDzpiKuutdzzJ+nqHHlN9ycs+sm7ekxlqnhg=;
        b=LM15me7UMLUVgSsbpnmXeTgba5UVTRCEnt8oU1DY59rZ6WmqWimrSY2bptBTmTObft
         8Yu9yPQtHVi6mKe3GOwpBQ9uhR19siBhxgNnUc3AFFdFROBjk8ZVPgLe8fgaYTkrPuvX
         eqI/ERXQ370WlyJhFvIkOk6PKTi5ih6vHnXqsTUrIhY1xwBcQxnzOq+J+QLQKku81hHG
         mZl8QwSg3sQ85jMxGq2LHRCFBGPd6/6VCq5Wezk3fqO4tr2JG1RCBYiW3Hm7mwWwqLrM
         KaiDQlxI3A59ja2LeKgR9g/j7ta0Lug61V1y9zHsgm3mBtZhT5nQenLA33v1ucveCZvm
         Hb5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 53si2724358qvu.88.2019.08.23.11.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 11:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:32950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Em6-000885-Kg
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 14:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EgY-0002MR-6D
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EgW-00030R-Ly
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:18 -0400
Received: from nsstlmta25p.bpe.bigpond.com ([203.38.21.25]:54762)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1EgW-0002xy-2v; Fri, 23 Aug 2019 14:53:16 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep25p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185311.NTBS14235.nsstlfep25p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:11 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqedprhgtphhtthhopeeotghhohhuthgvrghusegruggrtghorhgvrdgtohhmqedprhgtphhtthhopeeovggughgrrhdrihhglhgvshhirghssehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeofhhrvgguvghrihgtrdhkohhnrhgrugesrggurggtohhrvgdrtghomheqpdhrtghpthhtohepoehmrghrtggrnhgurhgvrdhluhhrvggruhesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeomhhitghhrggvlhesfigrlhhlvgdrtggtqedprhgtphhtthhopeeophgsohhniihinhhisehrvgguhhgrthdrtghomheqpdhrtghpthhtohep
 oehpvghtvghrrdgthhhusggssehnihgtthgrrdgtohhmrdgruheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3581440CDC4292; Sat, 24 Aug 2019 04:53:10 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:24 +1000
Message-Id: <cece576078bb043c7f98b899c643159aaaf3f0d8.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.25
Subject: [Qemu-devel] [RFC PATCH 03/17] hw/char: Declare device little or
 big endian
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Tony Nguyen <tony.nguyen@bt.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Walle <michael@walle.cc>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UyIhbwNceqUh

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/char/cadence_uart.c   | 2 +-
 hw/char/escc.c           | 2 +-
 hw/char/etraxfs_ser.c    | 2 +-
 hw/char/grlib_apbuart.c  | 2 +-
 hw/char/imx_serial.c     | 2 +-
 hw/char/lm32_uart.c      | 2 +-
 hw/char/milkymist-uart.c | 2 +-
 hw/char/pl011.c          | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index 0e315b2376..5a128aa5b3 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -459,7 +459,7 @@ static uint64_t uart_read(void *opaque, hwaddr offset,
 static const MemoryRegionOps uart_ops = {
     .read = uart_read,
     .write = uart_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void cadence_uart_reset(DeviceState *dev)
diff --git a/hw/char/escc.c b/hw/char/escc.c
index e185522e27..e2130e04e5 100644
--- a/hw/char/escc.c
+++ b/hw/char/escc.c
@@ -576,7 +576,7 @@ static uint64_t escc_mem_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps escc_mem_ops = {
     .read = escc_mem_read,
     .write = escc_mem_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 1,
         .max_access_size = 1,
diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 15ac12ef22..6096158188 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -157,7 +157,7 @@ ser_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps ser_ops = {
     .read = ser_read,
     .write = ser_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4
diff --git a/hw/char/grlib_apbuart.c b/hw/char/grlib_apbuart.c
index fe3cbf41a3..880878ab4d 100644
--- a/hw/char/grlib_apbuart.c
+++ b/hw/char/grlib_apbuart.c
@@ -239,7 +239,7 @@ static void grlib_apbuart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps grlib_apbuart_ops = {
     .write      = grlib_apbuart_write,
     .read       = grlib_apbuart_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void grlib_apbuart_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index fddde9b43d..8a2f10d7bd 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -334,7 +334,7 @@ static void imx_event(void *opaque, int event)
 static const struct MemoryRegionOps imx_serial_ops = {
     .read = imx_serial_read,
     .write = imx_serial_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void imx_serial_realize(DeviceState *dev, Error **errp)
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index 32f29c44cf..372c7d60d8 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -207,7 +207,7 @@ static void uart_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps uart_ops = {
     .read = uart_read,
     .write = uart_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index c358ca07f3..ed4f02c500 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -158,7 +158,7 @@ static const MemoryRegionOps uart_mmio_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void uart_rx(void *opaque, const uint8_t *buf, int size)
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index 84ad8ff9fb..0a86f6f340 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -289,7 +289,7 @@ static void pl011_event(void *opaque, int event)
 static const MemoryRegionOps pl011_ops = {
     .read = pl011_read,
     .write = pl011_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription vmstate_pl011 = {
-- 
2.23.0

