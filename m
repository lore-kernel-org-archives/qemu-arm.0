Received: by 2002:a17:906:6453:b0:98d:a79e:b696 with SMTP id l19csp124934ejn;
        Fri, 23 Jun 2023 05:48:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6TRJlyYqbCS6o9aHEZVHEl3cwJ2gDacVki7HsWRyiBCVjVdZ+UXUp37eoVl8m5QNhTPSOK
X-Received: by 2002:adf:e7d0:0:b0:30a:8e6a:3d77 with SMTP id e16-20020adfe7d0000000b0030a8e6a3d77mr20461427wrn.1.1687524491737;
        Fri, 23 Jun 2023 05:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687524491; cv=none;
        d=google.com; s=arc-20160816;
        b=LIPlen+42nggELhrq6vxdJr1GoP98+SfZbg93hagl5bWEKPuyTHvBqGEM49/zyY5hJ
         sItJku4NCbcCiIPftgCpZ1rQd/9kUDYjyHWdCSSLQ8wW3gdK/stxeH4TJzh/jeeUWsYP
         tN+WBArC8i+906Dtevds0rjGIKdG3u6ddmVzGYQ2uJ0eL1YZ/oaq5nR4fUYpgxREXZrS
         yhkRiS7ddRNV2CrQeeIlKrEaK95ikaem9k7uCR/4gYP+f0ZADDm43rt8/FatbiHRkoco
         wPWgfgpHb5RD+DFr6OVjiGoj9zSQikYOb1L7s0g7qYGQRkP/YXf6OykxRw3BuSLFgUxu
         9YNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EC4/yct8sIAw5ODpRfK2OCvTa9g83NRaxOMLluErnc8=;
        b=WykYFnVQ7ylxQHoGAdp9d+AiHxy18+m/UdsvOeZa8bAqXPK+zYjsz3k1JKCkch05fB
         WIBxlPxDV7ol0Cq53dyd5NGVYSk6r+ORRnqISAgavKgFzG23RSxBzuWz2duusd7ThoqZ
         rYY3YIce2p4InhAoyHlEgsQ1WWJDlN/XlO7wuUrTSDJ5yfDicW1yWqRcznvM2Hw/JEOZ
         Arc6iJMHDxBkxGxOksRoF7yi/n+CWm/SpC7TtDfRTuqEhdy4FXFmantMexoa386cP7By
         43V/+dd38efsXLpenmvobSCV7hePTXapm89KyHCDLwpPX8Jzic8oSdRCVkLZOKuJ2XXK
         YtDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W2jDDy1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y18-20020adfd092000000b0031140570336si5548657wrh.367.2023.06.23.05.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Jun 2023 05:48:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W2jDDy1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qCgBr-0002U7-Ub; Fri, 23 Jun 2023 08:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgBW-000221-MW
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qCgBT-0000sJ-9Z
 for qemu-devel@nongnu.org; Fri, 23 Jun 2023 08:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687524398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EC4/yct8sIAw5ODpRfK2OCvTa9g83NRaxOMLluErnc8=;
 b=W2jDDy1pcMsIjrqfpUXdJ0smAix7NwWrN82T5ztkgElq7WzU/g5HChYeJKmSFabuD9I44y
 l8lRGZn13M9ap8ZScqjX2ZdIrKdAMGNzZCuaxPoi8imVh2aAoo4oqnwdhBpRvXej2vlkVs
 iLMHBlgpSQMHjTFkA7YJOHCe/mZXTAg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-PYd8v78vOnmHtC99LKd82w-1; Fri, 23 Jun 2023 08:46:35 -0400
X-MC-Unique: PYd8v78vOnmHtC99LKd82w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32B7529AA3B6;
 Fri, 23 Jun 2023 12:46:34 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.32.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C55991121314;
 Fri, 23 Jun 2023 12:46:30 +0000 (UTC)
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
Subject: [PATCH v4 09/10] memory-device: Refactor memory_device_pre_plug()
Date: Fri, 23 Jun 2023 14:45:52 +0200
Message-Id: <20230623124553.400585-10-david@redhat.com>
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
X-TUID: LVVbk+ZUx4Pn

Let's move memory_device_check_addable() and basic checks out of
memory_device_get_free_addr() directly into memory_device_pre_plug().

Separating basic checks from address assignment is cleaner and
prepares for further changes.

As all memory device users now use memory_devices_init(), and that
function enforces that the size is 0, we can drop the check for an empty
region.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/mem/memory-device.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
index bb9d7c2a20..00c7755557 100644
--- a/hw/mem/memory-device.c
+++ b/hw/mem/memory-device.c
@@ -69,9 +69,10 @@ static int memory_device_used_region_size(Object *obj, void *opaque)
     return 0;
 }
 
-static void memory_device_check_addable(MachineState *ms, uint64_t size,
+static void memory_device_check_addable(MachineState *ms, MemoryRegion *mr,
                                         Error **errp)
 {
+    const uint64_t size = memory_region_size(mr);
     uint64_t used_region_size = 0;
 
     /* we will need a new memory slot for kvm and vhost */
@@ -101,16 +102,9 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
                                             uint64_t align, uint64_t size,
                                             Error **errp)
 {
-    Error *err = NULL;
     GSList *list = NULL, *item;
     Range as, new = range_empty;
 
-    if (!ms->device_memory || !memory_region_size(&ms->device_memory->mr)) {
-        error_setg(errp, "the configuration is not prepared for memory devices"
-                         " (e.g., for memory hotplug), consider specifying the"
-                         " maxmem option");
-        return 0;
-    }
     range_init_nofail(&as, ms->device_memory->base,
                       memory_region_size(&ms->device_memory->mr));
 
@@ -122,12 +116,6 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
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
@@ -251,11 +239,23 @@ void memory_device_pre_plug(MemoryDeviceState *md, MachineState *ms,
     uint64_t addr, align = 0;
     MemoryRegion *mr;
 
+    if (!ms->device_memory) {
+        error_setg(errp, "the configuration is not prepared for memory devices"
+                         " (e.g., for memory hotplug), consider specifying the"
+                         " maxmem option");
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

