Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp368354lfg;
        Wed, 24 Mar 2021 06:20:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdUvWkUrYTRecymtIpMlLrVRC9k81qCNwBvrYI9bqY1pxhTGNQUA3f9VY5mFpfxpicwZuC
X-Received: by 2002:a05:6e02:1a68:: with SMTP id w8mr2744066ilv.129.1616592028335;
        Wed, 24 Mar 2021 06:20:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616592028; cv=none;
        d=google.com; s=arc-20160816;
        b=QCVvWgB5fRfNgQzKmmrlrUwx4e9ZWwo7i2TCM/1R/n/kb8HcG+CdgYhyGw1A8Mh1t5
         UMw9D3MaVQY3DqebgaLKwOcnRnZLbpTQSg4v5ZBcuMdUo7zdppn5AvluWqAF9kTXsuj9
         xGw8RNBx+ITWf/+qXIiOzqVyTzWXdzXl9vC2XM++BwQYGkRTfbdYua8J38bUdzLa8egk
         ASmO24rTcp7Ius7QGY9qr/zUEelpszFJAec2M35Xw8YT7pCRNOAFM0xC3g6jCxHHfjpz
         cd7Raxwjm8twjTa1jurQuP4MFhFl3250Dunj0oAruJXS1If5vbyvTZB8j54ph3FpwiOS
         D5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=ckonWqnxU6mzIIwqS5XRqEBBuKs8Pk0BmT5GQYE1hik=;
        b=M6d05J9Gk6M9yEtHZvwaiR//s93E1XAcCH+yaqj1f4d7chUDKU25KkbkmW4krAliwI
         iZrJoF0qrWxuQrW6UfXM1rZ0iwCJs5urGDTo3bytIazZXkqGt+1HHz/nZucrwkhjLM58
         EzsxRbkgIDO85Ipb4uYUr8n6TsH0Zw06TCo1JBURbUgDlr/6ZCJ5ehbSLyrhktMadDtj
         TxAiOIx5OZpBAF6wnzVzhtevltVoFc0WZDQjKBLf8kfEBuRIwcOWMb3IpaCfgzURAZ8j
         1rAGLiMSN17TM/NxlPmQ8uj2uzfOBeg1+J7Nv1415i1hkGaC4Oa97qXIKtGQjxgUYpUs
         TAZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11si1826204iod.66.2021.03.24.06.20.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 06:20:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lP3Qx-0002Hx-KF
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 09:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nn-0006Xy-Vs; Wed, 24 Mar 2021 09:17:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangxingang5@huawei.com>)
 id 1lP3Nk-0005Wa-QQ; Wed, 24 Mar 2021 09:17:11 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F57xG2v03zPlqQ;
 Wed, 24 Mar 2021 21:14:26 +0800 (CST)
Received: from huawei.com (10.174.185.226) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Wed, 24 Mar 2021
 21:16:50 +0800
From: Wang Xingang <wangxingang5@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>
Subject: [PATCH RFC v2 6/6] hw/i386/acpi-build: Add iommu filter in IVRS table
Date: Wed, 24 Mar 2021 13:16:35 +0000
Message-ID: <1616591795-2056-7-git-send-email-wangxingang5@huawei.com>
X-Mailer: git-send-email 2.6.4.windows.1
In-Reply-To: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
References: <1616591795-2056-1-git-send-email-wangxingang5@huawei.com>
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
Cc: xieyingtai@huawei.com, peter.maydell@linaro.org, cenjiahui@huawei.com,
 ehabkost@redhat.com, mst@redhat.com, richard.henderson@linaro.org,
 shannon.zhaosl@gmail.com, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com, wangxingang5@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7cKxgmUtsLWr

From: Xingang Wang <wangxingang5@huawei.com>

When building amd IVRS table, only devices attached to root bus with
IOMMU flag should be scanned.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
---
 hw/i386/acpi-build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 7729c96489..4e6b30d53a 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2119,7 +2119,7 @@ ivrs_host_bridges(Object *obj, void *opaque)
     if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
         PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
 
-        if (bus) {
+        if (bus && pci_root_bus_has_iommu(bus)) {
             pci_for_each_device(bus, pci_bus_num(bus), insert_ivhd, ivhd_blob);
         }
     }
-- 
2.19.1

