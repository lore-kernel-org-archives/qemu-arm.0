Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp9614873njk;
        Thu, 2 Jan 2025 07:20:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOufzixi+WkRNV7b9EYWIlCpylIE2ucj/rCb+3fpVeInYtohuXxwlrw6h8hDKQ+c4cGwl+bSYNwap55A==@linaro.org
X-Google-Smtp-Source: AGHT+IFJsbUKIaSZwK/3zwtmGcIKmJwBGsJsRPtrJmKPSRV5IFdG4JmrPoEH+qN0irO3lmARDOic
X-Received: by 2002:a05:620a:31a2:b0:7b7:142d:53d2 with SMTP id af79cd13be357-7b9ba83640cmr6766000685a.41.1735831241865;
        Thu, 02 Jan 2025 07:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735831241; cv=none;
        d=google.com; s=arc-20240605;
        b=C+BGOOeM56wTre5y8hsg7Yt1ot64T1GcQoxXienY+6E2lZUnEK8xCKlQjuJ4uEvwV1
         tCmisqlo+R+0RWNzqcqB5YlfpBTcyqWJbpUK4iTjuy/kUdE+aPG8USA+7jSeWUVMm8V5
         9diFm+jUNyHSLu+PXO2Ve/hjjt4othLfujchVrVeLPmjlOairp7uCtJVCltpw1tSdueo
         EUtDzw/N29ZWmlU1if5WllUl+FI8HnDdEMKhEZq8L4tegjyU8Tp6hthYD8yKpgvrEoN2
         8LkshLEl3WVAmF4OAMZITFi98Vz5Dt9rsTlEPJThTr8J/w7W7ry/JXx737DK+fJe5UbO
         m/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to;
        bh=3l2OwEJ0tK8oX2czPEeFPjph7ZiNm1FJqED0+gzzObs=;
        fh=3SOh7oRf8ZAjcQS1l/R73yHW85MB7PHhEzRWSpnyrno=;
        b=LiDtsZuhiG4VtjNEJG7XCwwrENYk6iFdFSloYsZtO3DT7x43ur1bE506qQEtRYtyjX
         AAHOwSiYj950TQ9IpNa7oRVvH7tcVZ6267KYQFka4G13YIoQv9NorxoFb5QQxyDD81Hl
         kJBnJy5+iZn1Lg2KjegD+AkxnjGq1iDHqZn24vEcX8gYadbG8U5ycN3sKjurgRgSlS8h
         zDsVBFljt/Xb0LL0I1RcLvCPT3fFzhlLdZSsBIMMhwKs7rVJSCuB7GBJEvJ35a8Y59WA
         OL4ys3TJuKQUAo6EvaICl680mM/V+HRt2N4r9iVttgk7lBKzyn8oP/GGn0vmMQV9dAUv
         5dRg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4ce679si3405155985a.356.2025.01.02.07.20.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jan 2025 07:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tTMzs-0000e6-81; Thu, 02 Jan 2025 10:20:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTMzo-0000d7-17; Thu, 02 Jan 2025 10:20:25 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tTMzl-00089H-M5; Thu, 02 Jan 2025 10:20:23 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YP9JZ0KQ7z6K8kj;
 Thu,  2 Jan 2025 23:15:58 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 0C008140A77;
 Thu,  2 Jan 2025 23:20:17 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.73.182) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 2 Jan 2025 16:20:15 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <robh@kernel.org>, <sarsanaee@gmail.com>
Subject: [RFC PATCH v5 0/6] Specifying cache topology on ARM
Date: Thu, 2 Jan 2025 15:20:06 +0000
Message-ID: <20250102152012.1049-1-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.73.182]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: QimwXffQ/99T

Specifying the cache layout in virtual machines is useful for
applications and operating systems to fetch accurate information about
the cache structure and make appropriate adjustments. Enforcing correct
sharing information can lead to better optimizations. This patch enables
the specification of cache layout through a command line parameter,
building on a patch set by Intel [1,2]. It uses this set as a
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

Change Log:
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

 hw/acpi/aml-build.c                        | 235 +++++++++++-
 hw/arm/virt-acpi-build.c                   |   8 +-
 hw/arm/virt.c                              | 394 +++++++++++++++++++++
 hw/cpu/core.c                              |  92 +++++
 include/hw/acpi/aml-build.h                |   4 +-
 include/hw/arm/virt.h                      |   4 +
 include/hw/cpu/core.h                      |  27 ++
 target/arm/tcg/cpu64.c                     |  13 +
 tests/data/acpi/aarch64/virt/PPTT.topology | Bin 356 -> 540 bytes
 tests/qtest/bios-tables-test.c             |   4 +
 10 files changed, 773 insertions(+), 8 deletions(-)

-- 
2.34.1

