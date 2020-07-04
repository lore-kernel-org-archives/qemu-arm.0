Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3527659lfm;
        Sat, 4 Jul 2020 11:34:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuLvg3AmfkhBayajV5wR8qaetpxPSq05gk7tt9OwxLl4qm7alnWu4sNdl43uxtrIixzv+l
X-Received: by 2002:a25:4903:: with SMTP id w3mr45983240yba.384.1593887650442;
        Sat, 04 Jul 2020 11:34:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593887650; cv=none;
        d=google.com; s=arc-20160816;
        b=n0q66uMeyqLGqAmvx6E8Ee5IlYJYRCQAvokt78hZ5i8P9ltJJuyRgvBKTrq7lXNC4f
         ccqNwhWDLe791Js1FK9qK9WD6euWHZ1RFMG/Ndj3OJzYBZVaOR8iSF5RvkVkcFplCdBa
         Vs/6f2bmBCbMzUUUeq9JPjzZ2qwbgBKmG+8KhC+eQTsJm1DdN2xWdRyO36s27egPOZMc
         av2VdqBTWR2Hkoz7hV4eeR5B31VGcxMxDqaFLraOVON/ToCiXkDMjJ2DN74bHNBuaydQ
         koCK5nP3UD0pNgnigiREblqh3WRpvn2ZriTxwPIxE3Lb3YfM0jVqTCJlj6QFhdfdRhDR
         NY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=c5tdu84EsYu030A7xZkXJlQoGtXOTX2WueiDbJOGS4I=;
        b=Q6ih2UmKLn+Pj27CxtKZXr8irUSiO1AbApkmbXbFzAY0QqUsqS+0OM4buRYy0C1yFG
         l4SC6W1nr1oSHY4T6bQQb9onARhH4pJuPX8Vo2d9SkoTrAs0XvB7jVMuzU1SbCmc+jHR
         5zeHR/DgqcQmTYBGNsWquvzfNve42/iSHWd940FXqUSuQoFyJGsgFAoDKQE6L4k/PouW
         uC7+du84ZF/D7JL8M5F7qHdqZ3HwkwFdanhO6lN9JZ7Yjg1WKrIVl/MEFNRcENaU6qxC
         B8K24r4z/VdUFE/auI/rO74w5r/N7ivEKUoaulWAn+J+d+M0DzkEXAq2xbte6G5D1WoU
         dRSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aZXbCez8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si22061974ybt.242.2020.07.04.11.34.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 11:34:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aZXbCez8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrmzJ-0001uP-Pd
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 14:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrmvq-00042g-NP
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 14:30:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43622
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrmvo-0001Rw-LH
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 14:30:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593887432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c5tdu84EsYu030A7xZkXJlQoGtXOTX2WueiDbJOGS4I=;
 b=aZXbCez874WMXryFVKQ8JC4F+yfBFgqQVPgmcw5Ld83iOVD2aISTwQ8LfUD/xBYaIp/AZb
 wk2ohByiYPPyo/hyYc3U8QuJ8+orWY6nFBnlQNNJ2+E4ynKJiaMvOgCMOoXlycmmIXkeKe
 a8K9P5HBhHhPpCkTsPE88B0Kj5PYLtc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-gAi4bTgYNQuFaz6ybGr1eQ-1; Sat, 04 Jul 2020 14:30:30 -0400
X-MC-Unique: gAi4bTgYNQuFaz6ybGr1eQ-1
Received: by mail-wm1-f72.google.com with SMTP id s134so40197612wme.6
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 11:30:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c5tdu84EsYu030A7xZkXJlQoGtXOTX2WueiDbJOGS4I=;
 b=LFCgpbWklcpLF+o+v6AiQkZnKWB5qB8nL/k6xVuLAQCouVrGf+jpz23QcIjrylqZXg
 9sQiEpl21+LVDyrGdn1P6nTYwNBmtKfaMhRoSUQVcJCa2iyEnOz5bbGiS6xPKYpKDQmr
 BezXOGQeq2t4jdKSZ5vnM6CNGebKVfyH8u+0wA5xthQGKyRlV9jXEO8BthMx01Hb/PgC
 Tn6czbS/ezOXqhUwTJWgtUm6ysu4Hm7uRL2/xoKcOtxk/FAxfGm6qim+IA4GvCAA6Ayw
 TsvMqaU8ag+G1vu3HkBQ8Od2YLLEy9RwylVfcOVhL5iSjze6hmMd9Iy/qAEtdGEfqROx
 8Dig==
X-Gm-Message-State: AOAM5306eHNj2+Ct6bfrUO3UUUPw+v55jH7VH9rOYPH6jFhmKqjiCnhO
 I3EqP0Yl+0w8ESTV6LLz5IvEYOdPTFvP2jDDdKMTCaGb1WKD7bw21s5ydxnkNVyqCqoyQjZ1UVT
 9WKNajWweFanq
X-Received: by 2002:a1c:2543:: with SMTP id l64mr19623189wml.31.1593887429326; 
 Sat, 04 Jul 2020 11:30:29 -0700 (PDT)
X-Received: by 2002:a1c:2543:: with SMTP id l64mr19623173wml.31.1593887429065; 
 Sat, 04 Jul 2020 11:30:29 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 138sm11807123wmb.1.2020.07.04.11.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 11:30:28 -0700 (PDT)
Date: Sat, 4 Jul 2020 14:30:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 24/41] numa: Auto-enable NUMA when any memory devices are
 possible
