Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp578909lfg;
        Fri, 14 May 2021 09:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwks6YNlM6S4t78a3mCQ8/fzCL/U7kEcjQILcQe31hMcjG4yXr99w5cTXJ/MIxI+Hxxi5xL
X-Received: by 2002:a05:6e02:606:: with SMTP id t6mr2555714ils.25.1621009062396;
        Fri, 14 May 2021 09:17:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621009062; cv=none;
        d=google.com; s=arc-20160816;
        b=ODGghvXaYJGGJkLRHMoa4vKxBBk70qisTzUl83GBT0Rh95xNpHXSkG8/c8Ig6Ai78H
         LY5LKs5+GJ2xsrzxTIdo2xX+1orWCWGPX8fYfmts5557ELjt2IG8DWANbQBP+6oEMP2F
         UDsavxLujZxe+ogETUTCzHPanA2944YHJ9h7LaAXyyTEG4qISEpHuU39aUQkO6ob5A4S
         h+nGjbZrS/+jzgCEc94/C2CKSc7E98nTUTX9Bsz8ypYhFLAHmwcGe+U0AO7zrUkurUkG
         iLIciX5aFOwcuQVbnip2jhaEgLp+yQUdGbIlGxoumA1NMTF6cCY1tmkIgHsUg23DL74v
         f0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Ujx8Lv1e2caBXYJlzaGddrRWqvv6Yzw+r3izfZzvwQ4=;
        b=FzjMwgYlrV8mCSPDZblUMHiGNDEw1E2VEThUH16sIlpdXsFhIJtrGiIu5qIJjoksLR
         u4uWCvNOqxlboxqGV4xgdAZ+4m8R5U39xAaHJUxh7PW8wviMJGlNSg25952YyE4mEJOy
         46WRN9ZNa3O2qYVp3HR2WQx/btj3ncwq4ihttLxpUS9kCmGRXPujUCp/Isj0cP9wuMIM
         4JfxISe2jVGHwg2BF5ECQmhQh/oRIyGsRqrLMDzZljHDARtFXyCgkqRO/Izq3QZ3nAk8
         RNHHyuVSmACX62Mj172awITUem8WVUURWaUhTw78ptLehTG1F4o1kqw0YLUEz3GPrH3O
         +GTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dq8vfv8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j23si7500107ila.81.2021.05.14.09.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 May 2021 09:17:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dq8vfv8M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhaVR-0005Gg-Kf
	for alex.bennee@linaro.org; Fri, 14 May 2021 12:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJ6-0007Ad-IC
 for qemu-arm@nongnu.org; Fri, 14 May 2021 12:04:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lhaJ4-0005bE-6q
 for qemu-arm@nongnu.org; Fri, 14 May 2021 12:04:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621008293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ujx8Lv1e2caBXYJlzaGddrRWqvv6Yzw+r3izfZzvwQ4=;
 b=Dq8vfv8M8z3DR70J7FEp2aystkjdSCanEkSh+Epkt6V7QKH4LTe1bOHjIJ4aylLO59MToN
 9pym9NBhxmxX1cjNKOrbAe6MxbMKPQ50bwDTQcYDSaGPKH6DQ74AtW7TWiOjzL4mzuZ0Zm
 SkQfHyFfhmLukytnn/A4vmRr7ZN88v8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-gCUgvc83NoSsn3ZH44n2ZQ-1; Fri, 14 May 2021 12:04:51 -0400
X-MC-Unique: gCUgvc83NoSsn3ZH44n2ZQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so12879006wre.18
 for <qemu-arm@nongnu.org>; Fri, 14 May 2021 09:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ujx8Lv1e2caBXYJlzaGddrRWqvv6Yzw+r3izfZzvwQ4=;
 b=KdscXgPxyE4tBfxEsdvUzQ1hLgw/sDuaStXF5jYTByKu+qpxzIUtNM9UlcL919S3Y9
 RBIIMfDdi6t20w0/q3jKKNmppstpNMmPXYnSldrt1IHFqqFlpLVbJVkRFaI2EHPKKoKn
 Fph4h8sFjR1dElpPEd1Gbd2v85RXM+5OugP2v1wBE2w5ab7ReEBOxw+3LTGxskfN6NDu
 Uw5peWWJHw3x3+0+PZ90uVbbMbTQ6mNmADwzTwGeMHhq13RpZRNd8i9vWS3Ud+FparuE
 J8swVaGM38i62QlQnrPwxH96wQRbXDdQxdKk4Y6xMIQRtibysmhsMtox31Hgr/9A7kzq
 nyYw==
