Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp677785lfm;
        Fri, 1 May 2020 06:45:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/Lq17GTSsBdjLLapCyzskc5ffI+xG9xnKBNRvca76zk2PJbabQMVowaIOtt/C7jS0GMOy
X-Received: by 2002:a05:620a:41a:: with SMTP id 26mr3489791qkp.421.1588340723441;
        Fri, 01 May 2020 06:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588340723; cv=none;
        d=google.com; s=arc-20160816;
        b=vcCMIbI557l+08dNgWGprI1owbzSyLQLTW6cThY/dQlMMI0SihZa2V/2thSV5mN3Gd
         ZEPkUO2TY8io5T/avNrBEFuaoc01Jl/GX8ycxIbEDbESC9X0aCQRiK7YCtG3Ybv9zXq7
         DCQbxOancIXSgj9FzoAU/REcJ8tmCgNskcf638qoKXRpNWGctfHvKyQ5NxprUagCWVRH
         CGKloSA/mVbgjwlaEqqh6Hrd2KhiC4opkcTHQIOgPEoeao1E+mMrEmd668rXjqtymeUR
         LTRW5OpcLCUxHZlWaKZhoeokaQmFOa/xAK2iIrJr0AXH1LjkvLNtPypCPrYhTP5hTTo9
         XEMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature
         :dkim-signature;
        bh=RlHubz0soz6mBe1C41cTHUPwnqsH7XDvs32vgUJG6/E=;
        b=qrpfgUMifK4JR/Y7GcgPCJETyUW5+98pWRRJwAloQ29HhFhn+Y0eF1huiGIKQc4+zI
         QcqW1NBEc1abjdIPLcmjKFcpSGVP0G2h8e5di2zvTUfZiaZfNMLQq9QwexReDT9achES
         8uBEMrVQ8rsg0jHe+6wMuqCG4T88259FCG8+ewz2iBVaOqazqJsuIbxfor0vBKMBStdy
         Quzk+PwY+YuGPscauusAPd28sYmYMDKQzV3Otw11P/ZRAFA2Gfo0DMY1CRFhbEzslO82
         emt4qutqw3/25ob38jDdEtwokbUYp2HuY2+nTWiF22n5uhtrjf3qQHjkofMFKMkQJ+Ri
         /jkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b="jE/9KC7a";
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=abLfsEQp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id p81si1754570qke.221.2020.05.01.06.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 06:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@stwcx.xyz header.s=fm1 header.b="jE/9KC7a";
       dkim=fail header.i=@messagingengine.com header.s=fm2 header.b=abLfsEQp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUVyk-00073w-QM
	for alex.bennee@linaro.org; Fri, 01 May 2020 09:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53384)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <patrick@stwcx.xyz>) id 1jUTz4-0001Sz-PW
 for qemu-arm@nongnu.org; Fri, 01 May 2020 07:38:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <patrick@stwcx.xyz>) id 1jUTyl-0001bD-CA
 for qemu-arm@nongnu.org; Fri, 01 May 2020 07:37:34 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:35277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patrick@stwcx.xyz>)
 id 1jUTyk-0001UQ-IE; Fri, 01 May 2020 07:37:15 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 76C2D6D6;
 Fri,  1 May 2020 07:37:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 01 May 2020 07:37:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=RlHubz0soz6mBe1C41cTHUPwnq
 sH7XDvs32vgUJG6/E=; b=jE/9KC7amNuAVDe0zk95Si4Ew9ZPQ2aLpGTrAOm32C
 USMk2+KIczYYQya7HXqViv7FypdTmHZbC3yX8mFYNIGe546+Wu1Yxm1syVtfpgj4
 6KUCN5x5oevmL/kD9Q/TzxbjsFbZXL5jvIXrI+ZRSzsFFWbhQYPHQDqBVNVziTx5
 ziL56LXngGPKmEk6UYENeyOxDzXQqiDo9eujzsSyytZbUc335bMwGKGSqqKBU0bd
 8dvKEGHXLVOV4wjVLMKbCIzuzEBk6aK1s/1LPzWKnWgy6vK3U411EeaHGoXA+YiY
 cpvKMjMUCkrcgS8JF1CJXw81UR+kh5HStGGqDLxTPfvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RlHubz0soz6mBe1C4
 1cTHUPwnqsH7XDvs32vgUJG6/E=; b=abLfsEQpabKPtSz4B54+Mx1zIu1G2wtY8
 SE2VZYirB7dScFuquErVXY9OTC2lxbzYJ+e6BXoMGmF4e0NJohd3UyGwq4gl4zAg
 67+t22BRLa+Bdl98/L9zwr4Wlfd4Qo4E976fmgb9YrRo01aOND28XPsFKGjKV6gN
 +Wnye5oS87Al1oT4z4bRx4tt1kcEOgjjbuPyV01OSh8/2OzkgUVGFskp/oEJY+/E
 i6KEUyEyXg9ohX0PslefiaDcYu+yOzKCop6U7oC/Hur+TYMeyFEzTpmItmvGhEoF
 5X9U9aqUQBR4/dLPsAa+f0JKWMr1Lf4LGmX9BonSawZN1kjTCqcJg==
