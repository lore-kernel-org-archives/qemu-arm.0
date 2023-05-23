Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2081709ejb;
        Tue, 23 May 2023 11:52:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BQDQzcrnG5biZj5FTueUTNN+BFyDZ2TWFWUsIkeWICbC2+nJamWkBH3X2yBSs7lGsENOm
X-Received: by 2002:a05:620a:38c2:b0:75b:23a1:41f with SMTP id qq2-20020a05620a38c200b0075b23a1041fmr4879703qkn.53.1684867942616;
        Tue, 23 May 2023 11:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684867942; cv=none;
        d=google.com; s=arc-20160816;
        b=Jpxv9/fc4M5srv4wA0Un6RkzGW5a3A1JAwIwuUq6cd6+YpPKEumH4wcjBcqsbFCk6n
         okFosTP+0/vuXs2NqGM+1lcC89kUrrS4pr33ZstWkXzFsD1B8V0AhbITUgUu8aUvpvzl
         9iaaCRwAVIdplfGNYObvsaYRirwAWNrogoaSG+DTxfw75O+IaC7g9k2HhsKkHE6PeYT+
         xagqTw4B7wr9KoC6fYLR8qbnfJ0yHDgj8+0DTX3kkWtUvWwtItRrYwiBFiC8JxjbD999
         m2fKdvu/xsj6rQK+ALBBnXbrBS5Tz40os5nocqGFP2vZNLQyzryH99Cmz5BVUXgGwMXA
         ou6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jtf3t5gWtbo1UMsiBtlI3po1F4gSF64L6rEUf8Zg8FE=;
        b=le1RtqKDHSGUyrTqHmNMuAv1VuL+l4/2vyhaYoBUzB4UWM1i3jSASePcdMC4Q9yPgv
         CPDqHMiwRDz6D4x+qsugh7NFaFYdBGdT6ZU31xgENWT48xF2Eb2ebc1R/bJF7SkhH6Tx
         d4P+2WuVq7MZnF5ChE5+sSX10PymRnBw1Myvf0c2k3eO5fbiNi8lR4cFQDGKGBbgREFo
         ebHpVLZr3zbDKaWBzTCopzBwtxHPHIKNgbCtvgdelKPXPkUCTztnA2PLOgTYUzRi2wNg
         Zm7/NjsAU9HpWKC1/Eu8AAhbva0Tyrf+fv1gUPHJVcno0oCPPnZGB2oxCYsgFi3EMWow
         Cyxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cML+KVw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15-20020ae9f00f000000b007592f7bb31asi5088412qkg.275.2023.05.23.11.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cML+KVw6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1X7J-0007Z9-LL; Tue, 23 May 2023 14:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q1X7F-0007SI-M0
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:52:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q1X79-0000fk-Da
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:52:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684867926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jtf3t5gWtbo1UMsiBtlI3po1F4gSF64L6rEUf8Zg8FE=;
 b=cML+KVw6S26vlot+FxZP/0NuRIeUbeyEy6YfAeAdJLsj4QdAXQNEWAefT3Pw4E+HKm4XRs
 pRWojpFdkNaNSGEXEqefA3wu402gRnNC2sfINRCYxWoP3SODZfKVPc5cHIFIVLegmiVQ4O
 TssZ80L5kTMyzPrPYRQof6BuJcSU/Zk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-o9cyEnWjO_K-INe167Me5w-1; Tue, 23 May 2023 14:52:03 -0400
X-MC-Unique: o9cyEnWjO_K-INe167Me5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD22D1C07827;
 Tue, 23 May 2023 18:52:01 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 921D840CFD45;
 Tue, 23 May 2023 18:51:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Song Gao <gaosong@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v1 3/3] memory-device: Track used region size in
 DeviceMemoryState
Date: Tue, 23 May 2023 20:51:44 +0200
Message-Id: <20230523185144.533592-4-david@redhat.com>
In-Reply-To: <20230523185144.533592-1-david@redhat.com>
References: <20230523185144.533592-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: xUCBchxn9nU/

Let's avoid iterating over all devices and simply track it in the
DeviceMemoryState.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 22 +++-------------------
 include/hw/boards.h    |  2 ++
 2 files changed, 5 insertions(+), 19 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index d99ceb621a..675ceeff55 100644
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
@@ -297,6 +279,7 @@ void memory_device_plug(MemoryDeviceState *md, MachineState *ms)
     mr = mdc->get_memory_region(md, &error_abort);
     g_assert(ms->device_memory);
 
+    ms->device_memory->used_region_size += memory_region_size(mr);
     memory_region_add_subregion(&ms->device_memory->mr,
                                 addr - ms->device_memory->base, mr);
     trace_memory_device_plug(DEVICE(md)->id ? DEVICE(md)->id : "", addr);
@@ -315,6 +298,7 @@ void memory_device_unplug(MemoryDeviceState *md, MachineState *ms)
     g_assert(ms->device_memory);
 
     memory_region_del_subregion(&ms->device_memory->mr, mr);
+    ms->device_memory->used_region_size -= memory_region_size(mr);
     trace_memory_device_unplug(DEVICE(md)->id ? DEVICE(md)->id : "",
                                mdc->get_addr(md));
 }
diff --git a/include/hw/boards.h b/include/hw/boards.h
index a385010909..9d48c73edb 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -294,11 +294,13 @@ struct MachineClass {
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

