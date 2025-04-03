Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4376909njd;
        Thu, 3 Apr 2025 13:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVMIG8+vG93E3G1uIUFt9mvmRCIJBcbuwbp2Ho0ikqFLcF8W64ToCEtcwhWjtdlUilPiSMNsJHgZGKtHg==@linaro.org
X-Received: by 2002:a5d:59ae:0:b0:39c:27cc:7ba3 with SMTP id ffacd0b85a97d-39cb35aa8ecmr665674f8f.33.1743712837328;
        Thu, 03 Apr 2025 13:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743712837; cv=none;
        d=google.com; s=arc-20240605;
        b=Ett15yhsWRGXciEH+439IZz3MtCQ1qPQl7Hy78AbRwt9jq/NhWTt60NHalzqvSfelt
         HUHyps/FnxEXce1xCsWMV3JUNukSjZiDoNtObDxV+HRcoORpA9ZLY5pQA7xQtZx1/H3W
         WSUOp8m+COW0CKd9E4APhBnRzVX7ChFS+m1z9w/LOC/R3ii1lV/18GyDGpkXwpffamzI
         d5VR9utaIXU17mBbqjHBlXQ39lOaHWrz5Ar1jzvtBmFV2PITK61oLJibn+WexzPMLn/I
         eTvAtHrh7aHsaFz011RXyIMe0b2YvgFLNrooZS/UPJKOZaDw2PXNe1xRIoqnCdLBs3n4
         Kgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=cla1lcEde+/dwIvUCkqYoXlnQEk1tsR3rIU5tsr/g9c=;
        fh=hdsi0tgd7JL56YFOkDkpZQr1Ku8VAUpSmqijBhoRj4w=;
        b=f0OiO0GsXnmL7Rc4ewLsSoMv6Qzz609sVNokmQDwI+bLxizPqLGr1OGGgtbOAVjQRq
         EbCDii2BXsyhPR0TIRgN0xn8RrBKbUHpTSIT12A1Qoxibn7xOmD7m0Z4osp5RmP/x2Dj
         4+EjrVhazZknWLwgs8LJFQboG8PcWLGu9JLgh5n4xAbAsVW40N3bMWgSNuIIuzaiBySs
         VmKIAbALUXIlaqmdtev4dKpwskHCRmqMEPRvo0qrAMGq2ANR9ac3uam8KumZetKT0xWa
         HcfKk+vFMkJ0vZfMfACrbe1OfCKTN+5lOCCwH/5CW/8ImF1wm+/8BT1VmBtE0mrKYbSW
         mAjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DNTk9oZL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-39c3020741dsor713373f8f.6.2025.04.03.13.40.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 13:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DNTk9oZL;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743712837; x=1744317637; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cla1lcEde+/dwIvUCkqYoXlnQEk1tsR3rIU5tsr/g9c=;
        b=DNTk9oZLKv8qFjkdwwW868BiEUARPLaYfG3Di2uc8/gmQ0+h4WNTlI9hkJGwWfc7C3
         JvIbhfyCfqQOCEUo2TblAR8Wp1zrJlaja8VVYCukWorvENR2gfRHlZC4r6cyllbIpGrN
         aT4wZ8CtixMNVxavX4b1YtVFwt1Qm4E1MbUNmZiFadsYmZpLNNdfHrypQ5Vj+GCUDSP0
         d2zgsJ8y9+ads4H/y4Wp6nDU5Y8MrS7846u0snBjPrOh82cwxvI1IlWM+qzvkYhYe3pA
         F9bYdcSyX+BY6P6ktIm+oHtC/vuv+DxDEGXIGJLCoA6Xcm+Y6eSpcmMaN2291/jd2S4k
         xkVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712837; x=1744317637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cla1lcEde+/dwIvUCkqYoXlnQEk1tsR3rIU5tsr/g9c=;
        b=Vynbb656Guk78IVqFny/kdbc3XtCq2754jC8kjh+1ti1tn2ix6vI1kVMAtsM69nhLY
         ciBQ/Qzg9UTbdVUm3ZrCuYmAgELTPxu39lCoY/Dry+Gi6kV7x5URMbwzRe9Oyxnb/r0W
         zTxlkER71Eb2fnS7haSdsbqdPwh6FqBpoiG1z4ma1d4cAS0Cbj0xEWsPihnvlrp8FqLL
         FJmuKqMQD9O2B7vmhxVkG82vhbdedOI08xlOALabzX7H0nasFhQVV3wvOIe2l/xqZRZg
         uJZJOc09hAnKX915bJI92KYctBQPojUqbAXFCIUIHC/Amn0fwqRtQdbfZ5Fft+oXaI2J
         ySNA==
X-Forwarded-Encrypted: i=1; AJvYcCW9x9IFx0ZL0pFhJtpPxEeZfwzTxEBmapEnKlE1CDflHL/EedXBl3mspVnxijULETIgQePI9a3t/VL/IQ==@linaro.org
X-Gm-Message-State: AOJu0YxbKwCxuyNqvxhY3fl8aBeiicMvwbT1iVtFx6Op+zgMnUWZmye+
	4sl0PHlUpTZ+e39vpQJV81TWQr8sfsu6tETwA3rj2He1eZdkvlHTd8LNDUGDecMjqg==
X-Gm-Gg: ASbGncsAhCWbbfGLRN63ahNxIM1bGJmpDx6o29QE9YHyPj6FrMQfBWne+w9we6ukm6T
	GFtsrWpw/aPXGa4xKEeI+4s7ypwqzffJrNYlgsp3wDm04qBAS+QRwYrASDOLP/+xAcV080nqvWb
	BnUPRc/DU+pZpHuYXzL0aR0M6XESlFVHWKbMICBH1MNk4cRpTZtgcYsdPxtnh8Wo82D2cTZQtlx
	eDK6Fokgla5oqrqDwf0okkdsDq1G9hr6JH2IQqv3nM6VWBf0cm72rEytBg4pcxxPFkxN9yVWnyI
	cH9QUvwRg+v3GX4RermKm6QU2SJyY95SlAv8yijABf9NtMBkeCMZBtxozzGcGeDJFz7dRkSN6/M
	ZMr+Y5uuVpHb7aLGinhkGLK97
X-Google-Smtp-Source: AGHT+IGq6MUAr4j6d4oFja99cnwBgM5fgWuSZdJ6FfKkZLO9wGdfJSDuz7LTmnOuzEJWijRc1JruUQ==
X-Received: by 2002:a05:6000:2489:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39cb35aaaeamr604653f8f.32.1743712836771;
        Thu, 03 Apr 2025 13:40:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm27264105e9.19.2025.04.03.13.40.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 13:40:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	qemu-arm@nongnu.org,
	Udo Steinberg <udo@hypervisor.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 v3 1/9] hw/arm/virt: Remove pointless VirtMachineState::tcg_its field
Date: Thu,  3 Apr 2025 22:40:21 +0200
Message-ID: <20250403204029.47958-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403204029.47958-1-philmd@linaro.org>
References: <20250403204029.47958-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RIgLmoeoJoI7

VirtMachineState::tcg_its has the negated logic value of
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
index a96452f17a4..177e9e0eadb 100644
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
+        if (vmc->no_tcg_its) {
             itsclass = NULL;
         }
     }
@@ -831,7 +832,9 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
                             redist_region_count);
 
         if (!kvm_irqchip_in_kernel()) {
-            if (vms->tcg_its) {
+            VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+            if (!vmc->no_tcg_its) {
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
