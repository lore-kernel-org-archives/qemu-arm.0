Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1605962lfb;
        Fri, 7 Jan 2022 00:36:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKuEYfn2NHjFGeCvRg/5cjJ8I9yZ9TReunJ/WdrKfKC71WN2ZUcoqeDHBy926Dmxkp+Wqw
X-Received: by 2002:a05:620a:56e:: with SMTP id p14mr44486159qkp.452.1641544574589;
        Fri, 07 Jan 2022 00:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641544574; cv=none;
        d=google.com; s=arc-20160816;
        b=sAvnOpRHsZYU9iGF6fI16JbWM7kcG7HWtis86NKOjN8oRGLWASjySx9STnyxG+9cMw
         2bBFNUSBMtYU6sWphUgxaSkbVtNs4GtQSNgRQrMo0oDkNRlcwMuhDydDYZjF2ACRIwc5
         DPIxmLpVko2nwnXRX4gDr/xoJr1WCWJJ7CJooJ9Mxas/ZNwxkVsDL99jtZlyrr/WlRJ7
         9dEACgRfXSpWxSgy6nSTzssJziv5W2x8kfthQ6ABD0dHxHU1TzCZkOpEgalX3qCEx9Oc
         meQxIBC014h4syb0QseaGP70tBoBCg2ynu1iOtNHIVeux+SkjY6fRXFKKsKSwdAwEFG2
         st5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=Zn/i6KY12Z8egj6CJ8oVif0eWeZwrmknKtTHoSJFSOY=;
        b=sVEQmZYWdEbJ1e0Lbla3BCEvocgnWi16g0c+NM9eP8u/JSpNAlZT8Qy8G+WzooS9XN
         n3kaU0kPVAmjmhWJWBaXwwn043N3941VV2d7FL7gqISGcVR1LbHbZqE55HluKAsCP05l
         EEW7/39t7SgfhFmPzL4CM06+ENnHJfpUXDteXY+Q/oLyWbnfo9D55qQVXDZ/3CNnCcYT
         KcUk9jxZbhpvU7JvMMILn/Ipi+0113LCgC4ZYLC4SrprAm6RL2xRXzHh0DdhHvU5XGxi
         X/xv7ei32V8OAItQTwKYPWXUAgyOpJ9KCrXrDyiNkU5cSDtLHF3sC59dM3EKoea5D0jU
         gtUA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si1425707qvn.34.2022.01.07.00.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 00:36:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:43888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5kjO-0003xm-1Z
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 03:36:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg4-0000OV-Ek; Fri, 07 Jan 2022 03:32:48 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg1-0001fN-TN; Fri, 07 Jan 2022 03:32:48 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JVc0459qTzcbtW;
 Fri,  7 Jan 2022 16:32:04 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:39 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 5/6] hw/acpi/aml-build: Support cluster level in PPTT
 generation
Date: Fri, 7 Jan 2022 16:32:31 +0800
Message-ID: <20220107083232.16256-6-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
References: <20220107083232.16256-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: lLuVb3Xe4z/3

Support CPU cluster topology level in generation of ACPI
Processor Properties Topology Table (PPTT).

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/acpi/aml-build.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 6aaedca2e5..bb2cad63b5 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -2001,6 +2001,7 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
     GQueue *list = g_queue_new();
     guint pptt_start = table_data->len;
     guint parent_offset;
@@ -2025,6 +2026,23 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
             0, socket, NULL, 0);
     }
 
+    if (mc->smp_props.clusters_supported) {
+        length = g_queue_get_length(list);
+        for (i = 0; i < length; i++) {
+            int cluster;
+
+            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
+            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
+                g_queue_push_tail(list,
+                    GUINT_TO_POINTER(table_data->len - pptt_start));
+                build_processor_hierarchy_node(
+                    table_data,
+                    (0 << 0), /* not a physical package */
+                    parent_offset, cluster, NULL, 0);
+            }
+        }
+    }
+
     length = g_queue_get_length(list);
     for (i = 0; i < length; i++) {
         int core;
-- 
2.27.0

