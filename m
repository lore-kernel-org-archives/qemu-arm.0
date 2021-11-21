Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp5342098lfk;
        Sun, 21 Nov 2021 04:25:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgIAv0pf5cD8KM6PsvCTF5NRh7NTJFi+hYe/FPXmjZzqJcrdUksYIWW5rnqP+lHM3PDGsP
X-Received: by 2002:a05:620a:12ac:: with SMTP id x12mr41520088qki.144.1637497537756;
        Sun, 21 Nov 2021 04:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637497537; cv=none;
        d=google.com; s=arc-20160816;
        b=FhaLg/uHIfiGrO+cQPunAUjMOFVtvVp6z57W0e8f1GmoEFpTYT7MaHxJB1L69/+UEE
         H7JanRTUwvsTztU3QS25M7AgH5o+BfkxwEBW+V48tkDlmzmHz9QV1Yl0Qkw9IJ4jVH3h
         UgIKHLfUhKBOyYL738SIHUKIE5ReWKzubhAbXI2xT904ZcEJbYkRMNp6OXFWT10kt6Ja
         haHxlm2eYhX4HIjZbouBNw89Xe8OfB1pnkwJTD3mOEtfNobUMCOR6/q53fpcCmNPHCsM
         N1XjBs9AuP0uvbc4uCRKULi/kVgPxP/G5h/8Pv4YsReNRQfBBc9H1I0x60pxXs82dUaJ
         XyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=SMXPXZ45zVWEPT+ZpBq3G5bygsbDspUEDkqP0tV/JBM=;
        b=OCeTUYVOkfihNXXIaMKzPNZy4bBx/CXSHB4dzeJsac6/LzjRzklPAdUtp0T6TfPjrU
         cbkaNp0CSyv4UcNHkSauDbVQ7DKFyOYcGA5l6itvnKVpWtPu+vmdiV8mOMaIQc5I1co9
         2oRIIoqKrcgYSeF1hV/GTM/VI+hmCoYewglyaBm1Ro4xfmCP6kfIVsR/rAP2Sw+Wf+v0
         tjZJsNa7aOmg1hb/5ib0a7o9gv81M1HHt1mX4r17sLau1rIIySAtsUNI0nmqodqggTX8
         /7nfuPbfyLIxo9hgYLaeAXIj3lrfdAz3EMCXrzp85D0QBpJAcY4mOcdC2XQU8uhwSJOL
         Sy0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si10996707qty.396.2021.11.21.04.25.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 04:25:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1molub-0003q5-27
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 07:25:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluL-0003oi-0H; Sun, 21 Nov 2021 07:25:21 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1moluH-0005lu-Sh; Sun, 21 Nov 2021 07:25:20 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HxqH12MTvzcZxK;
 Sun, 21 Nov 2021 20:20:13 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 21 Nov 2021 20:25:10 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones
 <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Markus Armbruster <armbru@redhat.com>, Eric
 Blake <eblake@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH v4 04/10] hw/arm/virt: Support clusters on ARM virt machines
Date: Sun, 21 Nov 2021 20:24:56 +0800
Message-ID: <20211121122502.9844-5-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20211121122502.9844-1-wangyanan55@huawei.com>
References: <20211121122502.9844-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangyanan55@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: NgvYf1cAr9TT

In implementations of ARM64 architecture, at most there could be
a CPU topology hierarchy like "sockets/dies/clusters/cores/threads"
defined. For example, some ARM64 server chip Kunpeng 920 totally
has 2 sockets, 2 NUMA nodes (also represent CPU dies range) in each
socket, 6 clusters in each NUMA node, 4 CPU cores in each cluster.

Clusters within the same NUMA share the L3 cache data and cores
within the same cluster share a L2 cache and a L3 cache tag.
Given that designing a vCPU topology with cluster level for the
guest can gain scheduling performance improvement, let's support
this new parameter on ARM virt machines.

After this, we can define a 4-level CPU topology hierarchy like:
cpus=*,maxcpus=*,sockets=*,clusters=*,cores=*,threads=*.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 hw/arm/virt.c   |  1 +
 qemu-options.hx | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 369552ad45..b2129f7ccd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2698,6 +2698,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     hc->unplug_request = virt_machine_device_unplug_request_cb;
     hc->unplug = virt_machine_device_unplug_cb;
     mc->nvdimm_supported = true;
+    mc->smp_props.clusters_supported = true;
     mc->auto_enable_numa_with_memhp = true;
     mc->auto_enable_numa_with_memdev = true;
     mc->default_ram_id = "mach-virt.ram";
diff --git a/qemu-options.hx b/qemu-options.hx
index 0f26f7dad7..74d335e4c3 100644
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
2.19.1

