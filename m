Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1839358ejc;
        Mon, 16 Jan 2023 15:57:02 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuYTejTaooahl8opylfHnxXHylCBejJtW3sHoiS2eMYoKUvnlKJg2hGmIBuVVYqSqcdXn3b
X-Received: by 2002:a0c:f90d:0:b0:535:17e2:f15d with SMTP id v13-20020a0cf90d000000b0053517e2f15dmr1995565qvn.16.1673913422802;
        Mon, 16 Jan 2023 15:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673913422; cv=none;
        d=google.com; s=arc-20160816;
        b=QRZ5rO9D+Ux7zozzSKt1ltXFeDW2+d4aaPdInIHC81fUoSB82JvvserJCcpsF0091r
         SIO+0n6t0dNzbCxH1wlKPbs5i8n1zjKVdbWI4taZArcvokDCM2ha9zz9Y2F0OY3/Wq0V
         e0CPyg8h2oNZocZo2kfBQYQywXDUb5QKOgYCLEeJZP2VvKYYlbogK0gmV2WjYF7XkRbv
         xF9ys0mByysgo88kEGa2N1dHPJfRJwTmLeA3M5gQV+QnHa4z6RmCj1jJHZt6UaBggMhj
         QmquwPfYL5mqy2nQKjo5X+sMR57eaqe9uGIrz3XNmpueVSHMTtTn/lRe3l05m7tg8Pcj
         2FwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=oS85m1Od87DSND/bVoRcFePWoS1vrNT/vyuukLNymLo=;
        b=xbbMIb8/tdT7BCaJpcxGt1nIA0WeiJoGyRKABKEtYO982GQiBwUacO2ExP54PYVWRK
         VRMOl5rbxakN5/vxKn5ney0uurwITVKqEfxOWOpEpYjVVUcBOfqS9rDNnUxME76SAKmD
         nn5+VjKT1P5rHXb6NPTGoPLGIIt7W7nLzy9XGPcuCG6ubuSlk1uNJngaDW6LFdn5n/Qn
         UQL++mTBP4hNnObUW+FpjeHOqGTcg1tXvDi16maa9BSU4we55PliyQjktXj+oiv8RWXa
         5XWsS6rPXAU+MIk5yaoH73wK9ixvh/11Pui6AFn+X0lOchHpXPyTXA+PfDZsMEEYWN+K
         2LWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=gpZH60O+;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=QIkMWJ1J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7-20020a05620a248700b0070616e80d31si2336856qkn.322.2023.01.16.15.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jan 2023 15:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=gpZH60O+;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=QIkMWJ1J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHZKz-0002pD-RR; Mon, 16 Jan 2023 18:56:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKx-0002om-OY; Mon, 16 Jan 2023 18:56:24 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHZKv-0003nl-L0; Mon, 16 Jan 2023 18:56:23 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 7E191320093F;
 Mon, 16 Jan 2023 18:56:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 16 Jan 2023 18:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1673913379; x=1673999779; bh=oS
 85m1Od87DSND/bVoRcFePWoS1vrNT/vyuukLNymLo=; b=gpZH60O+LiD4UO6/ua
 C7SufXS4eU1WhfpDY8g1zr3syXcQvTcRJDPqmSSRo71vhjIUHiZMMSLRJ/vsh2QX
 P2lmY2EpbnswnmCKDfDyozImNPtL2wCAmoe1r4uY8nv51RUgYsPCzebnW9Ot+5KP
 zrwdkzkBLvEf5OiL+AKSOG8APmB+jTQicKoS80rGINrL9YS62zlWxfOL6HYKRIEN
 3d5US7D01HXxXEt8WTMDqBmKBUdm1hJI9lx9G7o4jrlyejPLhcrGz5F0FQVkEPkM
 DNdHNsJkt3Fj7cM/QGFiggBNEWYQh7PwZ7OQuVUGwa6EHx35vv3wKWIztcg4vGn1
 DtwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1673913379; x=1673999779; bh=oS85m1Od87DSN
 D/bVoRcFePWoS1vrNT/vyuukLNymLo=; b=QIkMWJ1J6EGzbNDLz9mzLM32WJqN2
 /HQvxwycb2JFbjFtdvC6xNn0fqyb6NxAPrsfUjaTQej3jNXvJZ29/PrkcLjSU1jI
 v3DIP2r5PELaTMqZDIteO5y74wSN0/YrmX9YikaVSph/NuY/GTWK6xk9SQik1bxx
 hW0b+adlPa+9oYqsSrDW/ArUnAc26lxk+mIkwz6yeUHs5F/bFfbhNn/a6n4BUHcd
 JxnfutzxTOvU3S15Jn2xf25bCo+n20T+x1jxYBCXhhphl/7nclR1zSg3tzE/qFG/
 MYrwx3q+mJKKzslgRONNGrwOOHXlH1Ynr+nafwBkrhFPNQnJZalvjGnlA==
