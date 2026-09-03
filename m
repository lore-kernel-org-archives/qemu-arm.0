Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578DBC61DD3
	for <qemu-arm@archiver.kernel.org>; Thu,  3 Sep 2026 19:38:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x2DEk-0001SF-SK; Thu, 03 Sep 2026 15:36:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEj-0001RT-D0
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:37 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1x2DEh-0004Co-OD
 for qemu-arm@nongnu.org; Thu, 03 Sep 2026 15:36:37 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-38759bcd877so188955a91.2
 for <qemu-arm@nongnu.org>; Thu, 03 Sep 2026 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788464193; x=1789068993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=v/EbG9/3Hb8DCKZa1jZljaYOgVIsiNG77AyoF+zPvP4=;
 b=Q5rGxrm/iSYC7Q/wCwREU5hUej3GZoq/716ZXpHWYR12rxBvCEG859T5JPpqIcUP0E
 gxUtXZUcrLroVmSfuOIUrvKXjMbj2Tgk5X0md1snUeFm1lx8csym0hsC0Ge2JSMKuu+A
 dzHOdIkZrWAuDlaFYdU3Wq7LWh/3B6itp9zPBHBIFqFo+CGvcMJ5xXPoorp39uXgGzC2
 3EDwE8cgn02zoAvzJZ7j2nL8VZc/IzPnRn/v4gbQNUNuedxkxW7PYRxdMFXEFZUxqNyc
 oJHANDHYsUGSiQar2aJca4u4CBsr/M2Ar/hbG6URNGd991VEODRhjm1giiZCkhGakH9l
 3aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788464193; x=1789068993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=v/EbG9/3Hb8DCKZa1jZljaYOgVIsiNG77AyoF+zPvP4=;
 b=HiHKBfXdGeTk3xyXGtnen4Vrd9RJqnBBl9RaugSvqZ5e3n8whIt2/NOTw/fR82A9kI
 CydGWxGSb9hgBUmxg3GFEvptU21fdZDLt0lNM1I7LKjui1KXLq8mOs1yfdLodbGG7+gz
 YAQaqdLkOTihdqlyK+fzbToB1s8pAGsRXzBauCmlc3Wb7SJ1NL4MuCwhP52pybTXn/eg
 fB0L4qWuO9U+sz9/KmJlAoy2+dBuHG70nOUBLEzl/0QX2XpDESN1E/SP4unR9fWv/xi2
 4GVGvwC8b66GI0u/dgklgYw3BiYKCqlUSF0+waM8DQY8gqTem2/IuAH1n8GxNncBRA1x
 ogHQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzn994Y4L2ZTxHKIpsaPOejggW1OQwISlKybDOTryTdIlJIg8YepeBH9ueO5l0IRJxEemy5P1IcmA==@nongnu.org
X-Gm-Message-State: AFuF++nFwzIxW9KrGvmF/W/Z1LWm6xEozQXlAfjIxBPO7iJH/uchoKzU
 B91YU0Ks6VevsqxlfgoArE+G5kIX6WP9UXODOYAs7HV8mwgZbmaAsP2ZttZlBo1y6Lk=
X-Gm-Gg: AYBFou2yhZpCtT9d9lrMSHub11LBi9q+IGrF+fcskSgGlh44yfffHZbLA/tl+FXQNo9
 qkOjXH+rEPkP4kxtYreD5f8m0t4SepKzBSXC789kGMYpkin2IKZ5DJjtqqTo/ANUMQL5wPuq8pY
 ArgxmRbF9fteElaXyEpTP7NOFxFbezA27I7aUflwzhsJGwOnAt2/76fu1+KnQwncmm6oGf+fPqj
 PfZpHEzmWqCTBl1D41gw3iSXtT8yJKanSn1szGfTuEIlS3YvSyOt4ln1nF0UDNhE/f/axP5N2gi
 J2mUBKl6A/VXpd14b+KXgfrdaRJPNLZQNa0J56wkTe5hO/G1KfiTKqnYDxqZ9EMn2zATre5MXd1
 WC2t/6p9/6u/MgUFPqk51Qv9CaYqQS73TTlDymd3Gqu4zZz9WulG3HfSrRnIVYtzW+rzklGfKwt
 /f/SOLE5INtuMB+7yxGXsHWgUbw4JxJHV+ZLhB4zlnTUNJHPF/O8usSxgx3DIuIbDeS1OikFvu1
 biInkItJCaPJqY=
