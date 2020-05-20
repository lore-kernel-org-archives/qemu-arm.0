Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp577573lfb;
        Wed, 20 May 2020 06:25:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9gJIz+Qh+8uGkJGV6ezJbnZw5KT7jDqgzviB+qaToI4F139YFg5/upo98ZRVFzay6ho2Z
X-Received: by 2002:a37:9ecc:: with SMTP id h195mr4684426qke.312.1589981142593;
        Wed, 20 May 2020 06:25:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981142; cv=none;
        d=google.com; s=arc-20160816;
        b=DYNu2ULjsr+5r0k+SXOE94r1VSnNOZX8vpJxz7XrNbaPS5NdlH30YmOwpH3fxCunu3
         AYW5V3USPclqqB/bBE9t3eqynYoyNTv257qQWfsbCjEmrs3lSIl9OrGH6/DGGH6CHKBe
         l+fdcmaB9K6duFFswZ9WMeWCH/7Rl14GFg/SZ7ksvtijz9PpHvTJRMpSuy5Lx/f2EfQt
         wRbBu80TEun3gxldB3zRQHzXV2MwFLZCXumcfjT3Nxm2gye0XWMiLshCzdIgEYkI+A5p
         IeXCm3JE414YQTLm23SPndMmcXQT1CzfkSTeJvg0CkYTqr0869JPSUFBiDAa+dv26dPs
         R1gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pB5IeYNuFWRx8NQO1DyFF01+N5UZOrGfWLQbEq2lfaY=;
        b=GwiaxVSgkvU5Xwq0D3dBXg/kWKgaj7avsUznBEIVU69okRr9tDA3a3mJF6Ll4PLx2y
         WkbA0Oa9Ej82N7au9XX+d3EaaOKq/j3sgDAZTcBvkPflAPSTK+ohyM+zKq/kqwRXkop8
         gpVaHEEM9jqnpos6lyUktzA8u48JHGg4JBCbBcQtRxYrP2JtqUxupivBLBd00JlbPI7V
         XjQM4OEG+vKsxfSoHzZuFlHXVqS7fDdtQRyOAFrNhY2G9tGRuJVD2IC4e5tIBsO+zlT6
         iw+ltbUqCNbP+sjqRT7NuDHk34K2SXoxU1NshltseNx8hYvr1ehL7n8/v0FRW/s5SiVh
         K3uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pk5W5dqZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10si1557170qtf.108.2020.05.20.06.25.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:25:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Pk5W5dqZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOj6-0004CO-VI
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe8-00020y-Rf
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43176
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jbOe7-0000H1-31
 for qemu-devel@nongnu.org; Wed, 20 May 2020 09:20:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589980830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pB5IeYNuFWRx8NQO1DyFF01+N5UZOrGfWLQbEq2lfaY=;
 b=Pk5W5dqZOn4LOdSPxoI3rMgYVkEvtSd5YHetG9oWKbg0eVnpcw0A0xMfEs9crrwkqUnjfS
 E3Gh/BbfIT1nsWtvLKzAkgSglhcodKcMw6Hff1K8j+NMxrT63GWX7KfzWhLyHySGYT6L1s
 w3tko4feXxT8BVWrsv8JmzdsM6E8vw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-P--15fHJPPafMrBkPsPUyg-1; Wed, 20 May 2020 09:20:28 -0400
X-MC-Unique: P--15fHJPPafMrBkPsPUyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18874835B41;
 Wed, 20 May 2020 13:20:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-50.ams2.redhat.com
 [10.36.113.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52C1582A35;
 Wed, 20 May 2020 13:20:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C0B669D54; Wed, 20 May 2020 15:20:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/22] acpi: make build_madt() more generic.
Date: Wed, 20 May 2020 15:19:46 +0200
Message-Id: <20200520132003.9492-6-kraxel@redhat.com>
In-Reply-To: <20200520132003.9492-1-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1XQq6qMhmSI+

Remove PCMachineState dependency from build_madt().
Pass AcpiDeviceIf as separate argument instead of
depending on PCMachineState->acpi_dev.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1afb47b09ee9..4f6418d60b05 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -366,14 +366,13 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 }
 
 static void
-build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pcms)
+build_madt(GArray *table_data, BIOSLinker *linker,
+           X86MachineState *x86ms, AcpiDeviceIf *adev)
 {
-    MachineClass *mc = MACHINE_GET_CLASS(pcms);
-    X86MachineState *x86ms = X86_MACHINE(pcms);
-    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(pcms));
+    MachineClass *mc = MACHINE_GET_CLASS(x86ms);
+    const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
     int madt_start = table_data->len;
-    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(pcms->acpi_dev);
-    AcpiDeviceIf *adev = ACPI_DEVICE_IF(pcms->acpi_dev);
+    AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
     bool x2apic_mode = false;
 
     AcpiMultipleApicTable *madt;
@@ -2534,7 +2533,8 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     aml_len += tables_blob->len - fadt;
 
     acpi_add_table(table_offsets, tables_blob);
-    build_madt(tables_blob, tables->linker, pcms);
+    build_madt(tables_blob, tables->linker, x86ms,
+               ACPI_DEVICE_IF(pcms->acpi_dev));
 
     vmgenid_dev = find_vmgenid_dev();
     if (vmgenid_dev) {
-- 
2.18.4

