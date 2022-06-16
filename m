Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1088537lfb;
        Thu, 16 Jun 2022 07:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uDqA4+xb01zw2n0a8dFUjcNZ+2McBSmUFcHlqSqCQ8hSTQf0FnPOiV5i8fGqpagByYgm9y
X-Received: by 2002:a17:906:c797:b0:711:8c01:32d4 with SMTP id cw23-20020a170906c79700b007118c0132d4mr4742051ejb.205.1655389244819;
        Thu, 16 Jun 2022 07:20:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655389244; cv=none;
        d=google.com; s=arc-20160816;
        b=LtWY76jlaYulsNuGKobpOxV3M27uF56QbzMVF2qyKsLHY4on7XHoBasB1nceRLbT1s
         CWpjfz8gAYWSHhQ3dfOzX7ouhmdkq+oUvXAqkld64n65C52sIw0xlribZWo+faqX8E8y
         oQ5buj1CuJlBcHas/ol271MTgYh7yXsXGX3tzCdEUEzsV4fHNSBipCIUQe3Fr40ST4SH
         LW7ek0xHVD7dRkQfkTlkCAnXr9V8qnpK8LygH0KDsymvVgRT92oXoVS/+EPNm0yRMOPS
         0r/zQY95YrEfn1gauW+LtEhcTtbYGRpxiyRux3MMLbhMC56hF3yE7FRrRIlJ+EhWF0QI
         Nb4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WKglxQNgcKd+JQGmOCzxr2+usI4ExLri1cwa99fiPWc=;
        b=Mok87uTNR5c0TNR0nlFQe/8dfpQ6RE64PSR9voouADDM66V0Zq1A+FVzHvYcDoEDvb
         ivLbOjeyvhkw8BmL1BYqwx6THcWfjD/9iWGI53HKz+mZfo69pcVOmgpyece5pVx0YRGH
         nbPG7ICvXg3JnFb6NqLyvrQSjVgaLsflsOslPNtfXz88e0dqrfW3HtOB+Zu2Cmt8ynFa
         dBDEa1GolMdWoL6F9Sxv3bsl4HUPwuawzS0xMgq4Ifo23w7McSdjlke621Kx+YflqWCq
         +sowOkexYQQdbFcxomzAD+PgzGH58wVMDK/yI3Fw4eqCnxWrlbl2lYl20QL8OuubOfGe
         U+iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id gb42-20020a170907962a00b00718bfe860a4si2229277ejc.41.2022.06.16.07.20.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jun 2022 07:20:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from fraeml701-chm.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LP46c01VFz67bS5;
	Thu, 16 Jun 2022 22:19:04 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml701-chm.china.huawei.com (10.206.15.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Thu, 16 Jun 2022 16:20:43 +0200
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhreml710-chm.china.huawei.com (10.201.108.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 16 Jun 2022 15:20:42 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, "Michael S . Tsirkin"
	<mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
	<linuxarm@huawei.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
	<a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: [PATCH v11 2/2] qtest/cxl: Add aarch64 virt test for CXL
Date: Thu, 16 Jun 2022 15:19:50 +0100
Message-ID: <20220616141950.23374-3-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhreml741-chm.china.huawei.com (10.201.108.191) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-TUID: 3YzweDuYMrHC

Add a single complex case for aarch64 virt machine.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/cxl-test.c  | 48 +++++++++++++++++++++++++++++++++--------
 tests/qtest/meson.build |  1 +
 2 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 2133e973f4..1015d0e7c2 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -17,6 +17,11 @@
                       "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
                       "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
 
+#define QEMU_VIRT_2PXB_CMD "-machine virt,cxl=on "                      \
+                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
+                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "  \
+                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
+
 #define QEMU_RP "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
 
 /* Dual ports on first pxb */
@@ -134,18 +139,43 @@ static void cxl_2pxb_4rp_4t3d(void)
     qtest_end();
 }
 
+static void cxl_virt_2pxb_4rp_4t3d(void)
+{
+    g_autoptr(GString) cmdline = g_string_new(NULL);
+    char template[] = "/tmp/cxl-test-XXXXXX";
+    const char *tmpfs;
+
+    tmpfs = mkdtemp(template);
+
+    g_string_printf(cmdline, QEMU_VIRT_2PXB_CMD QEMU_4RP QEMU_4T3D,
+                    tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
+                    tmpfs, tmpfs);
+
+    qtest_start(cmdline->str);
+    qtest_end();
+}
+
 int main(int argc, char **argv)
 {
+    const char *arch = qtest_get_arch();
+
     g_test_init(&argc, &argv, NULL);
 
-    qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
-    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
-    qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
-    qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
-    qtest_add_func("/pci/cxl/rp", cxl_root_port);
-    qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
-    qtest_add_func("/pci/cxl/type3_device", cxl_t3d);
-    qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
-    qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4", cxl_2pxb_4rp_4t3d);
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
+        qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
+        qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
+        qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
+        qtest_add_func("/pci/cxl/rp", cxl_root_port);
+        qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
+        qtest_add_func("/pci/cxl/type3_device", cxl_t3d);
+        qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
+        qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4",
+                       cxl_2pxb_4rp_4t3d);
+    } else if (strcmp(arch, "aarch64") == 0) {
+        qtest_add_func("/pci/cxl/virt/pxb_x2_root_port_x4_type3_x4",
+                       cxl_virt_2pxb_4rp_4t3d);
+    }
+
     return g_test_run();
 }
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 31287a9173..0fa93da13a 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -215,6 +215,7 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
+  qtests_cxl +                                                                                  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-- 
2.32.0
