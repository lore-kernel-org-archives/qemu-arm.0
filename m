Received: by 10.223.134.117 with SMTP id 50csp12128310wrw;
        Wed, 3 Jan 2018 08:43:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBoshOjVf4HaM6TMruUb8ed1Ofe3zNDZ5gc3jUzNPQDRYY9IzMyBQzSF85iJPeX+n74W2ZbY6
X-Received: by 10.129.52.21 with SMTP id b21mr1778107ywa.309.1514997815065;
        Wed, 03 Jan 2018 08:43:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514997815; cv=none;
        d=google.com; s=arc-20160816;
        b=Rc1uZl9jZqJgqgBblM7KRo5GhVN3Ej7t0E6pJ5KkT9xhe4Z2MORuzDGvPGfMuFxDpG
         ScHySmCbfQa6Z79cFSdMO+TZ2e1nvpugA4afDsFbTrRWCnypCj431EsIEWjx5LjopDPi
         BSsWBWCIzFchkMszgHpoOZP5s1D6DZm7erGa+fKJtPatxP8jPdgaT/mXuCgQNpBRn1hF
         JbQq8N8fj1Yqox0nqrQi1jhy8oZxpZZMUoZG/gu9Dd6gu+QH33fHFCPjfRtW32nmc6+U
         QDjp/8qheTVty3d69erTHI9CeHwKxKgdhKyPOVE30yURtTE7bc4ksB3daOaiKEKTA6Cd
         egAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=FGVjh/Ntw9ISO2b5A08bWNkUL+3nUOQ7qiE8j4pw/PE=;
        b=XtiX0TODdfOCkzsy1sQyaSC9CE9Zlx6lkOcdimy8a80+TLE6trhHmo616MFbVPrGsw
         suLwEhetEv2Ee4zCCzLVfv7skbMSEesOxfxtHqCLr2TGtxdJ23z4HYkXJnPMCFUFQoWD
         81sBei0Ii7AESvQ92f/QN/RCYHXrs0Uxir/z7Q3r7cohzDYHk+ymrro1xgXlZ9HgSVDs
         a2RFDDqFTUjYqUsiIZh7i9TIvOMf2d3l6kAGTvzlurGcKasCJqeKpX2NJ56key8TnN5T
         0Y2CPOd+Mqxn8UoJ8C23+C+3pyQGCiFHaERaP1wOHBk5VOT46RD6Nkx09QfNwB2Zvk62
         dQDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JQP0wyP/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g139si299909ybf.160.2018.01.03.08.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 08:43:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JQP0wyP/;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWm8c-000782-Fi
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 11:43:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56911)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6d-0005ea-Gn
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:41:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6a-0007g7-BA
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 11:41:31 -0500
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:39872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWm6a-0007g1-7C; Wed, 03 Jan 2018 11:41:28 -0500
Received: by mail-qk0-x244.google.com with SMTP id c5so2219443qkg.6;
	Wed, 03 Jan 2018 08:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FGVjh/Ntw9ISO2b5A08bWNkUL+3nUOQ7qiE8j4pw/PE=;
	b=JQP0wyP/a8BF2qwmpn3U++qkOH9FNju5eyARqBQ67RxP9L7jGaXzk3rJ76d++IvTh9
	gaHcjftL21wv+yh5K5tvcXAfYB31zAYYafAtlK2zHSkQi4eErOhYBE05S2HmMtI1VUnR
	jf8rw5ItSGjerlm7SGENRc2jFzoEgW7/Vw0TufKMbZW/VTxt1t/YkDZ74Bk+C0jMm4e9
	2i/Cq+HNaDYpHnx/bzhlms0HK1tlxMh3ZfJJIZkgAtFm7Wm7r273KIJ3lp+EioZZtmM4
	SonYnUaALs/1wcdHuKakhIdeiNbw4ukjoMSlqV4nRFykrkGh/rTbmW18kY1Y7A/FB9FH
	H+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=FGVjh/Ntw9ISO2b5A08bWNkUL+3nUOQ7qiE8j4pw/PE=;
	b=NNanqTwlLBOMHkVKyX976WzHH1aNSeYFmrOmO2H1L/CuB0zAizgyt1KVDkJEStquMQ
	5JZYFsRnVsR08UDaAGHPB6+Oj5r4pH+xMyrH9+kXkzc5oLCrdCcon3CfBZ2YcT89eZ+9
	UBkyMPDKDeXScfMiWzts7BNER8HScaXcZ5xjiR0vBmmAWnDFkCaKrDOlaTSacUbObCRg
	4XgOPakFYUBRje2h8/3/GfljQnPaeAkaLwyfh4uPaoa9+ocmaVpWuhHmuaxy9HvD+wG9
	gjnq8ZbwBWNOP2/hl9nD0x5n09VG9vPu0qKo9DUxAW1zi6ziBM+ZWtaDTxPsq84ARLto
	0+XQ==
X-Gm-Message-State: AKGB3mLubEF5mcH7VSYHa5BLGf1HVcq9Rf2c/84vf7XC0qXSBXtDxE0l
	97PvQFn9oNnPP10m3siABBYfd3Cd
X-Received: by 10.55.41.28 with SMTP id p28mr2623363qkh.56.1514997687664;
	Wed, 03 Jan 2018 08:41:27 -0800 (PST)
Received: from x1.lan ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id a67sm846643qkg.64.2018.01.03.08.41.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 08:41:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Andrzej Zaborowski <balrogg@gmail.com>
Date: Wed,  3 Jan 2018 13:41:16 -0300
Message-Id: <20180103164117.11850-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180103164117.11850-1-f4bug@amsat.org>
References: <20180103164117.11850-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH 1/2] hw/timer/pxa2xx_timer: replace hw_error()
 -> qemu_log_mask()
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
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 65ujRleTiy36

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/timer/pxa2xx_timer.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
index 68ba5a70b3..cfea0a5e22 100644
--- a/hw/timer/pxa2xx_timer.c
+++ b/hw/timer/pxa2xx_timer.c
@@ -13,6 +13,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/arm/pxa.h"
 #include "hw/sysbus.h"
+#include "qemu/log.h"
 
 #define OSMR0	0x00
 #define OSMR1	0x04
@@ -252,8 +253,12 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr offset,
     case OSNR:
         return s->snapshot;
     default:
+        qemu_log_mask(LOG_UNIMP, "%s: unknown reg 0x%02" HWADDR_PRIx
+                      "\n", __func__, offset);
+        break;
     badreg:
-        hw_error("pxa2xx_timer_read: Bad offset " REG_FMT "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect reg 0x%02" HWADDR_PRIx
+                      "\n", __func__, offset);
     }
 
     return 0;
@@ -377,8 +382,12 @@ static void pxa2xx_timer_write(void *opaque, hwaddr offset,
         }
         break;
     default:
+        qemu_log_mask(LOG_UNIMP, "%s: unknown reg 0x%02" HWADDR_PRIx " "
+                      "(value 0x%08" PRIx64 ")\n", __func__, offset, value);
+        break;
     badreg:
-        hw_error("pxa2xx_timer_write: Bad offset " REG_FMT "\n", offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect reg 0x%02" HWADDR_PRIx " "
+                      "(value 0x%08" PRIx64 ")\n", __func__, offset, value);
     }
 }
 
-- 
2.15.1

