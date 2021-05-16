Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp348299lfm;
        Sun, 16 May 2021 03:33:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySGcB1xBWYI0iXW1Q4FZ8a9u8gkamEEkM5JaVeSMClKYJGAp1lkWiFCeGT13DLMtOiUpIp
X-Received: by 2002:a92:dc90:: with SMTP id c16mr49316787iln.11.1621161189869;
        Sun, 16 May 2021 03:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621161189; cv=none;
        d=google.com; s=arc-20160816;
        b=ABA6MDTLVKiu7hS7J6st5EhjztoPo6kq8vCeTDIC1/yiofHz+jWfBQMtOjSEQC6jFP
         fjepjV0UaFa6y2xEQJUVNZg+X5HxalXctBX/m1wBM1Q8Vsc6ve0euzmiDxTG5EU+AZGO
         xX42VaC9p0ixlla3Xzuj8n18OE56uiwY9dq3hxSOHYhVALQe0Q/0ob7uDss8CA6gtXJl
         d8hs1zBirY6ryIUIw2b3KIAWiLRrvWwoc8iIJIqsOeIGboKidSA8WuMyrs80af1GyxH6
         FrOIcajyP2ndq211xXOKOxeSK96Y++GZSCUQpGvfC6eC0P2O82J5J31lb07X3EUKIRGI
         zhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=YRlEUCDSBO7eu/j8jzuc2tpoRCzv1C8eee9pdvwR9U0=;
        b=HXlzSLDHGmwQzGdLOB6w0e9Oz0bvNEcZtic/nbuhFz1GwMmBVmv+YgqPV51VskYhPA
         uGKebN3pYJhdoVz6igyRgXrxIqVY/e2azBzN3SAasqHjsaRrCEoxC+MYoaoiJhVwCuz9
         E9JxveC6VUzvxwKx9e9nJTCoDtShq1dRD9e0ybauHgUcY0JIUlAWh1MmFKgOfnIeJuMj
         qEWMSaUQSX3gXYCuYck3+XdSF//jW+Ryp8oPuxC6JioyZ8z+bin5dCXr3hnfmqX0B8IS
         OV+6519wMmClqunkvYrxzBodBvmSwkglpTHUV/9rIhCTPaBM5EOV82yXjxrE5bpVGfkM
         aOPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si13901427ilh.102.2021.05.16.03.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 May 2021 03:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liE57-00015W-4s
	for alex.bennee@linaro.org; Sun, 16 May 2021 06:33:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4d-0008On-81; Sun, 16 May 2021 06:32:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1liE4a-0000kQ-QS; Sun, 16 May 2021 06:32:38 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fjdm049QJzmhLC;
 Sun, 16 May 2021 18:29:04 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:31 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 16 May 2021 18:32:30 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Jones <drjones@redhat.com>, "Michael S .
 Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Shannon Zhao
 <shannon.zhaosl@gmail.com>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [RFC PATCH v3 0/4] hw/arm/virt: Introduce cluster cpu topology support
Date: Sun, 16 May 2021 18:32:24 +0800
Message-ID: <20210516103228.37792-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, prime.zeng@hisilicon.com,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com, yangyicong@huawei.com,
 zhukeqian1@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H3RUlulFMdRy

Hi,

This is v3 of the series [1] that I posted to introduce cluster cpu topology
besides now existing sockets, cores, and threads for ARM platform.

Description:
In implementations of ARM architecture, at most there could be a
cpu hierarchy like "sockets/dies/clusters/cores/threads" defined.
For example, ARM64 server chip Kunpeng 920 totally has 2 sockets,
2 NUMA nodes (also means cpu dies) in each socket, 6 clusters in
each NUMA node, 4 cores in each cluster, and doesn't support SMT.
Clusters within the same NUMA share a L3 cache and cores within
the same cluster share a L2 cache.

The cache affinity of ARM cluster has been proved to improve the
kernel scheduling performance and a patchset [2] has been posted,
where a general sched_domain for clusters was added and a cluster
level was added in the arch-neutral cpu topology struct like below.

struct cpu_topology {
    int thread_id;
    int core_id;
    int cluster_id;
    int package_id;
    int llc_id;
    cpumask_t thread_sibling;
    cpumask_t core_sibling;
    cpumask_t cluster_sibling;
    cpumask_t llc_sibling;
}

In virtuallization, exposing the cluster level topology to guest
kernel may also improve the scheduling performance. So let's add
the -smp, clusters=* command line support for ARM cpu, then users
will be able to define a four-level cpu hierarchy for machines
and it will be sockets/clusters/cores/threads.

In this series, we only add the cluster concept of cpu topology
for ARM platform currently, and only focus on exposure of the
topology to guest through ACPI and DT.

[1] https://patchwork.kernel.org/project/qemu-devel/cover/20210413083147.34236-1-wangyanan55@huawei.com/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20210420001844.9116-1-song.bao.hua@hisilicon.com/

Test results about exposure of topology:
After applying this patch series, launch a guest with virt-6.1.

Cmdline: -smp 96, sockets=2, clusters=12, cores=4, threads=1
Output:
linux-atxcNc:~ # lscpu
Architecture:        aarch64
Byte Order:          Little Endian
CPU(s):              96
On-line CPU(s) list: 0-95
Thread(s) per core:  1
Core(s) per socket:  48
Socket(s):           2
NUMA node(s):        1
Vendor ID:           0x48

Topology information of clusters can also be got:
cat /sys/devices/system/cpu/cpu0/topology/cluster_cpus_list: 0-3
cat /sys/devices/system/cpu/cpu4/topology/cluster_cpus_list: 4-7
cat /sys/devices/system/cpu/cpu8/topology/cluster_cpus_list: 8-11
...

cat /sys/devices/system/cpu/cpu95/topology/cluster_cpus_list: 92-95

THINGS TO DO SOON:
1) Run some benchmark to test the scheduling improvement of guest kernel
   introduced by cluster level virtual topology
2) Add some QEMU tests about ARM vcpu topology, ACPI PPTT table, and DT
   cpu nodes. Will post in a separate patchset later.

---

Changelogs:
v2->v3:
- Address comments from Philippe, and Andrew. Thanks!
- Rebased the code on v3 of series " hw/arm/virt: Introduce cpu topology support"
- v2: https://patchwork.kernel.org/project/qemu-devel/cover/20210413083147.34236-1-wangyanan55@huawei.com/

v1->v2:
- Only focus on cluster support for ARM platform
- v1: https://patchwork.kernel.org/project/qemu-devel/cover/20210331095343.12172-1-wangyanan55@huawei.com/

---

Yanan Wang (4):
  vl.c: Add -smp, clusters=* command line support for ARM cpu
  hw/arm/virt: Add cluster level to device tree
  hw/arm/virt-acpi-build: Add cluster level to PPTT table
  hw/arm/virt: Parse -smp cluster parameter in virt_smp_parse

 hw/arm/virt-acpi-build.c | 45 ++++++++++++++++++++++++----------------
 hw/arm/virt.c            | 44 +++++++++++++++++++++++----------------
 include/hw/arm/virt.h    |  1 +
 qemu-options.hx          | 26 +++++++++++++----------
 softmmu/vl.c             |  3 +++
 5 files changed, 72 insertions(+), 47 deletions(-)

-- 
2.19.1

