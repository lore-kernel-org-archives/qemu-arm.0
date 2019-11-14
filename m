Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5244180wrr;
        Thu, 14 Nov 2019 01:49:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJSInJL0EDYIxBtOG/OA0LP4nRDmMc+4s8foS3aa79BaNQh5QPGocHlIQzEsg0SKUu52ZR
X-Received: by 2002:a17:906:3606:: with SMTP id q6mr7192637ejb.307.1573724975851;
        Thu, 14 Nov 2019 01:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573724975; cv=none;
        d=google.com; s=arc-20160816;
        b=c9Ii4Ol2Cg/vBTfinDKx6TKJRWAYmxX2GBCMUyuugn7k8XtoSx7B4IR37qj43mWh97
         A11n938C1IsqenW8Juz4/m1fIbagfdzV+a+e+38VNU+Gl8PZEhuq6L2XCNEaV1uc+Fwc
         Xb2u2gBNpe718kCQfGQr6UW1fAXF5V/vhkR5CSLrKtUTwsD6u4qDMMpmzXbslf/b+BSA
         g92el3yparvtaIKDAohYrbDhezVPMBiuCyWT90GbVYdNyhEVWw9svOUszxRDk3lh7FWl
         1TShZDjI3KQF3xHKqK8/BZjHSYtUI8HozfWbPaasOU7a3u21VXPapccudxeaC3kuf9gN
         kqGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=+ty8wry/giU28BptEXJKa0kxQTaGNSuJLoYqArs1qbo=;
        b=zbH4L2SGPuM7fPG92FD0QoRWF0234JwL/93R+gJhmY2vxIe1vyN1atZZJlXgDHd/bv
         5UaHoc04cBo0m2Lv96goXxYxns/my2Mi9j6VpYMsvQJx3ItV9cotZsLL/dlOmpTe9WNA
         M29nSOEDzKWtF0aid99zlOUhWEYihGzZZN5PKx+IVD2U3xTsIxg3lxfWeRtHU6suLxHq
         bLdZqhPPLmuttFJIKXcrGwYMAaeJ8ZPMyLCONLSumM3iqeNOOJ84qoZZ/+/06pbsiolf
         Ug1KFgrnS+hHXvlarVG5h1K7xWoUMSBKi/cpaXiD+GSxzFOBL+4IaiUY/iTMrYSoQftf
         kcgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rl7si3011701ejb.340.2019.11.14.01.49.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 01:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVBks-0001cR-9J
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 04:49:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iVBhg-0007ie-EU
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iVBhe-0004Oj-AF
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:15 -0500
Received: from 6.mo178.mail-out.ovh.net ([46.105.53.132]:50092)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iVBhe-0004O7-4s
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 04:46:14 -0500
Received: from player737.ha.ovh.net (unknown [10.108.57.141])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 5F8F481A78
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 10:46:12 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player737.ha.ovh.net (Postfix) with ESMTPSA id 680DF2A7842D;
 Thu, 14 Nov 2019 09:46:05 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/5] aspeed/smc: Do not map disabled segment on the AST2600
Date: Thu, 14 Nov 2019 10:45:41 +0100
Message-Id: <20191114094544.30114-3-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114094544.30114-1-clg@kaod.org>
References: <20191114094544.30114-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 2478105698616970001
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeejrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedu
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.53.132
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QzOVzuiNTbaI

The segments can be disabled on the AST2600 (zero register value).
CS0 is open by default but not the other CS. This is closing the
access to the flash device in user mode and forbids scanning.

In the model, check the segment size and disable the associated region
when the value is zero.

Fixes: bcaa8ddd081c ("aspeed/smc: Add AST2600 support")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 955ec21852ac..86cadbe4cc00 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -444,8 +444,13 @@ static void aspeed_2600_smc_reg_to_segment(const Asp=
eedSMCState *s,
     uint32_t start_offset =3D (reg << 16) & AST2600_SEG_ADDR_MASK;
     uint32_t end_offset =3D reg & AST2600_SEG_ADDR_MASK;
=20
-    seg->addr =3D s->ctrl->flash_window_base + start_offset;
-    seg->size =3D end_offset + MiB - start_offset;
+    if (reg) {
+        seg->addr =3D s->ctrl->flash_window_base + start_offset;
+        seg->size =3D end_offset + MiB - start_offset;
+    } else {
+        seg->addr =3D s->ctrl->flash_window_base;
+        seg->size =3D 0;
+    }
 }
=20
 static bool aspeed_smc_flash_overlap(const AspeedSMCState *s,
@@ -486,7 +491,7 @@ static void aspeed_smc_flash_set_segment_region(Aspee=
dSMCState *s, int cs,
     memory_region_transaction_begin();
     memory_region_set_size(&fl->mmio, seg.size);
     memory_region_set_address(&fl->mmio, seg.addr - s->ctrl->flash_windo=
w_base);
-    memory_region_set_enabled(&fl->mmio, true);
+    memory_region_set_enabled(&fl->mmio, !!seg.size);
     memory_region_transaction_commit();
=20
     s->regs[R_SEG_ADDR0 + cs] =3D regval;
@@ -526,8 +531,9 @@ static void aspeed_smc_flash_set_segment(AspeedSMCSta=
te *s, int cs,
     }
=20
     /* Keep the segment in the overall flash window */
-    if (seg.addr + seg.size <=3D s->ctrl->flash_window_base ||
-        seg.addr > s->ctrl->flash_window_base + s->ctrl->flash_window_si=
ze) {
+    if (seg.size &&
+        (seg.addr + seg.size <=3D s->ctrl->flash_window_base ||
+         seg.addr > s->ctrl->flash_window_base + s->ctrl->flash_window_s=
ize)) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: new segment for CS%d is inva=
lid : "
                       "[ 0x%"HWADDR_PRIx" - 0x%"HWADDR_PRIx" ]\n",
                       s->ctrl->name, cs, seg.addr, seg.addr + seg.size);
--=20
2.21.0

