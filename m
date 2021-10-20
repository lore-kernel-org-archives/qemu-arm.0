Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1831562lfc;
        Wed, 20 Oct 2021 10:36:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLQb+NmLtdFrcj0R72wPavvGFxvP7IRBUdIohSo3a+gfduqAKFyiRf+cYJ7HXI9X85YQG6
X-Received: by 2002:ab0:344e:: with SMTP id a14mr720068uaq.63.1634751360446;
        Wed, 20 Oct 2021 10:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634751360; cv=none;
        d=google.com; s=arc-20160816;
        b=QalXxKHau2JsriYpPBQZeCzizoF7GgzptGGYVli2WfZ+vp+WZlSf1UK1EFGGsvm8zG
         Kj/kMzqAKL443PIscGC28yYXqnQA/ybkLQLDh+DyYeZns+pJ2QLKugZ+akYB1CMdoqXl
         JYxr+LbMJDNFUv2/66oFOMA6B6ZhHfnfIwB5y7cx5FONIvzSrRs5DQn/2xVirn9/RqQ/
         4l059YrywvOtVIOJMQ3iD30af/dhK9ozGD6qy4IFaUX/E42K7HzyN+5GuyW3E8+irdBv
         0+AHfABINSx9H/kr/NruwE2iNn6rTl1ePpWFsLhVBze6hUGEmpNtOZh6ub4Vhdb5zcIG
         qnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=i19WYEt+XB11rUrQQOBD1fOttTO4Ul1mLLVvAi2QvL0=;
        b=ysiPkicqyvHGOj1i3lpJMwJETKH1OI0oNlghT38VXj7S9FnRM5PF/rtHoHMx8Gcvvs
         J78+MDuzRplDSbMrz/Oo+N2++znO6SbbOJGudaDZ47HlAsSKEYfmsmVlx+LIvac12RLn
         EDg16ETHbNYlL3Ww8KJ6iMjVrC2RhyjYGDDPQuDYXEKjXf7NKC+1asiQgCkyXGpRF3g2
         Jqqno05XN4WNd46az4XauWwprfl/KBwXAvHZRq0XF5+CEiJotmXywa3jayPjL+wfNEVu
         rpsr+lvKmaPgG0611gMXL3+UJfnJt/7TxI9oFrt5XWH0zd5cAgAVmD+BWcGwKdNroL1B
         7gXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oqel96G8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si3073054vsj.393.2021.10.20.10.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Oct 2021 10:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Oqel96G8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mdFVP-0005oU-HC
	for alex.bennee@linaro.org; Wed, 20 Oct 2021 13:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUV-00050K-GU
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 13:35:03 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mdFUS-0002Wz-Ee
 for qemu-arm@nongnu.org; Wed, 20 Oct 2021 13:35:03 -0400
Received: by mail-wr1-x432.google.com with SMTP id k7so39153wrd.13
 for <qemu-arm@nongnu.org>; Wed, 20 Oct 2021 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i19WYEt+XB11rUrQQOBD1fOttTO4Ul1mLLVvAi2QvL0=;
 b=Oqel96G8KkMs+V7uijvFVKlNu1aAI7tWMVk4ngzBBJGugNrbTAFYNvr5K90O/XOa4g
 TfG/1REB07tikL1t5f1iUoFPIO4Zi6031P0NEogqtmtjqlEAePTXAhT4psk95NtfTUad
 S3KGk8YJgNgwjIcpIzKYnFrE52vQcaHRr/xoGUWYpeVopul2zKACocy/Zp8fm9TTyRw3
 kXNXW8oMJ8xoeRg+OlN+kudVXGl52ZsWuRX1y4d2JeSuHU9Ofy77NNrikMBiUM1KfyO9
 1Rhie/kGkTgnD+61LRujP+ZKkU6Wie7RXNWROBgyJ/1x7XKXssD85qTR0I/SegZyjhBt
 1iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i19WYEt+XB11rUrQQOBD1fOttTO4Ul1mLLVvAi2QvL0=;
 b=RceQmWygHheRi0tBYXPygZF/jsgYOP4vbKtxqj10d11QFqtqBLE/HQ5oZnxqcU82HJ
 Gbzdd55ncbbi6OGIJx1hMlzVQMYWzzrBWsE/C2GdwJ/ywHvW6XF82s1jkSpgrSXokZcF
 ZhXJkWtgIVwal/MWdpT1dncQukhILcTlkPv/F74BCNvWI472BFoxkRzTa2eQ0sp+fNS2
 crXjfHxElsa8YbnXmFiWbgJ/wtr3UiYmi/0BtHKVKHrMvVg8UGH7C0+OQhBWCYGdPZ1R
 y9TmMQu89ToTnyWCzSFaipwYF7eG890pDZCxXckO23iOGsCSavJSVQ95FtQqXNg0BdLB
 LGzA==
