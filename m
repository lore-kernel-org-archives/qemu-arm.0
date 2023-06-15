Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp891516ejt;
        Thu, 15 Jun 2023 10:36:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6mx6EoyrNzeqpk3RM0XTcU5xT6DJh5pxk06oxGcdD4wnJMNe33L4sN2GidbBNZNYmM+OBD
X-Received: by 2002:a05:622a:120f:b0:3f6:b055:81fc with SMTP id y15-20020a05622a120f00b003f6b05581fcmr5352808qtx.25.1686850613723;
        Thu, 15 Jun 2023 10:36:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686850613; cv=none;
        d=google.com; s=arc-20160816;
        b=U22WzBp8DKobn1IOy5XYhMNNN9nrcXaormuPpg5GPx9w/3WnNOwggB0+v4vgbrd96E
         Vpm3gCdru2yBBnrquynIm04pyV3PXoz9xraH5wW+htZiz8r8QzAbv/fB5Y+1ZBLs5+eK
         uTgNXaSATUhH6D0qtF9tM1UXlxJKsbTdAwlN6Ka8YXkfXwsZkR9DDWlkagFBpAsVRXXx
         /QSk6thbUPU3EsI4Dzfv/mUtvGibaIfqXtupzdVIYVaeL3ypDrhWGQBEoASkXvRSDiol
         gh+4f7uE9OJ5DxGTgikcUk9+rJJilJIES3lPX0Y0w7Vzi4oeniso5p8DAAIXhQa252j1
         TLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=8/auOvs9YT2Zm5u5WZJ6ycZsM2PjobxTz/PAO1eAjEQ=;
        b=s90OEdALa7ROzSkA2sf5lh9lU68kY33PW/cZ+orsbaG1ZK2xGEH2FhxOavQ9qytYs0
         mEHZT514AG8Xfj5Aawr9M4NTf4dlW7HbrQihZCSRmZeRjEAzsh1lhQhQq8705d0VFPPX
         lzgj0hBI0sLD134LD8tW9qvnbpg9K+xSzOV5ZqvQWclDKRxhtVsKOlXxIswuKYdwOmLs
         ozi4+NvBSjzZMMJ1iqblcuWGZvQ/ZMhrvGVwr04hmvQydh+LXhPsPWkh+qslUPi3oGXg
         0cr/4V+iRz0R0fgW4byXFIhmzbHW50akuPNZMbamd/8ckWAacP3OyqBnfVi9yGQmEFtv
         2Tqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020ac85fd1000000b003f9c7779039si10045356qta.415.2023.06.15.10.36.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Jun 2023 10:36:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9qt8-0000gC-W2; Thu, 15 Jun 2023 13:36:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qt6-0000e6-6u; Thu, 15 Jun 2023 13:36:00 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>)
 id 1q9qt2-0007k2-O6; Thu, 15 Jun 2023 13:35:59 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4QhqFj4ZFlz4x0G;
 Fri, 16 Jun 2023 03:35:53 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhqFg1B2Mz4x0H;
 Fri, 16 Jun 2023 03:35:50 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Abhishek Singh Dagur <abhishek@drut.io>, Joel Stanley <joel@jms.id.au>
Subject: [PULL 5/6] aspeed: Introduce a "bmc-console" machine option
Date: Thu, 15 Jun 2023 19:35:24 +0200
Message-Id: <20230615173525.428831-6-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615173525.428831-1-clg@kaod.org>
References: <20230615173525.428831-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=xCJj=CD=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: G76IGMIv9gAW

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
Reviewed-by: Joel Stanley <joel@jms.id.au>
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
index 76a1e7303de1..6880998484cd 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -42,6 +42,7 @@ struct AspeedMachineState {
     AspeedSoCState soc;
     MemoryRegion boot_rom;
     bool mmio_exec;
+    uint32_t uart_chosen;
     char *fmc_model;
     char *spi_model;
 };
@@ -333,10 +334,11 @@ static void connect_serial_hds_to_uarts(AspeedMachineState *bmc)
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
@@ -1078,6 +1080,35 @@ static void aspeed_set_spi_model(Object *obj, const char *value, Error **errp)
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
@@ -1086,6 +1117,11 @@ static void aspeed_machine_class_props_init(ObjectClass *oc)
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

