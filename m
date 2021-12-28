Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6331313lfb;
        Tue, 28 Dec 2021 01:34:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHpDW5q2f842bzAR1i+lnLZ3V45M/WkFtwGabBHxWqshXNO2NjBO/sq7Umb5wLKsnfUh9J
X-Received: by 2002:a05:6902:110c:: with SMTP id o12mr29672119ybu.159.1640684075885;
        Tue, 28 Dec 2021 01:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640684075; cv=none;
        d=google.com; s=arc-20160816;
        b=iFVkYNa6VHGLdAnFWBeGUxxWG14fFwBAXXwFTHgiBfD9d4LweyL2SgHRwZQBbe+ByD
         xw8jkbR3Vkz7tdzPsi5YhT+GxgicKv5xsid9bUdT54A8mNyiCZ4eb8HDL0OuBzsy4DFr
         b3uhDXH6fPm4MZwY8rGaGTWa/cpdF/EMfA9bCk7rKauJxcfwx45ubk4iVZpP5ls+Qhbm
         LW2JPSY8k9aszoZmWKQMR/AT/AGQMDIEYomujr1fGJUelKg9uoyxkRV1/2RytrI1Ox8W
         up7dK594HVi7tg9ybZRTYsn57TE9sBJyKRmUrpipPgMiEej8rsvpjdBoKsFXUVQnp4XR
         PRIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=P2JLn7sZQTszxItloYBLcZBNIjPbfKFohUNGaLhjspQ=;
        b=eDq3vzcQybyUrFba5f83S3eHDOsHXd7tt6Gxl6rs7WEeU05/gBi5WPXUthX8BQkUYQ
         9nN0yH5C3H705dBAAyeNqInxchA2rlOVIpkhO1uExZQhcwIqvYOBGDVNc+LjEantcsv/
         yKUvbcbA5Na2VD7414UCldodZBCSHfVzvngd/GbS70aAtJPNuU6Rcq7/dhxYSBZJgCSN
         CrDdl0XUpA9B4ugkC7Fy28zVH6tWFXMUDRNEug4nJq4avHu8muHi0u1cGtXrK4LiNsOI
         ZErQv6E6fi0aWteFkkl8SknEo+0nfN14faljajw398Fd/Pbglh9KTB54XqMqO9iTZw56
         YtyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e79si2836204ybf.364.2021.12.28.01.34.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 01:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:38916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n28sN-0003Ar-BV
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 04:34:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28hD-0008Fs-Br; Tue, 28 Dec 2021 04:23:03 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28hB-0007CK-I3; Tue, 28 Dec 2021 04:23:03 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNTZt1wrwzbjgC;
 Tue, 28 Dec 2021 17:22:30 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:57 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 13/14] hw/arm/virt-acpi-build: Support cluster level in
 PPTT generation
Date: Tue, 28 Dec 2021 17:22:20 +0800
Message-ID: <20211228092221.21068-14-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211228092221.21068-1-wangyanan55@huawei.com>
References: <20211228092221.21068-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-devel@nongnu.org>
X-TUID: SZpa9zfyNNQX

Support cluster level in generation of ACPI Processor Properties
Topology Table (PPTT) for ARM virt machines.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ce7680393..5f91969688 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -840,6 +840,21 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
             0, socket, NULL, 0);
     }
 
+    length = g_queue_get_length(list);
+    for (i = 0; i < length; i++) {
+        int cluster;
+
+        father_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+        for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
+            g_queue_push_tail(list,
+                GUINT_TO_POINTER(table_data->len - pptt_start));
+            build_processor_hierarchy_node(
+                table_data,
+                (0 << 0), /* not a physical package */
+                father_offset, cluster, NULL, 0);
+        }
+    }
+
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
         int core;
-- 
2.27.0

