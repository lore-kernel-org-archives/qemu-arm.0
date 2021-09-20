Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1859691lfp;
        Mon, 20 Sep 2021 01:15:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytCkXE2hP/voAu0n4+MfNeS0I6/iju2thwVlGe12MfYeI+ssxrWEnfsTV2+i8FaIcIUeuC
X-Received: by 2002:a25:cc90:: with SMTP id l138mr29455818ybf.400.1632125749443;
        Mon, 20 Sep 2021 01:15:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632125749; cv=none;
        d=google.com; s=arc-20160816;
        b=eV3sTQCU8btU/60lIYxKrziSys0jVTWnQyfjrUYrXpivGF6tM8a58uWdlCE2TT3BKB
         q0RPiszlaNQsA+ctcjje2x9HpuppJ398n7dKJGSVlvV2gJdMT2Ep/XO5VWwAfdYByKIU
         hynjTy/cT5ndX74u4nrXCjaANbiNZaU9uK7G0AJgiDQAYrmzdwLEDbVLtC1YyTSYlCQe
         ZmNDPu5WnanoXQufzY2lUTlDt9Tckzf4YKFeWvCkxRdQtdnkuUYda0PcE11iamABGzfN
         rQ3QPTyeuzOV+JxtQCHP75zpsn5PVuefneaKp/JreBoSr7O3dgLwWA/AKkHchKfPHt+4
         IAfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=pbiTOvx6RsCP92KhzgMBHfxj9Tl0ke/ERVVqRBmQ+es=;
        b=Jt0UOJeZUR+NRb05AYrvTuL2mSgrgi80OaUx+yLYjCULhowA89dOSTdF64MZx9Y8Kh
         8z8jq4gI3TF9nhVqTWrImwgeJKoU35Z32TJNJ7nVAjKo/fFGCL4mNWPjY0akkBhGpwnP
         82nv/0dduHdWITUdLqmi/6QmBN/3cQsUoGwT32b6m3fNtGY5yosfe49lA2XhEu+fPQ6E
         2gpJEdiu3glk6dbtKdqsO7a0UE6ZOGiWt+XP3wvbtDD4j3NSKR/6idmGWkJuG7Rjrneg
         Ptz1+399IslXSK0ElPz9NEA40VuCLy4sh+iyA3Tr3OHlBFeoVQ2ZI+cYq3YqJWhqE9XZ
         LFgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q141si17236014ybq.343.2021.09.20.01.15.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:15:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSESq-0004wV-MU
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:15:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEN0-0004Pr-TU
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:47 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:42329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMu-0003kV-0j
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:46 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 3F8B313ED21;
 Mon, 20 Sep 2021 08:09:37 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:36 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00515a30d72-5773-4410-b7d8-74e32f4ff87b,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/14] misc/pca9552: Fix LED status register indexing in
 pca955x_get_led()
Date: Mon, 20 Sep 2021 10:09:21 +0200
Message-ID: <20210920080928.1055567-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
References: <20210920080928.1055567-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ab035899-6ba4-4ff3-a9a9-6f0c2997ca00
X-Ovh-Tracer-Id: 4737786811904723750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VetBvk8f61In

From: Andrew Jeffery <andrew@aj.id.au>

There was a bit of a thinko in the state calculation where every odd pin
in was reported in e.g. "pwm0" mode rather than "off". This was the
result of an incorrect bit shift for the 2-bit field representing each
LED state.

Fixes: a90d8f84674d ("misc/pca9552: Add qom set and get")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210723043624.348158-1-andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/pca9552.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
index b7686e27d7fa..fff19e369a39 100644
--- a/hw/misc/pca9552.c
+++ b/hw/misc/pca9552.c
@@ -272,7 +272,7 @@ static void pca955x_get_led(Object *obj, Visitor *v, const char *name,
      * reading the INPUTx reg
      */
     reg = PCA9552_LS0 + led / 4;
-    state = (pca955x_read(s, reg) >> (led % 8)) & 0x3;
+    state = (pca955x_read(s, reg) >> ((led % 4) * 2)) & 0x3;
     visit_type_str(v, name, (char **)&led_state[state], errp);
 }
 
-- 
2.31.1

