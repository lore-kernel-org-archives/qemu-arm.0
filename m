Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp523580nji;
        Thu, 12 Sep 2024 06:41:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTseQrqk0m5IN/F0bokv9brtjVEdZO0sYdVZks3GfvJekV2AjyzrJMcHKNkl1dWJ27wKKzOWw6uknkJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHCdOMaotcoFzhQO9T1EF3vMLCNT/M58RMwasLcMu4FaiT96en6wKntv6Hzn1JCb7KWs2IP
X-Received: by 2002:a05:622a:190e:b0:456:959d:ec3d with SMTP id d75a77b69052e-458603f5571mr45641241cf.43.1726148514161;
        Thu, 12 Sep 2024 06:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726148514; cv=none;
        d=google.com; s=arc-20240605;
        b=Fd3ctlZfRcvKJVihQHIGVGmzJnCKKTLkMz+iVHyJ2zV99Uox/mDy09D2WOrwDM13rv
         AwKgMXisGP79JEzjfc/a8/TgT/CM0pvCSETikJjWvkOc2UCWnSenDwbz7IQX66NG8Lpw
         WsiMGMgEDGQG9wLebjhK+WxtsMgBW0Ps7ysXy/KafQYrUa/JCpegK36lraf7FtkBc5VO
         /ZT9AZkFZaYjfpjN8+6llBahoIfLZGSiwHg8k0OT9ooowFAvcdCH+zSWag24gQUkELRk
         gtULVaV86oVXsoLLEJ2cF0dLrMc7dsVucUY/O9giidHGZkDWSMrPKMu1p33crJpmpYRN
         Xx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=CHr+Ll4WhBTOxujzTvsJqXBZMvbty9yI616AP50kLkY=;
        fh=FkJWaune7hMuK+jemAGcJmHRm42IOkVpZLD1KexBaC8=;
        b=KMRs8yRzuLdPC2hW96LnhlvxGfgyIdAKqBhgo0jv8OR7ejk9ZqikRyrKgmHn4J7IKV
         3h7rlWImq+LiS+MfgYhdmWYZ3tBKKhV7q+0CypGMwk91ZBZEVn3ulaVh8+blmNg9HdNp
         GURPcdohsx3aSs+dsltVUZAxpVPOmI7Zn/4xRGujGU+zuxg/G/zNB6qJ6wjMKy1lNOQ9
         GhRQLO4G04e49eIqTPjc5/eE0G86zHTBblOT89NWiPR6ZBJeN2VB25RRIxCELl7Hzc+H
         yF5ApH8fkS1UUyjE0PtAJ+TZQC/p6K0rkbZYBMrxdvAT5iI8pKAetIhlmxmH8qAsE47n
         f2gA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f7fd07si141278441cf.409.2024.09.12.06.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2024 06:41:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sok4t-0004jC-E3; Thu, 12 Sep 2024 09:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok4i-0003tD-7u; Thu, 12 Sep 2024 09:41:32 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok4g-0000Sv-KX; Thu, 12 Sep 2024 09:41:31 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X4JQV3xHHz6K94v;
 Thu, 12 Sep 2024 21:37:22 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id CD4F71400DD;
 Thu, 12 Sep 2024 21:41:23 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.48.147.42) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 15:41:22 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huwei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>
Subject: [PATCH 5/5] tests/acpi/arm/virt/PPTT: update golden masters for PPTT
 update
Date: Thu, 12 Sep 2024 14:38:29 +0100
Message-ID: <20240912133829.400-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912133829.400-1-alireza.sanaee@huawei.com>
References: <20240912133829.400-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.147.42]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sfXPCQtqcFJr

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/data/acpi/aarch64/virt/PPTT              | Bin 76 -> 76 bytes
 tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt | Bin 156 -> 156 bytes
 tests/data/acpi/aarch64/virt/PPTT.topology     | Bin 336 -> 336 bytes
 tests/qtest/bios-tables-test-allowed-diff.h    |   3 ---
 4 files changed, 3 deletions(-)

diff --git a/tests/data/acpi/aarch64/virt/PPTT b/tests/data/acpi/aarch64/virt/PPTT
index 7a1258ecf123555b24462c98ccbb76b4ac1d0c2b..ae1a078b286e6a2983abe7b11747e66bfe5e04a7 100644
GIT binary patch
delta 16
XcmebA;R*-{3GrcIU|?Q8k;@4HALIkR

delta 16
XcmebA;R*-{3GrcIU|?D?k;@4HAL9eQ

diff --git a/tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt b/tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt
index 4eef303a5b6168c6bc3795c2e2c53f65b4c4cfd4..4e49ff8f997bc0ecbb122c55d4e6ecc555b8e739 100644
GIT binary patch
delta 18
ZcmbQkIERrdARr`U4g&)N^WTYFlK?OR1y%q6

delta 18
ZcmbQkIERrdARr`U4g&)N)4z#alK?OQ1y%q6

diff --git a/tests/data/acpi/aarch64/virt/PPTT.topology b/tests/data/acpi/aarch64/virt/PPTT.topology
index 3fbcae5ff08aaf16fedf4da45e941661d79c1174..9ad5a99364e74f1258686fed481aaeee0d5dea94 100644
GIT binary patch
delta 19
acmcb>bb*O0ARr_pfRTZLxq2g)8zTTWIt0i7

delta 19
acmcb>bb*O0ARr_pfRTZLsb(XW8zTTWIRwZ6

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index e84d6c6955..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/aarch64/virt/PPTT",
-"tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt",
-"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

