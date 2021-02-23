Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2247370lfc;
        Mon, 22 Feb 2021 18:23:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwc4OMQCnLTZuFlRCSzwNnDoFG3+/O6aJrTnOKNUCpDQ24olIyCuELD2AzbXSYwImiBX69
X-Received: by 2002:a02:781f:: with SMTP id p31mr25888125jac.14.1614047021020;
        Mon, 22 Feb 2021 18:23:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614047021; cv=none;
        d=google.com; s=arc-20160816;
        b=UBdjEZxIGfWIFYJJ9ynFAonyLFAgR+/2SdsWxyvA++Vljz+WlgUWu3ZamQTb7oHOjm
         Bu2Hb7SGJEWi/OcRJCtEj6YfpEe9Z4qNljcgB60Dsnh/HHlz6xoIsn9GjpiTZASrU7Ax
         9bSoVsIXldZgZIM1PeV3oLaffe0CwSVbAFoZFhd8P6WcJSKa0OhhH4mMiMT28PHW6SAI
         ARRPHTIFMIiav8v9kgC8On2qFx6f20hZ7HkNJZfEpVk8F4bwRSeJFMt78jNuBqEb9mQK
         A/X/YOs86V92fdNfkYRAG2wKtjWMs+RV/Z3YjZdyek4FkLW4p8oyGNF68UY4l3UJeVCO
         /dVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=/LfLi0bm/zsycj/pSrD9FUg8nuone8nFqEbPvbo033E=;
        b=wB3yEq2+TmeQrXxa8gIn3efrLwZQiKregMOSA4hOweZCHA0mEEIp6rCx5TbcAvka14
         +uWF1ltaRLm/bYvw5TeYMwB8JSTx23An6bDKOLJW5Tus1R9ulGtIBmUScIbjgGJrX0vM
         4Sw0j7gugqteflFuXs09zCPi6bzHkZxnomAxJv6u7jp9tJfIRjcTdoeF4v4LcZftRgVY
         ULacQLLHdtHseCiCh0GMOXq/FFlBuKpQRDfzJ91q9rPW5HzWgwfEQANYqXnmUQQylXNz
         doYFHxZUJwoRbP1r3QQ/bnoLXFIab+O/vpPW7jYtVuxYujY2FGhLpNJWYQF0UgKYMUCV
         B4pA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si18716604ilu.30.2021.02.22.18.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Feb 2021 18:23:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lENMS-0006MK-AZ
	for alex.bennee@linaro.org; Mon, 22 Feb 2021 21:23:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENLy-00068O-OM; Mon, 22 Feb 2021 21:23:10 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lENLq-0000H0-71; Mon, 22 Feb 2021 21:23:10 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dl2q313FNzjR1N;
 Tue, 23 Feb 2021 10:21:19 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 23 Feb 2021 10:22:46 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v3 0/3] vfio: Some fixes and optimizations for VFIO migration
Date: Tue, 23 Feb 2021 10:22:22 +0800
Message-ID: <20210223022225.50-1-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.135]
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
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Eric
 Auger <eric.auger@redhat.com>, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l1GvNwUbdctZ

This patch set includes two fixes and one optimization for VFIO migration
as blew:

Patch 1-2:
- Fix two ordering problems in migration.

Patch 3:
- Optimize the enabling process of the MSI-X vectors in migration.

History:

v2 -> v3:
- Nit fixes.
- Set error in migration stream for migration to fail in Patch 1.
- Tested Patch 3 with a Windows guest.

Thanks,
Shenming


Shenming Lu (3):
  vfio: Move the saving of the config space to the right place in VFIO
    migration
  vfio: Set the priority of the VFIO VM state change handler explicitly
  vfio: Avoid disabling and enabling vectors repeatedly in VFIO
    migration

 hw/pci/msix.c         |  2 +-
 hw/vfio/migration.c   | 28 +++++++++++++++++-----------
 hw/vfio/pci.c         | 20 +++++++++++++++++---
 include/hw/pci/msix.h |  1 +
 4 files changed, 36 insertions(+), 15 deletions(-)

-- 
2.19.1

