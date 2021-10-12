Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1525194lfc;
        Tue, 12 Oct 2021 00:45:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNoobMp/9v0C93ujiwtRKcmHNfHri7k4T6jiapjUlrng2CV30Rsq98cA74DC0TQwig2ybf
X-Received: by 2002:a37:6706:: with SMTP id b6mr18880595qkc.339.1634024722724;
        Tue, 12 Oct 2021 00:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024722; cv=none;
        d=google.com; s=arc-20160816;
        b=XtJaCUsnrnEMVMryVBjVqyEffV+t7k2SWzumHolFWUT9oYzQhspkX9GU7WhkKQ4FZR
         DRiApvst1My64UCbgY/KNA0d81aihk5WRuCv3HrmrBAccHnHFUe8c+6D5+9JQMeTbZJK
         bGAfRdqZwfPfB0LrpelIbctw3QDMWA29fURzFeYjz7c00od8gqprJMr2CxYYV9SfNftN
         BqBpZshwKO3EpOsyLNQaxMg6FVXPQA1mvnllKT2YVbDcNeT5PFbhpm5Yephg5tBwFiQk
         b+abY0eJlWo4H4Vh7hi4/7xlPr6OJQmz4Mj3OrmkkyW7YnbjNdaCbyaOMtfunE3TU9mF
         EVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2VnojTo9Zk1jksGDo8T+0GADVp8GbvLc1/IdHAaJZX8=;
        b=Q887cCYpWo2zC/MkODAEqpCpYlGfdl49AxD/c53EtPTYmBHLBQsEAJt6zBNFjfSfkj
         EiAlJxNj4x0JhITy++VyMueHheTwtXFf21ui7m2JfMhWiFo7NSyq1SAdyKec+9I+vRAz
         CrYLbiUYMoWlB3dqxRUTv+mA16B4TzlGza49zMI439gfWClVztnWYj7aF0Cu2hRNTxaH
         F+0cifS4yqgSh9y3Z5j2AMdO78GuSCggdkywdnKKu+1pFRNgBu22iUFc3Fey5vcR9I5r
         H64NHupkrXV6+5E5r6FcOZdhRyTdBzgK52NySbIFC2/TfVYGnDjWzoxaicpSRXpVPJ+3
         NOgw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1si8659203qvd.109.2021.10.12.00.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCTR-00074x-Sq
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:45:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCMF-0000XZ-Rp
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 03:37:58 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:38191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM8-00050B-8y
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 03:37:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 40035C407CFE;
 Tue, 12 Oct 2021 09:37:36 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0060d1b9907-1efe-4121-bea1-1e17cc836bdf,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 11/18] aspeed/smc: Remove unused attribute 'irqline'
Date: Tue, 12 Oct 2021 09:37:21 +0200
Message-ID: <20211012073728.257748-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b037ea75-e0a0-4c47-afba-49027d97f4b6
X-Ovh-Tracer-Id: 4269412447663065894
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xOLr9f3cBL2Q

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 8dc81294988e..75bc793bd269 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -56,7 +56,6 @@ struct AspeedSMCState {
     MemoryRegion mmio_flash_alias;
 
     qemu_irq irq;
-    int irqline;
 
     uint32_t num_cs;
     qemu_irq *cs_lines;
-- 
2.31.1

