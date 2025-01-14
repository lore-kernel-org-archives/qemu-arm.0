Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2580691njn;
        Tue, 14 Jan 2025 09:46:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhMWK1+0DSE3jLDbz8Zgcv1HVoljT60/RoQnGIpo0hdRw0em0h6v59t5KG+pBvkYdl+So1L9UsNlLJRA==@linaro.org
X-Google-Smtp-Source: AGHT+IFpzewwfDHTgUyWGoBWxFJxvqRXkMB45dLOyzQqhF9WC3n8vXL0+6M+19DcYG9nmfyCpRBy
X-Received: by 2002:a05:620a:31a9:b0:7b6:ea91:d886 with SMTP id af79cd13be357-7bcd97b5a4amr4077630985a.39.1736876807747;
        Tue, 14 Jan 2025 09:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736876807; cv=none;
        d=google.com; s=arc-20240605;
        b=SeXdIsavWLga4DXfasV38GqF0QLRxBfOEuNfQ5DhNCmRZEhhMM3+hhafKoPKQPfwa8
         gOIU3kAZjBl3XEUwK2zeTYKwFCmv0IHgBAQatrmRiw1M5yOISck2fjHjClTe3jNmuPTh
         EUR3JBgMKfZ/PuIBUQqNuyClp7BKUYbgIhAbR3sJTSqjSkY51aznboUiNvfcFBt/wMcf
         J462oNBHJiLAtiC6tTrBp9G/j85qkvLVZIIaVDr/+0InqLrHR4RpYsstzyI3IKBbuyiF
         xMXSfie3kHlO+Da0wwns+pw5Wx/MAa4A+ZcHqdFiB8UY5wbqAiytKrVYEst5G7oS20nT
         /x9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=d2cGVDYg1VgNcUjdIWml+drkEFgFiu6DMt2gdQCNY5k=;
        fh=u35wjCyBUalnTisuY87AvAhLybom2PQyiZZ8ckjJPsw=;
        b=FQZq8zA6icBGoz/1i0Vql4QySC2RiRdfxeqFpSNT8cgSbrrLWlCrVw5TvEtiEWBLST
         7Z3C208Jj0kx8BgIICxeqhRx3ubQ1rIbCpu8n6en5AY34myY8i4l6fzpS1jLXYEnkuq3
         OG3rnpiJGYeafzNlWWSqBGkjpmWsxmQtROItNDR/arDzuYFyb7dukTlKLsmggIJvdFvL
         Nv9evi+EFlSeGRVrfz7BONlwpq9d/Nzby472EINEAvH9MaBU1Ed+dQg7HIovO8Fr97wA
         mzDj9b7uH4D1SoN7u7BP5L1WaSfp9JvbzCfuB+MnYOan+idayy88XjS6HGO70SfjAVJO
         pBFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be3cd7deefsi616391985a.395.2025.01.14.09.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 09:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXkzq-0001d6-4D; Tue, 14 Jan 2025 12:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXkzk-0001cl-2v; Tue, 14 Jan 2025 12:46:29 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXkzg-0004cN-7u; Tue, 14 Jan 2025 12:46:27 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXc2L1n6Vz6M4Q1;
 Wed, 15 Jan 2025 01:44:26 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 2F13C140B35;
 Wed, 15 Jan 2025 01:46:10 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 18:46:08 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>, <linuxarm@huawei.com>, 
 <shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [RFC PATCH v6 0/6] Specifying cache topology on ARM
Date: Tue, 14 Jan 2025 17:45:54 +0000
Message-ID: <20250114174601.23-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.72.65]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-1.794, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6lTS3lQs16Fw

Specifying the cache layout in virtual machines is useful for
applications and operating systems to fetch accurate information about
the cache structure and make appropriate adjustments. Enforcing correct
sharing information can lead to better optimizations. This patch enables
the specification of cache layout through a command line parameter,
building on a patch set by Intel [1,2,3]. It uses this set as a
foundation.  The device tree and ACPI/PPTT table, and device tree are
populated based on user-provided information and CPU topology.

Example:


+----------------+                            +----------------+
|    Socket 0    |                            |    Socket 1    |
|    (L3 Cache)  |                            |    (L3 Cache)  |
+--------+-------+                            +--------+-------+
         |                                             |
+--------+--------+                            +--------+--------+
|   Cluster 0     |                            |   Cluster 0     |
|   (L2 Cache)    |                            |   (L2 Cache)    |
+--------+--------+                            +--------+--------+
         |                                             |
