Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp593402lfc;
        Tue, 19 Nov 2019 06:19:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwE5EQUO4upCq8sLYT2+HsyfxxN7myisLgBpea67iqjMGZOCGXcvugW/jfs7+9SO/HfhcoD
X-Received: by 2002:adf:d844:: with SMTP id k4mr36066487wrl.333.1574173184633;
        Tue, 19 Nov 2019 06:19:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574173184; cv=none;
        d=google.com; s=arc-20160816;
        b=m57BuGIPmWut9abzUmXynSykmL3ByXUBrQkYsqi8zJ3UsS23fe9k3k8t9CJxeUMaCP
         iPe1FOZ0xSwZvoGqMY87qKhxP9XTA5CynItAncKKGCr4bqoQCHfQc/PReeLFPKLOthF7
         OG80MJw1/ewXG+IwwS1EEcSDI/K7chUzO4mklzUf5RXu7MpvGNAYjZ470LTBN+TA+Qvx
         g6u/VCfFnhA5NCktmGCdqv58LmMVVT1AYO3cyO9IZBxzUk6v3hq2dWFxwLxSHslj4eGU
         JqL9Ez5UWcuOjywisOQ13fjK08rirYLkG8DQyqblmC59e0POemlPrn+YCCmZzvP1U2gi
         8J6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=8P73ze7N4Pi5N3wmta86sSNy6WA3axgABJEn0aIhePM=;
        b=uQHMxFWaZ66Y8feH+tiln24t5pSBmsF5LQUlZfkxXfdNuZKqgdyGljNLazOuOiZqn5
         awygClYiILyU7Y2qSLBRzwWilajRBA7+gkDC06tmnLsF2I0SqbDkhDsjj4ld1fE2YNGg
         srv+j2/8SeRCQ+Lnm0Tdei75pApZbFo78ZBOUw382JhLEdCPJvUlEkSYTTgiEi+/aMUv
         Eb/wtGY1xthtimysNB2KpZGFm0nK1XzfabBG0SuXPVoHP7ig02eB30NTeD3C9owtkYGA
         3Q/JCwLDTbBZi9i7j9NJ9cqcLJ74y+lISe6MP/Aa9cGekVFVFN/j9xowNf8844x/PKBY
         YKQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si16368872eda.433.2019.11.19.06.19.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:19:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4M2-0004kO-SC
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42135)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4GR-0007A1-Kt
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4GP-0005eE-TX
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:13:55 -0500
Received: from 3.mo7.mail-out.ovh.net ([46.105.34.113]:40841)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4GP-0005di-NS
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:13:53 -0500
Received: from player795.ha.ovh.net (unknown [10.108.42.215])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id 3CDCF13A7EA
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 15:13:52 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 55397C18AD62;
 Tue, 19 Nov 2019 14:13:44 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 11/17] aspeed/smc: Do not map disabled segment on the AST2600
Date: Tue, 19 Nov 2019 15:12:05 +0100
Message-Id: <20191119141211.25716-12-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17915319318968896273
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeef
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.34.113
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
X-TUID: M4BJYhV5xMAg

The segments can be disabled on the AST2600 (zero register value).
CS0 is open by default but not the other CS. This is closing the
access to the flash device in user mode and forbids scanning.

In the model, check the segment size and disable the associated region
when the value is zero.

Fixes: bcaa8ddd081c ("aspeed/smc: Add AST2600 support")
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
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

