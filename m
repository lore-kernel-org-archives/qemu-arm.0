Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2757687ejy;
        Wed, 21 Sep 2022 16:18:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4sSUETEP6cKuejk/W4u1vmHn1d+TAacUhE3/gZAgRdow/4FAEwbWSAXXZDMKTuTCGiXwhN
X-Received: by 2002:a05:622a:2c8:b0:35c:ed46:bcb1 with SMTP id a8-20020a05622a02c800b0035ced46bcb1mr648244qtx.551.1663802335972;
        Wed, 21 Sep 2022 16:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663802335; cv=none;
        d=google.com; s=arc-20160816;
        b=DhiO0fhJotDCf7Jzp+VN6rT+itfHbiAMPx9fFswOUvQCXgwVgCgi/oconFMDElaj7g
         wFhrTo4ZCUMlaLwOOzMKHqp6H6eZGSGHXX+6IPbH1V7zPDRh495AGEOeuVS2GCFz3N8G
         76629bqktlaODLN4mBh9rLiuZSBZjbWq1VPKRxLAM0EzIlHSBKaAI003OWwfNr9ynCmZ
         y1NyuyFC3/RQbxoz/my2QJTcV+zff2+4HtFvL8bx2ekBaWo+VAXBz1FQiRCjuGiyGF0o
         iWteui8nVpAzA8qLbvGNfpY1i/U4ARWhDD+YRsQ20dr6MyveZ8BPYh/+F2UMNhyIZ6Cy
         FLZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hirCa3HlIueBb970knAeJhyoOGSf8eDwAi/bmUCUvNo=;
        b=nFoUI7niUAIVClSYUs1TFnhsnp3z35PwK//DV7IzflIK1qfKaC8Qr7osq1iyJTe6q3
         fx2c5f8CqJzT4Mk0D2OabyBUnm4IWOv+PxDelJgmJGw5xQP6rSY315iI8S8wOnbOUhXg
         Acgu6ig6s1szo1/L6i3RPmKr/LCrvsmol6yVXdl/dhNuuCIkurqgyugqm3WQvtbvuTMY
         Y4Cs1oq+FpInGH1UCmXFb4DFQMXlz/Fl11ct+qzGJzVluYoQh1he2ICMhehG3EAsbEwF
         EwK6Z+aPGMutVFy7dlm6Iwjjp4avCkZGLIwg5nfHRqiLLrNyyb9t3Egjw8+b420xJdpo
         txIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MUXDeqbn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do33-20020a05620a2b2100b006cf4f81c104si1503999qkb.192.2022.09.21.16.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Sep 2022 16:18:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MUXDeqbn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ob8zX-0003fd-Bu
	for alex.bennee@linaro.org; Wed, 21 Sep 2022 19:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8uw-0008Qu-VT
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:14:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ob8uu-0001rd-EV
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 19:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663802047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hirCa3HlIueBb970knAeJhyoOGSf8eDwAi/bmUCUvNo=;
 b=MUXDeqbnEiAa5dFg3M8sr+nDWYToPaBDcda0gy42WalJ5Rbs71sQo3Jgfm/1GXlTTSPTP+
 ycv3+fmBs2/67jg+AX4LrtnLjUIL/tTucwgiriuWRQdGHR6o03r8W6jzpthCYQGWARQDK1
 uLuX/FzO4BoddzLiN+W5Z5GY7aCCVVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-YAvDvmRPNIuTf2eV6lQOJA-1; Wed, 21 Sep 2022 19:14:04 -0400
X-MC-Unique: YAvDvmRPNIuTf2eV6lQOJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0628C862FDC;
 Wed, 21 Sep 2022 23:14:04 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-126.bne.redhat.com [10.64.54.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A7EB2166B26;
 Wed, 21 Sep 2022 23:14:00 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v3 2/5] hw/arm/virt: Rename variable size to region_size in
 virt_set_high_memmap()
Date: Thu, 22 Sep 2022 07:13:46 +0800
Message-Id: <20220921231349.274049-3-gshan@redhat.com>
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
X-TUID: aXZ76aDbEgqz

This renames variable 'size' to 'region_size' in virt_set_high_memmap().
Its counterpart ('region_base') will be introduced in next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 4dab528b82..187b3ee0e2 100644
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

