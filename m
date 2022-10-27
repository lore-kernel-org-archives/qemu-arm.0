Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp255308ejn;
        Thu, 27 Oct 2022 03:10:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4J0umOi4JvoDhQOlh0b/2wMCLibDg34vEjJ3DXrNvMAWfTUqSjpoA3qGsEMVOfJKk6aTfs
X-Received: by 2002:a05:620a:4082:b0:6ee:b24f:47b3 with SMTP id f2-20020a05620a408200b006eeb24f47b3mr34413549qko.518.1666865414693;
        Thu, 27 Oct 2022 03:10:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666865414; cv=none;
        d=google.com; s=arc-20160816;
        b=nYVKjUzkBl9m+occ5qzx3NgFTClVxXepjFs0fW7RZgrHbGEEOQMCTAbFLnq2RGO/n+
         sPPFXnyffLGVfS6UuI8DX3vzfVDRjM/0tCOTig7fCHUgFcKm7wc1pwRLwNTQw0P9hIf5
         O94Nx6Cl22iO54HdreW174P4laSIxvW6zrUInaXevOQ+kYepwdqv6GvKoKCp8ygwYY4i
         Mz7lpbh/vwn9qXrJ53iXQRxTSKe6zcJF0BsASAVTYikowrjEfLLZbD17O84JF5fZlnwT
         heGB1f/fNvbOEqDGImcmtEIF4s70FIoRidjz32s9whf29dqeK1eD9a5XR3bHT1cfhHa5
         LDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:from:reply-to:sender:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=EPdIuQxteC+QWC4a01SAIvvRDwU6bgiwLFKAblzSZEc=;
        b=N8EmIOZ9hA7Kl8oX4uOhFGPI6ryMo0tZaJdTxuc91sH7UJAecyyZ3tkGBsOhhzDHu1
         rJ8oljv/SkZcS11AIihFsxmCwHqhuUrGPVF9pPgC8WaWL7rNgV7i1ujegAYickL7rSLG
         DcoVDFNhAtfBe/OLU9EfWVE/OrLINcTRSJheXjOT0nzmF91ymkZ2SL1JdZX5OkNShyYQ
         DxI46c+K3WmmLTPLwm1ggS7jMYBvQTFuuFYQPDCoLLBwhfWTkuL3eiWnxychxuwePNiu
         qClN1doS/wJMhCMxwE2FwWOtYM+DQ1hiyLx20hU5Akv2jpClTHiu/q6krDN8RHT0CKc2
         TU1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br41-20020a05620a462900b006ce3e643d2dsi635981qkb.472.2022.10.27.03.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 03:10:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzkT-0002Fz-1x; Thu, 27 Oct 2022 06:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzkI-0001m6-JM; Thu, 27 Oct 2022 06:04:20 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1onzkF-0004NE-A7; Thu, 27 Oct 2022 06:04:17 -0400
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Myh7V1T5vz67ynR;
 Thu, 27 Oct 2022 18:02:46 +0800 (CST)
Received: from lhrpeml500004.china.huawei.com (7.191.163.9) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 12:04:12 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhrpeml500004.china.huawei.com (7.191.163.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 27 Oct 2022 11:04:12 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH v3 7/8] tests: acpi: aarch64/virt: add a test for hmat nodes
 with no initiators
Date: Thu, 27 Oct 2022 11:00:36 +0100
Message-ID: <20221027100037.251-8-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027100037.251-1-hesham.almatary@huawei.com>
References: <20221027100037.251-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500004.china.huawei.com (7.191.163.9)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W9i5TWS7/vzj

This patch imitates the "tests: acpi: q35: add test for hmat nodes
without initiators" commit to test numa nodes with different HMAT
attributes, but on AArch64/virt.

Tested with:
qemu-system-aarch64 -accel tcg \
-machine virt,hmat=on,gic-version=3  -cpu cortex-a57 \
-bios qemu-efi-aarch64/QEMU_EFI.fd \
-kernel Image -append "root=/dev/vda2 console=ttyAMA0" \
-drive if=virtio,file=aarch64.qcow2,format=qcow2,id=hd \
-device virtio-rng-pci \
-net user,hostfwd=tcp::10022-:22 -net nic \
-device intel-hda -device hda-duplex -nographic \
-smp 4 \
-m 3G \
-object memory-backend-ram,size=1G,id=ram0 \
-object memory-backend-ram,size=1G,id=ram1 \
-object memory-backend-ram,size=1G,id=ram2 \
-numa node,nodeid=0,memdev=ram0,cpus=0-1 \
-numa node,nodeid=1,memdev=ram1,cpus=2-3 \
-numa node,nodeid=2,memdev=ram2 \
-numa
hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-latency,latency=10 \
-numa hmat-lb,initiator=0,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-latency,latency=20 \
-numa hmat-lb,initiator=0,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
-numa hmat-lb,initiator=0,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576 \
-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-latency,latency=20 \
-numa hmat-lb,initiator=1,target=0,hierarchy=memory,data-type=access-bandwidth,bandwidth=5242880 \
-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-latency,latency=10 \
-numa hmat-lb,initiator=1,target=1,hierarchy=memory,data-type=access-bandwidth,bandwidth=10485760 \
-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-latency,latency=30 \
-numa hmat-lb,initiator=1,target=2,hierarchy=memory,data-type=access-bandwidth,bandwidth=1048576

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/qtest/bios-tables-test.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 02fe59fbf8..e805b3efec 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1461,6 +1461,63 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
+static void test_acpi_virt_tcg_acpi_hmat(void)
+{
+    test_data data = {
+        .machine = "virt",
+        .tcg_only = true,
+        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
+        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
+        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
+        .ram_start = 0x40000000ULL,
+        .scan_len = 128ULL * 1024 * 1024,
+    };
+
+    data.variant = ".acpihmatvirt";
+
+    test_acpi_one(" -machine hmat=on"
+                  " -cpu cortex-a57"
+                  " -smp 4,sockets=2"
+                  " -m 256M"
+                  " -object memory-backend-ram,size=64M,id=ram0"
+                  " -object memory-backend-ram,size=64M,id=ram1"
+                  " -object memory-backend-ram,size=128M,id=ram2"
+                  " -numa node,nodeid=0,memdev=ram0"
+                  " -numa node,nodeid=1,memdev=ram1"
+                  " -numa node,nodeid=2,memdev=ram2"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=0,socket-id=0"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa cpu,node-id=1,socket-id=1"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=0,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=0,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=0,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-latency,latency=20"
+                  " -numa hmat-lb,initiator=1,target=0,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=5242880"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-latency,latency=10"
+                  " -numa hmat-lb,initiator=1,target=1,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=10485760"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-latency,latency=30"
+                  " -numa hmat-lb,initiator=1,target=2,hierarchy=memory,"
+                  "data-type=access-bandwidth,bandwidth=1048576",
+                  &data);
+
+    free_test_data(&data);
+}
+
 static void test_acpi_q35_tcg_acpi_hmat_noinitiator(void)
 {
     test_data data;
@@ -1914,6 +1971,8 @@ int main(int argc, char *argv[])
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt/acpihmatvirt",
+                            test_acpi_virt_tcg_acpi_hmat);
             qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
             qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
             qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-- 
2.25.1

