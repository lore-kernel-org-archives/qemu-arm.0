Received: by 10.28.173.206 with SMTP id w197csp3378675wme;
        Mon, 15 Jan 2018 17:40:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBosTXCISV2tEGDO2CGFiGgTgSUk1gc+1otdK5YZU24bmdEi28y6Ls6ewUKqiUQRrwnsENPOc
X-Received: by 10.37.32.196 with SMTP id g187mr32823796ybg.320.1516066844473;
        Mon, 15 Jan 2018 17:40:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516066844; cv=none;
        d=google.com; s=arc-20160816;
        b=rJDWjYX0QYqIaYPU2lsPCA6QcSTU4QV/IE8l+8/eb5n7jkZ85UWatCPLrmup6fi395
         I88TBO2OMS8n5nHGoZUb7IPd2wXx1qBPyfphEqKoOm3qCh3uhMTVpneLYPRHwxzzlgSC
         fJblxUZkN1qku9YCLlFje+miRyLL8CSrqgYbiHc31dumSWGBDpOKNXuRkyb3iZjxybn+
         wAaUBo5RksNw4GhmYr78ebw0+nB3szgPYcvt9KfNMAia0N05t7fOY5dwx4d73SOFWs1g
         BH0gVkKqaaGh2mSz6v+PLY+TwcAnsi/iqtjCxRToSucx/H5DW1RK+OME7ZmfoR1bGb4y
         NZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=EI2QYW5O1X40vLHi4CKTLAbIcihx+689OrH/d241DYo=;
        b=fYs5NI7Vjwv4IJN+wZ7FtIymm4vHxvNCtPdODo6q5z8qADvFxHoOtzNg6oZ798r538
         yZXonkAmVvLXy16k7drcmyVDWgObIsQXGU3NpxM8vuJ4PeGGrjYagG8aAwZjp9H83qyI
         PRsdE/bbY0gmlcuxSvhKDC9IISviE5bVgWrxg3/Tbph9N+MHaOW6zxf0rRUyY9tCQC2e
         xd+hf7JvndBboXzomIU9slZJbUZCfGpnLJDAwyiKoYr9uQg6CvYqw9oYvvgkjkCG9lkX
         Chos/hoi/YcmRl+9n9/LOj9vDboSFoYDbkxHuHXX1Se5cPSDF6sSKQDKNX/t1/t/9Vkb
         IvpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lEMgkQ6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g6si212449ybc.387.2018.01.15.17.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 17:40:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lEMgkQ6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebGF1-0000Lj-SB
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 20:40:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC6-000658-QN
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ebGC4-0005Ho-Nn
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 20:37:42 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:35948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ebGC4-0005HZ-Hc; Mon, 15 Jan 2018 20:37:40 -0500
Received: by mail-pl0-x243.google.com with SMTP id q2so4930888pll.3;
	Mon, 15 Jan 2018 17:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EI2QYW5O1X40vLHi4CKTLAbIcihx+689OrH/d241DYo=;
	b=lEMgkQ6pV1kKYWOw2qX8J9A8uAgJO5iZ905V4gy9sqLR7lgh4ikZikzA8jNJsBqMyr
	gmeMnqgkzjmt6zQ1COlC1RUtsmo3rdU7pYKU3LHdqUCToxoICUIZPuDhLz1jr7ngiLqF
	tr2c22nUhZJgrUdfrBiz4zzmqIzcPh3FhcU0zVQbDAY5Pc+4vc8UdwBYalLqtgayo1hH
	b6Jtpw8g1K1qbqIRZIh237Ugzv/Mtf7X8vXyrycHkw1m8QEOIU283NeDXlR5dAkD2B4W
	PhrTdzC5hscqsqKaJt3QmR8+mOnS6kV8ESVq5ofGEIwOF94jxslRPwRFejkNU4PP9VeU
	XD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EI2QYW5O1X40vLHi4CKTLAbIcihx+689OrH/d241DYo=;
	b=ZDdhCaA90DNktDG56Ty4QNMSLNWc+FPOXEVYDw0TfYFMqPLfoRmaxpv0xyUVstKYeL
	h9eRUlyZQrOcmAZbp83KoxRVZuEZ2ILTwfAyNXEc9kijHxL76k29vcLT9NJdiSVPL5ug
	2uWz64C9xkwkNgby1p4TxrUpneoyfHGlhWm1NmzZtrAAddt4gOVkjtW7CFPwsc81bd5s
	mFkMjMYaLQmYyz6tISj8YmAz1lRbu4iWS2NnqkBejKzXUcrpkD6FJpfywcCmVHR9Sod+
	LlvaboaTTDMG+au4FkQgHx6Pe1R6crK2Vxp0CU4vOBCvfVGMPwGCae9izGRZtrvZIYsI
	OZmw==
