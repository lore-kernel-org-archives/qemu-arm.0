Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5343150lfk;
        Sun, 21 Nov 2021 04:26:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9I2pln8Lpi/CTcxHrKTxshCxolRn2OBzJdf4GsUcvoLHg2DH3uDNI4O5tCL3IcRiVZOf8
X-Received: by 2002:a05:6102:3a62:: with SMTP id bf2mr89901679vsb.14.1637497594192;
        Sun, 21 Nov 2021 04:26:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637497594; cv=none;
        d=google.com; s=arc-20160816;
        b=JqWTTdlJwgp8h0FLiMHIm0DJhlRdZP58/OTZeS3Ijf1anyk+KkbNWBmz+qEJ42LeWf
         /wHDdZ+1+F5266KWmVGwXuCjNYOjcINndEOzBaz2zdlQdWQaO419JehXjdqFuwY+CEn8
         9dVoEfzZrOfal3iYCr0YaUR3xbHhUWy2F+gq8vFqTr3WyKEFBGxnbjg0Uz1PxRcRzIzM
         8GkycX6hRpv+AugcKcEmMtUD4apv4EE4RYuGuCiOzVcAk72/uPbHOWa147nQHN5RZtfn
         l0y6nZpsZKUAS2Zswm9jc2Fh5gVbX8PJksBSC30U6t/tg+NPeN9pj3XfvTCAqZLhtkuD
         cYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=FA34rbP7P7EG4LEtka3cDq4i57Rmlw6Xu8qcAO43OLs=;
        b=MG/fISjhnVdx6IC7dKeea6VUjMBKoVDfZKdKpoSTFa1Xx8BxwI4kZ+ScPC79v+IfbA
         Lr2rmvTdBmY9xXYcSj3xq0vx3zqvAyDRCJyyyYf9lF9VQSHdYD/vzH7l6AhjmrDlLSA6
         dydXh57kxPJc9aX6aTTrt/X7C0/cu01/EuOuii104LISKKr8WOhc+kz5c4kT+RMZ8ZCE
         umoI4d+h4Pt4ymO5IDNUzsz3TcXI+PbPdkIiCV6fAdjVcFpM2/wkhT3bSLI/PHAh4jIM
         iMMwBjT9ChblL37HSsLNwUxFCgxFYm7xPf+ePOAygwtzoYj59TjOouJMd5KCcf7hUg+k
         oh5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si14082649vsn.383.2021.11.21.04.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 04:26:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:50344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1molvV-0005SW-Jt
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 07:26:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluO-0003r4-Gx; Sun, 21 Nov 2021 07:25:24 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:2907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluK-0005mx-DP; Sun, 21 Nov 2021 07:25:24 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HxqL12X9Sz1DJC8;
 Sun, 21 Nov 2021 20:22:49 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:17 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 09/10] hw/acpi/virt-acpi-build: Support cluster level in
 PPTT generation
Date: Sun, 21 Nov 2021 20:25:01 +0800
Message-ID: <20211121122502.9844-10-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: rwX7yi7tg/or

Support cluster level in generation of ACPI Processor Properties
Topology Table (PPTT) for ARM virt machines.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt-acpi-build.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index bef7056213..b34f0dbee0 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -839,6 +839,21 @@ build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
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
2.19.1

