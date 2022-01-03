Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10167623lfb;
        Mon, 3 Jan 2022 00:49:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQnnboFxbaOpI/wd5z4YaRlNiKtloUkD2dxJiKtDrd6jwTQcqQbYS0RTimUXK9daMad3eG
X-Received: by 2002:a25:9248:: with SMTP id e8mr25085220ybo.44.1641199767719;
        Mon, 03 Jan 2022 00:49:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641199767; cv=none;
        d=google.com; s=arc-20160816;
        b=oZbNAEGMS3cj3Y+AEztjA6kCUlphDLRWm1cKejUAtmArVch05vasiDb4lTvy6uZj0c
         fiVNVr8ckbCvcqwuIO5iXF6fpdsS+Zu3U7sba0t0ZUfdtSnKFJSJ5v/NyNrmB2F/7+2w
         lfyHOp7FzDnBu8GenFyy5g3ZhbzEROz0jM+bBxLHZ6a+wj+MofmNj24N/I594vf1YJEq
         iWtVBFy+UOBPFAW252bOYiCWu48HwWi0FlRaUIlSbmPED07XKtS/pDkUgIVBd2J90wcR
         NpeIXWY+YVKsiPSmrpRHpDhLN8FZAqCSOjTiwnRTy4JFDIx+5l1aIY+66NSj6+QCHIEy
         dj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=P2JLn7sZQTszxItloYBLcZBNIjPbfKFohUNGaLhjspQ=;
        b=JKX0C0iD7SWAgqHNcLAtSZylyucgu+aTe61/FzcIqBwDiRJlTtzMdmUxGy4yXZSUW2
         hUjuhWlfa4wAQuTtS6lLKa0ziUxrVawi92Cpb8AWLy7yI5iYNG0new+q5BPtde+GWXZ3
         KyCDYANdnEORc/0C0NqMQl1lejxyLUpEeeO4OPFLVvqR2Op3PYivtizGlSx9AXdG3+ZJ
         bMrd4Sul9N3/HlU73YjTVdW+F3G/51qXtGMYAFYt/PXhRAXSk/2FqeYmcVwMURMN/Mtj
         yUP8zDAwrot70VKf+/aNLiNdoh7H5CUdNPE+gBYqjOWJ/SbBmNfE+91E2+ZywP8YEVIz
         GYcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si15403051ybe.702.2022.01.03.00.49.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 00:49:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:59904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4J1z-0006lI-52
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 03:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzX-0004Ja-TE; Mon, 03 Jan 2022 03:46:56 -0500
Received: from szxga08-in.huawei.com ([45.249.212.255]:3257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzU-0006SG-9P; Mon, 03 Jan 2022 03:46:55 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4JS8Qx0bX2z1DJwq;
 Mon,  3 Jan 2022 16:43:21 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 16:46:44 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 6/7] hw/arm/virt-acpi-build: Support cluster level in PPTT
 generation
Date: Mon, 3 Jan 2022 16:46:35 +0800
Message-ID: <20220103084636.2496-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220103084636.2496-1-wangyanan55@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: k3HpeaocAc5K

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