X-Gm-Message-State: AKwxytdslfw2MQLniYWP8YqqosJrKQGWGOkB0fQ1P9vrH9l8eFkeNB3v
	QVkRZbuoWjcXFNK7dswlbJcf1NvK
X-Received: by 10.84.130.8 with SMTP id 8mr11359101plc.359.1516066659390;
	Mon, 15 Jan 2018 17:37:39 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96])
	by smtp.gmail.com with ESMTPSA id s65sm1023795pfk.7.2018.01.15.17.37.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 17:37:38 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 17:37:02 -0800
Message-Id: <20180116013709.13830-8-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v4 07/14] i.MX: Add i.MX7 GPT variant
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
X-TUID: C81LtFt70OX1

Add minimal code needed to allow upstream Linux guest to boot.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/timer/imx_gpt.c         | 25 +++++++++++++++++++++++++
 include/hw/timer/imx_gpt.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/hw/timer/imx_gpt.c b/hw/timer/imx_gpt.c
index 4b9b54bf2e..65e4ee6bcf 100644
--- a/hw/timer/imx_gpt.c
+++ b/hw/timer/imx_gpt.c
@@ -113,6 +113,17 @@ static const IMXClk imx6_gpt_clocks[] = {
     CLK_HIGH,      /* 111 reference clock */
 };
 
+static const IMXClk imx7_gpt_clocks[] = {
+    CLK_NONE,      /* 000 No clock source */
+    CLK_IPG,       /* 001 ipg_clk, 532MHz*/
+    CLK_IPG_HIGH,  /* 010 ipg_clk_highfreq */
+    CLK_EXT,       /* 011 External clock */
+    CLK_32k,       /* 100 ipg_clk_32k */
+    CLK_HIGH,      /* 101 reference clock */
+    CLK_NONE,      /* 110 not defined */
+    CLK_NONE,      /* 111 not defined */
+};
+
 static void imx_gpt_set_freq(IMXGPTState *s)
 {
     uint32_t clksrc = extract32(s->cr, GPT_CR_CLKSRC_SHIFT, 3);
@@ -512,6 +523,13 @@ static void imx6_gpt_init(Object *obj)
     s->clocks = imx6_gpt_clocks;
 }
 
+static void imx7_gpt_init(Object *obj)
+{
+    IMXGPTState *s = IMX_GPT(obj);
+
+    s->clocks = imx7_gpt_clocks;
+}
+
 static const TypeInfo imx25_gpt_info = {
     .name = TYPE_IMX25_GPT,
     .parent = TYPE_SYS_BUS_DEVICE,
@@ -532,11 +550,18 @@ static const TypeInfo imx6_gpt_info = {
     .instance_init = imx6_gpt_init,
 };
 
+static const TypeInfo imx7_gpt_info = {
+    .name = TYPE_IMX7_GPT,
+    .parent = TYPE_IMX25_GPT,
+    .instance_init = imx7_gpt_init,
+};
+
 static void imx_gpt_register_types(void)
 {
     type_register_static(&imx25_gpt_info);
     type_register_static(&imx31_gpt_info);
     type_register_static(&imx6_gpt_info);
+    type_register_static(&imx7_gpt_info);
 }
 
 type_init(imx_gpt_register_types)
diff --git a/include/hw/timer/imx_gpt.h b/include/hw/timer/imx_gpt.h
index eac59b2a70..20ccb327c4 100644
--- a/include/hw/timer/imx_gpt.h
+++ b/include/hw/timer/imx_gpt.h
@@ -77,6 +77,7 @@
 #define TYPE_IMX25_GPT "imx25.gpt"
 #define TYPE_IMX31_GPT "imx31.gpt"
 #define TYPE_IMX6_GPT "imx6.gpt"
+#define TYPE_IMX7_GPT "imx7.gpt"
 
 #define TYPE_IMX_GPT TYPE_IMX25_GPT
 
-- 
2.14.3

