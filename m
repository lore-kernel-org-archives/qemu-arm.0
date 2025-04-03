Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185288njd;
        Thu, 3 Apr 2025 08:19:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX3e7pZcM4IL9410WVHoJVIXhxTO9F6hji4bMdk57NjtoiWqxfHJvYTy/MvEIjZEoI9a0U9+2ocfre/EA==@linaro.org
X-Received: by 2002:a05:600c:4ec8:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-43ec429f903mr23677385e9.11.1743693552978;
        Thu, 03 Apr 2025 08:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693552; cv=none;
        d=google.com; s=arc-20240605;
        b=LQhnq6PahIe1tuNybgb1lI4vNmxYH3GIOAsGy27kD8q+FtAnbC3J5ISV2ET621e9ch
         rGWcmulhkoWVaiGceQGglhxPubF6C+jL6DjFGfDi3r+Wg9KDahMYJBypf12biKehQBT4
         UGXJ/fY89fyKyo+DYcmlFa67kwkPYtaQOb5ZT2aAl+rvppm8HuxhBdmvkCGV16DtYFrL
         gOAeL1AXqCih0ROkSx7K5hIEDZF6nobK4Hy3q2pqW09CEpMridumCPinFLuoSdqNlesr
         SPmXCFQrqZmkNYjGWaA7MhLcMUcEZuSndOpZS3gR6FMciFlEbFZFc8DlFfxs2HsJ9YPw
         8k8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CGlb1wEFZdltIP7kYy/1AJxZQ0OAvinfht2Hxi3HH+0=;
        fh=85VDThASfCf1wi2Ps70nrvzell7wGGlUd0QnPjFbcxE=;
        b=Xg0cm7nqMaJQtlPJOdnoCZ5s0y6Js7CiOBOCYukwxEbcv8PLhEyVokdqYK0kp2EwEu
         x6aUFTbBaU+WiV4llTmhizAs3rwNLvds1BnUOVGsCxV+sueay87Zj9xvBloqfWXxA677
         CMir25WXwxkGeB5LB6F3+EXKQ5lqGHESxUp8M6CvuQa1sp4hLJl33nqUJVxzCGLG17m2
         zeEqB78gXV0NA907+qBE4tL+ZniB/SJFn04G60Ao2yODXmeZFVqou20KhyPo1E1FyzvO
         kzoNINDUsEqCjCjo/aMXx76PlAU3+VLcYKV/V7VyjmopR0xxzHY9XjZFG/rd2iJQUFNf
         2iUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CG0Dxcff;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec3667047sor7562615e9.8.2025.04.03.08.19.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CG0Dxcff;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693552; x=1744298352; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGlb1wEFZdltIP7kYy/1AJxZQ0OAvinfht2Hxi3HH+0=;
        b=CG0Dxcffkomg2lMnKHK59Htm4BY7VLUgLoFuqWapiYdzCaBT61sZrXJkBbPHa9p9fY
         2r9IKquzKNAmyhMN4qR9Z+yuXfLfjOascuZJQ84tlGWZiHn+o1puwVUG4GvTnJM3xjcF
         mc7pbr/oOQmhUqaaD7o9ZT9m2Y/BuVJ3bKCjyynl78alcBrQND5K1k/xgrk/ja0WToG9
         NOB98f/M6QrbeLYasxYUUxb3P37jTf2vZs82/uMy4UucHVdyHGWSulCleTYwQwm1vmMJ
         COJGDAIwp1z93XxrnaHGVpwCiHpkldbjb5vr6MSeqvuhx10SEWsXT6jSm4aGf+5jO13a
         E0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693552; x=1744298352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGlb1wEFZdltIP7kYy/1AJxZQ0OAvinfht2Hxi3HH+0=;
        b=l+in8knRkWa50Oc2WPQ9HU32sJh0/bCWcn3ZHNgv2djnd7ewgbjVFkGUhpSHM8MymC
         VTY4naiI0hl7yr+6ypMrHdVK/iFRXFzWiCdmuCYdYKhmwSrI6aIB4aQoGCsrTCMrrGg3
         xtEX4jUFIBeam9M/h6QInH84xDIytX4Gk+H0dM6h4tu9VCQBPZ97K0shwGRZeXF2X7k7
         oOmQTKaQC7uBWcWy8HYOUsubmEPgkikU3tqH8+xR6zW+jO+rfNo9dXc7C7fMySCcSm8W
         KWoLVGJI8oJbmCHg8wvU7Gpsjy0gev8jX3GF45CRpqRo8hGXopTkNS37FdwBy3KW2AKY
         77OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmQ02SE5nrfGt063INsDHwhqG9PFaM06l4gRU4+tXLVbqbncTN+zBgkRrWzh4hGqP439HO/odRnlVEgQ==@linaro.org
