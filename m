Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp35673wrs;
        Tue, 13 Aug 2019 14:13:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy69Pmq763muddF/L9APn7jcUWOLXnG3suOGY71DLI1WGzQK5O8Rwctyv5dTYFrSWdMtp4d
X-Received: by 2002:ae9:ed08:: with SMTP id c8mr22939586qkg.49.1565730801710;
        Tue, 13 Aug 2019 14:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565730801; cv=none;
        d=google.com; s=arc-20160816;
        b=g77DjmFmmhmGFrm1NLjdpOyVKr01jLJnbnvr6y04tKNaC4jnlCkQLV2AH08EUDYAC3
         RZZjHiniqubtfg4FtY/ox7KBHJ/zI5O0FO+3ReuqUC9v/oSjHk66RLFAM5MMUakkK61/
         lqnEO+nfZg/yA5JmjdWNLEm9c7wAeOIaRCrKvQDrDuILETA2t5Yde9HSGLwu1WnsMkGR
         Mv54Z8CfTzzRuSJptsac344lSgYiHJ8q6B2lhEAbDBRV60AqVREXkt7OYgPeRuhGVXfy
         KeNmynUOrmIjBeeQyTTnxrYB9gITSTVmXgjo0poY/q25py+e6O2uFjkZPi7BrsViZl+g
         8R6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:date:to:from;
        bh=uftxv5ZWfB4oXgjJMG+CxRkuwojbJUaZfZoxhvhXDsw=;
        b=R/rCb8pE++sFtyZuTEiFd8AmJWFChbubSqh7LKcJuhILM77fDjWmAbjbhDQKYJX9zC
         NHy7JPCmvYPnjlWPBsLe8Mt+vZKvQZ8h/0/2KQdYdivfvBI14m6QSlS3eJ4c54dUEBSy
         hk757vbR8wJZAKCAkS/FZNrvd7W+i08dyGOWZS1FGKoclYtyhgonGyjQknt/1hOq3ZQi
         RIaVNIcZ5TO8omW6S8e5nFa82+w4bpIWcVmdTf/LEpjf1eimnuMjCXEQtyK5pJB3cFB7
         SmcZiKzGqRvGgCSkf0P+R2So9wcm82YFktHaRk4F8teDE/KqX9++zK9wjphaYhE5RWqs
         z8cg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o56si66619325qtk.165.2019.08.13.14.13.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Aug 2019 14:13:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hxe6b-0005h4-7R
	for alex.bennee@linaro.org; Tue, 13 Aug 2019 17:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1X-0005Ia-Dc
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1V-0001oO-Db
 for qemu-devel@nongnu.org; Tue, 13 Aug 2019 17:08:06 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2253 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1hxe1P-0001dE-37; Tue, 13 Aug 2019 17:08:00 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0E3FEE996CB23ADEC89A;
 Wed, 14 Aug 2019 05:07:57 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.94.0) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Wed, 14 Aug 2019 05:07:47 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Date: Tue, 13 Aug 2019 22:05:39 +0100
Message-ID: <20190813210539.31164-13-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.94.0]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 45.249.212.191
Subject: [Qemu-devel] [PATCH-for-4.2 v9 12/12] tests: Add bios tests to
 arm/virt
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x8tvjx3tSMxv

This adds numamem and memhp tests for arm/virt platform

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 tests/bios-tables-test-allowed-diff.h |  1 +
 tests/bios-tables-test.c              | 49 +++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/tests/bios-tables-test-allowed-diff.h b/tests/bios-tables-test-allowed-diff.h
index 7b4adbc822..d181a4da4a 100644
--- a/tests/bios-tables-test-allowed-diff.h
+++ b/tests/bios-tables-test-allowed-diff.h
@@ -1,2 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
 "tests/data/acpi/virt/DSDT",
+"tests/data/acpi/virt/SRAT",
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index a356ac3489..1d6f330d53 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -871,6 +871,53 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
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
@@ -917,6 +964,8 @@ int main(int argc, char *argv[])
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


