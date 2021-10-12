Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1522052lfc;
        Tue, 12 Oct 2021 00:40:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVKPfHmCYTo6NgxuvBpK0ICvylzm/8pbNHUQtwnUeqXtaBnBGtptc5ulPrRVEfCgQovKMr
X-Received: by 2002:a92:c565:: with SMTP id b5mr23502003ilj.13.1634024402524;
        Tue, 12 Oct 2021 00:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024402; cv=none;
        d=google.com; s=arc-20160816;
        b=CFBhEsHqqxjD7GXlPVlYyabueAVsIDHG91YGmDiui3+C3csFcHltzv7t68dEBD6v1r
         b2PQSB6Ms0pcXvWg9S0AIpt4nQGc8JNEA4MFegsJ9l8UjUhnYKRQhmJGnlrtmkfj92El
         BnHbmLJhaBkEs6riUK1SySVWRxTeMx7igihnAC9wz802tpyBKIbpllBqLHIRjY4fHhXR
         +M3BJVPupyEyrO2I9T+EglBqsTnEX8NAi2PfzarU+ApTaqVKfVh3BJlDc5jYwoXbSTyH
         RCnmcG7D50Lp1AzaBfTM2kvGRi+FAU1BMg2p0hiGjQjduiUk54ZprpxClM/Ng2a2LHvp
         tuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=qL+Z6i9P0dI9PbQlFGUH1mx9qqUPDI5Tjf7mCl2SrRs=;
        b=sZkAjIAHn8+oN/5G9MWKw7M1Q9cO/32k/dsBIN2CUCeNRS28Q611C8+Pv1yBnZTKes
         zboZEHzsbSfsY0qWMeKPUbD6+E7MeFlS+cjq6uwGrUDCo/To8YygBshpi8AVPExc6TV2
         ilxvnRCaGwJP6xQXAOlmNhory0OnzK+c1gdoxGD7ldbzo1W60BYttHV6HAb2mXS+i5jR
         L5Qgw5+EPjV7aK9KXFF6WlERg9/Ch+wgBpMnFzPNAtdw+vOnIdhLsaF1vjP0IyF4ZHEq
         uYtMNZHK534qEJ8RKDeaCvRP+qoxoVEUPy0wdzln4bRpsKYrnOgjBZxY81mkxoPWe8KO
         8mfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si12997711ilk.81.2021.10.12.00.40.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCOH-0003JN-Q1
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM3-0000La-SQ
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:43 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:50933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM0-000534-N4
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 03:37:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.193])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5508E210D2;
 Tue, 12 Oct 2021 07:37:39 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0064dccca85-9cfd-49e6-8499-2f13dcbacafb,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 18/18] aspeed/smc: Dump address offset in trace events
Date: Tue, 12 Oct 2021 09:37:28 +0200
Message-ID: <20211012073728.257748-19-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0717d916-357d-4bb6-b914-86dc1c1258ce
X-Ovh-Tracer-Id: 4270256872521501545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g2gIdTrikMaj

The register index is currently printed and this is confusing.

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7129341c129e..8a988c167604 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -728,7 +728,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
          addr < R_SEG_ADDR0 + asc->max_peripherals) ||
         (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peripherals)) {
 
-        trace_aspeed_smc_read(addr, size, s->regs[addr]);
+        trace_aspeed_smc_read(addr << 2, size, s->regs[addr]);
 
         return s->regs[addr];
     } else {
@@ -1029,10 +1029,10 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     uint32_t value = data;
 
-    addr >>= 2;
-
     trace_aspeed_smc_write(addr, size, data);
 
+    addr >>= 2;
+
     if (addr == s->r_conf ||
         (addr >= s->r_timings &&
          addr < s->r_timings + asc->nregs_timings) ||
-- 
2.31.1

