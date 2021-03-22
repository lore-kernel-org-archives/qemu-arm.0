Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4015582lfg;
        Mon, 22 Mar 2021 16:07:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXi/E9a3ZLjzEfnbQAjguDTTNLI5b/Ruzw3a2qtLck2XiMJBbdAyauJN7DccIrrWjOWzWF
X-Received: by 2002:a6b:661a:: with SMTP id a26mr1827380ioc.124.1616454452083;
        Mon, 22 Mar 2021 16:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616454452; cv=none;
        d=google.com; s=arc-20160816;
        b=OMVDCbBm6Xzv/yfRw6m8QJSZheb/nnhoi2SP7vNyXy9nF4xrGvEzn3bTi+e/0b+e6w
         WGOH1XCyZrRA0PQHFxmNErquiPxTA6rj35W3BdCMm73E6o7uYAeCCQjxf6IMjQw8YrlX
         zj+OvNxWqH530mvuIQPRwtBRe0tEUgIWVR2ywx0837Ep2aBts6jBxaG8lyjo23wl7wIJ
         NH2YnlRunZeCz7gYbXxV2uo8iBFrhQU5l8eG+lExz5isxtp/tAkIcGFo+gL82+bvfjKq
         sYXk8Ldt3DD9/1kIr8+fY2d3vJqBx7EXx8szloTh1M6l8nDxI/WTN0YqApaZGde1ueSt
         aNNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=KkS5Xp0caFryRCO3+REG/uo3Q121Qkg68IyU+rSFR+w=;
        b=DSOp43QfVXzlAGdgs/0JERibsMjNVkQtTN7chwbqk77SsIo5ymovWz2mKwpfZSAFXC
         bWqXHd7445cKYtYcQT/57/dBV8osz6KUXtXN9yjhiZrTsA4YaNpACmlwjj4oYovX8+MO
         O0tBHt3xW7WBqMZwl8saEebd0WprUxI9hYxOryg1LJwyuGIe2Wh4n7RR434NEC/wqR3W
         zlCikdHE10ur6sNN1CGyd22zj1qb8BQwqNjh1bCP6QKE0U0evXysNwZgB9VJ71t/q8jW
         6TgcEkx2dnXyy7nsY2HOuYRFQsx4Pc3ORrxt71CWw223LuZtH6OxFiUcwf26eP0NclEt
         94lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gO3XhaZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i5si3274967ilv.96.2021.03.22.16.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 16:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gO3XhaZ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOTdz-0005W8-BM
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 19:07:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXP-0007HD-Nf
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 19:00:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTXI-0001K0-AT
 for qemu-arm@nongnu.org; Mon, 22 Mar 2021 19:00:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KkS5Xp0caFryRCO3+REG/uo3Q121Qkg68IyU+rSFR+w=;
 b=gO3XhaZ7iqOnja8yUrPW+YiIWrttDdwhpA2PXLvtsxGrHIktqhpOHjszTjSWi3C5LZ/YaU
 NiZlBtNz2B6f4Qc1gQlQw7ky5wP/5Vw13YS2BIDkw/G0kmOrghAqmzEzxzkwh443K/IzCD
 wSSIIz+NTSoJnbAYJr9at3zwyNHfenc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-3yLtel63NUmTsDVzFgj35Q-1; Mon, 22 Mar 2021 19:00:32 -0400
X-MC-Unique: 3yLtel63NUmTsDVzFgj35Q-1
Received: by mail-wr1-f70.google.com with SMTP id f3so146039wrt.14
 for <qemu-arm@nongnu.org>; Mon, 22 Mar 2021 16:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KkS5Xp0caFryRCO3+REG/uo3Q121Qkg68IyU+rSFR+w=;
 b=jzKct6jDF70VeaaMbbYuREaISzRTnTWHziGUIdkmtGL9emDRTxZZSssa4r2s2RZ4qA
 jea5RVzTnhPY7vYlvKfQSM1Urw+0G7KUzsOjwN52og/IVRrzW64qBWUOZAagMHSrJ1zp
 xaTMRPo6QZK82dQ6rm6knf3yh+vSWGVzPTOTvcTehmbJNHiIlTfDhXSFqWEHDCUle7zc
 7M86tdTZGU/1eWw4z7j7N2lUCDSQ8AhiAfn6E5clLZ+ELbz2Qs62AyQjeFULmLZAUP4D
 fHvMPMV+HIkZatreNh4n5l5+D3YpxbR0kpps80gS1GT53lTMgnXimxYIBDCRkhLsWpHU
 3vBA==
X-Gm-Message-State: AOAM532uoOgXZXkGvf2f75y+uHJQSRjXfRXrY4yZDT13fk1O8SBvBXao
 u3pUWhYbtHY5VeRftUwTrm2HIqEUsnxfPhy1EQy8WVhjTIonZwiwwILhs6QlVuQ9x8LOfG3atuG
 2GST4pLTrc8B6
X-Received: by 2002:a05:6000:181:: with SMTP id p1mr805817wrx.73.1616454029816; 
 Mon, 22 Mar 2021 16:00:29 -0700 (PDT)
