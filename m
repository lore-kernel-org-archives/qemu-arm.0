Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1920563lfp;
        Sat, 8 Feb 2020 08:59:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7ver/2fQrrh4TJZV6zIiiUvxBiNJmbitk+dNuBbjazV6RUUH/ThkyCv4L3zlHif6f9eg+
X-Received: by 2002:ae9:e519:: with SMTP id w25mr4058046qkf.260.1581181189369;
        Sat, 08 Feb 2020 08:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181189; cv=none;
        d=google.com; s=arc-20160816;
        b=QkV2taMKiufRZ/Egj+eAQAHs8L/18moQ0RmEyONfI7h/hkNBpn6VmN3jh3CA0BINyh
         V5X0H9+FZS9dbs8lOokNC/ATwBpeqc5+1APpRJevvzJBYx2LvzqS7cUaBPjSczI8KSJO
         kc4b0LkLerqIjEtScPscTPIK+n19AglG55H9hw1D0bOuccTEHQLoyAOzd2MK5/e0c5yP
         hnn4GbfOplRneEe3nvfF3lKIXMkJ4JBFY+JeRiq2LY1rLXx2WhNFN5+isT2oWLZ5TqWI
         i2YQMxzvQpH4ZECNb5FLyHE/C0Lgxg/+X34M/xTuvXT8gDi1kPwkraiA7VxVNzR8C/2f
         Nwjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=x0O3At1xgu1nSLiUV3BtfZN0wWsQrHjMzXGKZfUYX9Q=;
        b=QIzCQeecHNTHFvJUhIis9JxJkvLslTyP3gMzDKHDFXYImKmNUXq9kUopizDlxjuf9z
         Mh7bYuk/3B7Te5IPM6Y7DNDP1AapxXctJtqOk0RO9a+jeyRkTG6SArJlXGbQUpZcljff
         GGqpc2bl0JU6P1MMp3gVABRwWpOGAQs66tZLjFO9uTRF13DV90RNBytARwumcoPc8y7f
         p2hI/WIie9lHrONccp7s30bJPVxflGp/cmoKCfvFudbuBxjW5IERKoeRv266NpeQD9ou
         P2BEEPcOSjWo+2SSTPayKE2R0rTTX0cfdrTMNz2hSQgTD2M8h4vugnsby3TRZyCUlSVf
         bowQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nc2ySjDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c70si1864676qkg.84.2020.02.08.08.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 08:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nc2ySjDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TSO-0002AL-Qy
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 11:59:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53957)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ2-00065S-1H
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ0-0001q4-No
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:21 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:54666)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPy-0001mz-5r; Sat, 08 Feb 2020 11:57:18 -0500
Received: by mail-wm1-x341.google.com with SMTP id g1so5544203wmh.4;
 Sat, 08 Feb 2020 08:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x0O3At1xgu1nSLiUV3BtfZN0wWsQrHjMzXGKZfUYX9Q=;
 b=nc2ySjDJ+uA1SNTopZ4ALRt5BvecIYLNlflYDfCA+4/qWOEnAWhD5VJAqn5htRbOVN
 3wxDCB+wMzip8/s/NWAIiNXoM0/fZvrMc3PhyyEOBuKK5/votB/RpOHzGtrjV1m5+IrJ
 C1Bml/kyK3WXEGzMJYYdi0sgUd+MPFKuHr0v18jZeWL1nA6UOPS2Q0Ge7lKIIJ/eDMK6
 BIokUVGa1e9/aozlC2rJtHN0JsXuBc5dnQzJB15LuDUrXc8M0UA263ZKWKf7NgANLeRu
 K8UXrSROfJL6nFlUoWMj/ww/PqcUeSPlobMN6Kt5+rjN0hUkss24tWZtwiZihRgwJ6U3
 fznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=x0O3At1xgu1nSLiUV3BtfZN0wWsQrHjMzXGKZfUYX9Q=;
 b=qbRti2FLkaFbFyyosMTLTXT6lRQOHKJxXSrUy4UATI49v/o0GibIwn6tC881q/qcgy
 nGC8OIgH2IIEjfJQpghd/QRGun59tLaioYUuZRffL0wv2AfJuKyoGNOZ615wtej73Qzt
 gnFFWVcWvNY5p98NlYw+arYZgzu0GjwP6VdIs9Js1oXK0BDmXOiwcIxFOi5cE4U9DvP6
 goRED9pJd2fEy+PKAm7H5HrPywyIhfR4KOSTLuseS6FfXBYRO2cIsnUxGDhOJX4Mo2dp
 8w3GcEKL/sA1xNuygvESD7rA7cTmM2s2VCYeJXytoUOl3WT9UOWSQsZVlVixxu+jCpjV
 nwcg==
