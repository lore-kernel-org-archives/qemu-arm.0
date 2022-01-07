Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp1604501lfb;
        Fri, 7 Jan 2022 00:32:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxl+qlZbZF6oxZ+qgQA3H++U2xjZ/g5c1OaIv7gdjNrVbF4FWgsMyFZucxesy4IAXtp0fHM
X-Received: by 2002:a37:de09:: with SMTP id h9mr43296672qkj.764.1641544377980;
        Fri, 07 Jan 2022 00:32:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641544377; cv=none;
        d=google.com; s=arc-20160816;
        b=H1wia2To0tTUW3cmqeK7Ja/lSnjT5tjZhjd/bD+TOtJyuy1y0G3K8D9VpJcpeEfuN3
         +vyKDLBIfD/ggVCrntCRMGUg1EMCM6HShXU+/EvrdY3Q8zrTwEx6y1kgd4vEp/s8rBOD
         fCdbZJPZQ5hyAuh8qAenElO+ZFQzr6pz9ZNLctNjU72jIG4dnW+l10hAsc5UZr8w7Cvz
         j99dhx11cIyeYcmREvmJ1yJMmB6TAamXtIUR6YQ17nWqgVZzjXFj+fAIjrqYH/KTF0cW
         oDph53gr0TKPC78vR+u0DHXocVxuPritrMjpw50z9fUKJT5axBqzbpI2H6Gh/rOVloIp
         iIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=9mJnTZJ6DjcpLaT5Q512j5+oSIB8vR+CQAzJ3DPRVZM=;
        b=pcSIZ2u6/p+B83NwG8p3BeLhLuEWLwHZAwbdhASYEJZ0WBmrswGZEqK10ocxgtgvLp
         FZnBLHU5YyYqxBXIfMdrZEjz2BAlqvU9vG6glyJB1fNrMtSdhFdXiu6xF1lidPyVrCwa
         RSmtnvI3TSCnJaf+FKKmfTMPm0L6mkU382r0VBPhLNvICctU4i4CKXVHwB+ZIOZqy+Df
         UbX37xfyNIsVrlkXQIz4U0TR0pyxTbLJaObSL9EBQJHuMAH0L/J7Avod319OlAiYQpUp
         qEeYeM8lt3te1g3tok2CjX9ETk2UaIKvjWvB8M7K9NQQ9Hh+aP9y39fRZZLH92APFLY4
         AWbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si1492482qkb.32.2022.01.07.00.32.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jan 2022 00:32:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n5kgD-0000O8-Fw
	for alex.bennee@linaro.org; Fri, 07 Jan 2022 03:32:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg2-0000N9-UL; Fri, 07 Jan 2022 03:32:46 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:5092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1n5kg0-0001dh-8T; Fri, 07 Jan 2022 03:32:46 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JVbzS1Kvhz9rx6;
 Fri,  7 Jan 2022 16:31:32 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Fri, 7 Jan 2022 16:32:35 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov
 <imammedo@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha
 <ani@anisinha.ca>, Eric Auger <eauger@redhat.com>,
 <wanghaibin.wang@huawei.com>, Yanan Wang <wangyanan55@huawei.com>
Subject: [PATCH v7 1/6] hw/arm/virt: Support CPU cluster on ARM virt machine
Date: Fri, 7 Jan 2022 16:32:27 +0800
Message-ID: <20220107083232.16256-2-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20220107083232.16256-1-wangyanan55@huawei.com>
References: <20220107083232.16256-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
X-TUID: mu2fBFh5fmVe

ARM64 machines like Kunpeng Family Server Chips have a level
of hardware topology in which a group of CPU cores share L3
cache tag or L2 cache. For example, Kunpeng 920 typically
has 6 or 8 clusters in each NUMA node (also represent range
of CPU die), and each cluster has 4 CPU cores. All clusters
share L3 cache data, but CPU cores in each cluster share a
local L3 tag.

Running a guest kernel with Cluster-Aware Scheduling on the
Hosts which have physical clusters, if we can design a vCPU
topology with cluster level for guest kernel and then have
a dedicated vCPU pinning, the guest will gain scheduling
performance improvement from cache affinity of CPU cluster.

So let's enable the support for this new parameter on ARM
virt machines. After this patch, we can define a 4-level
CPU hierarchy like: cpus=*,maxcpus=*,sockets=*,clusters=*,
cores=*,threads=*.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c   |  1 +
 qemu-options.hx | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 6bce595aba..f413e146d9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2700,6 +2700,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
+    mc->smp_props.clusters_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
diff --git a/qemu-options.hx b/qemu-options.hx
index fd1f8135fb..69ef1cdb85 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -277,6 +277,16 @@ SRST
 
         -smp 16,sockets=2,dies=2,cores=2,threads=2,maxcpus=16
 
+    The following sub-option defines a CPU topology hierarchy (2 sockets
+    totally on the machine, 2 clusters per socket, 2 cores per cluster,
+    2 threads per core) for ARM virt machines which support sockets/clusters
+    /cores/threads. Some members of the option can be omitted but their values
+    will be automatically computed:
+
+    ::
+
+        -smp 16,sockets=2,clusters=2,cores=2,threads=2,maxcpus=16
+
     Historically preference was given to the coarsest topology parameters
     when computing missing values (ie sockets preferred over cores, which
     were preferred over threads), however, this behaviour is considered
-- 
2.27.0

