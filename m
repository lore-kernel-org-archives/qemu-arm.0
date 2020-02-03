Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4094013lfp;
        Mon, 3 Feb 2020 07:41:48 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVDwDhrRpjiaHgSPK/TvfilQRUdEwc58W3jb+rhO0l2Rfw0+stiiEXUMP+dOukR6VLGis7
X-Received: by 2002:ac8:387b:: with SMTP id r56mr22804618qtb.364.1580744508170;
        Mon, 03 Feb 2020 07:41:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580744508; cv=none;
        d=google.com; s=arc-20160816;
        b=rH2IVk5crRwz8E/+unXreOVuJKjYaPXoDOhNMqz2BV7bCW+8Gvie5EQaGMfEyTzdsj
         ocBsbMcDQFJRn6q8fx2gdG9pwqZ+DISqj689uTqJDtwpr+ceCG6+LxjH7tbepwHUykfX
         O5CqNwy0XyHquQvpakbH0acH+GwqhVleFQDGNpmNDa2mRmdbTk+VVpQgQR1wAdG+rMi+
         4AvJUuYpuvlm7n97PcL7wm6/ezulqdGstHmLva1Xu9Fl0mG55ADBrXm9qc0R4jzcLMi7
         FrN3sj/WUO91rlmrxBCYKCJKQsvEL4e4gQU21nXiAggANk8htELLLlJZveVzh4xhG0aI
         SSNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:feedback-id
         :dkim-signature;
        bh=oAMPe6EwJXWP97X8IUdFD2qrBSjVxikIWIKHz4V6Rjs=;
        b=YIGbN6BCM4i4JpMnZ38XoYHo6qESGWfQ+l6mQ0h7Xct0KxezCEkS1h3f9iD5G406pF
         vrJkBNEiWLkv9PuYthxoSOcjsAVZeeaWDseW3j9/919JSt6hPozlQLhGITudD1/eUhwL
         wTVrF069Zv03umwiUs5fI39uiv/o1+xSwZxoTC4AggtqOlcf3TXe0E3l30awqGD8SbLY
         Uf+/Ticfe8rRAnEkiFveQaRsiibISn1qMwqs/bnMM6cXBggffU21rZJ/Ojg8R58QyPpe
         pb/STFcI/fmpD8WIP6PXH3EhXGfDEi7TdhzzqFhb5E/Kbd4Ntyv7v8Ull4+wvacN1HC4
         XHAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=UoCSsSyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si5522291qto.106.2020.02.03.07.41.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 07:41:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@megamailservers.eu header.s=maildub header.b=UoCSsSyK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iydr9-0001uW-Jj
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 10:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33831)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rsta2@o2online.de>) id 1iydr0-0001u4-CU
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:41:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rsta2@o2online.de>) id 1iydqz-0001yv-Cx
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:41:38 -0500
Received: from mail1435c50.megamailservers.eu ([91.136.14.35]:41358
 helo=mail263c50.megamailservers.eu)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <rsta2@o2online.de>)
 id 1iydqy-0001tq-Oo; Mon, 03 Feb 2020 10:41:37 -0500
X-Authenticated-User: 017626146082@o2online.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megamailservers.eu;
 s=maildub; t=1580744486;
 bh=QTJef+DzqUhDQ+nd29Yk4LBl/lJkvW8jGVKtJ4KgJw8=;
 h=From:To:Cc:Subject:Date:From;
 b=UoCSsSyKTUZ69FPe+l4xzJJro60ZphU1YdcJn/kh8lAts3iwLqazwT/DdFOY3bE8U
 1tY83Zc/b07BEQUfZtE1aHsD5PILcE7ncDHQu0cJ22LQaMW9L5Dll9R9YnWOq43m/A
 hkbeT4+f7a1scNcKKBJ+BR2OfZfNINnJoNMNtWMs=
Feedback-ID: rsta2@o2online.
Received: from desktop2.localnet (178-21-1-177.ilmprovider.net [178.21.1.177])
 (authenticated bits=0)
 by mail263c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id 013FfOWF024492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 3 Feb 2020 15:41:25 +0000
From: Rene Stange <rsta2@o2online.de>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Subject: [PATCH v2 1/2] bcm2835_dma: Fix the ylen loop in TD mode
Date: Mon, 03 Feb 2020 16:40:29 +0100
Message-ID: <11456775.FKKu9GnblS@desktop2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CTCH-RefID: str=0001.0A0B020F.5E383F26.0008, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
X-CTCH-VOD: Unknown
X-CTCH-Spam: Unknown
X-CTCH-Score: 0.000
X-CTCH-Rules: 
X-CTCH-Flags: 0
X-CTCH-ScoreCust: 0.000
X-CSC: 0
X-CHA: v=2.3 cv=II989TnG c=1 sm=1 tr=0 a=oFQkuSNlBNCQRuITVo1IXg==:117
 a=oFQkuSNlBNCQRuITVo1IXg==:17 a=kj9zAlcOel0A:10 a=SOEOR7H8F5O26m7KmmIA:9
 a=CjuIK1q_8ugA:10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic]
X-Received-From: 91.136.14.35
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
X-TUID: lCV6ePtgNX03

In TD (two dimensions) DMA mode ylen has to be increased by one after
reading it from the TXFR_LEN register, because a value of zero has to
result in one run through of the ylen loop. This has been tested on a
real Raspberry Pi 3 Model B+. In the previous implementation the ylen
loop was not passed at all for a value of zero.

Signed-off-by: Rene Stange <rsta2@o2online.de>
---
 hw/dma/bcm2835_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
index 1e458d7fba..667d951a6f 100644
--- a/hw/dma/bcm2835_dma.c
+++ b/hw/dma/bcm2835_dma.c
@@ -70,14 +70,14 @@ static void bcm2835_dma_update(BCM2835DMAState *s, unsigned c)
         ch->stride = ldl_le_phys(&s->dma_as, ch->conblk_ad + 16);
         ch->nextconbk = ldl_le_phys(&s->dma_as, ch->conblk_ad + 20);
 
+        ylen = 1;
         if (ch->ti & BCM2708_DMA_TDMODE) {
             /* 2D transfer mode */
-            ylen = (ch->txfr_len >> 16) & 0x3fff;
+            ylen += (ch->txfr_len >> 16) & 0x3fff;
             xlen = ch->txfr_len & 0xffff;
             dst_stride = ch->stride >> 16;
             src_stride = ch->stride & 0xffff;
         } else {
-            ylen = 1;
             xlen = ch->txfr_len;
             dst_stride = 0;
             src_stride = 0;
-- 
2.16.4




