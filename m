Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp362629lfp;
        Thu, 30 Sep 2021 08:09:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWUO2NpaYM14Y2u5BT3vAA6VXjza7fvcjo0fDBajpexeoiLRfaTgiZMzVyaVIY12QK/J4O
X-Received: by 2002:a05:6000:1866:: with SMTP id d6mr6908006wri.141.1633014579258;
        Thu, 30 Sep 2021 08:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633014579; cv=none;
        d=google.com; s=arc-20160816;
        b=rhZ7CCECWBymua49wBP8hBr/Xxi+oT7OZqe3KbEX7q131Z9kMqDkjmb8lzS2qp6FUr
         0Pj4q8tE7L/dxBUsCUOXS0AjLacPZ3qsCnjGi97J6Nmj23jmviFMPv2GWYTbnjf4yggq
         x/l4zfgRsVEGW8Ur3YNVAi8ypGNgB1bvqK2VR3LcPvbouBnEsxvfNI2GIjY6DRQjJIa+
         WTgi4tj+iZ7rdZodQoDt3LKWIzL5Wqp/XX6k5DBmMOHpi3Bn4MQKowInnew/k14/uMrl
         BhyjtHehTehrP24wIRRGKKuevZaHmE4K4RgqDDU6pgtB8b9uZ1utqIO6Mu+vLckPOwiZ
         Fgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=orCnbOBJk1StIAEbK+6LWEL6RpA/3iXocZo/LKR1xDI=;
        b=Rh3gQhBt/NirPJ1aTlKxh/DcDelCcnJsdMcEqYLmFqqAcYG+/p929r5rfX9sfX80nJ
         LcgnsX31rPCQal0p4dzVxAE08X4MOnpfun59djYh0eOhjQqubH9UaU3E1b4H1wT6X0CP
         oVSOLxdbzs21ClBo66igdlJMgweezpznAYXHfpaffCGfoQkifNiHjM7FUhIyVZQwXkL/
         wdnEEobu331xz3OJp4mim2N8aeqC/AmJKzQUs/8nJs7cZiaLtdTCbX6GPzJNVjivsY6k
         MJdAeIys4Bo/K1h0Vija4h6XXHqAWE+bb7NJU7Alk5KSGCYrjX13KcfpEE7VvBIITLJr
         Xl4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6lOmLa1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a81si5106718wmd.119.2021.09.30.08.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Sep 2021 08:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f6lOmLa1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVxgo-0004bv-A5
	for alex.bennee@linaro.org; Thu, 30 Sep 2021 11:09:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxg7-0003y4-Kq
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 11:08:56 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxg4-00019K-E1
 for qemu-arm@nongnu.org; Thu, 30 Sep 2021 11:08:55 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r83-20020a1c4456000000b0030cfc00ca5fso8741891wma.2
 for <qemu-arm@nongnu.org>; Thu, 30 Sep 2021 08:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=orCnbOBJk1StIAEbK+6LWEL6RpA/3iXocZo/LKR1xDI=;
 b=f6lOmLa1H9JFNOXZ7Q2RNMJV72ulymSzgqvr/AZzaWvy0z0UDh9iXGao+Nni/1B78/
 wJYn96Kt31NDR4T54eeC90U7LhBSHPxF3WsBAn1Gb0lVkrTF7xybTXBdVx1OoDlH3Yee
 BBYeP95c2yx5uBjIS/DeIcEU8Uyq05E/wLWoVoYXxlEuce22Npve0DaBbgqAWgtdO99P
 WaBSRB2Efp1eO+wK4+wEu79qVldbne4Md1Y7EwMdvh7XtekA9a2DjDXSUtwwPDRcjyN9
 wDrHms4+JTESFXiZs1KB2ukq5oOlsgfSJhQ9Q0RpJQCMrRUe1Iv7iPVmcPN4InUAMc5h
 6bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=orCnbOBJk1StIAEbK+6LWEL6RpA/3iXocZo/LKR1xDI=;
 b=UoQsAFphtrxjD0C5IdX7ngl4B5IoyrWZbQ46dQgU/aHlH6Aa/QwjS/fphzz8azzO6c
 Xq7yUEJenljO08ifWmcyKdehVKVplUmxXnKh5ngiXIyqgXaLgivvBS00OiEhmWbkxh+c
 2GOnh7KG1niWG8pbrV+wDZSE7h70fCAc6RIdjKgP9HRIXX2GUHcrU6eSbF8S2TFUaz0O
 VSkmVjCiGe3+KCRi1lwcgHEHrqR4ldVVT0fTpo9xQn9va5NBhRrlMpqUVTTLhgp5+Hn5
 UlblgqSj1rZME+7OorApBX1rObHC+UAL7qZJxOZR/8eOgYM1GHlcz/HjSOPfocJ7gPk4
 Nq8w==
