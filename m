Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4098098njh;
        Wed, 4 Jun 2025 06:35:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW53DSkGx3kfrN7IH7wKEjT/yrdohyiZxe5unx/Z/RHA+wDnuxNdo6eJTEJfyGxFyfAAHwyzo+CI9wojg==@linaro.org
X-Google-Smtp-Source: AGHT+IG5O0yI1iyuHUf/EyI1fkfkDvFVFVelCxEvml6QthQc7vayUVR8MM4iWyRamvsM8CbU1cic
X-Received: by 2002:a05:6122:3c49:b0:518:6286:87a4 with SMTP id 71dfb90a1353d-530c734a1aemr2420458e0c.4.1749044106404;
        Wed, 04 Jun 2025 06:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749044106; cv=none;
        d=google.com; s=arc-20240605;
        b=HmWY0KmAxsbzlDK3eZ3m4ZZ1E1KN7eRhu76A8JJXNiGpiB1COOg8S/1qif4TOV84j3
         m4biSDbcJTASAeONNHnnu9P/S0gTzndVqeDzhCuM1p+U/B6CLR34Bj1IpU0ZMNtzEdv4
         jYhiGFdmJrmNbi4bibnYmAEJcyuvVffXONHKIb8J63vr67FkqXDF+L/X9EC3UkJQSCdL
         MGJ0uQsyGjXs9cj5t2WZrYPMe+j7l0qE/Sg2Md55Se8lOgVeaVD2gYJfcd0sYL5bDuIz
         WV4eXYG7FNXpEZbCI8sHKxQBBCeXXsgdAXJ6EVo2SmokfPq0V2aT5uF0uM+QGzYBGC5F
         5DzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=SFqN6+FDWgUhw/AVJxWJuIrEXYcPyAcmqT1ts9nnwRE=;
        fh=C0Dub1YbqewaCU0k9sFoVramrVk8aBVFkwelzXGVRHg=;
        b=eQEe6ePuHbuV+i+svUryyf6MFE66VNSB5CC5PmhtTN2+76r5cB1TLd1eUfRA86dU79
         gSIYYhWrpYkpKRvCztbpcR8NdvdqzhXYCdYfrqM60lItvIqtYDE5p1/dQ65xI2tCXT34
         PV311XGBtPp7RNNW3+7ELzuaN6ZQrh44qEXz+8Ck4eKxJ7uPpfc2QMe4XKqhBr3uwCkh
         q96f9j1zig1HC028jwSXwU4/wI5n1cLOxRnBBpgMTcvNHMMrrecusyLaRihM7Vnmbba6
         3d2uBHgT54UinNDzcgxz3SL2CMpUoI9gY0NYGEttt8TF/p1Dbmr9rNJWMiHRq24rTb05
         bBFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e6444608d8si4984074137.160.2025.06.04.06.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 06:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMoGg-00044o-DW; Wed, 04 Jun 2025 09:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uMoGb-0003t1-EZ; Wed, 04 Jun 2025 09:34:53 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uMoGY-0005ko-Cv; Wed, 04 Jun 2025 09:34:53 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bC7nJ6MCCz6K9HX;
 Wed,  4 Jun 2025 21:33:08 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id E68F3140133;
 Wed,  4 Jun 2025 21:34:41 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Jun 2025 15:34:40 +0200
To: <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>,
 <zhao1.liu@intel.com>, <maobibo@loongson.cn>
Subject: [PATCH v12 0/6] Specifying cache topology on ARM
Date: Wed, 4 Jun 2025 14:34:33 +0100
Message-ID: <20250604133439.1592-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: ITG5Vd7wGOLC

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
Depends-on: Msg-id: 20250604115233.1234-1-alireza.sanaee@huawei.com

Alireza Sanaee (6):
  target/arm/tcg: increase cache level for cpu=max
  arm/virt.c: add cache hierarchy to device tree
  bios-tables-test: prepare to change ARM ACPI virt PPTT
  hw/acpi: add cache hierarchy to pptt table
  tests/qtest/bios-table-test: testing new ARM ACPI PPTT topology
  Update the ACPI tables based on new aml-build.c

 hw/acpi/aml-build.c                        | 222 ++++++++++++-
 hw/arm/virt-acpi-build.c                   |   8 +-
 hw/arm/virt.c                              | 359 ++++++++++++++++++++-
 hw/cpu/core.c                              |  92 ++++++
 hw/loongarch/virt-acpi-build.c             |   2 +-
 include/hw/acpi/aml-build.h                |   4 +-
 include/hw/arm/virt.h                      |   7 +-
 include/hw/cpu/core.h                      |  27 ++
 target/arm/tcg/cpu64.c                     |  13 +
 tests/data/acpi/aarch64/virt/PPTT.topology | Bin 356 -> 540 bytes
 tests/qtest/bios-tables-test.c             |   4 +
 11 files changed, 725 insertions(+), 13 deletions(-)

-- 
2.43.0

