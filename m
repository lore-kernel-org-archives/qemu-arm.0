Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp149815lfg;
        Thu, 25 Mar 2021 00:26:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz+uxNNgpSYr7RDvHexh6ghGvBgprKCKOiGbIdlenbJPlaVBPhr0czjZHQu5UCBbRQZ3qA
X-Received: by 2002:a25:d8cb:: with SMTP id p194mr10351984ybg.205.1616657181195;
        Thu, 25 Mar 2021 00:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616657181; cv=none;
        d=google.com; s=arc-20160816;
        b=A/LnqGyCusP5RxxlsVxVwfuYpPR5evvKT53QIpVIzaE1c8tKWEQjiG71eFpInxN2wX
         O0PBCu7dtTQV2kdj8ebGxf7YPzlKJm0ZL6z46+MZj+HJwmejCH3mgmodToj1VaUDHByj
         uVbSOR2bJYBKGwCW+Yq5QwXAIYx7Ou/k9IcwzZerKXJ9IBva9yp0jbEsML1LrYGEJftz
         fMir1zODabKVHhnA8jUD5ItO7URE636ML3nRM7RUOSusjibXVc4R65V4JXiRNy4ib3dn
         Pywh5iMS9Wx+lcovelO/BqotW4U1L0GosCMb1QNokQUHlEet4U7nemrWhx5eVLIyDSyS
         cmZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=UoVVZvwAuwTklbPelC9WCp3ddM7J4hRDoVDDBaxVb2o=;
        b=Ggmis/VQqBpm37Vf3MMt/0Wdlxnv5zgCdFiBAObOOZq0jrHMxt6sfoCJD/9+oSMqsE
         Ka0Hr/nhyeJ/vCTEq0gYZA9ka7DbxlVElPqfUm5VEY4VMkntSS2LWFuQpdGvbYYZwLfJ
         ZohwSySyyhe2OaNM/5HQqGgr/uz3V3+o2ZYvzW7dK9BBvecKZ/abK7ITqmWJKpvjGRje
         2vczR1Cc2K58VrSCG3hjOdECNlhA2DqpXBIdjDGfsX8ihfX1/ZCv3MJHda/clToD9390
         dYpyQkdgj5GJhQRArjIZ/VzqWSjDKWZDdaC8BOtPFow5DDAVxyBeS3edn2N5CvVb5cbE
         mpsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w3si1005264ybk.365.2021.03.25.00.26.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 00:26:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:59298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPKNo-00084s-G6
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 03:26:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKx-0004Qn-M3; Thu, 25 Mar 2021 03:23:23 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lPKKv-00032k-PT; Thu, 25 Mar 2021 03:23:23 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F5c3L1CsDz19JF1;
 Thu, 25 Mar 2021 15:21:18 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Mar 2021
 15:23:09 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mst@redhat.com>,
 <marcel.apfelbaum@gmail.com>, <peter.maydell@linaro.org>,
 <ehabkost@redhat.com>, <richard.henderson@linaro.org>, <pbonzini@redhat.com>
Subject: [PATCH RFC RESEND v2 6/6] hw/i386/acpi-build: Add iommu filter in
 IVRS table
Date: Thu, 25 Mar 2021 07:22:45 +0000
Message-ID: <1616656965-23328-7-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
References: <1616656965-23328-1-git-send-email-wangxingang5@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=wangxingang5@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: jwow2u9A0dlH

From: Xingang Wang <wangxingang5@huawei.com>

When building amd IVRS table, only devices attached to root bus with
IOMMU flag should be scanned.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6936889cad..e0f38305da 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2229,7 +2229,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && pci_root_bus_has_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
2.19.1

