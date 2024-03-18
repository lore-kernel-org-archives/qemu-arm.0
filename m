Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp750512ejb;
        Mon, 18 Mar 2024 09:17:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWubqwO0smWeEarKke4QVOomo7+KpBSz9Q0okG5EHPSi5ERJuI23WWfyjsNWHj4mZcl1E5MviHO/vmxFtUvWnZBZZZjcuVL
X-Google-Smtp-Source: AGHT+IEoxWUD6wOBmHcl4NnjiLYYqWGFp74HrzWjUGL4o+1VWUg7BxXHtTKlPH1G2yOu9xWFgsZz
X-Received: by 2002:a05:622a:10c:b0:42e:f3ac:d43c with SMTP id u12-20020a05622a010c00b0042ef3acd43cmr14601276qtw.0.1710778642217;
        Mon, 18 Mar 2024 09:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710778642; cv=none;
        d=google.com; s=arc-20160816;
        b=E/erCasSTkAeNH7oE2BTrnmeAeajuNZgACf9y4oGLMmPnrku+mA+n7CEq8DP1EMxuJ
         gSyJujRLsq23ja2iviVCHsv3rpR/92bF5WOv3xNiw7F8M6Rk1jZvrnEZcJmIH9aWyeMH
         5WXsHrbCHEVqMmBfO1LDI0b9aMEqPxQ4+rpLVwu95EHNBXzzl2RmXcxxoerKOMTWr7p0
         Gec8qeiJq/UsY2WceZm/pRKMxRQQSUR/VAd45u/NNE1PcTpfDR4pL7OpGRXw4+ClNer3
         9jQulGIKcUux09spUWCKRp6GMOeyOX7jHvT6pMu0X7Hpx/EAr0Co882J6U8LBQBGUdEf
         dPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=QWKuhfl1vUGxImS8wUGBNUDNid5d+Po/4qnMfxE2Umw=;
        fh=SQkSQi2irjB3f/40OR1ROMXK2arScr6CBZxgUVTewXc=;
        b=gIFn0fv1dPFnXFuJXqPjItxpeNxBJW0zu8dKvkpieo9RKMWvh+Np53WZ2nI47r6O93
         diNPI8bu/v9zZq82R9diBvNCTBWNhEQu6t/3NAweEGnFj66WUXXXYzEc/jMuPwJLT4Uv
         2PLRe0MQjTYWs1B5Y5OU+BTdrkvyHMfG192PCf7PvVvdEfBBZEq8iTm3tD095wmamb/V
         uw9LT2j3BDwd9eFabyZ+BY76Xkl+VSS9USDxP3PTEckLs2Mqb+zMtpQOFyKCnpkg3V8w
         5fB8zXIa6wHkRvewPKq0e506/n7BK91eYxewBiJv4x8AuVyo6s6DFYsBxT3hfTKOxGLw
         1fzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VcMqa45y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9-20020ac85d89000000b00430c438fee7si4289253qtx.211.2024.03.18.09.17.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 09:17:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VcMqa45y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmFfW-0000Tl-AJ; Mon, 18 Mar 2024 12:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rmFfI-00085F-0I
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 12:16:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rmFfD-0004kV-4b
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 12:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710778595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QWKuhfl1vUGxImS8wUGBNUDNid5d+Po/4qnMfxE2Umw=;
 b=VcMqa45ykEsudtrm0FlfUcctjMchID917jjsW1i3IZdS8tifAyBadx7rNw5zajjrxTm61R
 iSzIOft/rWfM19QqxTCk751SnAu3UVFdlxYIfxbYuxefBzTK3/gdUPykl+HKKu5oKvxd8q
 MzyH6wNUYNGF3KNDmvAal50+qJQuyz8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-GPaPRm6BNmi_8Ce4PRYBfQ-1; Mon, 18 Mar 2024 12:16:33 -0400
