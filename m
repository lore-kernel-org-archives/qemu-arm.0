Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp614443wrm;
        Fri, 4 Oct 2019 08:54:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxnx4FzsoOQZKC6U6PcCI4D2mUgRFn5kwIiUpHw7Eq0vMuvHXAFAeLSKS2l/amGUHZsE6+x
X-Received: by 2002:a17:906:19d9:: with SMTP id h25mr13307207ejd.43.1570204494242;
        Fri, 04 Oct 2019 08:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570204494; cv=none;
        d=google.com; s=arc-20160816;
        b=zYYwUdsabMKhiEln+cLFF/+6ERIug9AMbJisE+Wf4bBNgC3cIZkuIa4xFzS+5hN0Vt
         cilaPYYZhXyusFmcSne9fS5XTdz+Kq67876oH4tpbjBkI7Jt2LnZSrpbUaHQwXbh8GIt
         mkmbUYc58/wtJqOUVxZlTAGg8lm43NdLSHVqvIMRs+bBaeJK2sUR0K0zFd/qZRQAxs6M
         6uDisp51NF7+xRNGsrXYUe9ONAGrGOj4yUoPDBjPGyqQbCTJg/SnMmjfzOSMYz6D8O2J
         ufq+z58Q9komJXFrO/7trXuvm397SI/MkreR9YxV8Zv0KqEIPntSCKUqR1nWLFZeOMTR
         1/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=8im/z8BRcG2cgBR/bymEYRODDEPl3un3kKapyjA7hHI=;
        b=F5mSxA/xZkHLhMnm5+JBAtZndMwoOO0Ar1goh9ckfX2XhpA73is5zO/UF1rUzig9is
         09sSgVwTOjbnmH1TGmr1xwDT3jsl9kV4uTU4M0J46tei555NlVYks2oe5ukYiHbEJ/62
         iaolTPGjup4WnesbCY4v8ssPDD6GKhBulbbOtH/plQXsVGe2Bn57p1gXKuAkJAxe6Zge
         AdnhyHfpvWG3uG07Cvj1491lE5CYnFbGK6/Gvplp4ZRNSxaKe969BqeHQhrWnq0DXMOS
         BzclBRecMsO5kL5EN10MKRRON0TbLkcpWl+aq0Zg0oSn28GAsAXQE7OJUvzfH1zw2hDB
         ts8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z21si3124487ejw.229.2019.10.04.08.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2019 08:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iGPuu-0006NU-Fj
	for alex.bennee@linaro.org; Fri, 04 Oct 2019 11:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42167)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuP-0006Jy-Vz
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 11:54:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuO-0000W1-MZ
 for qemu-arm@nongnu.org; Fri, 04 Oct 2019 11:54:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:44636 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1iGPuO-0000QO-93; Fri, 04 Oct 2019 11:54:20 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BB987C4B2364335D9FB1;
 Fri,  4 Oct 2019 23:54:12 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Fri, 4 Oct 2019 23:54:03 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH 1/5] hw/arm: Align ACPI blob len to PAGE size
Date: Fri, 4 Oct 2019 16:52:58 +0100
Message-ID: <20191004155302.4632-2-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
References: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: peter.maydell@linaro.org, lersek@redhat.com, linuxarm@huawei.com,
 xuwei5@hisilicon.com, shannon.zhaosl@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u5vQuUBe/avx

If ACPI blob length modifications happens after the initial
virt_acpi_build() call, and the changed blob length is within
the PAGE size boundary, then the revised size is not seen by
the firmware on Guest reboot. The is because in the
virt_acpi_build_update() -> acpi_ram_update() -> qemu_ram_resize()
path, qemu_ram_resize() uses ram_block size which is aligned
to PAGE size and the "resize callback" to update the size seen
by firmware is not getting invoked. Hence align ACPI blob sizes
to PAGE boundary.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
More details on this issue can be found here,
https://patchwork.kernel.org/patch/11154757/

---
 hw/arm/virt-acpi-build.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 4cd50175e0..074e0c858e 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -790,6 +790,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
     GArray *table_offsets;
     unsigned dsdt, xsdt;
     GArray *tables_blob = tables->table_data;
+    GArray *cmd_blob = tables->linker->cmd_blob;
     MachineState *ms = MACHINE(vms);
 
     table_offsets = g_array_new(false, true /* clear */,
@@ -854,6 +855,19 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
         build_rsdp(tables->rsdp, tables->linker, &rsdp_data);
     }
 
+    /*
+     * Align the ACPI blob lengths to PAGE size so that on ACPI table
+     * regeneration, the length that firmware sees really gets updated
+     * through 'resize' callback in qemu_ram_resize() in the
+     * virt_acpi_build_update() -> acpi_ram_update() -> qemu_ram_resize()
+     * path.
+     */
+    g_array_set_size(tables_blob,
+                     TARGET_PAGE_ALIGN(acpi_data_len(tables_blob)));
+    g_array_set_size(tables->rsdp,
+                     TARGET_PAGE_ALIGN(acpi_data_len(tables->rsdp)));
+    g_array_set_size(cmd_blob,
+                     TARGET_PAGE_ALIGN(acpi_data_len(cmd_blob)));
     /* Cleanup memory that's no longer used. */
     g_array_free(table_offsets, true);
 }
-- 
2.17.1


