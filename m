Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp812907lfp;
        Wed, 5 Feb 2020 17:21:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqwa/iIfoVq4hD55w66SbWowIX1uPBZX9f91+N29jCuD/EFTg3v186sajwJG+EVVUntn00uS
X-Received: by 2002:ac8:2af4:: with SMTP id c49mr522380qta.367.1580952104935;
        Wed, 05 Feb 2020 17:21:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580952104; cv=none;
        d=google.com; s=arc-20160816;
        b=KsGlayyg69ESZWkUU8KZjZ/Lk/aa6Wlhhu6mlGM62JToEH1g7q5K+cwEyIlGo50Cen
         v/5EAObdnBvlcfx7MmwMjGvU+ShiKtqy+YfNqiKWRVp2Ea+wPQ+43nBD00zfpqVDqPkh
         wekQVfCXr4pJ4pnAhMhkPWEE432zxtPnkf3gvhDkiHGt0m9V7IXjnA6nZhrP4SAjjVzk
         owr3RFr1jvTJmGtyXlST5bUFFKlG5LcV1u8c6fC1gIzE5fOtM2GQRGNg/yu068C8oPDw
         HQTMRoUXE4CNSATj/lB5SqNZZfQ36OKDC2KhP0VvbQcN3STwHI64ZtS8QwdYgofv6qbR
         Iq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DoWpvyfK+WfXXi5X9tns5WnEcL/fdg1MifgQLNVT/tQ=;
        b=cl9Bw2nGaP65rog3f/XqMjQdAnsKYPWhY0ia5zdmuWxQhVfzCxX8o//ASL7RpWVqWo
         qNQrMRfiJW87QfL/K2zselitgO/GEfeB8uJOAaEilO+o5pDV4JwkL5tWuyVhzRRxfMBl
         1+UM1e9zkkzqGxDCxZJKbMnm4SRf70TbWTazghckm+KArVaNxFzGzg8LNJYFnPkGP8JW
         BsTt4W1Z99Ip6X1sFRU7FmBo1WloqDe9ZwzMFJ1qEjIdIp0QZ1hoP6E/+YbfeZZxdKQa
         WPLz9cWvsY505KqYzce95KkVrcOlOpy6oEDtgvZDk/JwATCg/+FQU2mx8RUh3ZEcDoYO
         3fxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fnunndk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si722129qki.303.2020.02.05.17.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 17:21:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Fnunndk7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izVrU-000563-Be
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 20:21:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53663)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo8-0000JZ-Ej
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo7-0002FG-Gd
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 20:18:16 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38846)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo4-0001uz-8B; Wed, 05 Feb 2020 20:18:12 -0500
Received: by mail-wm1-x341.google.com with SMTP id a9so5038992wmj.3;
 Wed, 05 Feb 2020 17:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DoWpvyfK+WfXXi5X9tns5WnEcL/fdg1MifgQLNVT/tQ=;
 b=Fnunndk7H0/ivXOE4GMqkk66DOc9U0xIZ5sLtA7MHt5fANK9TycDh7/BK+KOBWRCEz
 FPt5kpPILvX0AIjQqCUOnFGrB2ls86njaU8ZVDv96a9QNWWDJ7d3m/GtjNCHOCJcG8lN
 RegpaIaeDira5pFGzHkhg1OU0/HyTw0ELAcsFmB9XIX2F/P2KsVlV3y0XTuFkJw0BoRC
 abw5n8RHxkfv8KAy2BqIcWZkzgppjvg8lF+id5zPT1bGf9kHpRx0EPCjS4+GdEeylpO4
 I2u099wnVSMxahc8tHXKfE8hHijHrsLcU7TPpyyDJKeCZ+PfGqkZKQ97mj0YvEUEtyml
 i+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DoWpvyfK+WfXXi5X9tns5WnEcL/fdg1MifgQLNVT/tQ=;
 b=JA4QsgwjxM5GE6l1ktF9ug96Ya5TmDzFdTvN40AWS80cH1jnu8htGbi+1OgVHLQSom
 xAkH3DcaUDdv7O/CarWZL9UnA/s3InyWVlJ8vd71cEBqwUOjUJAPKNqqiKnEoSurQI+C
 KdFuYl957S+S/e2dudmZY7oMtBCwOqhWfm9io8UZUnrydPuAcBNnewZmX05TFyZCnap8
 axx3+IG/hyYIKDl5D/z74d8QCWegBut3BV7pyFkFDNUSZCQZWpDVnMXhpMGK0Uz/JYQz
 SObS/VuZYAWWDuKyuchzVYdoA3/86USfcxOu8X3U394cHXm86Yr/oumnZ0BnXekHWuiV
 0I9g==
X-Gm-Message-State: APjAAAXnxcyQJhaFgYQzdzC9wxWLlXr7tO2Wb1i4FR8ffDvpqB6bviOe
 jetSpXDcTLHpRl5Y9M7RqvTOnb5t
X-Received: by 2002:a1c:988a:: with SMTP id a132mr579281wme.113.1580951891181; 
 Wed, 05 Feb 2020 17:18:11 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/30] hw/arm/raspi: Extract the processor type from the
 board revision
Date: Thu,  6 Feb 2020 02:17:31 +0100
Message-Id: <20200206011756.2413-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9x2vCiXy5/V1

The board revision encode the processor type. Add a helper
to extract the type, and use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 2f5cd32c5e..20195227eb 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -66,6 +66,21 @@ static int board_version(uint32_t board_rev)
     return board_processor_id(board_rev) + 1;
 }
 
+static const char *board_soc_type(uint32_t board_rev)
+{
+    static const char *soc_types[] = {
+        NULL, TYPE_BCM2836, TYPE_BCM2837,
+    };
+    int proc_id = board_processor_id(board_rev);
+
+    if (proc_id >= ARRAY_SIZE(soc_types) || !soc_types[proc_id]) {
+        error_report("Unsupported processor id '%d' (board revision: 0x%x)",
+                     proc_id, board_rev);
+        exit(1);
+    }
+    return soc_types[proc_id];
+}
+
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
 {
     static const uint32_t smpboot[] = {
@@ -212,8 +227,7 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
     }
 
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            version == 3 ? TYPE_BCM2837 : TYPE_BCM2836,
-                            &error_abort, NULL);
+                            board_soc_type(board_rev), &error_abort, NULL);
 
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
-- 
2.21.1