X-Gm-Message-State: APjAAAWRoPDfRgkd86Qjnf5zU7SQBii0OnwBEPqcPZ4PlnAV3pRl7Xe2
 e7TS3zYaAb/UbUOq81HG0PGn7RRF
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr5374564wmj.117.1581181035247; 
 Sat, 08 Feb 2020 08:57:15 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/13] hw/arm/raspi: Make board_rev a field of
 RaspiMachineClass
Date: Sat,  8 Feb 2020 17:56:40 +0100
Message-Id: <20200208165645.15657-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9586CpcSGn2x

We want to have a common class_init(). The only value that
matters (and changes) is the board revision.
Pass the board_rev as class_data to class_init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 62b8df3c2e..fbfcd29732 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -46,6 +46,7 @@ typedef struct RaspiMachineClass {
     /*< private >*/
     MachineClass parent_obj;
     /*< public >*/
+    uint32_t board_rev;
 } RaspiMachineClass;
 
 #define TYPE_RASPI_MACHINE       MACHINE_TYPE_NAME("raspi-common")
@@ -227,9 +228,11 @@ static void setup_boot(MachineState *machine, int version, size_t ram_size)
     arm_load_kernel(ARM_CPU(first_cpu), machine, &binfo);
 }
 
-static void raspi_init(MachineState *machine, uint32_t board_rev)
+static void raspi_init(MachineState *machine)
 {
+    RaspiMachineClass *mc = RASPI_MACHINE_GET_CLASS(machine);
     RaspiMachineState *s = RASPI_MACHINE(machine);
+    uint32_t board_rev = mc->board_rev;
     int version = board_version(board_rev);
     uint64_t ram_size = board_ram_size(board_rev);
     uint32_t vcram_size;
@@ -279,13 +282,16 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
 
 static void raspi2_init(MachineState *machine)
 {
-    raspi_init(machine, 0xa21041);
+    raspi_init(machine);
 }
 
 static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
+    rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 2B";
     mc->init = raspi2_init;
     mc->block_default_type = IF_SD;
@@ -302,13 +308,16 @@ static void raspi2_machine_class_init(ObjectClass *oc, void *data)
 #ifdef TARGET_AARCH64
 static void raspi3_init(MachineState *machine)
 {
-    raspi_init(machine, 0xa02082);
+    raspi_init(machine);
 }
 
 static void raspi3_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+    uint32_t board_rev = (uint32_t)(uintptr_t)data;
 
+    rmc->board_rev = board_rev;
     mc->desc = "Raspberry Pi 3B";
     mc->init = raspi3_init;
     mc->block_default_type = IF_SD;
@@ -327,11 +336,13 @@ static const TypeInfo raspi_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("raspi2"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi2_machine_class_init,
+        .class_data     = (void *)0xa21041,
 #ifdef TARGET_AARCH64
     }, {
         .name           = MACHINE_TYPE_NAME("raspi3"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi3_machine_class_init,
+        .class_data     = (void *)0xa02082,
 #endif
     }, {
         .name           = TYPE_RASPI_MACHINE,
-- 
2.21.1

