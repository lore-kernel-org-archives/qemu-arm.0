Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2428813njc;
        Tue, 23 Jul 2024 03:59:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXt/7v/KxwiMYnTu20/W9HULKh8Pplu6NK1WxTnMfL0uJl9zW9pDbytK3lejoeK9+3jAFinbt85dJvHAYYI/RFURselkIi1
X-Google-Smtp-Source: AGHT+IF6FA1Ae3M588aPaa4RTd4XP7Tp+YGjDTKk/IHhI1hbVBTkTOZxR+xqRqLVEPLv5Pzw4m/j
X-Received: by 2002:a05:6214:29cc:b0:6b5:dca9:675c with SMTP id 6a1803df08f44-6b98190d688mr41650046d6.4.1721732359138;
        Tue, 23 Jul 2024 03:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721732359; cv=none;
        d=google.com; s=arc-20160816;
        b=UgDJhWG8VVSf/Mdh3UUb4GKp/O/N+8ghRO6vlHK3Wfyxv9/kiD9VRUOE8sxW83ko+A
         PV8Cv8h2wfesFShkWLqAM6XbXAdaLY4IunjHEIMdvgTrjdJ+CnKaNWjfduaKZ93L61nK
         OevPGk/jlqND5r2pmGzVK7Tt67uSpvorZQpb9C1nYmOxpZRKPQW4kjh1i4wztAbJpaQG
         EQRrbU7jVlcQCp7/P46RYvaDgTuiCUA1ChwIov7o0LzD2Om7lK8mkzbH3DccS3kR/tCa
         qYGasWThP/dbzGpYQZWor9gLCUtcgF4PCijsXr2hBWnAl6Gg7LHHCemTCXTHfjVlLj8c
         h+Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=wmqhjtW3VVd/s0tK/0z/W3SbHoTTKsvguEWbJfZllQs=;
        fh=RzvTl1oXgyovr8iHeuZQ5gKqzTw0nqpB/BNxVNxOF1s=;
        b=OFCC7MitcJE1cDOhHZhs0QnLxMHV05l+b7AJItanMqmHNxT+ZVno+xt6Sy2Q1zzlr3
         azaIOxgV0A0mOv9MQPXg5jow4KBKFag9RR+xSIAdqmZ49yw1e+fRk/DbS20bZkgY6Zbi
         6JE0+0c8jnq8QLR1qtpGDDq55S+b/yaxB8F/LBE3fCoWPSabsdg+MNNYZmrA+irE1Qc8
         OeWYua9jYMaj5vUInE1K1AZt6iCPAcoLZrcH+vdeJTnyz8Fe3z+etDh9GKPomA9CYSHr
         qKpGvva0+ncOV3e1+3C93v33BOJ4xjcGEQWPV4ue7Cl9W9fGm3vKqNwjJL0bRlrry92D
         3ASw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eh5Rj3up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac7c5f91si92631286d6.150.2024.07.23.03.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 03:59:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eh5Rj3up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWDEW-0004wh-Ln; Tue, 23 Jul 2024 06:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sWDEE-0003Kb-96
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 06:58:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sWDEC-0002HE-Bf
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 06:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721732323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmqhjtW3VVd/s0tK/0z/W3SbHoTTKsvguEWbJfZllQs=;
 b=eh5Rj3upIgdF+dD9V2Dp0qJ0cSOSpufB5ZzT6Dtk9APyPQoUWKIiSlZQ3g22JL4DuoOX5R
 NkhVeITW0Ew4gKV5efhfLu/vDcoJ1NIqxKbIXY3lnB0QfdzvzcXhl4vNvTUcVAZja2jc5p
 EIf6+3x1UnFn7ndJW1C4ZIehkZ4jQQQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-RmcqwuiBMaaJsC5rvnlREQ-1; Tue, 23 Jul 2024 06:58:42 -0400
