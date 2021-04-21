Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp217665lfb;
        Wed, 21 Apr 2021 01:07:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxH4uyWUqnstKjf2Zwa/ZbP4xHtaKvtDWqEz7rcwFQ9nAwf0ztC1zfY8tOiRwEiZ61H9ijV
X-Received: by 2002:a67:1447:: with SMTP id 68mr23339340vsu.20.1618992432101;
        Wed, 21 Apr 2021 01:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618992432; cv=none;
        d=google.com; s=arc-20160816;
        b=hxxdGfmhqv3UCkKWp4lDYcofyQ3ysIuPb/wD2P896yGAYSRYVgs6cCYdALCTt2baUr
         gUAsH4zTjmuRvOaROC1KT9dUsUAvgztKczt5n8QGSPDrt0yPxJSEVJopPNI7nbGUkbAg
         jpqIsYFsmWEyRP1hsifdt7q7isAetl5ETg4wduP1pzsrkUZcohK0sKvmX0IIZl47pKvR
         nMDMy/osOyUU8HYYhuqOF7vxTzU4zB6GyBMc2TgkZbdFrAxf4WVBzJHhQAmOi7I57h/f
         6/Oo3Pa3gTQvxJrfN6ZQ1H1cJ6uJ2x0PIwHn0OS8ULjJJyt/Fo2PuQHOpfQFPX//sYKX
         Lnsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=IgkES0x0XqSgKMn9zj8yYIwWt9ECmRj4znnq23Oleyk=;
        b=nZSG464O+aKTd4wW75ybzh0oB9KX76+KoUvvJnQH84LIKTqBGHfdrF1t9Vp2SpztaM
         ONx+sYpQnwE/DtQKghMp9XmYwXSpAk/kwccLswt/WWMBBiIiHTyymFpP8LCA0Mukf/py
         qVBBBcX4kZ8+57NkJtD2euexohfClIehuvYUVAvcMsIpwWyJANlz68c/FgBbXdHDlNH3
         nroUZYL+2Z+eeWsZ0KYBvU8p3ChLR5/7lR0TOBeJXLP+GrnTUGK7O0V+/9cNT7zpU2eZ
         fwy78i1nhjEqN4kh/eZU4aRCRotcOglBgMnM7qiuk9h6uT7y7KcBUvlye2cVAKcG1UTR
         fLlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si606056uae.18.2021.04.21.01.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Apr 2021 01:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:40580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZ7t9-0002gG-Df
	for alex.bennee@linaro.org; Wed, 21 Apr 2021 04:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7ra-000197-Am; Wed, 21 Apr 2021 04:05:34 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lZ7rX-00028E-Pi; Wed, 21 Apr 2021 04:05:34 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FQCj65sBlztVWy;
 Wed, 21 Apr 2021 16:03:06 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Wed, 21 Apr 2021
 16:05:18 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC v3 8/8] hw/i386/acpi-build: Add bypass_iommu check when
 building IVRS table
Date: Wed, 21 Apr 2021 08:05:03 +0000
Message-ID: <1618992303-19556-9-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
References: <1618992303-19556-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=wangxingang5@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: xieyingtai@huawei.com, cenjiahui@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eizfsQzdyEtg

From: Xingang Wang <wangxingang5@huawei.com>

When building IVRS table, only devices which go through iommu
will be scanned, and the corresponding ivhd will be inserted.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index fdb26682cb..71fb95737c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2229,7 +2229,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && !pci_bus_bypass_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
2.19.1