X-ME-Sender: <xms:IuTFY2MesWeXKtTrmsmnhhRgEMDd8hq8-3KMiwrWuFFyG6sPuEG6Jg>
 <xme:IuTFY0_-8GyveC1Ppb50XFmsjwYU85XHuY7KkirZNMI6aCcrYGLC_adsQTAipHXc2
 4QCgSEeSE0sxls93cY>
X-ME-Received: <xmr:IuTFY9SZS9GD_qZM08T2Wv2IeWAp7bzPSU0t0lx5JNSW5o90I6AaiVlmJG1ji8zXZhnhzneQdKsTToSix57tQSrVT54H60DtXxZHsGyqxTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddthedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepvdfghffgkeehheeggeeuvdeftefh
 ieefleffgfeuveduueeigfffffdvjeevfeelnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 vghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:IuTFY2tjuPVRGsIuwAa6POCVAvZkwN3YFwe809uGFlGDFrMjrut_0A>
 <xmx:IuTFY-c6vPVZSwHc9cyT-EDp0JFNvKd1S_UVRwD3Gw5PY9Q9yFEEwg>
 <xmx:IuTFY606691iK0QmeXDVfbl1KKEbCXD6rxAO4EXdnEHdln_aE1EBuQ>
 <xmx:I-TFY0u6Yll0ScwBFX10RHpu8Mt6s-pa_1mDTQXzzAPT1F4hhyHaUA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jan 2023 18:56:17 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] hw/arm/aspeed: Add aspeed_eeprom.c
Date: Mon, 16 Jan 2023 15:56:03 -0800
Message-Id: <20230116235604.55099-5-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116235604.55099-1-peter@pjd.dev>
References: <20230116235604.55099-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FitATCN+fxsb

- Create aspeed_eeprom.c and aspeed_eeprom.h
- Include aspeed_eeprom.c in CONFIG_ASPEED meson source files
- Include aspeed_eeprom.h in aspeed.c
- Add fby35_bmc_fruid data
- Use new at24c_eeprom_init_rom helper to initialize BMC FRUID EEPROM with data
  from aspeed_eeprom.c

wget https://github.com/facebook/openbmc/releases/download/openbmc-e2294ff5d31d/fby35.mtd
qemu-system-aarch64 -machine fby35-bmc -nographic -mtdblock fby35.mtd
...
user: root
pass: 0penBmc
...
root@bmc-oob:~# fruid-util bmc

FRU Information           : BMC
---------------           : ------------------
Board Mfg Date            : Mon Jan 10 21:42:00 2022
Board Mfg                 : XXXXXX
Board Product             : BMC Storage Module
Board Serial              : XXXXXXXXXXXXX
Board Part Number         : XXXXXXXXXXXXXX
Board FRU ID              : 1.0
Board Custom Data 1       : XXXXXXXXX
Board Custom Data 2       : XXXXXXXXXXXXXXXXXX
Product Manufacturer      : XXXXXX
Product Name              : Yosemite V3.5 EVT2
Product Part Number       : XXXXXXXXXXXXXX
Product Version           : EVT2
Product Serial            : XXXXXXXXXXXXX
Product Asset Tag         : XXXXXXX
Product FRU ID            : 1.0
Product Custom Data 1     : XXXXXXXXX
Product Custom Data 2     : Config A

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
---
 hw/arm/aspeed.c        |  4 +++-
 hw/arm/aspeed_eeprom.c | 51 ++++++++++++++++++++++++++++++++++++++++++
 hw/arm/aspeed_eeprom.h | 11 +++++++++
 hw/arm/meson.build     |  1 +
 4 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/aspeed_eeprom.c
 create mode 100644 hw/arm/aspeed_eeprom.h

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index c929c61d582a..11e423db4538 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -14,6 +14,7 @@
 #include "hw/arm/boot.h"
 #include "hw/arm/aspeed.h"
 #include "hw/arm/aspeed_soc.h"
