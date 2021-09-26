Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2789296lfp;
        Sun, 26 Sep 2021 01:46:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRvUskj7MuEPxs+ub2r/+VyCPQsrGlLN6P/Xwp/NHnfIvT28qpNP0w45g68PGI+Mq5Y0a8
X-Received: by 2002:a5b:f0c:: with SMTP id x12mr20829746ybr.340.1632645989719;
        Sun, 26 Sep 2021 01:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632645989; cv=none;
        d=google.com; s=arc-20160816;
        b=gXbvy4cigDGW6xjgbJ65nay7iBaK6ZZookASfvq+yajjBMHGhg5e0IdfZ/2hd4MS1L
         sD4qRL6DpPPLLHZgo5OV40YS8b82cPC4EUtd7WN8hK9qRgHtMdHeCa7udqB+wQugFgFU
         73jaDCPkkNEWcsEC3gE8cZ8tImOJmcMDfAkOaEOv/FZM6ZVO7y7CeTWPebKVbMAHalBk
         63p+BKyDjMYFaAszVnWWJNeQyiU04d0XpoX0Pc/9FDnSPDP8ZsbqvdZ/bPZIGzK9wYET
         7mYP+bIJKq7jOutpM2NfImHz2JPYdzQ6qjDehgbWsa2e+NA1b60aV+8EiJ+KsOeHPG8H
         2gbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=qB5XwGbATyxeu25C7D5pRyIz+SYaagou3idsVLO5WNo=;
        b=GHzUj0BK9yPS6BpCs+tH7z5P47KFITa/1rl+1WEIHfmWheUZe4edEUDYU1d/B3bePG
         WUVc59EEOXCWe8OJCX2ArCDqERU+L6u1rR2vlp6diCDsqYmMxuaXG5IUVkZ+h6DOhNlk
         ZT8N0Jk9YXrmySK5uyr7dqdcMbieRO9eBAJ1B40XPn8m/9/qnJSyzcMB2u2Q4ChgHrjv
         EO2wzgHNaOltbjKKdJzdGtMr0gr28jI9C+sTKPNYw5RCpJXhjL5OqKZ44tLTt7lPsh4Y
         87g22kTGyeUoKpkvGFf9eAm1rVHk36VNX/Mb9+AGmGnqerUlEmpoETPD9A9U56/isjLn
         elKw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 186si17831165ybh.261.2021.09.26.01.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Sep 2021 01:46:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mUPnp-0005wX-0f
	for alex.bennee@linaro.org; Sun, 26 Sep 2021 04:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnK-0005uI-PE; Sun, 26 Sep 2021 04:45:58 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mUPnH-0002DE-Mp; Sun, 26 Sep 2021 04:45:58 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HHK8Q72FRz8tQR;
 Sun, 26 Sep 2021 16:44:54 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:43 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sun, 26 Sep 2021 16:45:42 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v10 00/14] machine: smp parsing fixes and improvement
Date: Sun, 26 Sep 2021 16:45:27 +0800
Message-ID: <20210926084541.17352-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter
 Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a7RAIgzGISlr

Hello,

This is a new version v10 rebased on latest upstream commit 11a1199846.
To make this series more acceptable, drop the last two patches in v9
about SMP unit test, since the scalability of the test is not optimally
designed after rethinking of it. So I will resend the test related
patches separately after refining them with a best way.

Patches in v10 are all Reviewed. While some ACKs from x86 maintainers
are still needed until now.

Eduardo, Paolo, any thoughts ?

Thanks,
Yanan
.

Summary of v10:
1) Specifying a CPU topology parameter as zero was implicitly allowed
but undocumented before, while now it's explicitly deprecated.

2) Refactor/fixes of the smp parsers.

3) For consistency, maxcpus is now uniformly used to calculate the
omitted topology members.

4) Improve the error reporting.

5) It's also suggested that we should start to prefer cores over sockets
over threads on the newer machine types, which will make the computed
virtual topology more reflective of the real hardware. Related discussion
can be found in [1].
[1] https://lore.kernel.org/qemu-devel/YNIgInK00yNNI4Dy@redhat.com/

6) In order to reduce code duplication and ease the code maintenance,
smp_parse() is converted into a generic enough parser for all arches,
so that the arch-specific ones (e.g. pc_smp_parse) can be removed.
It's also convenient to introduce more topology members to the generic
parser in the future. Related discussions can be found in [2] and [3].
[2] https://lore.kernel.org/qemu-devel/20210630115602.txmvmfe2jrzu7o67@gator.home/
[3] https://lore.kernel.org/qemu-devel/YPFN83pKBt7F97kW@redhat.com/

---

Changelogs:

v9->v10:
- rebased on latest upstream commit 11a1199846.
  there is no change of the patches in v10, except minor update
  in 08/14 to resolve merge conflict with master.
- To make this series more acceptable, drop the last two patches
  about SMP unit test, since the scalability of the test is not
  optimally designed after rethinking of it. So I will resend the
  test related patches separately after refining them.
- v9: https://lore.kernel.org/qemu-devel/20210910073025.16480-1-wangyanan55@huawei.com/

---

Yanan Wang (14):
  machine: Deprecate "parameter=0" SMP configurations
  machine: Minor refactor/fix for the smp parsers
  machine: Uniformly use maxcpus to calculate the omitted parameters
  machine: Set the value of cpus to match maxcpus if it's omitted
  machine: Improve the error reporting of smp parsing
  qtest/numa-test: Use detailed -smp CLIs in pc_dynamic_cpu_cfg
  qtest/numa-test: Use detailed -smp CLIs in test_def_cpu_split
  machine: Prefer cores over sockets in smp parsing since 6.2
  machine: Use ms instead of global current_machine in sanity-check
  machine: Tweak the order of topology members in struct CpuTopology
  machine: Make smp_parse generic enough for all arches
  machine: Remove smp_parse callback from MachineClass
  machine: Move smp_prefer_sockets to struct SMPCompatProps
  machine: Put all sanity-check in the generic SMP parser

 docs/about/deprecated.rst  |  15 +++
 hw/arm/virt.c              |   1 +
 hw/core/machine.c          | 214 +++++++++++++++++++++++++++----------
 hw/i386/pc.c               |  63 +----------
 hw/i386/pc_piix.c          |   1 +
 hw/i386/pc_q35.c           |   1 +
 hw/ppc/spapr.c             |   1 +
 hw/s390x/s390-virtio-ccw.c |   1 +
 include/hw/boards.h        |  23 ++--
 qapi/machine.json          |   2 +-
 qemu-options.hx            |  24 +++--
 tests/qtest/numa-test.c    |   6 +-
 12 files changed, 214 insertions(+), 138 deletions(-)

--
2.19.1

