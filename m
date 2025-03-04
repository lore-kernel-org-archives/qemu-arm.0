Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp121394njm;
        Tue, 4 Mar 2025 05:31:20 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVW90D74rxKXUMt3jwwL/YGv7gpuj0y5X5LexUWVqGSmStTqwZ192WOmHaSWk7NbRF/yZK/rZ7J1pZagg==@linaro.org
X-Google-Smtp-Source: AGHT+IG3xG8g100H7JtFUr0+3QzfwSwSWcv2/6nnvJ2vsEckNou83fyocrPcdc7B4jULbNKHzZqB
X-Received: by 2002:a05:6808:2a0d:b0:3f6:7782:b5c8 with SMTP id 5614622812f47-3f67782b934mr2262369b6e.4.1741095080189;
        Tue, 04 Mar 2025 05:31:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1741095080; cv=pass;
        d=google.com; s=arc-20240605;
        b=IYaw7YcrGJVp7DeTOk2SPvs4sKCm20PjEh+Sra4/uOmckjbjp/gjUZW97RCLlrZXKO
         RIS1sY6QeImQxEqcZFEI7VfTXFJx/GIiwQw/n1u+9xgsDM1U4O2XcnTZUAH2tP5mcpqz
         nFe+QZ229uGXbckkMRbXPtLN98uuavTBukqqKq9n2MuszWZ0h5wVe9lIGInTHze0kz3O
         3GIz2wDw71w0kvn3WPAaYGXYvDl+gJxmSl0T8iU+bNGS3FIO0w6h3oZewXvecQZrPy+Y
         gMTCTingmaHvHUSQB+gmeEBt3DrezWjTNP+i6dc+qdhowMDeJzk2dMJviMkRN0iFUuiG
         1WUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=3Y8lQQ9kFG2escT82ucyNt1js1/voRTfyNLejysnsXk=;
        fh=jBoBeWZtx6t1JRgchJ1OjCBz08cgIbaow9T0o3r0Jeg=;
        b=NQHIOgyNII7Fxn2XhVU4lepelvcCiqqU8SZ6hPBSYBBXizTXSGpb5dO3AVSipkSnYu
         oYLpjovjV/TD4SGDjjz5cnZyti/qDDanpnw4nYsOOwg7rjgkdYghv0QJ1tQ47HB3ZXJp
         34xumlgH+tiA44L1nqbZmJrkvJoXyB9BLIZo2HS3RcMasNBz7vFGKhzyZFwj1+Ifa4LZ
         QIrw1Ajyr3u/GTEY0+B0QFA4r6DXyyiWlReKxPYT2EzlDWAcDgyymDbtJ1s94yR9KVA+
         jHnZQhNfzVyCbByqhCtfVlzZc/2pwKUXpOyczznb2ITiJOFtK2jY9yX0CFD9QHwiOdpH
         QK9g==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RyBfluVh;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-544246-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-544246-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <linux-kernel+bounces-544246-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 5614622812f47-3f67b225e7csi1086673b6e.255.2025.03.04.05.31.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:31:20 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-544246-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=RyBfluVh;
       arc=pass (i=1 dkim=pass dkdomain=kernel.org);
       spf=pass (google.com: domain of linux-kernel+bounces-544246-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-544246-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E953A5900
	for <alex.bennee@linaro.org>; Tue,  4 Mar 2025 13:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AE31F5616;
	Tue,  4 Mar 2025 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyBfluVh"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B941E4A4
	for <linux-kernel@vger.kernel.org>; Tue,  4 Mar 2025 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741095076; cv=none; b=tfN5XLLkbA0qYRJ0AGuluk1ZLWL6K7LW+XaaqgjBePsgBX3eXO1vbOlokWML1dRaiH+tWsrHw9kzhstFXDTJXGvp7nYulMqMVr717m1e0YM2aBdiKYr1FLELHPl1h4ZozlB3cgXxNRVG5ulYOB3iqo3bE+QwzkJipkAu3WIL/I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741095076; c=relaxed/simple;
	bh=Rwv2wLoIBvRhAgKWWClzSANMSkoeu+rvgHxKTeUDCH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcdVveb3iUq+M3sZYAC9Gc6joF7/tBhIxh/NSCFfGTMPQtQucYJYaNffZ8o9FEHwO/wEZBhkHy7NOBvT0t7a+P37pWpXeKSJI0HGNgr9OMcBsiGmCBWElBTaNM0j/WLDfF0Auq3kXTPD1B76jJfQSdsuWml1G80XBfxIleqn5hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyBfluVh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85786C4AF09;
	Tue,  4 Mar 2025 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741095076;
	bh=Rwv2wLoIBvRhAgKWWClzSANMSkoeu+rvgHxKTeUDCH4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RyBfluVh9AW1heRqsBLhFvuaz0KG7lK04XJMzCj2ULOWmlEcGb9Kj1BHCQHNyc7ZS
	 85kXmjZToHjgfBNYI+kdhpZB7l9eNgL8rxPiWXJKr7CAnjj8swadsQwpwQVpFoQ8ky
	 S32mbEliW+SLn3AMdEyHyDZXCrGnEdxXr7xOiqrzAF3Axab39wSp3P8z2KJ7baPiEy
	 nqTbiyB/EjINL9zbKuXvV9xtgzo1mY5CUP+h02xEPlK5yR/adInpR06ZP9NteXsyph
	 vxLVSpT0pEU79ZgQOroMQ9a5plYypgBz53F0rwr0x1GmHdwNu9nlhjVyHiHPXWy/EQ
	 8p35LbpnceRNw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tpSMc-00000005rnX-28Ap;
	Tue, 04 Mar 2025 14:31:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 3/3] Add a GED device for RAS notification
