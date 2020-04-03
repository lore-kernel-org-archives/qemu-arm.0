Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp470063lfi;
        Fri, 3 Apr 2020 03:20:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJqx6krk0IZpsShFgX26hzC8One6MgspBrEPHHBDfuiw7hs4Hmp2w/x9qwRiyi6smGXy9WJ
X-Received: by 2002:a37:6e46:: with SMTP id j67mr7697108qkc.155.1585909208361;
        Fri, 03 Apr 2020 03:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585909208; cv=none;
        d=google.com; s=arc-20160816;
        b=j5/YNc/ZYbGGPdyK/SatGX9et9IBL5ZzaBBxyuvxaIoRQUfCZz0X5WGOE0YlF1KgQA
         oe1lblGNue1Bw5P/Y65OmxUtuRZ22mN6JvXSUI5YWPjFgxaHpbcjPH7oNQyDiZPlshKU
         KnH/8IhOu5/qfoiXstlIUfFmDQ8Vchkp53qrHHl0sZWcGKm1908HNrT3I5tfiC/pMc6P
         71C/ESksDK003e7ZmUGNNdFGnALKMbIvekbgcA58JVAFApB8tw3T06svdoKgheRVaZP4
         xsseE5cWZsl/lNvaUMY9t328xHsh4HqoQtthHUuMYNP28aAS6c8msgXw0FAA8Vgf3tyj
         UdBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=03uQ+dj2JgryyO3ADbA5Mb9GveRHlXJTpyoD8u33LPY=;
        b=Obx6vlFeWMKiBI7n+IgMTRD1XBFjIC/Vokq0yDySNA96w6dUVbCy65nfCa73hsyYs1
         5vJ7XtNbUPj06pYI+jp4J0/XmWEvQRwxBPdXrMHIqNwZkYEPxGSXCMkuSKXAiR5nqGAE
         bt8pqfr7bUWKTLV2heJHk04dB5lS1R7gRziZ+//WstRKPkjGpnZWrXoPTbvQAczNyQ49
         FyV8ow2NtAFKS1MTstTjnYBmNo94khEa4yZG3nGTUmcQk+3ZwQNaMI7nS0+1mK7c1i3W
         IBmtqvEIQBxNenMsIOlX8207abeZDUVbDfP+7c7mr7kWK4l5iTEt5k09H7hYNBpVctKc
         n2Hg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si5201774qki.28.2020.04.03.03.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 03:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKJQl-0003ae-P3
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 06:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35845)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQR-0003Mz-L2
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQQ-0001oh-Is
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 06:19:47 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50350 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jKJQQ-0001kF-7I; Fri, 03 Apr 2020 06:19:46 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5692B4E3BDC0BABAAD09;
 Fri,  3 Apr 2020 18:19:39 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.24.31) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Fri, 3 Apr 2020 18:19:32 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 v2 1/3] acpi: Use macro for table-loader file name
Date: Fri, 3 Apr 2020 11:18:25 +0100
Message-ID: <20200403101827.30664-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
References: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.24.31]
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
 mst@redhat.com, dgilbert@redhat.com, xuwei5@hisilicon.com, linuxarm@huawei.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /usbqPLkiA/U

Use macro for "etc/table-loader" and move it to the header
file similar to ACPI_BUILD_TABLE_FILE/ACPI_BUILD_RSDP_FILE etc.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c    | 2 +-
 hw/i386/acpi-build.c        | 2 +-
 include/hw/acpi/aml-build.h | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 7ef0733d71..81d41a3990 100644
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
index 2a7e55bae7..23c77eeb95 100644
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


