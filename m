Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp315267lfy;
        Wed, 19 Aug 2020 03:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEUi9e59LV79vAMqBy2qC1p3qKRKH1+N7aE/3DRGgSuDaXL6KKDn+Y1Ht68xXVCr1sp4FE
X-Received: by 2002:a25:b83:: with SMTP id 125mr34747232ybl.173.1597832030410;
        Wed, 19 Aug 2020 03:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597832030; cv=none;
        d=google.com; s=arc-20160816;
        b=ZzJKuykoSnk14LQKzqvhYFn+w1TtomSFAzEAwoMSOfpjaI5BQn5CGytSjnaaq7gwz7
         FDjNgROvCN1ZBCJIJHOj8K9E9mjwX3z0+c9qZuAGYdujmXINhyhSOrrxOkD+KG43QBxe
         Llqrd0gv8KYv/dPhMCl3d+c7v+Rgtmp3+LzfSofx8RGbAMF+TK0pfIokV87dCsxUnvcg
         rN8KTnvx5eoyKHnS3jLNpf4i0B2ylgDxHKoD+1BhJuGHN2X1Mpwy8reeTq0f2iYmc8vb
         znaQrPWcF5UFCZlVUk+VQ559GsRTS+lOtz95+Ehj0UfAJkuHoECMOeZ5/ukLJ5W7VRZq
         JuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=YPi942GUtWLDhy+vA7SMBH/9dt6no1Qc8rwKlOfM/kU=;
        b=03ILKkFzfniX0qAK0JUJAYr/OC7p1JsYYiucrqYTUnRaT5DzAtG+2en+IOlkTYE8bv
         NlXmDQmQuCfQGkfSEeifR/4d3NLFtST1mnDeAhRS9GJI7gOwASrLfsbgWUoqAxpoMFND
         c0NYpvwz0T+sBkXED2vtOKbWtt0ChTtTayQZ8ReWc1nQNqOzWGepDwvAm9PlFFUU4qj5
         193yeb6MLXix5CzfXQWkJroIiIRuK4mxWYSCtv+eGY2P4rmitOxsjv02I/0JBfdEHwus
         Q5W9ARP15O9tv6qqO379aaEgVQoXqyZvp+u5DdzbLfpOw4askOggn1wR9xOcntdlan4Z
         y+ig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 133si23501006ybl.42.2020.08.19.03.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:13:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8L6L-00014l-Ne
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:13:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2w-0001MA-9I; Wed, 19 Aug 2020 06:10:18 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:57201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L2t-0006Yk-2g; Wed, 19 Aug 2020 06:10:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.2])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id BEA7C5892837;
 Wed, 19 Aug 2020 12:10:03 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:03 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00410db0353-e549-4097-b9f9-3bc3df02944a,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 06/21] aspeed/smc: Fix MemoryRegionOps definition
Date: Wed, 19 Aug 2020 12:09:41 +0200
Message-ID: <20200819100956.2216690-7-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: afd98c99-c741-483b-90a2-d5516f22a0a1
X-Ovh-Tracer-Id: 18049019932626488169
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3gAkynx1HQbA

Unaligned access support is a leftover from the initial commit. There
is no such need on this device register mapping. Remove it.

Cc: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 4fab1f5f855e..0646e0dca72e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1299,10 +1299,8 @@ static const MemoryRegionOps aspeed_smc_ops = {
     .read = aspeed_smc_read,
     .write = aspeed_smc_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
-    .valid.unaligned = true,
 };
 
-
 /*
  * Initialize the custom address spaces for DMAs
  */
-- 
2.25.4

