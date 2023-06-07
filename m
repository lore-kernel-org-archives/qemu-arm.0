Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp4319ejb;
        Tue, 6 Jun 2023 21:42:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6QwfMwNeHAX2ht0uQXD4IfuvGPra4wpRfMWslCIIZyJPvaOKfp2l3ne6xll4ZQqvhSoWhs
X-Received: by 2002:a05:620a:4548:b0:75d:59f0:8f35 with SMTP id u8-20020a05620a454800b0075d59f08f35mr990490qkp.28.1686112936090;
        Tue, 06 Jun 2023 21:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686112936; cv=none;
        d=google.com; s=arc-20160816;
        b=K/0x1mvpN/KcbSFv1YIBq1KbXsmq0gHXbGx/WTjq0WQLbt2zU9IWCUThTfYggOEg86
         ZAqSCMk/rXnYpVrOhvpmgyVEwcnJw/hrfPV56yAORt0gDvHGGIjT7cQVGQbUt/rsMAxY
         j6LM2LA3ldnutqB5e/tIpShPFPnNcS9RZZRRnFIB8J2aSl1g1awFBo4jSSP0QxKadliO
         wvba2mGoCwcDHIBYvAtsZd4JD0Jhza3dWdD0GpD3MdnFkHNjpabRTLhvp62evFZNzSHn
         SWdL8Z7hjU8qMzP24rknLMkKBdee/bjb8ecgkklEF28WEBil5tFfU7rPXwgk8KVND2gc
         7b5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=K4DJtFJ2OQNuHG/vCdEufEi+oC3kuau7xA/wJqafWFc=;
        b=WnVd34LMvaUhebrGEbcvzO7wwtrNtU5k+tEPz4y653OMwL1ud93OtE9nIq4SzHFCYp
         ABPDYIm/CQ9uO+gzBbKNpl59foZVVIAgFFENmCoYARcVhQIH9qWWfNKQDb+oDpdSPMwd
         xq/15sulApJE8bRa/h40bz2AE/nTT5XjGOOmRoPta/3vB3OKoIHBN7IY5rCfO2rqIDET
         JFVr0rk+1u2eUi/ZqFHcmv4lGEX9HwruWQ4pOM7JqXFi7ciWS+lZ9IHDBiFscvX8cHkC
         d8XLs20vebiPvw+GuCuAi+P5vP5fSzZSv5CnSU/mBRndeyxRCDywBjG4TYIgFy3FzqPI
         zAHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc8-20020a05620a520800b0075cc24a95d7si6848068qkb.216.2023.06.06.21.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 21:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6kyP-0001v9-Qx; Wed, 07 Jun 2023 00:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kyN-0001sU-QT; Wed, 07 Jun 2023 00:40:39 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>)
 id 1q6kyL-0003tM-M7; Wed, 07 Jun 2023 00:40:39 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQq2JhVz4x4F;
 Wed,  7 Jun 2023 14:40:35 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQm2rbCz4x3g;
 Wed,  7 Jun 2023 14:40:32 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Abhishek Singh Dagur <abhishek@drut.io>
Subject: [PATCH v2 11/12] aspeed: Introduce a "bmc-console" machine option
Date: Wed,  7 Jun 2023 06:39:42 +0200
Message-Id: <20230607043943.1837186-12-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607043943.1837186-1-clg@kaod.org>
References: <20230607043943.1837186-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=5JAy=B3=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: +yQY2mGbE/uo

Most of the Aspeed machines use the UART5 device for the boot console,
and QEMU connects the first serial Chardev to this SoC device for this
purpose. See routine connect_serial_hds_to_uarts().

