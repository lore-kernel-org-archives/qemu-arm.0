Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp6327770lfb;
        Tue, 28 Dec 2021 01:27:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBF5aTN1zNxaWpuBvqTc8L6UJZ5RvaBfuXAOAipGiQDd9bi47apeK5Gt/5RbbqttNCdwak
X-Received: by 2002:a25:4285:: with SMTP id p127mr8437069yba.261.1640683656614;
        Tue, 28 Dec 2021 01:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1640683656; cv=none;
        d=google.com; s=arc-20160816;
        b=D3KZNyR6EwiicFHofmHVQ2mdtCNTCFxkzhCQh34lU1MJ8s33eGy/1dqQORM6ynzGne
         X/9a8xmxsxmBu6u/Qx4Ks9R9soTkvjR7moftiSb+q8RSVsRWcUMK85xO3hrqhuynrINM
         Z7idqsqsJZQ6ubeRYy0BGjsisliIIxMmSkQyM+/2DZKlEKtTW/mPD7eJ3NxS8Xqri1X4
         GZZyphr/slFc5DoJFfCxK7FwK/NVkxQvOk5i9VpBCf7ltpHH+y0eI8xmn27psrNMnxsx
         6EYyWmt5j31H2hWRldzzKrZp3oYIMAqJweXSy3rJucVej6Nx2wSoajvc0YVXoDbcRcO4
         hsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=FXYiiXD5ERzmHZVnk8OaIEFOH1pIB5aphae5eBBBpCE=;
        b=T12m3FFCfruuYlmPtKHIOjdpOpJ8wnuhoa0sAEETY8clhvXQLDU3iquKFQOhYwrl8f
         ULLLawQxAnEvPkiYBoQ7Ayj9YuxO5QOhhcUNCc0H38yuxdwxCsv//oz0O6/W5BREzoYS
         v1DkFsgf33wyCPClfd3biyKS4bLrTVQRu+jXQJlbFeBqsVT2YpXHyQ8LPjfQIRL1O5jB
         vIVZmf5ITq0pM0kvTxob4tYwqeXg9jBoNpPZr3Zdv6QdTofKsA2F3wr6PbBBOwVftYnT
         RYi6/PoDDA24z84NJaEJf9dFVTdI4/rGJrSbvmpm+mPdc/jooGivy3IkIUXC46iO2db6
         8npg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x6si4021499ybs.361.2021.12.28.01.27.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Dec 2021 01:27:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:49194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n28lc-0007rf-2w
	for alex.bennee@linaro.org; Tue, 28 Dec 2021 04:27:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h7-0007y2-Vr; Tue, 28 Dec 2021 04:22:58 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:3061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n28h5-0007BC-Tx; Tue, 28 Dec 2021 04:22:57 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JNTZm46Y7zQj8F;
 Tue, 28 Dec 2021 17:22:24 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 28 Dec 2021 17:22:51 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <ani@anisinha.ca>, Markus
 Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v5 09/14] hw/arm/virt: Support cluster level in DT cpu-map
Date: Tue, 28 Dec 2021 17:22:16 +0800
Message-ID: <20211228092221.21068-10-wangyanan55@huawei.com>
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
X-TUID: ArvkZ5uFFhYl

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

