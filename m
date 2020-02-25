Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1040139lfg;
        Mon, 24 Feb 2020 18:13:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxbA9YISI3++gqqgUstlY3Q6EOdKLAqoYP4RlHOOWFaD5UYmgAt1xMWKI2vg38CoF+TWU1F
X-Received: by 2002:a05:6214:a91:: with SMTP id ev17mr46362032qvb.112.1582596796351;
        Mon, 24 Feb 2020 18:13:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582596796; cv=none;
        d=google.com; s=arc-20160816;
        b=fTyc208n0O2ythdf3KSyS5VNZ67JWJk8yETwss/5x334PghGPJBNaUOgER+gLCG87R
         SnadlowNLITOsVqq6uWcVeecVqvz/1lPhyMASdzP7YWTLVpsAAoUM7+HV52E7/XpNaHq
         fm6tHNNuWvJ5+piDpsT+9PC4aiVrIGnuKte2mYNxulOrJ7B3L0JUJz/EU/+NIVMCLpRy
         UfEKBovYTs+eU0EiIhJOKrdeQsHfjw65ls0voKEt6M8oT0sOwjg7gG1ntFXNeFRPPMeP
         pkNW/LLxcgetvOzkxTwin3lCsX7gUb9wrHSXx8Pe5xPa6550CergcLWtWAjux8WR0Y4S
         6nDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=wRhkDY3Z+604E1/cXrtUCBuLtTDYv6Kq4isvMfufdS8=;
        b=Q1UXqwvQlU3xMjw7d2XR9yw44lcr8cFdNQ77XT710jvb4m6zzFBwck2bwO6/CrmdKX
         qMa8bT7ZZ+hCq7M3Zp6eq70Q85GW4KyCcM2bRN1vFGIgbWyFKauAqUATIrSHXr5a/R2m
         ltcF4syArOTLOAQ7njL1ZuY4jCP3ToEUntVXTWuMxo7zLMLrIvvUT2JhJlCqwootG1sb
         wocQL3K7MTsHS0oq90uRSAR4o+MfycgTXkizh07HnJQuL8E3Ol5Rk8ebFvsnpk0P0zR9
         irojRxS3up0GMlo3uAFJy/WH2DvVHJOjhVChqs3LI1SBxgtRmmZ/r9PjyhslARSdTypL
         jopw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch20si6127954qvb.166.2020.02.24.18.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 18:13:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Pil-0003J2-QS
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 21:13:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38519)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgP-0006uu-GF
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgO-00089H-4T
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 21:10:49 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3248 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgN-00085t-N9; Mon, 24 Feb 2020 21:10:48 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C36695B1E644EC59BFDE;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:33 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 09/13] dma/xlnx-zdma: Remove redundant statement in
 zdma_write_dst()
Date: Tue, 25 Feb 2020 10:09:33 +0800
Message-ID: <20200225020937.25028-10-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
References: <20200225020937.25028-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.191
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ogDYQPKMxfWQ

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/dma/xlnx-zdma.c:399:13: warning: Value stored to 'dst_type' is never read
            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
            ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/dma/xlnx-zdma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 8fb83f5b07..45355c5d59 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -396,8 +396,6 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
             zdma_load_descriptor(s, next, &s->dsc_dst);
             dst_size = FIELD_EX32(s->dsc_dst.words[2], ZDMA_CH_DST_DSCR_WORD2,
                                   SIZE);
-            dst_type = FIELD_EX32(s->dsc_dst.words[3], ZDMA_CH_DST_DSCR_WORD3,
-                                  TYPE);
         }
 
         /* Match what hardware does by ignoring the dst_size and only using
-- 
2.23.0


