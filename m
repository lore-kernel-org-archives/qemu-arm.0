Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp954017wrs;
        Fri, 23 Aug 2019 12:10:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMMq4Q0AW28oRLwcSrA/9r9uep5pQXPO0vas8KHKs1rbmwNb5yrbXNQIv+IftBEh588f1R
X-Received: by 2002:a0c:93ba:: with SMTP id f55mr5368312qvf.14.1566587409132;
        Fri, 23 Aug 2019 12:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566587409; cv=none;
        d=google.com; s=arc-20160816;
        b=jjVBNwKClLXFH+hAyQ5+2e1Atam9AM3QgPQh4FwK7hh7pCL2uC8PEXFjqQXGSjka/g
         cY0PvelY1ZFl2zoVUYxanwrrPtfic7m/UNDgd7LU9OoiVGUaQIWIbH4T9xCEWIwe5EHl
         PX4EkpMcHVLPuiuUm7D1b2UifVcuLZ0NBCVE0X9ygT/Aek6ke4kA2tdLV583+5es16k/
         KZj8weru8zE3m2lEoFRUAFqStnpTqhC7pWRawceu2C7eqPURTum4s7Eih8EPh21oersm
         KpiAnLke8gbzD7fu1TwhctyR3ul40Dku4ap/98b8c7NMGQrnAdH0u4SYJ81rfmu7JeRn
         OaFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XmSWmAt5NsxNuhEOmkAkRBRrG1PZNe7Ylontg4d682A=;
        b=pwh24RZuRCdk1QeiVsxKEJNZf2UgGgwTJxLThSy1fdfz8FmTvtnLdobDErWBEfZl6Q
         84u2PPtwFwwmr0IMkX/6dQH9KuJwFyPJSQFItInnw7p93OhnDtaykxUfb4eRGw9JnAmh
         bL1R+sCxsRHWmpA62Et7wve63PJA7QFO6H5O8aKoiyVpbNo27hLHK/kEprxqeqgYI/9R
         K3AFVzgCgsxdS2F9SJ2iFlUxsHcnKHipyVz2aoBrsDK0i1egH6/h9kQrpt5sdN1eUHmf
         zNNjjGoz8Jk6ZU3Y5sl8Ql6Zkszl22Wd6/2QmRlbzVIcgQmdZIcTVVLrzBSFShiuv5eV
         P0KA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z57si2579987qtb.400.2019.08.23.12.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:33106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Ewq-0002Mw-DA
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42905)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Egp-0002ou-L1
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Ego-00037b-Kv
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:35 -0400
Received: from nsstlmta09p.bpe.bigpond.com ([203.38.21.9]:38158)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1Ego-00036H-1Y; Fri, 23 Aug 2019 14:53:34 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep09p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185329.BCAA7749.nsstlfep09p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:29 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeosggrlhhrohhgghesghhmrghilhdrtghomheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C188D; Sat, 24 Aug 2019 04:53:29 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:27 +1000
Message-Id: <985f1f2ff3f9359b12b0df2368d3712c865f6c53.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.9
Subject: [Qemu-devel] [RFC PATCH 06/17] hw/gpio: Declare device little or
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3nezenRYagYD

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
 hw/gpio/pl061.c  | 2 +-
 hw/gpio/zaurus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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

