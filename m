Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3665286lfp;
        Mon, 3 Feb 2020 00:26:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqz6LtXsHDan0toRugeOr01whPBmV4U7XK5j+8g0s+O+y1CEO1uy5RNo47SmizI05sdpEJXk
X-Received: by 2002:a37:4b52:: with SMTP id y79mr1518263qka.389.1580718411224;
        Mon, 03 Feb 2020 00:26:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580718411; cv=none;
        d=google.com; s=arc-20160816;
        b=II4CccJu9deFpohLbm2G2On4i53dORn1ZdHchMQSUUPuwyGs3XYU0bjBf7RyqQ2ipR
         /kiq9DbgdOKiqPGGD4JI00srB+NB1eJMITFfqzwE/QE8aavfXG5RPAnRMQasy9tCaaYD
         VB9Qp7jtn/y3dlW5C+JytXPnVy14ngAcGDo/pzWwew8OSfiuNGK5k6HQ4FCEGcKe2FIH
         mVRGaedo61ONmS6mEbVFNDEwpMgk7lBQAT0b8DrmLiDBFmBJJUjFUb6E9wvIgSBq8pvP
         e8jpNhU1j81kGMorzNV1TWiwjO+WMxcztuenYK/y6i0j4WlRNKovDWFClAc/9BrhxIqB
         grWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=MG6q3ieTomJ3R/kt7cFMdsAQjzJf5NE+35h/33403yM=;
        b=RfN5wEL6ZV04Yu9hMGtYyqOWceHVk0Lb3PzIQrUlIw3qwI9MM33LNlynO8SIH2z/gS
         9F7izHw6JPP20dzjXGT8K2IQsKVPxRONrKIzSnyzfgyFbHyVvovcHZP1RF/+2wLVkE22
         dJ857oDGvdKnuwXs5bku2pUXBYkX3Jm91jnuSXehUHMutPKUUHn5zTONTKX6ass2GkgU
         mhgums6ulCw8Iax0BsnwDyC1UXkhFRUUNRL/dBFX5PUm7Z8DZiR4/hBj3N3Nz5mo2HQp
         kRKPAsTVu8Fkr+NWnkrLUWitHLCXkGYM7spDkG3gWOG/a6HboqR4cZ6k/5iVBoQCEV6F
         JKsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LV0mTo7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d85si11757436qkc.294.2020.02.03.00.26.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 00:26:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LV0mTo7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:36018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyX4E-0002Tr-Ij
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 03:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34896)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX45-0002OV-NG
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 03:26:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX44-0001Iz-KI
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 03:26:41 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:39837)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iyX40-00012R-8t; Mon, 03 Feb 2020 03:26:37 -0500
Received: by mail-wr1-x442.google.com with SMTP id y11so16727769wrt.6;
 Mon, 03 Feb 2020 00:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MG6q3ieTomJ3R/kt7cFMdsAQjzJf5NE+35h/33403yM=;
 b=LV0mTo7n1aOMIP09UJ0OAKahm83O/pyeedX5BLR7LcnczpaVSqeMOVFsf68Cpo1k/s
 6n6rLQTAGne0/U2A3bgJ9qS1pNyU6i8GC6KK8x2jryuV3uHeDIpm55rLQizcKV5J6Zs6
 wdmUwYXLzUj9fqZJq5C7yGDTeO0mO0UNS7bnJR7VIGmTg1MH/3LDys/2Pi211263wevG
 G/nRK6JEKC41Gkx4zML+32M0MTuOccw0vGr3ihYWkAGM4VqToTd38J574oBuzEOOR90H
 5e0kd3G+Cu2mNRC7ySBMgP6otPG3IrF/vbTVJNTovScAEMecgrQogivdrRoF6jXrJSOh
 Hs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MG6q3ieTomJ3R/kt7cFMdsAQjzJf5NE+35h/33403yM=;
 b=LlhHO92ko+gF2NFgfh1/Bp5zVc2/ekgbRfuhdlkTSDngHsnGcvKoHsyQnKEzMDcu8W
 XlqAypIoJnOrCnryIDcX+tqTTNH3e0C7o5H5iAqKh8PdDB7Eyxxjrt+MjsYLHklkcSwz
 IumYt7rbSglIKAavPrPTOHBJJN5v8Kl4Apm+0IDXLA+U/T7P3JyXFzqSX9oIQ+F+qtgm
 4jcnNYh/yotLXDmObFn6lZeEGDr1BX0C4NZADR5lTZg6NYZFyqom0/Odeu0rPZa6v5Nf
 HSG1UmEDN+b9V0pdxFoUd2fAX7n2Mds88yCQtS9X00sO7Jsr/X4R01H0qw9cYXBGwdIp
 f1Pw==
X-Gm-Message-State: APjAAAU3uPQKzT8QT42FYuYOneVZr8rWOv6OXM9e17BI/RB4Vav4CXDQ
 3W569UPfZSU2MrV1NcbNDTKPz1q4
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr14039937wrk.101.1580718390682; 
 Mon, 03 Feb 2020 00:26:30 -0800 (PST)
Received: from localhost.localdomain (162.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.162])
 by smtp.gmail.com with ESMTPSA id w20sm22396778wmk.34.2020.02.03.00.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 00:26:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/6] hw/arm/raspi: Get the CPU core count from the revision
 code
Date: Mon,  3 Feb 2020 09:26:19 +0100
Message-Id: <20200203082619.7426-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200203082619.7426-1-f4bug@amsat.org>
References: <20200203082619.7426-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8NWp3ygCMIs0

The number of cores is tied to the SoC, and we already know how
to extract the Chip ID from the revision code. Use it to determine
the number of cores.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 12dc4d1486..aff5d57261 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -39,9 +39,10 @@ enum BoardIdChip {
 
 static const struct {
     const char *soc_name;
+    int cores_count;
 } soc_config[] = {
-    [C_BCM2836] = {TYPE_BCM2836},
-    [C_BCM2837] = {TYPE_BCM2837},
+    [C_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS},
+    [C_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS},
 };
 
 typedef struct RaspiMachineState {
@@ -113,6 +114,11 @@ static const char *board_soc_name(const RaspiBoardInfo *config)
     return soc_config[board_chip_id(config)].soc_name;
 }
 
+static int cpu_cores_count(const RaspiBoardInfo *config)
+{
+    return soc_config[board_chip_id(config)].cores_count;
+}
+
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] = {
@@ -312,9 +318,7 @@ static void raspi_machine_class_init(ObjectClass *oc, void *data)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->max_cpus = BCM283X_NCPUS;
-    mc->min_cpus = BCM283X_NCPUS;
-    mc->default_cpus = BCM283X_NCPUS;
+    mc->default_cpus = mc->min_cpus = mc->max_cpus = cpu_cores_count(config);
     mc->default_ram_size = board_ram_size(config);
     mc->ignore_memory_transaction_failures = true;
 }
-- 
2.21.1

