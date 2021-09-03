Received: by 2002:a0c:ec8e:0:0:0:0:0 with SMTP id u14csp747921qvo;
        Fri, 3 Sep 2021 08:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzguEOu/wCl9PVU6YVJmxxCSB4r19fIMuQ3PYNOWbr+p2kYhpXD8zd5EaC3ePUNMfyuKwBj
X-Received: by 2002:adf:e60c:: with SMTP id p12mr4765469wrm.261.1630682316098;
        Fri, 03 Sep 2021 08:18:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630682316; cv=none;
        d=google.com; s=arc-20160816;
        b=b93kehGHbmHgIYeNEb0KKayDpD5MhNEGCNl9kQaHs+nxm8RsiLMKYkYgqbUqOvlrGl
         1vSmyf8FT3IQU9C1znLqtUyRntI/qm0oDLTdpMCgdhKv5JHNsdGWxqRSAeApexTuJz8u
         bOZr1zLvbkwWzF3E56w7i/8aW6clZa+NqWMYRXLsmghwplMAGGtKNXkdItNWu3+zuHqC
         FfZEbumc1T21MKq6ZbD7ON+YExsxSbJA+xCWjIau161AuuZlaMPObiIiZEIJA4tCX9Zy
         arl3/tuN745ZBW55sPqMapwuHxdbq7w7eTOHObiyhuOitiG5CZJYgJZCt/TzH9sq7djb
         i0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=12HaYXUuKoS6T5PuKGowDR0/v6+2hx1VPdfHK6j3uyM=;
        b=t+yacaukc1parN7yZpKS37hv6eFkV5hEsHVR7RI86b44bisW+oUQwYCkuTk27BD7g2
         z6Zef4wch25yiBljvyTYpg1eDRRYJQuw+20/WAEobnm/FyI0Uh9f3pvzwS9ulViTwh5g
         NkckJACfeldp8tW4tr8IXvLHVSTAxCy3D0NbcwdN6/82yApK/7xU5qM7MKqnqgH6e/kN
         mb4VPszd8p+p+l5gBO4/j+N65LuuC+8rcOyl0KanKhbHaU1wxZuMbHlXVied0L3R0DTn
         GuYFCzKRDSBcPcwGysbGl7dzWSCIuFy+eEf/tg+YMhWE+TpwXDDFxn/h08DO41i5fhTo
         ABZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLo448uV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si6002966wrd.177.2021.09.03.08.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 08:18:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gLo448uV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAxe-000216-UZ
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 11:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtx-0004d0-2x
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:14:45 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mMAtv-0007Pf-5m
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:14:44 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m9so8734952wrb.1
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 08:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=12HaYXUuKoS6T5PuKGowDR0/v6+2hx1VPdfHK6j3uyM=;
 b=gLo448uVa127kt9ci4nDcabjel7q1SrgbziE/oxAZlGYy3DproYUQF+hrFuQAlPfNq
 smRqyzX7asHgMrPCOzXCF3UaD4s7yUsJ3oduFRt30tmLzQ4ivFQQoWglsZHF9nP+jwYm
 t5E4zh4nChELj0DgRJEN31xqbJDgNPO3iQpG9/JnntidqC/aFBxrNCtzArdd+LMZn09+
 Xl5eOQShrjPW0wvBC4KHKc3YUfO2+lFAfMXpRWbOGNpBAiWXCLLrqfmzopS0AknekwFF
 tKiyfcWxfT8y9Ux1smDLDS1cqBTfZdc0vgXAIga2QmkjKM/18Tg0pOMyeTfAPUM5o/0X
 8uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=12HaYXUuKoS6T5PuKGowDR0/v6+2hx1VPdfHK6j3uyM=;
 b=McxM+U8kA9vrvZDKtLTP0dHwi59vybhHe4Q06QCrTYc8DjA08fO2ShLwNsQ3uiGgsV
 h8gbG0zVUnuIb3Fogaq5OkR/ZE5Tn5b+NrD03PMeCXBu64U3yrH1KgGOG7F8llZgQDxN
 4oTjuS9ETkZ3iHKssSukgTZZHZasm57np4WPbSYhyejqKE99cSg9RDvucBqSD984qaFU
 DkD7PrjL4AO2Ab1q/oq9J+xpIDo0zDoMxTHMBrx7Cd/REM3wmEEQQYw4T6frrjK/L0nQ
 +wMhT5SpKVN8aBE1vZMkaGbMDGjE62DCsQYyrAVN2tf3WtIHKPWHOO1B3RBns5R5EBlg
 ujeQ==