X-MC-Unique: RmcqwuiBMaaJsC5rvnlREQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a77eb9abdfaso67403366b.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 03:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721732321; x=1722337121;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wmqhjtW3VVd/s0tK/0z/W3SbHoTTKsvguEWbJfZllQs=;
 b=OgLKb6mvaiYgXY1pSNaxAAADFgJ3P9im6DlxGZKrSHtSdjhiysaM81XGiaNOc4xjYY
 4l3geYQoIlHHg9CLOMMf5EKBKQL4cwkO36jcq8UV+QO+yjDt2KN7al1ygi6eNmslGTcT
 yuKYeBL8Z3F1oI3I5/hzuwLBBtW0zXYA+gEJO+4kYLWyN9o86u/Bm4O6oVEsAMWuBTDB
 jSxKbVXMmoMTbjpFi2IkHtB88JIJxfCjsRaLaDUldC4H/ohJWDwDIBbv5baech3McHxK
 JAxv8CZvksqfa2TLycPnxxoC3Sen5p4sCc2jVIKXF4j+z/gesN2wf1FSSWKqKRGYhIbY
 r/7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtCpnJEec//mqJFB/9OkV9grCQK1V12+nSicPp7aegD2oimIe0slWnowFiLaJlOpz/Wd1zuNwuwCks/Zb+lpgiraN9
X-Gm-Message-State: AOJu0YzApuj50EKuasF6j6dta8w3qRjIWTv/SANZNHj9TO3HeuuRZYjt
 Kxr9KGAobGot/7bld96tUAM8R6PHNq6ZWrE/Z2Jc3jAMujHBwAZ0C9prZvJWvIi2fanisJ+uiuf
 pEZecX68j0XYK5FNIkh7sfLykvtTK8GCv1invvAFWP3aJRtzNYw==
X-Received: by 2002:a17:907:6d17:b0:a72:5f9a:159a with SMTP id
 a640c23a62f3a-a7a4bfa2290mr646428866b.2.1721732321222; 
 Tue, 23 Jul 2024 03:58:41 -0700 (PDT)
X-Received: by 2002:a17:907:6d17:b0:a72:5f9a:159a with SMTP id
 a640c23a62f3a-a7a4bfa2290mr646427366b.2.1721732320657; 
 Tue, 23 Jul 2024 03:58:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:440:9c9a:ffee:509d:1766:aa7f])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a8c70c3b9sm87295866b.136.2024.07.23.03.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 03:58:40 -0700 (PDT)
Date: Tue, 23 Jul 2024 06:58:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org
Subject: [PULL v2 36/61] smbios: make memory device size configurable per
 Machine
Message-ID: <62f182c97b31445012d37181005a83ff8453edaa.1721731723.git.mst@redhat.com>
References: <cover.1721731723.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1721731723.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.133,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Td4MukkxWiOf

From: Igor Mammedov <imammedo@redhat.com>

Currently QEMU describes initial[1] RAM* in SMBIOS as a series of
virtual DIMMs (capped at 16Gb max) using type 17 structure entries.

Which is fine for the most cases.  However when starting guest
with terabytes of RAM this leads to too many memory device
structures, which eventually upsets linux kernel as it reserves
only 64K for these entries and when that border is crossed out
it runs out of reserved memory.

Instead of partitioning initial RAM on 16Gb DIMMs, use maximum
possible chunk size that SMBIOS spec allows[2]. Which lets
encode RAM in lower 31 bits of 32bit field (which amounts upto
2047Tb per DIMM).
As result initial RAM will generate only one type 17 structure
until host/guest reach ability to use more RAM in the future.

Compat changes:
We can't unconditionally change chunk size as it will break
QEMU<->guest ABI (and migration). Thus introduce a new machine
class field that would let older versioned machines to use
legacy 16Gb chunks, while new(er) machine type[s] use maximum
possible chunk size.

PS:
While it might seem to be risky to rise max entry size this large
(much beyond of what current physical RAM modules support),
I'd not expect it causing much issues, modulo uncovering bugs
in software running within guest. And those should be fixed
on guest side to handle SMBIOS spec properly, especially if
guest is expected to support so huge RAM configs.

In worst case, QEMU can reduce chunk size later if we would
care enough about introducing a workaround for some 'unfixable'
guest OS, either by fixing up the next machine type or
giving users a CLI option to customize it.

1) Initial RAM - is RAM configured with help '-m SIZE' CLI option/
   implicitly defined by machine. It doesn't include memory
   configured with help of '-device' option[s] (pcdimm,nvdimm,...)
2) SMBIOS 3.1.0 7.18.5 Memory Device — Extended Size

