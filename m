Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D5DCCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:17:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kDM-0003nY-Uh; Fri, 17 Oct 2025 09:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDH-0003jU-N3
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:44 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kD4-0004aU-Qs
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:09:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-426ff4f3ad4so905622f8f.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706567; x=1761311367; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l/4CR0KG3sLN16Y+p37w7dv3aFm2uWBfTJDp9n3g/Ks=;
 b=JPTa3dTsfQeZ6wRBe8Q/gEvY3c4D+a/u0Q9QbTOhZiw0OSGIxjyK6GUd9/MpK+q2pZ
 rdk2hEwlLmpl/0EpWzD+nMrGItw9asH5cNJF+q4LFe6srr1WmEdVdE7R0ZgSD2458X8I
 4uNPWnkzTP1wSAoaNy9RienFsMpYF3NPykX1HS9s7pRYkqCXCYJ8OnK4m8AMnaEjUZ8Y
 +StUlhB9owCX/JGqpd4jcoPfihgoHM+jq96UXfBdCbQcAaw5+n0fnWm6Mh6XQMRb0Kw6
 83oYDRJJpeYNAwFswdlLrt9258JL9pgbn8sQX0A4CP1UwCWs4MEn84HR1lBJvwevf7vi
 wRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706567; x=1761311367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l/4CR0KG3sLN16Y+p37w7dv3aFm2uWBfTJDp9n3g/Ks=;
 b=eqzneA/4vG6oJTiOSpLrkRdordNceQB6zNxLno3sydhoQ4xq9kpPq6BcHKyEHg8NaI
 +AHfVJk7bl79ZiKGrLycHf6h0EZlsJlVdqdEqvEDXoP6kmTYsrCysdZQ+bw5+fAhP1Cf
 9DPd0BRygLX/YqIPHNVES4YXNhk3+fJwHcHH5JZxPJCVciOQ1VYXZu/jLtVQIitKgy7M
 5Yil9s72qZ8n8ZXQyVaVHJp6hh7Ey2p0HtdH4Hu8bWm9D3t7vPnZribS2buIXrRK4DD2
 9pMpUxEcAjeUMDxXghNUA7GcN65d/JePiqD7WOu3HfMBATE1ZGtRPIG7OuyxI0F7JljH
 5LDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0R5D6P2H0XzDziN7nyygUNvMjEAlAx7dSnf9Z1oj8qBEn8nN2i58k6QOwfpe8sOhJWzb0O+5MkA==@nongnu.org
X-Gm-Message-State: AOJu0Ywz7wMV8ZjnMCnBIWcUF2hZQcsJlbahC8TQ23fsRqZ8lQY2eB+l
 KrPifYMzdmbT9powhPXwjBgAhI3zTeSQIflYv3gL4qo2LwFcrQ7HKzDFOdQ2R7YQc+Q=
X-Gm-Gg: ASbGncsw3ZvgNDfMZOaodl0pUdTMZb3Los0mAIuby+JgVNmpVvjnJrspfLoyfJT6GFf
 gwtPAKgq0vsKzOAhzSiu0OUqms8NBkcP5rIbmAwQSsBFFAYTDk0mkW7P6/+L4A9hHmvSj5E/f+o
 yxC754A0sbxlJ9HXUOl/MP4bpJUikbUaiiILTSae6lP9UnFPzGXfpDTTOcJ+JoR4iJ/HZvYV8Aj
 Y/4PhHEZnKnUVsCh6bDWyVXCI7ZK7gBMl9+UASPv5HkC4ylS+J4j8jPi2I5IuZNmqAFtj46hcyP
 ArZES0WmqGZkHGbB1dV7+qwNAOeCTabPwOmFWfJCFbMvcuvoiiBoWRAe+0Tr0IuwekHWPSGt402
 lVQbN65TTpMX7jM8oUSv7SsR+ToNuXJRC60AtGPVxImwdwMKpMbigoVBCwzooHA5tzCUb7cT6Vk
 /lxEfMhYQBu/FXQneyL2TTIEm3M8Gh4MjL9Uq6HHIEwYT0RfccbtqTv9+axH+V
X-Google-Smtp-Source: AGHT+IFvecIm6L8RkVTs56+m4o4LTc760F0HVwmo5AKmOvOUfD9DqVf76mE5cKnYxwwNQoTO/ZPkxg==
X-Received: by 2002:a5d:588c:0:b0:427:83d:34b6 with SMTP id
 ffacd0b85a97d-427083d3c88mr1412162f8f.42.1760706567205; 
 Fri, 17 Oct 2025 06:09:27 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e1024sm40333313f8f.42.2025.10.17.06.09.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:09:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/20] hw/arm/virt: Remove VirtMachineClass::no_tcg_its field
Date: Fri, 17 Oct 2025 15:08:12 +0200
Message-ID: <20251017130821.58388-14-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The VirtMachineClass::no_tcg_its field was only used by the
virt-6.1 machine, which got removed.  Remove it as now unused,
along with the VirtMachineState::tcg_its field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h |  2 --
 hw/arm/virt.c         | 12 ++++--------
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c5ccd6ec9ea..21d91a43d8b 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -121,7 +121,6 @@ typedef enum VirtGICType {
 
 struct VirtMachineClass {
     MachineClass parent;
-    bool no_tcg_its;
     bool no_highmem_compact;
     /* Machines < 6.2 have no support for describing cpu topology to guest */
     bool no_cpu_topology;
@@ -144,7 +143,6 @@ struct VirtMachineState {
     bool highmem_mmio;
     bool highmem_redists;
     bool its;
-    bool tcg_its;
     bool virt;
     bool ras;
     bool mte;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f23283e6ddd..3e7858d6e11 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -735,7 +735,7 @@ static void create_its(VirtMachineState *vms)
     DeviceState *dev;
 
     assert(vms->its);
-    if (!kvm_irqchip_in_kernel() && !vms->tcg_its) {
+    if (!kvm_irqchip_in_kernel()) {
         /*
          * Do nothing if ITS is neither supported by the host nor emulated by
          * the machine.
@@ -857,11 +857,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                             redist_region_count);
 
         if (!kvm_irqchip_in_kernel()) {
-            if (vms->tcg_its) {
-                object_property_set_link(OBJECT(vms->gic), "sysmem",
-                                         OBJECT(mem), &error_fatal);
-                qdev_prop_set_bit(vms->gic, "has-lpi", true);
-            }
+            object_property_set_link(OBJECT(vms->gic), "sysmem",
+                                     OBJECT(mem), &error_fatal);
+            qdev_prop_set_bit(vms->gic, "has-lpi", true);
         } else if (vms->virt) {
             qdev_prop_set_uint32(vms->gic, "maintenance-interrupt-id",
                                  ARCH_GIC_MAINT_IRQ);
@@ -3471,8 +3469,6 @@ static void virt_instance_init(Object *obj)
 
     /* Default allows ITS instantiation */
     vms->its = true;
-    /* Allow ITS emulation if the machine version supports it */
-    vms->tcg_its = !vmc->no_tcg_its;
 
     /* Default disallows iommu instantiation */
     vms->iommu = VIRT_IOMMU_NONE;
-- 
2.51.0


