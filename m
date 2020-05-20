Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp576424lfb;
        Wed, 20 May 2020 06:24:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBbTiX55+ew0wRVrRdhWQPCZ5UMmfjJbJaz0nTo73sRUxTrpFBDlW3sUjEhvpUaJB5GR0x
X-Received: by 2002:a05:620a:81a:: with SMTP id s26mr4302857qks.301.1589981064961;
        Wed, 20 May 2020 06:24:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981064; cv=none;
        d=google.com; s=arc-20160816;
        b=JpBO9ChRZnn+8rvVCco1EGQkRjcxbbOBAHYh83TLMdrATFJdPoo0pLqFuN1S3Kc/pZ
         vgDjhLQd2Fl5JPcDIxbTL7/qjPManuD3RXlWhq6kwOyEOJSoF/TsUopCkGgEnTiBsXmd
         F9ZXFY475s9GFLNTSje3hWI57YlivPxQsbpoAEnUxtlEuvCgfsidAjFwAWxzDlWOgXrf
         MtMfwK37LcAsF/YCxu4TczbRKf/8dNwejtIWVgLcTRti8/qEWnc6I5E+2Hp0c3e06aDS
         66Sl6ZvGa40VXp+Jh+MpwOHRUu4Ab4Eref3wfbyhQHphg6X/GJyAN/tDfT0n3kVj7fxF
         AvQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=32ngCCY5XQvXtiBfjV3PXfYOD4t6Ktpz2yP0bM/R6jk=;
        b=ZEIkB61J5aBaGvS1+nYiFBrj7jdfuAZzTEiY2B1FpORyZ0kLwqKthhO9f7iYVEv6AO
         gDxmIvP6iyxR3Obzgj/VjqlY4KYpH2tf+UVwr/GfmO0uoIm52eeQhk216f3jtqzg7L/t
         BAxmwaUfThOIQF30pZYJ49/1Zw/mJ4HYdOGJfliam1srsJdhW96wg+sP+ZJowabTOwbQ
         xlAL/3dT51XfuIcR0Rz2STQphmNWDFk4e6p6xk8NVxdAcVa4PtoOUDH6qgl3jlz8Xm6E
         zXmK9EyVfgnMaj7JD1ThdmSpPcjv8slX7g8K/qScY3SxHmhy4wQu9NkLOOizdqZuuKgJ
         a5FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VVInV6YQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si1767886qks.154.2020.05.20.06.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:24:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VVInV6YQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOhs-0001eB-DH
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe7-0001xl-Ob
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:36264
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe6-0000GU-6o
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:20:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=32ngCCY5XQvXtiBfjV3PXfYOD4t6Ktpz2yP0bM/R6jk=;
 b=VVInV6YQDM8AQHEYZK2PBTXZKQWBDhpQWkA6iwAOhQBExYlvjlIhWPZ8MU6SY5pSjIqcPA
 scwC24iP0JaxSbxMmTA2sqdOwc+cSQg+Drwd9WJM+MUHNzr4lLDwDNB07/l9gOQpJRKPuE
 x6crjLGmlCdZ3H0a0MnTBoO7p/OcTI4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-IX0FXKg7N7q2837GRwzVaQ-1; Wed, 20 May 2020 09:20:25 -0400
X-MC-Unique: IX0FXKg7N7q2837GRwzVaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53A371902EA0;
 Wed, 20 May 2020 13:20:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E695D5C1BE;
 Wed, 20 May 2020 13:20:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1DCA99D5B; Wed, 20 May 2020 15:20:04 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/22] acpi: move acpi_dsdt_add_power_button() to ged
Date: Wed, 20 May 2020 15:19:53 +0200
Message-Id: <20200520132003.9492-13-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 02:22:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XaVET/J7r4/n

Allow reuse for microvm.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/acpi/generic_event_device.h | 1 +
 hw/acpi/generic_event_device.c         | 8 ++++++++
 hw/arm/virt-acpi-build.c               | 8 --------
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
index 9687cb524258..ebed1ffe4231 100644
--- a/include/hw/acpi/generic_event_device.h
+++ b/include/hw/acpi/generic_event_device.h
@@ -113,5 +113,6 @@ typedef struct AcpiGedState {
 
 void build_ged_aml(Aml *table, const char* name, HotplugHandler *hotplug_dev,
                    uint32_t ged_irq, AmlRegionSpace rs, hwaddr ged_base);
+void acpi_dsdt_add_power_button(Aml *scope);
 
 #endif
diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
index 3072fb4ab32b..cde50da5b3ca 100644
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
index 1b0a584c7b62..49eacc622219 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -354,14 +354,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
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
 static void
 build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
-- 
2.18.4

