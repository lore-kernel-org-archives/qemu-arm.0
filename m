Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3836503lfb;
        Mon, 13 Sep 2021 09:35:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdu7Z/RtEkXqJESjmFdxWzdsvNsxH7BHHQc2WsnfKKbpuYLJgEq+8OPYtqshIt3HFNfGAg
X-Received: by 2002:a7b:c014:: with SMTP id c20mr12055065wmb.81.1631550901264;
        Mon, 13 Sep 2021 09:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631550901; cv=none;
        d=google.com; s=arc-20160816;
        b=fouFJdgQBnmXgFdipDd3gbU8URES6vUGapfuKbE8YMYqh25rVWP5WACwV6nXiRKQhY
         X0xdLaBe2jA3NnwfgdPAnBuqVsy5//E00kGBG9SRDP875HsNlgXR8471UV4O9KZtezi2
         37LZjCkJ9IUN+qMcsXYabQBGQj7yzf4h9YGgJ67c0ceXhHlDCXiWDgdNPOUUOcy0dJ9O
         9FJoxfxxGcpBiakzYK6qu2qjeo5gq0sQuMVI0lpvbBSSNfYeugKn6TQCundvBoM4WMaN
         zU+m+chsDJgKIsU2ACZ0df0DrvpsyCP174qiZJHmACuOsVqzfW+QgS2rrHqBjNcU2u0p
         aRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=pbiTOvx6RsCP92KhzgMBHfxj9Tl0ke/ERVVqRBmQ+es=;
        b=XlOYw60MUke3oWyqo0M32OLWP1vz1RreP2Mn6yt7JSAvWbX1Dg2+H3n+v8L5GsRmFt
         LaZBR2MPhvIASG5RNwqak6nSvBlbQC6AXBOOKd+f3Xka0JgVYyGhPQB4DrgJ/Aao11+1
         Emj8Q/T/ENKGtOVeTT5EjWpeRZ0Wiw1X+AkeWk9xCShJowN7P9ldoR3PYHHo1cOg171H
         qgOFyWKKt7I4JysElzeIiBQRrafC7DQbYm2T7YrYM9kH3/emqiWH1FXwh7tunHhhgjF2
         4dSEp8ZxW1jD24pYtiQZPqn3wdrDVdjwbJ1hzaOgG9yIZq5L5JJ7sWKo+XwCQPHblf44
         YA2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si7234971wmq.213.2021.09.13.09.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 09:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPov6-0004jU-4S
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 12:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoa7-0003se-Sv
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 12:13:19 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:40803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mPoa5-0000hu-MI
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 12:13:19 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.148])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 167C913ECA7;
 Mon, 13 Sep 2021 16:13:13 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 13 Sep
 2021 18:13:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001e4e45957-3e0e-4a5e-b549-e410179d3e05,
 7CA125ACC991A0BE3D2311CBE60F5A293341D68C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/14] misc/pca9552: Fix LED status register indexing in
 pca955x_get_led()
Date: Mon, 13 Sep 2021 18:12:57 +0200
Message-ID: <20210913161304.3805652-8-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913161304.3805652-1-clg@kaod.org>
References: <20210913161304.3805652-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 76eb2a59-39a2-4c4e-905e-85842292fbe4
X-Ovh-Tracer-Id: 8689695484433828646
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: iIxHxROKxpMO

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

