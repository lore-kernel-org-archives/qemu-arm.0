Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3697810lfa;
        Mon, 19 Oct 2020 02:18:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8PPzZzqfUkGQR//mYKSWo2gxfK1SzJfV5o6d3HCyY+nCtGOxlq1ArlKRovzgw+ZN/eqrc
X-Received: by 2002:a25:bcc9:: with SMTP id l9mr19876640ybm.183.1603099105710;
        Mon, 19 Oct 2020 02:18:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603099105; cv=none;
        d=google.com; s=arc-20160816;
        b=LYEw11TzNZCPJwjQIHOMTyLzCb+4eyFKDtjD6gc1IuOLx2ZfZD3IT1IBdTxULpK1Z7
         CO7oyFBCWjrB3T5enevl1l1KVqwJijsGSF6L37zeS9YPY6I1OR3QVYh237mWqpaRMGFr
         4QWjlLFesHMTbWfHQby22WZ9DmUL6x799vOoz9+0LDrAk9gI4klN4sXM2QKINgxAihu0
         7LEWLCiP0oU0NxJ5x23oJQ2VX7KwImgsxIvcxfh6fdkOeQCK7MdwT55aUYwqJm5lpwdu
         snMBnH1ukelnrHSTwJePYFQ14l6DlcjsFmHJqk9gtBE7kGcdyHmxJ0+b6AzBeVgSIcQK
         rbKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=HAB9FDg2nNM92sBWa97j1CEMFwqLDPckAjPqpMjvG7w=;
        b=ONlIT/aYSQCWztweDuW1kHnxLcZvDet8K3vGG7+UVxc1V711cS8lDBboPaTJaUm6K3
         tnuUaF+8M5o/6Vwni6I41XUZm4JgqAKgivbjIU0wY4jNEBI6AcIkBrJE5QtVX/JGuyPX
         WGShdx0dJFu2js9kI6Sz7dk6Viy7WZAVGBylw31qh8uhhS2/wJHGHqJDjXnHNCmuenPp
         pIqUB8qIXB8PUXHp73mn6a/o7BZANTyU6JT2bzFz1crRj9+sczOsu2Ac0N7qK0grohuX
         5K2caRUKiMYNwEcSzb5wgW9ZV+A8Idn8Oy6xPNYwrQdXvbYZCCy89RND1XiAE3eUSOHl
         whpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x61si13357540ybh.247.2020.10.19.02.18.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 02:18:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kURJB-0000Ox-4B
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 05:18:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kURIv-0000OU-Ls; Mon, 19 Oct 2020 05:18:09 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5251 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1kURIt-0007HQ-El; Mon, 19 Oct 2020 05:18:09 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4861E83B05A9DF46EF03;
 Mon, 19 Oct 2020 17:17:54 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.185.179) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Mon, 19 Oct 2020 17:17:44 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <eric.auger@redhat.com>, <peter.maydell@linaro.org>
Subject: [PATCH] [RFC] hw/arm/smmuv3: Set the restoration priority of the
 vSMMUv3 explicitly
Date: Mon, 19 Oct 2020 17:15:08 +0800
Message-ID: <20201019091508.197-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=yuzenghui@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 05:17:55
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
Cc: Zenghui Yu <yuzenghui@huawei.com>, wanghaibin.wang@huawei.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xvLSc//zEA+B

Ensure the vSMMUv3 will be restored before all PCIe devices so that DMA
translation can work properly during migration.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---

not sure if anything would actually go wrong...

 hw/arm/smmuv3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 0122700e72..2017ba7a5a 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1440,6 +1440,7 @@ static const VMStateDescription vmstate_smmuv3 = {
     .name = "smmuv3",
     .version_id = 1,
     .minimum_version_id = 1,
+    .priority = MIG_PRI_IOMMU,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(features, SMMUv3State),
         VMSTATE_UINT8(sid_size, SMMUv3State),
-- 
2.19.1

