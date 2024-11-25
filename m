Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569397njc;
        Mon, 25 Nov 2024 11:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWieXRnw438ap+EftT6S/i4G0OJmGkfkUuXbkolhMYkW0K+vZjEDp5xD5ykQC1JHkrPv5QPWPbhOgZWrg==@linaro.org
X-Received: by 2002:adf:e18c:0:b0:382:5aae:87ac with SMTP id ffacd0b85a97d-38260b8966dmr11819712f8f.32.1732564780059;
        Mon, 25 Nov 2024 11:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564780; cv=none;
        d=google.com; s=arc-20240605;
        b=QiKu2zw6xmbvAaE0G8hmJtcaU49BNYulwiMzN3eBxHJ2eCXRlZX3CCRO6YZy9ZQvIK
         VSiDtGdOWyHkjORlVYqHCTAqfSHdDbw3S8ikqY7z+9iHXZyOB9zoc+IXy3pUv44ibdA5
         CwcCLsjy9I3NIiA9Lcs8NgqA2BAiZmZR0VTmSGZBvx8bZ/rYDjCH+mJQM7mts1BrC7SY
         YRsZZnJ9+IbfXcAUIu4OEMaHopdFXVA5uICq6MdWp7XTFiLXrYmf9ip4JkCk0doFgJAA
         Wj2L+4ucFmePj4/IjdHNB6vwuOUq5oDkM087ZMphrrMRobf/BACJulmY1MGwtM6lcqnP
         Ox8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Sx/wgUhO2hnEU30pqKphmQJjzDJZvYIKeuvBl/T4ue8=;
        fh=YrRl6H+hc2BVkMiDpyxiru+qM4TTvx1uvxXsIUC5dUQ=;
        b=XpE5PyTZt6VPYgRREMk4emNkrV1vMcgdhHCyt5JXy2cmW6KnjYhl60bql9pZFp6wUr
         T3AdyWSZkMZUg2dvSxaiMIRYig7fUSvCq+e+5g86BQ7p3FaFDs8T3WzyjzgjEo0rrmF+
         7jJd9b++ll9nLfJovmq8RdCt6bUPASzqshdkcyisWwbqjLhkZAEFSbWx2CLqTHCDtE3u
         LSNP8J5PTBIANzgZgWG5Vg2dxcABp+7wTzZ6Sj2S1jn3Uk1c+TmtU5ISIxJGj8FuEVv9
         gbicDBDc4hZrZvhCikMqloAHJJG9mCVlg19wcMwpccZT9RK5IdlDxG+rumGvkFjlzYQY
         ULNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wji/fxx9";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3825fd3067dsor2252667f8f.9.2024.11.25.11.59.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Wji/fxx9";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564779; x=1733169579; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx/wgUhO2hnEU30pqKphmQJjzDJZvYIKeuvBl/T4ue8=;
        b=Wji/fxx90MF1GR53z6iVKEzS1VEtkk1R9pD2jjuFfoI9CURalBMc6G34O/asPo8RjZ
         8OYRGb3PGPNahJYKBvTczFDxGERY/PGzQmeSANqVmZ47eTh/aTujU8TmMTXog8kQwTNn
         Esna8ba9tYTn3dHp3nAXm+5OMCrTVahtulPuHJTphV9Rsysqs/qvO3Vv57HEaIvGr0rr
         Hqb01uph7H6S85Yk3h+7srxBEFZOkQ7CKlQ6OTtAm+JIAfMeur32I/kLJEdJQ5hcWB4+
         CYdtxxStiXX1usNa071AbZsXq2UxETm2jZbjRRYEl1Fb8IuFNkBF6FgjIePGdw6T94ZR
         5LvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564779; x=1733169579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx/wgUhO2hnEU30pqKphmQJjzDJZvYIKeuvBl/T4ue8=;
        b=ku583HtH76j1zVY3U/+PZHRxC/c3MKvQW2k+0+INoPJ7vgLgPX7CKTR/vDoM7AeRiM
         PFR2PujWYq2Z7tkrhSrLOKUQYKzFO56e0BhR/0yFvNTksIaHNr7c5kCa54Ddldd4sC0h
         yK1Wt3CD0L1x4MTOYViE87Ztwcwph/1EOBeH43Po2BY5KvBLuuZlSfccBi2btHHbT8fX
         PSdJFNbfHsfYhO8aH/sj1FIzwqEiISyWzlEySmHCK6Sj8PKKbIc2YZO5Z5xoSB9VClCg
         wQalUS+DLediL5n3LBwJgZyuiaUHDIMUEXC64X2YwVsNM7m31Jw0U77ufE4+HLGNSSCe
         ODzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzjUG3Q+l8IwakNZbJC9MDwAeZv9Gssn2+FLQ6FEqaJb1HFnP3Fr38C+1mrDf8UAfN01w71UXfJsVsYw==@linaro.org
