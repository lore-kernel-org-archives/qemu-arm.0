Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp4185446njd;
        Thu, 3 Apr 2025 08:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKLpsv1t8qe05mV8MANvXgGPCMSrJy74mpsfzNk6/7yiO1oWBTjMaxKLaSUzieLaHY30mJWozmfjYNPw==@linaro.org
X-Received: by 2002:a05:600c:4f45:b0:43c:fcbc:968c with SMTP id 5b1f17b1804b1-43ec13247a1mr30921805e9.7.1743693565819;
        Thu, 03 Apr 2025 08:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743693565; cv=none;
        d=google.com; s=arc-20240605;
        b=imzBmMa8H+j0ryAYtGx+DmmbgNlnqtknDw3gwD2MYoPZRBdlb+qyWnmE59ocCAtsgf
         dc63Lqvr4x83pik5ySKLKyGQWaaq3DVavfuge3G4zd8MoQfYLxO37wE+gGq+utEfIoPw
         E4SHV+BogIxz4d0AK+i12dUK2+2v0R514ET5zvaDX3oS1hxwrdi8/FnAY7em/mPemghs
         RTZr3Nn+9vgWWQ+bjLDSDraRTYkPy2WgtddmvXq99kTB4XfsfjjzEOw/A7wERH9yFLnd
         55J56DC7z3KPJeH9KFKvoQihm+STx2vEAzIvy3mSLDoUP4mhan9r5Rqgg7x2/JSC5+68
         +DKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=s0+RprBk/o3T2/onsX07N6cNtjoQucUjnD/IYou/K+s=;
        fh=7Km6zneWRXN8mGUbCJnoN4SN+u9dKAwrh150LtVYozg=;
        b=BjpHjrFS/FXfTfGOwf1OVP+6PZW4EmY/B7IU+gdBt+Y56ZSP4BjJtK1dzcf3jXxSjE
         yFgNyFis5bSk386eNvycxFW87rX4fVm8O29ZhdJff1AxVghQmH//v6+G+nE2kp/3FyRP
         BlYVivZvFX+411Xy644z55RRNsePdt46U4/LrnUoQuAnqvBSsBv4qZR61U+SZEAei5zd
         hCWyP8RDOu0LEFw+WOdgdZKL8QtzI6xcU3l1ENSSSS7IuygxJ7Nwe2mb/GjoWh/Hwzr3
         l95Wy//nQyuY3a0JEd8kjzJAfNEcMPexPg3HMycOziHJ79kkvaWKaGARKirsdCxugUGx
         vqWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w6/xKvzb";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43ec2c5f4cfsor8001225e9.8.2025.04.03.08.19.25
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Apr 2025 08:19:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="w6/xKvzb";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743693565; x=1744298365; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0+RprBk/o3T2/onsX07N6cNtjoQucUjnD/IYou/K+s=;
        b=w6/xKvzbKfJmIxNy9D2wnIfcyEXIBYdnr2rg/yKYTOlqylqQQfWKa3OgyaHqfmzId/
         S964lpYVqLhraQdA7kz0X9YhyskOWsPMqgj3lEjr/XBtSee54yaEI0LmBZ2g1Xrk6TTV
         k4J8/rixKecCMKtyE3S1Ly0Eht0mzC2yuJXa01XhgqkfyFnkP8HIE5IG8FwNTbVJ9bA6
         bnXubEQcs2VyL7tC3luwLzjIP+jOGQcfVAScas6WPqstkmKbX6dADmTozja5pToj1cSP
         YUPhO2Y8emIgiET+kk7o5GLmGT9umBknbEvy/IZycaTy+o9cgemZfN7zdiT/z0/qL698
         Rttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743693565; x=1744298365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0+RprBk/o3T2/onsX07N6cNtjoQucUjnD/IYou/K+s=;
        b=ZAMQ6TKdxkNQpXQhccQSdqRe1gH4Ayn8xGnSZqFbiqJUTDU5kBIoZgX0rNPE5kR2G3
         I4kyiNfUQLznqvaHR7NsyxUbSNn/XgXwf5YJ99Ac+XkcKXr2R+hDk4A77R6PoIRL5skd
         7pldBKqwwvLMTzncOgMwvRQYXiybs5COKkFLRMXOCa949XVpI2OdYVqvrdBULL8liPUO
         SZxEETGfP7LlF0nS0+S/Gv2jQidzcSda2bR+nlYW8aEnqRJ6mcyaRdJaM5r1bXOgsvu8
         ELOvESeTnW4ajAWZf06qiXinp0klp5RX3S9Egc7ySzjx2I0cDQTVVFaI/0Dj0PpnKN+D
         LMPw==
