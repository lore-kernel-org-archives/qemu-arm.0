Received: by 10.223.159.74 with SMTP id f10csp6412299wrg;
        Thu, 14 Dec 2017 06:59:38 -0800 (PST)
X-Google-Smtp-Source: ACJfBosEsgVnECM35VyZ4n5wNXf8tBHn5ggtQa2bYDfShroxfE9GZH4nhNuJ8fIFjo9jHKrm+GlP
X-Received: by 10.129.82.212 with SMTP id g203mr4606677ywb.207.1513263578543;
        Thu, 14 Dec 2017 06:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513263578; cv=none;
        d=google.com; s=arc-20160816;
        b=s1QsNtxl5PyzgKrSEGGaNbTGl8E57YLYK2iUXkhDIjc5CDX9CWRwjCjxxASmBlDR9Y
         O7nrBSW2G3/OCN9kEpGS1LExQ98RvMoK/yrb6KEC/sVNwAzrzEmFloyLxJgP0d+Ky8k1
         ow+FgN1N1kaKVdB/Ae/wgyNKE3ntQsjGoo2dLeVt3Oly4uyz8Pz49RzysZbbSHwU8hbj
         GIm9OnEMm+IrCQFFV9Mxe3zdPKLx3m3LKCJawRif96YsxSzALYrllpIJFLa68x2S9hpB
         EVFzJQFk/NpVJW0gG8nvncuTPHHAhONIdfWqMhp+EwBGP/PfU6Y3jL0IAazp/+YRZcMR
         DYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=krjP4ycTOa7hxNduyxB7DLScklOA9sr6EGMYFcFXKS4=;
        b=bzHpCG8ORMbRH0uEaJRSC4WzV3IBsW3IF490dkz80Z9s78QJU/zXbxs9GOwM9YnJY/
         LFOUzqTD7irqI7hXKCNHL/mQCAfup669u+1UjUk8tWPl/lQERSOLatJYOBrdroiU8HpL
         tispr6/sMv6g94KKztAceEb/yJnh0mCLpW9qNyDdax6dWThJhzKB4T108IfGiq5k56Rk
         RnKXO+5l4yC/dBPis/99W6wNftk2plzmcbnRKVOLJIIKysuRlQ/FJl4/UupLG59FMDGx
         P6zGnNYAkg3YzEkEkyl7wOso8pHcFF47kQU1w2nrvu5cIJ2Og3wVhcaaC7kAjSgF9yp4
         NvMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Va1hVXnZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f3si829294ywc.510.2017.12.14.06.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Dec 2017 06:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Va1hVXnZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePUz3-000670-UC
	for alex.bennee@linaro.org; Thu, 14 Dec 2017 09:59:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtJ-0001c3-Nc
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 09:53:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ePUtG-0000kv-II
	for qemu-devel@nongnu.org; Thu, 14 Dec 2017 09:53:41 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36676)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ePUtD-0000d3-CY; Thu, 14 Dec 2017 09:53:35 -0500
Received: by mail-pf0-x244.google.com with SMTP id p84so3774768pfd.3;
	Thu, 14 Dec 2017 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=krjP4ycTOa7hxNduyxB7DLScklOA9sr6EGMYFcFXKS4=;
	b=Va1hVXnZrxp/U7LNDIYF07qxJnAHRn4HaMovcBch40R1rdk9R7MyWaimbJbQea5OCI
	7NAxL6yGpcsuwmLo9avTfCwNfp/Pq5HkCldW98FNAH8f/QXXVCjVLk0chp4SbPj8vp3R
	ADsAPo6ns+uGGbbqWSzA0l6l+AJLIJle6vziTQHHtnU1IJYWj/MOCo4b9Cm2Qur1MNID
	+0YXST2hl2/g1jHIg6AJ6w/rQr7XdnXSWEdrFu0zBSm6ci8NAi6YZbAkqUsOQ99BSyAq
	UfA4wC7SGdD1sshxLlXqw50Bp/GOAAcietFg9bLwoGIccOuVHBypJLrD2KpdWn9bF58P
	wUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=krjP4ycTOa7hxNduyxB7DLScklOA9sr6EGMYFcFXKS4=;
	b=KL2QQk3u+rqrxGLysW8AC2ioNSJ4mf0LUqTKStKJ5HOE/CIRCi3PfwSfovtzcPlkMs
	Iv/kTYi7o7Dmojo3cjTFDEl05Mb0c0KaaBSppRKZW81SnuLnmdXUxXuN6wQoY8hv7WMP
	jBVmM9aIgvKWfVi/eG49I0ZsnDXk0VTcEi0SpBUxRdTo375rtNIaaFhPw5XoCr24M6KX
	/goCXV9IBuD1e1GHTu951Uut+/OQkCVuYHodGUTLLX6dCeHuD7SZg3/L2p+2ovRODFhE
	KKX4PiUWvVyN8RASnw314MnJ1PJSyq6Ub14+3wgnQJjlcozI6wwkTQaGKl7exCo7notp
	xovg==
X-Gm-Message-State: AKGB3mIfsFreLRbPXSCngaBVs5ZnLTCTmse1FqMfgSTyt/6f/t5hTQMQ
	/SP9oZKCPtj6zGk6iELNjplxUnEG
X-Received: by 10.84.140.235 with SMTP id 98mr5868884plt.392.1513263214087;
	Thu, 14 Dec 2017 06:53:34 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id e7sm8757439pfj.44.2017.12.14.06.53.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Dec 2017 06:53:33 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Thu, 14 Dec 2017 06:52:51 -0800
Message-Id: <20171214145255.31545-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171214145255.31545-1-andrew.smirnov@gmail.com>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH v2 11/15] imx_fec: Reserve full
 FSL_IMX25_FEC_SIZE page for the register file
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X0P2MGCxJQIt

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