X-Gm-Message-State: AOJu0YyJWgHgIXp5W09936g65T2Q8+uKSkE+3uSpqdw7+eJzrhmqATXc
	DcJpM9REvZ2Nu1+Qi3iImCxglLM3dLrFoDimjbxih8fo2/nfJj7nrRAAAozjquzgPg==
X-Gm-Gg: ASbGncs+zve5u9QCRIxFv7wrXW8Uxw90Gn3gR8EpEo7+2ON8Na711tXUdwGBWDqGYca
	rGoVkU1+PLBDo51hOMflA3muTlCNy0sL3DVO538GpozHgQ2tysiLopeQhG3f8fWZ0iJET1eK3VI
	AUEs7/d/3bnJP80W9e+/jHnpPY+Vgb1BAp3M/11Tkvv2YBePbut58+Gey416WXN+gNnt9rJsjfv
	0anJJcTKdHHOzprqgqNPuflOgFFMe1PX1K14x5FM26ryS+6RdXbR+gjvZkw7uCdgdFk
X-Google-Smtp-Source: AGHT+IEDhTtNZEirT7xBFMutfVs/saGMV1bfHmtxSxlCg2GretDVGOBISN5KO8jHbhgqfqZOMilyVg==
X-Received: by 2002:a05:6000:18a2:b0:382:496e:8784 with SMTP id ffacd0b85a97d-38260b6eb06mr12571026f8f.26.1732564779568;
        Mon, 25 Nov 2024 11:59:39 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:39 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [RFC PATCH v3 26/26] hw/arm/virt: Add measurement log for confidential boot
Date: Mon, 25 Nov 2024 19:56:25 +0000
Message-ID: <20241125195626.856992-28-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 7OZ+jS7Qkh5B

Create a measurement log describing operations performed by QEMU to
initialize the guest, and load it into guest memory above the DTB.

Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: New
---
 include/hw/arm/boot.h |  3 +++
 include/hw/arm/virt.h |  1 +
 hw/arm/boot.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
 hw/arm/virt.c         | 23 +++++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/include/hw/arm/boot.h b/include/hw/arm/boot.h
index 5fcbaa2625..f2518c4e81 100644
--- a/include/hw/arm/boot.h
+++ b/include/hw/arm/boot.h
@@ -147,6 +147,9 @@ struct arm_boot_info {
      * Confidential guest boot loads everything into RAM so it can be measured.
      */
     bool confidential;
+    /* measurement log location in guest memory */
+    hwaddr log_start;
+    size_t log_size;
 };
 
 /**
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e5e9f67f52..fe1c464be6 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -180,6 +180,7 @@ struct VirtMachineState {
     char *oem_id;
     char *oem_table_id;
     bool ns_el2_virt_timer_irq;
+    Object *event_log;
 };
 
 #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e461137595..1ced008062 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -665,6 +665,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
 
     fdt_add_psci_node(fdt);
 
+    /* Add a reserved-memory node for the event log */
+    if (binfo->log_size) {
+        char *nodename;
+
+        qemu_fdt_add_subnode(fdt, "/reserved-memory");
+        qemu_fdt_setprop_cell(fdt, "/reserved-memory", "#address-cells", 0x2);
+        qemu_fdt_setprop_cell(fdt, "/reserved-memory", "#size-cells", 0x2);
+        qemu_fdt_setprop(fdt, "/reserved-memory", "ranges", NULL, 0);
+
+        nodename = g_strdup_printf("/reserved-memory/event-log@%" PRIx64,
+                                   binfo->log_start);
+        qemu_fdt_add_subnode(fdt, nodename);
+        qemu_fdt_setprop_string(fdt, nodename, "compatible", "cc-event-log");
+        qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", 2, binfo->log_start,
+                                           2, binfo->log_size);
+        g_free(nodename);
+    }
+
     if (binfo->modify_dtb) {
         binfo->modify_dtb(binfo, fdt);
     }
