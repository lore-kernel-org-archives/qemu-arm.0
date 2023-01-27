Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1232545ejc;
        Fri, 27 Jan 2023 07:16:03 -0800 (PST)
X-Received: by 2002:a05:600c:5108:b0:3d3:49db:d84 with SMTP id o8-20020a05600c510800b003d349db0d84mr39152200wms.20.1674832563155;
        Fri, 27 Jan 2023 07:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674832563; cv=none;
        d=google.com; s=arc-20160816;
        b=g0neXd2pHlTXEbW/BZOMJJpxpj1xsOkhGRG8h2X9S8kJpniKSRZD8DSMTWHSq32Qnp
         Q1X6Pbl3+g2dmJnMvuLY1VJ/whFiVVksQiPikSEItC8qKMmf1xWdAOgGsRgirfDOwNLZ
         WC0l4P/uGG6jc1TcmGuq3UuF2kGHsnnYKxFGSorMDTYyx4g9QzeZws9t3X9cewrHtJea
         hkqAHICrlHbZL+VhsLIFgo3wgsdur1l8R0ZfX692Uzx+yWRAzgw/T/d05cIxUPygDWik
         rnRYW+Sw72iK7uvpL0Scf5auRE/mpBgrbNikrfVN9YJ3j+r/9ecYWHknTbpvadVuQV5c
         EMbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yN/IgYT7Bxizcp4NnY3jkl6JyQXTtY8B5IgNc586Emg=;
        b=DL/KJtRhshWp2bvl5dYg4ATJXgRiLfheeiz1LleNiRWeFIjAot/4cO4eofAsOURfE6
         SCFDbcs6AHugR1lYXCwM1g/vl9ha7kK8y6faQS5r26uhfmjqX8CjTCL7AqCs222IhAYG
         vDj54nhl+F5T70Rpw9Mf0+1RpFI3LT3KJDvNtB2iCs9qZ5VyVNw3uZiRGNjOXmJXnSPz
         Vsmy3E/ZxePRIINRaMRUWAwj89mp7foe/Sg5c8iYEqCmi7KCUMD2aIH1d6595qLdTzMK
         harwyhMPdemD7RxSbZuQ4va2C6sYo4aP4fcQ6JnDu1HNhpYOG3jsbA6l9S9gSrrmcPze
         egjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UAsixQwz;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l3-20020a1ced03000000b003dc3b2798d2sor603429wmh.20.2023.01.27.07.16.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 07:16:03 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UAsixQwz;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN/IgYT7Bxizcp4NnY3jkl6JyQXTtY8B5IgNc586Emg=;
        b=UAsixQwzgDyNIcVfWpUt1IExJTdgLVxEQM++00szC9M3dgomol8l+EKRsv+VEWGyHA
         dEF6gWNQt4u25ymCvtvtwnZqgrdj8/5V2htCBUSrGS/rpuG+zprq207t0Lm0hfEQqw0P
         VMHEKz2jDbS9lK8UT9TAgWuHOeVBONylvkfOfw78vgefYYV8nR6azgjkL0+oSXmI4e2v
         9MUBkAKyLY6EFdtsKcCVvGBCJXyEdnBUaBTaWrvqVuADtBu1HuCvgZ9wbHMBzCoF6Qa1
         ofTakgFOIASDxfaGDDl2rBDE1NOCY0UreQ+XqICGeis5lny8ye6OXdg/eP6IM/okwE7Y
         ziCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yN/IgYT7Bxizcp4NnY3jkl6JyQXTtY8B5IgNc586Emg=;
        b=V2lWQwZZQisK25zdxotFzpKSphjjKpqZFEs8cu7inv70vFxncD7LN7kVDXybYjTM/W
         rGu+kfKjUUsD8jFFILQfRoz56XUiQTVKoIH8T0vfWmiun2VDIqbA3P5KpCyFu8+qHZWH
         1q+3/idxJRsZx2pOqzc+dKU3YaMc/wH9FC/svpT+2Wo8YptlwLhfTOQui3Wv1zouUfQG
         FlHtbLXfmIshTh1ZIA92z2Ol+RsLBRfOrks+ssPi7hX9qXnQXzh+M1ZhhjnoZW/0Y0uU
         b7BEkXg4IHt0FkX7Vl74pwSo+JzexA9qYqDUnWLV3rO7wIoZvR82j0hVaqdADzEu5fGu
         vTBw==
