Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2955955lfi;
        Mon, 30 Mar 2020 09:50:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs9FNEsT+f4Y3/a3/PVRm1FIUMPy6Sq5VxWmHYF1aygDejE82E56+rNb6I4TN+lNXyz7ZoG
X-Received: by 2002:a05:6214:138a:: with SMTP id g10mr12822074qvz.231.1585587051285;
        Mon, 30 Mar 2020 09:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585587051; cv=none;
        d=google.com; s=arc-20160816;
        b=ndLteXChxosS1aDog0XTHFXaLCLlFv5JURl4YW1MX7msEcaKnQjEui8opCGOykqs0J
         OSF+ybLCr7F9WyVL4ja1p6pL/LyPrY6y0e+xNWoSb7emJftAEGg9rrTwHeAhNlkakWfK
         vB5nkTxtbpNPulMXHyPQkrbyEJRo3aRPGf8c4s+g7wyMdyGt8NQbCbqmt40ahRHaxfPF
         pNr0HruVG3TrUwm9dik671r70sELiNbLEzvvZIwR5SUgrj2zTMB31GLHpESiK9siytQF
         qpNd3w5FwltyjrC/HWWU4p4Xfk1Q+3yLZh9d5PwUD7TNWqoSbLdvlGYv8844OJjULOW7
         As6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=BGouYB+5ZoVvoJD3xPwg50MYQu2EhygV86HAYa8MhPU=;
        b=jW+tTgCqPbolqTrw8G+GEJ+RzPReieKp7O/1SXWbY6lqolkkJ4o1PaJjEyjqT1nw2G
         DHy9qP+EyspQhKRyk2rSA5GPlcUmqEeAqHgL7KTWsCJ+ZoVBQ1wAXHCY1hwmD8cRc2hl
         qThqGFvSUnL0ZhcEWLlt8Y4O90WSZUwgi86xHMxKSE/iWyy2llrTHDrRGgQ0mxWOVMUJ
         4fbPqkzzcJaNx256C0wC2Vj9QobsCkFr0Hjucj6dVpC2oP4LBe/no6P+eWU4XSAZQz+y
         d+Lpae10W+D6iionIVgfBXr3NIKiLUOJWi207U+RfCKsEnJD2mbCdthm6Po6qD5zyw9B
         +bhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x195si8282684qkb.100.2020.03.30.09.50.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 09:50:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIxcg-0001kd-NI
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 12:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53538)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcE-00019r-Tf
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 12:50:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcD-0004rl-QZ
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 12:50:22 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:33398 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcD-0004p6-Dc; Mon, 30 Mar 2020 12:50:21 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 09E7E890079DE5EF0139;
 Tue, 31 Mar 2020 00:50:18 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.27.100) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 00:50:08 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 1/3] acpi: Use macro for table-loader file name
Date: Mon, 30 Mar 2020 17:49:07 +0100
Message-ID: <20200330164909.28324-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
References: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.27.100]
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
X-TUID: WOA67hLi+oQc

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


