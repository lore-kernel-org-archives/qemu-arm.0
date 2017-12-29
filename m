Received: by 10.223.134.117 with SMTP id 50csp7027607wrw;
        Fri, 29 Dec 2017 10:25:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBovWcPWzyvWG45ShmpWxrOjEm/0cQExRkERKNS5R0EQnCQMa6IlPVxLKXSZ1XWH/BkSaokr0
X-Received: by 10.37.50.68 with SMTP id y65mr11103166yby.485.1514571931825;
        Fri, 29 Dec 2017 10:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514571931; cv=none;
        d=google.com; s=arc-20160816;
        b=Hl8p1Sd2XPoIsI9DV+0IHx/RZBp2+B9PJPbiphxHvhBDjUnbP9WC6XIHjfPYrAta6n
         xq/RlceM0gtlKPNPkWNbbikEODnr0Ofba9CkTpI6BJq2Q8253csrZNEPMdZMVQR91oaF
         dB09jIhTGfLDrTYBoAwuWNfU6Jgo7M4IcoSJHwFHY+Jxc393wDTKjud7Li8okTA03fGU
         RGsdTy5xMUJBsN/7/rSqQAPme/FOeYWgWv3cYju536GVv1dE5qTcjLxKEM+oTlKA/Q9w
         NrFKxRC77S4G4U6QnjSntaEo+/GJlhxiltiJV/52SjBCym/EZ2xUR1DquOdkQhiU74vr
         Xrdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Mf5sMfrAQgHlXLJqlurRhi790VW5gkg89w7JnRZuUQA=;
        b=CREQPaypAPi5xqXLOtcBhdCXl/iYcWVxst4hNwL5firbgpQkBv5DwxjpS9qHJlnxf3
         +PpgHDpvPPNHDLo4Gp+/m/CeQnXw9nUgEUa/a2qMsA1LIA8O7sdXgO6oS0ZuX8bU7+hH
         +Vu6Q+nEgt9V0hCwtBkS0LbWx/xg2leU/Lz4G7kvg16SlW2NgRwd8CcZqSNLpRjlvd9p
         zB3d2hu2zqpGNj2E2pv9fpBJzG7PtY3c0jVurjW4UHg7db2DGhF+y0Zs+3fA0P+O8YHe
         J9P702u6PZQFDRN/Mo0RY+6IAbTvI6BLS9zrkXXxp1agSD7Gg/cEEMCxz/LP/E0h9LxR
         veHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nms21u+3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s6si1718805ybj.163.2017.12.29.10.25.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Dec 2017 10:25:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nms21u+3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eUzLX-0005gA-BI
	for alex.bennee@linaro.org; Fri, 29 Dec 2017 13:25:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoa-00046M-59
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoY-0007jF-TK
	for qemu-devel@nongnu.org; Fri, 29 Dec 2017 12:51:28 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:42457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eUyoY-0007j0-PP; Fri, 29 Dec 2017 12:51:26 -0500
Received: by mail-qt0-x242.google.com with SMTP id g9so54951940qth.9;
	Fri, 29 Dec 2017 09:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Mf5sMfrAQgHlXLJqlurRhi790VW5gkg89w7JnRZuUQA=;
	b=nms21u+3iR2B7CXUN/CVnhbB3WpV0p5V9cWcpjfB8vT1TASNzWml6/ZkfymLkHEdX6
	a0u+X0wM5a6s4ZXPYToaSxX8V4z5hY7wyqbtOErh7Z6GnZrURVC/ojj1ge3XG7Q54YHA
	DBUluFWwsnguHZaESGCp9gLnQGaATFP8hN9E/CDdAbZnx/WsRFiI1DjOTU2hkX9+dyE7
	JvFUATLYK13tRmJ3uGPa2apkDQE6qqcTloE9Whjxye8Z/JOpbvlrjFOwTIdZIYTA486H
	0ADgKT6kwNBicG3fHA1H6xSW4KGD+3I1W9M7OLAPJ+F8eKvY5BADguT8uOrKN8qWOYcj
	s5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Mf5sMfrAQgHlXLJqlurRhi790VW5gkg89w7JnRZuUQA=;
	b=owE5klEvhdBA/xz9Sd4A7fAw+gW5XOXFoLZZE9tBR8ARNYEOQrX39MfIFv246JcdfZ
	+JdW3dm5OCtNPZQc2p40JiWF3fCn8sDLvBnW54W27J311CkrLzcud7qNWzqZkh8mvEpF
	Gi9uynak35NOa3P6elkOgsAdoBTVR00Fz7+ir/vMmtcUxK3NeLHU0Mzz+OzwGijgcC3I
	8ZDIqGJZemSoMtq4gfFl7rm0rHFaGVQCUQdY4IS1a1lhR2DTTNvJ9Bfcanty2i2Z9qPF
	TVJlS5b35zI+5c7UaVfP38tkDDwhWBr80AXbF9g2IHjkB/9vFwLBBEmc54WHDZblaytq
	7NDw==
X-Gm-Message-State: AKGB3mIBhHFYe+9va6E7OMDV2KDMFh4mbchRB3quVe4gavSjbTnLirVr
	QhbX746I3/x1Oqy4n3cjhPE=
X-Received: by 10.200.53.80 with SMTP id z16mr49257231qtb.264.1514569886254;
	Fri, 29 Dec 2017 09:51:26 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	t41sm24223893qtt.84.2017.12.29.09.51.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Dec 2017 09:51:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Date: Fri, 29 Dec 2017 14:49:25 -0300
Message-Id: <20171229174933.1781-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171229174933.1781-1-f4bug@amsat.org>
References: <20171229174933.1781-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v3 34/42] hw/arm/fsl-imx6: implement SDHCI Spec
 v3
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
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bMhb//NiOVpi

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 59ef33efa9..d4de428dbc 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -348,6 +348,18 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
             { FSL_IMX6_uSDHC4_ADDR, FSL_IMX6_uSDHC4_IRQ },
         };
 
+        /* UHS-I SDIO3.0 SDR104 1.8V ADMA */
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 3, "sd-spec-version",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "timeout-freq",
+                                 &err);
+        object_property_set_uint(OBJECT(&s->esdhc[i]), 52, "clock-freq", &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "adma1", &err);
+        object_property_set_bool(OBJECT(&s->esdhc[i]), true, "1v8", &err);
+        if (err) {
+            error_propagate(errp, err);
+            return;
+        }
         object_property_set_bool(OBJECT(&s->esdhc[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.15.1