X-MC-Unique: GPaPRm6BNmi_8Ce4PRYBfQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33ed234bcb1so1289491f8f.0
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 09:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710778592; x=1711383392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QWKuhfl1vUGxImS8wUGBNUDNid5d+Po/4qnMfxE2Umw=;
 b=weXKrzDwtLhzuWm4+X37nf1NhLJiv+sU7TPqmmWfm3JQTdWD7sbEbq7yw6tZc3XpdB
 v1GPpLjLrv39SV9WYBhQ6peikq70anP/Wt0E+hxMIoz/NXKt/FubJNfwIoXUphwYKnEr
 wiKZvxr52RwAiuaZ3764l3+WBXqG7YV88YTIYFjZ7Nd4wdBIrXbXv/ibfC5V0gUaueNP
 gbv04fV8FS1Ez5lu7tVK3XCNM6IWI9RXDL1hiqPTtOqzO5+S+mSbfuzRemCs66vKa/Gl
 +00UJmHzm16lCvMMutP0hkH1R0LflJb+T2ARsPf+7R3cwsjMHbA5oRfDAbOUFgfGBWVR
 6DuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3uBDtPEEAcF6j+psY8tBejunvUPcnj/I5DOAo6s2Xy7J5Eozog1s1L+g31ACL9l3wzetmvka6Li0gXcpwzoV+PqYp
X-Gm-Message-State: AOJu0YyTuEMoiaSIKeek5A+s+2xY/QtajDh0Y10KzewPYoXU+9wh/pPh
 BgNZeJRHcVvQ8pny0FdaFCZMqvFNiHitpGBBWq+NsJkcafF6ahP04ej/c0oI8N5V9dRLUK7Iy6v
 4lRs5OVGZExwTho5aUCq0qas5C5AWXwGzA02kLhxkbPO8zoXY8Q==
X-Received: by 2002:adf:eb07:0:b0:33d:3f23:eea7 with SMTP id
 s7-20020adfeb07000000b0033d3f23eea7mr48652wrn.35.1710778592502; 
 Mon, 18 Mar 2024 09:16:32 -0700 (PDT)
X-Received: by 2002:adf:eb07:0:b0:33d:3f23:eea7 with SMTP id
 s7-20020adfeb07000000b0033d3f23eea7mr48626wrn.35.1710778591953; 
 Mon, 18 Mar 2024 09:16:31 -0700 (PDT)
Received: from redhat.com ([2.52.5.113]) by smtp.gmail.com with ESMTPSA id
 bo16-20020a056000069000b0033ecb111a5csm10045255wrb.83.2024.03.18.09.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 09:16:31 -0700 (PDT)
Date: Mon, 18 Mar 2024 12:16:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Ani Sinha <anisinha@redhat.com>, Fiona Ebner <f.ebner@proxmox.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PULL 16/24] smbios: get rid of global smbios_ep_type
Message-ID: <69ea07a56ef54050a61b91fe8236fef4908fe5d1.1710778506.git.mst@redhat.com>
References: <cover.1710778506.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1710778506.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mC2LgxhsPCjC

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Ani Sinha <anisinha@redhat.com>
Tested-by: Fiona Ebner <f.ebner@proxmox.com>
Message-Id: <20240314152302.2324164-14-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/fw_cfg.h             |  3 ++-
 include/hw/firmware/smbios.h |  5 +++--
 hw/arm/virt.c                |  4 ++--
 hw/i386/fw_cfg.c             |  8 ++++----
 hw/i386/pc.c                 |  2 +-
 hw/loongarch/virt.c          |  7 ++++---
 hw/riscv/virt.c              |  6 +++---
 hw/smbios/smbios.c           | 27 +++++++++++++++------------
 hw/smbios/smbios_legacy.c    |  2 +-
 9 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/hw/i386/fw_cfg.h b/hw/i386/fw_cfg.h
