Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1051411lfp;
        Fri, 24 Jan 2020 13:00:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqwIGO9MEben9J+N3XExBeeH7IzSMAJICYAAZeoctAxME/Ayj+i1KVl92LnS597ZGRYuv7hd
X-Received: by 2002:a37:6313:: with SMTP id x19mr4625859qkb.443.1579899617342;
        Fri, 24 Jan 2020 13:00:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579899617; cv=none;
        d=google.com; s=arc-20160816;
        b=U40ldlOUl1RwLpKKw+xRtAg+YZdVSwIQc6YTuqN8E93zK1zuLE5cBJkXksK0OSDCuC
         O1QJanpte+rqpdTWnfh39EwUCSukXYbMoiPMvYTzuzWC4itoRgJTducPzxwjKbIAaTxB
         gsyNIwOJUgJRA+pIS/zOIdprT308xnVJh86tKMhv87dG64MOyuT9p5zZrVKRrLX8qboB
         AI9bYBQ43LDxB4zCMwtsBmyjvLnILAQBJL7CFgEN0t1gkRB2JN/bMZfkgqKrrF3W+VQ5
         oY3DIGWwmK65gB43Z1Hzs+pgHZC7tJLSaHl18s4P+1T0rl5uZjsF563sE9+03FyEaQVl
         3rGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:feedback-id
         :dkim-signature;
        bh=nvLSajf7VeF8a/esJ1gtMK1lnzR41dh9lcqpXL8on/w=;
        b=EPee744x8AOpZGoLpU3gYsObZ9i4Xz09p0q4b8tQquLd6QOjL5ve6vQ2wY4e3B+CsD
         bJj4dAYk95xpOlIMGstJFP9AJEG6/+sL/I5J0NCIaEhG72ykFfjNs/20hx3bMlD5D1qO
         hfEnd4vtBEdMbJZTnJKAHTK4Frekxewfmqun69odVrKivIN7id97dpcBtlH4Af7/nuwb
         TULhkYBr0Tjk/+me1twZB2iCSSqtJhLy14m9DkW1yiXyaZdIA/7W05UhD8+ISrO1vwom
         tbFM07nmCKuwzu+cKFDbL3rUA7C1b76CiKGmCCneSQwleaHi6utr6pb/TvbiX1T99YMc
         Acpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=eT1I9sn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si4950978qvk.69.2020.01.24.13.00.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2020 13:00:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=eT1I9sn5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iv63s-0000LC-Nf
	for alex.bennee@linaro.org; Fri, 24 Jan 2020 16:00:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rsta2@o2online.de>) id 1iv4oX-0000hr-Ir
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 14:40:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rsta2@o2online.de>) id 1iv4oW-0007DI-Cq
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 14:40:21 -0500
Received: from mail1435c50.megamailservers.eu ([91.136.14.35]:47996
 helo=mail263c50.megamailservers.eu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rsta2@o2online.de>)
 id 1iv4oV-0007BJ-Ly; Fri, 24 Jan 2020 14:40:20 -0500
X-Authenticated-User: 017626146082@o2online.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1579888529;
 bh=msyG0+vgYVYZwtyOlvLTdyb7wfWrEyYcTNuAHZIeYUw=;
 h=From:To:Cc:Subject:Date:From;
 b=eT1I9sn5WbSdZ1/3B7nj+TUuJIwzNnC12NXg/fcKIMIn/UqnlZ5OAoexvzKOSIJsf
 OBu3CMrh5xEkhMpasm043sAUhpw1lGxFhWVpXztigEOMepV7SBtuv5nk8V/5aWFBxc
 /Kn+zsgwvn8yZJfDGSgAxSqJJhyjfzJoUQYNh8H0=
Feedback-ID: rsta2@o2online.
Received: from desktop2.localnet (178-21-1-177.ilmprovider.net [178.21.1.177])
 (authenticated bits=0)
 by mail263c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 00OHtQO8027697
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 24 Jan 2020 17:55:28 +0000
From: Rene Stange <rsta2@o2online.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] bcm2835_dma: Fix TD mode
Date: Fri, 24 Jan 2020 18:55:25 +0100
Message-ID: <5099495.CBsx362VbF@desktop2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CTCH-RefID: str=0001.0A0B0204.5E2B2F91.0003, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=II989TnG c=1 sm=1 tr=0 a=oFQkuSNlBNCQRuITVo1IXg==:117
 a=oFQkuSNlBNCQRuITVo1IXg==:17 a=kj9zAlcOel0A:10 a=KlKTeOmF2TGtJzamOh8A:9
 a=CjuIK1q_8ugA:10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 91.136.14.35
X-Mailman-Approved-At: Fri, 24 Jan 2020 16:00:01 -0500
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fX0Tt24cu2dT

TD (two dimensions) DMA mode did not work, because the xlen variable has
not been re-initialized before each additional ylen run through in
bcm2835_dma_update(). Furthermore ylen has to be increased by one after
reading it from the TXFR_LEN register, because a value of zero has to
result in one run through of the ylen loop. Both issues have been fixed.

Signed-off-by: Rene Stange <rsta2@o2online.de>
---
 hw/dma/bcm2835_dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index 1e458d7fba..0881c9506e 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -54,7 +54,7 @@
 static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
 {
     BCM2835DMAChan *ch = &s->chan[c];
-    uint32_t data, xlen, ylen;
+    uint32_t data, xlen, xlen_td, ylen;
     int16_t dst_stride, src_stride;
 
     if (!(s->enable & (1 << c))) {
@@ -72,13 +72,13 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
 
         if (ch->ti & BCM2708_DMA_TDMODE) {
             /* 2D transfer mode */
-            ylen = (ch->txfr_len >> 16) & 0x3fff;
-            xlen = ch->txfr_len & 0xffff;
+            ylen = ((ch->txfr_len >> 16) & 0x3fff) + 1;
+            xlen_td = xlen = ch->txfr_len & 0xffff;
             dst_stride = ch->stride >> 16;
             src_stride = ch->stride & 0xffff;
         } else {
             ylen = 1;
-            xlen = ch->txfr_len;
+            xlen_td = xlen = ch->txfr_len;
             dst_stride = 0;
             src_stride = 0;
         }
@@ -117,6 +117,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
             if (--ylen != 0) {
                 ch->source_ad += src_stride;
                 ch->dest_ad += dst_stride;
+                xlen = xlen_td;
             }
         }
         ch->cs |= BCM2708_DMA_END;
-- 
2.16.4