Nevertheless, some machines use another boot console, such as the fuji,
and commit 5d63d0c76c ("hw/arm/aspeed: Allow machine to set UART
default") introduced a SoC class attribute 'uart_default' and property
to be able to change the boot console device. It was later changed by
commit d2b3eaefb4 ("aspeed: Refactor UART init for multi-SoC machines").

The "bmc-console" machine option goes a step further and lets the user define
the UART device from the QEMU command line without introducing a new
machine definition. For instance, to use device UART3 (mapped on
/dev/ttyS2 under Linux) instead of the default UART5, one would use :

  -M ast2500-evb,bmc-console=uart3

Cc: Abhishek Singh Dagur <abhishek@drut.io>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 docs/system/arm/aspeed.rst | 11 +++++++++++
 hw/arm/aspeed.c            | 40 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index d4e293e7f986..80538422a1a4 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -122,6 +122,11 @@ Options specific to Aspeed machines are :
 
  * ``spi-model`` to change the SPI Flash model.
 
+ * ``bmc-console`` to change the default console device. Most of the
+   machines use the ``UART5`` device for a boot console, which is
+   mapped on ``/dev/ttyS4`` under Linux, but it is not always the
+   case.
+
 For instance, to start the ``ast2500-evb`` machine with a different
 FMC chip and a bigger (64M) SPI chip, use :
 
@@ -129,6 +134,12 @@ FMC chip and a bigger (64M) SPI chip, use :
 
   -M ast2500-evb,fmc-model=mx25l25635e,spi-model=mx66u51235f
 
+To change the boot console and use device ``UART3`` (``/dev/ttyS2``
+under Linux), use :
+
+.. code-block:: bash
+
+  -M ast2500-evb,bmc-console=uart3
 
 Aspeed minibmc family boards (``ast1030-evb``)
 ==================================================================
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 8beed0c2a66e..d3e58936e68a 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -43,6 +43,7 @@ struct AspeedMachineState {
     AspeedSoCState soc;
     MemoryRegion boot_rom;
     bool mmio_exec;
+    uint32_t uart_chosen;
     char *fmc_model;
     char *spi_model;
 };
@@ -331,10 +332,11 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
     AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
     AspeedSoCState *s = &bmc->soc;
     AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
+    int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
 
-    aspeed_soc_uart_set_chr(s, amc->uart_default, serial_hd(0));
+    aspeed_soc_uart_set_chr(s, uart_chosen, serial_hd(0));
     for (int i = 1, uart = ASPEED_DEV_UART1; i < sc->uarts_num; i++, uart++) {
-        if (uart == amc->uart_default) {
+        if (uart == uart_chosen) {
             continue;
         }
         aspeed_soc_uart_set_chr(s, uart, serial_hd(i));
@@ -1079,6 +1081,35 @@ static void aspeed_set_spi_model(Object *obj, const char *value, Error **errp)
     bmc->spi_model = g_strdup(value);
 }
 
+static char *aspeed_get_bmc_console(Object *obj, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
+    int uart_chosen = bmc->uart_chosen ? bmc->uart_chosen : amc->uart_default;
+
+    return g_strdup_printf("uart%d", uart_chosen - ASPEED_DEV_UART1 + 1);
+}
+
+static void aspeed_set_bmc_console(Object *obj, const char *value, Error **errp)
+{
+    AspeedMachineState *bmc = ASPEED_MACHINE(obj);
+    AspeedMachineClass *amc = ASPEED_MACHINE_GET_CLASS(bmc);
+    AspeedSoCClass *sc = ASPEED_SOC_CLASS(object_class_by_name(amc->soc_name));
+    int val;
+
+    if (sscanf(value, "uart%u", &val) != 1) {
+        error_setg(errp, "Bad value for \"uart\" property");
+        return;
+    }
+
+    /* The number of UART depends on the SoC */
+    if (val < 1 || val > sc->uarts_num) {
+        error_setg(errp, "\"uart\" should be in range [1 - %d]", sc->uarts_num);
+        return;
+    }
+    bmc->uart_chosen = ASPEED_DEV_UART1 + val - 1;
+}
+
 static void aspeed_machine_class_props_init(ObjectClass *oc)
 {
     object_class_property_add_bool(oc, "execute-in-place",
@@ -1087,6 +1118,11 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
     object_class_property_set_description(oc, "execute-in-place",
                            "boot directly from CE0 flash device");
 
+    object_class_property_add_str(oc, "bmc-console", aspeed_get_bmc_console,
+                                  aspeed_set_bmc_console);
+    object_class_property_set_description(oc, "bmc-console",
+                           "Change the default UART to \"uartX\"");
+
     object_class_property_add_str(oc, "fmc-model", aspeed_get_fmc_model,
                                    aspeed_set_fmc_model);
     object_class_property_set_description(oc, "fmc-model",
-- 
2.40.1

