Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1550846lfk;
        Fri, 10 Dec 2021 09:09:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsImt5zXFrntSeI/B6XYJQO7ORFw76trq3JPCgylgxwS/B4kenUzTrfTo3uSw+sbWiBkjP
X-Received: by 2002:a05:6000:1862:: with SMTP id d2mr15701473wri.251.1639156193633;
        Fri, 10 Dec 2021 09:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639156193; cv=none;
        d=google.com; s=arc-20160816;
        b=LILXJxS0izIkfvjwGqrHDU93IGTL65kPFb2S4utZXocSGub5WoP+47gs/M0BRLww82
         3q3HsUJLB8/XnrelN4sIRR/xodRoC/xTqXccYsSUMfstO0aRoW81J0BVsqth4mHPRU3H
         Om6N9J45n5ioBKIB8TFbk0yIGCzT+Ns8T2gVh3XPnEfmmnkJAFry/Tv8i4cRduIDG51g
         VuGSt0bSc0+FYZbTGwrvcxFODZjqEg8tk/PAP3uDU5FId3m30W3TGgbp7gT1iPAeLoKZ
         0sfW2UR56zP25ZLV73+cvjihDG9OcPctCwO33SvnWw+MbKWdTtU2mRfy+E2wSVY2x/uc
         bfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RZYrOTlTize273kRDCgsOSabJUg4Thn9EplwiX40QqE=;
        b=IFGrEr3mB4+KUEm/e8U04shP3owBh2HHrE9ISBRnU4oSjuG3yUTP/uS0DSe1aNgP4y
         VGpRIUAMTYxAVuDDrPV3zF3icox5gDObIeQYcAAtgvxCdKrDe8X6Op0w9gNYrHRkrUDi
         Nv1UPK9bGGbstQM/CBw+EzmVmK+JvrSEvyr11ny/fYTach57JbktPC0j/u0+p1hxaAcQ
         zXze/BdEZRX7qXYHZqf0joNqdOO2M+u112ay6Nn/2IICIh6QylRiBAGb2tz5gVY9MA3F
         XR2xImJZedZJQLNYZBIivQlUhj7cQBdpIZEO2kY7NbMdtLs4a4ZH8QPqVEPLFnP6aLZP
         +p8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zRieCPc0;
       spf=none (google.com: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si6125188wrq.776.2021.12.10.09.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Dec 2021 09:09:53 -0800 (PST)
Received-SPF: none (google.com: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zRieCPc0;
       spf=none (google.com: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org does not designate permitted sender hosts) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mvjP6-0002zB-FM
	for alex.bennee@linaro.org; Fri, 10 Dec 2021 12:09:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLL-0005oa-Rh
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:06:06 -0500
Received: from [2a00:1450:4864:20::534] (port=43790
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mvjLK-0006QZ-5a
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 12:05:59 -0500
Received: by mail-ed1-x534.google.com with SMTP id o20so32376685eds.10
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RZYrOTlTize273kRDCgsOSabJUg4Thn9EplwiX40QqE=;
 b=zRieCPc0wjXAXswALgOBEXD5yw0zQ/C4scJuDI+y+gHD7LGo9pLaZQNoRhc+3/PyuE
 +EMJ5+UiduqNSopqv0qdRwnvkalaPbxU1775UlXDIiyaiq5nDfHQpQy5g6/p3CUF9T0J
 8DIT+TVkciZz20iQk9dW5vvJYRDHKWfMKaY0pNptP68CWXn15fmOIL7S0M+G/2H9zNkU
 JTOfCu3akXThV/WhQBZhOnITwwd/9PsPlgGK/exEtqnnZfsAr0aPQslS4jsh1CjvMsX/
 UiHDyGBA6luM24R1SX7ciupGLd6NBfMuHfXhT8O4WI1aTstl1IEFtFrEbjOWEmCP6SBk
 cadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RZYrOTlTize273kRDCgsOSabJUg4Thn9EplwiX40QqE=;
 b=OawhWUcyUeyJDjiFYXkbbUax9ySPDBYkMIqrK2nVU+w3LT4pFjpioeTQul5JVB0hw3
 pMU4BAxAi2v6pB1TdCPtIM6R9uT40HlJRUpbFU7OYMvA/63XII0L4BVicqlyChV9naRc
 81q6QgGWvgfqmj2hxUFUDVWVFdaNe4rYtycY/3q5C/Bijb87KFiE3tz1k05IPhiWsApS
 8ORMUtkM3JNtxhl0MD86o+sBN4l2YaDaJ93biVzQ5TjC5m0nDGrf/Yo+XybdZW38R+Tp
 3Skt4+rSmCzBBUwUr5MpsxkIuGtiqAhuuVPTX72b3pMH+Yxs7GRnSaWRs63FoM/S3ONM
 McwQ==
X-Gm-Message-State: AOAM532lbNsg6XnDfS7KNxjE9je0+s0d3a8p8Ni7wjgSfdyOBsGzwiks
 zCrkngGaXcfLt2vmY9S4luXAZg==
X-Received: by 2002:a17:906:fa87:: with SMTP id
 lt7mr25701801ejb.426.1639155952779; 
 Fri, 10 Dec 2021 09:05:52 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id x7sm1860661edd.28.2021.12.10.09.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 09:05:52 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: mst@redhat.com, imammedo@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com
Subject: [PATCH v7 1/8] hw/arm/virt-acpi-build: Add VIOT table for virtio-iommu
Date: Fri, 10 Dec 2021 17:04:09 +0000
Message-Id: <20211210170415.583179-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211210170415.583179-1-jean-philippe@linaro.org>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: ani@anisinha.ca, eric.auger@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jean-Philippe Brucker <jean-philippe@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bqElkMrIwqdv

When a virtio-iommu is instantiated, describe it using the ACPI VIOT
table.

Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 hw/arm/virt-acpi-build.c | 7 +++++++
 hw/arm/Kconfig           | 1 +
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 674f902652..d0f4867fdf 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -55,6 +55,7 @@
 #include "kvm_arm.h"
 #include "migration/vmstate.h"
 #include "hw/acpi/ghes.h"
+#include "hw/acpi/viot.h"
 
 #define ARM_SPI_BASE 32
 
@@ -1011,6 +1012,12 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     }
 #endif
 
+    if (vms->iommu == VIRT_IOMMU_VIRTIO) {
+        acpi_add_table(table_offsets, tables_blob);
+        build_viot(ms, tables_blob, tables->linker, vms->virtio_iommu_bdf,
+                   vms->oem_id, vms->oem_table_id);
+    }
+
     /* XSDT is pointed to by RSDP */
     xsdt = tables_blob->len;
     build_xsdt(tables_blob, tables->linker, table_offsets, vms->oem_id,
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d37d29f02..e652590943 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -27,6 +27,7 @@ config ARM_VIRT
     select DIMM
     select ACPI_HW_REDUCED
     select ACPI_APEI
+    select ACPI_VIOT
 
 config CHEETAH
     bool
-- 
2.34.1

