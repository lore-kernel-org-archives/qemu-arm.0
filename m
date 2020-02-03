Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4219489lfp;
        Mon, 3 Feb 2020 09:41:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQ7CFKjkd7+8bXVhh42CxUXZkxTtP6+IGoqMcJjLLVudC7AopGWVQ4gRCoVWWu+Ox4nfKB
X-Received: by 2002:ac8:47cc:: with SMTP id d12mr24997586qtr.246.1580751702643;
        Mon, 03 Feb 2020 09:41:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580751702; cv=none;
        d=google.com; s=arc-20160816;
        b=WNkoASQkdOtAUPrg+ZVmsX/YJahZkZuLBg+TPUbt/T74HQX0Wago5eRztGRQ7Dr/OM
         /+HuStB3vGFv3cUUAI0y6uIcVQ0iwkI9TtGK4S624iaXPDJmLEuMFYAgTCBOCIBkk5H/
         /6d2jcXSEYXFw1bl87epTvJrRh7GOoP6tmjkoujxuGYfbsM0NScpBxarsYXGT2SBODcP
         r6+JlHfO8w17a2Jzaf/dZyxj/+97p8vRfs4r3sO9H6eHrgMRxPPiE30XpXvFUFwqD8NE
         btsfaHyD9hWkmeyTer35bo8ok8xsXpwMMHbhCiq2V+qolUeYqqwzUinYjFalf4vY60tz
         uTvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:feedback-id
         :dkim-signature;
        bh=NiQKch3/J7yaQWPbsIDOChznfiRjNOolVr7oNZTnFYw=;
        b=pbQE/dDvXOp//fSlJcKMzttKRDE1sfRZYc2JIeGjx12dNu8Pyvf53mQm05GrvGORH+
         0Ia+shQ6NsQXobW2YYCKrBNe76/1Cp4zWpzY3nmDrvuUn07TwQlCMOz/VaowkdTeOW0c
         t/xecEU5dm1oLdapS5kzgwwF1vjD8rdFQav8L0Wnjx1lKVmphyqHDVVZLJklBIVJPJ5G
         zenWKmQSCekP7Z/Suw6NfTFnEalmomBMhemnarhBWl+mI1R69HL0pBxF4Sk2w+QsAjv8
         9duQi3omthLXp2e7pW53twPSApP5bS2LuJYaxumgTCkFxIiKuMHcdot487My7/gXCWMM
         F08Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=g+vyjUW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si12427371qth.311.2020.02.03.09.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 09:41:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=g+vyjUW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyfjC-0002Jd-1C
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 12:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rsta2@o2online.de>) id 1iyfj1-0002JV-7e
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 12:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rsta2@o2online.de>) id 1iyfj0-00037X-3b
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 12:41:31 -0500
Received: from mail1454c50.megamailservers.eu ([91.136.14.54]:52974
 helo=mail266c50.megamailservers.eu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rsta2@o2online.de>)
 id 1iyfiz-0002vb-Cm; Mon, 03 Feb 2020 12:41:30 -0500
X-Authenticated-User: 017626146082@o2online.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1580744483;
 bh=UEdoKkBekSSPy6Qva+zTYSGw/Rf/PxDmGz4nNClJIFw=;
 h=From:To:Cc:Subject:Date:From;
 b=g+vyjUW3mtpmUo7qWoMTJkoXtilP06Y4BQASpVpatLAQRs/rwHKcr+BITr4d4Vqxg
 pVSZBhaU7EgQwvWvtI2Smg4p1pZuXOR3LtWBODobZ+zbFu3hWOe88/LLOgNqWyZMrJ
 s7MjQusGqd/zgbsCYqzZMF+hxoPxZUClHLwHNO5A=
Feedback-ID: rsta2@o2online.
Received: from desktop2.localnet (178-21-1-177.ilmprovider.net [178.21.1.177])
 (authenticated bits=0)
 by mail266c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 013FfLPU022990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 Feb 2020 15:41:23 +0000
From: Rene Stange <rsta2@o2online.de>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: [PATCH v2 2/2] bcm2835_dma: Re-initialize xlen in TD mode
Date: Mon, 03 Feb 2020 16:40:51 +0100
Message-ID: <5397138.k0qeMALlIp@desktop2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CTCH-RefID: str=0001.0A0B0201.5E383F23.0053, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=PNJxBsiC c=1 sm=1 tr=0 a=oFQkuSNlBNCQRuITVo1IXg==:117
 a=oFQkuSNlBNCQRuITVo1IXg==:17 a=kj9zAlcOel0A:10 a=SvY40l2xVmRt99U1V6QA:9
 a=CjuIK1q_8ugA:10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 91.136.14.54
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c3ebGituxNTk

TD (two dimensions) DMA mode did not work, because the xlen variable
has not been re-initialized before each additional ylen run through
in bcm2835_dma_update(), which has been fixed.

Signed-off-by: Rene Stange <rsta2@o2online.de>
---
 hw/dma/bcm2835_dma.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index 667d951a6f..ccff5ed55b 100644
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
@@ -82,6 +82,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
             dst_stride = 0;
             src_stride = 0;
         }
+        xlen_td = xlen;
 
         while (ylen != 0) {
             /* Normal transfer mode */
@@ -117,6 +118,7 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
             if (--ylen != 0) {
                 ch->source_ad += src_stride;
                 ch->dest_ad += dst_stride;
+                xlen = xlen_td;
             }
         }
         ch->cs |= BCM2708_DMA_END;
-- 
2.16.4




