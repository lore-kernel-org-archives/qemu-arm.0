Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2108373ejb;
        Tue, 30 May 2023 04:40:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5VEgMKpZxtcfizzfM5ChuR7kbqr3YJWoQgWvkorYjMNKBMp4g1uEJiGhNpPxSXfn51hjPp
X-Received: by 2002:a05:6214:da9:b0:625:aa49:19f1 with SMTP id h9-20020a0562140da900b00625aa4919f1mr1791437qvh.62.1685446856489;
        Tue, 30 May 2023 04:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685446856; cv=none;
        d=google.com; s=arc-20160816;
        b=0HwkeHFx2zALbiaxAhAwFWwpw1Ih6zb7chuchMs6EfJzZAemOsRP5E241wQPJ/mxTS
         MU6igG4WKejJHxkSDDw5gOY7C89kMKmzeHvC7QbgviboIyvnu121SDSZN2xrpt7qHmWx
         WlxhsvudpDUv3Iax564MFpC+WRPdCPS+aJe3K+Ugz7ef46vO5Y6epmq9Nyu5CxcTW3Zm
         f61r1toRF/xN1jfm9dcQ+hmfV3onJJTdpMlIy2sP/nNUHD9c/fkbT5FGc2QH6l0kj9Zg
         tRdexota8edhPH7qEig81AJfzpc+RaFBNzQ9MZv0FcDnPI310QcvTd93r0TLW2G9//ss
         LVOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KkLnYI7ZC/XGHU4LuLPG/YHBgPd/PcXz1iS/ExnG6IM=;
        b=AMz9vrx15b9BO05C/yBfflgW8rKaeTq+OPvjMgA6DpkKoFYPRsTCtWYoQjdX3OXaGP
         reVAJPZzL7PgNbsTz1pU6R6aW+SGkD0IQNlMQ895Qz/4IcJXKrDAQpStzhZy+PRTILjc
         xnnCjG3USnFKuQxOlt4p57WH9ZGa1WiG7CbNxA8XMgssVjj0+mZvXvtpVVG700CcnwAi
         ha+L88V8jWHodKBRMcHpZzrT7sMuRiMQ1qdTfeNWw7N7DtzNwGOVlaEI19hG7XClpNzF
         XKyqwg78qZ0MmRKs7S5NHWfemY74SnjUiHbEZKsMLr8bL1q1Y65VH+u/NtBbr+0B1CCj
         OyXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zd6E20cN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17-20020ac85b11000000b003f52177eca5si6389850qtw.638.2023.05.30.04.40.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Zd6E20cN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3xhF-00083w-M1; Tue, 30 May 2023 07:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgy-0007uR-Vl
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xgx-00044e-I1
 for qemu-arm@nongnu.org; Tue, 30 May 2023 07:39:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KkLnYI7ZC/XGHU4LuLPG/YHBgPd/PcXz1iS/ExnG6IM=;
 b=Zd6E20cN95r594Gu+swBs87Kee1fyaGuWLKe34N2I3u59cfCvBY033mnAeerp0V5hMjdYM
 BAGVquODF+pm3vAQlNw88yVNYWgmE9O+hmTAKR69Ts084/cSYRNcHDlOHCc8al6pMjyI/e
 PgNTPjETFssOfvkHzx1KOqpSRORn3F0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-act1RaTXNdu0yx38jYus9Q-1; Tue, 30 May 2023 07:39:05 -0400
X-MC-Unique: act1RaTXNdu0yx38jYus9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9107685A5AA;
 Tue, 30 May 2023 11:39:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5E3D40CFD45;
 Tue, 30 May 2023 11:39:00 +0000 (UTC)
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
Subject: [PATCH 05/10] hw/loongarch/virt: Use memory_devices_init()
Date: Tue, 30 May 2023 13:38:33 +0200
Message-Id: <20230530113838.257755-6-david@redhat.com>
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
References: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: QHtzTDYckVLf

Let's use our new helper.

Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Cc: Song Gao <gaosong@loongson.cn>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/loongarch/virt.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index ceddec1b23..a6790714fe 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -45,7 +45,7 @@
 #include "sysemu/block-backend.h"
 #include "hw/block/flash.h"
 #include "qemu/error-report.h"
-
+#include "hw/mem/memory-device.h"
 
 static void virt_flash_create(LoongArchMachineState *lams)
 {
@@ -805,8 +805,8 @@ static void loongarch_init(MachineState *machine)
 
     /* initialize device memory address space */
     if (machine->ram_size < machine->maxram_size) {
-        machine->device_memory = g_malloc0(sizeof(*machine->device_memory));
         ram_addr_t device_mem_size = machine->maxram_size - machine->ram_size;
+        hwaddr device_mem_base;
 
         if (machine->ram_slots > ACPI_MAX_RAM_SLOTS) {
             error_report("unsupported amount of memory slots: %"PRIu64,
@@ -821,14 +821,8 @@ static void loongarch_init(MachineState *machine)
             exit(EXIT_FAILURE);
         }
         /* device memory base is the top of high memory address. */
-        machine->device_memory->base = 0x90000000 + highram_size;
-        machine->device_memory->base =
-            ROUND_UP(machine->device_memory->base, 1 * GiB);
-
-        memory_region_init(&machine->device_memory->mr, OBJECT(lams),
-                           "device-memory", device_mem_size);
-        memory_region_add_subregion(address_space_mem, machine->device_memory->base,
-                                    &machine->device_memory->mr);
+        device_mem_base = ROUND_UP(0x90000000 + highram_size, 1 * GiB);
+        memory_devices_init(machine, device_mem_base, device_mem_size);
     }
 
     /* Add isa io region */
-- 
2.40.1

