Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2755632ejy;
        Wed, 21 Sep 2022 16:14:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6nZNLXjHKxCJxMbiSYVn/am2DBJpp3KG3byFtWG7NkP/noSTCg/AUkWSUroupq924m8VFB
X-Received: by 2002:a05:6214:2249:b0:4ad:776f:1237 with SMTP id c9-20020a056214224900b004ad776f1237mr375969qvc.124.1663802073300;
        Wed, 21 Sep 2022 16:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663802073; cv=none;
        d=google.com; s=arc-20160816;
        b=C/Dmo5TRt9kTA5coiuE8h6ew2ak0zZbjP4yG4qqz8s3+0O/QKdEBnECNNBUIW1PQXd
         9kWn+Vm8om3Jpg1zfkMHHhhXYJYO67k/uKL1AcJwyLb14q+TRx9RIDTsg020k3qAoLi2
         kofMJ8v0XxJOXqJY7hNyjr8yXuIE5YPmomsTNss1FvBGID+oVUPKEaly/ZIuuFUminXq
         Yjtjft17MLfKpSIZK7RjRcRblH6BWLAJXJnPnE4A5lgfJtC+GjxRSYEnlw/gtPuxcivc
         1hhOkC2fmVfK5NpOJR0KcPCNx9qNHdeJTBsf04MX06YWsBAyg5kZTXHm0ZVBuOJS19Lu
         pbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pvn+Cli8mJFxs6YFz0HeEDFEOPc8W6c2cloU0829xpg=;
        b=FDmLsxjq4m96ekuZ1d10Rth9vA4ja7FtyLmvXI6lDT4K1RKECbiZc2uBtmCK4LQyvR
         J1mvI+fcRgt3YgvqtOeMx4uDJF++iAQgtKzxyUYscU/dShsxf2h0918XJrTFfdrXr9x3
         wZSEwR/5uyTDGuuIUqB3VXN3Fuwvbu6PXekjwVrj8CC2tvvRo/Ix3V7emcWXRk6S3+Lv
         ACFUZfn2TreQMh8ZlJv1EZ4gjRJ9sZq9Q9rHLIdRJyHim+1QSehx+BZGsvEH74/r0YWf
         w7VHs/GEfGRORRy3adHI9Nshta+cqKDc10vTFm9g3Uq6z5KxmsU30FsMxT0/N8rM+Qde
         h2SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dmi1bCww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 24-20020ac85618000000b0035bada63cefsi2133238qtr.368.2022.09.21.16.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 16:14:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dmi1bCww;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ob8vI-0008M7-RB
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 19:14:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8us-0008Ke-BA
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8uq-0001qv-ND
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663802043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pvn+Cli8mJFxs6YFz0HeEDFEOPc8W6c2cloU0829xpg=;
 b=Dmi1bCww8z6YrYCLZqiSX1F560TI73NC8gETND0ZoQ7SNyfWMlQaItPkDLQ25cZfaCmOMq
 IHlpzP5M199jWHFPzXmgSHANB7yZ6yMea1B/6TVYBeP5vG0e4jpdFmy2TWmVc8V+kgnDx6
 2F5KkvqOU01NZPaWHIqbk0ju4+VqWwQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-404-MQ7MXKm4OMGSgZIiV4mT5w-1; Wed, 21 Sep 2022 19:14:00 -0400
X-MC-Unique: MQ7MXKm4OMGSgZIiV4mT5w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 014A03C0D194;
 Wed, 21 Sep 2022 23:14:00 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D02C2166B26;
 Wed, 21 Sep 2022 23:13:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v3 1/5] hw/arm/virt: Introduce virt_set_high_memmap() helper
Date: Thu, 22 Sep 2022 07:13:45 +0800
Message-Id: <20220921231349.274049-2-gshan@redhat.com>
In-Reply-To: <20220921231349.274049-1-gshan@redhat.com>
References: <20220921231349.274049-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-TUID: rv6RKTZSTZjW

This introduces virt_set_high_memmap() helper. The logic of high
memory region address assignment is moved to the helper. The intention
is to make the subsequent optimization for high memory region address
assignment easier.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 74 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 0961e053e5..4dab528b82 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1689,6 +1689,46 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void virt_set_high_memmap(VirtMachineState *vms,
+                                 hwaddr base, int pa_bits)
+{
+    int i;
+
+    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        hwaddr size = extended_memmap[i].size;
+        bool fits;
+
+        base = ROUND_UP(base, size);
+        vms->memmap[i].base = base;
+        vms->memmap[i].size = size;
+
+        /*
+         * Check each device to see if they fit in the PA space,
+         * moving highest_gpa as we go.
+         *
+         * For each device that doesn't fit, disable it.
+         */
+        fits = (base + size) <= BIT_ULL(pa_bits);
+        if (fits) {
+            vms->highest_gpa = base + size - 1;
+        }
+
+        switch (i) {
+        case VIRT_HIGH_GIC_REDIST2:
+            vms->highmem_redists &= fits;
+            break;
+        case VIRT_HIGH_PCIE_ECAM:
+            vms->highmem_ecam &= fits;
+            break;
+        case VIRT_HIGH_PCIE_MMIO:
+            vms->highmem_mmio &= fits;
+            break;
+        }
+
+        base += size;
+    }
+}
+
 static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
 {
     MachineState *ms = MACHINE(vms);
@@ -1744,39 +1784,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     /* We know for sure that at least the memory fits in the PA space */
     vms->highest_gpa = memtop - 1;
 
-    for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
-        hwaddr size = extended_memmap[i].size;
-        bool fits;
-
-        base = ROUND_UP(base, size);
-        vms->memmap[i].base = base;
-        vms->memmap[i].size = size;
-
-        /*
-         * Check each device to see if they fit in the PA space,
-         * moving highest_gpa as we go.
-         *
-         * For each device that doesn't fit, disable it.
-         */
-        fits = (base + size) <= BIT_ULL(pa_bits);
-        if (fits) {
-            vms->highest_gpa = base + size - 1;
-        }
-
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
-        base += size;
-    }
+    virt_set_high_memmap(vms, base, pa_bits);
 
     if (device_memory_size > 0) {
         ms->device_memory = g_malloc0(sizeof(*ms->device_memory));
-- 
2.23.0

