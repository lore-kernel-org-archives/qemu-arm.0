Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1919330lfp;
        Sat, 8 Feb 2020 08:57:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqyHwNVdBKYX4X09rYbNbG29JX5fjNl3znc/IEdaVRHqj5q47Qb5sTNH5IgsU1jHeu7Q4Wa6
X-Received: by 2002:ac8:4e2c:: with SMTP id d12mr3544307qtw.219.1581181057119;
        Sat, 08 Feb 2020 08:57:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181057; cv=none;
        d=google.com; s=arc-20160816;
        b=eU8Zurc0BEvK6i0v6illmGldFJzE2UwAPjT2HJEf3v8W/6BxHFE3eybBC3LERlIKtf
         paH/hVYKkZ0qvliAVk1mC7Sshnhb2O2y4MQzwKtVnYvcoSJyTYbYT2dBI25P76FdLYuo
         cyux/fC9T0Czv6ANKGjtDLNafuGdZlUZfatzUDeihWX+r1S5XV1tkBbUkGdaOIr4UKRO
         ikZoOs2rDWgdoeBl6HsH66S+QTtVOFmyAGl8ffmQFP5F4meOoIpTOMRVDBzncNhsL8YW
         BXFubsvcnyjlUyiSn6dwG3uYCMgx5U/7A6rVB5MXj6NF+rJVwKZU0iwmtotOaZNo8lUB
         XrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QqQIuN2OLiJlB7XbZ3pYMKM/Y6DyvpJ28zihmZMMx2E=;
        b=E/ls4cJcY54I77WQVhFtuIoHJxHL+LJc7kKcQjbE3WjBs+80PNTottvHTQZHPF/G3H
         9hgoB88xqS3BnNG0bUSzgMGepTQQ5zuRKnN5fJYPrJVHiA6ZF4mWQ7mlrZxWo3qJL7ax
         ks6ukZ7laC9ze6e13ZXImbirhPuW4E6DXad3SS4n0dTu1q5stMZ8SYhixP5OQnZAt2gL
         jz/E9ZCBopvKrKtQot9vIONtdThDIlAdTTN1qoiLSv9FJuIB4wpdKxZggcYxsBJyDKNN
         vcTRrDvnMoTGd25LOctSL9jXA1eF6gUE6NLqd3p6ge4Xa7eejQmZs3Ee+cK6C+J81TFD
         IotA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="bVleue/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t25si1666302qtq.20.2020.02.08.08.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 08:57:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="bVleue/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TQG-0006R9-Ib
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 11:57:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPs-0005lb-OR
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPr-0001jJ-Bj
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:12 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:37036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPo-0001gL-Mq; Sat, 08 Feb 2020 11:57:08 -0500
Received: by mail-wm1-x342.google.com with SMTP id f129so6031299wmf.2;
 Sat, 08 Feb 2020 08:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QqQIuN2OLiJlB7XbZ3pYMKM/Y6DyvpJ28zihmZMMx2E=;
 b=bVleue/eaJXkPO9gkwrE1uIMz0Tyvixkd0/jHPht3vKgSODnZEURqdeTVKhC8CtOOu
 QVnRBuT7hjEFNnui4StPFvzmpyOAgv6u89XEMJUeQKdo8oWrG6x5QrvcUvhIsUFAuOYd
 vMrAQ8ShgNLR672DPa9HzPEzT7+48J8DkeQqPjTrzwqODPQXw+jCfiOokGybg7N7CR26
 ljtZpCZ39qAVzWl9/e2ITFcwApKHYqxAzqIkVZ8Qh/5DgfJg6DDWaUiGudGwXTEIeyg+
 tQIp9K3EG8WEqJbYdSSixGFA5yLsEGVA91jTDI5fSfzW6apHLM629b2g3kC+C/2ryWDz
 lV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QqQIuN2OLiJlB7XbZ3pYMKM/Y6DyvpJ28zihmZMMx2E=;
 b=p7QtTMWVflfeL6e8JfVBIzRkUocxcJV+tCI4doJ2/75guiWYIkrLIxvyYo8Uwjhn1Q
 VWng5FiA+dSiQE+dP1YDjJTFMj0axB0VBwPbBlrLOvRtyJFKs4AkRCuYM9mqQ1jpXs1F
 Yh+gXiJRJnmm0k7U2leAbZcwaUm26uLxH9zOwG+zU5SHVw135wSNy3i5ZWoGZeEpPyQV
 ZRyRp6OrU3cgod/uouEF6fX3OEwBZ5J56C13zoe2BaKh70EIVCx9XI+8z6TM8BIyyW/f
 Qemiu7FcdsIIb9YCYRUqtCB8V86hXwEAfvhm0KzQj2W+KF+aiTTvamjqKk2KQ1ocDtW3
 conw==
X-Gm-Message-State: APjAAAWtyNRLhNcDk089YjFLZCFsSVy82qjqFRnay6iB6ZqXwNzvSVNb
 7KlozduZGmL/NSeOtS4G9SKamdbA
X-Received: by 2002:a7b:cb97:: with SMTP id m23mr4848283wmi.37.1581181027534; 
 Sat, 08 Feb 2020 08:57:07 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] hw/arm/raspi: Extract the RAM size from the board
 revision
Date: Sat,  8 Feb 2020 17:56:36 +0100
Message-Id: <20200208165645.15657-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
X-TUID: HgIcLh/e15S1

The board revision encode the amount of RAM. Add a helper
to extract the RAM size, and use it.
Since the amount of RAM is fixed (it is impossible to physically
modify to have more or less RAM), do not allow sizes different
than the one anounced by the manufacturer.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Try to make error message clearer (Zoltan)
I used the same string as "ppc/ppc405_boards: add RAM size checks"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg675801.html
---
 hw/arm/raspi.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index f285e2988f..dcd8d2d6d3 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -13,6 +13,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/arm/bcm2836.h"
@@ -49,6 +50,12 @@ FIELD(REV_CODE, MANUFACTURER,      16, 4);
 FIELD(REV_CODE, MEMORY_SIZE,       20, 3);
 FIELD(REV_CODE, STYLE,             23, 1);
 
+static uint64_t board_ram_size(uint32_t board_rev)
+{
+    assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
+    return 256 * MiB << FIELD_EX32(board_rev, REV_CODE, MEMORY_SIZE);
+}
+
 static int board_processor_id(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
@@ -191,15 +198,17 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
 {
     RasPiState *s = g_new0(RasPiState, 1);
     int version = board_version(board_rev);
+    uint64_t ram_size = board_ram_size(board_rev);
     uint32_t vcram_size;
     DriveInfo *di;
     BlockBackend *blk;
     BusState *bus;
     DeviceState *carddev;
 
-    if (machine->ram_size > 1 * GiB) {
-        error_report("Requested ram size is too large for this machine: "
-                     "maximum is 1GB");
+    if (machine->ram_size != ram_size) {
+        char *size_str = size_to_str(ram_size);
+        error_report("Invalid RAM size, should be %s", size_str);
+        g_free(size_str);
         exit(1);
     }
 
-- 
2.21.1

