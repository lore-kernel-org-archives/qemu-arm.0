Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3010553ejn;
        Sun, 23 Oct 2022 21:37:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM443yr2hlo28xm4FsiftKP4zkncYOtYeBkSwZ4fGs7ILo5PLWH6+IuQF940vs+EK/uhoewl
X-Received: by 2002:ac8:5c82:0:b0:39c:d508:f1a8 with SMTP id r2-20020ac85c82000000b0039cd508f1a8mr25814608qta.142.1666586264657;
        Sun, 23 Oct 2022 21:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666586264; cv=none;
        d=google.com; s=arc-20160816;
        b=ALUIu9zpZUzopLJEHvm0dvL7auCOuFNEp+GoEVIN3UFophENscnQtvmNMn5XbMG1jc
         BX4F1hrmI47nrlQnG1OVzogET1cspBe5dK1lC7u7YY9imcHX3wB5sq8frVTdxgzn/yp0
         TGHnuWJJNRdMJY4Dnm4nInOtWpm1hZ+ZRgLI61kty0Jftk4rZtky0roh70uyF+Yr8w2C
         BhVkGuyJT/7iDVPvvr0CZiz7Ti5bDw7pL+vAJbgMFxOfvPOd1h1AT9YDZzKtl5eQFtJG
         nyDcayyOLkdL2zCOR/WRkebcuQAYLIuISwkz77X1NRRfLMh5QYGloz7GmpYwVnOd3POq
         KxUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=J1StH2dMBzUeyRMEsgfoJeHQ/K4Oy05VZ1BcH9DQeqI=;
        b=ZekecdK5uNlcFpmkHqMtEQ13CMdJdRlmQwKq9TxaQTo6Q1wVABrdRBJaBsXH+Lb2nM
         cF7NiVe9LRPXI3XLhJToeun8fIa0XVIqG9PqRj6avW/KRIDNamwkNT89xf0v0s2BXIMj
         KoMVGnPVCtbR4sk9srglXqGVJwYkVjp1xFY/0lJQbYK4aOrvYtwMMDm7gPAYF8HWsz4R
         1nwpvYYahubyk5NxDlKGQKbFfuAmFSl+hGIHTfL4yYkiqM8F2KdlRzIW3K+YX8cyfqGE
         gWFryp2R7G26wyP3lZavBp9wINbGLCC9FgmvMg0szf3LeHJTh5i1mCDNNKRIyDIhGIc0
         90jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OBLEqpz2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q21-20020a37f715000000b006ee8d5ae3d5si14991798qkj.164.2022.10.23.21.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 21:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OBLEqpz2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omoXs-00089q-NH; Sun, 23 Oct 2022 23:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXr-00088W-Bj
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXp-0000fY-TO
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J1StH2dMBzUeyRMEsgfoJeHQ/K4Oy05VZ1BcH9DQeqI=;
 b=OBLEqpz28P0/9Qs3rQKMseKqCiRZJSpw6onyqjW4HpSP2+Z2tsG8FGx8Ebye9DAr9oIT3Q
 ygiHqK7prtIq8uUmsz2aa9F+FrNyxoyfLBr7GEPmSf3HJz93ACUY+ITR0mH1yw/hoE3bYs
 M2MopJk2Ll1aGJbwn0Ef4Bzm2OQ5sps=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163--TV7x0WtNni4YESCe9IrvQ-1; Sun, 23 Oct 2022 23:54:31 -0400
X-MC-Unique: -TV7x0WtNni4YESCe9IrvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D542B299E750;
 Mon, 24 Oct 2022 03:54:30 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0F440C6F75;
 Mon, 24 Oct 2022 03:54:27 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 1/7] hw/arm/virt: Introduce virt_set_high_memmap() helper
Date: Mon, 24 Oct 2022 11:54:10 +0800
Message-Id: <20221024035416.34068-2-gshan@redhat.com>
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
X-TUID: YGW0e4SJ6oKZ

This introduces virt_set_high_memmap() helper. The logic of high
memory region address assignment is moved to the helper. The intention
is to make the subsequent optimization for high memory region address
assignment easier.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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

