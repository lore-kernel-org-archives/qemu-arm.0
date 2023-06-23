Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp124812ejn;
        Fri, 23 Jun 2023 05:47:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7oLMU4Pvhs8TWwqCupO8eFwZ5XqIf00p4u/Fkb7aETSKxP4O9JsyLVxmKh9BmvNzCleUGA
X-Received: by 2002:a05:600c:2903:b0:3fa:7fa9:4f9c with SMTP id i3-20020a05600c290300b003fa7fa94f9cmr334207wmd.28.1687524474762;
        Fri, 23 Jun 2023 05:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687524474; cv=none;
        d=google.com; s=arc-20160816;
        b=uewxBoOdGcyJK4nGINA0VA2doOYHddLg678MlyfKs/XM/kURBC/tjdtlTkLPJCaNfS
         hY4BicHJsnKevUv1td8QSZJosPQpVbie1z3qpvYdB+U7WY6bVj1AP/rZKUAO8BItVa0t
         wrEcJS37YVSXeosiNUW4ulsMmJabwPrj6NW1zrOVIN2myk/LBm3MvKzI8dV4qqMzbOxg
         Dk+T2dyXcEzv+uFT96GPK2Vy9cePzr/P7AGh8WoekwBqgNr/Lv1ZmPI/tVixPDZHjnZI
         +KD59ptBFV4fIQVdL9VmKEPpWIE1vR7WNRvwd6TTcCVtuNFBHQBbZke8jDUiT26jkhQV
         abeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IZwikLA6WEV50lQOcrHMyhhRsDNuPxp6wdeJAdkCAGE=;
        b=kUxYDnaq/KnWhbbu3YYsyVhLQwKlNop94a8qRAQ9g4SCC1e18BWQPjprj8XNQZoMvO
         gjHL0ClM9ia4RLGjrRwoqyUUQL6JdZeGPbAjT7lshn/VzTLPe9gNFhofGW0pmBXbtGjA
         ozt4K+qfMKN32DunJFo9J2aBQJUhQZVdiMUkGPSuZs2LHnYl+Y4uBUiLnrx+Fol6A5R5
         y+PoYN4V0M2fqWBX0OmCOMsk7LaE5zHhXhaN9fVw7vw4Q5lhpn2wNrSHf+0DUXVzbrPt
         6k9vczvi14xScHDkqdk8z06xDWW2pN/GF759sYI/Ws4db4MkyCu9rVMk2R134rtO7o4O
         epyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fYjXUY7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o1-20020a05600c4fc100b003f7a56536d9si1296631wmq.9.2023.06.23.05.47.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:47:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fYjXUY7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qCgB6-0001Z8-TZ; Fri, 23 Jun 2023 08:46:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgB5-0001Wa-Dl
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 08:46:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgB3-0000nP-Dq
 for qemu-arm@nongnu.org; Fri, 23 Jun 2023 08:46:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687524372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZwikLA6WEV50lQOcrHMyhhRsDNuPxp6wdeJAdkCAGE=;
 b=fYjXUY7h9CgRNk29Ad/niKfehdWuObyCsaAP1Q7XNePt1Ef7C/nfQoZfeRhLLBjlVkxkFf
 OcarHCy7nbGuhMuL2OgSQ3mmDPONpLJ9tynaNmgNED/g5YMxGBrn9Dif5DGYMP+gHQ9BrX
 fJodd7+80p0xKgrh3OCF6xox0j0274g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-u7VM_4f2OTqAdV1SiAd8SQ-1; Fri, 23 Jun 2023 08:46:08 -0400
X-MC-Unique: u7VM_4f2OTqAdV1SiAd8SQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDA021C041A7;
 Fri, 23 Jun 2023 12:46:06 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E979D1121314;
 Fri, 23 Jun 2023 12:46:02 +0000 (UTC)
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
Subject: [PATCH v4 02/10] memory-device: Introduce
 machine_memory_devices_init()
Date: Fri, 23 Jun 2023 14:45:45 +0200
Message-Id: <20230623124553.400585-3-david@redhat.com>
In-Reply-To: <20230623124553.400585-1-david@redhat.com>
References: <20230623124553.400585-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: YwfsB4PivrEK

Let's intrduce a new helper that we will use to replace existing memory
device setup code during machine initialization. We'll enforce that the
size has to be > 0.

Once all machines were converted, we'll only allocate ms->device_memory
if the size > 0.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 14 ++++++++++++++
 include/hw/boards.h    |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 49f86ec8a8..bb9d7c2a20 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -17,6 +17,7 @@
 #include "qemu/range.h"
 #include "hw/virtio/vhost.h"
 #include "sysemu/kvm.h"
+#include "exec/address-spaces.h"
 #include "trace.h"
 
 static gint memory_device_addr_sort(gconstpointer a, gconstpointer b)
@@ -328,6 +329,19 @@ uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
     return memory_region_size(mr);
 }
 
+void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size)
+{
+    g_assert(size);
+    g_assert(!ms->device_memory);
+    ms->device_memory = g_new0(DeviceMemoryState, 1);
+    ms->device_memory->base = base;
+
+    memory_region_init(&ms->device_memory->mr, OBJECT(ms), "device-memory",
+                       size);
+    memory_region_add_subregion(get_system_memory(), ms->device_memory->base,
+                                &ms->device_memory->mr);
+}
+
 static const TypeInfo memory_device_info = {
     .name          = TYPE_MEMORY_DEVICE,
     .parent        = TYPE_INTERFACE,
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a385010909..be06e8a41f 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -35,6 +35,8 @@ void machine_set_cpu_numa_node(MachineState *machine,
                                Error **errp);
 void machine_parse_smp_config(MachineState *ms,
                               const SMPConfiguration *config, Error **errp);
+void machine_memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
+
 
 /**
  * machine_class_allow_dynamic_sysbus_dev: Add type to list of valid devices
-- 
2.40.1

