Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp941389wrs;
        Fri, 23 Aug 2019 11:59:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz8jndoPlMuJVs4/qMenpf2e4e8Q6PgOzH48AcbzbC18RabsJysnpei0gFRJ0AW4etf4+Cs
X-Received: by 2002:ac8:76d4:: with SMTP id q20mr5903497qtr.321.1566586751841;
        Fri, 23 Aug 2019 11:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566586751; cv=none;
        d=google.com; s=arc-20160816;
        b=EkB5OacVTtLiK1RFsO8pQslUG25l3miVa4OPDhSlkp8Og8KVOf6NgW5IDXEjML1Bud
         tjT/If7zs7qB2gp3wj1TPV/cBpn3zJbf6ee4Cn/pUvbJwsnOcfY3oOTbrlSdkXRUnf+I
         C7W6INLHgKj3pvWbDs1HOLzFeYBACr0hF9MiuISHJhSJZSR4hwTdxLnCFOS2kHE37rFF
         Hy99KtRjjmvTVIRsZrLyN2g2JmLV4CL0FJz/f54KatvJ1SIYmB+4fBoW/89VqwXfgamk
         GvTEsPnYLz4SeioIerZIT3gU0tW9kvaMfD44v1hW2ztmvMhipVGsYGhIZxxvint0Nhym
         6E8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ZwpBjjtAVzUyhw5PwwQEablZiD5XVk58UOoBP9VKHo4=;
        b=GYdegvAAlWg+EqhkHwJmWdamSk1+uosm8I4guC7i5VPY1JEDlE4mvBFTnK7XEXQfed
         QszgolOWy5OiUGODHKWtlKPetItssTOk3cvzoO1vbbhFdz/f35j7y1i4GcRdXPEHG3ZC
         GNnpUqrM9mY9Agx5jRnzRRoiDxWMhrzQoJGwd5bZIm3TQ4DW6st+9JGcHbgSSkZle+qO
         Mp5pr8/sP7FpSLbCUwleuuJo/eTg/Grq4XPbDLcAlsiTaSTwRPsiMs/OowGD0uAEpnNM
         +N1OCThCek5FIS0NnkTMeTOUq9sM/CAl4ryDdWPPRJIMnNJTJJcbk7kXvJn5SBqYep6Z
         B/6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j127si2648707qkc.213.2019.08.23.11.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 11:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:32962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1EmF-0000Ay-7u
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 14:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Ega-0002Qs-Iw
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EgZ-00032C-Cb
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:53:20 -0400
Received: from nsstlmta04p.bpe.bigpond.com ([203.38.21.4]:45123)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1EgW-0002yQ-BE; Fri, 23 Aug 2019 14:53:16 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep04p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185312.CCSR12428.nsstlfep04p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:12 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeosggrlhhrohhgghesghhmrghilhdrtghomheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgepfe
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3581440CDC42D5; Sat, 24 Aug 2019 04:53:12 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:25 +1000
Message-Id: <647d90b016055eb76ebcca3fa582f7c2809e345f.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.4
Subject: [Qemu-arm] [Qemu-devel] [RFC PATCH 04/17] hw/display: Declare
 device little or big endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iNttWkwmgDIp

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
 hw/display/pl110.c    | 2 +-
 hw/display/tc6393xb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/display/pl110.c b/hw/display/pl110.c
index c2991a28d2..3831505165 100644
--- a/hw/display/pl110.c
+++ b/hw/display/pl110.c
@@ -473,7 +473,7 @@ static void pl110_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl110_ops = {
     .read = pl110_read,
     .write = pl110_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void pl110_mux_ctrl_set(void *opaque, int line, int level)
diff --git a/hw/display/tc6393xb.c b/hw/display/tc6393xb.c
index 49a676d1b0..6a9477a0c7 100644
--- a/hw/display/tc6393xb.c
+++ b/hw/display/tc6393xb.c
@@ -549,7 +549,7 @@ TC6393xbState *tc6393xb_init(MemoryRegion *sysmem, uint32_t base, qemu_irq irq)
     static const MemoryRegionOps tc6393xb_ops = {
         .read = tc6393xb_readb,
         .write = tc6393xb_writeb,
-        .endianness = DEVICE_NATIVE_ENDIAN,
+        .endianness = DEVICE_LITTLE_ENDIAN,
         .impl = {
             .min_access_size = 1,
             .max_access_size = 1,
-- 
2.23.0