Date: Tue,  4 Mar 2025 14:30:58 +0100
Message-ID: <453dbc6c5030c654489d3c7e4da078589f24f9ec.1741094512.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1741094512.git.mchehab+huawei@kernel.org>
References: <cover.1741094512.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-TUID: C13HoLYW7dcQ

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/i386/acpi-build.c  | 42 ++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc.c          |  7 +++----
 include/hw/i386/x86.h |  2 ++
 3 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index cf11231b5fe6..ad829e2c75c8 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1352,6 +1352,28 @@ static void build_acpi0017(Aml *table)
     aml_append(table, scope);
 }
 
+#define GED_COMMON_MMIO_BASE         0xfee00000
+#define GED_COMMON_MMIO_BASE_REGS    (GED_COMMON_MMIO_BASE + 0x100)
+#define GED_MMIO_IRQ          9
+
+static DeviceState *create_acpi_ged(X86MachineState *x86ms)
+{
+    DeviceState *dev = qdev_new(TYPE_ACPI_GED);
+
+    fprintf(stderr, "creating GED\n");
+
+    assert(x86ms->gsi);
+
+    qdev_prop_set_uint32(dev, "ged-event", ACPI_GED_ERROR_EVT);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, GED_COMMON_MMIO_BASE);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, GED_COMMON_MMIO_BASE_REGS);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, x86ms->gsi[GED_MMIO_IRQ]);
+
+    return dev;
+}
+
 static void
 build_dsdt(GArray *table_data, BIOSLinker *linker,
            AcpiPmInfo *pm, AcpiMiscInfo *misc,
@@ -1794,6 +1816,26 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         aml_append(dsdt, scope);
     }
 
+    /* Notification type SCI requires GED */
+    if (pcms->ras) {
+        if (!x86ms->ged_dev) {
+            x86ms->ged_dev = create_acpi_ged(x86ms);
+        }
+
+        sb_scope = aml_scope("_SB");
+        build_ged_aml(sb_scope, GED_DEVICE, HOTPLUG_HANDLER(x86ms->ged_dev),
+                      GED_MMIO_IRQ, AML_SYSTEM_MEMORY, GED_COMMON_MMIO_BASE);
+        aml_append(sb_scope, aml_error_device());
+        aml_append(dsdt, sb_scope);
+
+        scope =  aml_scope("_GPE");
+        method = aml_method("L08", 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_notify(aml_name("\\_SB.GEDD"),
+                                      aml_int(0x80)));
+        aml_append(scope, method);
+        aml_append(dsdt, scope);
+    }
+
     /* copy AML table into ACPI tables blob and patch header there */
     g_array_append_vals(table_data, dsdt->buf->data, dsdt->buf->len);
     acpi_table_end(linker, &table);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b9c32dbdbcd8..b4a2fe61da49 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1700,6 +1700,8 @@ static void virt_set_ras(Object *obj, bool value, Error **errp)
 
 static void pc_sci_error(Notifier *n, void *opaque)
 {
+    PCMachineState *pcms = container_of(n, PCMachineState, ghes_sci_notifier);
+    X86MachineState *x86ms = X86_MACHINE(pcms);
     uint16_t *source_id = opaque;
 
     fprintf(stderr, "GHES error for source ID: %d\n", *source_id);
@@ -1710,10 +1712,7 @@ static void pc_sci_error(Notifier *n, void *opaque)
 
     fprintf(stderr, "GHES error notified for QMP\n");
 
-    // TODO: add something equivalent to:
-    // PCMachineState *s = container_of(n, PCMachineState, ghes_sci_notifier);
-    // acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
-    // by calling acpi_update_sci();
+    acpi_send_event(x86ms->ged_dev, ACPI_GENERIC_ERROR);
 }
 
 static void pc_machine_initfn(Object *obj)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index d43cb3908e65..06d62a944835 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -54,6 +54,8 @@ struct X86MachineState {
     GMappedFile *initrd_mapped_file;
     HotplugHandler *acpi_dev;
 
+    DeviceState *ged_dev;
+
     /*
      * Map the whole BIOS just underneath the 4 GiB address boundary. Only used
      * in the ROM (-bios) case.
-- 
2.48.1

