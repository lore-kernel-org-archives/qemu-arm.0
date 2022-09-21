Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2755662ejy;
        Wed, 21 Sep 2022 16:14:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ZrzZrZj/PgaMSA7pI6TKTEDKVl9OEl684s3RfEPuWlwzWICzhf8mY6r+CctO2jHqSRi1j
X-Received: by 2002:a05:622a:20b:b0:35c:f6d6:9169 with SMTP id b11-20020a05622a020b00b0035cf6d69169mr626210qtx.669.1663802077474;
        Wed, 21 Sep 2022 16:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663802077; cv=none;
        d=google.com; s=arc-20160816;
        b=TXPk3Ce/Xc3bYQQ8g9FUWT3b1RSMcY3GCkmvsuZlk3TFUkUeuIdLuQUAqY6KMQfI+W
         9JcUQFOy1m7XkXqS4L9SVNjCNYOlvwJ0CGLH6pTUOY2yQUR3SMxunxkCpuXIKliyUHvB
         TubAQdvLeHwPtD7/y0QT974aqhtV+10Gm6lsSxj+TUDowsoEDTOlD8op60DWBKlODnlU
         7baj9GbzH7iAywm5wZ/SZAbRNNFwp2mJS2h956FOnlyidR8v50hnOUiaJxd+lR9nDhBf
         eJ+M+NYYx4m2Jty3MV8xouLQ/mlNav6Z9flg5TBdiuiOrKPPxcojeR/G7lLFsKHGB74k
         93uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=INGyMUpdKLNzLwyHhM65ggS6sfucai9ZgAxo7nEnfY8=;
        b=Zb+LjKzSH3tZdnw3JLaijiS5Kpk3nT0SF+p9xPg3FC448mR4Y9HIeVrvSEmDHlnBrH
         cTxfXCUWDnnw7yOBsKWg9+b5OUM97HykQFM192fFTiFSWKFYJepF4f5oTmCN0tMhOPjU
         dtQqTg5wsKq1vVif237AUxJFKv2ygrsOpm9Pn+6lPAbKdCVSprGE4Z65y/VN7PSTG5sQ
         1QrDPSA4G2hjP6pfDFwDSbIV1k1PkQAuPHCoGe5vou8LUlOZUlnUyYkdCgoBOQKiXsy3
         m0wd++IYMRXtRDyve+fBeydxDKLBZYPpuWx86ZWrL9dEXFjEpfaIueMwTeqRVS1e2AFQ
         gEpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IQxMxraF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020ac85287000000b0035cf7c58951si1895507qtn.725.2022.09.21.16.14.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 16:14:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IQxMxraF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ob8vN-00006h-0K
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 19:14:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8v1-0008VJ-Fi
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8uz-0001sM-Tu
 for qemu-arm@nongnu.org; Wed, 21 Sep 2022 19:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663802052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INGyMUpdKLNzLwyHhM65ggS6sfucai9ZgAxo7nEnfY8=;
 b=IQxMxraF4S3LDB4OmdmvkBJjaNyc9xCVXaz/RQ1r2PBhdXgwZf/l2H9UgvhTKZGopERlxy
 Unnwlt5zwxvky1HlmhX6uzA6eZEl66CW7Nk7H+t+ER9smrTQjGEfL1VJimzgWWNbo2gHVu
 mdVNnsr4VDyJLcNfMyn3d+ay9VBDVF4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-QzSwp7BYOh6Jvl0RUz2O9g-1; Wed, 21 Sep 2022 19:14:09 -0400
X-MC-Unique: QzSwp7BYOh6Jvl0RUz2O9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B6EC101A528;
 Wed, 21 Sep 2022 23:14:08 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98B6F2166B29;
 Wed, 21 Sep 2022 23:14:04 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v3 3/5] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Date: Thu, 22 Sep 2022 07:13:47 +0800
Message-Id: <20220921231349.274049-4-gshan@redhat.com>
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
X-TUID: X0Tw91B0hdpA

This introduces variable 'region_base' for the base address of the
specific high memory region. It's the preparatory work to optimize
high memory region address assignment.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 187b3ee0e2..b0b679d1f4 100644
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