X-Received: by 2002:a05:6000:181:: with SMTP id p1mr805802wrx.73.1616454029594; 
 Mon, 22 Mar 2021 16:00:29 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id k12sm21485370wrx.7.2021.03.22.16.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:29 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 15/19] acpi: Set proper maximum size for "etc/table-loader"
 blob
Message-ID: <20210322225907.541943-16-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DJSn0Q6aM3s0

From: David Hildenbrand <david@redhat.com>

The resizeable memory region / RAMBlock that is created for the cmd blob
has a maximum size of whole host pages (e.g., 4k), because RAMBlocks
work on full host pages. In addition, in i386 ACPI code:
  acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
makes sure to align to multiples of 4k, padding with 0.

For example, if our cmd_blob is created with a size of 2k, the maximum
size is 4k - we cannot grow beyond that. Growing might be required
due to guest action when rebuilding the tables, but also on incoming
migration.

This automatic generation of the maximum size used to be sufficient,
however, there are cases where we cross host pages now when growing at
runtime: we exceed the maximum size of the RAMBlock and can crash QEMU when
trying to resize the resizeable memory region / RAMBlock:
  $ build/qemu-system-x86_64 --enable-kvm \
      -machine q35,nvdimm=on \
      -smp 1 \
      -cpu host \
      -m size=2G,slots=8,maxmem=4G \
      -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
      -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
      -nodefaults \
      -device vmgenid \
      -device intel-iommu

Results in:
  Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
  qemu-system-x86_64: Size too large: /rom@etc/table-loader:
    0x2000 > 0x1000: Invalid argument

In this configuration, we consume exactly 4k (32 entries, 128 bytes each)
when creating the VM. However, once the guest boots up and maps the MCFG,
we also create the MCFG table and end up consuming 2 additional entries
(pointer + checksum) -- which is where we try resizing the memory region
/ RAMBlock, however, the maximum size does not allow for it.

Currently, we get the following maximum sizes for our different
mutable tables based on behavior of resizeable RAMBlock:

  hw       table                max_size
  -------  ---------------------------------------------------------

  virt     "etc/acpi/tables"    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)
  virt     "etc/table-loader"   HOST_PAGE_ALIGN(initial_size)
  virt     "etc/acpi/rsdp"      HOST_PAGE_ALIGN(initial_size)

  i386     "etc/acpi/tables"    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)
  i386     "etc/table-loader"   HOST_PAGE_ALIGN(initial_size)
  i386     "etc/acpi/rsdp"      HOST_PAGE_ALIGN(initial_size)

  microvm  "etc/acpi/tables"    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)
  microvm  "etc/table-loader"   HOST_PAGE_ALIGN(initial_size)
  microvm  "etc/acpi/rsdp"      HOST_PAGE_ALIGN(initial_size)

Let's set the maximum table size for "etc/table-loader" to 64k, so we
can properly grow at runtime, which should be good enough for the future.

Migration is not concerned with the maximum size of a RAMBlock, only
with the used size - so existing setups are not affected. Of course, we
cannot migrate a VM that would have crash when started on older QEMU from
new QEMU to older QEMU without failing early on the destination when
synchronizing the RAM state:
    qemu-system-x86_64: Size too large: /rom@etc/table-loader: 0x2000 > 0x1000: Invalid argument
    qemu-system-x86_64: error while loading state for instance 0x0 of device 'ram'
    qemu-system-x86_64: load of migration failed: Invalid argument

We'll refactor the code next, to make sure we get rid of this implicit
behavior for "etc/acpi/rsdp" as well and to make the code easier to
grasp.

Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20210304105554.121674-2-david@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/aml-build.h | 1 +
 hw/arm/virt-acpi-build.c    | 3 ++-
 hw/i386/acpi-build.c        | 3 ++-
 hw/i386/acpi-microvm.c      | 2 +-
 4 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index e652106e26..ca781f3531 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -6,6 +6,7 @@
 
 /* Reserve RAM space for tables: add another order of magnitude. */
 #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
+#define ACPI_BUILD_LOADER_MAX_SIZE        0x10000
 
 #define ACPI_BUILD_APPNAME6 "BOCHS "
 #define ACPI_BUILD_APPNAME8 "BXPC    "
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index f9c9df916c..a91550de6f 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -865,7 +865,8 @@ void virt_acpi_setup(VirtMachineState *vms)
 
     build_state->linker_mr =
         acpi_add_rom_blob(virt_acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
+                          ACPI_BUILD_LOADER_MAX_SIZE);
 
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a95b42c8b3..dc56006353 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2634,7 +2634,8 @@ void acpi_setup(void)
 
     build_state->linker_mr =
         acpi_add_rom_blob(acpi_build_update, build_state,
-                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE,
+                          ACPI_BUILD_LOADER_MAX_SIZE);
 
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
index 54b3af478a..01f1945ac1 100644
--- a/hw/i386/acpi-microvm.c
+++ b/hw/i386/acpi-microvm.c
@@ -255,7 +255,7 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
                       ACPI_BUILD_TABLE_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.linker->cmd_blob,
-                      "etc/table-loader", 0);
+                      "etc/table-loader", ACPI_BUILD_LOADER_MAX_SIZE);
     acpi_add_rom_blob(acpi_build_no_update, NULL,
                       tables.rsdp,
                       ACPI_BUILD_RSDP_FILE, 0);
-- 
MST

