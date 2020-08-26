Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp648648lfc;
        Wed, 26 Aug 2020 04:04:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgwi3SLnfRHzNDMcvAN/d4e3wPb1yYLAG3aGPwPgqrB+BAcCTx7kuSEFXSwOcStGPcVyhy
X-Received: by 2002:a25:e06:: with SMTP id 6mr20649010ybo.80.1598439848000;
        Wed, 26 Aug 2020 04:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598439847; cv=none;
        d=google.com; s=arc-20160816;
        b=rTNkjdY01LABG/qJix2Q1LXgGVuw6UF0kuEycgJlbUOc7oOfAvSWYyv/fRLQJlFVbw
         IoWqxFlHm/IdFNbws70tw1XAcwmvkUrugme/ngw1wJMH2EiLil3ZlssYZCSlAVmGcHaK
         qttlUvzwPsQoMTlueqSu6Lqo2msu8iY50Xown4/yCPhfAEI5eN+3KhbpcQrOt5QLBzhN
         9SPalO8eO9dV/6LAPvQ4eTt8++dK1ge/3v2AkXEKRzDcgLyPfBej1PDVsrPvBCuvCxr/
         dFSYTq0jea6XWCQFBW/KJ8zdLPSbUC90ww3Xx/JfiMxIISojUrbbFzCe8JqE+dCvLOd2
         cEgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=5vPeJxiTdr3LjitG0FXvdMbUGUsc0ozTUcVQZcUeJyY=;
        b=cdQIFkiLPzK4g2SBGof0sUOYImOFhflDfmAPiagatkU3/HDDDkD9DytkvAIRaBNF7I
         bten3moC866fnriQ2gOH2PX8tRz4kyvCVEqDHreY7EaQvIF8b9oBjeA24NecNBkeWVqv
         ppKbSpepJeqHF3aNb4QATE4tM0zdF85GggRT4G8ndjeefGrQ5ZS3QA0ZhyAtFUx9syb2
         dXtfa4f7xZHHBwSws1RQLnm4TAb3dN+zw92KkPSAh6TuME9n4usaWHW+eYG8agkBw+Cs
         lK3Qbe8Nx47IdqQWyJ9XVqamNn6C9CSleaqN8ztwNW88emfc1TtFHYUbeiVYPSs6kZZa
         Gysg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Xcq0pHbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si2021366ybk.28.2020.08.26.04.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Aug 2020 04:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Xcq0pHbd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAtDr-0001qi-BV
	for alex.bennee@linaro.org; Wed, 26 Aug 2020 07:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3b-0006Zd-UQ
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kAt3R-0001aJ-E4
 for qemu-arm@nongnu.org; Wed, 26 Aug 2020 06:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5vPeJxiTdr3LjitG0FXvdMbUGUsc0ozTUcVQZcUeJyY=;
 b=Xcq0pHbdF3tv9la3KXTb0nt8JsRoHoTYTij11XeVV9LcUcwb9YaJHoXYdY0D4G0O2SZJs/
 TlUBa1P8tz0LYGA3e3fQmnhxLArjRv2VYjmPqoVzmj+DQ7AAHLMl72SnJwg7sinnOUgKGo
 QAs6Gp4MWK4bhUpRp9AQDXiQ4AgpN18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-oU3gmxRlOxul4dwCrgm_BQ-1; Wed, 26 Aug 2020 06:53:16 -0400
X-MC-Unique: oU3gmxRlOxul4dwCrgm_BQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D37280733C;
 Wed, 26 Aug 2020 10:53:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-54.ams2.redhat.com
 [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA2474E0B;
 Wed, 26 Aug 2020 10:53:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5B600B17; Wed, 26 Aug 2020 12:52:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/20] acpi: move acpi_dsdt_add_power_button() to ged
Date: Wed, 26 Aug 2020 12:52:40 +0200
Message-Id: <20200826105254.28496-7-kraxel@redhat.com>
In-Reply-To: <20200826105254.28496-1-kraxel@redhat.com>
References: <20200826105254.28496-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OAhE+PDrpdRX

Allow reuse for microvm.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/generic_event_device.h | 1 +
 hw/acpi/generic_event_device.c         | 8 ++++++++
 hw/arm/virt-acpi-build.c               | 8 --------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index bd79cfff2b6a..af6fa36ae7e4 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -118,5 +118,6 @@ typedef struct AcpiGedState {
 
 void build_ged_aml(Aml *table, const char* name, HotplugHandler *hotplug_dev,
                    uint32_t ged_irq, AmlRegionSpace rs, hwaddr ged_base);
+void acpi_dsdt_add_power_button(Aml *scope);
 
 #endif
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 491df80a5cc7..6df400e1ee16 100644
--- a/hw/acpi/generic_event_device.c
+++ b/hw/acpi/generic_event_device.c
@@ -142,6 +142,14 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
     aml_append(table, dev);
 }
 
+void acpi_dsdt_add_power_button(Aml *scope)
+{
+    Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
+    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
+    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+    aml_append(scope, dev);
+}
+
 /* Memory read by the GED _EVT AML dynamic method */
 static uint64_t ged_evt_read(void *opaque, hwaddr addr, unsigned size)
 {
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 91f0df7b13a3..775b2acd28c9 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -357,14 +357,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
     aml_append(scope, dev);
 }
 
-static void acpi_dsdt_add_power_button(Aml *scope)
-{
-    Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
-    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
-    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
-    aml_append(scope, dev);
-}
-
 static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 {
     PlatformBusDevice *pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
-- 
2.27.0

