Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp368655ocb;
        Mon, 3 Oct 2022 17:34:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78i6d51OFwSkV/nYdJvL2TXGXGeiyGX6fCYiMSiVedY6MQn48h4ImgOyp9ADZz8pEV6KJQ
X-Received: by 2002:a0c:8d09:0:b0:4ac:6f1b:3a13 with SMTP id r9-20020a0c8d09000000b004ac6f1b3a13mr17880644qvb.98.1664843679641;
        Mon, 03 Oct 2022 17:34:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664843679; cv=none;
        d=google.com; s=arc-20160816;
        b=XCJjSiZIk/ytU1c8iPRhArAn2jXKKeEQ8TzmEy7JafsCt1xTkBaxVMhCR8z5n48yX1
         MSg3/WsySb8OWqVDIVb8+WdZd45gIZsePCCrIGnWAH8k9hOJK68xPB0ucgYfa/Ux1YQH
         UAhXc9PzorVW427eumM+crreXgGqinn1F2LQ0ZvWRdHxUBclJlRrqxoE869ZgNwSekoe
         7gtEMVqhCmQKfxA2LC28dqo5dEmXtpxP2ii1st6X9dPUjAnpQvmpgkcqrtstDgpsL523
         YOre2+X2AgN5iaY93/X3KocMlxeCtzdFyAiQBeszRTi8cTnY+sXua5qpXbLf4AokWc9e
         0wVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=g9OVHLht1sJiIpjMrBxyf/vibyZGmXv0kUqwcs4vbDo=;
        b=thlJYHH/M0ddB3CRSyLb1lfB+TBuf5YZ6ibrJJX8PJzPLX2JSr881qiwxaHXTroX6F
         2usi5WnsvHj+upPtUEDGhTGujOAhJa40s8zLHdVgXPKI/WnPYUiU7YmvmRhdY0y7/li7
         bg53bsVMb82VaYFj4O+OvNYRMSI0yfNHVjJ4kGBzTJbPbHIDghICEit4r07QWRPCMn9q
         wr3nkRXqZz6ALeyhfOmWF0ofx8C3uWkOuCcvJGRjCDOCXj9gcqPwo3vhzhPgrNj83UgS
         wGfTCOfLABftJHVxhoXcDa6Pg7CNa12g+VU3iwzZCjmMI3z5z1pCrbM14omybvbITIgc
         F2Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jow10nOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020ac865c6000000b0035ba5e37ae4si4042738qto.781.2022.10.03.17.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 17:34:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Jow10nOn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofVtP-0006SD-6S
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 20:34:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVlz-00086m-0t
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 20:26:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVlu-0004vA-Hj
 for qemu-arm@nongnu.org; Mon, 03 Oct 2022 20:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664843214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9OVHLht1sJiIpjMrBxyf/vibyZGmXv0kUqwcs4vbDo=;
 b=Jow10nOnbYBItKsLdRRuaekn63GZrDnZR/0RSw4OOrQYun++qXMiEf9WezvrYWzGpx76mu
 9eKH85u5P2y69Gio4ttaJitMxKD0+JgwC13pKcHu4C5eKXw70uO/bxkky2myZMLoELOPSk
 8f3N/9gtzzxPaEhPZAABuO49wKqto2E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-30PZtRZXNFeBV-MyObZVPw-1; Mon, 03 Oct 2022 20:26:50 -0400
X-MC-Unique: 30PZtRZXNFeBV-MyObZVPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FA3D29ABA2B;
 Tue,  4 Oct 2022 00:26:50 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5A8C40C206B;
 Tue,  4 Oct 2022 00:26:46 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v4 4/6] hw/arm/virt: Introduce virt_get_high_memmap_enabled()
 helper
Date: Tue,  4 Oct 2022 08:26:25 +0800
Message-Id: <20221004002627.59172-5-gshan@redhat.com>
In-Reply-To: <20221004002627.59172-1-gshan@redhat.com>
References: <20221004002627.59172-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J92NIFXW/WrP

This introduces virt_get_high_memmap_enabled() helper, which returns
the pointer to vms->highmem_{redists, ecam, mmio}. The pointer will
be used in the subsequent patches.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index b0b679d1f4..59de7b78b5 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1689,14 +1689,29 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
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
 
@@ -1714,18 +1729,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
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

