Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7078038lff;
        Wed, 15 Jan 2020 07:40:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjbMcWbebVwULhX/CdFtvLjICXaCuLxax5+qSA6G7pvQoy3J9z8Pkien/In6Pqzh2pKNZE
X-Received: by 2002:a0c:ed22:: with SMTP id u2mr22798378qvq.13.1579102852993;
        Wed, 15 Jan 2020 07:40:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579102852; cv=none;
        d=google.com; s=arc-20160816;
        b=E6GP/UgAn/yCSTvvuGR2CJB7Zy5KhXJVHMYvgHZKRZ63AgwjHuHgIy2mxpep6xmERL
         CMBUTnFM7gl5w/pHIDoNdHnktcrvyBPtu+DpwL85pQn8sL3jfBPOMFz7rwgnpLHSHZQl
         sTIBsWulLJJfdraqvOIiHPVsle+LoNqslW0SdvuNCXjRbHdWoNvENJ+FKYqneZrf73+J
         pWqVJlWt/kAV1HkRqMG+2iHTER9YvaCq0eBnYsMsmp5V/NG4YqUGBRFPhyFXghpeXOKb
         XtJyaWfNZQM09Szwl/7sZP7zjfv1jHGUhZixpkTUEg10XOlYjJREbdI/vo0Oo3i5m8Y/
         Oj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VnSLCb8d4GMvgv+9Tr4yBftBhi1fN4ZNqZmZal2yxY8=;
        b=ZIuNRkNXPnG+fS0cP6uaIVyeLVZuAc5aRA6svGfx4q1K2a8Jw56ShW7LIwP3yxQVPY
         zMleKjJkGF9ISw+qLIYHNDux/jSyU64Xyc5TTGhC89beOU27spZKJ3FWOTOdDFxDkPTz
         vfd6IKQhnOcZyuxJzbwDxtsKnN4dmLK2/Zyz4l0qUlR0LAZGXopU8Aw404jZXQ+0FmxW
         hfPo5Cd10jxCTflOHlU8JLKqIPAIicKC+jIJqoNk/onIaZ476NrXVBJkRJ+nHpZLVoha
         iFBnHdaitkFvbEwTObCBikBEKbM3mGcSpGcX6Kt5EjMmXj4HqrYPbJQZoyeNZiVBOT6X
         BpSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BqVDNLfz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si11109167qkm.183.2020.01.15.07.40.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 07:40:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BqVDNLfz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irkmq-0000O7-4Z
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 10:40:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1irkKQ-0008K6-MV
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1irkKO-0008V2-CA
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34469
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1irkKO-0008Ui-8e
 for qemu-devel@nongnu.org; Wed, 15 Jan 2020 10:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579101087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VnSLCb8d4GMvgv+9Tr4yBftBhi1fN4ZNqZmZal2yxY8=;
 b=BqVDNLfzVI+CNzm7iq82G6k1d7PRejZXvUdu8w4u9inAjH65NE3Lx11KrAc8rLdtKXl81Z
 Zr2ulrLpQOm82uEVmxOKUqoRLM6Go6pIPBzGUFVuFopwzUoHyYFvaApfViBxQIy9C7vkjE
 fmSFHuKurjApiRf9aXenui7zpLHjW2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-woQTO_2_P8u5U_YgfaH6SQ-1; Wed, 15 Jan 2020 10:11:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C1C01135763;
 Wed, 15 Jan 2020 15:11:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17E3819757;
 Wed, 15 Jan 2020 15:11:21 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 37/86] arm:xlnx-zcu102: use memdev for RAM
Date: Wed, 15 Jan 2020 16:06:52 +0100
Message-Id: <1579100861-73692-38-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
References: <1579100861-73692-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: woQTO_2_P8u5U_YgfaH6SQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, qemu-arm@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7eOCl3YXiAat

memory_region_allocate_system_memory() API is going away, so
replace it with memdev allocated MemoryRegion. The later is
initialized by generic code, so board only needs to opt in
to memdev scheme by providing
  MachineClass::default_ram_id
and using MachineState::ram instead of manually initializing
RAM memory region.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
CC: alistair@alistair23.me
CC: edgar.iglesias@gmail.com
CC: peter.maydell@linaro.org
CC: qemu-arm@nongnu.org
---
 hw/arm/xlnx-zcu102.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 53cfe7c..bd645ad 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -28,7 +28,6 @@ typedef struct XlnxZCU102 {
     MachineState parent_obj;
=20
     XlnxZynqMPState soc;
-    MemoryRegion ddr_ram;
=20
     bool secure;
     bool virt;
@@ -87,13 +86,10 @@ static void xlnx_zcu102_init(MachineState *machine)
                  ram_size);
     }
=20
-    memory_region_allocate_system_memory(&s->ddr_ram, NULL, "ddr-ram",
-                                         ram_size);
-
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc=
),
                             TYPE_XLNX_ZYNQMP, &error_abort, NULL);
=20
-    object_property_set_link(OBJECT(&s->soc), OBJECT(&s->ddr_ram),
+    object_property_set_link(OBJECT(&s->soc), OBJECT(machine->ram),
                          "ddr-ram", &error_abort);
     object_property_set_bool(OBJECT(&s->soc), s->secure, "secure",
                              &error_fatal);
@@ -211,6 +207,7 @@ static void xlnx_zcu102_machine_class_init(ObjectClass =
*oc, void *data)
     mc->ignore_memory_transaction_failures =3D true;
     mc->max_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
     mc->default_cpus =3D XLNX_ZYNQMP_NUM_APU_CPUS;
+    mc->default_ram_id =3D "ddr-ram";
 }
=20
 static const TypeInfo xlnx_zcu102_machine_init_typeinfo =3D {
--=20
2.7.4

