Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp4659798lfr;
        Tue, 13 Apr 2021 01:32:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV2l5MOdUZuLG0cy25QHKYIDop1OEF8G0j6wDgR0iykV9FX49ETN7YhZCnJ0uz+IN3vfv5
X-Received: by 2002:a37:a286:: with SMTP id l128mr14371361qke.285.1618302747212;
        Tue, 13 Apr 2021 01:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618302747; cv=none;
        d=google.com; s=arc-20160816;
        b=GF7V1LM4I6eBCFbxeECyoqe0+h+E5E6LYNC4iNRWg+UzROhcSqtzo7xhdqjIszp3lU
         WGmWaN1TvIvZN1un/lYSxIJLxey5jX8sVo6ozCxeYNyn8s8IQsc4jGwSNPpy5qh/d6kO
         QvGlIgI+pfUHOe0MNKL347573ibwhFK0ujgjUcJPppl4K1PGFNo5kI7+zWf3XsiSPBAI
         P8NFL/lPCJHKJ6sHKhpZPqQROKMnj6D0FsDMnMFR+hkMy2cNPH2C8REFUqoYAZKEkr50
         pY/QuPq9qYgub1DEVn1brNIiJFl121lBlPdYDwnlRSp6jmDQ7A09dfZLV6E+3PJiGbj/
         tMvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=qckx5ksb4NBy4crPmmrMl8pohnjqzn/0NcLXAGfkO64=;
        b=YuYBQV2/wx9UngEHM4JQ5bP/NDvwNmxynRf9JE8J5oLJaV8nZSzvqtubmbnach96P/
         bJ9Ka4zNQb+AJWs9lly34teHT38AWzacWaX6OcYyT77x8ql1rmKu5LU4JaOpV44XlJh0
         bAj37efRA2bioRYNFfl/225OzTQC4vrV96FBR2ldZnmxaUiuH25LnZL/vDmyBUV67Jyc
         TuuhIjj4Z9Dw6kpYrHxFKTh0HHrSf7XnOOuUFuBe1eLoVgd7G+NaodTR1oeUJDRRomdK
         Apn7/+wm2y0XFqezUYJ3A7w2wLDofwiR4ch3SifbZPR1PJBM079tIBepYMKWFeyarK5e
         zJNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t20si9598181qtp.328.2021.04.13.01.32.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 01:32:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWETC-0008Pm-8o
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 04:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESx-0008Ou-Er; Tue, 13 Apr 2021 04:32:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1lWESu-0004tL-Ld; Tue, 13 Apr 2021 04:32:11 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FKJgd21vrz1BGYC;
 Tue, 13 Apr 2021 16:29:49 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 16:31:58 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v2 4/4] hw/arm/virt: Add cluster level for device tree
Date: Tue, 13 Apr 2021 16:31:47 +0800
Message-ID: <20210413083147.34236-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210413083147.34236-1-wangyanan55@huawei.com>
References: <20210413083147.34236-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangyanan55@huawei.com; helo=szxga04-in.huawei.com
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
 "Michael S .
 Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com, yangyicong@huawei.com,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 Paolo Bonzini <pbonzini@redhat.com>, yuzenghui@huawei.com, Igor
 Mammedov <imammedo@redhat.com>, zhukeqian1@huawei.com,
 Jiajie Li <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EFzPV+THJ4/k

Add a cluster level between core level and package level for
ARM device tree.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 51797628db..4468a4734b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -434,14 +434,18 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
 
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

