Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1025662lfc;
        Wed, 11 Mar 2020 10:23:53 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtmvcBsyC1H+w9DryXg9hNaQHv1QQsil7RfcQLOelAfrXfuDF/4v09CEnP3mTYTapmbOyFC
X-Received: by 2002:a37:5f07:: with SMTP id t7mr3665846qkb.159.1583947432801;
        Wed, 11 Mar 2020 10:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583947432; cv=none;
        d=google.com; s=arc-20160816;
        b=MvghfSivm9nzQ0Jhb3CbNJd1wL3Hv0VvzAFb5yL33lPvC0G9yQGjKHHj+vtYwqG5hm
         OuhS/oQDnyZcgNUjsAKcrWcmAQCqajRGIDJe5kVLRnUfbm5ZTEMPqQuzhNRb4vbFN6m0
         dBGUO3SCa+NunWiBX9yVuNaGADPvsUfOo7YhYqRjxLKslr9Ia7n3zkwP1crauvLF4jND
         V9mFAUBcE8QKa5M3mBZS7P1AsZU5c1i9NLZwWnxY1oe9Jiqj8T9nmM+OihKRDyYWgPqo
         rgKNYPHpaaWyYwk3P1kKV33Xu9NCyMPjqmHv6fbjwUYJnYi2OLYpFH+qO/pyxf6U7izl
         rWUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=IrZ3juTJjhKOHh+8QdnWcI2Vi61j1C4xGfE1L8PWVO8=;
        b=mBkrjW06GRv110wPly2kL1tdKehunzemNW16Iq6H4Ypvgov3e5ZnHSjqRbnB40fOaP
         tzlOEHvfnRHsqfySFzvhWPWhl74ky4GoyAm1xBeKVVKaeN2j88RzJFYtP51VNgYgVQ7M
         co4RuJpM28Y1X4ULukPa7S6bU5MrxEJQ+pMYr3UChR3f4AkqlWoo11jLi2BbGBqpSs9g
         IaxKleVjs0+u24ATDF2D2fkheTEcNnPiW7m3yW1KOB/timPDI2OQObaTsQPIjgS/J27r
         Tu6iWyAUY9msTeDxvNwv2jenEzU2Fc9LPxknMK9Ub8riVQ9afCv5r6KS4lAGja/+aCEn
         giNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si1263874qtn.201.2020.03.11.10.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 10:23:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC55E-00023l-8Z
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 13:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54x-0001oa-Al
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54w-0003YB-6m
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 13:23:35 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:35150 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jC54v-0003RM-QM; Wed, 11 Mar 2020 13:23:34 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7F7603546F68F1E5A408;
 Thu, 12 Mar 2020 01:23:24 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 01:23:17 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH v3 01/10] acpi: Use macro for table-loader file name
Date: Wed, 11 Mar 2020 17:20:05 +0000
Message-ID: <20200311172014.33052-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nNRGNiWW7Vaa

Use macro for "etc/table-loader" and move it to the header
file similar to ACPI_BUILD_TABLE_FILE/ACPI_BUILD_RSDP_FILE etc.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/virt-acpi-build.c    | 2 +-
 hw/i386/acpi-build.c        | 2 +-
 include/hw/acpi/aml-build.h | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fb4b166f82..c13710b727 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -929,7 +929,7 @@ void virt_acpi_setup(VirtMachineState *vms)
 
     build_state->linker_mr =
         acpi_add_rom_blob(virt_acpi_build_update, build_state,
-                          tables.linker->cmd_blob, "etc/table-loader", 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
 
     fw_cfg_add_file(vms->fw_cfg, ACPI_BUILD_TPMLOG_FILE, tables.tcpalog->data,
                     acpi_data_len(tables.tcpalog));
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9a19c14e66..80f05d728d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -3043,7 +3043,7 @@ void acpi_setup(void)
 
     build_state->linker_mr =
         acpi_add_rom_blob(acpi_build_update, build_state,
-                          tables.linker->cmd_blob, "etc/table-loader", 0);
+                          tables.linker->cmd_blob, ACPI_BUILD_LOADER_FILE, 0);
 
     fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
                     tables.tcpalog->data, acpi_data_len(tables.tcpalog));
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index de4a406568..0f4ed53d7f 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -13,6 +13,7 @@
 #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
 #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
 #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
+#define ACPI_BUILD_LOADER_FILE "etc/table-loader"
 
 #define AML_NOTIFY_METHOD "NTFY"
 
-- 
2.17.1


