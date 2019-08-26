Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3974623wrs;
        Mon, 26 Aug 2019 07:29:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJOwnLewdP1L4cIDfH5fexbFHEJmonmOEC94jJHNQpsWkAteayscYcA935dLFeVWsYzK2g
X-Received: by 2002:a37:6905:: with SMTP id e5mr16434611qkc.121.1566829778527;
        Mon, 26 Aug 2019 07:29:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566829778; cv=none;
        d=google.com; s=arc-20160816;
        b=Ae8DTrLH8xaqkpgCaLrgn+4IGGdfE3yvCIgXDbW3Wn+AoD7DwnFuoZ96z2za4cIO3F
         9LmwJV58UC1gWyFzm89StDGnCSSro7Jj+/1+9t9AKCVcn2KQF4ulm7BiCnm4DnvixBq6
         UgkxO/mBv5Dx4gap1UhHshISEcGHgQ/7/VrWrhr+PhF6Jt8qRZUF5lIGvkhh2NxAGi8M
         R6tLrwlesyuvYaz0L9mzDeOJcCKl1BsO8h2DhqGCFAcN2ys5g7+kVSN1kk7474FdF1FV
         y8+Gavr9g43BNs/VpLXaM0CQeC1RY+FmNsW1cICE0USy7NExfx4taZqCt3SQkAM2OW5S
         9WlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vA7UptjpJLeLSWnnDkWj6yRqsWVVzVrT3uQ/5tlpUWA=;
        b=IcL2Ez5Z+UrCCUxgLPg0lVh5JG0FiBTJuk3G98cP5SYKm6oXyNGdtgAo72hnDRYbPN
         mJMPnIcmAFhJR/rc93kETmrYGHEAseg/dbAvGruh1MncWHzSvjKZg0Sb4KgkY2b4o5DZ
         tINUYhNgU0GjADGH/2c/vBR6E3XvKn1NiK97AXhW+VU44yPz3b4LHFFMUmcpVgheVo58
         SXSgdSc+Z8SSc2DUx3yrltvkGn/h3VaWsw+5iA4Vfg21QDq6ieQIs+toFHgdP758uSB0
         6X3dgJJutTRuMqE6l95NmsOdhzEGaLu8JRwWLPvDO9526u2h9ymp61SPM870m39VpCC2
         vVQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n187si7172025qkb.156.2019.08.26.07.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 07:29:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2G01-0004jI-Q6
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 10:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42633)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2FpZ-0004P3-Qh
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:18:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2FpX-0008NG-NY
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:18:49 -0400
Received: from nsstlmta40p.bpe.bigpond.com ([203.38.21.40]:46336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2FpV-0008IQ-2S; Mon, 26 Aug 2019 10:18:46 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep40p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141840.EPFV32345.nsstlfep40p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:18:40 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoegsrghlrhhoghhgsehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeoghigthesmhhprhgtrdhpkhhurdgvughurdgtnheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D2D117510588EE7; Tue, 27 Aug 2019 00:18:40 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:33 +1000
Message-Id: <70bf44892612398a5ab32bbcd42a7fa022490bf0.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.40
Subject: [Qemu-devel] [PATCH 07/19] hw/gpio: Declare device little or big
 endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E0fhQxFz3jYn

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
 hw/gpio/pl061.c     | 2 +-
 hw/gpio/puv3_gpio.c | 2 +-
 hw/gpio/zaurus.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index 2a828260bd..25371d6c5a 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -341,7 +341,7 @@ static void pl061_set_irq(void * opaque, int irq, int level)
 static const MemoryRegionOps pl061_ops = {
     .read = pl061_read,
     .write = pl061_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void pl061_luminary_init(Object *obj)
diff --git a/hw/gpio/puv3_gpio.c b/hw/gpio/puv3_gpio.c
index d19e342514..46ab3b80be 100644
--- a/hw/gpio/puv3_gpio.c
+++ b/hw/gpio/puv3_gpio.c
@@ -97,7 +97,7 @@ static const MemoryRegionOps puv3_gpio_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void puv3_gpio_realize(DeviceState *dev, Error **errp)
diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 9a12c68342..60bbbb8564 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -157,7 +157,7 @@ static void scoop_write(void *opaque, hwaddr addr,
 static const MemoryRegionOps scoop_ops = {
     .read = scoop_read,
     .write = scoop_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void scoop_gpio_set(void *opaque, int line, int level)
-- 
2.23.0