+--------+--------+  +--------+--------+    +--------+--------+  +--------+----+
|   Core 0         | |   Core 1        |    |   Core 0        |  |   Core 1    |
|   (L1i, L1d)     | |   (L1i, L1d)    |    |   (L1i, L1d)    |  |   (L1i, L1d)|
+--------+--------+  +--------+--------+    +--------+--------+  +--------+----+
         |                   |                       |                   |
+--------+              +--------+              +--------+          +--------+
|Thread 0|              |Thread 1|              |Thread 1|          |Thread 0|
+--------+              +--------+              +--------+          +--------+
|Thread 1|              |Thread 0|              |Thread 0|          |Thread 1|
+--------+              +--------+              +--------+          +--------+


The following command will represent the system relying on **ACPI PPTT tables**.

./qemu-system-aarch64 \
 -machine virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluseter,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
 -cpu max \
 -m 2048 \
 -smp sockets=2,clusters=1,cores=2,threads=2 \
 -kernel ./Image.gz \
 -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
 -initrd rootfs.cpio.gz \
 -bios ./edk2-aarch64-code.fd \
 -nographic

The following command will represent the system relying on **the device tree**.

./qemu-system-aarch64 \
 -machine virt,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluseter,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
 -cpu max \
 -m 2048 \
 -smp sockets=2,clusters=1,cores=2,threads=2 \
 -kernel ./Image.gz \
 -append "console=ttyAMA0 root=/dev/ram rdinit=/init" \
 -initrd rootfs.cpio.gz \
 -nographic

Failure cases:
    1) There are scenarios where caches exist in systems' registers but
    not left unspecified by users. In this case qemu returns failure.

    2) At the moment, the device tree is not able to describe caches
    shared at core level. In another word, SMT threads cannot share
    caches. This will need adjustments in the SPEC. It is worth noting
    that this particular case is completely OK in ACPI PPTT tables.

Currently only three levels of caches are supported to be specified from
the command line. However, increasing the value does not require
significant changes. Further, this patch assumes l2 and l3 unified
caches and does not allow l(2/3)(i/d). The level terminology is
thread/core/cluster/socket right now.

Here is the hierarchy assumed in this patch:
Socket level = Cluster level + 1 = Core level + 2 = Thread level + 3;

TODO:
  1) Making the code to work with arbitrary levels
  2) Separated data and instruction cache at L2 and L3.
  3) Additional cache controls.  e.g. size of L3 may not want to just
  match the underlying system, because only some of the associated host
  CPUs may be bound to this VM.

Depends-on: Building PPTT with root node and identical implementation flag
Depends-on: Msg-id: 20240926113323.55991-1-yangyicong@huawei.com

Depends-on: i386: Support SMP Cache Topology
Depends-on: Msg-id: 20241219083237.265419-1-zhao1.liu@intel.com

[1] https://lore.kernel.org/kvm/20240908125920.1160236-1-zhao1.liu@intel.com/
[2] https://lore.kernel.org/qemu-devel/20241101083331.340178-1-zhao1.liu@intel.com/ 
[3] https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/

Change Log:
  v5->v6:
   * Minor bug fix.
   * rebase based on new Intel patchset.
     - https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/
  v4->v5:
    * Added Reviewed-by tags.
    * Applied some comments.
  
  v3->v4:
    * Device tree added.


Alireza Sanaee (6):
  target/arm/tcg: increase cache level for cpu=max
  arm/virt.c: add cache hierarchy to device tree
  bios-tables-test: prepare to change ARM ACPI virt PPTT
  hw/acpi/aml-build.c: add cache hierarchy to pptt table
  tests/qtest/bios-table-test: testing new ARM ACPI PPTT topology
  Update the ACPI tables according to the acpi aml_build change, also
    empty bios-tables-test-allowed-diff.h.

Yicong Yang (1):
  tests: virt: Update expected ACPI tables for virt test

 hw/acpi/aml-build.c                           | 205 +++++++++-
 hw/arm/virt-acpi-build.c                      |   8 +-
 hw/arm/virt.c                                 | 349 ++++++++++++++++++
 hw/cpu/core.c                                 |  92 +++++
 include/hw/acpi/aml-build.h                   |   4 +-
 include/hw/arm/virt.h                         |   4 +
 include/hw/cpu/core.h                         |  27 ++
 target/arm/tcg/cpu64.c                        |  13 +
 tests/data/acpi/aarch64/virt/PPTT             | Bin 76 -> 96 bytes
 .../data/acpi/aarch64/virt/PPTT.acpihmatvirt  | Bin 156 -> 176 bytes
 tests/data/acpi/aarch64/virt/PPTT.topology    | Bin 336 -> 540 bytes
 tests/qtest/bios-tables-test.c                |   4 +
 12 files changed, 699 insertions(+), 7 deletions(-)

-- 
2.34.1

