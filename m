Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5890341njd;
        Mon, 28 Apr 2025 04:11:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWSSbMJaOLNgQZEWACMZOqpjEn5pxw0D8GLFkrfDHuRmsIAgucPzQmTDClSberLeJ9iXcVTCvP3zjxIiw==@linaro.org
X-Google-Smtp-Source: AGHT+IECahZ177LfZqtfZCWjwU3Fc/CtUamYx05unx0tQjp2IePQa7saJlK/GXFhF+Y5XJczOxtM
X-Received: by 2002:ac8:7d13:0:b0:476:afd2:5b46 with SMTP id d75a77b69052e-48131dde7b7mr140216421cf.25.1745838686196;
        Mon, 28 Apr 2025 04:11:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745838686; cv=none;
        d=google.com; s=arc-20240605;
        b=LPUmUxqMIDAM6X/pcd9IyGffcFOB0m/w8mL6JKWLL+kkrrtMIjwHKEGeiZjxwtm4Jx
         sNDExb6Hok31b1PPjZaTzreBd+cIECTy4EnObJ86yjwQXONqNMyi7UfQWrUhxWwSxFgK
         qZt3bFEqI4MZM0V9BageOT2vFjJXPdqTbsw4pWpS128XTyIR1KA8BpJvycn5p4rk9pCh
         x/2ATEf/aYP6dQk7ufb/jcCMY7E+Lxm6mJa0DuTNBiNzU4QecA4jghS66R4nOrZI1bmq
         0nt0vHQOXLFAX/kyvu7HTuzHlzY1KrD6zSgYyT8fonV+a0iNZzAJFMrJOG+mVBRBqxs0
         ck6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=VrTAVYsImqjZWmFrTkjAMDnV2Fuii5ZzX0XC6JoTSKo=;
        fh=4I6C6M6UnjJSR8ua+77IMjq+L7KY+8Gqk52ai7dLWhQ=;
        b=bm5unP7V8RkSGl2k3SzriwBrcSKuo/nEPfqyHPOCgHS9duo7K1vdnSTJM1Ac9yYNAU
         xOR8KVe7Gtl10OSrpVDqDFDf75x2hdbYDbZVHSEZ85uiGclVGGhrPitXVefwG5BwwcmR
         2LJOFqPXqk+NfDjTWLEXulCdn/aGBEXkl/4tDUuQN1AauOCFFjHsthYaAUysIx/gL0UK
         cSgrgFhlkxFq6NmlTi+wvK+rJXxY3fpL+S1U84kMXmC/AcwFDqy9WpN0MJV2BbXD43In
         GgInuoh6cHRqz1LrE7K1wTsDEXTGV/C0UkRa61cr0KAyjo9ZLUNv22i+2mVeaY+rmmu7
         AOoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9f1d5635si103429881cf.109.2025.04.28.04.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 04:11:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9MO5-0007Hg-B5; Mon, 28 Apr 2025 07:11:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u9MNi-0007BT-V5; Mon, 28 Apr 2025 07:10:40 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u9MNg-00022s-8P; Mon, 28 Apr 2025 07:10:38 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZmLKZ3cxrz6L4y1;
 Mon, 28 Apr 2025 19:08:34 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 37D9D1402EF;
 Mon, 28 Apr 2025 19:10:33 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Apr 2025 13:10:32 +0200
To: <qemu-devel@nongnu.org>
CC: <philmd@linaro.org>, <alireza.sanaee@huawei.com>, <anisinha@redhat.com>,
 <armbru@redhat.com>, <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>,
 <eric.auger@redhat.com>, <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, 
 <imammedo@redhat.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v10 5/6] tests/qtest/bios-table-test: testing new ARM ACPI
 PPTT tables
Date: Mon, 28 Apr 2025 12:07:53 +0100
Message-ID: <20250428110754.48-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428110754.48-1-alireza.sanaee@huawei.com>
References: <20250428110754.48-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9CZ01OPmYyIy

Test new PPTT table with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec43536..8218b39de7cb 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1846,7 +1846,10 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 
     data.variant = ".acpihmatvirt";
 
-    test_acpi_one(" -machine hmat=on"
+    test_acpi_one(" -machine hmat=on "
+                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=core,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=core "
                   " -cpu cortex-a57"
                   " -smp 4,sockets=2"
                   " -m 384M"
@@ -2123,6 +2126,9 @@ static void test_acpi_aarch64_virt_tcg(void)
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
+                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=core,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=core "
                   "-smbios type=4,max-speed=2900,current-speed=2700", &data);
     free_test_data(&data);
 }
@@ -2142,6 +2148,9 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=core,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=core "
                   "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
     free_test_data(&data);
 }
@@ -2227,6 +2236,9 @@ static void test_acpi_aarch64_virt_viot(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=core,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=core "
                   "-device virtio-iommu-pci", &data);
     free_test_data(&data);
 }
-- 
2.34.1

