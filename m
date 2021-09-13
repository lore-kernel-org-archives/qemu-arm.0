Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3831615lfb;
        Mon, 13 Sep 2021 09:29:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTrhjtU3cp4UdAi2Isc1v5zdo1NrrX7w+csL/AGiKOIYY2wsUSNn+Lxap7IMnhq2f1oHgu
X-Received: by 2002:a05:620a:15b5:: with SMTP id f21mr473480qkk.300.1631550541717;
        Mon, 13 Sep 2021 09:29:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631550541; cv=none;
        d=google.com; s=arc-20160816;
        b=DHs5xzgn6dvCZHdMjzoFa/oxuvbJugbVfx7afL/yrnoHYLNz9Hl6LEK1a8seOIQCne
         7PH5G7rd6GImVrj9NwSgkbKTSbNzhngPI7tBbT1rNlokLONP5kckGht3zmncuUGo05zO
         KyRDTNiEgVkKl7lKfagmDIvHCLLGLZ/YEtGq5J/J6TSJOGHHWsd/RNy9yF1NBRV3ktBv
         5RhccC01tLAyHTPgDhtmB4aAzFIL9GM7u/uP88N7m7unix0Sryb2AdZjD9R5o+oHD3Lg
         G+BElqe+7yAKxCO0xvBUcYq55vgY7uRvtC/XM/RZToOnRfhr0orvqESe/mAKU2YsodIW
         GMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=QMobFSiH0idTN0KuGdPHQqtiZi4a8ulVjW2IudMGXAo=;
        b=MFFXn4ZDmd70ywWyN6qhgTtLWjoveyPvMnWvvD3t/Oi/X9axwpbf6JqcxLhJI69qMF
         pfOzCWLnq2o72AtTs8jy3GC7hUQngYxLY+lC23e9G7ssQ30hTE2By+zlg636XSfFF+Hm
         hp/93f709bNa+MoBsOyXgz+miO5h29xT08/t+7AeEIssS/F6ot/ILPEI5lEIPUFYxA98
         b8upB/93Nn8HYdQftBCKc/fvRch6/FVDqeGXcBbKmR6b7MxE/eCD7LadeDtYqZCemO6R
         2XXBwx4H/pgcRwbFGc2CJ2zhUs1WaP6VZu+LTkCYjJ9IjN52mcLfouC1N1wiGFggJpDG
         BMmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20si2035149vso.63.2021.09.13.09.29.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 09:29:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPopJ-0003N9-2f
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 12:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoaG-00040j-1b
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 12:13:29 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:52099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoa9-0000gm-Ji
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 12:13:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3782820C3D;
 Mon, 13 Sep 2021 16:13:11 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010bcd4d33-fc6c-4efe-bb25-33887a3a7a90,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/14] hw: arm: aspeed: Enable eth0 interface for
 aspeed-ast2600-evb
Date: Mon, 13 Sep 2021 18:12:51 +0200
Message-ID: <20210913161304.3805652-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
References: <20210913161304.3805652-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 57a8fac1-6194-4d7f-ac71-0ca63d063569
X-Ovh-Tracer-Id: 8689132533621295977
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: rpj3G3L0Tqm4

From: Guenter Roeck <linux@roeck-us.net>

Commit 7582591ae7 ("aspeed: Support AST2600A1 silicon revision") switched
the silicon revision for AST2600 to revision A1. On revision A1, the first
Ethernet interface is operational. Enable it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210808200457.889955-1-linux@roeck-us.net>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 9d43e26c51bb..ecf0c9cfacb8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -959,7 +959,8 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
     amc->fmc_model = "w25q512jv";
     amc->spi_model = "mx66u51235f";
     amc->num_cs    = 1;
-    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
+                     ASPEED_MAC3_ON;
     amc->i2c_init  = ast2600_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
-- 
2.31.1

