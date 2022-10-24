Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3001687ejn;
        Sun, 23 Oct 2022 21:13:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XeXr2Kwqa3NMbINffAdLJi7KpUVOsx7s7vXZ2wivdMBWuLmEiteKEmZ+bGCxiLGNS6ZFQ
X-Received: by 2002:ae9:e511:0:b0:6ec:3234:1b00 with SMTP id w17-20020ae9e511000000b006ec32341b00mr22823389qkf.333.1666584835282;
        Sun, 23 Oct 2022 21:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666584835; cv=none;
        d=google.com; s=arc-20160816;
        b=Gwkg05rYrPIkBMFn7cQgzJ7OJby2VFeSU7j1yGnodXH6jC4xejDujTgoIZT2Y9BP+Z
         3/GJb4U6sICoeCPIKdXgW0JXZG3OxtleU1ygkVsObNuiS2evkASV4TO/J+8xsfEkoNkg
         y+0UlvIcJ9girPdX445gjndvNV/4J0BHNOWIVOPVKheXuUfyP9GgDMbu17aY0duIKEU4
         rIZmQfcRFL9KeIjkK1D+FZmwMAeg1GcPbw0ATDazkNmIAw+PlUbg1CO0l0a1NaT+z9kq
         IMH7gdMwN9othSATPsGhvEgAoQV4EHtnHJxXt8sS13yGJw9SRihW48Vib4lo68OMnTC5
         kXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P7/YFIchJM356I62C5VUUHhFJnlQhOpxMt8aJiRvNhE=;
        b=kqzK1M1jFiXUhfNKkngi/iS6toLXV/5gij0Cite9bWq8713u50yfquZ8XCwPF28ldl
         gjHqL+RIXwg1ziqxYqc2BwgIQ7aof0eBWc2FEBbc61HLIJLXKUOZZyXYkGAba4Emh4e2
         dCsztO1VoeZ3/8WNUXGEpV68qRcezb1vzspYJExKbDh4LlQgcKAm1PYNG+2mymRLOwDS
         eltquq2ZWMz9IHNBhBH8JOwzTWZrZA/PREqw00hKwLFw70fBqmVuQX2qo9uCPuPUqWQ0
         SA74FOs43cJMyINfyTPjAFugkKLxbyCihODe0owcm7I69PP/BNSzBHO2RpuQ3+PCFY7p
         +AjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OZmECenB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o20-20020ac841d4000000b0039786d485b0si15311658qtm.508.2022.10.23.21.13.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 21:13:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OZmECenB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1omoY0-0008M2-Jw; Sun, 23 Oct 2022 23:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXy-0008JK-Vn
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1omoXx-0000h3-F1
 for qemu-arm@nongnu.org; Sun, 23 Oct 2022 23:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666583680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7/YFIchJM356I62C5VUUHhFJnlQhOpxMt8aJiRvNhE=;
 b=OZmECenBQ4LnF12KHDYYUqeHxq3nONXwVbfdpiFfSYebQKb+l4n09tK3D8fRplmkdMayp1
 2+Ly4hGYHRPMtRqwarjR/QvCAbIl4BTeEzq+aAJ3xw0ZliHqzGHACTmLN2VGjm7drc8oSv
 e+83Qdo9+Xf3v2+rhUkQNP8wUblTGxs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-bMGhKQ3mMkuPpx-KlBHQYQ-1; Sun, 23 Oct 2022 23:54:39 -0400
X-MC-Unique: bMGhKQ3mMkuPpx-KlBHQYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE2CB811E75;
 Mon, 24 Oct 2022 03:54:38 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-29.bne.redhat.com [10.64.54.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E43940C6E16;
 Mon, 24 Oct 2022 03:54:35 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v6 3/7] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Date: Mon, 24 Oct 2022 11:54:12 +0800
Message-Id: <20221024035416.34068-4-gshan@redhat.com>
In-Reply-To: <20221024035416.34068-1-gshan@redhat.com>
References: <20221024035416.34068-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
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
X-TUID: OKp2ih8VPtFB

This introduces variable 'region_base' for the base address of the
specific high memory region. It's the preparatory work to optimize
high memory region address assignment.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e2ae88cf8b..0bf3cb7057 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1692,15 +1692,15 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
-    hwaddr region_size;
+    hwaddr region_base, region_size;
     bool fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
+        region_base = ROUND_UP(base, extended_memmap[i].size);
         region_size = extended_memmap[i].size;
 
-        base = ROUND_UP(base, region_size);
-        vms->memmap[i].base = base;
+        vms->memmap[i].base = region_base;
         vms->memmap[i].size = region_size;
 
         /*
@@ -1709,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + region_size) <= BIT_ULL(pa_bits);
+        fits = (region_base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + region_size - 1;
+            vms->highest_gpa = region_base + region_size - 1;
         }
 
         switch (i) {
@@ -1726,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             break;
         }
 
-        base += region_size;
+        base = region_base + region_size;
     }
 }
 
-- 
2.23.0