X-Gm-Message-State: AFqh2kqICMcOvmr5Bff0nB5CgxX7ZUZF2Yy3r4UJEwiuSZzfEuVVk9+l
	cDpwNUlWtIiHXigpi4CbrH2QZ4Dj
X-Google-Smtp-Source: AMrXdXsGCl71/OUR43H8df4O6Jk1VGJQyA/zIETEzCmiuAC0gZNrO0vzJT8cEtddK2NOBpci8oXUTQ==
X-Received: by 2002:a05:600c:1d8e:b0:3d1:ebdf:d586 with SMTP id p14-20020a05600c1d8e00b003d1ebdfd586mr38542105wms.29.1674832562907;
        Fri, 27 Jan 2023 07:16:02 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain (054592b0.skybroadband.com. [5.69.146.176])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c47c700b003dc3bbdf518sm1656628wmo.21.2023.01.27.07.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 07:16:02 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	eblake@redhat.com,
	armbru@redhat.com,
	berrange@redhat.com,
	eduardo@habkost.net,
	alex.bennee@linaro.org,
	richard.henderson@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH 09/16] hw/arm/boot: Populate realm memory with boot images
Date: Fri, 27 Jan 2023 15:07:22 +0000
Message-Id: <20230127150727.612594-10-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230127150727.612594-1-jean-philippe@linaro.org>
References: <20230127150727.612594-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 61Ytk2NeW4Ox

When using the Arm RME, register the images to be loaded into Realm
memory at boot. Two operations are needed for each image:
(1) INIT_IPA_REALM: mark the load addresses (IPA) as RAM with
    RMI_RTT_INIT_RIPAS.
(2) POPULATE_REALM: move the page into the Realm with RMI_DATA_CREATE.
    Its content contributes to the initial measurement.

The reason we separate (1) from (2) is that we may need to declare more
RAM than the image size. In particular booting arm64 Linux requires
reserving additional BSS space after the loaded image.

We could declare the whole guest RAM with INIT_IPA_REALM, though that
might be wasteful in terms of stage-2 mappings if the guest is not going
to use all that RAM.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/boot.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 15c2bf1867..115d3f5dcc 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -25,6 +25,7 @@
 #include "qemu/config-file.h"
 #include "qemu/option.h"
 #include "qemu/units.h"
+#include "kvm_arm.h"
 
 /* Kernel boot protocol is specified in the kernel docs
  * Documentation/arm/Booting and Documentation/arm64/booting.txt
@@ -192,9 +193,11 @@ static void write_bootloader(const char *name, hwaddr addr,
         code[i] = tswap32(insn);
     }
 
-    assert((len * sizeof(uint32_t)) < BOOTLOADER_MAX_SIZE);
+    len *= sizeof(uint32_t);
+    assert(len < BOOTLOADER_MAX_SIZE);
 
-    rom_add_blob_fixed_as(name, code, len * sizeof(uint32_t), addr, as);
+    rom_add_blob_fixed_as(name, code, len, addr, as);
+    kvm_arm_rme_add_blob(addr, len, len);
 
     g_free(code);
 }
@@ -683,6 +686,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
      * the DTB is copied again upon reset, even if addr points into RAM.
      */
     rom_add_blob_fixed_as("dtb", fdt, size, addr, as);
+    kvm_arm_rme_add_blob(addr, size, size);
     qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
                                        rom_ptr_for_as(as, addr, size));
 
@@ -964,6 +968,7 @@ static uint64_t load_aarch64_image(const char *filename, hwaddr mem_base,
 
     *entry = mem_base + kernel_load_offset;
     rom_add_blob_fixed_as(filename, buffer, size, *entry, as);
+    kvm_arm_rme_add_blob(*entry, size, kernel_size);
 
     g_free(buffer);
 
@@ -1119,6 +1124,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU *cpu,
             initrd_size = 0;
         }
         info->initrd_size = initrd_size;
+        kvm_arm_rme_add_blob(info->initrd_start, initrd_size, initrd_size);
 
         fixupcontext[FIXUP_BOARDID] = info->board_id;
         fixupcontext[FIXUP_BOARD_SETUP] = info->board_setup_addr;
-- 
2.39.0
