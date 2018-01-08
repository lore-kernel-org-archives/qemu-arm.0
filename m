Received: by 10.28.173.206 with SMTP id w197csp2626984wme;
        Mon, 8 Jan 2018 08:00:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBoviWpkGd4c5xh5TiGJciah3j7O9NEXzSN37X9WLEB8VroSiwDL98SbweHwkfnUiFt20R9mC
X-Received: by 10.129.76.198 with SMTP id z189mr11082336ywa.129.1515427233841;
        Mon, 08 Jan 2018 08:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427233; cv=none;
        d=google.com; s=arc-20160816;
        b=RfwjRU3TLGSMRYYEGjj56hXOcI213uQ5XkD1LQhbWOzYSQl08NDjW7mfYN0a2gPRUr
         f7NPLtguNMUXXHdmcC1dT6PplD/RXwTwiY9unZcZ80ayJ1liJoxLKRiqy5gd9WRTGyay
         Xou9MjXqTliiUZi4Yh89E7dTkkEHY3WGOUkSwdavvPV0xoZZZEgve5UPTRjExtQNErKT
         4iUREm5sd13uszLkb9Sbepe/x+cqw0Js0Fss4fHkgX2wZ7Yvys+FzMLQ8/mk0ruT/UW4
         ixvZbXMNIkAcPUp1WDxa68PTyATJ+8Ttvv2ZjVSkswyZRZJAYNPbgPDqw6eDiOjMZi4D
         Jqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=xXf1UFbqOcyp/TRXmWa1zv1Yy+jpEBavi3Wi39hKZGs=;
        b=PTtgBOAig27aJrO9W7PoBoU+MrgRyKKb8Gy5sPICwskDb5gurBKJBtbnnzyFuvph39
         9nIcFZa6TWCFoWVPxg4fu0UnhCnNhyVsxpKdlRDHFxSucMR5chu7bCVSraqNzW0JtmJf
         LP7+2/WxcjAMffFgRBbhpkJS1VGYbaQk9+22tBA3faskJFayvC10amuzEuWdGw6432dh
         4Tz/EGoo+2N2rZDJYoVTttJUQEt5e22PwechBxo+yP5WAs4MYzm82Yko8CdvBgBCG/nu
         kVdlIC2K4a2BkEJ7/oXyGS0jDXEZIVEC/ZQlV7CdRdGSzZOlSWMhn3AVItnhoZR3BeOV
         Pg+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YG2eXpm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d136si2572234ybc.663.2018.01.08.08.00.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 08:00:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YG2eXpm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41410 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZqj-0008Cp-5S
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 11:00:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcI-00037G-UZ
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:45:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcH-0000FP-UQ
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 10:45:38 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37100)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZcF-0000Cu-HO; Mon, 08 Jan 2018 10:45:35 -0500
Received: by mail-qt0-x242.google.com with SMTP id f2so14083958qtj.4;
	Mon, 08 Jan 2018 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xXf1UFbqOcyp/TRXmWa1zv1Yy+jpEBavi3Wi39hKZGs=;
	b=YG2eXpm7p1MAigRAQSmspvEBz2jsUXCJqhsib/NsZC5xL4iCrVYcN64MJLvZ/8XBBU
	GYCx1YdemivR8VVtxZkSwlyFnB7HQs3YmBW38YcB+E77pIVFYp4QZs5Fom1cgjH4caWu
	HJCNAR405Gts9LZ9UGuUUd59x72fruV3McDnga8ANX+IF0vtuUbvq6lqBLiQimvM/ECI
	DXTfZlHXuOW+lf+zRNpFuoWbF7cJANIHv7RSJxpZy8lL0ZvduuLcHWqbNl4zI7VuLeUm
	w+PaxpdSnBaJUdwhzeWdQxlpRIg99qR/maIk0XLBF0YOdQO77apeSFBssBszye8w/k3A
	oSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xXf1UFbqOcyp/TRXmWa1zv1Yy+jpEBavi3Wi39hKZGs=;
	b=VRD0ki5LdBvpt/kGtREGhtydmuEIvRLLcbSlcb3MDTfDhTEKNPP52nvLPxJio9EKl4
	l9tK85+a8a4kqWpNg45d8xEQr3HByawXcPEt6g34nsLvMmURbBqRDD30UcFI2ocrXLGW
	Lt0LvrXDI3sHTQiM9D1PB73oVCoXEz5l/nf8VNYPbmoLTPHZfCp/y1XLjgPm7kLLBWLn
	6RqZlOWBCA1fJk7M8mU+98nkiaecHxZi08c1Z97QA7DbxVbcQB0AJPfZmbtlcn0YxMoG
	b/3XXwoNhRQY489S+NoJrTE9s15Xy3C9T/Wq5Pne/w8Ou6+Q0+x969qebX4qBWgomsiZ
	XsAA==
X-Gm-Message-State: AKwxytcRA7N7Lumnt/Sdg+Kg1KDE0DMpaHWDgeAYubOxkUV1fNrx/aaW
	Hncao9Tx4wbhHnT3a3P+khs=
X-Received: by 10.237.53.201 with SMTP id d9mr15771884qte.138.1515426335016;
	Mon, 08 Jan 2018 07:45:35 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:58 -0300
Message-Id: <20180108154303.6522-27-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-arm] [PATCH v5 26/31] sdhci: remove the deprecated 'capareg'
 property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3RnIuKCbgzGB

All SDHCI consumers have been upgraded to set correct properties.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sd/sdhci.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 34bda73b66..ae914a6ef9 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1194,9 +1194,7 @@ static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
     }
     s->version = (SDHC_HCVER_VENDOR << 8) | (s->spec_version - 1);
 
-    if (s->capareg == UINT64_MAX) {
-        sdhci_init_capareg(s, errp);
-    }
+    sdhci_init_capareg(s, errp);
 }
 
 static void sdhci_initfn(SDHCIState *s)
@@ -1345,9 +1343,6 @@ static Property sdhci_properties[] = {
     DEFINE_PROP_UINT8("bus-speed", SDHCIState, cap.sdr, 0),
     DEFINE_PROP_UINT8("driver-strength", SDHCIState, cap.strength, 0),
 
-    /* capareg: deprecated */
-    DEFINE_PROP_UINT64("capareg", SDHCIState, capareg, UINT64_MAX),
-
     DEFINE_PROP_UINT64("maxcurr", SDHCIState, maxcurr, 0),
     DEFINE_PROP_BOOL("pending-insert-quirk", SDHCIState, pending_insert_quirk,
                      false),
-- 
2.15.1

