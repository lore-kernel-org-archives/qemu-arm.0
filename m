Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1288452njc;
        Mon, 10 Mar 2025 09:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW82t0x8JtUnTRnbo5D1u/+HYX6In2yRk20xxpHQ9NA0IVHbvn7NjTrJtDxyPOocSfJ4Agrxk1oEAbr5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFsQ7UzkAptmAIB4HaUjgff2/B0tLlActpIs5W3hokbDOUpj6I0QpIUpadzYrt8dllcHgRe
X-Received: by 2002:a05:622a:34a:b0:472:2077:827a with SMTP id d75a77b69052e-4761097cab3mr171647361cf.14.1741623853261;
        Mon, 10 Mar 2025 09:24:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741623853; cv=none;
        d=google.com; s=arc-20240605;
        b=IoInSkMWcW5JKb9jddP8fTOXhmxfCGaXUjLBdXZuV6lAzN6I0fAXBdIoX3ohOPh6io
         3FkiWna90w1cFjw15qlTrpaGQSOkV4jTS9BYBxfvZBs7+NT5F/+YOukjakCMlrcomMir
         I+sTYHi4Jwy3CGzUmmuV1YnpMC9+dLlr3QHMIT5t6zLFtW1LO0crEjlpZPMIcr0vIqF2
         lVfiV+hOUIkeyqIxsueCo5yTp5ysLCJR4pZ7RIGAA/X32zJxKOy4dF5TJMWSIqIoH+3b
         P/U2Pm7j0/4MHiGhENA8YyYjqJ1Biv6f1ry/SMevQHfQf5V9efa5UTyFVzeq/UzZTlOl
         1hbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=e9th4OpHtwbqdSGaCjm7GU9Ptc60rbplxNbsq0oMXms=;
        fh=0fAOdSjQv2x0RtOeWxHNS2tjJ6G6B4ms5PFLA9mBK/Y=;
        b=ipCzXCqh7HDrl0yHesfvnJYlxKcyUBiYI216Bt7H/QzY9pO4s8pQP2ZRE2pBcufdOa
         rCINgbAn+wJMFR4vxLKZ36GU3OkrdTarTHKntAlax+zmMJFsEnZAhuM80wAd2etFvf9h
         oJBrrh5VMh7Gt0S0aC+m3rx/DYExSxZ7sQkBavHuamd7Gpu+cWgrtqD0J7+NAKMnwUK9
         sVZMKSgSgjhjptd3K9KZgzYXToaQ8Zu09LUHRkO44pB3tRmE9NspxbxPJmILVJS/mCnZ
         VUCQWAoo5YTFanxqtfapHopCMiQ+bqtY1yv1dbofui/50Bx6De0uVBKtwBuo3lHC3yWq
         vbLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4766f87cab1si46679271cf.395.2025.03.10.09.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Mar 2025 09:24:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trfv6-0007ly-Em; Mon, 10 Mar 2025 12:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfv0-0007lZ-J3; Mon, 10 Mar 2025 12:23:55 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1trfuv-0001xC-KY; Mon, 10 Mar 2025 12:23:54 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBMXl1Mw4z6L4s6;
 Tue, 11 Mar 2025 00:19:19 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id D050814011F;
 Tue, 11 Mar 2025 00:23:41 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.68.114) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Mar 2025 17:23:40 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <mst@redhat.com>, <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>,
 <armbru@redhat.com>, <farman@linux.ibm.com>, <peter.maydell@linaro.org>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v8 0/6] Specifying cache topology on ARM
Date: Mon, 10 Mar 2025 16:23:31 +0000
Message-ID: <20250310162337.844-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.68.114]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: K5wAypqc05ey

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
 -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=off" \
 -initrd rootfs.cpio.gz \
 -nographic

Failure cases:
    1) There are scenarios where caches exist in systems' registers but
    left unspecified by users. In this case qemu returns failure.

    2) SMT threads cannot share caches which is not very common. More
    discussions here [4].

Currently only three levels of caches are supported to be specified from
the command line. However, increasing the value does not require
significant changes. Further, this patch assumes l2 and l3 unified
caches and does not allow l(2/3)(i/d). The level terminology is
thread/core/cluster/socket right now. Hierarchy assumed in this patch:
Socket level = Cluster level + 1 = Core level + 2 = Thread level + 3;

TODO:
  1) Making the code to work with arbitrary levels
  2) Separated data and instruction cache at L2 and L3.
  3) Additional cache controls.  e.g. size of L3 may not want to just
  match the underlying system, because only some of the associated host
  CPUs may be bound to this VM.

[1] https://lore.kernel.org/kvm/20240908125920.1160236-1-zhao1.liu@intel.com/
[2] https://lore.kernel.org/qemu-devel/20241101083331.340178-1-zhao1.liu@intel.com/
[3] https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/
[4] https://lore.kernel.org/devicetree-spec/20250203120527.3534-1-alireza.sanaee@huawei.com/

Change Log:
  v7->v8:
   * rebase: Merge tag 'pull-nbd-2024-08-26' of https://repo.or.cz/qemu/ericb into staging
   * I mis-included a file in patch #4 and I removed it in this one.

  v6->v7:
   * Intel stuff got pulled up, so rebase.
   * added some discussions on device tree.

  v5->v6:
   * Minor bug fix.
   * rebase based on new Intel patchset.
     - https://lore.kernel.org/qemu-devel/20250110145115.1574345-1-zhao1.liu@intel.com/

  v4->v5:
    * Added Reviewed-by tags.
    * Applied some comments.

  v3->v4:
    * Device tree added.

Depends-on: Building PPTT with root node and identical implementation flag
Depends-on: Msg-id: 20250306023342.508-1-alireza.sanaee@huawei.com

Alireza Sanaee (6):
  target/arm/tcg: increase cache level for cpu=max
  arm/virt.c: add cache hierarchy to device tree
  bios-tables-test: prepare to change ARM ACPI virt PPTT
  hw/acpi/aml-build.c: add cache hierarchy to pptt table
  tests/qtest/bios-table-test: testing new ARM ACPI PPTT topology
  Update the ACPI tables according to the acpi aml_build change, also
    empty bios-tables-test-allowed-diff.h.

 hw/acpi/aml-build.c                        | 205 +++++++++++-
 hw/arm/virt-acpi-build.c                   |   8 +-
 hw/arm/virt.c                              | 350 +++++++++++++++++++++
 hw/cpu/core.c                              |  92 ++++++
 hw/loongarch/virt-acpi-build.c             |   2 +-
 include/hw/acpi/aml-build.h                |   4 +-
 include/hw/arm/virt.h                      |   4 +
 include/hw/cpu/core.h                      |  27 ++
 target/arm/tcg/cpu64.c                     |  13 +
 tests/data/acpi/aarch64/virt/PPTT.topology | Bin 356 -> 540 bytes
 tests/qtest/bios-tables-test.c             |   4 +
 11 files changed, 701 insertions(+), 8 deletions(-)

-- 
2.34.1

