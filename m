Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1864490lfp;
        Mon, 20 Sep 2021 01:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyerhLXRlcqrI4kZ5tWiG+zeWFmY5CzVQA1pM3slGmhjYnYUZXqlhnhf+0Kq6s4O0pnLDwW
X-Received: by 2002:a5b:c84:: with SMTP id i4mr32135564ybq.261.1632126232617;
        Mon, 20 Sep 2021 01:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632126232; cv=none;
        d=google.com; s=arc-20160816;
        b=lTYCWLrQcJ9luFx6wY+Lq/yaT/cK7arzqDhb9wM7/nTIs1dMScKSsFA3wn69SV/dx3
         bvxMXp1Tp/njQA4wEDDcFegTlQBnYK9jjk0jAfsCugixolwSn2z4XjgXBDZ9qlwJDc6z
         339ZU5lJkh0nBUorKDi23aIzPuzl+a1XPpxR7N7FgjJiXawlmcXN+k93BZePnmATXo0z
         sL4pO//z9JEHIs/Gjp/23gUpU5Cc7/QRu8T9V9TMIVK+2EZNyeaxBJ3LsRbXc5aRSDrN
         dfR4rGgwBwVmj+1/xCN2t5CwCxv++BnA367NSU2VWc010JmQYrvlCS+zWfbmCVlfjBSF
         7jDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=ju+JAxfA1TJlI/tvqbMv0IrXX7a08q6dpeYGVZNaMEk=;
        b=TjCLKELVOMk4KglN1U8go6uTFvHKyT2qnXeU7ZPwIH+ssgCqhdamJn0IhsBGFFQXH4
         PSN0sL4oGwcFmd8MwLudGHqsSVlrtOQ/Jtd/gbmszIM37Dj4H4SoxFoIl1IncTsChGbb
         Jf1Vb7WezAILHTxyG4ux7f7dEC1CkXFxTPdrgFDDuQ3MxmgsdSTpXFIGLhJeZT7XVdRJ
         AN+EVfBYfEb5N7tdpNj5U/4E7cauKbC1uCMFdc7jjXpFVk5llolh6LQ/OnLXnYJq362G
         KBdLappynsNh8zDMbZJvEpGyZfGP1UNr2ba+6HNfjaU8FjPNNY4GioMrobaiDLD6dNSJ
         7FbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3si15300108ybg.227.2021.09.20.01.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 01:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSEae-00049W-09
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 04:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEN0-0004Pq-RN
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:47 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:43505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSEMt-0003kP-NY
 for qemu-arm@nongnu.org; Mon, 20 Sep 2021 04:09:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.250])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id BB47F13ECFB;
 Mon, 20 Sep 2021 08:09:35 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 10:09:31 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00575fd9106-45b6-4a8e-a3e4-bdc5fc0e6193,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 04/14] watchdog: aspeed: Fix sequential control writes
Date: Mon, 20 Sep 2021 10:09:18 +0200
Message-ID: <20210920080928.1055567-5-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
References: <20210920080928.1055567-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 66e4cea1-be68-4fad-adb8-9cc557f93601
X-Ovh-Tracer-Id: 4737505333397719846
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wYQFt6/mXVT2

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

