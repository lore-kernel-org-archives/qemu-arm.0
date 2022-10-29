Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp140733ejr;
        Sat, 29 Oct 2022 15:43:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7nuRqvLW11f5OJWi+rH3LbsQnaeAa2+N3sDui7L8GhujW2b3hOcA0X2mlFFKxaHf0mWioM
X-Received: by 2002:a05:6214:2461:b0:4bb:4aa2:e59e with SMTP id im1-20020a056214246100b004bb4aa2e59emr5303629qvb.98.1667083419228;
        Sat, 29 Oct 2022 15:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667083419; cv=none;
        d=google.com; s=arc-20160816;
        b=IWCZTYWDzhJVrEsXTAPs0MA9t/80yXy/3iAq+lsm8A07eFZ9TxAAD00dz+i6gPNKrx
         mhZaiV8biOSMQWEf9MLZfqyGcByUur3qLAwbOYmzybWnqbYcoqjlPDMdWQec33XBTiJe
         VyuxfvmAb01zuD4wO5veBmLGekr28BRXBmr53a6l7/6cWdfT62ktCKM3rugoE0BY6otk
         0dTq5UIB15Qxr8EL79rSNy3lcCMszUIHKDddcAZAzNp/4WOiUe/H4dm62faiuW0UP18l
         Qaqhw4YElUaW/wvB4HQXPV5SNiT5s4TdSh+H7qD7InHXXSzJSV9vWMmFEuLyJwLWWb2Q
         YN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Cv0NQj1ouc6VoLVpss/wFw5XMekM0r8e5zaELh48VfY=;
        b=qcj0/l9cv9AZ7SfxUoIrH8dv2rFDKd0fod+myiVI6pfSo4pTLpN91PMByMTz/wWFWY
         PpLBwlfG8zth0HJDizCs3PqTH/N0lSHUIpK4sEwD7sHGn2UNqv9JSA5PPH0N9KEDNJ4y
         3sveucfu3zAnGQqOh4I33TMba0UKGrRUyxJkohEoJFEi0x6L7fkpwZYE7A7Ffd7jtKf2
         fsnWw/Nb7I53PDjP3h/nFAJRuirTNTw3iW7sP/ca60oH29L7Wawx6iQ0aKj6C8yseN9u
         Vqf/YBP4bQm1VYh3oqA/yTLxe4q8eqJ96zyOiOjZZKNHomVP6K95Be2oq5SMQQ8aFSMk
         /qHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GgvyJ8Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do1-20020a05620a2b0100b006eee8a09971si1597722qkb.1.2022.10.29.15.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 15:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GgvyJ8Bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oouY9-0003UN-6K; Sat, 29 Oct 2022 18:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouY8-0003Tl-1v
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouY6-0002Tc-5m
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cv0NQj1ouc6VoLVpss/wFw5XMekM0r8e5zaELh48VfY=;
 b=GgvyJ8BoPxx83ibrbAfHqjjIb0DjL8cowpfur9EJBKNGRO7jXR5lNteSS6XtNhnxYr02Xa
 4QT+7KYoDVLxpxH+SOyHXuXkGk9mgf79T3iGddC1E+lLSCACMFTTdOb+OxNYdQ3+KfOQRG
 zNbbzBoOlMvBjgdpOUC/VrbIY0wiEq8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187--FH88o8zPV-YIPZ-ZkM9eg-1; Sat, 29 Oct 2022 18:43:23 -0400
X-MC-Unique: -FH88o8zPV-YIPZ-ZkM9eg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82E83101A52A;
 Sat, 29 Oct 2022 22:43:22 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 219022024CB7;
 Sat, 29 Oct 2022 22:43:18 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v7 1/7] hw/arm/virt: Introduce virt_set_high_memmap() helper
Date: Sun, 30 Oct 2022 06:43:01 +0800
Message-Id: <20221029224307.138822-2-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
References: <20221029224307.138822-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sklmfbD4a7IP

This introduces virt_set_high_memmap() helper. The logic of high
memory region address assignment is moved to the helper. The intention
is to make the subsequent optimization for high memory region address
assignment easier.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c | 74 ++++++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index cda9defe8f..7572c44bda 100644
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

