Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp323127lfg;
        Wed, 31 Mar 2021 02:55:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwz+3vJz/fRj3T6WqG7piyRb2GG91rIGbjERC6Rs+6Q1vnaX83Nrf2p/HGm3hHJNAknklI
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr3273268ybv.79.1617184534039;
        Wed, 31 Mar 2021 02:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617184534; cv=none;
        d=google.com; s=arc-20160816;
        b=cTt6OMXAv+R4JzY4di9Mf6d6tGTDdATGGgi2JzCFWOD0CZrO8p7SI+pWWVT0SUnlX7
         JcU94Fnw6KRDqYgjJrg3TtbScqD2Zv5wPON4Ym96jsrIYP08vALktu2NE7BqitVMLObE
         1mBgIkyAzsK3/4jNG0/bqvfFIXVLxXKArU2VUuUxcWxqMnJd+A2z6IZFb0JEWGJUgjP2
         pFeEVe2X/x+SUiXdamtQJZg611trznZpbNhlfCC4ysaClvc3vQaulq2/hNZ5j5l9RuLY
         gHaU6RuqyTi0SHLGeV8b6YvDd1fxQiLzUEEqaK/e5w4QO9IBgSY2mdrwu1ogIxGLUAjm
         j6sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=ab8rnVcNhkOmDg8dQqvd3Y1fG+zrFKp/gMH5aJnY6cc=;
        b=fUloDP8XRYZCrHA+X4SYGrcmRayZROoC3h6WlnYJFWqA5FqeahVqyv2eMpQ2oom14h
         tW51dcV2hRxefdfNEtG5/+EUFzKOdXVvf3lYlk0MS422jP3eB6bYQDEoHy+7Ed0a84Co
         cprfSrQKrmZ6Yvsx3lcViNRFE4Ozpahk30PLs6F43xa82M+NQXijO8vDYFMND+/xsBpM
         zmFMe3Unz59wqhHXqnemjBpHR1JCivydd8coeOeo5J3VsheBiEQHGBSqNkrtUTZgLg+g
         40GO1zhSL66QZnQfQ75X43FM+I8YiYuGd+eU+cXDARmpFJBNJitQKUZbsX10Mb7DuLhh
         Kzyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si1982481ybe.45.2021.03.31.02.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Mar 2021 02:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:34638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lRXZV-0003if-CP
	for alex.bennee@linaro.org; Wed, 31 Mar 2021 05:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXYL-0002kl-ID; Wed, 31 Mar 2021 05:54:21 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:4058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lRXY5-0002af-E3; Wed, 31 Mar 2021 05:54:20 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F9M6n755RzlWkx;
 Wed, 31 Mar 2021 17:52:17 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 17:53:54 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH 6/6] hw/arm/virt: Add cluster level for ARM device tree
Date: Wed, 31 Mar 2021 17:53:43 +0800
Message-ID: <20210331095343.12172-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210331095343.12172-1-wangyanan55@huawei.com>
References: <20210331095343.12172-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=wangyanan55@huawei.com; helo=szxga06-in.huawei.com
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo
 Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 02d9j0EAOoFc

Add a cluster level between core level and package level for
ARM device tree.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c9ad76ff64..d78db3387e 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -430,14 +430,20 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
             if (ms->smp.threads > 1) {
                 map_path = g_strdup_printf(
-                            "/cpus/cpu-map/%s%d/%s%d/%s%d",
-                            "socket", cpu / (ms->smp.cores * ms->smp.threads),
+                            "/cpus/cpu-map/%s%d/%s%d/%s%d/%s%d",
+                            "socket",
+                            cpu / (ms->smp.clusters * ms->smp.cores *
+                            ms->smp.threads),
+                            "cluster",
+                            (cpu / (ms->smp.cores * ms->smp.threads)) %
+                            ms->smp.clusters,
                             "core", (cpu / ms->smp.threads) % ms->smp.cores,
                             "thread", cpu % ms->smp.threads);
             } else {
                 map_path = g_strdup_printf(
-                            "/cpus/cpu-map/%s%d/%s%d",
-                            "socket", cpu / ms->smp.cores,
+                            "/cpus/cpu-map/%s%d/%s%d/%s%d",
+                            "socket", cpu / (ms->smp.clusters * ms->smp.cores),
+                            "cluster", (cpu / ms->smp.cores) % ms->smp.clusters,
                             "core", cpu % ms->smp.cores);
             }
             qemu_fdt_add_path(vms->fdt, map_path);
-- 
2.19.1

