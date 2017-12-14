Received: by 10.223.159.74 with SMTP id f10csp6416831wrg;
        Thu, 14 Dec 2017 07:02:50 -0800 (PST)
X-Google-Smtp-Source: ACJfBotubBTmlwTjIWEwhAnXjXU/hVNSHVlpNhKdvVDPmtDE+IT71Kqq6tocj+f6qfZFOXO6Ey4c
X-Received: by 10.37.173.11 with SMTP id y11mr4408862ybi.121.1513263770416;
        Thu, 14 Dec 2017 07:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263770; cv=none;
        d=google.com; s=arc-20160816;
        b=MdgC5RwMRx3Ga7xZE+5XXORXzGrbT7LGzTK6o6rQRc8A0vkuqefNpG5kVmeWoAnnMe
         /uwjRGCTdw5jyr/VM0YsXxnsI3uUC27rMixjEeD1hr9WVQp16JeB1V0nG24wy7/9fsju
         rk23S4yAqjLVdXhHdc2uoyD6KdzEaCS+qAj5mMj0C0EfuUL6FAVeXIAwmC9WmVamqL/A
         KcFKizfQ7FOfghOQbpKqenpqSt/Ygs4CFmEGFBnpAAXg1lM+ecQldFRSwhFjazrdOcB3
         19bk41f7PKYc/gMa7moJ/4Ohptt170/pCf5N4X1fzEWvkxasJJvK5y+rcbMGpkC1HaLP
         GaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=hFT/Pj8JhWvMJv7wDbFPeo5WH8oytpXJoh4yK2590xU=;
        b=lv/YcxNZmzaigV4H+9UH8ZSxpRdWruC/LHe7PAfkVhmFlc9tE4g4w/lKbhJrLbtsym
         R8xDbLakfQ2IPbYs4GhVFz8Li49uqzEB3XH/OTXpg1AzH3YflYF4dt+f1j3ZJESspnIG
         GR86EOtxrCLrJ8YSAgKkgedxW/46pSHi1YWbTmD7clWhPwR54iHh8b+LVyCF50mVqNul
         619xlhBRMITadZGqD6Bg9GRM0jRO96sB0rdMX3MFhNcFtgKrN50nEUk5y4ZHk0dCTdkS
         EKRdUNm1qU0wb8ND7/Zth6mj/WQtQf8ppnchDXLFtEBJPiy0uhp/0fVHQZ0rR14EfvlE
         NPNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J40goTRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204si825213ywf.423.2017.12.14.07.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 07:02:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=J40goTRb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePV29-0000eG-QE
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 10:02:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtJ-0001c8-P7
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtG-0000kT-Cj
	for qemu-arm@nongnu.org; Thu, 14 Dec 2017 09:53:41 -0500
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:34053)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUtG-0000jB-5w; Thu, 14 Dec 2017 09:53:38 -0500
Received: by mail-pg0-x242.google.com with SMTP id j4so3564071pgp.1;
	Thu, 14 Dec 2017 06:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hFT/Pj8JhWvMJv7wDbFPeo5WH8oytpXJoh4yK2590xU=;
	b=J40goTRbcXRQqTwcKeKnr61ket1a1rq41ec5BvNP81L6oONj0UkmqynAjVlEM5oTqw
	2JytENWYyAwlIEhD7tH+EVmu6mZcOS/7vGCCKf+tippnO8JHbXOoec3bnZHHgekhes3v
	/4NXE0FgU51IzE0j1Xhhzfts6Pc8eSSkzwL4vFAd3YQzcHvDu/tkDAZakSrml0PuDk5q
	wucMi78Y8ei2fOpMDyBpWt/Oa+fPGtjDXXjWJq/IAohV3VMbtPLqYhyekmp3bDvsy1/F
	RLMmngToO0ebbnjZsFCo24ViHrMs8OV2UNOVeWkwrv7tWk3JR81pL6wOVWBZ/j1wxvWC
	pCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hFT/Pj8JhWvMJv7wDbFPeo5WH8oytpXJoh4yK2590xU=;
	b=C2D3z5rxwiVueSphT5ptJOQrLL6XxUF0MHWjQYTGXX0IWdCDXO4aF4Sr+9PlnjvUO8
	g9bbT+XNVoyD14emSygb1UNRsRBpWznQ6kazEWOl77mnBQMY4qtFEWHhqBQU6Rnpllor
	o86rQZgY0ZOuNQPJmOnTghI4itI5dMYhdkDVxUXTaPSZfhJG1rBBt9PuyffIjsrLeAQS
	Qhn7qRviI/m/+ZWSMb+ZX+mi3YZT4DJWTaA2zDRkfcon4GnNODxuGtVlJ4+xR6qHJ0uS
	5frzsqsK2kLyUaHNhaUtM/vLWGRkZ9UB/uD0ZI6uUyuXiwxFPTqSBIis4K+VvRU8xNM4
	1hFg==
X-Gm-Message-State: AKGB3mIyXaV1o3eFeM16D2FYNUwvjoECPaVw+8SwrIqkOcWFQVqoFAAh
	JpHlB56Qq494cHN23J54yJTld2IZ
X-Received: by 10.84.173.1 with SMTP id o1mr9993946plb.135.1513263216904;
	Thu, 14 Dec 2017 06:53:36 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:36 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:53 -0800
Message-Id: <20171214145255.31545-14-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: [Qemu-arm] [PATCH v2 13/15] hw: i.MX: Convert i.MX6 to use
 TYPE_IMX_USDHC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ee5+jJbiSlfc

Convert i.MX6 to use TYPE_IMX_USDHC since that's what real HW comes
with.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/fsl-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 2ed7146c52..b9249dbfc8 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -93,7 +93,7 @@ static void fsl_imx6_init(Object *obj)
     }
 
     for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
-        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_SYSBUS_SDHCI);
+        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_IMX_USDHC);
         qdev_set_parent_bus(DEVICE(&s->esdhc[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "sdhc%d", i + 1);
         object_property_add_child(obj, name, OBJECT(&s->esdhc[i]), NULL);
-- 
2.14.3