index 1e1de6b4a3..92e310f5fd 100644
--- a/hw/i386/fw_cfg.h
+++ b/hw/i386/fw_cfg.h
@@ -23,7 +23,8 @@
 FWCfgState *fw_cfg_arch_create(MachineState *ms,
                                uint16_t boot_cpus,
                                uint16_t apic_id_limit);
-void fw_cfg_build_smbios(PCMachineState *ms, FWCfgState *fw_cfg);
+void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
+                         SmbiosEntryPointType ep_type);
 void fw_cfg_build_feature_control(MachineState *ms, FWCfgState *fw_cfg);
 void fw_cfg_add_acpi_dsdt(Aml *scope, FWCfgState *fw_cfg);
 
diff --git a/include/hw/firmware/smbios.h b/include/hw/firmware/smbios.h
index d4b91d5a14..8d3fb2fb3b 100644
--- a/include/hw/firmware/smbios.h
+++ b/include/hw/firmware/smbios.h
@@ -326,16 +326,17 @@ struct smbios_type_127 {
     struct smbios_structure_header header;
 } QEMU_PACKED;
 
-bool smbios_validate_table(Error **errp);
+bool smbios_validate_table(SmbiosEntryPointType ep_type, Error **errp);
 void smbios_add_usr_blob_size(size_t size);
 void smbios_entry_add(QemuOpts *opts, Error **errp);
 void smbios_set_cpuid(uint32_t version, uint32_t features);
 void smbios_set_defaults(const char *manufacturer, const char *product,
                          const char *version,
-                         bool uuid_encoded, SmbiosEntryPointType ep_type);
+                         bool uuid_encoded);
 void smbios_set_default_processor_family(uint16_t processor_family);
 uint8_t *smbios_get_table_legacy(size_t *length, Error **errp);
 void smbios_get_tables(MachineState *ms,
+                       SmbiosEntryPointType ep_type,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
                        uint8_t **tables, size_t *tables_len,
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b634c908a7..a9a913aead 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1651,13 +1651,13 @@ static void virt_build_smbios(VirtMachineState *vms)
 
     smbios_set_defaults("QEMU", product,
                         vmc->smbios_old_sys_ver ? "1.0" : mc->name,
-                        true, SMBIOS_ENTRY_POINT_TYPE_64);
+                        true);
 
     /* build the array of physical mem area from base_memmap */
     mem_array.address = vms->memmap[VIRT_MEM].base;
     mem_array.length = ms->ram_size;
 
-    smbios_get_tables(ms, &mem_array, 1,
+    smbios_get_tables(ms, SMBIOS_ENTRY_POINT_TYPE_64, &mem_array, 1,
                       &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len,
                       &error_fatal);
diff --git a/hw/i386/fw_cfg.c b/hw/i386/fw_cfg.c
index e387bf50d0..d802d2787f 100644
--- a/hw/i386/fw_cfg.c
+++ b/hw/i386/fw_cfg.c
@@ -48,7 +48,8 @@ const char *fw_cfg_arch_key_name(uint16_t key)
     return NULL;
 }
 
-void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
+void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg,
+                         SmbiosEntryPointType ep_type)
 {
 #ifdef CONFIG_SMBIOS
     uint8_t *smbios_tables, *smbios_anchor;
@@ -63,8 +64,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
     if (pcmc->smbios_defaults) {
         /* These values are guest ABI, do not change */
         smbios_set_defaults("QEMU", mc->desc, mc->name,
-                            pcmc->smbios_uuid_encoded,
-                            pcms->smbios_entry_point_type);
+                            pcmc->smbios_uuid_encoded);
     }
 
     /* tell smbios about cpuid version and features */
@@ -89,7 +89,7 @@ void fw_cfg_build_smbios(PCMachineState *pcms, FWCfgState *fw_cfg)
             array_count++;
         }
     }
