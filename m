Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp367554ocb;
        Mon, 3 Oct 2022 17:31:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5KA8g26f+fb7lEOdFUeJnL05SjcbOL6nXRiA9mqgnQRvnUESoDPG0bssXCPAMYSoA5zicJ
X-Received: by 2002:ac8:5fc5:0:b0:35c:e881:6c96 with SMTP id k5-20020ac85fc5000000b0035ce8816c96mr17986749qta.466.1664843509223;
        Mon, 03 Oct 2022 17:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664843509; cv=none;
        d=google.com; s=arc-20160816;
        b=a4y0QXgey7ZvMix8kQ8HH1pJt8PCfqFxSUSvdbRIvuNxqWUBQIIZn0zX3l/24DCqci
         B3QpkvcsVta3P+B4zwz5PUm2tm4VBwl23ZcFAmet8fprkx5PoduETYfC52CCMzsSNypz
         8xKU4tTR7C8LjICHnvM2E/dihyQlY2gVdOZsFa6tZgHYJA3TJX721bao+ssaBRTj+wAT
         gouKWElib0sw2MFXJ7FyUk4aT/u4s7ncuhNOyPd7Q1zzN4ASnAKXAndlUQ/fmz9K+OYY
         59PE0+LdsNayAdM3tsf6YLZRpvBq8qhIlhWmXtKeVDSUL/WX85h3AEGiET+hAH4U7ptC
         57xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZiywPYaQZ9wLpbRIRk+IduR7ifaJejpEMgYyhAciTtM=;
        b=vL67m2mZl6nPcD+vVlPP54Mr8SHfMMJpZCwpnwNNzYu9AQBmBAnmXTn/xgnfJcs1H8
         fmhpOlSX0uYyjmRab5NEHOVrAQXlcV6wOLB3/AOJu59U7HxUd2aTEwcplb00oQu2SKg2
         d/crgjE7d76HdPqaekXM5Vy/zOHAHvWISyQ22MEez5braMND1x93Jnm30utz1Xh9HeDX
         gyu59mpyda9uyEDUgaHS26/sJKAlmiBukikIvvt0xHW08tIrMN5tPUb1HPzmcHna8UbF
         xvXPHno3X2O3DIRT96s8sa2JaEUEhiDyoX1oVziQYQIM2Vr5oRIQ4tZHhVuFd6kwcigU
         r0JA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IpPKDmCo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020ae9e912000000b006ce3aa94c0esi4222625qkf.145.2022.10.03.17.31.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Oct 2022 17:31:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IpPKDmCo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ofVqe-0002Hu-Qx
	for alex.bennee@linaro.org; Mon, 03 Oct 2022 20:31:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVlu-0007t1-2F
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 20:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ofVls-0004uS-1f
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 20:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664843211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZiywPYaQZ9wLpbRIRk+IduR7ifaJejpEMgYyhAciTtM=;
 b=IpPKDmCogXsXuCEWLgahTSfpKXuKVFh2P5M7nBKs6Y0dkOwPsLCeaOUULNnu1QcsqUePod
 O1I7uyiLAOLexqO+1ZdGShCRm6VjFdo51yIZD53HMAEByb4RydT0hwIoskHVDj7AmLgH2l
 PWxCFw4LoExhRegYHvgCzq9boFLhipQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-r3eI5_sPMDmBPEcC4rqxIA-1; Mon, 03 Oct 2022 20:26:46 -0400
X-MC-Unique: r3eI5_sPMDmBPEcC4rqxIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 138983C0F661;
 Tue,  4 Oct 2022 00:26:46 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-56.bne.redhat.com [10.64.54.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9046A40C206B;
 Tue,  4 Oct 2022 00:26:42 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v4 3/6] hw/arm/virt: Introduce variable region_base in
 virt_set_high_memmap()
Date: Tue,  4 Oct 2022 08:26:24 +0800
Message-Id: <20221004002627.59172-4-gshan@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
X-TUID: LLkzvcOUQvxz

This introduces variable 'region_base' for the base address of the
specific high memory region. It's the preparatory work to optimize
high memory region address assignment.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
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