X-Gm-Message-State: AOAM532kPCEgk4ekZxeLyDlXZZ/4luqvut/xq8osi4QhkOAY9NhEkWLU
 Sy0wodzAcuwpHt3Tr5SIAU9vhCCMvrcZgbMJhiO6ezuiY3lPBCGZ67PRCG5uNx2j+zOGKZK/njh
 PgfGgYc2lu9vq
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr27120039wmc.142.1621008289867; 
 Fri, 14 May 2021 09:04:49 -0700 (PDT)
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr27120005wmc.142.1621008289568; 
 Fri, 14 May 2021 09:04:49 -0700 (PDT)
Received: from redhat.com ([2a10:800c:1fa6:0:3809:fe0c:bb87:250e])
 by smtp.gmail.com with ESMTPSA id p20sm6759987wmq.10.2021.05.14.09.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 09:04:49 -0700 (PDT)
Date: Fri, 14 May 2021 12:04:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/16] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <20210514160245.91918-14-mst@redhat.com>
References: <20210514160245.91918-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210514160245.91918-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Vincent Bernat <vincent@bernat.ch>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U1aWzmouPB1h

From: Vincent Bernat <vincent@bernat.ch>

Type 41 defines the attributes of devices that are onboard. The
original intent was to imply the BIOS had some level of control over
the enablement of the associated devices.

If network devices are present in this table, by default, udev will
name the corresponding interfaces enoX, X being the instance number.
Without such information, udev will fallback to using the PCI ID and
this usually gives ens3 or ens4. This can be a bit annoying as the
name of the network card may depend on the order of options and may
change if a new PCI device is added earlier on the commande line.
Being able to provide SMBIOS type 41 entry ensure the name of the
interface won't change and helps the user guess the right name without
booting a first time.

This can be invoked with:

    $QEMU -netdev user,id=internet
          -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \
          -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev

The PCI segment is assumed to be 0. This should hold true for most
cases.

    $ dmidecode -t 41
    # dmidecode 3.3
    Getting SMBIOS data from sysfs.
    SMBIOS 2.8 present.

    Handle 0x2900, DMI type 41, 11 bytes
    Onboard Device
            Reference Designation: Onboard LAN
            Type: Ethernet
            Status: Enabled
            Type Instance: 1
            Bus Address: 0000:00:09.0

    $ ip -brief a
    lo               UNKNOWN        127.0.0.1/8 ::1/128
    eno1             UP             10.0.2.14/24 fec0::5254:ff:fe00:42/64 fe80::5254:ff:fe00:42/64

Signed-off-by: Vincent Bernat <vincent@bernat.ch>
Message-Id: <20210401171138.62970-1-vincent@bernat.ch>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/firmware/smbios.h |  14 +++-
 hw/arm/virt.c                |   7 +-
 hw/i386/fw_cfg.c             |   4 +-
 hw/smbios/smbios.c           | 124 ++++++++++++++++++++++++++++++++++-
 qemu-options.hx              |  30 ++++++++-
 5 files changed, 173 insertions(+), 6 deletions(-)

diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index 02a0ced0a0..5a0dd0c8cf 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -258,6 +258,17 @@ struct smbios_type_32 {
     uint8_t boot_status;
 } QEMU_PACKED;
 
+/* SMBIOS type 41 - Onboard Devices Extended Information */
+struct smbios_type_41 {
+    struct smbios_structure_header header;
+    uint8_t reference_designation_str;
+    uint8_t device_type;
+    uint8_t device_type_instance;
+    uint16_t segment_group_number;
+    uint8_t bus_number;
+    uint8_t device_number;
+} QEMU_PACKED;
+
 /* SMBIOS type 127 -- End-of-table */
 struct smbios_type_127 {
     struct smbios_structure_header header;
@@ -273,5 +284,6 @@ void smbios_get_tables(MachineState *ms,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
                        uint8_t **tables, size_t *tables_len,
-                       uint8_t **anchor, size_t *anchor_len);
+                       uint8_t **anchor, size_t *anchor_len,
+                       Error **errp);
 #endif /* QEMU_SMBIOS_H */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9f01d9041b..26a1e252fe 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -53,6 +53,7 @@
 #include "sysemu/kvm.h"
 #include "hw/loader.h"
 #include "exec/address-spaces.h"
