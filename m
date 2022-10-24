Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3089346ejn;
        Mon, 24 Oct 2022 00:04:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7p7Y/tmHLm4+xNqYKK+w8fYohzsfLNkT2ohGKcs3IXxrz7vgWuWhmH0EOtwFEDwPqhIU5s
X-Received: by 2002:a05:622a:56:b0:39c:de49:9ec9 with SMTP id y22-20020a05622a005600b0039cde499ec9mr27082430qtw.181.1666595050989;
        Mon, 24 Oct 2022 00:04:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666595050; cv=none;
        d=google.com; s=arc-20160816;
        b=Su8d1M380bCO0mJTkSqgzPNPE8LERdk1Fpx/ZZE5ZpXxPGuoSsn9URxpoQxtUPsXc9
         ocZoaO7UXj2MUnDGiFLC6ftcw8QsMCXFvJApsDnoSKc65sKtTkA2e+G9qZxng5fyU3or
         Gh90KeAB0yUrtIDJ10PZKXYljZCslZ+V5y4eqiulV0oNUSkf+tXUr5dlVjU9drOGCEYL
         RdHZWLZwMd8G4hiu2mceksAU5jBff5oGSsaFKFKQCg7/CFe12FHPvkKtID7tnxiPj6kr
         677tozH68nI/MSggAD3E8frtuOzjgZWuY6D3pytXUpnFlHibAPteA7dcbDsfG2TVl6LN
         jhTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WSq58Oi2QPxK1jylHq564L9qs0YFSerIVcHKNyN5Y4o=;
        b=sIp9/8eK/frE5rgzCP3M+IglSQF9vrz/Cv6bKyPpjVRq8wg4cNZq/hxFLcSWGmxqGV
         I8duUoGAlGRU76Hiv4VccuSssnMlkP8qQJItfDpV134Zcx2T62ayMeyyMjIl/dUuEuUl
         jhiszjZirQ0qW91ffH4Jt/dlotQd0RHNsawnkJ7ljjfE5jsLx3nJQeDfUsfhVDyGowBH
         8IWn5opWRDdzE3MDS2tnIAqEuuRRuD5lm5Rp9G3cfC64UboPUSnIkqkwVusb6UGZ/bjA
         B5+wPWi/0S6fAWP0kT9aZoZ1RGq2xZfKtBWNBas9wpM21fFUtv8VuPCnpHrXXo8ta5ig
         wC3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TEcOHrR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020ad4576d000000b004b865b74bc1si7165365qvx.112.2022.10.24.00.04.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Oct 2022 00:04:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TEcOHrR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omoY7-0008TV-4L; Sun, 23 Oct 2022 23:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoY4-0008R0-LF
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoY3-0000jT-53
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSq58Oi2QPxK1jylHq564L9qs0YFSerIVcHKNyN5Y4o=;
 b=TEcOHrR0oaj9Sz+EOIQIO/PY0xwcqjKA6bW1tPwD9j7sbAG8Uutkfg8JUAqEWYoTC2hiS8
 pTZ8xGIShY2vL7MOEa9SO7eKaxSGT43WUH1X78U43kxoelrLbtHFfBo+75dvToFWOaaSMq
 NcomWmYHCjYy+IesNF63ldMM1TV4zEk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-6Do9aOHbPumzEpKMJ4k5IQ-1; Sun, 23 Oct 2022 23:54:43 -0400
X-MC-Unique: 6Do9aOHbPumzEpKMJ4k5IQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D67E1C05AC2;
 Mon, 24 Oct 2022 03:54:42 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64AEC40C6F75;
 Mon, 24 Oct 2022 03:54:39 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 4/7] hw/arm/virt: Introduce virt_get_high_memmap_enabled()
 helper
Date: Mon, 24 Oct 2022 11:54:13 +0800
Message-Id: <20221024035416.34068-5-gshan@redhat.com>
In-Reply-To: <20221024035416.34068-1-gshan@redhat.com>
References: <20221024035416.34068-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oki12WvintvU

This introduces virt_get_high_memmap_enabled() helper, which returns
the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
be used in the subsequent patches.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0bf3cb7057..ee98a8a3b6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1689,14 +1689,31 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static inline bool *virt_get_high_memmap_enabled(VirtMachineState *vms,
+                                                 int index)
+{
+    bool *enabled_array[] = {
+        &vms->highmem_redists,
+        &vms->highmem_ecam,
+        &vms->highmem_mmio,
+    };
+
+    assert(ARRAY_SIZE(extended_memmap) - VIRT_LOWMEMMAP_LAST ==
+           ARRAY_SIZE(enabled_array));
+    assert(index - VIRT_LOWMEMMAP_LAST < ARRAY_SIZE(enabled_array));
+
+    return enabled_array[index - VIRT_LOWMEMMAP_LAST];
+}
+
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
     hwaddr region_base, region_size;
-    bool fits;
+    bool *region_enabled, fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        region_enabled = virt_get_high_memmap_enabled(vms, i);
         region_base = ROUND_UP(base, extended_memmap[i].size);
         region_size = extended_memmap[i].size;
 
@@ -1714,18 +1731,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             vms->highest_gpa = region_base + region_size - 1;
         }
 
-        switch (i) {
-        case VIRT_HIGH_GIC_REDIST2:
-            vms->highmem_redists &= fits;
-            break;
-        case VIRT_HIGH_PCIE_ECAM:
-            vms->highmem_ecam &= fits;
-            break;
-        case VIRT_HIGH_PCIE_MMIO:
-            vms->highmem_mmio &= fits;
-            break;
-        }
-
+        *region_enabled &= fits;
         base = region_base + region_size;
     }
 }
-- 
2.23.0

