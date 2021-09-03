Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1612800lfb;
        Fri, 3 Sep 2021 12:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxX/kzYpAcbUihJ2lZ3pQ2qmAeJat5Hi4qCXiVbPQACMeYHwlXbrT/h1+MZnQNVlvdaxiC4
X-Received: by 2002:a05:6e02:1568:: with SMTP id k8mr470360ilu.34.1630698808463;
        Fri, 03 Sep 2021 12:53:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630698808; cv=none;
        d=google.com; s=arc-20160816;
        b=uaLXmLlcuRChCj8lunhEbfPl6bmxaKwXEKVcRos1tbH7k0uehYwPX4i8rmU13nIzYV
         ZkPQurc+v3b5SKzV2FDHEupRsMyBt6/we+atIxtrTX1zFIyudu3Ejj8yTFvFLkPwPdie
         QqAW70Xl5UMXcUPfdQSYYnjViPBENekVyRagU8OlPSLf63Gn0vhta+ERBoYI+oh/drHQ
         xuMH3v8qQVZbL95668xtivlS9aGSJCoxglUQt66HBNKK9ULnx+AiSqEhltOKWPWQNdnv
         VnUCu2jdVXvznHtR6IPQ6zOhVivJl/XlheSjA2pW624K82tYB/Yk6/WdTpM0wFMNL05N
         DPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ju+JAxfA1TJlI/tvqbMv0IrXX7a08q6dpeYGVZNaMEk=;
        b=tsiFCbGsEyFhTz49l8gG76FKxGAoBe676/C2jqtFG4DQTJUnTqBt9m5S45dJ0JCSNT
         oUNV9BwmY20lm4ivzRbCB9E3XYu9N0kDsb9AEeSiRpCgqLPT7NWqYrRV6A+cvye/pWEQ
         fQEZIro7hq+Sikpy4eBFw/a324iEH6oV+Ohv4xAeR24e5+NRCdo7rtc78UF+uYLZbPSF
         obn5nckEMg+Enbdh/JOOh0ze1xDeVVIVKVuZwLCgD280crPcvvvcf/BAIERzu4OEhHYc
         qvWjF69VE4ui2ojYMni401QJ45uYEdAi5WE26/Iglr5R/ZpmSMRQajM/kzgwhF42EBBn
         9Q+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si326341iow.84.2021.09.03.12.53.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:53:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMFFf-00031B-Qq
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:53:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF49-0004Hw-3d
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:33 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:56531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mMF40-0002Ga-9I
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 15:41:30 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id C5C4120251;
 Fri,  3 Sep 2021 19:41:12 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 3 Sep
 2021 21:41:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0051466fa74-f551-418c-a60e-ba4a055b89ca,
 15E2C03324B5D6AD2543493448FEC157D625CB40) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/14] watchdog: aspeed: Fix sequential control writes
Date: Fri, 3 Sep 2021 21:40:58 +0200
Message-ID: <20210903194108.131403-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903194108.131403-1-clg@kaod.org>
References: <20210903194108.131403-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b34a77ea-e8e7-4a58-9b1c-62f11364b5cf
X-Ovh-Tracer-Id: 8815796274561518374
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddruddvjedgudefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 4utwhuPZM2XF

From: Andrew Jeffery <andrew@aj.id.au>

The logic in the handling for the control register required toggling the
enable state for writes to stick. Rework the condition chain to allow
sequential writes that do not update the enable state.

Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20210709053107.1829304-3-andrew@aj.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/watchdog/wdt_aspeed.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index faa3d35fdf21..69c37af9a6e9 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -166,6 +166,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
         } else if (!enable && aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] = data;
             timer_del(s->timer);
+        } else {
+            s->regs[WDT_CTRL] = data;
         }
         break;
     case WDT_RESET_WIDTH:
-- 
2.31.1