X-Gm-Message-State: AOAM5339S8uNYrc6oI7HUwwvVgx96i7sMO2/nJf4F+AOQ5+LkBznlWZj
 U2RG754UGSn5xiLi3pMoXR3WYpoqyhseIg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr4857297wrr.382.1630682081522; 
 Fri, 03 Sep 2021 08:14:41 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y21sm4737780wmc.11.2021.09.03.08.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 08:14:40 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/arm/mps2-tz.c: Mark internal-only I2C buses as 'full'
Date: Fri,  3 Sep 2021 16:14:34 +0100
Message-Id: <20210903151435.22379-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903151435.22379-1-peter.maydell@linaro.org>
References: <20210903151435.22379-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yk/HSeBqPTmB

The various MPS2 boards have multiple I2C buses: typically a bus
dedicated to the audio configuration, one for the LCD touchscreen
controller, one for a DDR4 EEPROM, and two which are connected to the
external Shield expansion connector.  Mark the buses which are used
only for board-internal devices as 'full' so that if the user creates
i2c devices on the commandline without specifying a bus name then
they will be connected to the I2C controller used for the Shield
connector, where guest software will expect them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 57 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 14 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 746ba3cc59e..f40e854dec7 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -375,6 +375,7 @@ static qemu_irq get_sse_irq_in(MPS2TZMachineState *mms, int irqno)
 
 /* Union describing the device-specific extra data we pass to the devfn. */
 typedef union PPCExtraData {
+    bool i2c_internal;
 } PPCExtraData;
 
 /* Most of the devices in the AN505 FPGA image sit behind
@@ -711,6 +712,20 @@ static MemoryRegion *make_i2c(MPS2TZMachineState *mms, void *opaque,
     object_initialize_child(OBJECT(mms), name, i2c, TYPE_ARM_SBCON_I2C);
     s = SYS_BUS_DEVICE(i2c);
     sysbus_realize(s, &error_fatal);
+
+    /*
+     * If this is an internal-use-only i2c bus, mark it full
+     * so that user-created i2c devices are not plugged into it.
+     * If we implement models of any on-board i2c devices that
+     * plug in to one of the internal-use-only buses, then we will
+     * need to create and plugging those in here before we mark the
+     * bus as full.
+     */
+    if (extradata->i2c_internal) {
+        BusState *qbus = qdev_get_child_bus(DEVICE(i2c), "i2c");
+        qbus_mark_full(qbus);
+    }
+
     return sysbus_mmio_get_region(s, 0);
 }
 
@@ -921,10 +936,14 @@ static void mps2tz_common_init(MachineState *machine)
                 { "uart2", make_uart, &mms->uart[2], 0x40202000, 0x1000, { 36, 37, 44 } },
                 { "uart3", make_uart, &mms->uart[3], 0x40203000, 0x1000, { 38, 39, 45 } },
                 { "uart4", make_uart, &mms->uart[4], 0x40204000, 0x1000, { 40, 41, 46 } },
