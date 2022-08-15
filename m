Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1017256ejf;
        Sun, 14 Aug 2022 23:38:04 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5fzygNY/pERpoTmjY2V2v+cZ4a4XsNy1WNEbeWPFemhtiPN8xm2CUXbRQHTYG62eYel3jN
X-Received: by 2002:ad4:4ead:0:b0:474:7bba:9865 with SMTP id ed13-20020ad44ead000000b004747bba9865mr12557282qvb.58.1660545484763;
        Sun, 14 Aug 2022 23:38:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660545484; cv=none;
        d=google.com; s=arc-20160816;
        b=pSrahUJnPP9fehrIH+OrTKcRjNzUkF1+/gFX1u4r1dx3CadKbgqQl1Y4vTNcp7Pm6a
         Zfn8E2d+rbXtKxdQr6SWlOQDWdC7GOpvXnFbvNj1qWikdpU0UN8cue4dQA8drP8iJb2A
         ELVm1zT1gtPCzy2mVxbco6WKOxykq8ECzKwOujJBltv4bLJ/k6vQa5XPt6gl0QDnvc45
         iHzo0OAxmqeSudnGH0xxjUJhx9F070ZrzLG6Y/1iZ1UMUcf04fnLF6Y6GAsephOAH07S
         6+RQrQUvczq0sVERQUi+pgUkDU1HIT0kwaMY7TlzvjkLRqXP4KBo7O2O2YHLFVAR0EKK
         aqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fupoNO9d7yEzRDLBgNdo/VxjibkhgoJnLFJLPpOJnw4=;
        b=lw0YghabC9dt0/gy2qDl9okCpz84QW7n9LlepDElh2YgNuVWMBUgouHYR3qX7b+FJx
         jFD1obOhNN5dyc7WqIdNyEzCGEgo6XXaXOwQkNtHdOKOwrpdQsP+o0EgG8FaeysuZtAQ
         kNyD/6tEzT3LpehH5g8y1za6hNVwBlvHRu38ItykCLs4El8hrexKloq4zdIVLfjGxyQx
         TAOeyqQuL7OTMpJfRIjr1JKCf5m6Y9SqRkw2jN8XR9edLc4n3uuaalk4PFJDMoXENUcE
         hkXX4/7VpsW8o2MMqXk75ITH7W8TJcJh7lt6Lgu9qJGvf+ccLTlMHvRxd7AIr9aJCi/J
         ufCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WVWikrxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9-20020a05620a450900b006b9be8a2820si5148802qkp.654.2022.08.14.23.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Aug 2022 23:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WVWikrxr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNTjg-0002rg-9Y
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 02:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcc-0000tx-PU
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcX-0000U5-OK
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660545034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fupoNO9d7yEzRDLBgNdo/VxjibkhgoJnLFJLPpOJnw4=;
 b=WVWikrxrk6vIeUtdtFIIMNIJVnBkD1H7e0ep0TYS6J0R7N9HFvWXVIw3VVKKHRvbrNur2w
 St1bL3au8n8Ek7JmPhZdxb2xPcXw5oozGMSEg+kbDeC1QwP3kpgU0S++jMCI6SdRZV0bdf
 Foljk9uSzFD9vXuVG/AHn2iez9UKlV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-UfjwJR72Ose0doB9_tAhsg-1; Mon, 15 Aug 2022 02:30:32 -0400
X-MC-Unique: UfjwJR72Ose0doB9_tAhsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6F61185A7BA;
 Mon, 15 Aug 2022 06:30:31 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 780282026D64;
 Mon, 15 Aug 2022 06:30:28 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v2 3/4] hw/arm/virt: Improve address assignment for high
 memory regions
Date: Mon, 15 Aug 2022 14:29:57 +0800
Message-Id: <20220815062958.100366-4-gshan@redhat.com>
In-Reply-To: <20220815062958.100366-1-gshan@redhat.com>
References: <20220815062958.100366-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WNv7OPOEk55/

There are three high memory regions, which are VIRT_HIGH_REDIST2,
VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
are floating on highest RAM address. However, they can be disabled
in several cases.

(1) One specific high memory region is disabled by developer by
    toggling vms->highmem_{redists, ecam, mmio}.

(2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
    'virt-2.12' or ealier than it.

(3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
    on 32-bits system.

(4) One specific high memory region is disabled when it breaks the
    PA space limit.

The current implementation of virt_set_memmap() isn't comprehensive
because the space for one specific high memory region is always
reserved from the PA space for case (1), (2) and (3). In the code,
'base' and 'vms->highest_gpa' are always increased for those three
cases. It's unnecessary since the assigned space of the disabled
high memory region won't be used afterwards.

This improves the address assignment for those three high memory
region by skipping the address assignment for one specific high
memory region if it has been disabled in case (1), (2) and (3).

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 582a8960fc..e38b6919c9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1746,10 +1746,26 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
         hwaddr region_base = ROUND_UP(base, extended_memmap[i].size);
         hwaddr region_size = extended_memmap[i].size;
-        bool fits;
+        bool *region_enabled, fits;
 
-        vms->memmap[i].base = region_base;
-        vms->memmap[i].size = region_size;
+        switch (i) {
+        case VIRT_HIGH_GIC_REDIST2:
+            region_enabled = &vms->highmem_redists;
+            break;
+        case VIRT_HIGH_PCIE_ECAM:
+            region_enabled = &vms->highmem_ecam;
+            break;
+        case VIRT_HIGH_PCIE_MMIO:
+            region_enabled = &vms->highmem_mmio;
+            break;
+        default:
+            region_enabled = NULL;
+        }
+
+        /* Skip unknwon or disabled regions */
+        if (!region_enabled || !*region_enabled) {
+            continue;
+        }
 
         /*
          * Check each device to see if they fit in the PA space,
@@ -1759,22 +1775,14 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
          */
         fits = (region_base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = region_base + region_size - 1;
-        }
+            vms->memmap[i].base = region_base;
+            vms->memmap[i].size = region_size;
 
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
+            base = region_base + region_size;
+            vms->highest_gpa = region_base + region_size - 1;
+        } else {
+            *region_enabled = false;
         }
-
-        base = region_base + region_size;
     }
 
     if (device_memory_size > 0) {
-- 
2.23.0

