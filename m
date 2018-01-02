Received: by 10.223.134.117 with SMTP id 50csp11161321wrw;
        Tue, 2 Jan 2018 11:43:01 -0800 (PST)
X-Google-Smtp-Source: ACJfBosaJ5VUuID8UvzHx5sAPEix4jdyDykC0HHnXbKe/C4Hy8yEulKvP2fEaqu8muZaqXfqMg/a
X-Received: by 10.129.200.68 with SMTP id k4mr33404455ywl.130.1514922181847;
        Tue, 02 Jan 2018 11:43:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514922181; cv=none;
        d=google.com; s=arc-20160816;
        b=P9D5iFUT5Sr6TngrIpB3mw0tk0seJw9vQ9JSDuNxpoTyBFSK83TfVCX/b1cO29odbP
         DZ/wym3zfdC4i+4kIHmTV6AntwQhvbyqHLATMYhLjDElcq/O7+WB6MGNAfpHofojPFcq
         Hmdc6LpUgWzi9NlY1bwrECAmaxNNUetm1fd6p+OPdvZ45Y22Ah7F4f7nyPOoYKs+4Uqv
         RiBrVbhVv+ievUjtNHs1H/Z78L66ZF9tFdb54R8Vj4fO8j76TEB6Nldw58eDNhDbrTW2
         0Z0Axz30ub64qcCt+m3GQAqIzecHrWRkV9IUC+PDub/YlO681d1YlbfcEggJ4Y+h7sgJ
         0VOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=krjP4ycTOa7hxNduyxB7DLScklOA9sr6EGMYFcFXKS4=;
        b=w34AE4LzJgmuAOsmrfD/5aBCTAzDxkLRTT1Y0j8oxAox46tYmwxj1Xw4L5SVpLDbMU
         2GUGXqZ+SvZHqHamyRlV23mkxe/YeTjxdIUgF7G200pHchxXDSZnWe3Z9KTc6d/JnVRH
         EsYnkPNDf6CWpgArjdPf8mDUeDf+cpHrEtWYvE9XL05aYPHstxjIzed4O+TkLnx0SYRw
         OypwWbPIm/yMz4IKu6Oz3GV1nT+sO7lfNKB4WFmRW75X0HSGzoP60KpdG3voLLVPvCpB
         E+cC9hJo4+XIST7Eydwvw9of82pwAx+ZJubQ0GXHVAZTERBWJcPknP79ZgRww40HL/Y7
         DHJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e+YhLqik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s85si8362245ywg.311.2018.01.02.11.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:43:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e+YhLqik;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSSj-00007C-7Z
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:43:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMi-0003KA-Az
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMh-0000Pi-Ao
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:48 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:39724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMh-0000PK-4t; Tue, 02 Jan 2018 14:36:47 -0500
Received: by mail-pf0-x244.google.com with SMTP id l24so26024882pfj.6;
	Tue, 02 Jan 2018 11:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=krjP4ycTOa7hxNduyxB7DLScklOA9sr6EGMYFcFXKS4=;
	b=e+YhLqik6HjvfyDlXnbG41se7F5GxAnoltp7NAEdwLOFxEFwkLbb0XGCp5ccGttsdT
	OIYIw/FCQYVxc1XQS1KPYJfbZS6BjthbEQ79cduAWj2Lrf8KX95GBZSFeZIEi87J0iIJ
	eyvTe2S/Q9D1ewt7vkkqSg7j9S5K5kJFDrN2huNYBHM5UvahxlrmimSyjJr3T4z+7AIi
	2CvifLDpLiIY2r01YMCUgXjivmcnSXBmVUCm/bI84rh60EdmCFNVk8Lj5pUcSjvTnXWM
	laewN6yUCrAvVXmyIZzPBVIPVvWYEcEaQGTqFKvwogaHau1tfYbVhOTCqax2K/uO/dp1
	80+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=krjP4ycTOa7hxNduyxB7DLScklOA9sr6EGMYFcFXKS4=;
	b=dyoX3iLA1gcpbjR/q9dD55R2nh0ZM4w1m3luHRwkNwUF17BWb3YQ3ts6J8SBSkhZ3y
	Xg8JBmRWBLxxsiM4TvK5cFA75Hqxre9FG8D5a2+ccpFEhnK9iDXfbLm1/jKzloZoglDz
	f941KugJBHNxYUzEuA1Q4fLKADPPK/ZnEJjlu8x+MN8/MNAjZjOpBHZaXc/ApDzeJyxW
	IBOX8QXcoyZIHpEeOYzdANIop4zpzolu7J1T6JNTTkXLJQ9/UtMLdOqYpcrGA8dRQ8Tv
	3scHjFgfRZcRXUDWXmOfMn2/dPGJnAt1273HAQscB7J5eYJVVKxR3E1RjmpIrrz/oZKZ
	Nc6Q==
X-Gm-Message-State: AKGB3mJkhhV7eddV4vwC/YQZYz6ZTqAGCbdr+J3hgQnfBEcu+neX+qxX
	iWGmBaylsSAyl700vNT5tYH/OHnOCIM=
X-Received: by 10.101.86.6 with SMTP id l6mr22654493pgs.322.1514921805870;
	Tue, 02 Jan 2018 11:36:45 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:45 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:22 -0800
Message-Id: <20180102193622.27215-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v3 11/11] imx_fec: Reserve full
 FSL_IMX25_FEC_SIZE page for the register file
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
X-TUID: orcyE3//XPiu

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
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