-                { "i2c0", make_i2c, &mms->i2c[0], 0x40207000, 0x1000 },
-                { "i2c1", make_i2c, &mms->i2c[1], 0x40208000, 0x1000 },
-                { "i2c2", make_i2c, &mms->i2c[2], 0x4020c000, 0x1000 },
-                { "i2c3", make_i2c, &mms->i2c[3], 0x4020d000, 0x1000 },
+                { "i2c0", make_i2c, &mms->i2c[0], 0x40207000, 0x1000, {},
+                  { .i2c_internal = true /* touchscreen */ } },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x40208000, 0x1000, {},
+                  { .i2c_internal = true /* audio conf */ } },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x4020c000, 0x1000, {},
+                  { .i2c_internal = false /* shield 0 */ } },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x4020d000, 0x1000, {},
+                  { .i2c_internal = false /* shield 1 */ } },
             },
         }, {
             .name = "apb_ppcexp2",
@@ -965,15 +984,20 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "apb_ppcexp1",
             .ports = {
-                { "i2c0", make_i2c, &mms->i2c[0], 0x41200000, 0x1000 },
-                { "i2c1", make_i2c, &mms->i2c[1], 0x41201000, 0x1000 },
+                { "i2c0", make_i2c, &mms->i2c[0], 0x41200000, 0x1000, {},
+                  { .i2c_internal = true /* touchscreen */ } },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x41201000, 0x1000, {},
+                  { .i2c_internal = true /* audio conf */ } },
                 { "spi0", make_spi, &mms->spi[0], 0x41202000, 0x1000, { 52 } },
                 { "spi1", make_spi, &mms->spi[1], 0x41203000, 0x1000, { 53 } },
                 { "spi2", make_spi, &mms->spi[2], 0x41204000, 0x1000, { 54 } },
-                { "i2c2", make_i2c, &mms->i2c[2], 0x41205000, 0x1000 },
-                { "i2c3", make_i2c, &mms->i2c[3], 0x41206000, 0x1000 },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x41205000, 0x1000, {},
+                  { .i2c_internal = false /* shield 0 */ } },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x41206000, 0x1000, {},
+                  { .i2c_internal = false /* shield 1 */ } },
                 { /* port 7 reserved */ },
-                { "i2c4", make_i2c, &mms->i2c[4], 0x41208000, 0x1000 },
+                { "i2c4", make_i2c, &mms->i2c[4], 0x41208000, 0x1000, {},
+                  { .i2c_internal = true /* DDR4 EEPROM */ } },
             },
         }, {
             .name = "apb_ppcexp2",
@@ -1015,15 +1039,20 @@ static void mps2tz_common_init(MachineState *machine)
         }, {
             .name = "apb_ppcexp1",
             .ports = {
-                { "i2c0", make_i2c, &mms->i2c[0], 0x49200000, 0x1000 },
-                { "i2c1", make_i2c, &mms->i2c[1], 0x49201000, 0x1000 },
+                { "i2c0", make_i2c, &mms->i2c[0], 0x49200000, 0x1000, {},
+                  { .i2c_internal = true /* touchscreen */ } },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x49201000, 0x1000, {},
+                  { .i2c_internal = true /* audio conf */ } },
                 { "spi0", make_spi, &mms->spi[0], 0x49202000, 0x1000, { 53 } },
                 { "spi1", make_spi, &mms->spi[1], 0x49203000, 0x1000, { 54 } },
                 { "spi2", make_spi, &mms->spi[2], 0x49204000, 0x1000, { 55 } },
-                { "i2c2", make_i2c, &mms->i2c[2], 0x49205000, 0x1000 },
-                { "i2c3", make_i2c, &mms->i2c[3], 0x49206000, 0x1000 },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x49205000, 0x1000, {},
+                  { .i2c_internal = false /* shield 0 */ } },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x49206000, 0x1000, {},
+                  { .i2c_internal = false /* shield 1 */ } },
                 { /* port 7 reserved */ },
-                { "i2c4", make_i2c, &mms->i2c[4], 0x49208000, 0x1000 },
+                { "i2c4", make_i2c, &mms->i2c[4], 0x49208000, 0x1000, {},
+                  { .i2c_internal = true /* DDR4 EEPROM */ } },
             },
         }, {
             .name = "apb_ppcexp2",
-- 
2.20.1