X-Gm-Message-State: AOAM530SXloBL46tU65+oEaarfdvMc91gNctNveUjsE13enBXNRKzIE+
 4kd36N3JcTea3xH/GdF/hWkFli4OfLZsjA==
X-Received: by 2002:a05:600c:321a:: with SMTP id
 r26mr15261827wmp.43.1633014526080; 
 Thu, 30 Sep 2021 08:08:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o26sm5085942wmc.17.2021.09.30.08.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:08:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/intc/arm_gicv3: Set GICR_TYPER.Last correctly when
 nb_redist_regions > 1
Date: Thu, 30 Sep 2021 16:08:41 +0100
Message-Id: <20210930150842.3810-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930150842.3810-1-peter.maydell@linaro.org>
References: <20210930150842.3810-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: VL7Qs2D7kHca

The 'Last' bit in the GICR_TYPER GICv3 redistributor register is
supposed to be set to 1 if this is the last redistributor in a series
of contiguous redistributor pages.  Currently we set Last only for
the redistributor for CPU (num_cpu - 1).  This only works if there is
a single redistributor region; if there are multiple redistributor
regions then we need to set the Last bit for the last redistributor
in each region.

This doesn't cause any problems currently because only the KVM GICv3
supports multiple redistributor regions, and it ignores the value in
GICv3State::gicr_typer.  But we need to fix this before we can enable
support for multiple regions in the emulated GICv3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index 8e47809398b..8de9205b386 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -297,7 +297,7 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
 static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
 {
     GICv3State *s = ARM_GICV3_COMMON(dev);
-    int i, rdist_capacity;
+    int i, rdist_capacity, cpuidx;
 
     /* revision property is actually reserved and currently used only in order
      * to keep the interface compatible with GICv2 code, avoiding extra
@@ -355,7 +355,6 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < s->num_cpu; i++) {
         CPUState *cpu = qemu_get_cpu(i);
         uint64_t cpu_affid;
-        int last;
 
         s->cpu[i].cpu = cpu;
         s->cpu[i].gic = s;
@@ -375,7 +374,6 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
          *  PLPIS == 0 (physical LPIs not supported)
          */
         cpu_affid = object_property_get_uint(OBJECT(cpu), "mp-affinity", NULL);
-        last = (i == s->num_cpu - 1);
 
         /* The CPU mp-affinity property is in MPIDR register format; squash
          * the affinity bytes into 32 bits as the GICR_TYPER has them.
@@ -384,13 +382,22 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
                      (cpu_affid & 0xFFFFFF);
         s->cpu[i].gicr_typer = (cpu_affid << 32) |
             (1 << 24) |
-            (i << 8) |
-            (last << 4);
+            (i << 8);
 
         if (s->lpi_enable) {
             s->cpu[i].gicr_typer |= GICR_TYPER_PLPIS;
         }
     }
+
+    /*
+     * Now go through and set GICR_TYPER.Last for the final
+     * redistributor in each region.
+     */
+    cpuidx = 0;
+    for (i = 0; i < s->nb_redist_regions; i++) {
+        cpuidx += s->redist_region_count[i];
+        s->cpu[cpuidx - 1].gicr_typer |= GICR_TYPER_LAST;
+    }
 }
 
 static void arm_gicv3_finalize(Object *obj)
-- 
2.20.1

