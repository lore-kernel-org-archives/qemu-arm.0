Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp392101ejb;
        Thu, 1 Jun 2023 05:15:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6aySDUTYCI/6cdL0eYRyBsc7+z8EqrusmCuj/Wgk0tkKX0c+UZC88vZW7woDN6zzzEJdU/
X-Received: by 2002:a05:620a:984:b0:75b:23a0:e7c5 with SMTP id x4-20020a05620a098400b0075b23a0e7c5mr8594112qkx.38.1685621707857;
        Thu, 01 Jun 2023 05:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685621707; cv=none;
        d=google.com; s=arc-20160816;
        b=WVjT7IFZYK8Lz7EIce5taJxq4LeWKQi7uBLqq0ZqubXsHljy7lurGL6kI/tC8vJUXu
         5EOS0n90BzQtWcfN/UzZ9aRQPpipIgj+sDyMj+jM9MaI6Gtjsvv/dMQ9XYlYOUeQKEOH
         BfXMjboPv09VeMgzcJbIXUc2fY3mVk/UeUlihabJ06ydBRKICRNmDBo7YC/miZkhIN8K
         TWFpV9mE14sqWKI/9MuGH7zA2/Vkz2IHwuu7wc4a0fozPh5p/Kvez7f/pJlNr+MiiqZJ
         OmBI7DKMKEVzcBLFZb8qHFNtNvhoMUBXFX7jg6qvKTBeU1Z8+/VtMdKh+wVEwCxYNcXR
         fvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nGACEA2aET2msOqUDIABoGnBLI/7CCZG+nBmgrENL+k=;
        b=Vj5oJEoy5IYUUi7IIiYnePtQwR4BqhxziYNGne3ef2KuGSiW0OtjQfKyPRxiPKqQrv
         68YxN8JFQYRrxr0+VE6aRWAMvEJtztgThU+WTZmonr+xGIQqt1y3ZT/LT4Dxz+GmxE8a
         SVKDfTMYroDdxAXIO5x6Z6xzBYkWqbFMCz/BsVsLrRkWpefxO0sk+qSKEYJnEF3/dooo
         6v7jp8h3g+1TQ3RzjgdnkK/pIIktqxOlaKVjRroCBhclqnOHyNLCnTqU1aH4mVEMUH1p
         TausmusTQiIxDTK3x/9hkaKRYJXV4O/Gc45wjj5vIZM6aOTqNJHA9zlEp4KM5/aea2pY
         TS6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuZrFlmJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020a05620a130700b0075caf48f741si9303705qkj.512.2023.06.01.05.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 05:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NuZrFlmJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q4hCk-0000K4-Ko; Thu, 01 Jun 2023 08:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCi-00007X-9m
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 08:14:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCg-0006NF-7n
 for qemu-devel@nongnu.org; Thu, 01 Jun 2023 08:14:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685621692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nGACEA2aET2msOqUDIABoGnBLI/7CCZG+nBmgrENL+k=;
 b=NuZrFlmJQXfj0/Gpx6LXDmK6GCf15ZISP1QGDZQkF/hcaosELXsI+iYsD1jRimyhLPNdTW
 3YRBHUz9i+mvtlcUC8Nmfry/lpY2vFtYuRASWgJwCo3lkD45z9TFGZBFPRU3JgzIw5jm8g
 SkQM181dvH+QtkitmQnA2pktWkutMfc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-OL41OmOHPOyGwmlVhlVyPg-1; Thu, 01 Jun 2023 08:14:49 -0400
X-MC-Unique: OL41OmOHPOyGwmlVhlVyPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD875811E8D;
 Thu,  1 Jun 2023 12:14:48 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.8.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD8452166B25;
 Thu,  1 Jun 2023 12:14:47 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH] memory-device: Track used region size in DeviceMemoryState
Date: Thu,  1 Jun 2023 14:14:36 +0200
Message-Id: <20230601121447.272487-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: KAGh14Gy1vOk

Let's avoid iterating over all devices and simply track it in the
DeviceMemoryState.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 22 +++-------------------
 include/hw/boards.h    |  2 ++
 2 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 00c7755557..667d56bd29 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -52,28 +52,11 @@ static int memory_device_build_list(Object *obj, void *opaque)
     return 0;
 }
 
-static int memory_device_used_region_size(Object *obj, void *opaque)
-{
-    uint64_t *size = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_MEMORY_DEVICE)) {
-        const DeviceState *dev = DEVICE(obj);
-        const MemoryDeviceState *md = MEMORY_DEVICE(obj);
-
-        if (dev->realized) {
-            *size += memory_device_get_region_size(md, &error_abort);
-        }
-    }
-
-    object_child_foreach(obj, memory_device_used_region_size, opaque);
-    return 0;
-}
-
 static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
                                         Error **errp)
 {
+    const uint64_t used_region_size = ms->device_memory->used_region_size;
     const uint64_t size = memory_region_size(mr);
-    uint64_t used_region_size = 0;
 
     /* we will need a new memory slot for kvm and vhost */
     if (kvm_enabled() && !kvm_has_free_slot(ms)) {
@@ -86,7 +69,6 @@ static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
     }
 
     /* will we exceed the total amount of memory specified */
-    memory_device_used_region_size(OBJECT(ms), &used_region_size);
     if (used_region_size + size < used_region_size ||
         used_region_size + size > ms->maxram_size - ms->ram_size) {
         error_setg(errp, "not enough space, currently 0x%" PRIx64
@@ -292,6 +274,7 @@ void memory_device_plug(MemoryDeviceState *md, MachineState *ms)
     mr = mdc->get_memory_region(md, &error_abort);
     g_assert(ms->device_memory);
 
+    ms->device_memory->used_region_size += memory_region_size(mr);
     memory_region_add_subregion(&ms->device_memory->mr,
                                 addr - ms->device_memory->base, mr);
     trace_memory_device_plug(DEVICE(md)->id ? DEVICE(md)->id : "", addr);
@@ -310,6 +293,7 @@ void memory_device_unplug(MemoryDeviceState *md, MachineState *ms)
     g_assert(ms->device_memory);
 
     memory_region_del_subregion(&ms->device_memory->mr, mr);
+    ms->device_memory->used_region_size -= memory_region_size(mr);
     trace_memory_device_unplug(DEVICE(md)->id ? DEVICE(md)->id : "",
                                mdc->get_addr(md));
 }
diff --git a/include/hw/boards.h b/include/hw/boards.h
index be06e8a41f..fcaf40b9da 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -296,11 +296,13 @@ struct MachineClass {
  * address space for memory devices starts
  * @mr: address space container for memory devices
  * @dimm_size: the sum of plugged DIMMs' sizes
+ * @used_region_size: the part of @mr already used by memory devices
  */
 typedef struct DeviceMemoryState {
     hwaddr base;
     MemoryRegion mr;
     uint64_t dimm_size;
+    uint64_t used_region_size;
 } DeviceMemoryState;
 
 /**
-- 
2.40.1

