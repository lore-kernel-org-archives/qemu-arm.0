Received: by 10.28.173.206 with SMTP id w197csp2624853wme;
        Mon, 8 Jan 2018 07:58:22 -0800 (PST)
X-Google-Smtp-Source: ACJfBou8xkAaiScH6fFd+QiD76BBVG4tWd2EBFvmSyqsMWMnomsOQ5WmHyrvUjLSAlOaCYCrpa9n
X-Received: by 10.13.211.193 with SMTP id v184mr10916460ywd.248.1515427101981;
        Mon, 08 Jan 2018 07:58:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515427101; cv=none;
        d=google.com; s=arc-20160816;
        b=dS0V23+njjfF9zB8olsefTh+k9+11OHEXIBjBQn3ASs+Jet/lD2yTF3c7bfN5rUDIz
         Bdoy5Ha8tBdu01xxlDllvTI3M0dUDIygOzSLoPCRxBerF3By9+ZYpniPWSOc4hvDCoAu
         da5/naoZpHrAeWgbIoya4CANjThPTDWrIwvkDx+QyOVNDHuDMAd4rcQO8PhCeHNmxIJs
         S/jtQ3ZdCSJr5W8YAo/NFUTP51sG3VfXtykCYb8zd+mdhXt0ahbkscUnHN8OGjWHL6Lg
         l32yRrmaNOFPi7nBQKNKpMo8Ye2DuhcWSj1tSBe8vS8ELjrL1DC58M2KJxYPd+2IUmdN
         TrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=TBua8QNjia8xGb26hZDM5AsbHlxFkqUI/K9hvrfeLgk=;
        b=pwdF7p84MPQzcbm2huL4L9VfSYo83GZDoplz3yqOooRqnUBW1fLietvCbMjNRqBBBL
         ryMKgT2FV7Glrrwf0CsH3YQRemFNg0iNfor+Zly0wJN+CX50+8gS4W+tMU7xMJGeruyb
         y53r/DvmQYiln6Q4J37akPnLuikr/i8E7gGiSRzTCOjVrcgkIDwJgMPMXk+7RadDgXik
         IUe4IREAfzDhEdp51ROPtc7l41ryTFK3ezrbTeyJuDIuYkHR34hHW4oPazB1JvjltXKa
         0DOIfLkccD+FNkXqLk9hHkmbAV2Jn7wOMap27n3yxq+lBQEeRsElTRf8xCf3Vlmt0dVv
         +0uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JmrVetmb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c73si2549763ybf.762.2018.01.08.07.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:58:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JmrVetmb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41385 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZob-0005aI-CG
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:58:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbq-0002g6-Nu
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbp-0008BB-UE
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:45:10 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:41517)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYZbp-0008AM-PW; Mon, 08 Jan 2018 10:45:09 -0500
Received: by mail-qk0-x241.google.com with SMTP id a8so14627863qkb.8;
	Mon, 08 Jan 2018 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=TBua8QNjia8xGb26hZDM5AsbHlxFkqUI/K9hvrfeLgk=;
	b=JmrVetmbphbrhrW2npi5ZbTlQ146x54nJLgxX3fpAOMJtSXbIFiomSx8Ry67WHztHW
	KQ0gmi9RkAoo9N4kBSudZz63KMr0Mkc2q1CI1c1v/8oUuAg3BxYHrp2bT2BNSX13Zw4C
	JEIGMLhyr0Is++g1wd+Ygu1NQVlU5Zk2lpFTW1pdRCJiIZgPdSceYWn4gD3ZdCudXHwu
	vv5hov+r8+R6wEpKxzZY3ERz2Vtsn4dRHBHSG33fR5LU9NPcEFQM7RMEbNdoHx2LHwE8
	lKmI8JaJ1a5/1ob3zpo3cSg8aug5e2VCPpNSDHEmIgDYeaF0bZ1E4vqvaQ4143FLpRWh
	sHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=TBua8QNjia8xGb26hZDM5AsbHlxFkqUI/K9hvrfeLgk=;
	b=P7wmq9SgoFu1hJJoqPLI4ArGf9CKYE6ZgUvLblX2DG+F/+0yOXIlEA0xjRD6clAqfn
	29JDjy83G+t0OChEFL30L/FT3iosMRaJ6Wn95sQVLYSCniB0b4KhKshOPivaT8ElL7Lz
	OLuZVKUvslPDn4OJE8sHUSviTF1z709rOkj/psaLs5f14Lpm/eInnxo/HIFu1A+vDvhL
	CYjq2PhxeV6bm0643aXsGN9WPHk88Ew+23WJh84QSzLssYgZvLR5sL8cPuXBj2x/fIGI
	s32TI1tQFev8X5jj1+gq4XwSJhRVMWkCKA2lxCp94dAB0tObc3XGmBcKcj2vYmC5QEAv
	nb1g==
X-Gm-Message-State: AKwxytcBlKJ6KzLzCAZUTXEdspi0RElTOm2R1yLg0E70dVL1/tijXS4m
	U3Pcm7bomOM5yWjZqlbUFQs=
X-Received: by 10.55.201.210 with SMTP id m79mr15422670qkl.287.1515426309264; 
	Mon, 08 Jan 2018 07:45:09 -0800 (PST)
Received: from x1.local ([138.117.48.219]) by smtp.gmail.com with ESMTPSA id
	u36sm7832382qtc.58.2018.01.08.07.45.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:45:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Date: Mon,  8 Jan 2018 12:42:53 -0300
Message-Id: <20180108154303.6522-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180108154303.6522-1-f4bug@amsat.org>
References: <20180108154303.6522-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-devel] [PATCH v5 21/31] hw/arm/fsl-imx6: use the "fsl,
 imx6q-usdhc" controller
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?q?Gr=C3=A9gory=20Estrade?= <gregory.estrade@gmail.com>,
	qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm@nongnu.org,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QR4jwaOQDD3L

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 59ef33efa9..f632ec7519 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -93,7 +93,7 @@ static void fsl_imx6_init(Object *obj)
     }
 
     for (i = 0; i < FSL_IMX6_NUM_ESDHCS; i++) {
-        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), TYPE_SYSBUS_SDHCI);
+        object_initialize(&s->esdhc[i], sizeof(s->esdhc[i]), "fsl,imx6q-usdhc");
         qdev_set_parent_bus(DEVICE(&s->esdhc[i]), sysbus_get_default());
         snprintf(name, NAME_SIZE, "sdhc%d", i + 1);
         object_property_add_child(obj, name, OBJECT(&s->esdhc[i]), NULL);
-- 
2.15.1

