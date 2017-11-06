Received: by 10.223.150.237 with SMTP id u100csp2786183wrb;
        Mon, 6 Nov 2017 07:51:52 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QsqCGRDwQw1CUWI2HDeuLq4HUsSiGQiV0FkvmH924xD6VDENP5O5az4Z0eySYMte9dJrOT
X-Received: by 10.129.172.76 with SMTP id z12mr9778134ywj.48.1509983512016;
        Mon, 06 Nov 2017 07:51:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509983512; cv=none;
        d=google.com; s=arc-20160816;
        b=NbE0j+nIY0xVmAwCvY9/hA4J4J6brEP25BYn/DW4yjv2k0AW43MSPqC2Y7enAcmpjg
         /+20sRWSwfMjb4uk/u6OAnjvN0pKRDlvAUETbvFTLyjbPPRpT19NwvNFXupmCkIk2urf
         y02p1RDFJ1mssCzxNafjKsSAKbF5oBAkhacihlbE3ne+vzh/hImu4TVpRi2wIux5FdB/
         ZZqdiDP+hHOnJ8oTUzEHYdPGVwczAEqcFON9ru7+PUSCRXB6Y8cPaNmuL1y9R69JP9lr
         I6ExP5yQSLFRMEg1p7Gble5uzGJ5tSRugb3MgC+mXvzoqSToNyZOgk/9LwhL8Ep4mnuj
         AGUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=llagqTHPHOjEScthgtvNG1izQcqVy3Vte4neZqZdjno=;
        b=G45goFIbJSQgPLYckIhSdjY1Yo5uIusIMNoVilIKT5uPcxGbBEXsCnQjsCO4helwAP
         Mk1XYfwQC/tzs0IzuxWtOQGtVm0DcOMDTOKMf4mIV0zv49MiGM22fhQoHACAaHNjXIZM
         R3F5mO3suAff3b291rA1dSOT4m8tSQ9Ay1YlByQvc99Q/io1Q0HyKSi1yTgTa+DdZfDq
         7hzvSnC6uZ1dYAcOQ6dqEXal5Xmlm0NIvM0FcepbGvoGHPYMRxdjBJVniYS0fbBW5YZb
         xlA0rZhRKJ+fp6VCtjixyZ/isTxI7LKOkJ6tx36iOUZCCJ66+bGxnfOpIYhk9sQRIly/
         3y4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AJ15iVue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4si2890585ywa.239.2017.11.06.07.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 07:51:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AJ15iVue;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBjgl-0001He-D9
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 10:51:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33457)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdi-00078i-Fq
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eBjdg-0000T4-Es
	for qemu-arm@nongnu.org; Mon, 06 Nov 2017 10:48:42 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:48140)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eBjdg-0000S1-9C; Mon, 06 Nov 2017 10:48:40 -0500
Received: by mail-pf0-x243.google.com with SMTP id b79so8012655pfk.5;
	Mon, 06 Nov 2017 07:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=llagqTHPHOjEScthgtvNG1izQcqVy3Vte4neZqZdjno=;
	b=AJ15iVuezplJuBzOKtqIdsb5mw0cCZPIrBsn8GGEH9SNPxqcdFKm/UtLNn+pAGmHLm
	SN/wBhRxaYV02bTf6U/ovthse/6tdftD+WKKfnJJgG3h1X8se1zq58q5R/Bzkw+PNf67
	XjN0SLnw/y1H3OxZMJVKI6FAkUdadcrucliZFd+HA0G5PzB0Fv3rC3o9F6fs8snwz7qK
	ccJ3G9QsZwXAxAYi/7AXol884nxuTge7fPIF7O4S1c8kONQv3qXymI9m29BI52sRjxM5
	bmfsLGzbjttM0X7bXwK7TRtdhmIXrl9x1MsIanU/Tx/dZHPqjm+GDl/x8SAJCdvVblZC
	tQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=llagqTHPHOjEScthgtvNG1izQcqVy3Vte4neZqZdjno=;
	b=nCVWyyY8ABOrlKpiJXtSLb8ysN8gjEQp5EphOqrg1PUi9cW3rO1sgkRdvTgyInYCud
	vUbyRcF937R5IGj32W1IAcA33AoNjF4eYIFG1zUGltVfSvLS2wwgAPxg6vqooNyyNizP
	ppVIKTTgqCtmQH37wBQ5uTMln8EedBzfoh8P+lhvWgapJYbTbWR2P+wEKDjLdxEvWT4V
	Xe94ULjviGIxw6ishJVaAXVBJDGRT0J5MYNk6i5j5A9LxLv9AaOAgqAx+5d1zh6KNvFU
	3c1iSv4blzRGe+iqpd7hsNryoBIXb/lm2niJYM8zOtppTKiFnKCStD2ImozCZkRfDbO3
	NrJw==
X-Gm-Message-State: AMCzsaUlYTlP2v+WNNUJR/UcUjtB44jcaDK3cwW7x+U8uKG5/WNS+TQF
	i5tQ3fwd9Q145S8pE0SJF7Rz7ZqUdy8=
X-Received: by 10.84.234.197 with SMTP id i5mr15302754plt.316.1509983319037;
	Mon, 06 Nov 2017 07:48:39 -0800 (PST)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	x1sm22719590pfh.113.2017.11.06.07.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Nov 2017 07:48:38 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon,  6 Nov 2017 07:47:53 -0800
Message-Id: <20171106154813.19936-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171106154813.19936-1-andrew.smirnov@gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-arm] [PATCH v3 10/30] imx_fec: Reserve full 4K page for the
 register file
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
X-TUID: Rf9G7CzWo0HU

Some i.MX SoCs (e.g. i.MX7) have FEC registers going as far as offset
0x614, so to avoid getting aborts when accessing those on QEMU, extend
the register file to cover 4KB of address space instead of just 1K.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Cc: yurovsky@gmail.com
Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
 hw/net/imx_fec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 48d012cad6..e236bc933c 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -1252,7 +1252,7 @@ static void imx_eth_realize(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
 
     memory_region_init_io(&s->iomem, OBJECT(dev), &imx_eth_ops, s,
-                          TYPE_IMX_FEC, 0x400);
+                          TYPE_IMX_FEC, 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq[0]);
     sysbus_init_irq(sbd, &s->irq[1]);
-- 
2.13.6

