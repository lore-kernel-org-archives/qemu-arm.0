Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp20889njc;
        Wed, 18 Jun 2025 20:44:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLUCex+Pza7wOO7ylUAwiKHmJ0Q7+FNmAeCpR5hRVTwB4VJ5Y+8Nl/Nl7fPiwrUGN/c5nXyO6PeRmyPg==@linaro.org
X-Google-Smtp-Source: AGHT+IEDdSykYLvg86mAQNaE7Wo9gfm1nUJy07P3zlN6L+8ElKsItaxcHYbjr4H1IgUI9gh1EiXy
X-Received: by 2002:a05:620a:1713:b0:7d2:1509:752e with SMTP id af79cd13be357-7d3c6d02558mr3325208785a.58.1750304665405;
        Wed, 18 Jun 2025 20:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750304665; cv=none;
        d=google.com; s=arc-20240605;
        b=iZj61jZIdz9CcCIDi8rpHci840ewGZeV7KYg9ULyomWp6cI4CptC9XqXYV2MLgkKqD
         wZIe/awHN9DmdWUOUG/OlIP8c09iNTHSiRgkzwjKREvBCHYYZUnnXDHID1bNUKuLYdWr
         +qgJhU3kYme3o7gHZQECWUoefOJGnodAx2xcJqFOOSZJ222bGX4esWVjj5iR1o+VWgnx
         iRkb5fntgWuNu0QuW5FzmGxgqQ0IxXpzaP8WVbrIMWSn2DFWhtOFQhQ0fQfPO79QFZck
         tbNSi/UAvNzltnMcwioe07va642eNEAbZZebAW9+0ncWrSFOaAKfhQ4a6Ltie1mH3qKb
         ewsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:feedback-id
         :dkim-signature:dkim-signature;
        bh=D8m5FvmBT94HJSqn2QFS2nGao1//IGrn5cJpwVhntuo=;
        fh=gIB+JsrqaGnqwkE145ZChtMCDKeVcpChcOMK2jdj2/g=;
        b=F0Tre84BIprkutOyi4bh9KbwyHEpF0S+OaKVOGXgk64bVa+XGEuCGde++Fk7aEZ3v8
         B8We+Iv1jdA5QA9Wu7cm0XBNWI18iF3F0Jc1brukGjS/lu8cULLmLk0Y/vvAP8U+vEZx
         jch8cjKzUiGrsYZ5ftZWD2Rcs82hJbFJPAzNjfENklTxIxwiuQkeIqmXyJ6Cmb7Qt8kl
         xCKJyKqVra8BMF1J1yJmPPadWpkGlEg4lftrH9HTyZGRL89YIyieiORbndpuuPUMgfHz
         IKIBfWcTXuAzDxXiIDEsex8HqZKdIg3Qmts8oV5muV2Y9M4/a7TRvlWLaVZs3RiU2ZfW
         JljA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b="i/Mb0N/I";
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=MB5ac1MX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f113e9si1592979885a.458.2025.06.18.20.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Jun 2025 20:44:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b="i/Mb0N/I";
       dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=MB5ac1MX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uS6Bt-0004SD-Mx; Wed, 18 Jun 2025 23:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1uS6Br-0004RQ-N1; Wed, 18 Jun 2025 23:43:51 -0400
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1uS6Bo-00072I-UH; Wed, 18 Jun 2025 23:43:51 -0400
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 249DB25401C1;
 Wed, 18 Jun 2025 23:43:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Wed, 18 Jun 2025 23:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm3; t=1750304624; x=1750391024; bh=D8m5FvmBT94HJSqn2QFS2
 nGao1//IGrn5cJpwVhntuo=; b=i/Mb0N/I90CgaYvZSjE+aZ6p/hMztOGf0tRXm
 Ire81h8C0IEJ726t8iVjGHnplZR3UxzO91xE05G3QNschVgn81FAWI5sTvMjihG8
 TNXrfEhDtBo3EXgv3jcVUkdV/msmXOtyj080HEmm6if/NQbFu5ye34Ye7i7OnUXm
 32AyQ4+eopiBy4WBeLdjkj37v5fwS2Cq1z3vbcL57fKBs16heoN70q+SVB5Y2/YF
 D8F/EvtIkkzNp3G9mFafD+HJWeBIAs0s1DVY2PssLWiIe+OahxkLEyxyksUttoXk
 gebY1jZH1uuWkvEEQnbtqp4cHiDyFZqmOCam/V53T4j2IpJeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1750304624; x=1750391024; bh=D8m5FvmBT94HJSqn2QFS2nGao1//IGrn5cJ
 pwVhntuo=; b=MB5ac1MXtgGjcmJNAnQWfkjmVMmu0Ban2p1605ItVza7lTCunGK
 uyZT4AEp/ht4L72/v854qd8xJiLc2U/FR47cwkita132z7pcVb8cjgegNE/S9LOl
 RxXqoFJMfncrY6R2+3T6LQfZoUjnl1SFZBRweyppYiqZDIkq0nW+joVyQu/fT5wV
 ZUfGyTDUx1LoGiMd8vslafjnDZIjHXgA/S6WSo2jcsQEeKhM1eb6Ryp/FN5SHE1r
 3ks1MioCAr50R6IBypjUz8cWuhIieE6dlOYj/JjAZ9I67EC/MRWMnxoDK+zLuGhY
 9M+y4/D6FbBNDbbWSRud2k/6tjJT8kprnig==
