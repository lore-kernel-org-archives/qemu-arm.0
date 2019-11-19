Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp603851lfc;
        Tue, 19 Nov 2019 06:27:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqymoPyaGoIempnEF45/GqilSpNqjwF7MlWrdBVPzo1hUvlb3k8SXakIx8XEdyjyrZh21QlW
X-Received: by 2002:a17:906:4913:: with SMTP id b19mr35073560ejq.61.1574173670478;
        Tue, 19 Nov 2019 06:27:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574173670; cv=none;
        d=google.com; s=arc-20160816;
        b=ANjOqcdddYekqCpj/2nCjxDyvGx2LEkZFelT+Fa3BNG/uhmjGCabUJcf7OFL0iIlBu
         49ZBLQJxLZKvF8E26iDfSq5ZogQwWny7Fd2tr4PUHe+D6DnvAA3sM7rza4aS5CiXnqwW
         20N37c5N+LGYS/cdz+y4aru6n/Y3sVGpFsEEI6wa47xG3T4iCNwINBbKqO+bI6Mzxqxt
         pvHET7LIMFHOs3S5FK4pUJT6yik1MXjBLyiEiuQp/nIznBy566tvQE8URS2trbbYrDNV
         pj+EQ2tKUoMeeWvy1Jw08vPZA4zLlUVhZQGeYzYVlO2Q7eTpRBGebD7psJdaVUZDyit7
         F8Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=dY2o8XbFb9QUBCDymIWJMjrCqENrQuhsoFKKV2PmjZo=;
        b=gu7jnsxcwUbgRbZ3bjfSODEvkt3EGvR+OWgq08nGLFYoBpdhAJbnQJan1qUVlXvqSc
         B7Rt5Ghp5p/3XqEsBmg8tOwobLP3sxm90Q1JbaR25eIR+lCFLhKOtRnG7XzhzLrtS3Nw
         TemxCjQhnhn1BdzAn+7vzOnwV2LmFgeDnrqjwUJzCVYGmQ71dOwCNfr7ER3RfdxBLZ+m
         OOoKSzC4cUbF6OaSXv1y+lj94iITdSQizz6WNduTr+g7Yfig1CiQN/ocPgZtyP+wY/mO
         AowZynHDBp/StnplUG4CYY9/RcrPk3UvjfYSaIHKVRcd8TZ6LlCEPyBeTVNrWLifPhIS
         qXOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24si14101658ejv.111.2019.11.19.06.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Nov 2019 06:27:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iX4Tt-0005mj-1d
	for alex.bennee@linaro.org; Tue, 19 Nov 2019 09:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iX4H1-0007mI-S0
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iX4Gz-0005tY-SX
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:31 -0500
Received: from 7.mo6.mail-out.ovh.net ([46.105.59.196]:44218)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iX4Gx-0005rY-RB
 for qemu-arm@nongnu.org; Tue, 19 Nov 2019 09:14:29 -0500
Received: from player795.ha.ovh.net (unknown [10.109.146.32])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 7C73D1ED3DA
 for <qemu-arm@nongnu.org>; Tue, 19 Nov 2019 15:14:24 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id 4C658C18B08A;
 Tue, 19 Nov 2019 14:14:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 15/17] gpio: fix memory leak in aspeed_gpio_init()
Date: Tue, 19 Nov 2019 15:12:09 +0100
Message-Id: <20191119141211.25716-16-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119141211.25716-1-clg@kaod.org>
References: <20191119141211.25716-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 17924326519996648209
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudegkedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejleehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpeek
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.59.196
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
Cc: Andrew Jeffery <andrew@aj.id.au>, PanNengyuan <pannengyuan@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Euler Robot <euler.robot@huawei.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gnEok8F1ObEv

From: PanNengyuan <pannengyuan@huawei.com>

Address Sanitizer shows memory leak in hw/gpio/aspeed_gpio.c:875

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: PanNengyuan <pannengyuan@huawei.com>
Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/gpio/aspeed_gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index 7acc5fa8e29a..41e11ea9b04d 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -876,6 +876,7 @@ static void aspeed_gpio_init(Object *obj)
                                pin_idx % GPIOS_PER_GROUP);
         object_property_add(obj, name, "bool", aspeed_gpio_get_pin,
                             aspeed_gpio_set_pin, NULL, NULL, NULL);
+        g_free(name);
     }
 }
=20
--=20
2.21.0

