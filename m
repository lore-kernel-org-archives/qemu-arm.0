Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp967096wrs;
        Fri, 23 Aug 2019 12:23:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyapOq6bTg9eokvvucQQ9+zdfD9Ok9ho/2z3A2OQYvUilQ+tL4dqbur5+/5VI8BgGU2hyfV
X-Received: by 2002:ae9:eb16:: with SMTP id b22mr5160926qkg.160.1566588188465;
        Fri, 23 Aug 2019 12:23:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566588188; cv=none;
        d=google.com; s=arc-20160816;
        b=ipbkF8GXMxmzLJigswuGkOoayqiU6WvER6w+YZTvdK3u4JOIJag+po5xusgnlM45u7
         mU2jPYYUWTbbDC7Qr8cgAHhx9CCPF9lEjXCdbdRDeqm22yKjBjNxTJve9O8/N4Q+NoaS
         ttJB2Rb7ce/lYx01AcBWsTwmy9yez9a99AHSTbUedNySPUeKtNQdBsMJlUfiZtdJeLO7
         Z7On3g/p7fLURqo9IFd7dTIHUdoy2YUHABwt/q3XTLqTiusTgaU1XYv+24DBdku05YMk
         EAqE33vehTPYPahW1ivAVzsV7maqOXNfNlCsecgWVpv4w4Ev0r+qr4lJf9eCClder3fU
         BwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=y69ndL4PIo9UIKZGLiIXz/l91KDJgYQYKvSuDGfuKtQ=;
        b=s6oCs/faJkxzHS8HA1PWNFI1I0OUYAPn7MkQn/kX29f1NBXQZTkUizcLbcxXNp/lUZ
         q6P1KgzL039o9e94zDf3KpW6zBYYFcCircudubbX5VlvQDqtNQ4BKKX2hIUxdrtkCQPQ
         3AEgLDGAywOhCOSi/YGLGVwV3kb6Fm5bDxVOtnDvBwq0sZRZh+HCjpqBi4SMqBcxrUHU
         n9UHIPSFgEkMx7/5IFZODEsu8Ls/ze8CW1iklUZM4/oRA+sBuUrBB6yvJj745SLslH+o
         PcIJkRqws3nTUu03LctBybpHgFobUOHiy0xosLmuAxU6KV+K5rOgyKzZrrvHLdbJaF3v
         5EvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s35si2878434qvc.145.2019.08.23.12.23.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:23:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:33272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1F9P-0007F0-Am
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43085)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhB-0003O1-62
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhA-0003HK-19
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:57 -0400
Received: from nsstlmta27p.bpe.bigpond.com ([203.38.21.27]:57150)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1Eh9-0003FT-Du; Fri, 23 Aug 2019 14:53:55 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep27p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185351.UQCL27545.nsstlfep27p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:51 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeomhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhmqedprhgtphhtthhopeeomhhsthesrhgvughhrghtrdgtohhmqedprhgtphhtthhopeeophgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpeek
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C1DAF; Sat, 24 Aug 2019 04:53:51 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:34 +1000
Message-Id: <3d3b45379acb99a1b84237333421481a854807cb.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.27
Subject: [Qemu-devel] [RFC PATCH 13/17] hw/pci-host: Declare device little
 or big endian
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
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jp9ByPvzXdzD

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
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 158d270b9f..485e2a02af 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -289,7 +289,7 @@ static void tseg_blackhole_write(void *opaque, hwaddr addr, uint64_t val,
 static const MemoryRegionOps tseg_blackhole_ops = {
     .read = tseg_blackhole_read,
     .write = tseg_blackhole_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size = 1,
     .valid.max_access_size = 4,
     .impl.min_access_size = 4,
diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
index b731d0544f..df7212237d 100644
--- a/hw/pci-host/versatile.c
+++ b/hw/pci-host/versatile.c
@@ -243,7 +243,7 @@ static uint64_t pci_vpb_reg_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps pci_vpb_reg_ops = {
     .read = pci_vpb_reg_read,
     .write = pci_vpb_reg_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         .min_access_size = 4,
         .max_access_size = 4,
@@ -309,7 +309,7 @@ static uint64_t pci_vpb_config_read(void *opaque, hwaddr addr,
 static const MemoryRegionOps pci_vpb_config_ops = {
     .read = pci_vpb_config_read,
     .write = pci_vpb_config_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static int pci_vpb_map_irq(PCIDevice *d, int irq_num)
-- 
2.23.0

