Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp968019wrs;
        Fri, 23 Aug 2019 12:24:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6z8eIWeNNy4mvrxBPdGz42S6yLHgd1jXH8TSaqNTyXyp/JHj4oaRsB5eKz6dCFmF9qs2R
X-Received: by 2002:a05:6402:518:: with SMTP id m24mr6060208edv.169.1566588249787;
        Fri, 23 Aug 2019 12:24:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566588249; cv=none;
        d=google.com; s=arc-20160816;
        b=G66UZKGlYtwyIGmgGprkb2X0ptS4FE+95XNfbnFmDuYOUZWhvaUwpL0oRnyt0lPIjo
         LpZbtT0/FprcN9hXAj10yezZcVi+5VisXH1VN5xqueunkVfY5L592Fl+lMsisne7csqP
         v5yKJ4hQd4LcHsRFJUu4EiHisUh+x63DLHz8T/WrJq2r0fpypzNG1pBgi4bAMGpfPS2p
         XBH3VbweKU/XOx4//3bL2O9yGdg7mQgfYyLBqUCGNHOp6cq3nLjDdgIbog3x2U7nVwYG
         GdiJ3Exz38O5ouvjrVsMFND1n3mmQvjwX+XE09nBBDRQhRdACNEghIfnnDeQtJuwS/N4
         eAkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=2ZZ08n/NDy0/mdPSCemT4Py6+zPq9VZOuDCvTnfm6C8=;
        b=FWfVGCsOB8t9qTvpW5It4An4z52GJWm5HvjxvtJnQ0zvulr+v/hIbJ1Y17/YFPSuDN
         2yYNP+BoNxwpyqphspEQpCxSSOvegET2fmeqtysQhGHIJuIKsACiDTJtnLdwuA7Bogph
         WSgPK3CDCKMcY6/HVOcp6RQSvq3z/42xPKGxmQgYmzp5pTsZXNu1LDcV3tcDjGzKVgd3
         y00+nP2b31MCQCu3tKq64xeix7jZi/r7t+FlYfXTknWNM3emIqCbpX5D/Gsu+Muxichv
         DZV4e35C42xCqDQTXAbuNwrGLTsKm5IaIiR0LMuMWKGp05+gl2DgFoI7PydcBcJf+1gW
         I1fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si2429663edz.77.2019.08.23.12.24.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:24:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:33348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1FAO-0000Xm-3B
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43277)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhR-0003kc-Op
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:54:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhQ-0003RD-D9
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:54:13 -0400
Received: from nsstlmta12p.bpe.bigpond.com ([203.38.21.12]:46602)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1EhN-0003Mv-7G; Fri, 23 Aug 2019 14:54:09 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep12p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185404.TOWL1023.nsstlfep12p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:54:04 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqedprhgtphhtthhopeeophgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoshhunhguvggvphdrlhhkmhhlsehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpedutd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C20B5; Sat, 24 Aug 2019 04:54:03 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:36 +1000
Message-Id: <c74e3a308105dc09a8a8d79ba3bc83405f09a4cb.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.12
Subject: [Qemu-arm] [Qemu-devel] [RFC PATCH 15/17] hw/ssi: Declare device
 little or big endian
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
X-TUID: RKyc5+LH32le

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

