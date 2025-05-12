Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2587351njb;
        Mon, 12 May 2025 02:11:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVF6PF6N6MeIL8xNgQWcrpuaU4OvQxsbTPbvUa9UFVYALRv6/X/6jiJN/GI95BLh65belDpSe9GgaD7ZA==@linaro.org
X-Google-Smtp-Source: AGHT+IEXox6a0ZXIzX1hIm5N4DEcqZ3e/SyOtr5VYFJ2qqFRZuACULX8F9KPHSTIPnBK3qs8s5Cb
X-Received: by 2002:a05:622a:2444:b0:476:c650:9839 with SMTP id d75a77b69052e-494527f3c3cmr204186281cf.51.1747041064518;
        Mon, 12 May 2025 02:11:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747041064; cv=none;
        d=google.com; s=arc-20240605;
        b=fLNyW+NTxjEiOEtbWYhd5S24Gj/xLVMUKByrINCTtMB/UCQBM6JLmNfKWlO22uGRvQ
         9FAlWGiw1k3YWibv3Sp4Lm9BvkTrJFKhkZc86pLs108FFmcHQUUze+rQZgk7AXwAGpak
         mGukRz7FcbCLM0nUIEu4SbVmNHAd4k4D2G2Rz63XKIPgb5weB9zBD9w2j+8x8uMKksYO
         U2zMd8b73oHl2hmdD8KVE8zCuJLs6bOpaVlEWdTI+9FTHdcFm+aSIu6YqwLQtfyh7GfZ
         FywjI7Ec2bAHPUsVf0ur3r57a6zdWmqaZkzjbLY6ozkni7GSy4hKnpj0XQVkp/80OzWD
         xz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=6NBYXny2epADwo70xdU179QhpvQzRT699Zd2WDQNitA=;
        fh=3E+GgkJ59sv88GyUpaKWpV4DoJlJz+B5Ev7H4uQXan0=;
        b=A7dzSGoKEZlIy2R2Jk+QtGnswhJ/LuzZ47n7WsZ6a6z4lAYNJ+zThm8hQAAuzdpUm5
         kEh8nG3uO5/f/X3S/o8dFPZ25ZYQ/ZovVuxZ/M3wl+0OwlgLvuHT0x4B7O33QW2YKdOd
         5mf/K5KL44XDkwW5AijWK2hnug5qW2zi0NNBUjYxmBf4GyhC10ssDCFvikF7gPXKx+76
         kh8n+6Z4Yf0ehcfF2Ss19uRlJKPCte5d66qkjmLUTAlc8c4gTtEuJMQgDIFS5Vb54Ra+
         NLidE1cBPfG7BtLP4H1mUOluZgdQov3E8DZd4BhVRs98PYf+rC6mP63mJBwV77uRaTmX
         QgcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452580d45si82750361cf.420.2025.05.12.02.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 02:11:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEPBP-0005X5-5r; Mon, 12 May 2025 05:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uEPBJ-0005Tl-BE; Mon, 12 May 2025 05:10:41 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kane_chen@aspeedtech.com>)
 id 1uEPBF-00056F-6Y; Mon, 12 May 2025 05:10:39 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 12 May
 2025 17:10:15 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 12 May 2025 17:10:15 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, "open
 list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>
Subject: [PATCH v4 3/3] hw/arm: Integrate ASPEED OTP memory into AST10x0 and
 AST2600 SoCs
Date: Mon, 12 May 2025 17:10:13 +0800
Message-ID: <20250512091014.3454083-4-kane_chen@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512091014.3454083-1-kane_chen@aspeedtech.com>
References: <20250512091014.3454083-1-kane_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=kane_chen@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Kane Chen <kane_chen@aspeedtech.com>
From:  Kane Chen via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SyRyFGzy+gG+

From: Kane-Chen-AS <kane_chen@aspeedtech.com>

Expose an "otpmem" machine parameter to load an external OTP memory image
and enable OTP functionality in supported SoCs.

- Adds object property and backend connection logic for AST1030 and AST2600
- Allows disabling OTP feature via has_otpmem attribute
- Supports use cases involving preconfigured OTP content for boot-time behavior

To create a default OTP memory image with programmable and unprogrammable
bit patterns, run the following:

```bash
for i in $(seq 1 2048); do
  printf '\x00\x00\x00\x00\xff\xff\xff\xff'
done > otpmem.img
```

Use the otpmem parameter to load this into the guest:
```
./qemu-system-arm \
  -machine ast2600-evb,otpmem=otpmem.img \
  ...
```

Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
---
 hw/arm/aspeed.c              | 20 ++++++++++++++++++++
 hw/arm/aspeed_ast10x0.c      |  2 +-
 hw/arm/aspeed_ast2600.c      |  2 +-
 hw/misc/aspeed_sbc.c         | 18 ++++++++++++++++++
 include/hw/misc/aspeed_sbc.h |  1 +
 5 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d0b333646e..18e512e83b 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -47,6 +47,7 @@ struct AspeedMachineState {
     uint32_t uart_chosen;
     char *fmc_model;
     char *spi_model;
+    char *otpmem;
     uint32_t hw_strap1;
 };
 
