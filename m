Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3981323wrs;
        Mon, 26 Aug 2019 07:35:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwj/DO/kHAZoUaBwyW2a9dhb1z99cVcMg0TdUx6O40eXThlem5ZkgFyepI4s/HSpi3CjBPS
X-Received: by 2002:a50:b885:: with SMTP id l5mr18565974ede.190.1566830105065;
        Mon, 26 Aug 2019 07:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566830105; cv=none;
        d=google.com; s=arc-20160816;
        b=R6fD6Cre9boTxipIxR9nNw9vDsqg0k+S/8/ohvg5Ym1Gn/kDE5hkxWuBOh7Y5ReuHo
         rE68fZ7/z6wbDBuUCEIFzI0VBBm0FhApQ6u28CH69F7MHSnSZ2erA2jVSt/oBa3IYw9t
         ivd5jIrrT7RYjomI0iFDdGH/qllyFVNkhiUMgHoGa/EZfdCUkbX+YhEnWc6BW+fheWhB
         Gv0aGWxkLIGaguKHNtOa4ZLk6q4ui9LclcdJuLVGX1DjgqGT9X6vwgnh4KnEgLPsk9rP
         7xZbdPM3OAMPZE7Qedu+9ai8qY3fGDVhZ9zYEctcbM0SMn0aJsnDhPxB9r8mVbehQ+R+
         0MuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=UX8P26c31M+rCEoyJuKagpve2bs867NolKhEqaIdbcM=;
        b=QYij+3tykQWCil1zr9Pqlnh/6z//S5wtwmh7tl6946N5BD+qOpnyx2evI8bGus6V3q
         I7Wezr+/cgfPur9V9HPfzrv3I7gbjw1MrUduBGpnGuuebqBmUsRMkJjpE1SYxBTycI7U
         YQYM6mETa5cPaBAzn4hX6nHIT0F2N6rh20w5KqVIzlxuAvRSx79Qx4alk42BLC+gvCWM
         8qtFoX7qjFetCqNIOq3Jdv6uEl7qKTukfGAFvJX2c92R4BceRruXLk5VJx1P8QZC5ueb
         HiwkwLokft6gHkm40dhvEQ9mButlZ4uVbLWuvmeuHAgBKqRLdWAKOMmkkm70fPnYQUDZ
         lJvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si7529074eda.146.2019.08.26.07.35.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 07:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2G5H-0001D2-T0
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 10:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42978)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2FqG-0004iX-L5
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:19:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2FqF-0000qR-GC
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:19:32 -0400
Received: from nsstlmta40p.bpe.bigpond.com ([203.38.21.40]:57903)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2FqB-0000jX-Jj; Mon, 26 Aug 2019 10:19:28 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep40p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141922.EPIO32345.nsstlfep40p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:19:22 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvgeqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehsuhhnuggvvghprdhlkhhmlhesghhmrghilhdrtghomheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgepud
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920D8AE2C1; Tue, 27 Aug 2019 00:19:21 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:43 +1000
Message-Id: <90f3db90a7a1aca45f7741ee42842f29f83077ff.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.40
Subject: [Qemu-arm] [Qemu-devel] [PATCH 17/19] hw/ssi: Declare device little
 or big endian
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Tony Nguyen <tony.nguyen@bt.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MpIpj0p3+Ofs

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.

Then, on inspection:
- if not used, re-declare as DEVICE_HOST_ENDIAN.
- if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
- if just a bit bucket, re-declare as DEVICE_HOST_ENDIAN
- if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
- if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
- if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/ssi/mss-spi.c       | 2 +-
 hw/ssi/pl022.c         | 2 +-
 hw/ssi/stm32f2xx_spi.c | 2 +-
 hw/ssi/xilinx_spips.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
index 3050fabb69..914f90f3ad 100644
--- a/hw/ssi/mss-spi.c
+++ b/hw/ssi/mss-spi.c
@@ -361,7 +361,7 @@ static void spi_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps spi_ops = {
     .read = spi_read,
     .write = spi_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 1,
         .max_access_size = 4
diff --git a/hw/ssi/pl022.c b/hw/ssi/pl022.c
index cade2e92a8..1501af2850 100644
--- a/hw/ssi/pl022.c
+++ b/hw/ssi/pl022.c
@@ -228,7 +228,7 @@ static void pl022_reset(DeviceState *dev)
 static const MemoryRegionOps pl022_ops = {
     .read = pl022_read,
     .write = pl022_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static int pl022_post_load(void *opaque, int version_id)
diff --git a/hw/ssi/stm32f2xx_spi.c b/hw/ssi/stm32f2xx_spi.c
index cd6e8443db..dbb109b2dc 100644
--- a/hw/ssi/stm32f2xx_spi.c
+++ b/hw/ssi/stm32f2xx_spi.c
@@ -167,7 +167,7 @@ static void stm32f2xx_spi_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps stm32f2xx_spi_ops = {
     .read = stm32f2xx_spi_read,
     .write = stm32f2xx_spi_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription vmstate_stm32f2xx_spi = {
diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index a309c712ca..e622e38f6d 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -1240,7 +1240,7 @@ static MemTxResult lqspi_write(void *opaque, hwaddr offset, uint64_t value,
 static const MemoryRegionOps lqspi_ops = {
     .read_with_attrs = lqspi_read,
     .write_with_attrs = lqspi_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 4,
         .max_access_size = 4,
-- 
2.23.0