+#include "qapi/error.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
@@ -1524,8 +1525,10 @@ static void virt_build_smbios(VirtMachineState *vms)
                         vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
                         true, SMBIOS_ENTRY_POINT_30);
 
-    smbios_get_tables(MACHINE(vms), NULL, 0, &smbios_tables, &smbios_tables_len,
-                      &smbios_anchor, &smbios_anchor_len);
+    smbios_get_tables(MACHINE(vms), NULL, 0,
+                      &smbios_tables, &smbios_tables_len,
+                      &smbios_anchor, &smbios_anchor_len,
+                      &error_fatal);
 
     if (smbios_anchor) {
         fw_cfg_add_file(vms->fw_cfg, "etc/smbios/smbios-tables",
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index e48a54fa36..4e68d5dea4 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -22,6 +22,7 @@
 #include "hw/nvram/fw_cfg.h"
 #include "e820_memory_layout.h"
 #include "kvm/kvm_i386.h"
+#include "qapi/error.h"
 #include CONFIG_DEVICES
 
 struct hpet_fw_config hpet_cfg = {.count = UINT8_MAX};
@@ -78,7 +79,8 @@ void fw_cfg_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
     }
     smbios_get_tables(ms, mem_array, array_count,
                       &smbios_tables, &smbios_tables_len,
-                      &smbios_anchor, &smbios_anchor_len);
+                      &smbios_anchor, &smbios_anchor_len,
+                      &error_fatal);
     g_free(mem_array);
 
     if (smbios_anchor) {
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index f22c4f5b73..7397e56737 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -27,6 +27,7 @@
 #include "hw/firmware/smbios.h"
 #include "hw/loader.h"
 #include "hw/boards.h"
+#include "hw/pci/pci_bus.h"
 #include "smbios_build.h"
 
 /* legacy structures and constants for <= 2.0 machines */
@@ -118,6 +119,28 @@ static struct {
     uint16_t speed;
 } type17;
 
+static QEnumLookup type41_kind_lookup = {
+    .array = (const char *const[]) {
+        "other",
+        "unknown",
+        "video",
+        "scsi",
+        "ethernet",
+        "tokenring",
+        "sound",
+        "pata",
+        "sata",
+        "sas",
+    },
+    .size = 10
+};
+struct type41_instance {
+    const char *designation, *pcidev;
+    uint8_t instance, kind;
+    QTAILQ_ENTRY(type41_instance) next;
+};
+static QTAILQ_HEAD(, type41_instance) type41 = QTAILQ_HEAD_INITIALIZER(type41);
+
 static QemuOptsList qemu_smbios_opts = {
     .name = "smbios",
     .head = QTAILQ_HEAD_INITIALIZER(qemu_smbios_opts.head),
@@ -358,6 +381,32 @@ static const QemuOptDesc qemu_smbios_type17_opts[] = {
     { /* end of list */ }
 };
 
+static const QemuOptDesc qemu_smbios_type41_opts[] = {
+    {
+        .name = "type",
+        .type = QEMU_OPT_NUMBER,
+        .help = "SMBIOS element type",
+    },{
+        .name = "designation",
+        .type = QEMU_OPT_STRING,
+        .help = "reference designation string",
+    },{
+        .name = "kind",
+        .type = QEMU_OPT_STRING,
+        .help = "device type",
+        .def_value_str = "other",
+    },{
+        .name = "instance",
+        .type = QEMU_OPT_NUMBER,
+        .help = "device type instance",
+    },{
+        .name = "pcidev",
+        .type = QEMU_OPT_STRING,
+        .help = "PCI device",
+    },
+    { /* end of list */ }
+};
+
 static void smbios_register_config(void)
 {
     qemu_add_opts(&qemu_smbios_opts);
@@ -773,6 +822,53 @@ static void smbios_build_type_32_table(void)
     SMBIOS_BUILD_TABLE_POST;
 }
 
+static void smbios_build_type_41_table(Error **errp)
+{
+    unsigned instance = 0;
+    struct type41_instance *t41;
+
+    QTAILQ_FOREACH(t41, &type41, next) {
+        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
+
+        SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
+        t->device_type = t41->kind;
+        t->device_type_instance = t41->instance;
+        t->segment_group_number = cpu_to_le16(0);
+        t->bus_number = 0;
+        t->device_number = 0;
+
+        if (t41->pcidev) {
+            PCIDevice *pdev = NULL;
+            int rc = pci_qdev_find_device(t41->pcidev, &pdev);
+            if (rc != 0) {
+                error_setg(errp,
+                           "No PCI device %s for SMBIOS type 41 entry %s",
+                           t41->pcidev, t41->designation);
+                return;
+            }
+            /*
+             * We only handle the case were the device is attached to
+             * the PCI root bus. The general case is more complex as
+             * bridges are enumerated later and the table would need
+             * to be updated at this moment.
+             */
+            if (!pci_bus_is_root(pci_get_bus(pdev))) {
+                error_setg(errp,
+                           "Cannot create type 41 entry for PCI device %s: "
+                           "not attached to the root bus",
+                           t41->pcidev);
+                return;
+            }
+            t->segment_group_number = cpu_to_le16(0);
+            t->bus_number = pci_dev_bus_num(pdev);
+            t->device_number = pdev->devfn;
+        }
+
+        SMBIOS_BUILD_TABLE_POST;
+        instance++;
+    }
+}
+
 static void smbios_build_type_127_table(void)
 {
     SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
@@ -883,7 +979,8 @@ void smbios_get_tables(MachineState *ms,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
                        uint8_t **tables, size_t *tables_len,
-                       uint8_t **anchor, size_t *anchor_len)
+                       uint8_t **anchor, size_t *anchor_len,
+                       Error **errp)
 {
     unsigned i, dimm_cnt;
 
@@ -928,6 +1025,7 @@ void smbios_get_tables(MachineState *ms,
 
         smbios_build_type_32_table();
         smbios_build_type_38_table();
+        smbios_build_type_41_table(errp);
         smbios_build_type_127_table();
 
         smbios_validate_table(ms);
@@ -1224,6 +1322,30 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
             save_opt(&type17.part, opts, "part");
             type17.speed = qemu_opt_get_number(opts, "speed", 0);
             return;
+        case 41: {
+            struct type41_instance *t;
+            Error *local_err = NULL;
+
+            if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
+                return;
+            }
+            t = g_new0(struct type41_instance, 1);
+            save_opt(&t->designation, opts, "designation");
+            t->kind = qapi_enum_parse(&type41_kind_lookup,
+                                      qemu_opt_get(opts, "kind"),
+                                      0, &local_err) + 1;
+            t->kind |= 0x80;     /* enabled */
+            if (local_err != NULL) {
+                error_propagate(errp, local_err);
+                g_free(t);
+                return;
+            }
+            t->instance = qemu_opt_get_number(opts, "instance", 1);
+            save_opt(&t->pcidev, opts, "pcidev");
+
+            QTAILQ_INSERT_TAIL(&type41, t, next);
+            return;
+        }
         default:
             error_setg(errp,
                        "Don't know how to build fields for SMBIOS type %ld",
diff --git a/qemu-options.hx b/qemu-options.hx
index fd21002bd6..f71f716aa0 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2370,7 +2370,9 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "                specify SMBIOS type 11 fields\n"
     "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
     "               [,asset=str][,part=str][,speed=%d]\n"
-    "                specify SMBIOS type 17 fields\n",
+    "                specify SMBIOS type 17 fields\n"
+    "-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]\n"
+    "                specify SMBIOS type 41 fields\n",
     QEMU_ARCH_I386 | QEMU_ARCH_ARM)
 SRST
 ``-smbios file=binary``
@@ -2432,6 +2434,32 @@ SRST
 
 ``-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str][,asset=str][,part=str][,speed=%d]``
     Specify SMBIOS type 17 fields
+
+``-smbios type=41[,designation=str][,kind=str][,instance=%d][,pcidev=str]``
+    Specify SMBIOS type 41 fields
+
+    This argument can be repeated multiple times.  Its main use is to allow network interfaces be created
+    as ``enoX`` on Linux, with X being the instance number, instead of the name depending on the interface
+    position on the PCI bus.
+
+    Here is an example of use:
+
+    .. parsed-literal::
+
+        -netdev user,id=internet \\
+        -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet,id=internet-dev \\
+        -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pcidev=internet-dev
+
+    In the guest OS, the device should then appear as ``eno1``:
+
+    ..parsed-literal::
+
+         $ ip -brief l
+         lo               UNKNOWN        00:00:00:00:00:00 <LOOPBACK,UP,LOWER_UP>
+         eno1             UP             50:54:00:00:00:42 <BROADCAST,MULTICAST,UP,LOWER_UP>
+
+    Currently, the PCI device has to be attached to the root bus.
+
 ERST
 
 DEFHEADING()
-- 
MST

