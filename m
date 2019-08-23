Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp953269wrs;
        Fri, 23 Aug 2019 12:09:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGIAi50VBiUXwBtRGXX9aKtIZJ18xbIaFdDkaRfY2+8g9E4+MBf5fwvkYkKGdSju39QBhn
X-Received: by 2002:ac8:2df8:: with SMTP id q53mr3322126qta.234.1566587364909;
        Fri, 23 Aug 2019 12:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566587364; cv=none;
        d=google.com; s=arc-20160816;
        b=JlivwtOmk5hmUYPPPiYY6+GatTvAWmL5ukZQRQ7H3LA9iicpAfZmbBzIASOfNs84r4
         2AWzI7obaa+3e5lC/uqRv5zOOdbrjXLmNTojoj1lPK5WKaUz8zXmYAJS/rU9J5mxNM/W
         qipRLuVnsff8NWIMrVYUW0vGRY55ihhxZm1rg4dZF3xu+Q/4tmZPpXfCDGxxiCweUqxP
         J+ZizzkETISHfcFfAsz+UTrOs1mLJ7anVURAHg8K5F5AbTTLNyQNnXwWz1IksGZ6+Woa
         BoKUefyYl35xwUXpBLa/eIgyeDP0UBGsOr7evXp3K2vZbb9FJXdMhdCX9izU+/Wjv62E
         HXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=iak6rOT9zj+Wedz99bNahPYXt+qckmenzrnfXGfM5NM=;
        b=ZYL/dS2y4Aum5GWU42QYb8H12iKRTAAbC3b5NMYcQX8AlGHTOkeSulv3Mu/txIVmOp
         BOfJgW36SSrrRoNLC1bR/TLKqwyoKi9mocjasLVCC2gYkWR3KkhogD0oOwDVRqwdaEn6
         FAWIBX+3TgRed5Aa1IO4IwQlvfpe4mrnOOd2VugDqfudaJezySD/FgUyituxwDutRGmX
         aLkbn9n69fO24HYElmXrSp5wulUelo+h7svOU0OnR/obYhZKjztYqXFKDyL56Zn6OwLL
         3y1wQ/sds33x4/sAJXdpBHkytqhz/kwxg630EFT9SBIHiCsipw0JFzhIUwo9Two6q2Gt
         wVHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h21si2499289qkk.106.2019.08.23.12.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:33104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Ew8-0001Ni-3t
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhA-0003NN-Ia
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Eh9-0003Gy-BF
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:56 -0400
Received: from nsstlmta40p.bpe.bigpond.com ([203.38.21.40]:50941)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1Eh8-0003ER-NN; Fri, 23 Aug 2019 14:53:55 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep40p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185349.GQSH32345.nsstlfep40p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:49 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeoghigthesmhhprhgtrdhpkhhurdgvughurdgtnheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgephe
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C1D25; Sat, 24 Aug 2019 04:53:48 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:32 +1000
Message-Id: <094d765fcaa42b40328186129628b188b2b93477.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.40
Subject: [Qemu-devel] [RFC PATCH 11/17] hw/misc: Declare device little or
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fXEqgEziZGGi

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
 hw/misc/a9scu.c    | 2 +-
 hw/misc/applesmc.c | 6 +++---
 hw/misc/arm11scu.c | 2 +-
 hw/misc/arm_l2x0.c | 2 +-
 hw/misc/puv3_pm.c  | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/misc/a9scu.c b/hw/misc/a9scu.c
index 45c91db303..59335ca72f 100644
--- a/hw/misc/a9scu.c
+++ b/hw/misc/a9scu.c
@@ -96,7 +96,7 @@ static void a9_scu_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps a9_scu_ops = {
     .read = a9_scu_read,
     .write = a9_scu_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void a9_scu_reset(DeviceState *dev)
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 24d57e8677..fb39837b7f 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -285,7 +285,7 @@ static void qdev_applesmc_isa_reset(DeviceState *dev)
 static const MemoryRegionOps applesmc_data_io_ops = {
     .write = applesmc_io_data_write,
     .read = applesmc_io_data_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
@@ -295,7 +295,7 @@ static const MemoryRegionOps applesmc_data_io_ops = {
 static const MemoryRegionOps applesmc_cmd_io_ops = {
     .write = applesmc_io_cmd_write,
     .read = applesmc_io_cmd_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
@@ -305,7 +305,7 @@ static const MemoryRegionOps applesmc_cmd_io_ops = {
 static const MemoryRegionOps applesmc_err_io_ops = {
     .write = applesmc_io_err_write,
     .read = applesmc_io_err_read,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
         .min_access_size = 1,
         .max_access_size = 1,
diff --git a/hw/misc/arm11scu.c b/hw/misc/arm11scu.c
index 3023284d6f..dd690dc985 100644
--- a/hw/misc/arm11scu.c
+++ b/hw/misc/arm11scu.c
@@ -58,7 +58,7 @@ static void mpcore_scu_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps mpcore_scu_ops = {
     .read = mpcore_scu_read,
     .write = mpcore_scu_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void arm11_scu_realize(DeviceState *dev, Error **errp)
diff --git a/hw/misc/arm_l2x0.c b/hw/misc/arm_l2x0.c
index af2c7af4a0..cd1747b7a1 100644
--- a/hw/misc/arm_l2x0.c
+++ b/hw/misc/arm_l2x0.c
@@ -159,7 +159,7 @@ static void l2x0_priv_reset(DeviceState *dev)
 static const MemoryRegionOps l2x0_mem_ops = {
     .read = l2x0_priv_read,
     .write = l2x0_priv_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
  };
 
 static void l2x0_priv_init(Object *obj)
diff --git a/hw/misc/puv3_pm.c b/hw/misc/puv3_pm.c
index c213500d9c..b04950ecb9 100644
--- a/hw/misc/puv3_pm.c
+++ b/hw/misc/puv3_pm.c
@@ -117,7 +117,7 @@ static const MemoryRegionOps puv3_pm_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void puv3_pm_realize(DeviceState *dev, Error **errp)
-- 
2.23.0

