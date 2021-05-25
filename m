Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4108127lfm;
        Mon, 24 May 2021 20:52:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFNLNlIBedUvy5D0CcQ54UG0lT+sRNycnQteygNngQR6p5liLOQl8if413MiGJ0hSnbK+V
X-Received: by 2002:a5d:9343:: with SMTP id i3mr18682152ioo.77.1621914752254;
        Mon, 24 May 2021 20:52:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621914752; cv=none;
        d=google.com; s=arc-20160816;
        b=aosVuocMjcVkPC2NScuowQYruAyEx/ARJH1SW5PVa4yIeNsDnSYv7z+ba0iidTj7M1
         25UosNelFJ91Zwdn2N20dN/f5q2W4r1Bz4XODusldarjMS+ZoNlZp1ooJlUher0FRbkP
         ZsT8tUz06GXaxf+Q9PbdNnJubZGYREE9lFc/JbX/oTDvFSYxSxgigteG1+Q42/MgFGIZ
         QA8CUBW/Vbw1QD5bIicmTjJKG+ysGXa0fJuK/qGZ72+n1aYqZxvrqf1OkKgAEtdlNOs3
         P7e2JmuGnxlJTCZ0oGakgV72FoIwUfZVMfoIMSURQbuaM3TxbRCS/eDQr6wVJWbAarP8
         niOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=i74ZS+e+LcczdsprclCVWDD67UNEmBD9BtiedK3MwME=;
        b=PppoPm8Yb2oFVAjhEg2y1B9SBML0YhWNWgSZAzo85rdRUg6yCNOzDGhbYrdpTe8R/c
         vu6bszMY3jAn0//BsqVSzzhz9UzjBWtBEaFYfCOFwPVsTdCnnVqOMMXWTJ+Go4EBF6vI
         BLfLkFiu+iEyGGcpSt7trhr7C0MgQQ96MQ4bawikgYxmOM++4DE7DoWXrVPi62iEUX7t
         gaCty70wNOVUhvvFeKq6863AqOyO5zW0oxoSXD3Sm0inN6o1/2lrEYg5fjtMHQOcN3rx
         JoPVdX7Q5sYivsyIuIysxdZfWxZO3yvXo9ubbCnsEZD9CRp7vykRB8/MTM4tRSHfCmvw
         BjNg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si6988159ios.73.2021.05.24.20.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 20:52:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:48564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llO7L-0004ZL-K6
	for alex.bennee@linaro.org; Mon, 24 May 2021 23:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5M-0006PW-43; Mon, 24 May 2021 23:50:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1llO5H-0001nF-Qs; Mon, 24 May 2021 23:50:27 -0400
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fq0PX5VylzP0J3;
 Tue, 25 May 2021 11:46:40 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 25 May 2021 11:50:16 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 25 May
 2021 11:50:16 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v4 8/8] hw/i386/acpi-build: Add bypass_iommu check when
 building IVRS table
Date: Tue, 25 May 2021 03:50:05 +0000
Message-ID: <1621914605-14724-9-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
References: <1621914605-14724-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500009.china.huawei.com (7.185.36.225)
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
Cc: xieyingtai@huawei.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NKc3WBqiVTkS

From: Xingang Wang <wangxingang5@huawei.com>

When building IVRS table, only devices which go through iommu
will be scanned, and the corresponding ivhd will be inserted.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e839527184..d3ef485fa4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2232,7 +2232,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && !pci_bus_bypass_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
2.19.1