-    smbios_get_tables(ms, mem_array, array_count,
+    smbios_get_tables(ms, ep_type, mem_array, array_count,
                       &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len,
                       &error_fatal);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index feb7a93083..44eb073abd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -672,7 +672,7 @@ void pc_machine_done(Notifier *notifier, void *data)
 
     acpi_setup();
     if (x86ms->fw_cfg) {
-        fw_cfg_build_smbios(pcms, x86ms->fw_cfg);
+        fw_cfg_build_smbios(pcms, x86ms->fw_cfg, pcms->smbios_entry_point_type);
         fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);
         /* update FW_CFG_NB_CPUS to account for -device added CPUs */
         fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 53bfdcee61..441d764843 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -355,10 +355,11 @@ static void virt_build_smbios(LoongArchMachineState *lams)
         return;
     }
 
-    smbios_set_defaults("QEMU", product, mc->name,
-                        true, SMBIOS_ENTRY_POINT_TYPE_64);
+    smbios_set_defaults("QEMU", product, mc->name, true);
 
-    smbios_get_tables(ms, NULL, 0, &smbios_tables, &smbios_tables_len,
+    smbios_get_tables(ms, SMBIOS_ENTRY_POINT_TYPE_64,
+                      NULL, 0,
+                      &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len, &error_fatal);
 
     if (smbios_anchor) {
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 535fd047ba..72a55b8af1 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1275,8 +1275,7 @@ static void virt_build_smbios(RISCVVirtState *s)
         product = "KVM Virtual Machine";
     }
 
-    smbios_set_defaults("QEMU", product, mc->name,
-                        true, SMBIOS_ENTRY_POINT_TYPE_64);
+    smbios_set_defaults("QEMU", product, mc->name, true);
 
     if (riscv_is_32bit(&s->soc[0])) {
         smbios_set_default_processor_family(0x200);
@@ -1288,7 +1287,8 @@ static void virt_build_smbios(RISCVVirtState *s)
     mem_array.address = s->memmap[VIRT_DRAM].base;
     mem_array.length = ms->ram_size;
 
-    smbios_get_tables(ms, &mem_array, 1,
+    smbios_get_tables(ms, SMBIOS_ENTRY_POINT_TYPE_64,
+                      &mem_array, 1,
                       &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len,
                       &error_fatal);
diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
index f7ca7d77e3..0ab77b5ec8 100644
--- a/hw/smbios/smbios.c
+++ b/hw/smbios/smbios.c
@@ -43,7 +43,6 @@ uint8_t *smbios_tables;
 size_t smbios_tables_len;
 unsigned smbios_table_max;
 unsigned smbios_table_cnt;
-static SmbiosEntryPointType smbios_ep_type = SMBIOS_ENTRY_POINT_TYPE_32;
 
 static SmbiosEntryPoint ep;
 
@@ -520,9 +519,9 @@ static bool smbios_check_type4_count(uint32_t expected_t4_count, Error **errp)
     return true;
 }
 
-bool smbios_validate_table(Error **errp)
+bool smbios_validate_table(SmbiosEntryPointType ep_type, Error **errp)
 {
-    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_32 &&
+    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_32 &&
         smbios_tables_len > SMBIOS_21_MAX_TABLES_LEN) {
         error_setg(errp, "SMBIOS 2.1 table length %zu exceeds %d",
                    smbios_tables_len, SMBIOS_21_MAX_TABLES_LEN);
@@ -669,14 +668,15 @@ static void smbios_build_type_3_table(void)
     SMBIOS_BUILD_TABLE_POST;
 }
 
-static void smbios_build_type_4_table(MachineState *ms, unsigned instance)
+static void smbios_build_type_4_table(MachineState *ms, unsigned instance,
+                                      SmbiosEntryPointType ep_type)
 {
     char sock_str[128];
     size_t tbl_len = SMBIOS_TYPE_4_LEN_V28;
     unsigned threads_per_socket;
     unsigned cores_per_socket;
 
-    if (smbios_ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
+    if (ep_type == SMBIOS_ENTRY_POINT_TYPE_64) {
         tbl_len = SMBIOS_TYPE_4_LEN_V30;
     }
 
@@ -1011,11 +1011,10 @@ void smbios_set_default_processor_family(uint16_t processor_family)
 
 void smbios_set_defaults(const char *manufacturer, const char *product,
                          const char *version,
-                         bool uuid_encoded, SmbiosEntryPointType ep_type)
+                         bool uuid_encoded)
 {
     smbios_have_defaults = true;
     smbios_uuid_encoded = uuid_encoded;
-    smbios_ep_type = ep_type;
 
     SMBIOS_SET_DEFAULT(smbios_type1.manufacturer, manufacturer);
     SMBIOS_SET_DEFAULT(smbios_type1.product, product);
@@ -1032,9 +1031,9 @@ void smbios_set_defaults(const char *manufacturer, const char *product,
     SMBIOS_SET_DEFAULT(type17.manufacturer, manufacturer);
 }
 
-static void smbios_entry_point_setup(void)
+static void smbios_entry_point_setup(SmbiosEntryPointType ep_type)
 {
-    switch (smbios_ep_type) {
+    switch (ep_type) {
     case SMBIOS_ENTRY_POINT_TYPE_32:
         memcpy(ep.ep21.anchor_string, "_SM_", 4);
         memcpy(ep.ep21.intermediate_anchor_string, "_DMI_", 5);
@@ -1084,6 +1083,7 @@ static void smbios_entry_point_setup(void)
 }
 
 void smbios_get_tables(MachineState *ms,
+                       SmbiosEntryPointType ep_type,
                        const struct smbios_phys_mem_area *mem_array,
                        const unsigned int mem_array_size,
                        uint8_t **tables, size_t *tables_len,
@@ -1092,6 +1092,9 @@ void smbios_get_tables(MachineState *ms,
 {
     unsigned i, dimm_cnt, offset;
 
+    assert(ep_type == SMBIOS_ENTRY_POINT_TYPE_32 ||
+           ep_type == SMBIOS_ENTRY_POINT_TYPE_64);
+
     g_free(smbios_tables);
     smbios_tables = g_memdup2(usr_blobs, usr_blobs_len);
     smbios_tables_len = usr_blobs_len;
@@ -1106,7 +1109,7 @@ void smbios_get_tables(MachineState *ms,
     assert(ms->smp.sockets >= 1);
 
     for (i = 0; i < ms->smp.sockets; i++) {
-        smbios_build_type_4_table(ms, i);
+        smbios_build_type_4_table(ms, i, ep_type);
     }
 
     smbios_build_type_8_table();
@@ -1155,10 +1158,10 @@ void smbios_get_tables(MachineState *ms,
     if (!smbios_check_type4_count(ms->smp.sockets, errp)) {
         goto err_exit;
     }
-    if (!smbios_validate_table(errp)) {
+    if (!smbios_validate_table(ep_type, errp)) {
         goto err_exit;
     }
-    smbios_entry_point_setup();
+    smbios_entry_point_setup(ep_type);
 
     /* return tables blob and entry point (anchor), and their sizes */
     *tables = smbios_tables;
diff --git a/hw/smbios/smbios_legacy.c b/hw/smbios/smbios_legacy.c
index a6544bf55a..06907cd16c 100644
--- a/hw/smbios/smbios_legacy.c
+++ b/hw/smbios/smbios_legacy.c
@@ -173,7 +173,7 @@ uint8_t *smbios_get_table_legacy(size_t *length, Error **errp)
 
     smbios_build_type_0_fields();
     smbios_build_type_1_fields();
-    if (!smbios_validate_table(errp)) {
+    if (!smbios_validate_table(SMBIOS_ENTRY_POINT_TYPE_32, errp)) {
         goto err_exit;
     }
 
-- 
MST

