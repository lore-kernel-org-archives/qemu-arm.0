Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp349741lfm;
        Sun, 16 May 2021 03:36:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuLQdJOdaOBoAYzXEMhbw6czJJDsZ5UENQ0U9pbMnSBWAPPdJFUsIwPB8E0ChmitXLnTnC
X-Received: by 2002:a25:6557:: with SMTP id z84mr57703941ybb.88.1621161373413;
        Sun, 16 May 2021 03:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621161373; cv=none;
        d=google.com; s=arc-20160816;
        b=dAesQqoLMvsh3+9A588Db4uQx6nh7fiolXCPGsP4TGhAUZgxnlSdWw4KAaAticvYeQ
         a9XScFwBmTCw963evEzUFx4Now4Den7Gw0FsQt6omKW8otVMdKQk197s/yZ0aOc9Yo7a
         eQ38VPz6G3lQd716aXE7Dl9V4jlEQjlOo79J2HwZ/qo93ztXcPHJkW1nKwh0YUwqSmUh
         YeZSYxsMl6Wwhe9Q3gjOgJy+sB6O/Tgjh0W46ptS2AjcKAPoFEBnAUZ/r+ErtIDYLQKe
         IxfbP4WsMhr7yInr6zSCQSDFtpNVRJI0srG0SvGxf/cWYWZOoGpNMySyUZiv3uBbQMeq
         wqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=tRiFfIug3oHhiSm+sJKB0QZsLcyAtzHCoq4cPJj1bDE=;
        b=t0VD5ucw4xpK9g+1dExc4LpSA0SoEdqpnnlLK4YWkpCHeGzbW5JkVN4gjaUcHt3H18
         dMZ4fKyU4mMlo2ZWaU4eZDtmaZJayZ9n1zf9D4TrgpFMpJbmQiJxLGg8rh/ynqGHVzSv
         Qk4RRbkjyfy/EI09IzcCULtAdWH1r6J6ZSInzC8o+xAiQF+SsZPsfj7eQBQlHw3cgS4y
         UgWKihUKV5Tr94Q7zkvZcB2T7bz+lkkKcY4AXGTQltIuOuIMbYOhL39/XiRqWEN0jTrh
         SHaCiwqDoOs6292ML7HF9x7UhEOJztEeJXYBLy7DzK0y8ZSPQ2R+nLmCKUHRYyD7zfnE
         0r0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z129si12157722ybz.493.2021.05.16.03.36.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:36:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:42316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liE84-0007EV-Dp
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4h-0008To-J0; Sun, 16 May 2021 06:32:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4b-0000mI-5S; Sun, 16 May 2021 06:32:43 -0400
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fjdm23s16zPxrT;
 Sun, 16 May 2021 18:29:06 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:33 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:32 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 2/4] hw/arm/virt: Add cluster level to device tree
Date: Sun, 16 May 2021 18:32:26 +0800
Message-ID: <20210516103228.37792-3-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210516103228.37792-1-wangyanan55@huawei.com>
References: <20210516103228.37792-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangyanan55@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Barry Song <song.bao.hua@hisilicon.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lboj856wtxIH

Add a cluster level between core level and socket level to ARM
device tree. This is also consistent with content in Linux Doc
"Documentation/devicetree/bindings/cpu/cpu-topology.txt".

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 44e990e3be..7de822e491 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -431,14 +431,18 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
             if (ms->smp.threads > 1) {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
-                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
+                    "/cpus/cpu-map/%s%d/%s%d/%s%d/%s%d",
+                    "socket", cpu / (vms->smp_clusters * ms->smp.cores *
+                    ms->smp.threads),
+                    "cluster", (cpu / (ms->smp.cores * ms->smp.threads)) %
+                    vms->smp_clusters,
                     "core", (cpu / ms->smp.threads) % ms->smp.cores,
                     "thread", cpu % ms->smp.threads);
             } else {
                 map_path = g_strdup_printf(
-                    "/cpus/cpu-map/%s%d/%s%d",
-                    "socket", cpu / ms->smp.cores,
+                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
+                    "socket", cpu / (vms->smp_clusters * ms->smp.cores),
+                    "cluster", (cpu / ms->smp.cores) % vms->smp_clusters,
                     "core", cpu % ms->smp.cores);
             }
             qemu_fdt_add_path(ms->fdt, map_path);
-- 
2.19.1

