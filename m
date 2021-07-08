Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp302122lfg;
        Thu, 8 Jul 2021 06:01:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlwZ48fqQtRnY11dixnsiFGwJI4LKraXYE2RVbMw1j8tSHRSjcqGb53je6UCoXdQ0sEVSp
X-Received: by 2002:a05:6512:312f:: with SMTP id p15mr24590253lfd.325.1625749316673;
        Thu, 08 Jul 2021 06:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625749316; cv=none;
        d=google.com; s=arc-20160816;
        b=B8tyPBHaYpZJKCFlyt36TpBqd0K2FIxdPbej0gT8X54EKbwNpZEJ7+dcT6EsSnLs0V
         0Z6WhtM+TknYDHRk3Q/cS6TjkF/ceBxeyTd5WQ4MhNvMEBHV03H6/laj9D/DGePDdIn3
         Ufk/vUwT4uE+yvEcDqJNDcfSO1OcTZA4EatlgwGHzE8gqIDCqV4Wov7Q1pR4ZzlMl/NH
         zFnLpj/7ch3XnrEknA/Q38+DfQQk1D7TDrsYfkpPfbgwYT9J1aP4cvSBPpQlirnvi1iM
         hXzBHRKmzJJSdO1QQZ4+wQ4vz3NvTfsWhlE+e3RqwVIVDtG2KcNWdZ2WIx7A78olYBei
         mnBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=Anm+ZTgYN7d4T5Oma9OK854BtfUI0QL9U/wpCwQrfzU=;
        b=TWeURp8abqlC4BxQRrkSoHYaTAC+C9QF6fCFh+lHgZpirZeJyi4uFE0sff4Kt4CK6w
         6gPGd/dPFbTHzL/mJV5zI8oYSN6F41hdZRerSqvLHJkfcrg7cRfFDyHwY7IHY3/X8kdR
         7khagPs7FAX/RRp9uZ5Bl2/iFb19D2PBh/Xc7R0XDHcOSBlT4O+MgyYq+SiSSW/EvYKr
         b+eogwA6o4ckF4HO4KwiwHRUg5xvGWZFxMTV+JgPJrpH3NrKcdiQOLTPYn7ifVpXqxA6
         7BfFYWt8nRmIdNpVJbpC3M4jN7UgtIpZKmExM2ZAveC9WUgUtr6cBSLdJKzEkH2zwbJB
         2kmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dq22si2794487ejc.51.2021.07.08.06.01.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 06:01:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1Tf9-0007oA-LB
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 09:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZK-0004M4-CD; Thu, 08 Jul 2021 08:55:54 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1m1TZF-0005bX-18; Thu, 08 Jul 2021 08:55:54 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GLGNB2QjCzXq4V;
 Thu,  8 Jul 2021 20:50:02 +0800 (CST)
Received: from dggpemm500009.china.huawei.com (7.185.36.225) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Jul 2021 20:55:32 +0800
Received: from huawei.com (10.174.185.226) by dggpemm500009.china.huawei.com
 (7.185.36.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 8 Jul 2021
 20:55:31 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH v5 8/9] hw/i386/acpi-build: Add IVRS support to bypass iommu
Date: Thu, 8 Jul 2021 12:55:18 +0000
Message-ID: <1625748919-52456-9-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
References: <1625748919-52456-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500009.china.huawei.com (7.185.36.225)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=wangxingang5@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: suihDDgsgyce

From: Xingang Wang <wangxingang5@huawei.com>

Check bypass_iommu to exclude the devices which will bypass iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1b972b4913..7c888f05bf 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2246,7 +2246,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && !pci_bus_bypass_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
2.19.1

