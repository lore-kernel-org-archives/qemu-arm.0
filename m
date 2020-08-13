Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp387997lfy;
        Thu, 13 Aug 2020 03:33:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoGeBGgdEwAlfhnXn9iznwVDKt9Nd+0uegEPQdtcDTL8u/zPnw7PTlgEIORadRwyLN62Gw
X-Received: by 2002:a25:9742:: with SMTP id h2mr5100492ybo.430.1597314787975;
        Thu, 13 Aug 2020 03:33:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597314787; cv=none;
        d=google.com; s=arc-20160816;
        b=DIHAjyiEjgC60MNDpoilXeNn1VwZZywDsaGbVyJek9b4yqc8ehW8bI3r8e5tpqQ/zg
         Tj8BmJ5pfJENGF4cIvoiKOiXM/GI5IGtD9nrCZE+BCq2JqesijApopA+prS9P54vv4Cm
         3LHWtG9QOsAR1z6QtaiiqpisRFazfFj9bXESC/A/Qbc7weSC+FmUBVvdFfPH07FXkIcZ
         BkRFUjZUvR25fxUnDVzRNf8ixGjz5TgCUgsbqqcW+qaMEMZOg6DGKM6iNU3LqmYIti3s
         0/rxCpapj5pxoV+czPhz3DSmGBV9i5LDhTem+3lHouYCNjw6QIpdW7Rb+j1+PYyleEAL
         ohkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=8B2ULFfp6dRYKfZO4sDSwVHY57VVOq/MDwZjatfSqts=;
        b=CIrT5apNEkTsrUvCJYK1qMHeQPYxxNW6w7ucglBrW/hyrjjprMJswFzIUfqSJC/U0D
         BwLRQYolflIhMKbU9ooIPDPR5wXBLV/ksM6PeowRtfa6upK2ewTOGeyJmrlb1EGFW6Np
         Q/OGrNpvTeYGHqceaqbvpDG684uZjsrxPxHaayX9fFZQCy08tV5q2BczGurbui1oMhQF
         FXtMV2kvbi1k4I/R5UeSZn+dnG4Rl83M2bXlKv9+o/W2no/MXjIUlaKvN8sEJ8pvG0oK
         eNTtlxYv0ZuMCoYq6fIEh/0f4noV23yu2StDoLB7JmdvE07xtAW5Mulbv5Fzr+3nZh9a
         FgNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si4698826ybp.29.2020.08.13.03.33.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 03:33:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6AXj-0000Rf-BF
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 06:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AXA-0008SA-Fi; Thu, 13 Aug 2020 06:32:32 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:53620 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1k6AX7-0006nx-5w; Thu, 13 Aug 2020 06:32:32 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E2CF0C270BA102AEF5B5;
 Thu, 13 Aug 2020 18:32:16 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 13 Aug 2020 18:32:10 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC 0/9] Support disable/enable CPU features for AArch64
Date: Thu, 13 Aug 2020 18:26:48 +0800
Message-ID: <20200813102657.2588720-1-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.18.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 06:32:18
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
X-TUID: 88CKi1yIus4z

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

[1] https://patchwork.kernel.org/cover/11711693/

Peng Liang (9):
  target/arm: convert isar regs to array
  target/arm: parse cpu feature related options
  target/arm: register CPU features for property
  target/arm: Allow ID registers to synchronize to KVM
  target/arm: introduce CPU feature dependency mechanism
  target/arm: introduce KVM_CAP_ARM_CPU_FEATURE
  target/arm: Add CPU features to query-cpu-model-expansion
  target/arm: Update ID fields
  target/arm: Add more CPU features

 hw/intc/armv7m_nvic.c     |  48 +--
 linux-headers/linux/kvm.h |   1 +
 target/arm/cpu.c          | 753 ++++++++++++++++++++++++++++++++------
 target/arm/cpu.h          | 245 +++++++------
 target/arm/cpu64.c        | 271 +++++++++-----
 target/arm/cpu_tcg.c      | 250 ++++++-------
 target/arm/helper.c       |  85 +++--
 target/arm/internals.h    |  15 +-
 target/arm/kvm.c          |  38 ++
 target/arm/kvm64.c        |  86 +++--
 target/arm/kvm_arm.h      |  10 +
 target/arm/monitor.c      |   2 +
 12 files changed, 1267 insertions(+), 537 deletions(-)

-- 
2.18.4

