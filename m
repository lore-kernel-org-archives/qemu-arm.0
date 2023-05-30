Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2108371ejb;
        Tue, 30 May 2023 04:40:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ61dtN8wRnmuuYqSkX043srSrOQAcCVoxgySpWHHUilRrGA9PQEzJubiZcL+70la1hOlOg4
X-Received: by 2002:a05:620a:298a:b0:75b:23a0:de82 with SMTP id r10-20020a05620a298a00b0075b23a0de82mr2498406qkp.0.1685446856899;
        Tue, 30 May 2023 04:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685446856; cv=none;
        d=google.com; s=arc-20160816;
        b=nVB7a/tIJs1CkjCg/G7n/q9hip4Cg7BgX/Bn0H2u8LggVR/65zeUZo8EnRdS3Tn+/s
         mWOMQu2X1VOc9kxboEhNYHXWpX2gU2nSFZktdi8RQRI3tEkHdQVbLo50fV1N2whuQgI6
         3ZIOv3qj68UdZAO+IZMIwVm6OYadOfXthtvqfJlhbtVmGLE3rSNEio9HHt50QW2JZfP9
         TYVabSoYtgkG2i/lOHoZQEv9Vv1Cz/jAoErXYrH2Fa2ci1ZtDQ+zZdUs46CAW1lPrD2J
         w1AjjgUOI4TXpoNB5RhwPufKpTjkg03djpwa3uiYgQx3EVHL+rB+wJiVwcDZyJU19N8u
         uZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V7PkcJ6DVo7MMGulOFY19ajlG0QrNz/+An8Z4BW518g=;
        b=PIPnKkxFNhIgc1NLa6uQO2sWRD6wsQ/uI3tQdLEGQEZRM9NnVcf8Bs+kUkFA0m1HwG
         bIVltQgpHR2aKUZJd5uTkQi2EIQ7bbRsSIJNJkODGwWGe6fH/SYBu8NEfm8qcoeey0QA
         7ne3j1Pa6U4wFPvb6B0nMUA5ogl400HQFXfqjm24iYZCC2wRW6j2hHWmtNr8jmI1FOdm
         crLh3i08rIy0dsQpJnEUvWJIfqzUdo6w/TAk9znrO6NhIZ1TVBBiRUJOVnse9m3TEit2
         pDVWGAFuzQH+GMF+tmvNrsAgpws/nKYjTztm9YNTAo50p5q7KVocTbU3cQdtzZen+PtG
         9ECA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ge2+h44G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id da1-20020a05620a360100b00747a2434db2si6250024qkb.766.2023.05.30.04.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ge2+h44G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3xhG-00084g-Vg; Tue, 30 May 2023 07:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xh9-0007xR-Ey
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xh8-0004B7-0P
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V7PkcJ6DVo7MMGulOFY19ajlG0QrNz/+An8Z4BW518g=;
 b=Ge2+h44GyYA/ImnNIMCktLeduMKQj9urwGPkms1Vp344AgYEiarqw+OYOI2ZQoUsBvkMCT
 N4ALbQ1XwwdB5vLhjp6kJmM5qm5eISNgpw2+5PXu9rYh6MUqmZxNT1Ye1YmTu3D0nM+YjZ
 xVxZtooJOKDmTJbBBIW6fW0YXqPSOMQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-TiiqfpmPNL-OZJ8s-rnmiA-1; Tue, 30 May 2023 07:39:12 -0400
X-MC-Unique: TiiqfpmPNL-OZJ8s-rnmiA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 524973C0CEED;
 Tue, 30 May 2023 11:39:11 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 290BD40CFD45;
 Tue, 30 May 2023 11:39:08 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH 07/10] hw/i386/acpi-build: Rely on machine->device_memory when
 building SRAT
Date: Tue, 30 May 2023 13:38:35 +0200
Message-Id: <20230530113838.257755-8-david@redhat.com>
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
References: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: feVhnK7Y2pdj

We're already looking at machine->device_memory when calling
build_srat_memory(), so let's simply avoid going via
PC_MACHINE_DEVMEM_REGION_SIZE to get the size and rely on
machine->device_memory directly.

Once machine->device_memory is set, we know that the size > 0. The code now
looks much more similar the hw/arm/virt-acpi-build.c variant.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/acpi-build.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 512162003b..9c74fa17ad 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1950,12 +1950,8 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
     MachineClass *mc = MACHINE_GET_CLASS(machine);
     X86MachineState *x86ms = X86_MACHINE(machine);
     const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(machine);
-    PCMachineState *pcms = PC_MACHINE(machine);
     int nb_numa_nodes = machine->numa_state->num_nodes;
     NodeInfo *numa_info = machine->numa_state->nodes;
-    ram_addr_t hotpluggable_address_space_size =
-        object_property_get_int(OBJECT(pcms), PC_MACHINE_DEVMEM_REGION_SIZE,
-                                NULL);
     AcpiTable table = { .sig = "SRAT", .rev = 1, .oem_id = x86ms->oem_id,
                         .oem_table_id = x86ms->oem_table_id };
 
@@ -2071,9 +2067,10 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * Memory devices may override proximity set by this entry,
      * providing _PXM method if necessary.
      */
-    if (hotpluggable_address_space_size) {
+    if (machine->device_memory) {
         build_srat_memory(table_data, machine->device_memory->base,
-                          hotpluggable_address_space_size, nb_numa_nodes - 1,
+                          memory_region_size(&machine->device_memory->mr),
+                          nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
     }
 
-- 
2.40.1

