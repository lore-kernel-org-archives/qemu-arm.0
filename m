Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1339257njb;
        Wed, 14 May 2025 10:06:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxo/vzjX5jyVVWtepNLp5cAizeGA120s/nNpS7PyOM0D5FGoD3BM3frCgWTtODmdGJeXH/3wuiOP9fBQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGg+kSkHhmS2P9F9CadDK12gtCVsqac0RNot/Ux2UdYjUJmwcmvfFxf+7JJaM+gi9bgnGQ8
X-Received: by 2002:a05:622a:1dc7:b0:476:91d8:230e with SMTP id d75a77b69052e-49495d2dc6bmr73865591cf.52.1747242415851;
        Wed, 14 May 2025 10:06:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747242415; cv=none;
        d=google.com; s=arc-20240605;
        b=GXZKI86DYNrBRKThgSJgoIvKF2I4JRsaFt84b7jpRPsSJ0f2ixDiRPsXe3SN0BB8oo
         jobGdoeWtrFIozJRcGHYjK0PJpyKvgDR7FtK4yHqIn3l5zdrvmGLBmZMiD7zAVAHycdK
         GgWfrkLCHORyH2KitpbA/BjRu8JKLFyxXiLUUaupX/PBg2k3/rygFML4lP22ytP0RPwe
         3ejGXOBUolXCNLL3Mv5Q4kjTcCPX7Vamzidi/qYrmQDifTWWIvRet5wq8Uw5LjnQPi2w
         ckQ6nd8NSzIBOgT/u5d15TGBbBx+WLny82XiqLrrxlyfyPuujIu4pYLQqSZPneoGqdNC
         8Sag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VO/Qs8CcpoojQBEONdSM5eGzVjXioY6K9GJ3PwzM41o=;
        fh=uYJrYLplVlPp9m4JQmP4YNBZY8OxB84kzGSMUd/o4NA=;
        b=GkRa7xhFD4MM8St1AbK3uOKUzAcisdosQBR+7XoLxi6VcHWeVVDm+Qq6yH05pyIqyZ
         y1UppeJYVXqnltj4NuPLM9E3FAYR+WORPL2S5d/PukD9i7bZuLKna8B8m8aRg6IjhqJH
         s8k25fxG+kmSkda+5RkWgF98x5dlplr+RzmAz32za9Lo6Qpz9PGBEUq+8OtPgok5x6l6
         +usnw4epp6g4Rmt+67l9BSTyBwJglMgU9J+fNx79828Cu0NWcWCq/70IS+j/+gJl1tDo
         jvX+R6j1xOG6XwHkZFhcfmP3rTd8lSS+Ui0b+hY7rrk3pUlyHsvebDm3IA3qH+3Ll1Gu
         y7pw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MdS5YH1t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494525b364esi132089531cf.670.2025.05.14.10.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 10:06:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MdS5YH1t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uFFYj-000343-1g; Wed, 14 May 2025 13:06:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYe-0002xQ-Fr
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFYa-0007od-SM
 for qemu-devel@nongnu.org; Wed, 14 May 2025 13:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747242372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VO/Qs8CcpoojQBEONdSM5eGzVjXioY6K9GJ3PwzM41o=;
 b=MdS5YH1teC1UOAF5Qxthaahf18J1aQbBeglfGrRtkE7IVkBbVR5rB3M3ryItdOtZA7KC7s
 LAiLDYwoW4fAvq4K+d758l5DlSsIkW2t/FNgu/YMJ2UMWoLceB2SW+YonF5ZxMcD9+39UL
 c6gYl1ZGE0PBL+qPk5Q9jVhXhamkqBs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-npVmSQDjNkmhv1J-rz1Hbw-1; Wed,
 14 May 2025 13:06:08 -0400
X-MC-Unique: npVmSQDjNkmhv1J-rz1Hbw-1
X-Mimecast-MFC-AGG-ID: npVmSQDjNkmhv1J-rz1Hbw_1747242366
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 83737195609E; Wed, 14 May 2025 17:06:06 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 305B630001B1; Wed, 14 May 2025 17:06:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com,
	philmd@linaro.org
Subject: [PATCH 17/22] hw/acpi/ged: Call pcihp plug callbacks in hotplug
 handler implementation
Date: Wed, 14 May 2025 19:01:04 +0200
Message-ID: <20250514170431.2786231-18-eric.auger@redhat.com>
In-Reply-To: <20250514170431.2786231-1-eric.auger@redhat.com>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: f//iNCKW/TGG

Add PCI device related code in the TYPE_HOTPLUG_HANDLER
implementation.

For a PCI device hotplug/hotunplug event, the code routes to
acpi_pcihp_device callbacks (pre_plug_cb, plug_cb, unplug_request_cb,
unplug_cb).

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index dc3620553d..519329e2ef 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -17,6 +17,7 @@
 #include "hw/irq.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
+#include "hw/pci/pci_device.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
@@ -235,6 +236,17 @@ static const MemoryRegionOps ged_regs_ops = {
     },
 };
 
+static void acpi_ged_device_pre_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_pre_plug_cb(hotplug_dev, dev, errp);
+    } else {
+        error_setg(errp, "virt: device pre plug request for unsupported device"
+                   " type: %s", object_get_typename(OBJECT(dev)));
+    }
+}
+
 static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
                                     DeviceState *dev, Error **errp)
 {
@@ -248,6 +260,8 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
         }
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_plug_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_plug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "virt: device plug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -264,6 +278,9 @@ static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_request_cb(hotplug_dev, &s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_request_cb(hotplug_dev, &s->pcihp_state,
+                                            dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug request for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -279,6 +296,8 @@ static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
         acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
     } else if (object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         acpi_cpu_unplug_cb(&s->cpuhp_state, dev, errp);
+    } else if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        acpi_pcihp_device_unplug_cb(hotplug_dev, &s->pcihp_state, dev, errp);
     } else {
         error_setg(errp, "acpi: device unplug for unsupported device"
                    " type: %s", object_get_typename(OBJECT(dev)));
@@ -495,6 +514,7 @@ static void acpi_ged_class_init(ObjectClass *class, const void *data)
     dc->vmsd = &vmstate_acpi_ged;
     dc->realize = acpi_ged_realize;
 
+    hc->pre_plug = acpi_ged_device_pre_plug_cb;
     hc->plug = acpi_ged_device_plug_cb;
     hc->unplug_request = acpi_ged_unplug_request_cb;
     hc->unplug = acpi_ged_unplug_cb;
-- 
2.49.0

