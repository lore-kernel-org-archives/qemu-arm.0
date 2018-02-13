Received: by 10.28.71.27 with SMTP id u27csp682684wma;
        Mon, 12 Feb 2018 20:25:00 -0800 (PST)
X-Google-Smtp-Source: AH8x225MrQcxnuqYUn2y9kYWJJPWkaAx+3gGVHhThQfuLM4SLbrzswZzmDAcSgG64lP1tQ/40eNQ
X-Received: by 10.129.175.40 with SMTP id n40mr1844799ywh.9.1518495900421;
        Mon, 12 Feb 2018 20:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518495900; cv=none;
        d=google.com; s=arc-20160816;
        b=DV0Tvr2UUt3Honeeb2gK97mOw7nUrowdEUs0nQiCZmMdJnUtzpqXa2FBu9f84civgy
         tP0fvfJ0Ucs++MMWWnrzNvpN5QNLPMPVjylXZDveI2DvPWkDOIJnJXUSr9i8oz2PvvPz
         QCx17tPqApmgMZYK2nJrsbUxJRcFB/+CIvmNLYR9bWLIWg3FCSpsidoTEF6hIES3agYh
         DsOqJ2krZjrIAEkh9S4u+wcGREqDY5JEAjWeSd4hOf8360vdeXq35IigFcMWcqZKH5Yo
         GInRAY0dNzGf4yo4zh9ZJqylVPQZt4ikknhIhDAlCcIBuvns/XioSIBWriWpdiw4xMzN
         9+Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
        b=tY74cAwpxPtTTDErsI1Hx/yXlND516/KrUCltvo2i0n2AR3SaAlWv5vSHCTA65L6hi
         UgQCBR+mvnV6Uq5xOhGJkXBJntp2erzV/f48h2d/4xYPBmGOI5YuUXrR/kIZP5vaqSqv
         8OOwwNaNMCDOzAdlJQ4lXL6IhztsVFPadqkqGSxFp9wCYw1+y9hhDd4fro0MyB2ER1u/
         EN55mSFFhcKRzjr9beyM7CwOSBvUXMRtF/Bk+2K0wqxu7bBewWzcCtf33KjRUhE90TtR
         yNzGhzMjoafUvgaIpQ1/KiqsuJs6sAbNd9H/6KrRBWL4hmKT37G8/FgjO5F8xYd3xayj
         hIiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QGlBWJEn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i63si1015953ybb.478.2018.02.12.20.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Feb 2018 20:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QGlBWJEn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37642 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elS9L-0006Cd-QG
	for alex.bennee@linaro.org; Mon, 12 Feb 2018 23:24:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuS-0001dK-Lm
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuR-0008T5-LY
	for qemu-devel@nongnu.org; Mon, 12 Feb 2018 23:09:36 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:40613)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1elRuR-0008Sy-Gs; Mon, 12 Feb 2018 23:09:35 -0500
Received: by mail-qt0-x243.google.com with SMTP id c19so2226797qtm.7;
	Mon, 12 Feb 2018 20:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
	b=QGlBWJEnGwL8fy0Xmb5X5p/FKhy9t8X3g3fob3mnsD2Kgw3XZxD6j5ofFwD05v4+tL
	Cm/EwANaBVIQtWwAjbJVzic47UV6MNbkX5nMzcSQLscE9ILYPGkPJQR5TaWsYZgAOeT7
	gfrXeT7kIQ4rp3AAQIdif58TaVbHnFZYso8zZ9snJGoY0KTJKD6GqFRQ3tODw/exHAxW
	sgA+4//xyAg9kPnSMlXGEFYTBu/RqMZjaEPyFujSOoNeTCjKCER/+j97Zuk5BUchE34D
	WOIrQAUpRb6vNZ+GzCs/0kRw/mG+0gJ58RNQxtazrjimci+5lGxu005mnQ/jKUYmZm0p
	U5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fXbDYPKBtb1ob/8HMTylq1noEaiAiTKM5rsfys7N0tc=;
	b=cJlcDVqgDHb2ZO0uvKf4ot4IJhYHrIj1ZoUEkFDNdrbp0qUu7Vov51t44TVqdQbQJy
	w9uIkwlTbIZo0sjrqIgOYWEXqA5K4SdoToMWW2aif2ZJnyCYzrCPr07kScB2ic0s4zGR
	EGPHaBzqrEhjYGEEGHmBL2mk7fHYTBC4lYeZaShXPv1Y5wIdzP0hPkKLFPHPHcrt8D9G
	+/sRXNaVQy2k/68aRdEJZafsO81t4BrfCKI+LAqni7FPk+HjRmUg0s9VKAAZcBZCdPPW
	rXjN1zyEewxMAeahvYQ++nAJejXCHWyNcQh/fx6lyQm86cuwkIR+AuG7o/w3Owtf970K
	bmbw==
X-Gm-Message-State: APf1xPBZalKIHrxtmIClI5zAnIkglmEYMXipzCggFbl896/rfDy6W+o/
	PPfokbFTkJVts0RoqgOWr90=
X-Received: by 10.200.36.130 with SMTP id s2mr21747664qts.0.1518494975170;
	Mon, 12 Feb 2018 20:09:35 -0800 (PST)
Received: from x1.local ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id q2sm7350435qki.10.2018.02.12.20.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Feb 2018 20:09:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 13 Feb 2018 01:08:03 -0300
Message-Id: <20180213040809.26021-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180213040809.26021-1-f4bug@amsat.org>
References: <20180213040809.26021-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v13 24/30] hw/arm/bcm2835_peripherals: change
 maximum block size to 1kB
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:ARM" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EShXyckJC1i/

following the datasheet.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Alistair Francis <alistair.francis@xilinx.com>
---
 hw/arm/bcm2835_peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index ca971e83e0..13b63970d7 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -19,7 +19,7 @@
 #define BCM2835_VC_PERI_BASE 0x7e000000
 
 /* Capabilities for SD controller: no DMA, high-speed, default clocks etc. */
-#define BCM2835_SDHC_CAPAREG 0x52034b4
+#define BCM2835_SDHC_CAPAREG 0x52134b4
 
 static void bcm2835_peripherals_init(Object *obj)
 {
-- 
2.16.1

