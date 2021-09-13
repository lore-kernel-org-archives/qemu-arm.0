Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3831959lfb;
        Mon, 13 Sep 2021 09:29:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLXBn1WZgtG8Wn4UrX8AigL0ITsxFhwKzOUdhThc3UgAaOIUqlUq3ciH1DA9byCwRgB7Vb
X-Received: by 2002:ab0:494a:: with SMTP id a10mr494853uad.90.1631550571013;
        Mon, 13 Sep 2021 09:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631550571; cv=none;
        d=google.com; s=arc-20160816;
        b=Tnfqms2MnVm3nOmYbe2KN+AoaKVqwzONJp4OdxtKntrWoTChNoYT7Ewyuds/u96+hm
         K/rAXq+F+kxBbhTc/pg8H8libdhOM83NPOG9MJpiEMRpyFaWcvoMxjS2yCefTxUlE5eX
         4puMhVIVBYAP9lyEXfrnfOiv41yaq7UzbW0vP+JFlEOsoJ4bnic0FiA7ubYIKvEwBzN7
         cVPwGMt8Tm/X+P8WHzkTrCJb3BT79UAOC0YBP0iZFiNBYWy/NvN4CiREOLCbj0bofkSy
         w+JoI6fjNLhO6mhtPSELANydzlABta6uUZTP3k8PdAZifS1E6+7OeHgTmQRTeZMUbmEw
         0aTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=fv72HIG+GfrqNEdBRfRFaNHSTIzUGgYTewyRzcEe69k=;
        b=JX124wCqoNurT4s6H5NHwK2+OZgd3yrO9qFyjkrkOWL1tGz7WYhF38FSgUR1o0a4mB
         PhSaln84HUcZCS7qPOfX45BANMhyG4aUukXQMB392NUqMvVaHTFbl6zhUJOb4gpl4Zo1
         JloJGfnF7sLukoouslT6zaI3pyaWpYF7FZFuARxQv0CVFJ820+FckgPC8o/dxFw69kts
         X6NAfouT8YjPvfX7W7K2/goEcmNjgRAqtKpsx2gJlZHe7+qRe4vmBUJXwVGqevdEbyq2
         SYHLaVXL4AWkwSg26xwqYIfvYbNC74Mjn8Z5ckoggw7C4boEP6bd+FCh7OXKW6Di3dCy
         vF5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7si887667vsp.412.2021.09.13.09.29.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 09:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPopm-00043t-9M
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 12:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPoaH-00040m-A6; Mon, 13 Sep 2021 12:13:29 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:60443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mPoaA-0000gn-4L; Mon, 13 Sep 2021 12:13:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 760D420DB9;
 Mon, 13 Sep 2021 16:13:11 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001946bcf45-6d5d-4ed6-81fc-a34fc1bd4c85,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/14] hw: arm: aspeed: Enable mac0/1 instead of mac1/2 for
 g220a
Date: Mon, 13 Sep 2021 18:12:52 +0200
Message-ID: <20210913161304.3805652-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
References: <20210913161304.3805652-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8a8044e4-326b-42a8-b7a6-d95f3acc79b2
X-Ovh-Tracer-Id: 8689414008411163497
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WZVIZvqbZ09g

From: Guenter Roeck <linux@roeck-us.net>

According to its dts file in the Linux kernel, we need mac0 and mac1 enabled
instead of mac1 and mac2. Also, g220a is based on aspeed-g5 (ast2500) which
doesn't even have the third interface.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210810035742.550391-1-linux@roeck-us.net>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index ecf0c9cfacb8..20e3a7716006 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -997,7 +997,7 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "n25q512a";
     amc->spi_model = "mx25l25635e";
     amc->num_cs    = 2;
-    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
     amc->i2c_init  = g220a_bmc_i2c_init;
     mc->default_ram_size = 1024 * MiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
-- 
2.31.1