X-ME-Sender: <xms:bodTaO6VO6DPb7Ki2wZ9oapPDIxhJ2aHsRUNSl-bFqQkrsomhE3o_Q>
 <xme:bodTaH7GcKUpj_1UyZ5KRdZmjuGGTDVRtRWR0PYgmSCx5KWSkK1tknCbHxU_vMDlm
 XKIZNik2Yz1oWVvr3c>
X-ME-Received: <xmr:bodTaNcP4vpIIWec8wzvPFX7P3YZWa4M93_qMhf4oBo3P4rgXF3ea4-QLyY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnegfrhhlucfvnfffucdlfeehmdenucfjughrpefhvfevufffkffo
 ggfgsedtkeertdertddtnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoe
 hprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpedttdevtdeg
 fefggeeuheekgfevkefgteehhedvtdekkeefiedutdfhtdffgffhhfenucffohhmrghinh
 epghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
 rghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtoh
 epuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpsghonhiiihhnihesrhgv
 ughhrghtrdgtohhmpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrh
 hordhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshht
 vghvvghnpghlvggvsegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhopehlvggvth
 hrohihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgv
 vgguthgvtghhrdgtohhmpdhrtghpthhtoheprghnughrvgifsegtohguvggtohhnshhtrh
 hutghtrdgtohhmrdgruhdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdprhgt
 phhtthhopehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:bodTaLJUkz22-bkg59Q-uxWzeJ7u1nlL2ZtGmcKRYpVN5XaryRzuSg>
 <xmx:bodTaCLALkKuCSHHg8p1jsUB_UOpTwIIzuZ7z59qE9HaUC_nuxEbdA>
 <xmx:bodTaMz2xEr9heqIKVkD3b8xNOLtkxenlb7QejEY8IHDPXsSwgvQzQ>
 <xmx:bodTaGLuRaq_ODXzYZZ5Jh4NdOm0srNJLQRr8KAPAknqrK4u5e6eQg>
 <xmx:cIdTaMguM89qIJSQ2nkjpcTnyfLuZQ_HPAFTe6y9Pr_U5tFL_Yk6OelP>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 23:43:42 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: Patrick Williams <patrick@stwcx.xyz>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] hw/arm/aspeed: add Catalina machine type
Date: Wed, 18 Jun 2025 23:43:38 -0400
Message-ID: <20250619034338.2678536-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=202.12.124.156; envelope-from=patrick@stwcx.xyz;
 helo=fhigh-b5-smtp.messagingengine.com
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FROM_SUSPICIOUS_NTLD=0.498,
 FROM_SUSPICIOUS_NTLD_FP=1.997, PDS_OTHER_BAD_TLD=1.997, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: aX+n0WDgH8LB

Add the 'catalina-bmc' machine type based on the kernel DTS[1] as of
6.16-rc2.  The i2c model is as complete as the current QEMU models
support, but in some cases I substituted devices that are close enough
for present functionality.  Strap registers are were verified with
hardware.

This has been tested with an openbmc image built from [2].

[1]: https://github.com/torvalds/linux/blob/v6.16-rc2/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
[2]: https://github.com/openbmc/openbmc/commit/5bc73ec261f981d5e586bda5ac78eb0cbd5f92b0

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/Kconfig  |   1 +
 hw/arm/aspeed.c | 200 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 201 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index f543d944c3..6ea86534d5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -532,6 +532,7 @@ config ASPEED_SOC
     select I2C
     select DPS310
     select PCA9552
+    select PCA9554
     select SERIAL_MM
     select SMBUS_EEPROM
     select PCA954X
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d0b333646e..b0965ef8a0 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -19,6 +19,7 @@
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/gpio/pca9552.h"
+#include "hw/gpio/pca9554.h"
 #include "hw/nvram/eeprom_at24c.h"
 #include "hw/sensor/tmp105.h"
 #include "hw/misc/led.h"