Message-ID: <20200704182750.1088103-25-mst@redhat.com>
References: <20200704182750.1088103-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200704182750.1088103-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 08:57:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 David Hildenbrand <david@redhat.com>,
 "qemu-arm @ nongnu . org" <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Shi <alex.shi@linux.alibaba.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ek3YCy9Duoyo

From: David Hildenbrand <david@redhat.com>

Let's auto-enable it also when maxmem is specified but no slots are
defined. This will result in us properly creating ACPI srat tables,
indicating the maximum possible PFN to the guest OS. Based on this, e.g.,
Linux will enable the swiotlb properly.

This avoids having to manually force the switolb on (swiotlb=force) in
Linux in case we're booting only using DMA memory (e.g., 2GB on x86-64),
and virtio-mem adds memory later on that really needs the swiotlb to be
used for DMA.

Let's take care of backwards compatibility if somebody has a setup that
specifies "maxram" without "slots".

Reported-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sergio Lopez <slp@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org <qemu-arm@nongnu.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20200626072248.78761-22-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/boards.h |  1 +
 hw/arm/virt.c       |  2 ++
 hw/core/numa.c      | 11 ++++++-----
 hw/i386/microvm.c   |  1 +
 hw/i386/pc.c        |  1 +
 hw/i386/pc_piix.c   |  1 +
 hw/i386/pc_q35.c    |  1 +
 7 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 18815d9be2..426ce5f625 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -207,6 +207,7 @@ struct MachineClass {
     const char **valid_cpu_types;
     strList *allowed_dynamic_sysbus_devices;
     bool auto_enable_numa_with_memhp;
+    bool auto_enable_numa_with_memdev;
     void (*numa_auto_assign_ram)(MachineClass *mc, NodeInfo *nodes,
                                  int nb_nodes, ram_addr_t size);
     bool ignore_boot_device_suffixes;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cd0834ce7f..f97be80a86 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2373,6 +2373,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
     mc->auto_enable_numa_with_memhp = true;
+    mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
 
     object_class_property_add(oc, "acpi", "OnOffAuto",
@@ -2485,6 +2486,7 @@ static void virt_machine_5_0_options(MachineClass *mc)
     virt_machine_5_1_options(mc);
     compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     mc->numa_mem_supported = true;
+    mc->auto_enable_numa_with_memdev = false;
 }
 DEFINE_VIRT_MACHINE(5, 0)
 
diff --git a/hw/core/numa.c b/hw/core/numa.c
index e9aec69afd..6a20ce7cf1 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -688,8 +688,9 @@ void numa_complete_configuration(MachineState *ms)
     NodeInfo *numa_info = ms->numa_state->nodes;
 
     /*
-     * If memory hotplug is enabled (slots > 0) but without '-numa'
-     * options explicitly on CLI, guestes will break.
+     * If memory hotplug is enabled (slot > 0) or memory devices are enabled
+     * (ms->maxram_size > ram_size) but without '-numa' options explicitly on
+     * CLI, guests will break.
      *
      *   Windows: won't enable memory hotplug without SRAT table at all
      *
@@ -704,9 +705,9 @@ void numa_complete_configuration(MachineState *ms)
      * assume there is just one node with whole RAM.
      */
     if (ms->numa_state->num_nodes == 0 &&
-        ((ms->ram_slots > 0 &&
-        mc->auto_enable_numa_with_memhp) ||
-        mc->auto_enable_numa)) {
+        ((ms->ram_slots && mc->auto_enable_numa_with_memhp) ||
+         (ms->maxram_size > ms->ram_size && mc->auto_enable_numa_with_memdev) ||
+         mc->auto_enable_numa)) {
             NumaNodeOptions node = { };
             parse_numa_node(ms, &node, &error_abort);
             numa_info[0].node_mem = ram_size;
diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
index 5e931975a0..81d0888930 100644
--- a/hw/i386/microvm.c
+++ b/hw/i386/microvm.c
@@ -464,6 +464,7 @@ static void microvm_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 288;
     mc->has_hotpluggable_cpus = false;
     mc->auto_enable_numa_with_memhp = false;
+    mc->auto_enable_numa_with_memdev = false;
     mc->default_cpu_type = TARGET_DEFAULT_CPU_TYPE;
     mc->nvdimm_supported = false;
     mc->default_ram_id = "microvm.ram";
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 576f2502f9..61acc9e530 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1975,6 +1975,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
     mc->auto_enable_numa_with_memhp = true;
+    mc->auto_enable_numa_with_memdev = true;
     mc->has_hotpluggable_cpus = true;
     mc->default_boot_order = "cad";
     mc->hot_add_cpu = pc_hot_add_cpu;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 1d832b2878..fae487f57d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -444,6 +444,7 @@ static void pc_i440fx_5_0_machine_options(MachineClass *m)
     m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
+    m->auto_enable_numa_with_memdev = false;
 }
 
 DEFINE_I440FX_MACHINE(v5_0, "pc-i440fx-5.0", NULL,
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 047ea8db28..acd6d405f0 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -372,6 +372,7 @@ static void pc_q35_5_0_machine_options(MachineClass *m)
     m->numa_mem_supported = true;
     compat_props_add(m->compat_props, hw_compat_5_0, hw_compat_5_0_len);
     compat_props_add(m->compat_props, pc_compat_5_0, pc_compat_5_0_len);
+    m->auto_enable_numa_with_memhp = false;
 }
 
 DEFINE_Q35_MACHINE(v5_0, "pc-q35-5.0", NULL,
-- 
MST