X-Received: by 2002:a17:90b:3810:b0:398:9beb:5c18 with SMTP id
 98e67ed59e1d1-39b26213a86mr1124061a91.19.1788464193150; 
 Thu, 03 Sep 2026 12:36:33 -0700 (PDT)
Received: from p14s.cg.shawcable.net
 ([2604:3d09:148c:c800:40c0:ec33:6266:c275])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39b083e4fafsm6836951a91.1.2026.09.03.12.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 12:36:32 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: berrange@redhat.com, kchamart@redhat.com,
 pierrick.bouvier@oss.qualcomm.com, peter.maydell@linaro.org,
 mst@redhat.com, cohuck@redhat.com, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, lorenzo.pieralisi@linaro.org, gshan@redhat.com,
 enju.kohei@fujitsu.com
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org,
 mathieu.poirier@linaro.org
Subject: [RFC v4 11/24] target/arm/kvm-rme: Populate Realm with runtime images
Date: Thu,  3 Sep 2026 13:35:58 -0600
Message-ID: <20260903193611.1058589-12-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
References: <20260903193611.1058589-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Once the Realm descriptor has been created, tell KVM to transfer runtime
images (kernel, DT, and rootfs) from guest memory to Realm memory.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 target/arm/kvm-rme.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
index 9985f5daba89..c082a5d8f3d1 100644
--- a/target/arm/kvm-rme.c
+++ b/target/arm/kvm-rme.c
@@ -15,6 +15,7 @@
 #include "migration/blocker.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "qemu/memalign.h"
 #include "qom/object_interfaces.h"
 #include "system/confidential-guest-support.h"
 #include "system/kvm.h"
@@ -43,12 +44,87 @@ OBJECT_DEFINE_SIMPLE_TYPE_WITH_INTERFACES(RmeGuest, rme_guest, RME_GUEST,
 
 static RmeGuest *rme_guest;
 
+static int rme_populate_range(const RmeRamRegion *region, bool measure,
+                              Error **errp)
+{
+    int ret;
+    void *buffer;
+    hwaddr size = region->size;
+    hwaddr base = region->base;
+    hwaddr start = QEMU_ALIGN_DOWN(base, RME_PAGE_SIZE);
+    hwaddr end = QEMU_ALIGN_UP(base + size, RME_PAGE_SIZE);
+    struct kvm_arm_rmi_populate populate_args;
+    size_t aligned_size = ROUND_UP(region->size, qemu_real_host_page_size());
+
+    if (!region->data) {
+        return -ENODEV;
+    }
+
+    ret = kvm_set_memory_attributes_private(start, end - start);
+    if (ret) {
+        error_report("RME: failed to configure initial"
+                     "private guest memory");
+        return ret;
+    }
+
+    /* Allocate page-aligned memory */
+    buffer = qemu_memalign(qemu_real_host_page_size(), aligned_size);
+
+    if (!buffer) {
+        return -ENOMEM;
+    }
+
+    memset(buffer, 0, aligned_size);
+    memcpy(buffer, region->data, region->size);
+
+    populate_args = (struct kvm_arm_rmi_populate) {
+        .base = start,
+        .size = end - start,
+        .source_uaddr = (uintptr_t)buffer,
+        .flags = measure ? KVM_ARM_RMI_POPULATE_FLAGS_MEASURE : 0,
+    };
+
+    while (populate_args.size > 0) {
+        ret = kvm_vm_ioctl(kvm_state, KVM_ARM_RMI_POPULATE, &populate_args, 0);
+        if (ret) {
+            error_setg_errno(errp, -ret,
+                "failed to populate realm [0x%"HWADDR_PRIx", 0x%"HWADDR_PRIx")",
+                start, end);
+            break;
+        }
+    }
+
+    qemu_vfree(buffer);
+
+    return ret;
+}
+
+static void rme_populate_ram_region(gpointer data, gpointer err)
+{
+    Error **errp = err;
+    const RmeRamRegion *region = data;
+
+    if (*errp) {
+        return;
+    }
+
+    rme_populate_range(region, /* measure */ true, errp);
+}
+
 static void rme_vm_state_change(void *opaque, bool running, RunState state)
 {
+    Error *errp = NULL;
+
     if (!running) {
         return;
     }
 
+    g_slist_foreach(rme_guest->ram_regions, rme_populate_ram_region, &errp);
+    g_slist_free_full(g_steal_pointer(&rme_guest->ram_regions), g_free);
+    if (errp) {
+        return;
+    }
+
     kvm_mark_guest_state_protected();
 }
 
-- 
2.43.0


