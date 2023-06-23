Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp124353ejn;
        Fri, 23 Jun 2023 05:46:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tImVzzMEybfhTNiGPIaiFW6DSqflOd6FYI4NmkJtdEkmsWJ5IrDc459VxjnmAVZIz9kaM
X-Received: by 2002:a1c:f70d:0:b0:3f8:b6c:84aa with SMTP id v13-20020a1cf70d000000b003f80b6c84aamr15548835wmh.24.1687524411226;
        Fri, 23 Jun 2023 05:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687524411; cv=none;
        d=google.com; s=arc-20160816;
        b=Yd9o5XIKTXlwKxYLkfjd9SG0xCHu3HKWMVdblBx476xBmrr/QqN3JSs6noVud7lFdP
         yW5rDEjibsy3z5/9LuHsgSIvGWJs1+n2WS6xUKclxL6LzrXL9kbBg6okdzN+0zS9jkjW
         kzB/Lv6eh4m23mrUKY6k+FEhXDB87c7Hexpdzl3nfrhw0R9VhCi6q/qfQNvhpeZbqWS6
         m6YjGKJ0sHRrBMb2qHfZdtQQS+5Ntf4GSzggJSjncvyzaQF+VRsZuEVo3JnAqQ1RSAqI
         HiceddVZFWKL+DL03PSA13GuaUBii4qc9qhGlIjo+ACzADJ8loCAA1gnpzDHKYNlOqKU
         e9sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OD4aiA7h6MlijuzsPBGwt+/c6jfgut3ElqXIr9TIDpo=;
        b=smU3zk/UQBg6UZ6nDbNdLYFcMQVWxFYistt8HfSPP7Ln8+u7vYM33aav9+sZmHpwk4
         aZgcFoOanZYR0RYdh9wkZDizTxOlb+nlAL0uWtQtp4SdT32jCS4X+LOoRttKRlC35okf
         dAWCSaT7AmLep5x5xJ8IMjdFCreMJYSUCauKyBVoTiSm5uDpxmVVbdowaxzs2FYUVaA7
         ITN0R79oKguw/ss5VdJ2G4JuREF9r0oKy0kcptI4jgMXjCgm2d1swVTjOcImWDEkVVqr
         kwpvYxmV6lzrL8VAOieeyZ30bA99RD1LyjMe+hgniLgWQjZ5MQIXThC1l968Guo1TS+5
         K5ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MuEPfxqF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a05600c154600b003f8f01f3a9esi1285748wmg.43.2023.06.23.05.46.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MuEPfxqF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qCgBP-0001si-Jy; Fri, 23 Jun 2023 08:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgBN-0001rd-13
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgBL-0000qp-Fc
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687524390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OD4aiA7h6MlijuzsPBGwt+/c6jfgut3ElqXIr9TIDpo=;
 b=MuEPfxqFryKqnYD6blHlRToKUsOE13gvCG6Jn31RJCuoE6sgR4HS2eZSmBN0wjsXNMKE93
 XbgEq9E6uPlt6DWViakQfbeus+o8lzyERxjf4A27dRPM+7vbm9BeVBqMWz2RUPPZF3oHgW
 0+B3u3Pwn45E/vCivfoUghUMbVw04Yk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-UB6ke3MAMoydfKRrV0EBHg-1; Fri, 23 Jun 2023 08:46:27 -0400
X-MC-Unique: UB6ke3MAMoydfKRrV0EBHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 538A01044590;
 Fri, 23 Jun 2023 12:46:26 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F6F21121314;
 Fri, 23 Jun 2023 12:46:22 +0000 (UTC)
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
Subject: [PATCH v4 07/10] hw/i386/acpi-build: Rely on machine->device_memory
 when building SRAT
Date: Fri, 23 Jun 2023 14:45:50 +0200
Message-Id: <20230623124553.400585-8-david@redhat.com>
In-Reply-To: <20230623124553.400585-1-david@redhat.com>
References: <20230623124553.400585-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 9Z/of3JlOZ5g

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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
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

