Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1041135lfg;
        Mon, 24 Feb 2020 18:14:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqy3585mlS08EzhurkPJV3OueKl05rV3ahvPAKyT5YuMaPbteh0ssljpzjGmwNI5QdGmo4m0
X-Received: by 2002:ae9:f205:: with SMTP id m5mr53748983qkg.152.1582596877473;
        Mon, 24 Feb 2020 18:14:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582596877; cv=none;
        d=google.com; s=arc-20160816;
        b=wPz72EMDGYmAeF33v99yzO9UaWhuC5SB2Rny7x+zNErrVJ/ZcNuCjWGLesq/9sopSs
         okxapX2fi/l7xIoEs8oBympQvony/jqw1VE3RWczVIV6r/VUZR8q/cNIm71gADWDT26t
         nMJhDCYhaDaHoXRjeeAphX2umqAOdpp0QtEQeOG2Xk7a9+UEjfYlnHfKWJD40hb4KQFA
         ym4RlzYDVXqhkmcPS/a6o1cgZkSoV27mIybuZTtns+w+Gfq6iXu/3iKKKbvuNkjJrE4E
         SWdpwN+FlTunUMWqq53EVgDKc2I0tgmA9XD3+dkb5Lpmr4k6/V6Vq/1+1yEGlMN6AKAK
         3tJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=hUlP1Ku5rjk10Wkq2AkHSieKfliATebXXHgr0Ps3eeQ=;
        b=KmZ2gBL7HpThQzNdivp6ylXcma7pEWybztQ7KV5z/GWhlMM2ctGg8nX5jzdaMZQG9/
         AZwtPRk4ebWMZ6hmo5ruor7RfQCZLwY5auoj887fchQ3E+2wBqQbYz1u9wGl7NYShRUV
         OeLfiODt3HYBbWgi/A0xdEsBcaFdnyEIgGJNm7JIp62Q69lt9xiO/01SAB1J3FLbX2rc
         RAbMxO9LvFiNQxxq6uj3o+X/L1CO1mSeVHaRzHKgSCPJj1GVg9jqFGuev43d8ifQIYn0
         XOgT8oExmhQ3UAfFN2pIFm+ooimhysJ4+ZXhi5yyqB/K7ZI/Eeg6dVeIXTYIiHmoz9C7
         hnVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ek3si6044861qvb.70.2020.02.24.18.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 18:14:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6Pk4-0005hm-TC
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 21:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgS-00071q-QF
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:10:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j6PgQ-0008Cd-NF
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 21:10:52 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3249 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j6PgN-00085x-Nz; Mon, 24 Feb 2020 21:10:48 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C8804C6C5159483D681F;
 Tue, 25 Feb 2020 10:10:42 +0800 (CST)
Received: from huawei.com (10.133.205.93) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 25 Feb 2020
 10:10:32 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH 06/13] display/pxa2xx_lcd: Remove redundant statement in
 pxa2xx_palette_parse()
Date: Tue, 25 Feb 2020 10:09:30 +0800
Message-ID: <20200225020937.25028-7-kuhn.chenqun@huawei.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 zhang.zhanghailiang@huawei.com, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rIaNgCxUbfS3

From: Chen Qun <kuhn.chenqun@huawei.com>

Clang static code analyzer show warning:
hw/display/pxa2xx_lcd.c:596:9: warning: Value stored to 'format' is never read
        format = 0;
        ^        ~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 hw/display/pxa2xx_lcd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/pxa2xx_lcd.c b/hw/display/pxa2xx_lcd.c
index 05f5f84671..464e93161a 100644
--- a/hw/display/pxa2xx_lcd.c
+++ b/hw/display/pxa2xx_lcd.c
@@ -593,7 +593,6 @@ static void pxa2xx_palette_parse(PXA2xxLCDState *s, int ch, int bpp)
         n = 256;
         break;
     default:
-        format = 0;
         return;
     }
 
-- 
2.23.0


