Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307507njc;
        Sun, 21 Jul 2024 01:15:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrRPkQuex1nOCGVeFtyzbKtM2/SVbl84ZLoFE0myOMgL5RpXkKnhiQOk4fsa/f6X1Oz2TbGjTm4it7UQp+TaOgDc8GOfFb
X-Google-Smtp-Source: AGHT+IGGu5BmH4mo69LO9zDRThW9TV5l1EMxr8Zfr+MMSS/uENIufpbKXoiHeY1N7n/U3KfAzvul
X-Received: by 2002:ac8:5f11:0:b0:447:e64a:4eb0 with SMTP id d75a77b69052e-44fa52a5348mr60866791cf.33.1721549743606;
        Sun, 21 Jul 2024 01:15:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549743; cv=none;
        d=google.com; s=arc-20160816;
        b=A6gGbgxdxFQQIcjYCSvzQaPloDIbfwTzJdhIdZdRBN9XiTaxrx3fP4GaA4Sy4powCK
         yu+ntPkVBPoS7OJmDrwujDhaGfz7tNK8tqrU2asDmerrm/CKlWCuWvtEvM8RZFL32hvn
         lZp99yxKgSDDCDCcfmufOToTUMS/QYoac6ra+XzQHS3h+fokCZ/updcytxpHvnKQTNKO
         sxMfumi9LbrFVxVcg0jZBowL/ZzbDV1f5kGSfXwMECjwNJ/jZVVrf0rnakyZwNQTd1eE
         c66bTQDnbGpxVlv480HVqI7ca6dHr/NLsD+bnu3SlAi/N8T7sv7j4zHfu8SclweJxqxs
         SFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S+aR5VWlIskcMFdhgKOYGffyXi++pUDYCIjMSJNpxPo=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=Dbhhb/JoRFwVUVCdFg70Vr9xmf6utwZhHjVSEQkG06rmI4qFFTJ4G4Eu2hFLZhp/UO
         //QANOM8X9S+8QvI+6XPT+APZXTs0m9EAsGdf9BsmzkUNV7juSyaG9/q7eps2hV5lY8T
         gmPoBZti30MBIaythytcXO+IVEezifJiEQddMROo6ygwQZy/0IniLTlHcYHFGXLdtlg2
         9tR9YFPxzBbhw7cr4e9rd3D5t1StkOOhSNH4QUYUsEGAsVbNLPvmqh5USg9tlaEqBgWY
         XjuGpuLMTXS/q1f6v4KckQQANkUkekkvUzsUB0CJc8Tp4QdBT7RHDbRLCgxpmmk3K4Jl
         u9pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fFdW6Wvj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cdd312asi53078111cf.433.2024.07.21.01.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:15:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fFdW6Wvj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiV-0001Jz-FX; Sun, 21 Jul 2024 04:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiQ-000104-6N
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiO-0001WV-MX
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S+aR5VWlIskcMFdhgKOYGffyXi++pUDYCIjMSJNpxPo=;
 b=fFdW6Wvj7OqaKemQiDycP2gnH7wri9W3pWPkNCxC2l7KptCGdlFuOAENUXp8hRohaENFT6
 TIoJuIjlbfVT+Q2kaNkuPyFhUEiqsyhuh2VYRF8JTXZS1FuYsknuSBKroXZyrlZsL3rwmO
 I4SYHHEFsKzf6q8ztuyV+6hH8hHLZek=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-373-f9QX7qRvO2-LYNnC9Fc4_Q-1; Sun,
 21 Jul 2024 04:14:39 -0400
X-MC-Unique: f9QX7qRvO2-LYNnC9Fc4_Q-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 03C0C1955F3D; Sun, 21 Jul 2024 08:14:39 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3C2741955D47; Sun, 21 Jul 2024 08:14:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 12/15] aspeed/soc: support ADC for AST2700
Date: Sun, 21 Jul 2024 10:13:58 +0200
Message-ID: <20240721081401.425588-13-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hWRWmQIDvHqE

From: Jamin Lin <jamin_lin@aspeedtech.com>

Add ADC model for AST2700 ADC support.
The ADC controller registers base address is start at
0x14C0_0000 and its address space is 0x1000.
The ADC controller interrupt is connected to
GICINT130_INTC group at bit 16. The GIC IRQ is 130.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed_ast27x0.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
index a9fb0d4b8874..4257b5e8af82 100644
--- a/hw/arm/aspeed_ast27x0.c
+++ b/hw/arm/aspeed_ast27x0.c
@@ -60,6 +60,7 @@ static const hwaddr aspeed_soc_ast2700_memmap[] = {
     [ASPEED_DEV_SLIIO]     =  0x14C1E000,
     [ASPEED_GIC_DIST]      =  0x12200000,
     [ASPEED_GIC_REDIST]    =  0x12280000,
+    [ASPEED_DEV_ADC]       =  0x14C00000,
 };
 
 #define AST2700_MAX_IRQ 288
@@ -344,6 +345,9 @@ static void aspeed_soc_ast2700_init(Object *obj)
     object_initialize_child(obj, "sli", &s->sli, TYPE_ASPEED_2700_SLI);
     object_initialize_child(obj, "sliio", &s->sliio, TYPE_ASPEED_2700_SLIIO);
     object_initialize_child(obj, "intc", &a->intc, TYPE_ASPEED_2700_INTC);
+
+    snprintf(typename, sizeof(typename), "aspeed.adc-%s", socname);
+    object_initialize_child(obj, "adc", &s->adc, typename);
 }
 
 /*
@@ -601,6 +605,14 @@ static void aspeed_soc_ast2700_realize(DeviceState *dev, Error **errp)
     aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sliio), 0,
                     sc->memmap[ASPEED_DEV_SLIIO]);
 
+    /* ADC */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->adc), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->adc), 0, sc->memmap[ASPEED_DEV_ADC]);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->adc), 0,
+                       aspeed_soc_get_irq(s, ASPEED_DEV_ADC));
+
     create_unimplemented_device("ast2700.dpmcu", 0x11000000, 0x40000);
     create_unimplemented_device("ast2700.iomem0", 0x12000000, 0x01000000);
     create_unimplemented_device("ast2700.iomem1", 0x14000000, 0x01000000);
-- 
2.45.2

