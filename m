Received: by 10.223.159.74 with SMTP id f10csp3056351wrg;
        Mon, 11 Dec 2017 13:35:11 -0800 (PST)
X-Google-Smtp-Source: ACJfBotqnwJwMQ9pXhuCc9jcFdv1S8uLXH/8yiJQvpD028JMkmuSQfmpFSNhl55IF44zSCXFcjqO
X-Received: by 10.37.203.141 with SMTP id b135mr1435070ybg.388.1513028111691;
        Mon, 11 Dec 2017 13:35:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513028111; cv=none;
        d=google.com; s=arc-20160816;
        b=BTa5JBN+HehUYmjrYAdQ9UHDyLPRWA6Yje56Zb+cYgdiP807ufloj3j7HzPJ3DS3AW
         uTAYAKBcS0tAaaWDitkqYJqd+TJlBJyEXeterfDcmz7mOvLVewfZ67QtuPUFyDO9QAdn
         zrRKVLgRMdx5E0bBXkWrk8NdAQAEVLXdn4Mwp0GXXHTiuS8vtIxXWOjKWWonmIEhwI8d
         5ah5/CoDf9yX0k6i1qqf0bgpDpsBXHooB6P8BMEMoKCDGE4i1mMnUNKaZCh4uavUkP2G
         j/JxVRoat1SXK3NGUKj0txFEhU8Q9qFmwX/KjjheN3JtC7nGrhwo21Lwd6ONcB6dGlLe
         C1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=ZTqLlHi4ok1Ycz/bAfYiDWhusb4heKGG6AqeSlvLFIg=;
        b=HvrcgtpfMC22jWzhDo4dvOtUuSkzOa9D9cd28oK3emW1BXTISyNlFQ+fAEcCVc9HUb
         aEj7fffqPB1Xk6Z5Doh7pk72mZ088RsI4hbyHdZvENjBixLUoJ+V/EEze7XIiaeArlqb
         utAON8FFulYboRe+/FoMp1QUK4RyLT1rYYKWb12AtpIvLIxuOlW2srLw84jGVs0gVr8/
         kbFai9rxfifn9LClgthPyMoX+qwUqOxoXFJRJtuiaf113Hjvyt7h0zi2o0UIzMVbVokh
         INGWQ7/JVIvtGn62JmKmDwnjLjE4RLYS1Hp+Nkkx6gNEDaXAeQOvvmSqc1KaS3zUvYZX
         bhgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nzeg8HC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si3115605ywf.357.2017.12.11.13.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 13:35:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Nzeg8HC5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOVjD-0004gi-3r
	for alex.bennee@linaro.org; Mon, 11 Dec 2017 16:35:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfF-0000sB-4x
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eOVfC-0004SH-31
	for qemu-arm@nongnu.org; Mon, 11 Dec 2017 16:31:05 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:39002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eOVfB-0004QX-Tc; Mon, 11 Dec 2017 16:31:02 -0500
