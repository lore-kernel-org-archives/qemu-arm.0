Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1634917lfy;
        Thu, 6 Aug 2020 06:29:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT6020TFEakDLCvd4BDa6Bu3jrc92cQ68Ch9g47IY5xx/mLqm3uWTUwf6ZDO1LX63bKm3u
X-Received: by 2002:a25:1f05:: with SMTP id f5mr12849617ybf.48.1596720558129;
        Thu, 06 Aug 2020 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720558; cv=none;
        d=google.com; s=arc-20160816;
        b=uTdqxAAwJPQCezl9d0gf9Ba6JgEfYVUSMlGbGSmGqG8vUPx38LPhXiOXXNQq+l8Rwl
         ZLHF3WLPdVEkZehE5XE+e/sDfRXZsYvqjaw1l8yW08V+0HSK77iMKe7AVxO2+U2Y6plw
         dbySS56ZyVl28+NVnIHiZHRalhWjkV7ySpmclwKHGA2G0sx+0gWg4HEjyqJCUE6ONwLx
         qzB6LYLnEnoAQa6zX/aAN5xx9asvE5IKET0Z8AOKz4kmrx4adlkD36CRuN+JhWmHUuPn
         +qVJQRbMFhdroZarkUzd/d2Ygt++55tgMEDQX+bf3mv9FSJkp7x5vSDihXBdQL6PQ+WF
         5T4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=v/Ef9lNKOzEAIJHcW6SOhVbospruTR5IQ9mr2ZkDJ5Y=;
        b=f5IP6fttqyqGM5TzRVcFCCzsXEJSPDyeLziJb+jv8fee/wdoQa9HxezjS3FqqHADBL
         FjagX+54ZTxkyFO8Etej7IzROGmYMAX9WNcIiTSvxVJcHHsuO0IEWwQflSPDTQxRHgIu
         YC+VMz1j8B3KWLKLJDR4fgmlhgSTEtjigCZLTcJL7mZYKYNM+7KNTu8kO5vrlGiXk+0B
         4fcesssPVC8N0QkXGuWvagh93xuDvLDD5ga1R4/NLXqcZiG2QGexYNvKeCZWfrLgpqty
         +t3GAB82DjMeYMWjx+wI93K8InEiorIR92z4YiHBNjbHDOpgF10nYGuPkt4h3sTVW4hf
         tT+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a36si5007709ybi.17.2020.08.06.06.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fxN-0007UT-9C
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpk-0001XI-2u; Thu, 06 Aug 2020 09:21:24 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpf-0000vl-8V; Thu, 06 Aug 2020 09:21:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 59F8B4DAE2D7;
 Thu,  6 Aug 2020 15:21:17 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005f3a5c668-5a6b-47c9-bcdd-2cd644a8de4f,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 19/19] aspeed/smc: Open AHB window of the second chip
 of the AST2600 FMC controller
Date: Thu, 6 Aug 2020 15:21:06 +0200
Message-ID: <20200806132106.747414-20-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cb628793-1d65-4e9e-921d-727053b08558
X-Ovh-Tracer-Id: 273875154179099430
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:10
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nnx+Vj8YSXYz

This change works around the HW default values to be able to test the
tacoma board with -kernel command line option.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8c79a5552f93..795784e5f364 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -230,7 +230,7 @@ static void aspeed_smc_reg_to_segment(const AspeedSMCState *s, uint32_t reg,
 
 static const AspeedSegments aspeed_segments_ast2600_fmc[] = {
     { 0x0, 128 * MiB }, /* start address is readonly */
-    { 0x0, 0 }, /* disabled */
+    { 128 * MiB, 128 * MiB }, /* default is disabled but needed for -kernel */
     { 0x0, 0 }, /* disabled */
 };
 
-- 
2.25.4

