Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp2785175ejn;
        Tue, 11 Oct 2022 16:21:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5lu5zl4TIwylzKkRGTLymoFq2dKEhFT4quB4i8EubYZrs6LbyTk1ZwI2H0fSdOvh51jJ/0
X-Received: by 2002:a05:6214:258d:b0:4b1:eb75:44de with SMTP id fq13-20020a056214258d00b004b1eb7544demr21074826qvb.130.1665530504707;
        Tue, 11 Oct 2022 16:21:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665530504; cv=none;
        d=google.com; s=arc-20160816;
        b=zEPjdj1lwyirZxmcOiPW3TfacPXPitGkUtqm9l+KN5DF8CWThVzaRXfPIcmxypAjAC
         3cOb3qQ8uTkNWk75qYcJJFIPxHDl9uUtnLrPeYJ5n5Q5cc5/C315EQK765JC3x8A5Yah
         SkbDMJ9nj4xWZ1GHJmH+1L22yOM+LHikqI8rDLbB7JFawQf7owUNo77HfETliAAPu6vE
         AKRha3zs8jmOkhfsDggn/d2KZZUzmf5oBXKdbriEvFncmfPMj2SEHWnUe0NsrdxL4siA
         aptipIIRQRiOYctCXvw/0dyOgcVcRj+c00gxPV0v4q041vLD69KKk2g08Y6hLPJrP8R8
         P4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BJ57TJbYSzGwdVgx3REDNP22E1p8XARhKt6nl56mLwI=;
        b=HKLXTHIAs9WIu9uk7QbNolwYQ80jsWBbeSS04P4Lt1SAnU6A0eOGREFEkRRLUhxygL
         ysx30RmK88nI8RNYpppyP2weJwN4p+0dxAon3JtG9U9Lu80N+xzfb4qUhRxGMRtsKXJd
         ruFQnrfnEBuGbTGuyVzktxiNQc2DWu+AqEQqVRwJET1GHcLhbCbTYnzmHhavf/p4sGpU
         5NWMXjPeZv7XibItHj29dQbOHbbZMUGZNupVqTwELRxzhwzJvz+u5TLlxHwVF8/GFHVG
         dNmvzawUJY6sDOnHlbbhGk0o2JdjzXt90ZempmKCtgeXxwutk9f1xxufTcSjKQlkFmdF
         Li2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YH7ahXBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42-20020a05622a192a00b0039953dcc47fsi4873086qtc.133.2022.10.11.16.21.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Oct 2022 16:21:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YH7ahXBv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oiOZE-0001Vl-6l
	for alex.bennee@linaro.org; Tue, 11 Oct 2022 19:21:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWk-0004XY-P3
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oiOWj-0006PU-8U
 for qemu-arm@nongnu.org; Tue, 11 Oct 2022 19:19:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665530348;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJ57TJbYSzGwdVgx3REDNP22E1p8XARhKt6nl56mLwI=;
 b=YH7ahXBv88NanR698/zDwBkNi0xfRlIXz/zmp7p9anpiosVYCgGgSIjje9BszbJnG3Blz1
 UrYMx7Kn1rhIqGnh5fTzoqzALsL8whtKMJhKvGqP+LMuw1lN+5lYoDxfb2odBdbGxXBHUn
 b4LsbRXtcWtqzRJRrZZd9eM6q1oIlfM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-aq7yLoBANWaohRDOCOmQIA-1; Tue, 11 Oct 2022 19:19:07 -0400
X-MC-Unique: aq7yLoBANWaohRDOCOmQIA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B505F802C17;
 Tue, 11 Oct 2022 23:19:06 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-52.bne.redhat.com [10.64.54.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 551D82166B30;
 Tue, 11 Oct 2022 23:19:03 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v5 2/6] hw/arm/virt: Rename variable size to region_size in
 virt_set_high_memmap()
Date: Wed, 12 Oct 2022 07:18:28 +0800
Message-Id: <20221011231832.149839-3-gshan@redhat.com>
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
X-TUID: RE4ugZjYvQCS

This renames variable 'size' to 'region_size' in virt_set_high_memmap().
Its counterpart ('region_base') will be introduced in next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 hw/arm/virt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7572c44bda..e2ae88cf8b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1692,15 +1692,16 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
 static void virt_set_high_memmap(VirtMachineState *vms,
                                  hwaddr base, int pa_bits)
 {
+    hwaddr region_size;
+    bool fits;
     int i;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
-        hwaddr size = extended_memmap[i].size;
-        bool fits;
+        region_size = extended_memmap[i].size;
 
-        base = ROUND_UP(base, size);
+        base = ROUND_UP(base, region_size);
         vms->memmap[i].base = base;
-        vms->memmap[i].size = size;
+        vms->memmap[i].size = region_size;
 
         /*
          * Check each device to see if they fit in the PA space,
@@ -1708,9 +1709,9 @@ static void virt_set_high_memmap(VirtMachineState *vms,
          *
          * For each device that doesn't fit, disable it.
          */
-        fits = (base + size) <= BIT_ULL(pa_bits);
+        fits = (base + region_size) <= BIT_ULL(pa_bits);
         if (fits) {
-            vms->highest_gpa = base + size - 1;
+            vms->highest_gpa = base + region_size - 1;
         }
 
         switch (i) {
@@ -1725,7 +1726,7 @@ static void virt_set_high_memmap(VirtMachineState *vms,
             break;
         }
 
-        base += size;
+        base += region_size;
     }
 }
 
-- 
2.23.0

