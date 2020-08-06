Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1630244lfy;
        Thu, 6 Aug 2020 06:24:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqzQVdmg9+XTmCVzSxc/51urHQ5yXJx/uVI3uI94o8KqnnGhmot4q3BQqo5pIQuT5Rg+XT
X-Received: by 2002:a5b:191:: with SMTP id r17mr13017295ybl.156.1596720257503;
        Thu, 06 Aug 2020 06:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720257; cv=none;
        d=google.com; s=arc-20160816;
        b=mA3PwyaentIqkr0K6Hw4h3N9gaYo+mRhq4XfmmnycHmP2AO0gdPTmM7FEFvg01knoV
         jRAQzrHnNXVXp5vBZ+ILtMjDkf1W78W7NatAqDI+ptJHPZGH6O5wz3PEClwMfhnoKZUV
         GNFX59rAXUPXYONsbFR4CUqPRMaUCNvYuTRdnfBDNwKV+ItCW0as0E/aTv8am+A0oWFn
         TRz2QWLn3gHbkfl+JfjIUaqHsnDhVmtaVwWx3T7tWHK3DJWIV0bCJEGUI3FlHAZUu1fo
         LrPKZGv9E2BY+cPRIpmtUFlv4pt5YnTW2l3d2Dy/ouoH3qhiUshnerW2EXkvEVtY4CoG
         wZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=6bAA8yMiLTTBN44sQMDrow8C5eCFyrkCfE2OaFagHbI=;
        b=XlZ0t0hiIIXc9PR6qAK2y+VFe68BxaIWI8fFBc0Ha4r66PJLUMQ8u3xrVvsYf2poyx
         XKu+NCEPiSENF5lcVlo52pIDPL3hSSN+irMzbkTyd1P1dwdxXnztxhsHtJhO+FEKZ4jk
         BWhmy1q6EhuCyFBZ7HqLx0glVvs2BZvD2NSVmJ6edKuLYh5gz9IZh7IR9xRSnsZ2Eaw7
         Nk6S1/J1tPkURvsz5Hwy1rdM7m2qszG8rnNnQWhrMWcJStFRGY1v7ckRC3QvDXiZwRiE
         SsjKZG+jsAW+CCRvBvGPJpvvpQrYcFZZ7fbxjgQgV0AYrC1ERfbSk1TuKGB9Nt1XTdp8
         p50Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si5169829ybj.306.2020.08.06.06.24.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:24:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fsW-0006fL-Sf
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:24:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpd-0001Fe-VD; Thu, 06 Aug 2020 09:21:17 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:58291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpa-0000tz-FH; Thu, 06 Aug 2020 09:21:17 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 3CA6F545F89E;
 Thu,  6 Aug 2020 15:21:12 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:10 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005f0508abb-717a-4381-a289-c2b7c6167aa4,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 06/19] aspeed/smc: Fix MemoryRegionOps definition
Date: Thu, 6 Aug 2020 15:20:53 +0200
Message-ID: <20200806132106.747414-7-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dd5ad387-bcfc-4fcd-970b-cef7bfada817
X-Ovh-Tracer-Id: 272186303294180201
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z5mifyXlMChN

Unaligned access support is a leftover from the initial commit. There
is no such need on this device register mapping. Remove it.

Cc: Michael S. Tsirkin <mst@redhat.com>
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