Received: by mail-pg0-x244.google.com with SMTP id w7so11841711pgv.6;
	Mon, 11 Dec 2017 13:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZTqLlHi4ok1Ycz/bAfYiDWhusb4heKGG6AqeSlvLFIg=;
	b=Nzeg8HC5FXPT2O2mVSadGugdwTBOsUHN77Uq7fs7nYzX9JNB/ZxY5IpJF/ZS3O3f60
	bQd7a1jE1umrnCEgxtVTMcU6yVEYFckFFj/zNtO8XjU7Wi1bPzAL3EEddIGrlBM33au+
	/D/kX9VNXzMmU+Vr3BBKgFluPjVReU1GkyyXnXPLMVq8F5sHYwCbjrOfnMOgu3E0b9w9
	12udrYC2BNR4xQ2dl3htDhDaVy0ia2xqU+7Vul4HOtHJeOKVOQlWEQfVMVNk/QbnBfr5
	kWpm4p2QXJEjqRcL8hWLuAiuuqWM6FBvIAKGnibD7+lKMNKBmmT3GjY1h+dysw3uwEol
	qgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZTqLlHi4ok1Ycz/bAfYiDWhusb4heKGG6AqeSlvLFIg=;
	b=kZMiutTkmKnbhWVhfQUuUctuNQsJGwsKNs1wrqv5J0ZCqfpwZo7/xUoKN70+mqjs8U
	wkNFF9iqrTiWelsAa2u9XKWdJtMajBxWLnV9E6iOEHnaK7uEaS8q1KExft5le08dB/R/
	gfAXwlntgr3f+XvBpgyF7WHMzRhca34GnZWHRXuqb9NYTzweYRIG+mz8Q22Gq7IUILcg
	vkuFODh632vBnnIx8jDt2jljNwf4yZWZT80HJH0gtcB91K/ff1BDRnvOJydn8QrHWy5p
	i8gE1ILt429rfNoK/wmpXle0lIWiSRYed7uSvKZrXpp4F/vNt7iQXBiW4sncSS+sRlzi
	ozuQ==
X-Gm-Message-State: AKGB3mI6Edi5EPrvvgnO0Ck/7YYV0t2caTogBgQ62xwGMDnZmHAwXXY0
	VVh/IJcqCvmKbCDhWDV6zBhxWiGs
X-Received: by 10.159.235.132 with SMTP id f4mr1668504plr.122.1513027860708;
	Mon, 11 Dec 2017 13:31:00 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	q10sm25359690pgc.84.2017.12.11.13.30.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 13:30:59 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 11 Dec 2017 13:30:05 -0800
Message-Id: <20171211213007.7353-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171211213007.7353-1-andrew.smirnov@gmail.com>
References: <20171211213007.7353-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-arm] [PATCH 11/13] imx_fec: Reserve full FSL_IMX25_FEC_SIZE
 page for the register file
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
X-TUID: nrK3MZto+G6x

Some i.MX SoCs (e.g. i.MX7) have FEC registers going as far as offset
0x614, so to avoid getting aborts when accessing those on QEMU, extend
the register file to cover FSL_IMX25_FEC_SIZE(16K) of address space
instead of just 1K.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c           | 2 +-
 include/hw/arm/fsl-imx25.h | 1 -
 include/hw/net/imx_fec.h   | 1 +
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index c1cf7f9c58..4fb48f62ba 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1281,7 +1281,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memory_region_init_io(&s->iomem, OBJECT(dev), &imx_eth_ops, s,
-                          TYPE_IMX_FEC, 0x400);
+                          TYPE_IMX_FEC, FSL_IMX25_FEC_SIZE);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq[0]);
     sysbus_init_irq(sbd, &s->irq[1]);
diff --git a/include/hw/arm/fsl-imx25.h b/include/hw/arm/fsl-imx25.h
index d0e8e9d956..65a73714ef 100644
--- a/include/hw/arm/fsl-imx25.h
+++ b/include/hw/arm/fsl-imx25.h
@@ -192,7 +192,6 @@ typedef struct FslIMX25State {
 #define FSL_IMX25_UART5_ADDR    0x5002C000
 #define FSL_IMX25_UART5_SIZE    0x4000
 #define FSL_IMX25_FEC_ADDR      0x50038000
-#define FSL_IMX25_FEC_SIZE      0x4000
 #define FSL_IMX25_CCM_ADDR      0x53F80000
 #define FSL_IMX25_CCM_SIZE      0x4000
 #define FSL_IMX25_GPT4_ADDR     0x53F84000
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 91ef8f89a6..7b3faa4019 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -245,6 +245,7 @@ typedef struct {
 
 #define ENET_TX_RING_NUM       3
 
+#define FSL_IMX25_FEC_SIZE      0x4000
 
 typedef struct IMXFECState {
     /*< private >*/
-- 
2.14.3

