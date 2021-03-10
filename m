Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp134062lfg;
        Tue, 9 Mar 2021 19:03:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1MUQrPJrMZgHamKVABHNU4v6jty0D32+dZwbIPstuWWRDpyK8ZhsyY+MyR9Qox9HvDPFY
X-Received: by 2002:a05:6638:f11:: with SMTP id h17mr1235703jas.67.1615345408014;
        Tue, 09 Mar 2021 19:03:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615345408; cv=none;
        d=google.com; s=arc-20160816;
        b=kOGdzqd+ikNkZZncVVynA8T9YjmcPrIjy7vCOsRXWonpbtfvirm9TFaUcymKPe67yU
         LgxRptr6CdxeSP6n+ZqpVaQUQUamwMYjJ7UFUAIILQ61lpXewwmogKAhm9kPkbj4//Xe
         m5zP/JO0TQHSex68ZRbd7dghBQ91yZ9rUuxYPaUMt7qBici3z6p3pVQgLn8MeEgxhd8K
         FbovOh0RTefXBocyzfLqAnzZf2VGEvk9vqJq/qosuJUrCAVsaspBucGYCqej+BtPXF70
         gLlIlA3iFjAxFbWamSyGAHtSkF2EQFaMq11orknby9NBA7PsjjcSEWiofH/qGtydehPb
         mXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=2qPLSsMjNp8keG2g7AHWD/LNIzT/A1ceoIveHxmX9nM=;
        b=rKyOiPmCdGq/UN5F2CT7rNSfBNTKoMju0TE7EgQbH6a40Ex8LJxyhPkKvi2Lt4o1ul
         n/no29ItG2DSrAE0VHJjCzRcMeLivqXe+19ooI8FNsNEeBZhaTfJ1xRAPv0Dlizi6CDH
         gR2SfPK/yYPfHNKDIhLoGor9fJjSQKv//5IbwV2boI8fyrBt0D7ktMW1kkqJ4lYJfo+S
         HRADrqadfx/JaUWA2EdQp5XlSHzA9dIbZXDKVr/UqBUdYgm8UNAAj3V7/94D0SRnoftS
         9Ls4cDIaXdueK3Re+JFm4HrDgUALKSv2BOx37mWHLAmlhl1by3BgcuZo/p9iikarZFMm
         IRpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si16608680ile.47.2021.03.09.19.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Mar 2021 19:03:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJp8B-000554-AO
	for alex.bennee@linaro.org; Tue, 09 Mar 2021 22:03:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp7r-00053P-8Z; Tue, 09 Mar 2021 22:03:07 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:4046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lushenming@huawei.com>)
 id 1lJp7o-0002sd-Ho; Tue, 09 Mar 2021 22:03:07 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DwH0X59SmzkWQf;
 Wed, 10 Mar 2021 11:01:32 +0800 (CST)
Received: from DESKTOP-7FEPK9S.china.huawei.com (10.174.184.135) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 11:02:51 +0800
From: Shenming Lu <lushenming@huawei.com>
To: Alex Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: [PATCH v4 0/3] vfio: Some fixes and optimizations for VFIO migration
Date: Wed, 10 Mar 2021 11:02:30 +0800
Message-ID: <20210310030233.1133-1-lushenming@huawei.com>
X-Mailer: git-send-email 2.27.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.184.135]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=lushenming@huawei.com;
 helo=szxga06-in.huawei.com
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, marcel.apfelbaum@gmail.com,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com, lushenming@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: brJs7ivOcEJ0

This patch set includes two fixes and one optimization for VFIO migration
as blew:

Patch 1-2:
- Fix two ordering problems in migration.

Patch 3:
- Optimize the enabling process of the MSI-X vectors in migration.

History:

v3 -> v4
- Use msix_function_masked instead of msix_masked() in Patch 3.

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

 hw/vfio/migration.c | 28 +++++++++++++++++-----------
 hw/vfio/pci.c       | 20 +++++++++++++++++---
 2 files changed, 34 insertions(+), 14 deletions(-)

-- 
2.19.1

