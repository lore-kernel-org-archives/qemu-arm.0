Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3967025wrs;
        Mon, 26 Aug 2019 07:22:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwq0mJ7R6XP8u/KMK7DYdGbIs6ppM2UfREwCyVmMbgeLtuxCB3v96Ppu6p0vD40Y+1yNVlP
X-Received: by 2002:a05:620a:1113:: with SMTP id o19mr16172049qkk.46.1566829361368;
        Mon, 26 Aug 2019 07:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566829361; cv=none;
        d=google.com; s=arc-20160816;
        b=ba62eiEZLaUr+Pf8BePuiUTROumvsGn2u9dTRjD72IiVZ3bP2NUZdGOFt10vM1eL2G
         ffjqgjhQA0ebCe5oqsDF6Qo89Gq9D0kAHWHeO10heeMLJQQRxfskwkYhxcg6eOX0FK+K
         n130IR3knLFNpxy/Qz/JYmU/4vRwcMdKlWMpzZi8k3wi4YKW6AK98GUFEg7pHlNO+stg
         vXjXDU/0+PFf4aC9g7figa26PwlFispxcsqRHnxyeijzPj6kuiuVVZespKTu4UAJzRRS
         jnk7gVxypBLVp9M3LessxIbfEvaVbfIWbzl+33/w3/5zgCvDYZtfUzPfj3LJ7eNn72dH
         x0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=IqwA75fWongG3QDVM7vU2Y0MTPUXEAP3yWiiDoH7Xrk=;
        b=r3UTLmRbbaOD2Gq/ey91MlDakptLX6XOfm1gaxC60/dY12PWv3v/H+lw4m0JB8pAPr
         419x3U+Nb5MiiBHf5HnGI1gb6X8rbips+7xcHhQRvQIymXSjep1KH9/1ZOxHmZDEI2wt
         gfJDKnqDRhzgSzUH502YzrA6i136fcr/lr7wBRpjHO4yJM9jTwgBha/zLkHZ+5lPSBbI
         BTj8HeR8DlU+X3qdT9YuFVCwPWgQNA0IRMY7U8T3a1SAkJzmFFkDbjC9ChL1Ios3ecx0
         2Ioduy28ERZduP5WBIDK+j8tVLIfFCrovZ+6dPAbpbehL6K2Wvqp6ShGFTLE3TbyxS8s
         bguA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 40si8406422qvt.103.2019.08.26.07.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 07:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2FtI-0006Ue-MO
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 10:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42653)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpb-0004Qw-C0
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpa-0008Ox-0K
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 10:18:51 -0400
Received: from nsstlmta31p.bpe.bigpond.com ([203.38.21.31]:53343)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2FpY-0008K4-Uw; Mon, 26 Aug 2019 10:18:49 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep31p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141842.ITCV30018.nsstlfep31p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:18:42 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghuqedprhgtphhtthhopeeoihdrmhhithhshigrnhhkohesghhmrghilhdrtghomheqpdhrtghpthhtohepoehpvghtvghrrdgthhhusggssehnihgtthgrrdgtohhmrdgruheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqphhptgesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeo
 thhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpedt
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D2D117510588F73; Tue, 27 Aug 2019 00:18:42 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:34 +1000
Message-Id: <8e06140f2ab714c4f9713f2d89287af4cc8ddf12.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.31
Subject: [Qemu-devel] [PATCH 08/19] hw/i2c: Declare device little or big
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RhA4wyoXFh9a

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.

Then, on inspection:
- if ununsed, re-declare as DEVICE_HOST_ENDIAN.
- if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
- if just a bit bucket, re-delcare as DEVICE_HOST_ENDIAN
- if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
- if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
- if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/i2c/exynos4210_i2c.c | 2 +-
 hw/i2c/imx_i2c.c        | 2 +-
 hw/i2c/mpc_i2c.c        | 2 +-
 hw/i2c/versatile_i2c.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/exynos4210_i2c.c b/hw/i2c/exynos4210_i2c.c
index a600f65560..d7e462664a 100644
--- a/hw/i2c/exynos4210_i2c.c
+++ b/hw/i2c/exynos4210_i2c.c
@@ -266,7 +266,7 @@ static void exynos4210_i2c_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps exynos4210_i2c_ops = {
     .read = exynos4210_i2c_read,
     .write = exynos4210_i2c_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static const VMStateDescription exynos4210_i2c_vmstate = {
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

