Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp530713lfq;
        Thu, 17 Sep 2020 05:23:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzTaHff3DovfYKKWgGX3cNiAOR0jV6GNV9x5suz9c7dsm5vmREOgvXxpmXQoQ8IOQq25UVo
X-Received: by 2002:a25:c444:: with SMTP id u65mr1729917ybf.188.1600345416054;
        Thu, 17 Sep 2020 05:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600345416; cv=none;
        d=google.com; s=arc-20160816;
        b=vF6+GX9PM73LEhupjHeXmvqxRI6ViW5P5Twctu4+ZeiIluOLfaTPFUOLlJB7MCGVeX
         V5sttps0NQ8cm2rd55vmUVgNmX650BMKBDz5ejy4nDUoD4QO1xGvsaFt/dTJP/DwO7aT
         KscxhUbYbDra1uxsMgyb+73nY090D6J9ecSfOMJoeGg+i2ujqAk9KnMoHKhokZocHFYt
         5d1vrHxj1z1j1ni2bgbC440xgMhiWfSL3PzPkkm+DLuINLWwhhO2LkGhaEhnKbrMI7/m
         8JZlnpypjqjruKWZoW5zDhwF/hF0pGCW+N+wwNSlCR30SSVN61bNx9+MvRmZiZAE6q20
         OerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=oBBTvDlmQazq4+sGjVL5eO5stGEXv1P+8btbsBUqu3c=;
        b=tYu4k7CL7xi55ZIs89Bet6DNwBXcgMxlFx3/7RbY9z4gK1JsXWT/J78wUv1w9NLOFn
         O+JLSYpddIChpXhxZfIKBNLfo/6UpCW2GghYRQERt3uOF98X9nO35bKDBopWPf7vADQ2
         ao+DDd6NL+dluBfwwADgzvfBhJRnle/kDji9BQFN1zpd61+zVbg/1Im3vfVZUJEOfxxq
         iDKpdZkm2gJ64F0qWudKOO5OyBPVScjq0qEMr+K0vVmklS5qa5jurFadt4XEpx17ssb2
         TfwgFvs3bsRrdF9tJMAV0FOQFAIO9/sp/oIDFF9TRiI2x7M2giHGgVhY2Faq+MaYmPo/
         3yoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s80si19172534ybs.142.2020.09.17.05.23.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 05:23:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIswp-00088g-C7
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 08:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswf-00085t-85; Thu, 17 Sep 2020 08:23:25 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51242 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswc-0003O4-Ed; Thu, 17 Sep 2020 08:23:24 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 586CDECE9633EE63C126;
 Thu, 17 Sep 2020 20:23:08 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:22:58 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 00/10] Support disable/enable CPU features for AArch64
Date: Thu, 17 Sep 2020 20:14:39 +0800
Message-ID: <20200917121449.3442059-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MnBFdBA7OLR9

QEMU does not support disable/enable CPU features in AArch64 for now.
This patch series add support for CPU features in AArch64.

Firstly, we change the isar struct in ARMCPU to an array for
convenience.  Secondly, we add support to configure CPU feautres in
AArch64 and make sure that the ID registers can be synchronized to KVM
so that guest can read the value we configure.  Thirdly, we add a
mechanism to solve the dependency relationship of some CPU features.
Last, we add a KVM_CAP_ARM_CPU_FEATURE to check whether KVM supports to
set CPU features in AArch64.

Also export CPU features to the result of qmp query-cpu-model-expansion
so that libvirt can get the supported CPU features.

Update the ID fields to ARMv8.6 and add some CPU features according to
the new ID fields.

With related KVM patch set[1], we can disable/enable CPU features in
AArch64.

[1] https://patchwork.kernel.org/patch/11782361/

v1 -> v2:
 - adjust the order of patches
 - only expose AArch64 features which are exposed by kernel via /proc/cpuinfo
 - add check for conflict CPU features set by user
 - split the change in linux-headers/linux/kvm.h

Peng Liang (10):
  linux-header: Introduce KVM_CAP_ARM_CPU_FEATURE
  target/arm: Update ID fields
  target/arm: only set ID_PFR1_EL1.GIC for AArch32 guest
  target/arm: convert isar regs to array
  target/arm: Introduce kvm_arm_cpu_feature_supported
  target/arm: register CPU features for property
  target/arm: Allow ID registers to synchronize to KVM
  target/arm: Introduce user_mask to indicate whether the feature is set
    explicitly
  target/arm: introduce CPU feature dependency mechanism
  target/arm: Add CPU features to query-cpu-model-expansion

 linux-headers/linux/kvm.h |   1 +
 target/arm/cpu.h          | 243 +++++++++--------
 target/arm/internals.h    |  15 +-
 target/arm/kvm_arm.h      |  10 +
 hw/intc/armv7m_nvic.c     |  28 +-
 target/arm/cpu.c          | 555 ++++++++++++++++++++++++++++++--------
 target/arm/cpu64.c        | 174 ++++++------
 target/arm/cpu_tcg.c      | 250 ++++++++---------
 target/arm/helper.c       | 102 ++++---
 target/arm/kvm.c          |  38 +++
 target/arm/kvm64.c        |  86 +++---
 target/arm/monitor.c      |   4 +
 12 files changed, 976 insertions(+), 530 deletions(-)

-- 
2.26.2