X-Forwarded-Encrypted: i=1; AJvYcCVUjoNg/sytVVj+C0zlo+eQ3zyYodYrB9rGyYhR8HFZmZGxOTOZJwDjg6tWvt5iKGXfgZW2fQx8uy6zzQ==@linaro.org
X-Gm-Message-State: AOJu0YwQeoP2HZliUyvomB+X1MgZcwMlSpgCT1wVHBHHtUxMPDTU7hdx
	tktO/JH5QhRhL6FoaFeK2XyGRo/6OTSOPm4o/FvSyBLUdqb1fyHB0CxEWWqIo7OMeA==
X-Gm-Gg: ASbGncvGxk1q0BrFJzw/35cUyETRxjtEElLcmf2L4FmDRHW9Z1LQrs7xDoi2k56/Yju
	tGCcuDc4aNI9wCwoGAC+kFRp1z/FMVmS0SDYlAnasNMEOZdJ8lMxmktWy8mqRnjX2okiLhLES+f
	hWBNtz6Cc1hphXEg41SSRMm0tZx4pv4C962Chc37aaZWiJW9IRwoYxNJh3m7YFR3NrLVTfPRaut
	/Kfi7CpAa09EktEJqMJEx40vXKB2ljhRGR5sR9i+DfhbUw5SzAydunBexrctBsBiS9LAbjljsLV
	Rvl9iOJd1m+ozVjxpntwSB4Ni2yh83Vxi4E8Vwl/PMAa40X40qoMu+QE7P+oJob6L7fepOep8KV
	xfaMxLLsTcyPHGWmvzIo=
X-Google-Smtp-Source: AGHT+IFQaLyp+VASftM/8c+uxflaQY/ts8/JzD3JMKwIVNijGxWUU2GZ/7P7QgHgIEU3FdsgF25K9Q==
X-Received: by 2002:a05:6000:40c8:b0:391:2c67:798f with SMTP id ffacd0b85a97d-39c2f94c014mr2681507f8f.41.1743693565261;
        Thu, 03 Apr 2025 08:19:25 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (145.171.88.92.rev.sfr.net. [92.88.171.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36691b3sm21460425e9.34.2025.04.03.08.19.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Apr 2025 08:19:24 -0700 (PDT)
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
Subject: [PATCH-for-10.0? v2 08/14] hw/arm/virt: Simplify create_its()
Date: Thu,  3 Apr 2025 17:18:23 +0200
Message-ID: <20250403151829.44858-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250403151829.44858-1-philmd@linaro.org>
References: <20250403151829.44858-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /zOMkJ+lgrb7

No need to strstr() check the class name when we can
use kvm_irqchip_in_kernel().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c0748cbb95a..d17755548e8 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -711,21 +711,15 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
 static void create_its(VirtMachineState *vms)
 {
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
-    const char *itsclass = its_class_name();
     DeviceState *dev;
 
-    if (!strcmp(itsclass, "arm-gicv3-its")) {
-        if (!vmc->no_tcg_its) {
-            itsclass = NULL;
-        }
-    }
-
-    if (!itsclass) {
+    assert(!vmc->no_its);
+    if (!kvm_irqchip_in_kernel() && !vmc->no_tcg_its) {
         /* Do nothing if not supported */
         return;
     }
 
-    dev = qdev_new(itsclass);
+    dev = qdev_new(its_class_name());
 
     object_property_set_link(OBJECT(dev), "parent-gicv3", OBJECT(vms->gic),
                              &error_abort);
-- 
2.47.1
