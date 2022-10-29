Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp140726ejr;
        Sat, 29 Oct 2022 15:43:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4neOouUB9I1wh/VmMnmdCP1gcp36zfJm0cgmpxdy/c36B+/TGFEQzL6zDnhpS4M71vKvl6
X-Received: by 2002:a05:6214:20a7:b0:4bb:9359:8368 with SMTP id 7-20020a05621420a700b004bb93598368mr5230594qvd.122.1667083418716;
        Sat, 29 Oct 2022 15:43:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667083418; cv=none;
        d=google.com; s=arc-20160816;
        b=eZFjVrpsWvo7+xicMagpATML8DT9Pr42VDMaMQn3OFA1/E4bs7TBwGIm5fxXYnK+pk
         DStUOQSJvcr5aZoY6E+rlJVqg3sXcvvSPOx3i+84dSNiRalBjPbQqWqVGBLA/41EEC3D
         jKP/v7gG5pBy1DDed6woxFm/IeX8RVHYulGySqEDEi7sA1zX2RXlLvRz3AIhkUyp9kOT
         woXeCzJNQiax9pKbZ0P/uUzqbOgcw1asZ16pJK6JTR2kMfqfNb1knqy4mHl25sIfVKP/
         FgEQ/DV8HnbbY/4ATBCD3SSDtIcZzYngCt/PYX2M9YYwJgE8fJsYHL+iiaGJd/UYvrEG
         nlaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EUZ9MKlU/3eGh1ebAxMEmwYrOQMI5Lz3459rdQ6fS0Y=;
        b=Ie3c+VJMcmxejopPhgZpgQmYn2gtax9rtF9YBCWpCzmgTgH9vVXhxq1EbWFhCuutSa
         MsU6Wn3tRcMwbpgXXW8XzXzW9Xj/L3xddab2iPw3lUxmy1O/jeveqo0Ywyg1M+rCGzHp
         1vtYOU8zZc8Q0+bmjy0he6Sln4HeLU+PQjsfXuw0KQVAPmzHOMIUj/gbARsvysIQ6bjm
         SlU3L759mZMeVUvFwdjCFAIKw3sYwJW0RS58eGfNZ7q3GtB/8TLIw4EATA9bUcxnrnwT
         raQb8NIhhsibN1RnI68p3ghZgh6iGTdygKQb+J4kP4M7QX3yL6F2HCxGhyPcS3JnSULp
         MmWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOXzOHt7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4-20020a05620a298400b006bb2140edebsi1626093qkp.240.2022.10.29.15.43.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 15:43:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bOXzOHt7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oouY8-0003UJ-PI; Sat, 29 Oct 2022 18:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouY6-0003TT-N4
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oouY5-0002R5-7Q
 for qemu-arm@nongnu.org; Sat, 29 Oct 2022 18:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUZ9MKlU/3eGh1ebAxMEmwYrOQMI5Lz3459rdQ6fS0Y=;
 b=bOXzOHt7k6lmlk2XeRF4euzrxzMXiLDBGP+zVW6MoGwGLo0CuV/2oporK4ZqpgAC9xnB2H
 3MLb39iul6OZY9cNZotz5XbFsthe0M5pbSGIH/8bs+gKXYmqrkcuolFBBO0p47ka1fTsnl
 KdUA1C4w9Te0PprkKsEdPNSgGmdOCnA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336--amJU-9nMxOkN0OmNR3PJQ-1; Sat, 29 Oct 2022 18:43:26 -0400
X-MC-Unique: -amJU-9nMxOkN0OmNR3PJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D8BE380406C;
 Sat, 29 Oct 2022 22:43:26 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20AC82027062;
 Sat, 29 Oct 2022 22:43:22 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, peter.maydell@linaro.org,
 zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v7 2/7] hw/arm/virt: Rename variable size to region_size in
 virt_set_high_memmap()
Date: Sun, 30 Oct 2022 06:43:02 +0800
Message-Id: <20221029224307.138822-3-gshan@redhat.com>
In-Reply-To: <20221029224307.138822-1-gshan@redhat.com>
References: <20221029224307.138822-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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
X-TUID: 9l+Ar04ITcn2

This renames variable 'size' to 'region_size' in virt_set_high_memmap().
Its counterpart ('region_base') will be introduced in next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
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

