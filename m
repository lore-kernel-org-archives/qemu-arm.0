Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2784752ejn;
        Tue, 11 Oct 2022 16:20:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JTR3Ds3iR1M2GX6feIoF3ukaazFil+BQ7zRuEy3DoSxT6P3+MmDNDphJkLucgtwL/cnzw
X-Received: by 2002:a37:be86:0:b0:6cf:b1aa:7476 with SMTP id o128-20020a37be86000000b006cfb1aa7476mr18165698qkf.715.1665530457184;
        Tue, 11 Oct 2022 16:20:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665530457; cv=none;
        d=google.com; s=arc-20160816;
        b=YR8fWN6UJD69G3g9MJvYUqAo+66ferPeaxa1AZ6/XsbEokfjkO+eXiyr30qeR6XN2F
         OESs0R28wtYyz3GLZzg3RIOa/HlhdAy3g20qwKCv4nbRSMOLBES26nPI8Jx72titDfgd
         jZM0SkTvT9DLz1gF/IAU35J8V9d6EH4/UGc06tpsrTYujIUb8cZnH59v3iGuBPmZjGWu
         qZMAlVvkmfKwYRDzdjQ6buecOsWBnOW032LujeJA6vp7Cy+BZg0gxIfgSv1HKV5fwDfA
         frC0+y6N5JUywtZSVbcGB4dM/cEFYlVKdMieYQ0Ryeb8uO2Bl+hdOZ/SwSDvR4oca7h8
         GOZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P7/YFIchJM356I62C5VUUHhFJnlQhOpxMt8aJiRvNhE=;
        b=Zaci3oobbg7mpd+dgPkPs/qvZDcPlXi5RXttozQrpsbYaSbENpGYOZDeQ9jB9SU9+0
         hjHWF2PbNca0NpOJ+UBz6GW9lV/afJC1ksTI4l/gNs+apcbzfQWdwRK/0VmVWm1tRjs1
         GZzq7mznjq0kKZSscqnOJfjIvKLLkJXgWdIXZLtOlEgBVgmKOmhRL8GSOUseeHng3LV4
         H5tzoE00eetDpx00mGirXEmi40ZmXs5NE1Vtx+aGG4JvX7dEyeM6gfob13Zovgm2LP93
         1y1vbDmZuR6ETjQPhTPk9zNgE4/w7fxDIs60Hvnqc8IoC5CY0+ow+XKQc7pF+n3Bn6xh
         v8AA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bWOop+K5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20-20020ac85a14000000b0035a7222f523si1496821qta.598.2022.10.11.16.20.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 16:20:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bWOop+K5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiOYS-0007iJ-L4
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 19:20:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWo-0004le-MT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 19:19:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWn-0006QQ-8q
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 19:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665530352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7/YFIchJM356I62C5VUUHhFJnlQhOpxMt8aJiRvNhE=;
 b=bWOop+K5uN48d3OdLGLmm+kHjFB6T8PkEnOiHcQp0GWAVCmmuBLtAY3sZtP24k9VOz0qoG
 T+O2Ret3591ZIuGnx2yzZdElC3NbJFStpo5yM+qPP78s84YIW7whcx42WCMAZKO8Dluscx
 J7LFTWNknact/BrQCvm6eycTueWIgKk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-AyWQ-c4yMIOOAgG_wKJPoQ-1; Tue, 11 Oct 2022 19:19:11 -0400
X-MC-Unique: AyWQ-c4yMIOOAgG_wKJPoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 228A2858F13;
 Tue, 11 Oct 2022 23:19:11 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-52.bne.redhat.com [10.64.54.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 533A02166B2F;
 Tue, 11 Oct 2022 23:19:07 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v5 3/6] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Date: Wed, 12 Oct 2022 07:18:29 +0800
Message-Id: <20221011231832.149839-4-gshan@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RHyutUyXcmyP

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