@@ -1003,6 +1004,180 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
 }
 
 #define TYPE_TMP421 "tmp421"
+#define TYPE_DS1338 "ds1338"
+
+/* Catalina hardware value */
+#define CATALINA_BMC_HW_STRAP1 0x00002002
+#define CATALINA_BMC_HW_STRAP2 0x00000800
+
+#define CATALINA_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
+
+static void catalina_bmc_i2c_init(AspeedMachineState *bmc)
+{
+    /* Reference from v6.16-rc2 aspeed-bmc-facebook-catalina.dts */
+
+    AspeedSoCState *soc = bmc->soc;
+    I2CBus *i2c[16] = {};
+    I2CSlave *i2c_mux;
+
+    /* busses 0-15 are all used. */
+    for (int i = 0; i < ARRAY_SIZE(i2c); i++) {
+        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
+    }
+
+    /* &i2c0 */
+    /* i2c-mux@71 (PCA9546) on i2c0 */
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9546, 0x71);
+
+    /* i2c-mux@72 (PCA9546) on i2c0 */
+    i2c_mux = i2c_slave_create_simple(i2c[0], TYPE_PCA9546, 0x72);
+
+    /* i2c0mux1ch1 */
+    /* io_expander7 - pca9535@20 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1),
+                            TYPE_PCA9552, 0x20);
+    /* eeprom@50 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x50, 8 * KiB);
+
+    /* i2c-mux@73 (PCA9546) on i2c0 */
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9546, 0x73);
+
+    /* i2c-mux@75 (PCA9546) on i2c0 */
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9546, 0x75);
+
+    /* i2c-mux@76 (PCA9546) on i2c0 */
+    i2c_mux = i2c_slave_create_simple(i2c[0], TYPE_PCA9546, 0x76);
+
+    /* i2c0mux4ch1 */
+    /* io_expander8 - pca9535@21 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 1),
+                            TYPE_PCA9552, 0x21);
+    /* eeprom@50 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 1), 0x50, 8 * KiB);
+
+    /* i2c-mux@77 (PCA9546) on i2c0 */
+    i2c_slave_create_simple(i2c[0], TYPE_PCA9546, 0x77);
+
+
+    /* &i2c1 */
+    /* i2c-mux@70 (PCA9548) on i2c1 */
+    i2c_mux = i2c_slave_create_simple(i2c[1], TYPE_PCA9548, 0x70);
+    /* i2c1mux0ch0 */
+    /* ina238@41 - no model */
+    /* ina238@42 - no model */
+    /* ina238@44 - no model */
+    /* i2c1mux0ch1 */
+    /* ina238@41 - no model */
+    /* ina238@43 - no model */
+    /* i2c1mux0ch4 */
+    /* ltc4287@42 - no model */
+    /* ltc4287@43 - no model */
+
+    /* i2c1mux0ch5 */
+    /* eeprom@54 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 5), 0x54, 8 * KiB);
+    /* tpm75@4f */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), TYPE_TMP75, 0x4f);
+
+    /* i2c1mux0ch6 */
+    /* io_expander5 - pca9554@27 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6),
+                            TYPE_PCA9554, 0x27);
+    /* io_expander6 - pca9555@25 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 6),
+                            TYPE_PCA9552, 0x25);
+    /* eeprom@51 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 6), 0x51, 8 * KiB);
+
+    /* i2c1mux0ch7 */
+    /* eeprom@53 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 7), 0x53, 8 * KiB);
+    /* temperature-sensor@4b - tmp75 */
+    i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 7), TYPE_TMP75, 0x4b);
+
+    /* &i2c2 */
+    /* io_expander0 - pca9555@20 */
+    i2c_slave_create_simple(i2c[2], TYPE_PCA9552, 0x20);
+    /* io_expander0 - pca9555@21 */
+    i2c_slave_create_simple(i2c[2], TYPE_PCA9552, 0x21);
+    /* io_expander0 - pca9555@27 */
+    i2c_slave_create_simple(i2c[2], TYPE_PCA9552, 0x27);
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[2], 0x50, 8 * KiB);
+    /* eeprom@51 */
+    at24c_eeprom_init(i2c[2], 0x51, 8 * KiB);
+
+    /* &i2c5 */
+    /* i2c-mux@70 (PCA9548) on i2c5 */
+    i2c_mux = i2c_slave_create_simple(i2c[5], TYPE_PCA9548, 0x70);
+    /* i2c5mux0ch6 */
+    /* eeprom@52 */
+    at24c_eeprom_init(pca954x_i2c_get_bus(i2c_mux, 6), 0x52, 8 * KiB);
+    /* i2c5mux0ch7 */
+    /* ina230@40 - no model */
+    /* ina230@41 - no model */
+    /* ina230@44 - no model */
+    /* ina230@45 - no model */
+
+    /* &i2c6 */
+    /* io_expander3 - pca9555@21 */
+    i2c_slave_create_simple(i2c[6], TYPE_PCA9552, 0x21);
+    /* rtc@6f - nct3018y */
+    i2c_slave_create_simple(i2c[6], TYPE_DS1338, 0x6f);
+
+    /* &i2c9 */
+    /* io_expander4 - pca9555@4f */
+    i2c_slave_create_simple(i2c[9], TYPE_PCA9552, 0x4f);
+    /* temperature-sensor@4b - tpm75 */
+    i2c_slave_create_simple(i2c[9], TYPE_TMP75, 0x4b);
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[9], 0x50, 8 * KiB);
+    /* eeprom@56 */
+    at24c_eeprom_init(i2c[9], 0x56, 8 * KiB);
+
+    /* &i2c10 */
+    /* temperature-sensor@1f - tpm421 */
+    i2c_slave_create_simple(i2c[10], TYPE_TMP421, 0x1f);
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[10], 0x50, 8 * KiB);
+
+    /* &i2c11 */
+    /* ssif-bmc@10 - no model */
+
+    /* &i2c12 */
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[12], 0x50, 8 * KiB);
+
+    /* &i2c13 */
+    /* eeprom@50 */
+    at24c_eeprom_init(i2c[13], 0x50, 8 * KiB);
+    /* eeprom@54 */
+    at24c_eeprom_init(i2c[13], 0x54, 256);
+    /* eeprom@55 */
+    at24c_eeprom_init(i2c[13], 0x55, 256);
+    /* eeprom@57 */
+    at24c_eeprom_init(i2c[13], 0x57, 256);
+
+    /* &i2c14 */
+    /* io_expander9 - pca9555@10 */
+    i2c_slave_create_simple(i2c[14], TYPE_PCA9552, 0x10);
+    /* io_expander10 - pca9555@11 */
+    i2c_slave_create_simple(i2c[14], TYPE_PCA9552, 0x11);
+    /* io_expander11 - pca9555@12 */
+    i2c_slave_create_simple(i2c[14], TYPE_PCA9552, 0x12);
+    /* io_expander12 - pca9555@13 */
+    i2c_slave_create_simple(i2c[14], TYPE_PCA9552, 0x13);
+    /* io_expander13 - pca9555@14 */
+    i2c_slave_create_simple(i2c[14], TYPE_PCA9552, 0x14);
+    /* io_expander14 - pca9555@15 */
+    i2c_slave_create_simple(i2c[14], TYPE_PCA9552, 0x15);
+
+    /* &i2c15 */
+    /* temperature-sensor@1f - tmp421 */
+    i2c_slave_create_simple(i2c[15], TYPE_TMP421, 0x1f);
+    /* eeprom@52 */
+    at24c_eeprom_init(i2c[15], 0x52, 8 * KiB);
+}
 
 static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
 {
@@ -1585,6 +1760,27 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc,
     aspeed_machine_class_init_cpus_defaults(mc);
 }
 
+static void aspeed_machine_catalina_class_init(ObjectClass *oc,
+                                               const void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "Facebook Catalina BMC (Cortex-A7)";
+    amc->soc_name  = "ast2600-a3";
+    amc->hw_strap1 = CATALINA_BMC_HW_STRAP1;
+    amc->hw_strap2 = CATALINA_BMC_HW_STRAP2;
+    amc->fmc_model = "w25q01jvq";
+    amc->spi_model = NULL;
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC2_ON;
+    amc->i2c_init  = catalina_bmc_i2c_init;
+    mc->auto_create_sdcard = true;
+    mc->default_ram_size = CATALINA_BMC_RAM_SIZE;
+    aspeed_machine_class_init_cpus_defaults(mc);
+    aspeed_machine_ast2600_class_emmc_init(oc);
+}
+
 static void fby35_reset(MachineState *state, ResetType type)
 {
     AspeedMachineState *bmc = ASPEED_MACHINE(state);
@@ -1877,6 +2073,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("bletchley-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_bletchley_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("catalina-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_catalina_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("fby35-bmc"),
         .parent        = MACHINE_TYPE_NAME("ast2600-evb"),
-- 
2.49.0