@@ -1199,6 +1200,21 @@ static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
     bmc->uart_chosen = val + ASPEED_DEV_UART0;
 }
 
+static char *aspeed_get_otpmem(Object *obj, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    return g_strdup(bmc->otpmem);
+}
+
+static void aspeed_set_otpmem(Object *obj, const char *value, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+
+    g_free(bmc->otpmem);
+    bmc->otpmem = g_strdup(value);
+}
+
 static void aspeed_machine_class_props_init(ObjectClass *oc)
 {
     object_class_property_add_bool(oc, "execute-in-place",
@@ -1220,6 +1236,10 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
                                    aspeed_set_spi_model);
     object_class_property_set_description(oc, "spi-model",
                                           "Change the SPI Flash model");
+    object_class_property_add_str(oc, "otpmem", aspeed_get_otpmem,
+                                   aspeed_set_otpmem);
+    object_class_property_set_description(oc, "otpmem",
+                                          "Set OTP Memory type");
 }
 
 static void aspeed_machine_class_init_cpus_defaults(MachineClass *mc)
diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index e6e1ee63c1..c446e70b24 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -154,7 +154,7 @@ static void aspeed_soc_ast1030_init(Object *obj)
 
     object_initialize_child(obj, "peci", &s->peci, TYPE_ASPEED_PECI);
 
-    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_AST10X0_SBC);
 
     for (i = 0; i < sc->wdts_num; i++) {
         snprintf(typename, sizeof(typename), "aspeed.wdt-%s", socname);
diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
index d12707f0ab..59ffd41a4a 100644
--- a/hw/arm/aspeed_ast2600.c
+++ b/hw/arm/aspeed_ast2600.c
@@ -261,7 +261,7 @@ static void aspeed_soc_ast2600_init(Object *obj)
 
     object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
 
-    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_SBC);
+    object_initialize_child(obj, "sbc", &s->sbc, TYPE_ASPEED_AST2600_SBC);
 
     object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
     object_initialize_child(obj, "video", &s->video, TYPE_UNIMPLEMENTED_DEVICE);
diff --git a/hw/misc/aspeed_sbc.c b/hw/misc/aspeed_sbc.c
index 237a8499d9..2ff736bbf5 100644
--- a/hw/misc/aspeed_sbc.c
+++ b/hw/misc/aspeed_sbc.c
@@ -341,8 +341,10 @@ static const TypeInfo aspeed_sbc_info = {
 static void aspeed_ast2600_sbc_class_init(ObjectClass *klass, const void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSBCClass *sc = ASPEED_SBC_CLASS(klass);
 
     dc->desc = "AST2600 Secure Boot Controller";
+    sc->has_otpmem = true;
 }
 
 static const TypeInfo aspeed_ast2600_sbc_info = {
@@ -351,9 +353,25 @@ static const TypeInfo aspeed_ast2600_sbc_info = {
     .class_init = aspeed_ast2600_sbc_class_init,
 };
 
+static void aspeed_ast10x0_sbc_class_init(ObjectClass *klass, const void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    AspeedSBCClass *sc = ASPEED_SBC_CLASS(klass);
+
+    dc->desc = "AST10X0 Secure Boot Controller";
+    sc->has_otpmem = true;
+}
+
+static const TypeInfo aspeed_ast10x0_sbc_info = {
+    .name = TYPE_ASPEED_AST10X0_SBC,
+    .parent = TYPE_ASPEED_SBC,
+    .class_init = aspeed_ast10x0_sbc_class_init,
+};
+
 static void aspeed_sbc_register_types(void)
 {
     type_register_static(&aspeed_ast2600_sbc_info);
+    type_register_static(&aspeed_ast10x0_sbc_info);
     type_register_static(&aspeed_sbc_info);
 }
 
diff --git a/include/hw/misc/aspeed_sbc.h b/include/hw/misc/aspeed_sbc.h
index 667d6088c0..34881ce3ec 100644
--- a/include/hw/misc/aspeed_sbc.h
+++ b/include/hw/misc/aspeed_sbc.h
@@ -14,6 +14,7 @@
 
 #define TYPE_ASPEED_SBC "aspeed.sbc"
 #define TYPE_ASPEED_AST2600_SBC TYPE_ASPEED_SBC "-ast2600"
+#define TYPE_ASPEED_AST10X0_SBC TYPE_ASPEED_SBC "-ast10X0"
 OBJECT_DECLARE_TYPE(AspeedSBCState, AspeedSBCClass, ASPEED_SBC)
 
 #define ASPEED_SBC_NR_REGS (0x93c >> 2)
-- 
2.43.0