X-Gm-Message-State: AOJu0YzqM20FATAZjIUCmwyQODuL1/thkNXYg9H0Gw4uKGuK1j8cEtc7
	1bysRmYjThlr94otgbZaLhdjawI39IuwXxiykdSOdtGlOhQ2yhygd7TRe9fSAP4rFQ==
X-Gm-Gg: ASbGncudMMO0wD4UaT80GNQGaw2rTAuOVmGwRzzBJaRkZR5P0HW6Ek2UcQ3378Akn1f
	lFLa0ogVKJcXwGeVPxeg4xHeQduXBIKVy6XchLXl9a/uFP5hIRPclZ8xdfGYlQ+V6onaatfmhp3
	Z3/Z5nSNEXYgt+EHxiauQuXRuuJD29LYrdFzNq4G3Vr3ZXFStSPn9bxdqNTG9rUH61hc6LImngf
	zul5FIYVDsGi3PfW5YtmUDZy2bQNtR7cXvIjdNmGLgnfa6DJGxju18cchKo7pBTje58XZvo0yzI
	oDebCuYCsfAQ+oikkr5IU9XokM8HW3JHjEadJyY8wmnPZwUxv4K8PfvzXXdC/1D4u6KW0cFTo6p
	+Bc3r9TnkmJNvoDcR1YI=
X-Google-Smtp-Source: AGHT+IEb7W4XBFmFEhZG31hXLd/jbpvC/D2LAFzvhuQzCuKj/Jx5+ik3gvNxS8uoJP/MyCfpY0IfvQ==
X-Received: by 2002:a05:600c:1f96:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43ec44368bamr23023775e9.22.1743693552453;
        Thu, 03 Apr 2025 08:19:12 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226e9asm2092670f8f.94.2025.04.03.08.19.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ani Sinha <anisinha@redhat.com>,
	Udo Steinberg <udo@hypervisor.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>
Subject: [PATCH-for-10.0? v2 06/14] hw/arm/virt: Remove pointless VirtMachineState::tcg_its field
Date: Thu,  3 Apr 2025 17:18:21 +0200
Message-ID: <20250403151829.44858-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zpT+BVDeopx2

VirtMachineState::tcg_its has the same value of
VirtMachineClass::no_tcg_its. Directly use the latter,
removing the former.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h |  1 -
 hw/arm/virt.c         | 13 +++++--------
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index c8e94e6aedc..17c160429ea 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -150,7 +150,6 @@ struct VirtMachineState {
     bool highmem_mmio;
     bool highmem_redists;
     bool its;
-    bool tcg_its;
     bool virt;
     bool ras;
     bool mte;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a96452f17a4..c0748cbb95a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -710,11 +710,12 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 
 static void create_its(VirtMachineState *vms)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const char *itsclass = its_class_name();
     DeviceState *dev;
 
     if (!strcmp(itsclass, "arm-gicv3-its")) {
-        if (!vms->tcg_its) {
+        if (!vmc->no_tcg_its) {
             itsclass = NULL;
         }
     }
@@ -831,7 +832,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                             redist_region_count);
 
         if (!kvm_irqchip_in_kernel()) {
-            if (vms->tcg_its) {
+            VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+            if (vmc->no_tcg_its) {
                 object_property_set_link(OBJECT(vms->gic), "sysmem",
                                          OBJECT(mem), &error_fatal);
                 qdev_prop_set_bit(vms->gic, "has-lpi", true);
@@ -3357,12 +3360,6 @@ static void virt_instance_init(Object *obj)
     } else {
         /* Default allows ITS instantiation */
         vms->its = true;
-
-        if (vmc->no_tcg_its) {
-            vms->tcg_its = false;
-        } else {
-            vms->tcg_its = true;
-        }
     }
 
     /* Default disallows iommu instantiation */
-- 
2.47.1