@@ -943,6 +961,30 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
     return kernel_size;
 }
 
+static void add_event_log(struct arm_boot_info *info)
+{
+    if (!info->log_size) {
+        return;
+    }
+
+    if (!info->dtb_limit) {
+        int dtb_size = 0;
+
+        if (!info->get_dtb(info, &dtb_size) || dtb_size == 0) {
+            error_report("Board does not have a DTB");
+            exit(1);
+        }
+        info->dtb_limit = info->dtb_start + dtb_size;
+    }
+
+    info->log_start = info->dtb_limit;
+    if (info->log_start + info->log_size >
+        info->loader_start + info->ram_size) {
+        error_report("Not enough space for measurement log and DTB");
+        exit(1);
+    }
+}
+
 static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
                                          struct arm_boot_info *info)
 {
@@ -990,6 +1032,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
             }
             info->dtb_start = info->loader_start;
             info->dtb_limit = image_low_addr;
+            add_event_log(info);
         }
     }
     entry = elf_entry;
@@ -1128,6 +1171,8 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
                 error_report("Not enough space for DTB after kernel/initrd");
                 exit(1);
             }
+            add_event_log(info);
+
             fixupcontext[FIXUP_ARGPTR_LO] = info->dtb_start;
             fixupcontext[FIXUP_ARGPTR_HI] = info->dtb_start >> 32;
         } else {
@@ -1189,6 +1234,8 @@ static void arm_setup_confidential_firmware_boot(ARMCPU *cpu,
         error_report("could not load firmware '%s'", firmware_filename);
         exit(1);
     }
+
+    add_event_log(info);
 }
 
 static void arm_setup_firmware_boot(ARMCPU *cpu, struct arm_boot_info *info,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 5247f53882..1e0f664af0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1808,6 +1808,11 @@ void virt_machine_done(Notifier *notifier, void *data)
         exit(1);
     }
 
+    if (vms->event_log) {
+        object_property_set_uint(vms->event_log, "load-addr",
+                                 vms->bootinfo.log_start, &error_fatal);
+    }
+
     fw_cfg_add_extra_pci_roots(vms->bus, vms->fw_cfg);
 
     virt_acpi_setup(vms);
@@ -2149,6 +2154,21 @@ static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
     }
 }
 
+static void create_measurement_log(VirtMachineState *vms)
+{
+    Error *err = NULL;
+
+    vms->event_log = kvm_arm_rme_get_measurement_log();
+    if (vms->event_log == NULL) {
+        return;
+    }
+    vms->bootinfo.log_size = object_property_get_uint(vms->event_log,
+                                                      "max-size", &err);
+    if (err != NULL) {
+        error_report_err(err);
+    }
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -2499,6 +2519,9 @@ static void machvirt_init(MachineState *machine)
                                vms->fw_cfg, OBJECT(vms));
     }
 
+    kvm_arm_rme_set_ipa_size(64 - clz64(vms->highest_gpa));
+    create_measurement_log(vms);
+
     vms->bootinfo.ram_size = machine->ram_size;
     vms->bootinfo.board_id = -1;
     vms->bootinfo.loader_start = vms->memmap[VIRT_MEM].base;
-- 
2.47.0
