Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp943377wrs;
        Fri, 23 Aug 2019 12:01:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVRAii7mHtkd30PKFfvzSECLbMmoF7nqORwGH14RBVk0kUKFXW5/tP5tmlVUKCbbnUxQsW
X-Received: by 2002:a05:6402:1285:: with SMTP id w5mr6279264edv.36.1566586864726;
        Fri, 23 Aug 2019 12:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566586864; cv=none;
        d=google.com; s=arc-20160816;
        b=z+kAn4LYZv/JwK1jY/WJVR00PIFLaOOblKWBB2Awq5i2DnpI2xy3m5mLBFCatqNFgK
         PBGGu6a8g8GTtUymH7xUtlSP8x8WPRkZ+NB11T3zuZJONJvMhWB7gRnsxFWG3OWWQAEN
         LkuLFQSVv9GUxX9TUY80+9ScgrdVktd7hOqOcwxurG6KIBBnXHYlq01j4n5KShczBS/o
         tEU7By83fxq/i2MyiGA8PbCqiazrLWTNnR2WglLFRSFcGP98qmLgWi/gQyzsCGTD+6lx
         PfhDGfvjv+dllpB8G2s7041C4CAGgIZDZ4JObMboOYPn7PH0riaGGmJBpDsEL4+0JnZJ
         y4yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XpjRBwpsT7xu199408aRtiG8O4/4bQdME5nxL/BHCQ0=;
        b=H+qogXWE0PBSd/qV7G4LL1MhMCuUCg7Xai4fVdX3Q9TIHZ9fi4mOLDr90qEdpzFLXI
         rqF5TZBWj2JGhFSR1/jImAa7HNhAVZPyVfLwPIn3X+GoCqkdRulOuQaEAam0mSXBws9A
         z08dh+r+MSYbONpOfyolmNZcINx18I69wRHb2C1O4CP/INrS9hZxQBFJPQbSyVHnd+hp
         dZg11pPpSNfP9K5yGP/zXVVSYCACNyQ9SRdwgdcAkq2aL/Z/Rf++aQ/iQLeB1HqVPs88
         d3YyYv9oJohhfhVDMfKq3aOoKZXEr70/kyirOtoch4Eb2CBI78J8NV6dfi2aJgCvirPh
         8xNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g30si2475121eda.439.2019.08.23.12.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Eo2-00022k-Se
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Egv-0002y9-Jv
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:53:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Egu-0003Aq-E1
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:53:41 -0400
Received: from nsstlmta16p.bpe.bigpond.com ([203.38.21.16]:34129)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1Egr-00036q-M9; Fri, 23 Aug 2019 14:53:38 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep16p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185332.XFTI23659.nsstlfep16p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:32 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeouggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruheqpdhrtghpthhtohepoehpvghtvghrrdgthhhusggssehnihgtthgrrdgtohhmrdgruheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhi
 iigvpedt
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C191A; Sat, 24 Aug 2019 04:53:32 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:28 +1000
Message-Id: <90bd564769dbabaa7cf70b08e77170d54fa4b625.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.16
Subject: [Qemu-arm] [Qemu-devel] [RFC PATCH 07/17] hw/i2c: Declare device
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QCuXAF8g0LIR

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
 hw/i2c/imx_i2c.c       | 2 +-
 hw/i2c/mpc_i2c.c       | 2 +-
 hw/i2c/versatile_i2c.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/imx_i2c.c b/hw/i2c/imx_i2c.c
index 30b9aea247..cc2689d967 100644
--- a/hw/i2c/imx_i2c.c
+++ b/hw/i2c/imx_i2c.c
@@ -278,7 +278,7 @@ static const MemoryRegionOps imx_i2c_ops = {
     .write = imx_i2c_write,
     .valid.min_access_size = 1,
     .valid.max_access_size = 2,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription imx_i2c_vmstate = {
diff --git a/hw/i2c/mpc_i2c.c b/hw/i2c/mpc_i2c.c
index 0aa1be3ce7..b71b5ff7d5 100644
--- a/hw/i2c/mpc_i2c.c
+++ b/hw/i2c/mpc_i2c.c
@@ -306,7 +306,7 @@ static const MemoryRegionOps i2c_ops = {
     .read =  mpc_i2c_read,
     .write =  mpc_i2c_write,
     .valid.max_access_size = 1,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static const VMStateDescription mpc_i2c_vmstate = {
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 1ac2a6f59a..c92d3b115c 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -77,7 +77,7 @@ static void versatile_i2c_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps versatile_i2c_ops = {
     .read = versatile_i2c_read,
     .write = versatile_i2c_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void versatile_i2c_init(Object *obj)
-- 
2.23.0

