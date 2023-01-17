Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2688602ejc;
        Tue, 17 Jan 2023 11:30:53 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsKddNUt/4rhsKYlfx5iASSdthjiE77n2s+bO0hEPkBmzeuzOwdFTV4BX5feSq13RE2qzDZ
X-Received: by 2002:ac8:530e:0:b0:3a8:e5b:4306 with SMTP id t14-20020ac8530e000000b003a80e5b4306mr5172797qtn.21.1673983853655;
        Tue, 17 Jan 2023 11:30:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673983853; cv=none;
        d=google.com; s=arc-20160816;
        b=UQXCC6OANBHN6ZGcC5ohHYoGO62UtOK0jXwQCjyIF3szW0YyeZwG30hV/T57XEAgbI
         DGRyf2Gmu9K17XT0CtaAk1Ly1hWPp2GXs3o1muEkeQxpsu2cJ+iYO486CgRV7Hv6W7Qn
         k8rJ3NHTpHCkj2Ass0jlqu5YzpZSomuLxodkKYXGOOZrQdE+9jp2igdpuJ+pEq6Avhlg
         Dt93dA7AX8s7FCi9s/fXcm0lM62GMCGLRX+S99FUv75jYxWCSJsweVjexKgQHdyJhbXC
         dhcxbrc2hiTYXPOIh0j+NPHt94zuIS6NFMVzioGUiTnFejDjNXA2ngQwJVPBTZLRlfOF
         Ncmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=l7/Pf3QFy7tCNP1T2A2CbqV1qRDD69xfRcKghv8dT2E=;
        b=z1NIj0NpNWkHBU/koGr39mDsFCiOVdWzaUy9MV6ac2J3ajb6pabLAYRjd9VWm4gOdk
         T526LcFHecHGGlu10BtBECrwowmCqQT+fEVsHWvYjc47XSW7JZzdQX0N040XcNRWR+tl
         bCklTnA+YZdnfdbPEvUUMygRdP3xBT6Pf9/I8t5BonwyNBIGlTrnFofhotALs3PMKiTe
         /i1GUiiF9Nk4rxHRE1veYOuupjHz0Paid+en8vj8zGfPc/Kc5AffuVz7KxDaL2CCqzL0
         k2D0EvtUUaG2WYftfWfOd66c27/1QFq2DdcmNnefkpuzV4Y/i2dFtnTpnqIudHXNKYLv
         /OpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B4cgeNkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd12-20020a05622a418c00b003b636efda4esi2483340qtb.537.2023.01.17.11.30.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 11:30:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B4cgeNkL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHrf5-0002J3-MN; Tue, 17 Jan 2023 14:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHrf3-0002IY-PH
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 14:30:21 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHrf2-0007vu-3V
 for qemu-arm@nongnu.org; Tue, 17 Jan 2023 14:30:21 -0500
Received: by mail-ej1-x629.google.com with SMTP id ud5so77846490ejc.4
 for <qemu-arm@nongnu.org>; Tue, 17 Jan 2023 11:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=l7/Pf3QFy7tCNP1T2A2CbqV1qRDD69xfRcKghv8dT2E=;
 b=B4cgeNkLMnxoXm6wGLj82xnvRcoJ7RK6qZZ9lfNNEI3Zbpp5QhksaHfSrqzNJmaQin
 x6sioJHeRR9TwkeZluIUlX0Gd4OQV2ijDzbRe3zKFz8AMTTYLwMh+HGFhvc+rC9aE4Wk
 d6h1rLkS2s+ikTdV3z5tS3b6SAZ6kCc5ZqDMOcHTa3Lt7yETZ4dNfi9oN7yoRwSyO8PI
 ffSrsf+XXUfDuMSzc1leB2VhNK3IOdH9AD83RDgVSVMgdXJzseFnTiLeHnQTuig/32kc
 u0IgBYLwOXnGCQETkstFpO1qVeEUmQ/2KD7w3Qv6Zruh3sFTjxRj7LNgvixOBFzna67i
 xcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l7/Pf3QFy7tCNP1T2A2CbqV1qRDD69xfRcKghv8dT2E=;
 b=JcfhQ0uY5nqnbmE6wLSQbJLbjG7z9M8aHTUiMSHGnqspr+SQYYywZxyOzZ0L/VtPUa
 wUmKCQzwcMQKNeAV7HYlpaSBcuUN3rNs3tp4HcGdWKiEWqIVBPrH+EGCRaF1Frk7di54
 Z9sxHl2uoQHXQKbNCAwrCHbF5cHkXjTtW1/3chtTTrhH5byodo3THpNEMEhF0ZXE3sI7
 DImy01N5MgVMTKc1X8jomLPjrmLeqbuyO7CBl7E9KKGc7ZOChBKZu9Sho6Jeq0eUrUsW
 wHMnBEB6k7/dG3GYEBLhXwjNETEZeyYwDycBHEadOr+QhQAoYCF6IzsOJCd/wc8qnKGg
 9gCQ==
X-Gm-Message-State: AFqh2krjYHVLav29+oCLSmQD5wZhIW3bwy7YJJ9E4PyWr7bZNBgq7PmI
 dvyqVEQGpUFMnlwWhXRUEpZlFA==
X-Received: by 2002:a17:906:e2cd:b0:870:2aa7:6509 with SMTP id
 gr13-20020a170906e2cd00b008702aa76509mr4329544ejb.43.1673983818290; 
 Tue, 17 Jan 2023 11:30:18 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ia2-20020a170907a06200b00868c5005e13sm6323824ejc.98.2023.01.17.11.30.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Jan 2023 11:30:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw: Use TYPE_PCI_BUS definition where appropriate
Date: Tue, 17 Jan 2023 20:30:14 +0100
Message-Id: <20230117193014.83502-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: o5WI6067tO0O

Use the proper QOM type definition instead of magic string.
This also helps during eventual refactor while using git-grep.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/smmu-common.c     | 3 ++-
 hw/virtio/virtio-iommu.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index 54186f31cb..733c964778 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -535,7 +535,8 @@ static void smmu_base_reset_hold(Object *obj)
 
 static Property smmu_dev_properties[] = {
     DEFINE_PROP_UINT8("bus_num", SMMUState, bus_num, 0),
-    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", SMMUState, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 23c470977e..1cd258135d 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1366,7 +1366,8 @@ static const VMStateDescription vmstate_virtio_iommu = {
 };
 
 static Property virtio_iommu_properties[] = {
-    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus, "PCI", PCIBus *),
+    DEFINE_PROP_LINK("primary-bus", VirtIOIOMMU, primary_bus,
+                     TYPE_PCI_BUS, PCIBus *),
     DEFINE_PROP_BOOL("boot-bypass", VirtIOIOMMU, boot_bypass, true),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.38.1

