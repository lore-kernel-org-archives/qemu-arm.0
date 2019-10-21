Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4980694wrm;
        Mon, 21 Oct 2019 12:07:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwocDZgpM1H35SfmaIoW4VKP2z23WoCiMtMYtWPhXYHr7ItDU1YLUAibkAn9fpKkR9Isyk5
X-Received: by 2002:a50:cbcd:: with SMTP id l13mr26635117edi.18.1571684870825;
        Mon, 21 Oct 2019 12:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571684870; cv=none;
        d=google.com; s=arc-20160816;
        b=WWr4WDWYyQNWkWQAhx0FCWN54opJFHselP7UK7WahmAU4nPtGV3uBsQUuOhyC1qi1C
         fFAx8+wR5JGCseg6MlHxHWdaHr9wMKc4Z61kDq3pTRqF6xE8Eo/HROdbrywjnomt1Ybw
         7hDQjtmgfs6EzwhT9vE30gBTWiFLOCAqH7VfO7xjeeSkXKhiHK29Asl/yOBqICYgzmgq
         gZ+fGHeyJVYUeSMMcO6j/ttALsktIi1/ClCmxGgcsMJfMrYiutmurTH6bz2oorysHVt+
         pSjNsIVMqu7PdV6Q+8vh4PwkJ2JJxolQVF5+u1sS+Xq7Jga3vczh79Mz5uIw3M/rQbeX
         PV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hh4hGc05qaiqE0PriS+TCQOOBJ4IG7QAWw+gTJb4YJA=;
        b=HQQEwd5L0eBIOMXwkjPaf97J/UO/Syo7MZI/zc+2ARhJxoXMO2l7liqzWdcJ+WDnee
         8Lt14kPL7ZSzZqc8AXmT1ULWkGZzcXeleh+7Je+NzzLVc/tVijelf4q+TQTEkbB5KLho
         NHj5plygMiD60xGqX1yn48cxozpJJ5dGDBFb44JY9zh3zIP9gZINbMa2ysCQ5frZZCcZ
         XyNXEwU3maz4d6PLpDsfLpcOcO5TW75x4afhj/ymt++tY94rSPmJeK4PcaUC+DAi/Ija
         tyHySZ5ZmB4a02StQ6bYEweK9F+Bd9cKbIYorivwFW8wbx4py2QRK4eaHIeoRO9I2ygF
         vG4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aYLODmUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m12si10797907edc.50.2019.10.21.12.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 12:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aYLODmUb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMd1v-0003wL-W0
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 15:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMd1U-0003ra-1t
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMd1T-0001uJ-12
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22090
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMd1S-0001u3-TM
 for qemu-arm@nongnu.org; Mon, 21 Oct 2019 15:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hh4hGc05qaiqE0PriS+TCQOOBJ4IG7QAWw+gTJb4YJA=;
 b=aYLODmUbvGwiQoxmFxWJ/FiD9NQQd0Nj5LJ+QdMXpfTVeXLB/U/pnYZi1mAB8GYGduCmOu
 q8xhgkc/HsTDkbrNjJcT/zWf8gWEJtGNxWFKboH9m1H0r1kLEMj3gJvWwir716jekZruho
 nE39LqOTALWHQf+iCkcVgVXvAELaKTQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-fIhEpp9TMPuOfxoXvzVHcw-1; Mon, 21 Oct 2019 15:07:12 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E5D6107AD31;
 Mon, 21 Oct 2019 19:07:10 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-124.brq.redhat.com [10.40.204.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA2C3DE5;
 Mon, 21 Oct 2019 19:07:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 2/6] hw/arm/mps2: Use the IEC binary prefix definitions
Date: Mon, 21 Oct 2019 21:06:49 +0200
Message-Id: <20191021190653.9511-3-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
References: <20191021190653.9511-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: fIhEpp9TMPuOfxoXvzVHcw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X/U4WIigHF9o

IEC binary prefixes ease code review: the unit is explicit.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/mps2-tz.c | 3 ++-
 hw/arm/mps2.c    | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 6b24aaacde..f8b620bcc6 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -38,6 +38,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/arm/boot.h"
@@ -458,7 +459,7 @@ static void mps2tz_common_init(MachineState *machine)
      * call the 16MB our "system memory", as it's the largest lump.
      */
     memory_region_allocate_system_memory(&mms->psram,
-                                         NULL, "mps.ram", 0x01000000);
+                                         NULL, "mps.ram", 16 * MiB);
     memory_region_add_subregion(system_memory, 0x80000000, &mms->psram);
=20
     /* The overflow IRQs for all UARTs are ORed together.
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 10efff36b2..d002b126d3 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -23,6 +23,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "hw/arm/boot.h"
@@ -146,7 +147,7 @@ static void mps2_common_init(MachineState *machine)
      * zbt_boot_ctrl is always zero).
      */
     memory_region_allocate_system_memory(&mms->psram,
-                                         NULL, "mps.ram", 0x1000000);
+                                         NULL, "mps.ram", 16 * MiB);
     memory_region_add_subregion(system_memory, 0x21000000, &mms->psram);
=20
     switch (mmc->fpga_type) {
--=20
2.21.0

