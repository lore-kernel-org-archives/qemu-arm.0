Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp550323lfq;
        Tue, 8 Sep 2020 05:16:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBEbAlNP9pcOHPNJXLWkTfVy6N4gVtcn4Q/20S1Gd4SIhDa9MgRaLR7BhUsrJ0g7pelaJi
X-Received: by 2002:a25:e905:: with SMTP id n5mr12585418ybd.46.1599567415633;
        Tue, 08 Sep 2020 05:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599567415; cv=none;
        d=google.com; s=arc-20160816;
        b=gEXU4tBzGhJmDHPWFUcxdfW2WPYEYPjDFMTRaIe6BelTrQHVeg2lX9KFiWi18mEZdU
         wF6tNv3nREPl3d3tGRI18LbwGHVNbynZNhawmDDC/3orGFmLpBZMnaSMpCd/6KZggoAR
         dg3mUuJMa/ysOTze0TdzCiQ/V59Wp6j1y5CRS1hQjZAg0XMLVQbB0m/7PJP2L2B4HY0K
         tO7FdUE1RL0uPLxmOAksVPxPvaNTz0wEP5gz8z1l2b8rpdR7H1RHpJa950KLWcZCA6Lp
         4etn56YTJ2edNgy8pKKhbcH4Ve5/abJaVq1wvCus09NB7X6I82FMmGevkLUS8/XwOAga
         3ehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=FJ2qhfNiZIWY+tu1okOvVuIhMpkiaN4lXZRnoTMSq7A=;
        b=HHVNdxtWssj9MlnsvF+GKseMPA8efFDKz1AsErKFvLiANoO10fTTUuU2wBP2qdwNVg
         CpjfbYcvgYhKawEZ/+3wD2VEw73wAXVF3f5OK7pSdg07lStYt08bkfMErH7HZiVEi0NF
         6Eyv4bp+eeNcaX5YvFNdOZpTe2wkGye6ITpL942Jt+CZ+KGeEjYGg5aTtxIerPF+zDBk
         Pqpgt7ggSh3vfjF9XFSVyw79rHX1uFn8DKFzOea6OQ0SHRAUz5VOKqBvS2EfPwN+11pt
         YG+xYiphonnBkw1ZT8J3ONmx3wwhVlgO2ehiCZDlA2bn+p9urdsta1NjblmjOIuzzdZc
         P3rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I5kgfQjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y6si13467939ybf.185.2020.09.08.05.16.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 05:16:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I5kgfQjJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFcYR-0000ds-2z
	for alex.bennee@linaro.org; Tue, 08 Sep 2020 08:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcT7-000121-7N
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kFcSo-0005f1-Rs
 for qemu-arm@nongnu.org; Tue, 08 Sep 2020 08:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599567065;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJ2qhfNiZIWY+tu1okOvVuIhMpkiaN4lXZRnoTMSq7A=;
 b=I5kgfQjJK1YVM3FVe7657gd/JZBaC6mnOs4tn9yRzEd1m7UWzGAZIp166VAytkXBrgJBfs
 HNfffCcikTBp6FkXCdzXPKdsG4XIh7GKwZI008EXUX4vu4I4gmod6WHiwnx78V6z5sCDWa
 1TUKjjoRGObREwvsvt0t61BScTvyCWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-SDC0KnogPHeLOzaM6ABYXQ-1; Tue, 08 Sep 2020 08:11:04 -0400
X-MC-Unique: SDC0KnogPHeLOzaM6ABYXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 159DA107B26E;
 Tue,  8 Sep 2020 12:11:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B555F5C5AF;
 Tue,  8 Sep 2020 12:11:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B1E51204A1; Tue,  8 Sep 2020 14:10:50 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/21] acpi: move acpi_dsdt_add_power_button() to ged
Date: Tue,  8 Sep 2020 14:10:35 +0200
Message-Id: <20200908121050.1162-7-kraxel@redhat.com>
In-Reply-To: <20200908121050.1162-1-kraxel@redhat.com>
References: <20200908121050.1162-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: Mm+KV55uU0FK

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
index 9efd7a388150..6bff5e373872 100644
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

