Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2785475ejn;
        Tue, 11 Oct 2022 16:22:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6jX4DGwZo8vc7v0bBJtxPS0o4waykRKCBIv45KBYP+ouMxxnDOQG9mQ+VFCqcovSa6OLx2
X-Received: by 2002:a37:aa43:0:b0:6eb:f80:ec46 with SMTP id t64-20020a37aa43000000b006eb0f80ec46mr13606901qke.106.1665530542633;
        Tue, 11 Oct 2022 16:22:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665530542; cv=none;
        d=google.com; s=arc-20160816;
        b=cz1+FFeArPv8cuZnVSEIXmX9JeqDQruYDcNhHlhN8n1pn8DVA+VJGTTIw+VIL9oD73
         fMPdpxjzenjXqSsF1AhN9VSOHkxLEgaQdHeVsRPUA9asSAUn2RXE4O08tdwATVDfxCgR
         +yf4+Um4Ec7KoHjN5dYJkUctnER78BMmmDjX2plkLHz1ljVZSGgrOTCjTFEhEIYZ+Wfq
         D+dB+SplvJYfXrcazRo9WZKVKb5d951Oq0Jsa8+d/qh69UhJDTbJrDs0a1gpJIdjbu//
         1VS92tHRmX72prYW54s+IkEFAAW9xfxdmg6tSFh0FGJ/Muvtx/WVyDp5F0qKdtkD18c+
         YzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AxK+GaPh99ZdRHLMBXzRZHgMj6Uw8BF0L6YSYsoc8Wg=;
        b=Atd7R43HWGQDyPIFTw5I6mXETib7zDMQ+aIas065+mhrzYdOq8Y+uawnMx2SdE35aY
         muLY9xG6qIeEVbz5WGxW8jQyQ5SvTcfNVr9dbwHj6B3OCc5gdH9I1kMjB1PttMSxkFB2
         o0AsFR5aGjHL0o0SZB+CUuQ4g3MPMKcIR1vfhKgsnF/xlp/gWcrZKI2Mwka3JN1ZJqW7
         0HHSC6nypbkrAC+64iYxnN0xTHmc9zRnWS407MfXLPFqiZsYH2k1RObubhfEhCXv0BMb
         MxJ7KwVHtmdzyqYbB1xiQk5tn81htJ1YhtZDwL/1L7lNiNCHQiZq0wVBzf9BdZLPXMaP
         05gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QTFBd/tj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71-20020a37034a000000b006ea81e7b8c1si6027028qkd.134.2022.10.11.16.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 16:22:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QTFBd/tj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiOZq-0002wS-0q
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 19:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWw-00057B-Kz
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWv-0006RD-66
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665530360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxK+GaPh99ZdRHLMBXzRZHgMj6Uw8BF0L6YSYsoc8Wg=;
 b=QTFBd/tjqh5Jazmvg9kh6/ghmm6XGUBW1oGtZkJTjMtbN/qdusS61KHOE30Ftk2waii9gN
 rnE8oLvnDuyO8VkeFv6RTaQddxs8w/0K4411b6umUwvDrMigBWOeogDLgTxNvD1k/NvDkH
 jE9ab9gGf+iUEk5Zr+euGHFb7wCpTF4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-QDwU747rMBOfs_ov6QJAlg-1; Tue, 11 Oct 2022 19:19:15 -0400
X-MC-Unique: QDwU747rMBOfs_ov6QJAlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16A21811E75;
 Tue, 11 Oct 2022 23:19:15 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-52.bne.redhat.com [10.64.54.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5E722166B2F;
 Tue, 11 Oct 2022 23:19:11 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v5 4/6] hw/arm/virt: Introduce virt_get_high_memmap_enabled()
 helper
Date: Wed, 12 Oct 2022 07:18:30 +0800
Message-Id: <20221011231832.149839-5-gshan@redhat.com>
In-Reply-To: <20221011231832.149839-1-gshan@redhat.com>
References: <20221011231832.149839-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EjoF8kZPqQ5a

This introduces virt_get_high_memmap_enabled() helper, which returns
the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
be used in the subsequent patches.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
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

