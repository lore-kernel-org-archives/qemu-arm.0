Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp746490lfp;
        Tue, 14 Sep 2021 07:38:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx70Ipn2ca0x4avFURXVevbeV7mJ4A6/JgLlRDEPBG/7tzkhmgw1RJOIS+w4QAqNXHfW5w9
X-Received: by 2002:a5d:6212:: with SMTP id y18mr19478782wru.241.1631630328697;
        Tue, 14 Sep 2021 07:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631630328; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7aQUovVeu30d+fj4WuB/IAiq8owZwaFk9E6cD2bUJt+2YT/Gcvpc6PLgxUj5yLbUr
         2cX7pjEJmlrISe0J5/P1TGODQ3AXaBnz0Ykh2xW57EsfGL7GAzFDs19u9SqtltFm8699
         hqWGLQhujKSkeePcSNsrKEv9ej9/Fxzo4WaqQ/q7RwunbQLsu7G3TO2IjO2H3f7NuCdj
         vlwXN8pxgfCW1oS3qHQ0laXerD6ShQY/iygkEB+wDRaZ2klchcC5RR5C1fawfsEAkRMF
         IhfIfS0LLQARBwirCw2YAZJlpd1zF2YWuispB2nU6dTycxnqW6YoWEVKcVqwDKOKw6Xu
         ungg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=A36UF6SLZ6rtAL1T4W2mA2INEfGxveQOg5GlQyADzqg=;
        b=vBRHDgVB11syBvmZyX+HwuLuiKHkvOSefAff1ZXdytI537cMkhHoSDRjI/L+zjQOlQ
         dsxx6AjkaSEqyM5xlQg0SbadXgvAQhLQ3tiPiP0HuanUO3y3i2OUfQ4i+LZYYMM4udZz
         EDqlY33DMhgctj1tkdb0gCSHNOAJZ4ZbL+ZkPN8n42yRq7oKnuy/2gLeQlJCLrcz+pDr
         5ZJUiG6SUoxQAPB/uczihFTN/AIq00F8e3zY77Xt4FSQt9347mWmzBXEMxmzLaAQu8cn
         JiJmmHnTr48DYXii+ZMB2e+eatwbQDcBcinIs/wi85Ip1NxCBLDdYavy9R29r0pgmA4E
         fKlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ds+QZrm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si10566260wrs.424.2021.09.14.07.38.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:38:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ds+QZrm0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9aB-0002dU-P8
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MR-0006Bq-Lw
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:36 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MJ-0005Ny-9F
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:24:35 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so2703902wms.2
 for <qemu-arm@nongnu.org>; Tue, 14 Sep 2021 07:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A36UF6SLZ6rtAL1T4W2mA2INEfGxveQOg5GlQyADzqg=;
 b=ds+QZrm0k8l6jUBnwq7IHqicrPeYluCt5ucvx08hT+feUN7pwPu6PbkcvYq79e8zSZ
 cUXaa730IdoRFKFVuy8bX6nWXeCDnnW5DLZ0OQar9bxGvU4sS4lZnGsivQb8PuKxB4nk
 GktCDrEg7OxnSRzyTae7SzZZjSFhoflGchISB7NnIVxReu+uxjn7wxedYK7HgWiO+Vii
 iVbY6MOkru0vYWdmUATcKNdpk4nlMKicxxtRfnkNtJAvnhS0uOW8vMsiKh+Fhb0DuuuW
 00lQu1haYeImtZtVU2Z+E/SeRdqDXkine0VdZSXPMI4UAZb7Uhia/obAnLPxCv52Q200
 hDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A36UF6SLZ6rtAL1T4W2mA2INEfGxveQOg5GlQyADzqg=;
 b=cItsCqxAEWx1HLheLhUdDvnHGa4IarTSqcbZPWzvsrHNQ36K/UmYkxZPaxM8fMIMlc
 1rwMDjrZmDEOz++Ci+bvVC5MG28WzRR540NTzK+5pdDXgfTz9I1OsdcOX7gWpHSWltFZ
 MYnwbp/DM+n2UdkQReothqUj2xt0Ogwy/9FEm4/Rh84zWpEL3iue0yURSkrG8QqnEJvn
 s1To8FxXPBdL7JHb8pKisjyfE+gRgCo/rIoaRhf2hqr08+hmfEwY8bmNENW9RtFiXcx/
 lHh5tXDYGNfPO9QVh05MHQG/gCtM9+3lL52PW2V0PtL7QhaADU1ZQSPHGx0dFI+jx7Np
 HWuQ==
X-Gm-Message-State: AOAM530EzKJuAe9L02OFKv07Qw9WB5FXa6WsjH0ReY/lMUJItLoLRUKS
 I4BoDf20icf88zb2IZF1q/tuLg==
X-Received: by 2002:a7b:c3cc:: with SMTP id t12mr2530132wmj.68.1631629465295; 
 Tue, 14 Sep 2021 07:24:25 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:24 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 04/10] hw/arm/virt: Reject instantiation of multiple IOMMUs
Date: Tue, 14 Sep 2021 15:19:59 +0100
Message-Id: <20210914142004.2433568-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RG9In8uSpyx1

We do not support instantiating multiple IOMMUs. Before adding a
virtio-iommu, check that no other IOMMU is present. This will detect
both "iommu=smmuv3" machine parameter and another virtio-iommu instance.

Fixes: 70e89132c9 ("hw/arm/virt: Add the virtio-iommu device tree mappings")
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f238766aa1..26069f943a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2471,6 +2471,11 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         PCIDevice *pdev = PCI_DEVICE(dev);
 
+        if (vms->iommu != VIRT_IOMMU_NONE) {
+            error_setg(errp, "virt machine does not support multiple IOMMUs");
+            return;
+        }
+
         vms->iommu = VIRT_IOMMU_VIRTIO;
         vms->virtio_iommu_bdf = pci_get_bdf(pdev);
         create_virtio_iommu_dt_bindings(vms);
-- 
2.33.0