X-ME-Sender: <xms:5QmsXsqDGL0dVn48sXAl_JAVmpG5uwb-rNFxo_IvIfBDWRrnDiz9Uw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieejgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenmh
 hishhsihhnghcuvffquchfihgvlhguucdlfedtmdenfghrlhcuvffnffculdefhedmnego
 vehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgggf
 estdekredtredttdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgr
 thhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnheptdeggeefteejje
 eltdefvedttdfhieffvedvteefvdeljedvheeufeeggfetleffnecuffhomhgrihhnpehg
 ihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdekgedrvdefieenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthif
 tgigrdighiii
X-ME-Proxy: <xmx:5QmsXvyuhD5g_nJ8oi7mYk1jtgySUqgpfd0bKxu96-LxcAM5-nJoBg>
 <xmx:5QmsXhrRdUopnJnCZWETtgZpgOQvWpm1zkRcAdn0JtBu6bPDUCpe9g>
 <xmx:5QmsXk7l2Hn9XTXOr2FwWCmbgPASVLTGXBEQnBt9YxuXSCPPYtSDjg>
 <xmx:5gmsXoKKdDmOssFKeTaBTWJn42KMb8Nj-mXf0m-k4vyFsrQc5oAAeO1AO7o>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA9003280060;
 Fri,  1 May 2020 07:37:08 -0400 (EDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: 
Subject: [PATCH] aspeed: Add support for the sonorapass-bmc board
Date: Fri,  1 May 2020 06:37:04 -0500
Message-Id: <20200501113704.2240698-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18; envelope-from=patrick@stwcx.xyz;
 helo=wnew4-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/01 07:37:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 64.147.123.18
X-Mailman-Approved-At: Fri, 01 May 2020 09:45:07 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Amithash Prasad <amithash@fb.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Vijay Khemka <vijaykhemka@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5h2AQjvmZoHn

Sonora Pass is a 2 socket x86 motherboard designed by Facebook
and supported by OpenBMC.  Strapping configuration was obtained
from hardware and i2c configuration is based on dts found at:

https://github.com/facebook/openbmc-linux/blob/1633c87b8ba7c162095787c988979b748ba65dc8/arch/arm/boot/dts/aspeed-bmc-facebook-sonorapass.dts

Booted a test image of http://github.com/facebook/openbmc to login
prompt.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 hw/arm/aspeed.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index a6a2102a93..09b3277d56 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -84,6 +84,21 @@ struct AspeedBoardState {
         SCU_AST2500_HW_STRAP_ACPI_ENABLE |                              \
         SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER))
 
