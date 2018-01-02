Received: by 10.223.134.117 with SMTP id 50csp11156375wrw;
        Tue, 2 Jan 2018 11:36:59 -0800 (PST)
X-Google-Smtp-Source: ACJfBotu/skLNopjDsiz++LcEbl8Q6A5iNhTp5ofQ70M+T4D5OP+fVA1S9yYyx5vhGYsZ+Iy3Jkb
X-Received: by 10.129.44.69 with SMTP id s66mr34491033yws.227.1514921819183;
        Tue, 02 Jan 2018 11:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1514921819; cv=none;
        d=google.com; s=arc-20160816;
        b=ngngogKtDbhLVjn5SRgdmmHPiL4OCu1xwLhNZYP8GeDRmS3n2Bzg7odZRgXZ1vnDyH
         gAFHD9NmhMTq0pFHrKzkGd+22ep6JM7ZXGBlBWqMQ8wUPcz8uYtdKnEiZdPBpFv5t7/n
         GMM1WhcMacdh3Vc+MM7GtvjQ4oo5RjVbtupsGyobRmcQP14oMdc+UctGu3XLp4AkVApo
         pDQNtN0YRnjsTwZnj1ly/ju6I8T+IFwrEPEb2qdKuvR4cwOD1hLaQIaHK0hnzDV9i2iD
         l8lkk2KvFPd5eiGgcS4mOMX+S/ELXWJjPO9AUW7mV+xcGthUxIX10T7KFe/XLuQCrWB2
         BNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=3U1En5R2uXgrFUkLERe0C7CX7L6LBbdyf7stsxqaX3M=;
        b=GoAbBL5+r/dnO7mXlGgJJAjPZJl7+GChzHrK/bJKVmFf3JlVXHbUUsdQgM2xps8J9u
         MrFzi0mhOTo3sunKn9h45W6vSmbY+7ST4j1O/7Ed0i0ffB72QFpTrlrxcaqe7UnTVUWD
         apwPps7J5BUr40O5khiARv1hq071zX74yViO4Daw6BV5Q4gm9mA4kcuT8gjXSPkD9ji3
         8QA9V3N3C19Ti5pGEngrTWilD1f9hyjR8/Ib3z3dAP57T2gJpw/6fzdssg7WmKv3iWiY
         vy+R82PIPiqmz9pcSlyKPn4M7yj0W4vQypq75LZ5b4VBblYd8L0wkF+3APZcyngIdX3L
         SNBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fo4Q2k/w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b67si8135476ywe.362.2018.01.02.11.36.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Jan 2018 11:36:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fo4Q2k/w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWSMs-0003Ez-HY
	for alex.bennee@linaro.org; Tue, 02 Jan 2018 14:36:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMZ-0003E0-Cg
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eWSMW-0000GK-CI
	for qemu-arm@nongnu.org; Tue, 02 Jan 2018 14:36:39 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:33284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eWSMW-0000Fb-74; Tue, 02 Jan 2018 14:36:36 -0500
Received: by mail-pl0-x243.google.com with SMTP id 1so27784182plv.0;
	Tue, 02 Jan 2018 11:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3U1En5R2uXgrFUkLERe0C7CX7L6LBbdyf7stsxqaX3M=;
	b=Fo4Q2k/wqzV8jpyWZ6eA4UfCvHyDLwGjKxh7p7kTRrWe9QiEv4tvimCAhos3wbPryC
	7Pondb01d7XTPEsVUhDV2BBYz1yT4kGLMtj3KD3Xl2a7W48df2ga4lenwUZ6NaazGnxE
	x4nASCniWkw6T/slUcitHLIA4yahNtca1riqVRviydPSYz+VX72CBLXHsRThSlmZv9kq
	IMySBcWieYXZ16gIpBqts67aUtbIyomOG0kqHeY3DM0UBUklYrn+DCPuqrz7hZe7jhdk
	UWbF5gE6+9aYzVfDPcYiQlAWqguqZYw6uuoBfjsNMnK/LbZe6iw9oFQuKFrhCUHDWZ5f
	9ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3U1En5R2uXgrFUkLERe0C7CX7L6LBbdyf7stsxqaX3M=;
	b=hvKIRCP99/H2EXLeAYQpv2gz9/qqFa+6wXjwZca12xkJfBScNLgkVGes2pqQDVZMRN
	6fRLDdY6MK6FyA91I30XaWKGApGXOmzLlzsYbRmNrrKUqSdw0NcGTmxO5P/TjUTxdFu0
	lkqU1D+U5r6clkDWv2I9Dhz+/oYrp7J+sUyP/Dsu+d/tVmEAz0RlWp+5Op5+jSnmmJHn
	WflH/sE/dczMT/BmOxRJfLBrjHLVjfAmJYs78PR1Scrgeoe+NP5a07gffgm0nQ8UXQwi
	3KhIjJ/4RebLJs2XbS1on96z7SSfkcSJz7p8l0W1FoGnyVTZIn45IqaeWLv4xiWXEy8W
	NZuQ==
X-Gm-Message-State: AKGB3mLA65S+kweQ4DMMHx/zElbRsYAtgR6yrp1spjXAUl4uFVtBf51l
	VDwKHpIKKkb5eoH+cPAw0axtpaKAVMk=
X-Received: by 10.84.129.9 with SMTP id 9mr47224975plb.138.1514921794989;
	Tue, 02 Jan 2018 11:36:34 -0800 (PST)
Received: from squirtle.westlake.spaceflightindustries.com ([173.226.206.194])
	by smtp.gmail.com with ESMTPSA id
	g9sm97905951pfk.0.2018.01.02.11.36.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jan 2018 11:36:34 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Tue,  2 Jan 2018 11:36:12 -0800
Message-Id: <20180102193622.27215-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180102193622.27215-1-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: [Qemu-arm] [PATCH v3 01/11] imx_fec: Do not link to netdev
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
X-TUID: uy/P3neZclW5

Binding to a particular netdev doesn't seem to belong to this layer
and should probably be done as a part of board or SoC specific code.

Convert all of the users of this IP block to use
qdev_set_nic_properties() instead.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/arm/fsl-imx6.c | 1 +
 hw/net/imx_fec.c  | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 59ef33efa9..b0d4088290 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -385,6 +385,7 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
                                             spi_table[i].irq));
     }
 
+    qdev_set_nic_properties(DEVICE(&s->eth), &nd_table[0]);
     object_property_set_bool(OBJECT(&s->eth), true, "realized", &err);
     if (err) {
         error_propagate(errp, err);
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 90e6ee35ba..88b4b049d7 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1171,8 +1171,6 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
-    s->conf.peers.ncs[0] = nd_table[0].netdev;
-
     s->nic = qemu_new_nic(&imx_eth_net_info, &s->conf,
                           object_get_typename(OBJECT(dev)),
                           DEVICE(dev)->id, s);
-- 
2.14.3