X-Gm-Message-State: AOAM530xCQSkFlY2mpMJKFNSngFUTnAcX15G61E74UtJXRIJ0178XYIW
 MpW+FvySweAGTrO+bFE3UQXCZw==
X-Received: by 2002:adf:bc12:: with SMTP id s18mr756123wrg.328.1634751298973; 
 Wed, 20 Oct 2021 10:34:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id n7sm2662270wrp.17.2021.10.20.10.34.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 10:34:58 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com,
	imammedo@redhat.com,
	peter.maydell@linaro.org
Subject: [PATCH v5 02/12] hw/i386/pc: Remove x86_iommu_get_type()
Date: Wed, 20 Oct 2021 18:27:36 +0100
Message-Id: <20211020172745.620101-3-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020172745.620101-1-jean-philippe@linaro.org>
References: <20211020172745.620101-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, ehabkost@redhat.com,
 eric.auger@redhat.com, jasowang@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, peterx@redhat.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CZOW0TC3W4k1

To generate the IOMMU ACPI table, acpi-build.c can use base QEMU types
instead of a special IommuType value.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/hw/i386/x86-iommu.h | 12 ------------
 hw/i386/acpi-build.c        | 20 +++++++++-----------
 hw/i386/amd_iommu.c         |  2 --
 hw/i386/intel_iommu.c       |  3 ---
 hw/i386/x86-iommu-stub.c    |  5 -----
 hw/i386/x86-iommu.c         |  5 -----
 6 files changed, 9 insertions(+), 38 deletions(-)

diff --git a/include/hw/i386/x86-iommu.h b/include/hw/i386/x86-iommu.h
index 9de92d33a1..5ba0c056d6 100644
--- a/include/hw/i386/x86-iommu.h
+++ b/include/hw/i386/x86-iommu.h
@@ -33,12 +33,6 @@ OBJECT_DECLARE_TYPE(X86IOMMUState, X86IOMMUClass, X86_IOMMU_DEVICE)
 typedef struct X86IOMMUIrq X86IOMMUIrq;
 typedef struct X86IOMMU_MSIMessage X86IOMMU_MSIMessage;
 
