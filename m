Received: by 2002:ac2:5bdb:0:0:0:0:0 with SMTP id u27csp799777lfn;
        Mon, 25 Oct 2021 16:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV1CI8pa/eRrK3WkVKU5G1XFQrrtjYsiyjIUYM/wFXt0Vcjj9c/uxmib/2YA6MLNc1Szto
X-Received: by 2002:a05:6830:1dc7:: with SMTP id a7mr16866491otj.342.1635205334270;
        Mon, 25 Oct 2021 16:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635205334; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7Ul6G/9xmfuUq5XP3J1ik/tGKzXHXkD21Y7h6IZlr2iGivVdQveXUMB031BegnfUF
         xwW7EaF/yKdNCqdXPhVaqojyqLFoql2aBCBr4hcNJtuxhTC8u2/dFaRs/VUvlNIysAmx
         rDCshTY1mclP6jft3hlNv2+4XVPhTUkQYPlJ72e32DT2o22WzLU4JZ4Q5wyJJV0ZaD/8
         yF2SCmkU2GuSuD22vrT/1fzpeNDYcIFidWJR2xyeiDNENeSRlI22vkR1E6QQDugAp9uj
         SrCBRrYKP+eCdtuv52IW3WZTEBzCcMm/Q4sLi9NF252qLCrVMURt9FB201L8ou0Zrx2Z
         uDQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=EYa0GcdktfROMs8p8yndAa3R033SRocWRtZlsfAHbug=;
        b=UBNU7+PFaeg1QDXg5meqIBsa7ENNkrA7V6wwLDv8ZI1CIyvclMU9uzyo9G3/xUO4Rj
         BOWNH2XhXUpKRGpx5ScW3iSVZriE4zaOK/xtq8OLd97UJOhS2SJcVy5c92XNjxRi5aje
         sw25qtrD/aGdRG7LQdla7sqlp+u781jMHFDiEsfqv33LmdBuqO6lSDmSzBsUTnq79iiz
         8HYGUBTr9WaRCk0pQEbu5GlALu5EOtrH8/ofzq66MyEzVb4Zug/Sw9Dhx8+LKz4FPwNe
         dN5tqbWi6TtEl3H+ceA72KIyWS5e7xmhem5BQUhHqceYAU/OyGClI/Ar74QHqgbPbf8L
         dztg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YpNBR8du;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si4755otu.70.2021.10.25.16.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Oct 2021 16:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YpNBR8du;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mf9bZ-0008Ci-Hk
	for alex.bennee@linaro.org; Mon, 25 Oct 2021 19:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mf9ai-0008CS-CJ
 for qemu-arm@nongnu.org; Mon, 25 Oct 2021 19:41:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mf9ad-0002xQ-H5
 for qemu-arm@nongnu.org; Mon, 25 Oct 2021 19:41:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635205273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EYa0GcdktfROMs8p8yndAa3R033SRocWRtZlsfAHbug=;
 b=YpNBR8duLODNEPjnnXQOYWCg7Vj5047kNtPZnatG/WVZ6012NmLZV4nW1Q+s5mQUSW/zId
 n4EHX8qK/oQQ1evggSMFpL0Tgj8MpW0BoBqLpUEMSFApxQu2MVdcyjJHV20hbL31XKyL9Q
 fi6WF4wz9YnUUL+htW2Ap5qhsEkZivk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-362-qDj5ZixWNi2lGlP-QwuJaA-1; Mon, 25 Oct 2021 19:41:11 -0400
X-MC-Unique: qDj5ZixWNi2lGlP-QwuJaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F5810A8E00;
 Mon, 25 Oct 2021 23:41:10 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-187.bne.redhat.com [10.64.54.187])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AC0C2B060;
 Mon, 25 Oct 2021 23:41:05 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] hw/arm/virt: Expose empty NUMA nodes through ACPI
Date: Tue, 26 Oct 2021 07:41:01 +0800
Message-Id: <20211025234101.224705-1-gshan@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, ehabkost@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DlNVouixiAXq

The empty NUMA nodes, where no memory resides, aren't exposed
through ACPI SRAT table. It's not user preferred behaviour because
the corresponding memory node devices are missed from the guest
kernel as the following example shows, and memory can't be hot
added to these empty NUMA nodes at later point.

  /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
  -accel kvm -machine virt,gic-version=host               \
  -cpu host -smp 4,sockets=2,cores=2,threads=1            \
  -m 1024M,slots=16,maxmem=64G                            \
  -object memory-backend-ram,id=mem0,size=512M            \
  -object memory-backend-ram,id=mem1,size=512M            \
  -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
  -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
  -numa node,nodeid=2                                     \
  -numa node,nodeid=3                                     \
     :
  guest# ls /sys/devices/system/node | grep node
  node0
  node1
  node2

This exposes these empty NUMA nodes through ACPI SRAT table. With
this applied, the corresponding memory node devices can be found
from the guest. Note that the hotpluggable capability is explicitly
given to these empty NUMA nodes for sake of completeness.

  guest# ls /sys/devices/system/node | grep node
  node0
  node1
  node2
  node3

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt-acpi-build.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 674f902652..a4c95b2f64 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -526,6 +526,7 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     const CPUArchIdList *cpu_list = mc->possible_cpu_arch_ids(ms);
     AcpiTable table = { .sig = "SRAT", .rev = 3, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
+    MemoryAffinityFlags flags;
 
     acpi_table_begin(&table, table_data);
     build_append_int_noprefix(table_data, 1, 4); /* Reserved */
@@ -547,12 +548,15 @@ build_srat(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 
     mem_base = vms->memmap[VIRT_MEM].base;
     for (i = 0; i < ms->numa_state->num_nodes; ++i) {
-        if (ms->numa_state->nodes[i].node_mem > 0) {
-            build_srat_memory(table_data, mem_base,
-                              ms->numa_state->nodes[i].node_mem, i,
-                              MEM_AFFINITY_ENABLED);
-            mem_base += ms->numa_state->nodes[i].node_mem;
+        if (ms->numa_state->nodes[i].node_mem) {
+            flags = MEM_AFFINITY_ENABLED;
+        } else {
+            flags = MEM_AFFINITY_ENABLED | MEM_AFFINITY_HOTPLUGGABLE;
         }
+
+        build_srat_memory(table_data, mem_base,
+                          ms->numa_state->nodes[i].node_mem, i, flags);
+        mem_base += ms->numa_state->nodes[i].node_mem;
     }
 
     if (ms->nvdimms_state->is_enabled) {
-- 
2.23.0

