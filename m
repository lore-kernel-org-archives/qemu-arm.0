Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2930382njc;
        Wed, 11 Jun 2025 08:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8zfZruNKS2HV209KY9iGOL47Kz8JwtufbGOJwsBKt+zaSlAS2mrfFmotgE7bbvP/zKksjbUExEDJeNw==@linaro.org
X-Google-Smtp-Source: AGHT+IHk6tPdcgVMA7MRbwm5aD6BPFMe24pkLiiwVjJb2og2s6mUvhFWPYtWUzrP9LnL0MGbT6Sz
X-Received: by 2002:a05:620a:288c:b0:7ce:bd8b:2d08 with SMTP id af79cd13be357-7d3b29d480amr11894685a.10.1749657442019;
        Wed, 11 Jun 2025 08:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749657442; cv=none;
        d=google.com; s=arc-20240605;
        b=U7FgDgc/UQ4BRmWWQbCRDQr9UJOW+H4XqBhJDQUVmk6S4ttlin7nOYkXPuIbtUY+AR
         B5pTJtekxHfHvLo8+ui7ejlWDeCJTlRWbVPIvyyLc5w0yVNOz5lAOiqs5lQwnqaEW7Dq
         LxOSteBmuQ7lTI78g4pWyeRtPEoj33YAMNoFBT4jFDN4DE8knUAvvxe2EenLjwLMhsVm
         YRr37i06mDdEqpImy9oz+6cY25C7gwh+R10/GU6yf2eU4FAheB2TKT8LX2IubpSHNWWO
         u4fKnEm55gGx/IpSg7wF9M1EwwIsG5lSu3H5O29wGAMEXA4L78pLvKLljQqGDBe0gR7L
         JAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=Pd+D8J3C3epESCwmkWBDA9UNHK88pr5yCZNFxAdlzWo=;
        fh=BSTR0mN5riEHgpfDGU+Y04a8hUWGOTfFmwR91Qdx2Nw=;
        b=WDrYSDAunOckmYxwhXjJoO+85EvI3ciM9QyftV3AQ/VuuW8KFMt83VH7XwvYL8hjXg
         LMy6S0XebH3q9HdpCvZZTsO4SUstUrzz6AdY6RLb+kwwIKH/fujyBFXoFknTeXPkMqjY
         pRI9Bk8TOVWC9+0k7sy18pEU5OsiqRXP6eXF6wAO25MbWL6Q9+gG2h0bmqdh0bjY4z8p
         7vchLxHTJlFGe5P87XaK/R83bh8mmCIVHu9K6lc2qPEV/nGZPKJc3o/gJcJpXl9ipxR6
         VPss9roW7/jynLjqlIiMaB3ckBw83DPACNKXWUklrU2Oz4nUWfg/LUpKdCNnF9RMXIUt
         IYwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d24b3cb097si1354589585a.130.2025.06.11.08.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 08:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPNoh-0000vA-Hb; Wed, 11 Jun 2025 11:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNoc-0000uk-4w; Wed, 11 Jun 2025 11:56:38 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNoY-0008Kp-VW; Wed, 11 Jun 2025 11:56:37 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHVb76C19z6JB6M;
 Wed, 11 Jun 2025 23:54:27 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id CB6A2140144;
 Wed, 11 Jun 2025 23:56:20 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Jun 2025 17:56:19 +0200
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <maobibo@loongson.cn>, <mtosatti@redhat.com>,
 <peter.maydell@linaro.org>, <philmd@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v13 0/7] Specifying cache topology on ARM
Date: Wed, 11 Jun 2025 16:56:11 +0100
Message-ID: <20250611155618.351-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: 3q6L2L2MLYq8

Specifying the cache layout in virtual machines is useful for
applications and operating systems to fetch accurate information about
the cache structure and make appropriate adjustments. Enforcing correct
sharing information can lead to better optimizations. Patches that allow
for an interface to express caches was landed in the prior cycles. This
patchset uses the interface as a foundation.  Thus, the device tree and
ACPI/PPTT table, and device tree are populated based on
user-provided information and CPU topology.

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
 -machine virt,acpi=off,smp-cache.0.cache=l1i,smp-cache.0.topology=core,smp-cache.1.cache=l1d,smp-cache.1.topology=core,smp-cache.2.cache=l2,smp-cache.2.topology=cluseter,smp-cache.3.cache=l3,smp-cache.3.topology=socket \
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
    discussions here [1].

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

[1] https://lore.kernel.org/devicetree-spec/20250203120527.3534-1-alireza.sanaee@huawei.com/

Change Log:
  v12->v13:
   * Applied comments from Zhao.
   * Introduced a new patch for machine specific cache topology functions.
   * Base: bc98ffdc7577e55ab8373c579c28fe24d600c40f.

  v11->v12:
   * Patch #4 couldn't not merge properly as the main file diverged. Now it is fixed (hopefully).
   * Loonarch build_pptt function updated.
   * Rebased on 09be8a511a2e278b45729d7b065d30c68dd699d0.

  v10->v11:
   * Fix some coding style issues.
   * Rename some variables.

  v9->v10:
   * PPTT rev down to 2.

  v8->v9:
   * rebase to 10
   * Fixed a bug in device-tree generation related to a scenario when
        caches are shared at core in higher levels than 1.
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
Depends-on: Msg-id: <20250604115233.1234-1-alireza.sanaee@huawei.com>

Depends-on: hw/core/cpu: Move CacheType to general cpu.h
Depends-on: Msg-id: <20250605132722.3597593-1-zhao1.liu@intel.com>

Alireza Sanaee (7):
  target/arm/tcg: increase cache level for cpu=max
  hw/core/machine: topology functions capabilities added
  hw/arm/virt: add cache hierarchy to device tree
  bios-tables-test: prepare to change ARM ACPI virt PPTT
  hw/acpi: add cache hierarchy to pptt table
  tests/qtest/bios-table-test: testing new ARM ACPI PPTT topology
  Update the ACPI tables based on new aml-build.c

 hw/acpi/aml-build.c                        | 229 +++++++++++-
 hw/arm/virt-acpi-build.c                   |   8 +-
 hw/arm/virt.c                              | 412 ++++++++++++++++++++-
 hw/core/machine-smp.c                      |  52 +++
 hw/loongarch/virt-acpi-build.c             |   2 +-
 include/hw/acpi/aml-build.h                |   6 +-
 include/hw/acpi/cpu.h                      |  13 +-
 include/hw/arm/virt.h                      |   7 +-
 include/hw/boards.h                        |   7 +
 include/hw/cpu/core.h                      |   1 +
 target/arm/tcg/cpu64.c                     |  13 +
 tests/data/acpi/aarch64/virt/PPTT.topology | Bin 356 -> 540 bytes
 tests/qtest/bios-tables-test.c             |   4 +
 13 files changed, 740 insertions(+), 14 deletions(-)

-- 
2.43.0