-typedef enum IommuType {
-    TYPE_INTEL,
-    TYPE_AMD,
-    TYPE_NONE
-} IommuType;
-
 struct X86IOMMUClass {
     SysBusDeviceClass parent;
     /* Intel/AMD specific realize() hook */
@@ -71,7 +65,6 @@ struct X86IOMMUState {
     OnOffAuto intr_supported;   /* Whether vIOMMU supports IR */
     bool dt_supported;          /* Whether vIOMMU supports DT */
     bool pt_supported;          /* Whether vIOMMU supports pass-through */
-    IommuType type;             /* IOMMU type - AMD/Intel     */
     QLIST_HEAD(, IEC_Notifier) iec_notifiers; /* IEC notify list */
 };
 
@@ -140,11 +133,6 @@ struct X86IOMMU_MSIMessage {
  */
 X86IOMMUState *x86_iommu_get_default(void);
 
-/*
- * x86_iommu_get_type - get IOMMU type
- */
-IommuType x86_iommu_get_type(void);
-
 /**
  * x86_iommu_iec_register_notifier - register IEC (Interrupt Entry
  *                                   Cache) notifiers
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 81418b7911..ab49e799ff 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2488,6 +2488,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
     PCMachineState *pcms = PC_MACHINE(machine);
     PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
     X86MachineState *x86ms = X86_MACHINE(machine);
+    X86IOMMUState *iommu = x86_iommu_get_default();
     GArray *table_offsets;
     unsigned facs, dsdt, rsdt, fadt;
     AcpiPmInfo pm;
@@ -2604,17 +2605,14 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
         build_mcfg(tables_blob, tables->linker, &mcfg, x86ms->oem_id,
                    x86ms->oem_table_id);
     }
-    if (x86_iommu_get_default()) {
-        IommuType IOMMUType = x86_iommu_get_type();
-        if (IOMMUType == TYPE_AMD) {
-            acpi_add_table(table_offsets, tables_blob);
-            build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
-                            x86ms->oem_table_id);
-        } else if (IOMMUType == TYPE_INTEL) {
-            acpi_add_table(table_offsets, tables_blob);
-            build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
-                           x86ms->oem_table_id);
-        }
+    if (object_dynamic_cast(OBJECT(iommu), TYPE_AMD_IOMMU_DEVICE)) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_amd_iommu(tables_blob, tables->linker, x86ms->oem_id,
+                        x86ms->oem_table_id);
+    } else if (object_dynamic_cast(OBJECT(iommu), TYPE_INTEL_IOMMU_DEVICE)) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_dmar_q35(tables_blob, tables->linker, x86ms->oem_id,
+                       x86ms->oem_table_id);
     }
     if (machine->nvdimms_state->is_enabled) {
         nvdimm_build_acpi(table_offsets, tables_blob, tables->linker,
diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 9242a0d3ed..91fe34ae58 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1538,7 +1538,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
     int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
-    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     PCMachineState *pcms = PC_MACHINE(ms);
     X86MachineState *x86ms = X86_MACHINE(ms);
@@ -1548,7 +1547,6 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
                                      amdvi_uint64_equal, g_free, g_free);
 
     /* This device should take care of IOMMU PCI properties */
-    x86_iommu->type = TYPE_AMD;
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 75f075547f..c27b20090e 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3806,9 +3806,6 @@ static void vtd_realize(DeviceState *dev, Error **errp)
     X86MachineState *x86ms = X86_MACHINE(ms);
     PCIBus *bus = pcms->bus;
     IntelIOMMUState *s = INTEL_IOMMU_DEVICE(dev);
-    X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
-
-    x86_iommu->type = TYPE_INTEL;
 
     if (!vtd_decide_config(s, errp)) {
         return;
diff --git a/hw/i386/x86-iommu-stub.c b/hw/i386/x86-iommu-stub.c
index c5ba077f9d..781b5ff922 100644
--- a/hw/i386/x86-iommu-stub.c
+++ b/hw/i386/x86-iommu-stub.c
@@ -36,8 +36,3 @@ bool x86_iommu_ir_supported(X86IOMMUState *s)
 {
     return false;
 }
-
-IommuType x86_iommu_get_type(void)
-{
-    abort();
-}
diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
index 86ad03972e..dc968c7a53 100644
--- a/hw/i386/x86-iommu.c
+++ b/hw/i386/x86-iommu.c
@@ -98,11 +98,6 @@ X86IOMMUState *x86_iommu_get_default(void)
     return x86_iommu_default;
 }
 
-IommuType x86_iommu_get_type(void)
-{
-    return x86_iommu_default->type;
-}
-
 static void x86_iommu_realize(DeviceState *dev, Error **errp)
 {
     X86IOMMUState *x86_iommu = X86_IOMMU_DEVICE(dev);
-- 
2.33.0

