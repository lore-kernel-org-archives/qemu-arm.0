Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp10167005lfb;
        Mon, 3 Jan 2022 00:47:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxflK9orSO6H1lTo569uw1Y/8nSjOJV3ntgScMNKkvrTd6dgjhl4SnGMDMjg572Ab8bpf5W
X-Received: by 2002:a25:d105:: with SMTP id i5mr51122597ybg.382.1641199675997;
        Mon, 03 Jan 2022 00:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641199675; cv=none;
        d=google.com; s=arc-20160816;
        b=0dTQp8VDF3jloeJqKZ64SkMb4pFaA2x6GHunmmv0mLdd1wzzZYkClHPswfAB55NDwq
         uf8kdrCOezwdZ3AXwqcF9o4WNCXniZ9dhp2h2B7b3hGFXU7w0cufQ/hW33GgelLJ6MCh
         gWVHXhKsEECfEFlIJ/qG6tJ0VqiiZzwZrzBPA/rPDJ9XDYkfarCwwWMQdivwZ7ChbNNj
         bN6wQXFFbyDFU8znh9BC4pdM4nILKriz+AMQNp8yuyENjeuqxhhyHhNDSfeaX9+AsbGy
         nkYxJlB26w57OpsaxEIk3d2I1TM5NJgv9JYi5yC2rTNCJw7QtMv9G2d018HvYuUA72FQ
         VdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=FXYiiXD5ERzmHZVnk8OaIEFOH1pIB5aphae5eBBBpCE=;
        b=mbQPxADepTfI37S+Yf6HWIRiW8eWMOXwUmHRgZYxSCC9+GSHBuq5qfwpopptfLDWH7
         tyeIoYsWiqSU2Rqz0c+SBRt4yGRuzCQiJbTsA9+0+bImCYfOyOsURSab+fUA7FuS1TiX
         tSYmJDMqAB6+uwWOVTCFJDoGmQ4NHRVvPm+9cDVmVZEy7wIy/xsLO9Vs8VzCd5mNmb90
         22Kue1WA1wAinjM4Y9DjsxhW75WOBXn+tg4T8vwRMIyFrHrYge6L0El+QZijBe3L9GEE
         1POgJ28w1mi+j8nWDLDSndPlT5XeI9rwvNFmHBCYgYTIp/hHVcysrMvy1CzW17Myh+Yj
         aOUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si15471957ybm.399.2022.01.03.00.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jan 2022 00:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:56422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n4J0V-0004Mk-FN
	for alex.bennee@linaro.org; Mon, 03 Jan 2022 03:47:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzU-0004Ij-Sg; Mon, 03 Jan 2022 03:46:53 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:3436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n4IzS-0006Rk-2C; Mon, 03 Jan 2022 03:46:52 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JS8V86h57zcbh5;
 Mon,  3 Jan 2022 16:46:08 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 3 Jan 2022 16:46:40 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v6 2/7] hw/arm/virt: Support cluster level in DT cpu-map
Date: Mon, 3 Jan 2022 16:46:31 +0800
Message-ID: <20220103084636.2496-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220103084636.2496-1-wangyanan55@huawei.com>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
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
X-TUID: taxLtKaHfrDM

Support one cluster level between core and physical package in the
cpu-map of Arm/virt devicetree. This is also consistent with Linux
Doc "Documentation/devicetree/bindings/cpu/cpu-topology.txt".

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index f413e146d9..fc5eea8c8c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -430,9 +430,8 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
          * can contain several layers of clustering within a single physical
          * package and cluster nodes can be contained in parent cluster nodes.
          *
-         * Given that cluster is not yet supported in the vCPU topology,
-         * we currently generate one cluster node within each socket node
-         * by default.
+         * Note: currently we only support one layer of clustering within
+         * each physical package.
          */
         qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
 
@@ -442,14 +441,16 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
             if (ms->smp.threads > 1) {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/socket%d/cluster0/core%d/thread%d",
-                    cpu / (ms->smp.cores * ms->smp.threads),
+                    "/cpus/cpu-map/socket%d/cluster%d/core%d/thread%d",
+                    cpu / (ms->smp.clusters * ms->smp.cores * ms->smp.threads),
+                    (cpu / (ms->smp.cores * ms->smp.threads)) % ms->smp.clusters,
                     (cpu / ms->smp.threads) % ms->smp.cores,
                     cpu % ms->smp.threads);
             } else {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/socket%d/cluster0/core%d",
-                    cpu / ms->smp.cores,
+                    "/cpus/cpu-map/socket%d/cluster%d/core%d",
+                    cpu / (ms->smp.clusters * ms->smp.cores),
+                    (cpu / ms->smp.cores) % ms->smp.clusters,
                     cpu % ms->smp.cores);
             }
             qemu_fdt_add_path(ms->fdt, map_path);
-- 
2.27.0

