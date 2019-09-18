Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6475416wrp;
        Wed, 18 Sep 2019 06:13:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx58iC8YM+mKjJvuRxgV4uLgn01iO66gcgnF9b5Qs7ve5GgflejkMiOQ3w14gPb/p7qizvo
X-Received: by 2002:a17:906:b211:: with SMTP id p17mr9332060ejz.11.1568812436938;
        Wed, 18 Sep 2019 06:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568812436; cv=none;
        d=google.com; s=arc-20160816;
        b=iy1Wd3Tr4mNeGZ4L/RcyuoPcRocCLqYOHCTHA0K7uaMwMI/kZO9XG/pzpFHYzIlJmH
         Z2PLGLFsie1bCBnD0Em6pyt6iHSV1F5Lim7TLV9JporaDolbBQyTe297yxhbuqV3rrWg
         uwJ9OKP//6DEuS45F43QUflk1dITOqfpZZieC4U+CEAKYnj3CWXNltVutZBrD1wVl3hm
         JrqrdjZB/9tS3H+BKko+pdhbzQ1lW3nr36sO3elasfJ+Ex5vemwJYFNibACyNQK3RbRC
         hEV1ommk6oJXVOe2N1ZYaMc6cRuFFgohf6Tk5dHfrzOPbB7CGxgoEFNiwRrJV4aVls1X
         5OJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=o4E14tDx5zBwYq3u9E2y+ssHqBMJZgEAQ8NMToqAtb4=;
        b=B2gyB8AIuXMBoIkUjoNOBg9WjthpY9BwvyHiYbBVJv5uyq9KfLr7YB/46X4HLkzZPW
         fX5gk5eBlZx8xcb3iYMtCvE6Kuakv27wNcg/GkjFZni1nil+mDlUT4jPqktFUBxFB18D
         /RH6717WPTIl8Z22knWxKIdkE1GuwjVG7FB8pPjk6Kdm9OzT0HqOJJUQcCjJOYpbrphZ
         X7h0KRx3YlI6VGnWYyaUom0Y1tnml/0HRMwo7OvX3wn8AICOvaJy/u1bpixi6wSRPShl
         DQGP5nNHyzF/7n2nvx7x42acainTcQn44sHjneRkPHPBDE5XMNzay4WefPaf8k7LG/7v
         7CLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14si3142710edt.92.2019.09.18.06.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 06:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAZmN-0001Mx-EA
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 09:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58828)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZhM-0004k5-QT
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZhJ-0003aj-0X
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 09:08:44 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:43862 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iAZhI-0003Yz-MD; Wed, 18 Sep 2019 09:08:40 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3033912B67A7096BC16C;
 Wed, 18 Sep 2019 21:08:38 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 18 Sep 2019 21:08:31 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Wed, 18 Sep 2019 14:06:33 +0100
Message-ID: <20190918130633.4872-12-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.32
Subject: [Qemu-arm] [PATCH-for-4.2 v11 11/11] tests: Add bios tests to
 arm/virt
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W56uALH6Tuvo

This adds numamem and memhp tests for arm/virt platform.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
v10-->v11

Added Igor's R-by.

In order to avoid "make check" failure, the files listed in patch #10
has to be added to tests/data/acpi/virt folder before this patch.
---
 tests/bios-tables-test.c | 49 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 9b3d8b0d1b..6d9e2e41b0 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -870,6 +870,53 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
     test_acpi_tcg_dimm_pxm(MACHINE_PC);
 }
 
+static void test_acpi_virt_tcg_memhp(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .accel = "tcg",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 256ULL * 1024 * 1024,
+    };
+
+    data.variant = ".memhp";
+    test_acpi_one(" -cpu cortex-a57"
+                  " -m 256M,slots=3,maxmem=1G"
+                  " -object memory-backend-ram,id=ram0,size=128M"
+                  " -object memory-backend-ram,id=ram1,size=128M"
+                  " -numa node,memdev=ram0 -numa node,memdev=ram1"
+                  " -numa dist,src=0,dst=1,val=21",
+                  &data);
+
+    free_test_data(&data);
+
+}
+
+static void test_acpi_virt_tcg_numamem(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .accel = "tcg",
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    data.variant = ".numamem";
+    test_acpi_one(" -cpu cortex-a57"
+                  " -object memory-backend-ram,id=ram0,size=128M"
+                  " -numa node,memdev=ram0",
+                  &data);
+
+    free_test_data(&data);
+
+}
+
 static void test_acpi_virt_tcg(void)
 {
     test_data data = {
@@ -916,6 +963,8 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
     } else if (strcmp(arch, "aarch64") == 0) {
         qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+        qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
+        qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
     }
     ret = g_test_run();
     boot_sector_cleanup(disk);
-- 
2.17.1