PS:
* tested on 8Tb host with RHEL6 guest, which seems to parse
  type 17 SMBIOS table entries correctly (according to 'dmidecode').

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20240715122417.4059293-1-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h |  4 ++++
 hw/arm/virt.c       |  1 +
 hw/core/machine.c   |  6 ++++++
 hw/i386/pc_piix.c   |  1 +
 hw/i386/pc_q35.c    |  1 +
 hw/smbios/smbios.c  | 11 ++++++-----
 6 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index ef6f18f2c1..48ff6d8b93 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -237,6 +237,9 @@ typedef struct {
  *    purposes only.
  *    Applies only to default memory backend, i.e., explicit memory backend
  *    wasn't used.
+ * @smbios_memory_device_size:
+ *    Default size of memory device,
+ *    SMBIOS 3.1.0 "7.18 Memory Device (Type 17)"
  */
 struct MachineClass {
     /*< private >*/
@@ -304,6 +307,7 @@ struct MachineClass {
     const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
     int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx);
     ram_addr_t (*fixup_ram_size)(ram_addr_t size);
+    uint64_t smbios_memory_device_size;
 };
 
 /**
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0c68d66a3..719e83e6a1 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3308,6 +3308,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(9, 1)
 static void virt_machine_9_0_options(MachineClass *mc)
 {
     virt_machine_9_1_options(mc);
+    mc->smbios_memory_device_size = 16 * GiB;
     compat_props_add(mc->compat_props, hw_compat_9_0, hw_compat_9_0_len);
 }
 DEFINE_VIRT_MACHINE(9, 0)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index bc38cad7f2..ac30544e7f 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1004,6 +1004,12 @@ static void machine_class_init(ObjectClass *oc, void *data)
     /* Default 128 MB as guest ram size */
     mc->default_ram_size = 128 * MiB;
     mc->rom_file_has_mr = true;
+    /*
+     * SMBIOS 3.1.0 7.18.5 Memory Device — Extended Size
+     * use max possible value that could be encoded into
+     * 'Extended Size' field (2047Tb).
+     */
+    mc->smbios_memory_device_size = 2047 * TiB;
 
     /* numa node memory size aligned on 8MB by default.
      * On Linux, each node's border has to be 8MB aligned
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 9445b07b4f..d9e69243b4 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -495,6 +495,7 @@ static void pc_i440fx_machine_9_0_options(MachineClass *m)
     pc_i440fx_machine_9_1_options(m);
     m->alias = NULL;
     m->is_default = false;
+    m->smbios_memory_device_size = 16 * GiB;
 
     compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len);
     compat_props_add(m->compat_props, pc_compat_9_0, pc_compat_9_0_len);
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 71d3c6d122..9d108b194e 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -374,6 +374,7 @@ static void pc_q35_machine_9_0_options(MachineClass *m)
     PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
     pc_q35_machine_9_1_options(m);
     m->alias = NULL;
+    m->smbios_memory_device_size = 16 * GiB;
     compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len);
     compat_props_add(m->compat_props, pc_compat_9_0, pc_compat_9_0_len);
     pcmc->isa_bios_alias = false;
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index 3b7703489d..a394514264 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -1093,6 +1093,7 @@ static bool smbios_get_tables_ep(MachineState *ms,
                        Error **errp)
 {
     unsigned i, dimm_cnt, offset;
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     ERRP_GUARD();
 
     assert(ep_type == SMBIOS_ENTRY_POINT_TYPE_32 ||
@@ -1123,12 +1124,12 @@ static bool smbios_get_tables_ep(MachineState *ms,
     smbios_build_type_9_table(errp);
     smbios_build_type_11_table();
 
-#define MAX_DIMM_SZ (16 * GiB)
-#define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
-                                        : ((current_machine->ram_size - 1) % MAX_DIMM_SZ) + 1)
+#define GET_DIMM_SZ ((i < dimm_cnt - 1) ? mc->smbios_memory_device_size \
+    : ((current_machine->ram_size - 1) % mc->smbios_memory_device_size) + 1)
 
-    dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ) /
-               MAX_DIMM_SZ;
+    dimm_cnt = QEMU_ALIGN_UP(current_machine->ram_size,
+                             mc->smbios_memory_device_size) /
+               mc->smbios_memory_device_size;
 
     /*
      * The offset determines if we need to keep additional space between
-- 
MST

