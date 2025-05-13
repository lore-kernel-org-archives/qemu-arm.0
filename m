Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp441260njb;
        Tue, 13 May 2025 04:17:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrIdP7hfKbObNjfMxmVmeOyLLvdhly7vP3kkc4ywCBcw4FQfVkWSNpg3E6n8JexNWJUwfLRjM24m1wbg==@linaro.org
X-Google-Smtp-Source: AGHT+IEOiBPzlO5MFTZErkn+80GcRd/EImqITX86ooXAm5/I87QDOAY5E9fovFh/1Apk3A08jgvs
X-Received: by 2002:a05:620a:3196:b0:7c5:4278:d15e with SMTP id af79cd13be357-7cd01103897mr2240732285a.33.1747135070780;
        Tue, 13 May 2025 04:17:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747135070; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcvADQnr1z1EFuc7wuR1QTEMu5bYXnEMdYuwJtT30rgb3StyrSJytVHb1QXVs/KShe
         C3hrY2RX27lTJPRC5BrHHkF1M2eswxDEdcj4iZa13eX2YOhc+SB2sRvYBlq6Ck5fHmUm
         hx8vrIaym3mdjIfr8NYtLnnGJx9aV8mFo1iln3lK67/dpdN5jm0toItjMaCsO9I+5/j0
         6FlypPREX7HuUP1KDwiZ1Z9Sqae6QKKdo1ghkszyi7rMgJp6rfudFNY4hf0/m+121saZ
         P+IPwoq2s8XtYhQ8rw2UtljAXAq84ouhuH7CtBKknbVZ2OsxI3w7qk9Ey0eWBmJwqRUI
         MTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=GEW0mcwl2Snm0W0j01EzpuneJ0iLzuSWZbuRf7t0Gnk=;
        fh=X5nH5YuFPf4WKqGf6XsKhoyhnk+YS/0SzZ/7HifbnvI=;
        b=PSOt3FkkQ/AvGuayu1Xt74o6Ezfio6s6ofnIXjxnnZFl2l/EAN5F7Tfn7R5BCuoRfj
         q05skWE+R2jSQ9yQ9WToWDRdLZ8+1z5L0SMAvXFiP9yONmMYa4rsbteepGqb4WirZ0xE
         /D5mXSoaqkYN26hZIIVRtwszDpb7ugiaAumojZiqWf0cdMiR/Kehd7T4rJ/ejCafmfMo
         YAjEMAKdfP3eWje1oFYsI7jnRH3GNPOCJCET+CPKZnAhOnTGJqcQGp8ZC50cyK9LLVK8
         /mkWHTybu4OXUvNN1av5B3masZts1WkbN7aTaTVl1ddwbvpJQDL10zmOb+Ml1MCmtrm5
         H0mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd45f0si1051621585a.281.2025.05.13.04.17.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 04:17:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uEndh-0001A9-RL; Tue, 13 May 2025 07:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uEndg-00016R-8V
 for qemu-devel@nongnu.org; Tue, 13 May 2025 07:17:36 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uEnde-0006xd-Ar
 for qemu-devel@nongnu.org; Tue, 13 May 2025 07:17:35 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZxYlp2r1zz6L4yM;
 Tue, 13 May 2025 19:14:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 668081400C8;
 Tue, 13 May 2025 19:17:32 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 13 May 2025 13:17:31 +0200
To: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
 <peter.maydell@linaro.org>, <mst@redhat.com>
CC: <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, 
 Yuquan Wang <wangyuquan1236@phytium.com.cn>, Itaru Kitayama
 <itaru.kitayama@linux.dev>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
Subject: [PATCH v13 5/5] qtest/cxl: Add aarch64 virt test for CXL
Date: Tue, 13 May 2025 12:14:55 +0100
Message-ID: <20250513111455.128266-6-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
References: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3pRqRDxAseBE

Add a single complex case for aarch64 virt machine.
Given existing much more comprehensive tests for x86 cover the
common functionality, a single test should be enough to verify
that the aarch64 part continue to work.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/cxl-test.c  | 59 ++++++++++++++++++++++++++++++++---------
 tests/qtest/meson.build |  1 +
 2 files changed, 47 insertions(+), 13 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index a600331843..c7189d6222 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -19,6 +19,12 @@
     "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
     "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
 
+#define QEMU_VIRT_2PXB_CMD \
+    "-machine virt,cxl=on -cpu max " \
+    "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
+    "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
+    "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
+
 #define QEMU_RP \
     "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
 
@@ -197,25 +203,52 @@ static void cxl_2pxb_4rp_4t3d(void)
     qtest_end();
     rmdir(tmpfs);
 }
+
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
+    rmdir(tmpfs);
+}
 #endif /* CONFIG_POSIX */
 
 int main(int argc, char **argv)
 {
-    g_test_init(&argc, &argv, NULL);
+    const char *arch = qtest_get_arch();
 
-    qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
-    qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
-    qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
-    qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
-    qtest_add_func("/pci/cxl/rp", cxl_root_port);
-    qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
+    g_test_init(&argc, &argv, NULL);
+    if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
+        qtest_add_func("/pci/cxl/basic_hostbridge", cxl_basic_hb);
+        qtest_add_func("/pci/cxl/basic_pxb", cxl_basic_pxb);
+        qtest_add_func("/pci/cxl/pxb_with_window", cxl_pxb_with_window);
+        qtest_add_func("/pci/cxl/pxb_x2_with_window", cxl_2pxb_with_window);
+        qtest_add_func("/pci/cxl/rp", cxl_root_port);
+        qtest_add_func("/pci/cxl/rp_x2", cxl_2root_port);
 #ifdef CONFIG_POSIX
-    qtest_add_func("/pci/cxl/type3_device", cxl_t3d_deprecated);
-    qtest_add_func("/pci/cxl/type3_device_pmem", cxl_t3d_persistent);
-    qtest_add_func("/pci/cxl/type3_device_vmem", cxl_t3d_volatile);
-    qtest_add_func("/pci/cxl/type3_device_vmem_lsa", cxl_t3d_volatile_lsa);
-    qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
-    qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4", cxl_2pxb_4rp_4t3d);
+        qtest_add_func("/pci/cxl/type3_device", cxl_t3d_deprecated);
+        qtest_add_func("/pci/cxl/type3_device_pmem", cxl_t3d_persistent);
+        qtest_add_func("/pci/cxl/type3_device_vmem", cxl_t3d_volatile);
+        qtest_add_func("/pci/cxl/type3_device_vmem_lsa", cxl_t3d_volatile_lsa);
+        qtest_add_func("/pci/cxl/rp_x2_type3_x2", cxl_1pxb_2rp_2t3d);
+        qtest_add_func("/pci/cxl/pxb_x2_root_port_x4_type3_x4",
+                       cxl_2pxb_4rp_4t3d);
 #endif
+    } else if (strcmp(arch, "aarch64") == 0) {
+#ifdef CONFIG_POSIX
+        qtest_add_func("/pci/cxl/virt/pxb_x2_root_port_x4_type3_x4",
+                       cxl_virt_2pxb_4rp_4t3d);
+#endif
+    }
+
     return g_test_run();
 }
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 7daf619845..361000267a 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -258,6 +258,7 @@ qtests_aarch64 = \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
   (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed64 : []) + \
+  qtests_cxl +                                                                                  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-- 
2.43.0