+/* Sonorapass hardware value: 0xF100D216 */
+#define SONORAPASS_BMC_HW_STRAP1 (                                      \
+        SCU_AST2500_HW_STRAP_SPI_AUTOFETCH_ENABLE |                     \
+        SCU_AST2500_HW_STRAP_GPIO_STRAP_ENABLE |                        \
+        SCU_AST2500_HW_STRAP_UART_DEBUG |                               \
+        SCU_AST2500_HW_STRAP_RESERVED28 |                               \
+        SCU_AST2500_HW_STRAP_DDR4_ENABLE |                              \
+        SCU_HW_STRAP_VGA_CLASS_CODE |                                   \
+        SCU_HW_STRAP_LPC_RESET_PIN |                                    \
+        SCU_HW_STRAP_SPI_MODE(SCU_HW_STRAP_SPI_MASTER) |                \
+        SCU_AST2500_HW_STRAP_SET_AXI_AHB_RATIO(AXI_AHB_RATIO_2_1) |     \
+        SCU_HW_STRAP_VGA_BIOS_ROM |                                     \
+        SCU_HW_STRAP_VGA_SIZE_SET(VGA_16M_DRAM) |                       \
+        SCU_AST2500_HW_STRAP_RESERVED1)
+
 /* Witherspoon hardware value: 0xF10AD216 (but use romulus definition) */
 #define WITHERSPOON_BMC_HW_STRAP1 ROMULUS_BMC_HW_STRAP1
 
@@ -372,6 +387,48 @@ static void swift_bmc_i2c_init(AspeedBoardState *bmc)
     i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 12), "tmp105", 0x4a);
 }
 
+static void sonorapass_bmc_i2c_init(AspeedBoardState *bmc)
+{
+    AspeedSoCState *soc = &bmc->soc;
+
+    // bus 2 :
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2), "tmp105", 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2), "tmp105", 0x49);
+    // bus 2 : pca9546 @ 0x73
+
+    // bus 3 : pca9548 @ 0x70
+
+    // bus 4 :
+    uint8_t *eeprom4_54 = g_malloc0( 8 * 1024 );
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), 0x54,
+                          eeprom4_54);
+    /* PCA9539 @ 0x76, but PCA9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "pca9552", 0x76);
+    /* PCA9539 @ 0x77, but PCA9552 is compatible */
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 4), "pca9552", 0x77);
+
+    // bus 6 :
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), "tmp105", 0x48);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 6), "tmp105", 0x49);
+    // bus 6 : pca9546 @ 0x73
+
+    // bus 8 :
+    uint8_t *eeprom8_56 = g_malloc0( 8 * 1024 );
+    smbus_eeprom_init_one(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), 0x56,
+                          eeprom8_56);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x60);
+    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 8), "pca9552", 0x61);
+    // bus 8 : adc128d818 @ 0x1d
+    // bus 8 : adc128d818 @ 0x1f
+
+    // bus 13 : pca9548 @ 0x71
+    //      - channel 3:
+    //          - tmm421 @ 0x4c
+    //          - tmp421 @ 0x4e
+    //          - tmp421 @ 0x4f
+
+}
+
 static void witherspoon_bmc_i2c_init(AspeedBoardState *bmc)
 {
     AspeedSoCState *soc = &bmc->soc;
@@ -499,6 +556,21 @@ static void aspeed_machine_swift_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size       = 512 * MiB;
 };
 
+static void aspeed_machine_sonorapass_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc       = "OpenPOWER SonoraPass BMC (ARM1176)";
+    amc->soc_name  = "ast2500-a1";
+    amc->hw_strap1 = SONORAPASS_BMC_HW_STRAP1;
+    amc->fmc_model = "mx66l1g45g";
+    amc->spi_model = "mx66l1g45g";
+    amc->num_cs    = 2;
+    amc->i2c_init  = sonorapass_bmc_i2c_init;
+    mc->default_ram_size       = 512 * MiB;
+};
+
 static void aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -563,6 +635,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("swift-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_swift_class_init,
+    }, {
+        .name          = MACHINE_TYPE_NAME("sonorapass-bmc"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_sonorapass_class_init,
     }, {
         .name          = MACHINE_TYPE_NAME("witherspoon-bmc"),
         .parent        = TYPE_ASPEED_MACHINE,
-- 
2.26.2

