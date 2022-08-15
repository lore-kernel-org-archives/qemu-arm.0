Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1015286ejf;
        Sun, 14 Aug 2022 23:31:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7LZ6Pu5svQ07yMOk7yp2KlgDL4vuoIzgYtW559WdmYcss2fKZ2SDor8ar39Jvl3a/N0Wzv
X-Received: by 2002:a05:620a:459e:b0:6ba:c5a7:485c with SMTP id bp30-20020a05620a459e00b006bac5a7485cmr10071108qkb.267.1660545098843;
        Sun, 14 Aug 2022 23:31:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660545098; cv=none;
        d=google.com; s=arc-20160816;
        b=mtwwCv2x8QPOWqu6TPWZPJU6D7DM1QO2qkWZyDgh91fnlYloneqb6ejxiixiZr5LLu
         CwARTzGe1nam14f1HSN7XR5khfVwWQu8eDIYshRDsQ/qupjnMSVRQFI0WymQAXsMyiEi
         f6qABYaV7lRMB9xRYzy9DHazdklsoWMQosdIC0FloEZuDOj7ZvKmV/d+7pATYMsbUhtc
         aHfVtlCTaaFs7T6FUe+KsuK1Sy4i9FteytPH5pidC/RYeJHM1GcdP5KppoNRJoDuApqx
         ABjpmN7yS+OgXiRVP5YCfOUoAhByqPSiNLB4JNUqRx2cQjMWmBxScKSIh7GHV7USkg0R
         4Fdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EmiV3x1gWU2re0gh2VefbhJVOzd17tpkzlIBGJEs3SE=;
        b=YWzO9SCvRUozSAwoLEy12ghztLr0koRH3DBGGs9RRp1HH+S5bwv+wybudL/yftBG0Z
         gkCkELVLVcMN2J7sNCfKzCCCvN+cbhNBzEJVia3rjhHnYjp2hao21hSUVY5Bb/ThYD+z
         Mkfyh20yIqUjn56TAXmpSwb0J//gcA3yF1GqJ9iW/Jp0A/ErWXmz1JHMdDuaw1RaHOpQ
         MTCgxitt+6oj5PPRrJ2uxP1jMY/Ho7ZCMbfMVvC8vIDQjXNyCNtUtITMy7rQzF64EXun
         kGbuPB2U8P1mKDVyBJzTBLF4y5ISfyQmKhEgAdt0p1y11knXOzQup5HZ5QNoiuC/uQlD
         TLJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJb3lqaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f6-20020a05622a104600b0031eadd7b8cbsi4827334qte.643.2022.08.14.23.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Aug 2022 23:31:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cJb3lqaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oNTdS-0000vN-7h
	for alex.bennee@linaro.org; Mon, 15 Aug 2022 02:31:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcP-0000tE-0A
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1oNTcL-0000Rl-1d
 for qemu-arm@nongnu.org; Mon, 15 Aug 2022 02:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660545027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EmiV3x1gWU2re0gh2VefbhJVOzd17tpkzlIBGJEs3SE=;
 b=cJb3lqaVbEAReiq/b+AYPwBAUs6Xw+R83uVY2C4Dd1pvT90nCQALtmQ6nmaI3ZvswSO55d
 EzziiFJpeqRE/FICUdBlPvfWYsjHIEZN7j6inKAKK0iwSfJudFgG6j6vZQuEaZ/ZePIf5I
 XPIojbbwb2zP1xJmncP9/O4RJ7COKLY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-F1yxOnxbNsm5dqfxcdIVcQ-1; Mon, 15 Aug 2022 02:30:24 -0400
X-MC-Unique: F1yxOnxbNsm5dqfxcdIVcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DC113804074;
 Mon, 15 Aug 2022 06:30:24 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-77.bne.redhat.com [10.64.54.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9688F2026D64;
 Mon, 15 Aug 2022 06:30:20 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, shan.gavin@gmail.com
Subject: [PATCH v2 1/4] hw/arm/virt: Rename variable size to region_size in
 virt_set_memmap()
Date: Mon, 15 Aug 2022 14:29:55 +0800
Message-Id: <20220815062958.100366-2-gshan@redhat.com>
In-Reply-To: <20220815062958.100366-1-gshan@redhat.com>
References: <20220815062958.100366-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: A01ys6ui0moH

This renames variable 'size' to 'region_size' in virt_set_memmap().
It's counterpart to 'region_base', which will be introducded in
next patch.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/arm/virt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9633f822f3..f8e9f3e205 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1744,12 +1744,12 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     vms->highest_gpa = memtop - 1;
 
     for (i = VIRT_LOWMEMMAP_LAST; i < ARRAY_SIZE(extended_memmap); i++) {
-        hwaddr size = extended_memmap[i].size;
+        hwaddr region_size = extended_memmap[i].size;
         bool fits;
 
-        base = ROUND_UP(base, size);
+        base = ROUND_UP(base, region_size);
         vms->memmap[i].base = base;
-        vms->memmap[i].size = size;
+        vms->memmap[i].size = region_size;
 
         /*
          * Check each device to see if they fit in the PA space,
@@ -1757,9 +1757,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
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
@@ -1774,7 +1774,7 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
             break;
         }
 
-        base += size;
+        base += region_size;
     }
 
     if (device_memory_size > 0) {
-- 
2.23.0

