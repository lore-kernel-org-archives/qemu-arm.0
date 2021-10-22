Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1231092lfc;
        Fri, 22 Oct 2021 00:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8PhbSnRdgt2Luu7pV7y1tWq7bSvU9NSYXG57PQwD8lOfY08bLY5/VK3REjs1bioc9pBjs
X-Received: by 2002:aca:d6d2:: with SMTP id n201mr8038868oig.120.1634889475221;
        Fri, 22 Oct 2021 00:57:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634889475; cv=none;
        d=google.com; s=arc-20160816;
        b=IBpa/jvo40/ykyBTesYv21OWIO4VQfm2xGh33QnwWtgNn3wqRzwZ2K2VYkSFK+p40Y
         aGIlhVHwvBU9b0P3OyGXpna0Ulqkg0oTcu7q682QLdjUZ3gIQefcVEIuLZWHteuYNKQ5
         funuuyFsqEuq8XeX1gdtEe4UKvxiX9XySkgnLt6sxWmUKL+AueP39HYjjaybFBM5K0wX
         ssQhAqVjB3st/HB732FIcV2UYzj6JQa7rMy1SCtdmyp/it/PweLP0KqOHhk5jh4nK43V
         pC7CixP+gK0ruy4fn1q9SKysH71Gs96AIEu1XUL8lt0JyDNRxeHpUAtkrZNEbrlBH5iG
         q15g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=X5+Z0D2kOIvmvBmTjnUYZKGCZQ47YV6zpXoIt+SHpmw=;
        b=VRP5GOffCtKb2zkne2kqLXFIp/I0hiCIq1KGayG6a1F2dYBFeIzWbFm/NB6c9JQvtP
         S0HoFVih2A45YRECoPIqCGtbwXwXhKP8v6S0Fxcw9Hx1T0guQVsm1WKd0njm5A7Uwkq1
         CVJ/ulLIRb7pxrhG3LGkAPd64SH429Ky5lWP4ltS6ue+gbQwxbUxBmq6+nEtulb0bqg+
         /NiY5uiS6TaCNjYY3jyBtZOb+bj+xkQj17M8ODf+QlAB2IKWGJJuq+wiUdbf+smcML+A
         nto/i4WWvWQrPH0cc50dsrmHyL/AhfLRyqEGqTVHxW5yAlt8qA9VeWM6b5c6P7sc6m4z
         aZbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si9349613otq.334.2021.10.22.00.57.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Oct 2021 00:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdpR4-0004Kz-CR
	for alex.bennee@linaro.org; Fri, 22 Oct 2021 03:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQq-0004Io-87
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 03:57:40 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:50181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mdpQm-0002u5-KJ
 for qemu-arm@nongnu.org; Fri, 22 Oct 2021 03:57:38 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 0D6C0211E3;
 Fri, 22 Oct 2021 07:57:34 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 22 Oct
 2021 09:57:32 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0034c0fc9d5-17eb-4631-a24f-ab34967c2a0d,
 74C1FF3A6B8BFE8186BF38A421BAA83045AEA3E9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/3] aspeed/smc: Use a container for the flash mmio address
 space
Date: Fri, 22 Oct 2021 09:57:29 +0200
Message-ID: <20211022075730.484692-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022075730.484692-1-clg@kaod.org>
References: <20211022075730.484692-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b813db52-52ff-4042-b17e-438c42607b89
X-Ovh-Tracer-Id: 7993044915532106604
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvjedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2UnQ3pqvQYHf

Because AddressSpaces must not be sysbus-mapped, commit e9c568dbc225
("hw/arm/aspeed: Do not sysbus-map mmio flash region directly, use
alias") introduced an alias for the flash mmio region.

Using a container is cleaner.

Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20211018132609.160008-5-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  2 +-
 hw/ssi/aspeed_smc.c         | 11 +++++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 75bc793bd269..e26555581996 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -52,8 +52,8 @@ struct AspeedSMCState {
     SysBusDevice parent_obj;
 
     MemoryRegion mmio;
+    MemoryRegion mmio_flash_container;
     MemoryRegion mmio_flash;
-    MemoryRegion mmio_flash_alias;
 
     qemu_irq irq;
 
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 8a988c167604..ff154eb84f85 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1151,14 +1151,17 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
      * window in which the flash modules are mapped. The size and
      * address depends on the SoC model and controller type.
      */
+    memory_region_init(&s->mmio_flash_container, OBJECT(s),
+                       TYPE_ASPEED_SMC ".container",
+                       asc->flash_window_size);
+    sysbus_init_mmio(sbd, &s->mmio_flash_container);
+
     memory_region_init_io(&s->mmio_flash, OBJECT(s),
                           &aspeed_smc_flash_default_ops, s,
                           TYPE_ASPEED_SMC ".flash",
                           asc->flash_window_size);
-    memory_region_init_alias(&s->mmio_flash_alias, OBJECT(s),
-                             TYPE_ASPEED_SMC ".flash",
-                             &s->mmio_flash, 0, asc->flash_window_size);
-    sysbus_init_mmio(sbd, &s->mmio_flash_alias);
+    memory_region_add_subregion(&s->mmio_flash_container, 0x0,
+                                &s->mmio_flash);
 
     /*
      * Let's create a sub memory region for each possible peripheral. All
-- 
2.31.1

