Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2082075ejb;
        Tue, 23 May 2023 11:53:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4K5ROohL62G7/y1XmdEElqsq1RP2Bcx7piIvIpmGI0bbkXz5zkubRqLRfVdxgqALXdk36B
X-Received: by 2002:a05:622a:1649:b0:3f4:ed2c:10a3 with SMTP id y9-20020a05622a164900b003f4ed2c10a3mr22896755qtj.38.1684867992926;
        Tue, 23 May 2023 11:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684867992; cv=none;
        d=google.com; s=arc-20160816;
        b=a36Stkupovxg3Y3TPz2/44k8bPXJSZn4nJlBxhfknAFDx1oaYQIuk3gu3aU/DaN1sH
         gvziLSi94BAFVzFGxUz8SqALbiAsj/szEXVb0EhS6USfb17B4XrsvJ6YuvLpzKvunZEo
         TJ7PVrmeklSKrkhyOJieA/RoBLuWoKzRJRebicXpmgri/S0TXJ6DUJQVwtE0zKww5Ww6
         MbUmkwhSG8PuKlylw02bHX+DGog9eMTDcIwPjRgkc9CfA5t0BLFi/E2IZeUnveIpcuLn
         pEI9Fw3M/MBbfS36Gn5AJuJsCxRZvNQ9q0a0RtNDZgeY/m/f3yhVB3U7qK+zENebQOZ9
         JNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=2cRfgMgmo16t8N/GUHnwSkZs9pSLVamwaBvt1cmft3w=;
        b=Hue4gPWRQgr4+DaktFRab8bA2NrHbRmG/yDDTheoJkIwyYrSq8Uvk/tn8FUPC0qyIx
         53fH/DJUHbUsfV1lwYIbGHO5epBLwEU0TtMHgfK/0z052RKaiARWGGtWm3QRs3zHpzfS
         KsxJ3taRWHUAz8AQWFOtGQ4l0HkF4yfdNxIPSrDuLtFugg3ElmEcCZ9a5zdtxVrOzBaD
         BBqaloPqlGbBbd1NSNYpdVrTGDmVSF5BYb30QDDP1Z+R5HMHiMuYv61kBde8WKwYQTbr
         u79s1jpgK4OU7hBrGCL/9OoWeLSbOVw+H4LFB3rL1hUMsatL1kNPv146FayP6d45+IMt
         OCnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F4cIkO/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020ac85dcb000000b003e64c9f2d21si5622834qtx.239.2023.05.23.11.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 11:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="F4cIkO/e";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1X76-0007IG-UH; Tue, 23 May 2023 14:52:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q1X75-0007Hb-RX
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:52:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q1X72-0000d8-V9
 for qemu-arm@nongnu.org; Tue, 23 May 2023 14:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684867920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cRfgMgmo16t8N/GUHnwSkZs9pSLVamwaBvt1cmft3w=;
 b=F4cIkO/eV2Sm8wwgmD8ri8OvslESgNZIa8a3MV9qAmovqHCgDerpLSj4qCful0SY/NDBjE
 ejo0bKb/KH5uMhRJWcmxzYvPne8uVWuZcmcwLl9087v/4pfKVRsebrdsK++qKgvX41Wez5
 J1W/2Z0lxCzZFzKL3gfwkCoU7BoC4OU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-lfi196cxPQOFU29eavavVw-1; Tue, 23 May 2023 14:51:55 -0400
X-MC-Unique: lfi196cxPQOFU29eavavVw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85CF12932484;
 Tue, 23 May 2023 18:51:54 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.194.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6472040CFD45;
 Tue, 23 May 2023 18:51:50 +0000 (UTC)
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
Subject: [PATCH v1 1/3] memory-device: Refactor memory_device_pre_plug()
Date: Tue, 23 May 2023 20:51:42 +0200
Message-Id: <20230523185144.533592-2-david@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: DTOtQcttpyXh

Let's move memory_device_check_addable() and basic checks out of
memory_device_get_free_addr() directly into memory_device_pre_plug().

Separating basic checks from address assignment is cleaner and
prepares for further changes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index 1636db9679..6c025b02c1 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -68,9 +68,10 @@ static int memory_device_used_region_size(Object *obj, void *opaque)
     return 0;
 }
 
-static void memory_device_check_addable(MachineState *ms, uint64_t size,
+static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
                                         Error **errp)
 {
+    const uint64_t size = memory_region_size(mr);
     uint64_t used_region_size = 0;
 
     /* we will need a new memory slot for kvm and vhost */
@@ -100,21 +101,9 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
                                             uint64_t align, uint64_t size,
                                             Error **errp)
 {
-    Error *err = NULL;
     GSList *list = NULL, *item;
     Range as, new = range_empty;
 
-    if (!ms->device_memory) {
-        error_setg(errp, "memory devices (e.g. for memory hotplug) are not "
-                         "supported by the machine");
-        return 0;
-    }
-
-    if (!memory_region_size(&ms->device_memory->mr)) {
-        error_setg(errp, "memory devices (e.g. for memory hotplug) are not "
-                         "enabled, please specify the maxmem option");
-        return 0;
-    }
     range_init_nofail(&as, ms->device_memory->base,
                       memory_region_size(&ms->device_memory->mr));
 
@@ -126,12 +115,6 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
                     align);
     }
 
-    memory_device_check_addable(ms, size, &err);
-    if (err) {
-        error_propagate(errp, err);
-        return 0;
-    }
-
     if (hint && !QEMU_IS_ALIGNED(*hint, align)) {
         error_setg(errp, "address must be aligned to 0x%" PRIx64 " bytes",
                    align);
@@ -255,11 +238,28 @@ void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
     uint64_t addr, align = 0;
     MemoryRegion *mr;
 
+    if (!ms->device_memory) {
+        error_setg(errp, "memory devices (e.g. for memory hotplug) are not "
+                         "supported by the machine");
+        return;
+    }
+
+    if (!memory_region_size(&ms->device_memory->mr)) {
+        error_setg(errp, "memory devices (e.g. for memory hotplug) are not "
+                         "enabled, please specify the maxmem option");
+        return;
+    }
+
     mr = mdc->get_memory_region(md, &local_err);
     if (local_err) {
         goto out;
     }
 
+    memory_device_check_addable(ms, mr, &local_err);
+    if (local_err) {
+        goto out;
+    }
+
     if (legacy_align) {
         align = *legacy_align;
     } else {
-- 
2.40.1