+#include "hw/arm/aspeed_eeprom.h"
 #include "hw/i2c/i2c_mux_pca954x.h"
 #include "hw/i2c/smbus_eeprom.h"
 #include "hw/misc/pca9552.h"
@@ -942,7 +943,8 @@ static void fby35_i2c_init(AspeedMachineState *bmc)
     at24c_eeprom_init(i2c[6], 0x51, 128 * KiB);
     at24c_eeprom_init(i2c[8], 0x50, 32 * KiB);
     at24c_eeprom_init(i2c[11], 0x51, 128 * KiB);
-    at24c_eeprom_init(i2c[11], 0x54, 128 * KiB);
+    at24c_eeprom_init_rom(i2c[11], 0x54, 128 * KiB, fby35_bmc_fruid,
+                          fby35_bmc_fruid_size);
 
     /*
      * TODO: There is a multi-master i2c connection to an AST1030 MiniBMC on
diff --git a/hw/arm/aspeed_eeprom.c b/hw/arm/aspeed_eeprom.c
new file mode 100644
index 000000000000..a5ffa959927b
--- /dev/null
+++ b/hw/arm/aspeed_eeprom.c
@@ -0,0 +1,51 @@
+/* Copyright (c) Meta Platforms, Inc. and affiliates. */
+
+#include "aspeed_eeprom.h"
+
+const uint8_t fby35_bmc_fruid[] = {
+    0x01, 0x00, 0x00, 0x01, 0x0d, 0x00, 0x00, 0xf1, 0x01, 0x0c, 0x00, 0x36,
+    0xe6, 0xd0, 0xc6, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x42, 0x4d,
+    0x43, 0x20, 0x53, 0x74, 0x6f, 0x72, 0x61, 0x67, 0x65, 0x20, 0x4d, 0x6f,
+    0x64, 0x75, 0x6c, 0x65, 0xcd, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e,
+    0x30, 0xc9, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc1, 0x39, 0x01, 0x0c, 0x00, 0xc6,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xd2, 0x59, 0x6f, 0x73, 0x65, 0x6d,
+    0x69, 0x74, 0x65, 0x20, 0x56, 0x33, 0x2e, 0x35, 0x20, 0x45, 0x56, 0x54,
+    0x32, 0xce, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0xc4, 0x45, 0x56, 0x54, 0x32, 0xcd, 0x58, 0x58,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc7,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc3, 0x31, 0x2e, 0x30, 0xc9,
+    0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0x58, 0xc8, 0x43, 0x6f,
+    0x6e, 0x66, 0x69, 0x67, 0x20, 0x41, 0xc1, 0x45, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
+};
+
+const uint32_t fby35_bmc_fruid_size = sizeof(fby35_bmc_fruid);
diff --git a/hw/arm/aspeed_eeprom.h b/hw/arm/aspeed_eeprom.h
new file mode 100644
index 000000000000..89860e37d007
--- /dev/null
+++ b/hw/arm/aspeed_eeprom.h
@@ -0,0 +1,11 @@
+/* Copyright (c) Meta Platforms, Inc. and affiliates. */
+
+#ifndef ASPEED_EEPROM_H
+#define ASPEED_EEPROM_H
+
+#include "qemu/osdep.h"
+
+extern const uint8_t fby35_bmc_fruid[];
+extern const uint32_t fby35_bmc_fruid_size;
+
+#endif
diff --git a/hw/arm/meson.build b/hw/arm/meson.build
index 76d4d650e42e..f70e8cfd4545 100644
--- a/hw/arm/meson.build
+++ b/hw/arm/meson.build
@@ -53,6 +53,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
   'aspeed.c',
   'aspeed_ast2600.c',
   'aspeed_ast10x0.c',
+  'aspeed_eeprom.c',
   'fby35.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2.c'))
 arm_ss.add(when: 'CONFIG_MPS2', if_true: files('mps2-tz.c'))
-- 
2.39.0

