Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4734209lfb;
        Wed, 9 Dec 2020 00:10:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5PoZaaOnLn/70Jo8js6IlfQln9MxXz/cwMWJruebGX4h2fpbd4AW/OQJb92TQ9ygMMkQm
X-Received: by 2002:a25:2cd6:: with SMTP id s205mr1842392ybs.279.1607501437011;
        Wed, 09 Dec 2020 00:10:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607501437; cv=none;
        d=google.com; s=arc-20160816;
        b=0cNrcoRSL0U84db4GCe3YzIywGg7nfAzyzoHBP45ZQHeS3pbWMlUo/fDVL7wl1WOQO
         DFjo8NVBrXXRyFHxF5uR+5BfhG+/aikgCapZe3MzcKhxXV17PQSmIfJmabq9DqBdfh1V
         S88k2Md9bP6NmxuPB56MoSduz309mhmHheGUiyWWY4fz6vLeKNG1OhKMAiu6XEwNFCs6
         /OFNeGwrA2j9GSP4sBeqhAP5SSe7hsOmr7nrYn2P1ndjyFMsZI+fDdfM7DSd9KAM6VzQ
         XtxsgBH4iIjgSQgHrDS4PWWu/ulxP3vSsXxDIbdeb9jSTS/3zwJVNz3A4h4Q18KFq06I
         unDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=84TzfBm3ASAybHx+A4LJxsvh1hcL7hENSN4OTnpQQDQ=;
        b=Fmlb6jfIEf+PL3Rab4vJN1GNvHEFBskDLUXw+/C3gXygwqBMRu6JWk7tctmL36QRja
         PbrRhyoVfaO/FJRcV358P42zGSAxNB9L+VXXG6kyh1W9RQ5Uxm2n8p1PSBvsW3nIYiA+
         l2SYXYMplTIH5I6otM/Nho50vuTssChb/3w8K6qBlvxMKfXGo44OkS6Qh2flHdOizr9+
         tVp5a/Z5GoHPbnJBid/SEa90e7vn1C42OMrUBfyLmMHzh0sAlrqsuZYtMLcCh2Zb92Yh
         cfL/eQZVEO45+08UbWYDFX5Z5g03jfRxzbXaouelGGJf375SSwAs/W4hNYwMqlgnG6qY
         3zAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u206si976937ybb.13.2020.12.09.00.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 00:10:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmuYW-0003Oo-Cn
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 03:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kmuYJ-0003O3-HH; Wed, 09 Dec 2020 03:10:23 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1kmuYH-0006ve-JJ; Wed, 09 Dec 2020 03:10:23 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrV7t68HyzM23Z;
 Wed,  9 Dec 2020 16:09:30 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.187.219) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 16:10:02 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>, "Dr . David Alan
 Gilbert" <dgilbert@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [RFC PATCH v2 0/3] vfio: Some fixes and optimizations for VFIO
 migration
Date: Wed, 9 Dec 2020 16:09:16 +0800
Message-ID: <20201209080919.156-1-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.187.219]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=lushenming@huawei.com; helo=szxga05-in.huawei.com
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 Marc Zyngier <maz@kernel.org>, qemu-devel@nongnu.org, lushenming@huawei.com,
 qemu-arm@nongnu.org, yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rxg8JUKUTpfK

This patch set includes two fixes and one optimization for VFIO migration
as blew:
Patch 1-2:
- Fix two ordering problems in migration.

Patch 3:
- Optimize the enabling process of the MSI-X vectors in migration.

Thanks,
Shenming

Shenming Lu (3):
  vfio: Move the saving of the config space to the right place in VFIO
    migration
  vfio: Set the priority of the VFIO VM state change handler explicitly
  vfio: Avoid disabling and enabling vectors repeatedly in VFIO
    migration

 hw/pci/msix.c         | 17 +++++++++++++++++
 hw/vfio/migration.c   | 28 +++++++++++++++++-----------
 hw/vfio/pci.c         | 10 ++++++++--
 include/hw/pci/msix.h |  2 ++
 4 files changed, 44 insertions(+), 13 deletions(-)

-- 
2.19.1

