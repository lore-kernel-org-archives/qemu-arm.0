Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9414504lff;
        Thu, 16 Jan 2020 22:41:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqws7s552z1vYe2EWcdX/9t/LOCsz2WHY5MUyOYpnlPkSspzh+GTxBwL8LojaRg9adilHFg3
X-Received: by 2002:a05:620a:491:: with SMTP id 17mr36876985qkr.429.1579243281601;
        Thu, 16 Jan 2020 22:41:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579243281; cv=none;
        d=google.com; s=arc-20160816;
        b=qvOCvZISWoqhPXP2EMUjXFeNOqafPIo58f9DygM0WW/AKed7Cm0pp/FDfgGnU3HCUB
         a7T2GygAS5lsz2EOmQEovnyzDdvHAOeeGO7f6s+UfkzdzdU6NBULuo0IBWvPXPbl0WEv
         lLYJYsiRyaHjtSDI2Tvn7UAOTLjqhd3tUIJA/4fVq2KmfLrv7u57Lob4DGujFPjN8apV
         vm4bQZbDp4c+nEKpaiUiVYB69XmO91y3BxI8UC3v9DmPA1Zt99fj3HawrmpPsbu7kzzY
         ULgw19dpW0ofN/BKDva/lKABZL0iTVIXIWqv8IxDh/JPOofqsyIjIGQaFRrJAQ92EkSe
         buqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=kILSDmMN9iD9Af+qHLXBEZrWfII6z296r04rOq8vi50=;
        b=j/MZaxIvqUfKmakkMk0/GiGbOrrih8HHzWOxWqU6sWPD5hk0omF3WQk7pkMMvcqoQg
         TtlhfrGuch0G6JnlriMl5Kfy4PcJn8PFviuuxF7+eLoZfbC7Ev4DGMkRJznZYX9U1FLJ
         7PvqFQC/NUrm7Wepp4EXU145ZsYr8oRa3IZrdhHfkZl7cMpHB4f+MGab3FpMXqXtFQYw
         MKLb0QqmeObrtz11xG0HCIbafaLItL6Rjbd50RKHiX6DRaRjYJJKwOSK7Y/uBZSFkNMH
         62qxl4e2brt09gETnChdA6eziW3pHGPvVYqg/+HK0UBuGhEXQHkrS+QIPyppfqI5npHe
         aZuA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o45si14331574qtk.333.2020.01.16.22.41.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 22:41:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isLJo-0003yg-Rd
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 01:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhukeqian1@huawei.com>) id 1isLJY-0003yK-67
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 01:41:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhukeqian1@huawei.com>) id 1isLJT-0003MT-TZ
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 01:41:03 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:53562 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhukeqian1@huawei.com>)
 id 1isLJT-0003Ju-Iz; Fri, 17 Jan 2020 01:40:59 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id A014D327BFE19E16D2E7;
 Fri, 17 Jan 2020 14:40:54 +0800 (CST)
Received: from linux-TFkxOR.huawei.com (10.175.104.212) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Fri, 17 Jan 2020 14:40:46 +0800
From: Keqian Zhu <zhukeqian1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2] hw/arm: Adjust some coding styles about memory hotplug
Date: Fri, 17 Jan 2020 14:38:22 +0800
Message-ID: <20200117063822.57918-1-zhukeqian1@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com,
 zhukeqian <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fCQNjuxO3Wq/

From: zhukeqian <zhukeqian1@huawei.com>

There is extra indent in ACPI GED plug cb. And we can use
existing helper function to trigger hotplug handler plug.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
---

v1->v2:
 - Add Igor's R-b

Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/acpi/generic_event_device.c | 2 +-
 hw/arm/virt.c                  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_devic=
e.c
index 9cee90cc70..55eb29d80a 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -175,7 +175,7 @@ static void acpi_ged_device_plug_cb(HotplugHandler *h=
otplug_dev,
     AcpiGedState *s =3D ACPI_GED(hotplug_dev);
=20
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
-            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp)=
;
+        acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported devi=
ce"
                    " type: %s", object_get_typename(OBJECT(dev)));
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 39ab5f47e0..656b0081c2 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1934,7 +1934,6 @@ static void virt_memory_pre_plug(HotplugHandler *ho=
tplug_dev, DeviceState *dev,
 static void virt_memory_plug(HotplugHandler *hotplug_dev,
                              DeviceState *dev, Error **errp)
 {
-    HotplugHandlerClass *hhc;
     VirtMachineState *vms =3D VIRT_MACHINE(hotplug_dev);
     Error *local_err =3D NULL;
=20
@@ -1943,8 +1942,9 @@ static void virt_memory_plug(HotplugHandler *hotplu=
g_dev,
         goto out;
     }
=20
-    hhc =3D HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
-    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &error_abort);
+    hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
+                         dev, &error_abort);
+
 out:
     error_propagate(errp, local_err);
 }
--=20
2.19.1

