Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2322069ejg;
        Sun, 21 Jan 2024 22:43:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYHNx3N2m+S9h/zrL9S9Tl/c1HqZsYGaMAM/rD+cihpNnPfkVKOvVdqQDoUQsukEuKZNv5
X-Received: by 2002:a25:2984:0:b0:dbe:a081:97b9 with SMTP id p126-20020a252984000000b00dbea08197b9mr1689668ybp.101.1705905783707;
        Sun, 21 Jan 2024 22:43:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705905783; cv=none;
        d=google.com; s=arc-20160816;
        b=qo0JTD+2bqV5kK42eKzWQtAQ4NW/b7z3RS7moSvldZJ8/L6kDVPJwskQHnRs8hiTjc
         eCFk1KhNoZ/++FGNrXj4MLD6UAS/mL8j4j1DY/F7K4sBbAtC4cbPjJRCGJq6hH+0B/mO
         DoKX/fCaXRxSBrl7dZbsngVXqfcTWDgRRE7tF1IVxo6VQT95eBM8Wb+hOd3YzbyPdbHg
         etKIwsLbeY0AJ4XN1wUHhmMcZou0wSQ+xCtU3jNgIPYNZkfzc9491LzIOcKcSkViknMs
         ZLdyPIkJ08qDRWU89AjbFea2YEgRpslp5616yFathx6HRDl5vwsuGDL08On90beaILwb
         XW4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DWEXGvpKCTOkO3GFMy2MfHZPduwxwrLdYxTJHNNkHD4=;
        fh=/z5KzLhWirsY4GQ5R7Xcc9LzN08KEIo56/BLcBd1lg0=;
        b=PSUln1y28ZZSpO4554TxKC3zl98VoWoFcbmC4e/MWYSWIzc5ZfDju0AlKpvCI8K9O1
         d2A2EByDyXRnZ6E6+ctcldrXePoHbSB7z11SgI8exViycP4vMDoSF00XIPhCs6RgGuIL
         azRUf60I9j1uYi5nmBfRrkJXpNQ1QHM/Wuk9MwsMusbdMLqoMqaLnifwK18wXaaLetEb
         hLci9KyEpPKCkrX7aBhgxf0P9WlCuykKVCzsvuiBk5JoEo/Xm0Y4ZtpABa6nEK7V5UBH
         osKZDxoQmtZdu7RvJ0dSnyEppWsrvwViexeqL7Y5O4V5yHYXCLmJp8/LRCJ1v9cZPzz7
         GxOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=isU9vsqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020a0cdc93000000b00683b603ea43si4998122qvk.378.2024.01.21.22.43.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jan 2024 22:43:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=isU9vsqC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rRo14-00057x-VM; Mon, 22 Jan 2024 01:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rRo12-00054y-9e; Mon, 22 Jan 2024 01:42:40 -0500
Received: from mgamail.intel.com ([198.175.65.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rRo0z-0007FD-DW; Mon, 22 Jan 2024 01:42:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705905757; x=1737441757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3slVKNPgKP7HnQMkKS8GL34uXrfKAhck3xmWHvDKgEo=;
 b=isU9vsqCutwKdFNqtcFRwBGFW420rYoX+pRcc6mC02y63twZDbZQSymV
 Ln993EXnqA9AN0O9fiO0DiLhCPhuiwoGZq8RfArIbI4M/EXrisrY0cyGo
 JFnonAKrmXrE/HfOa9/NfhdiTm3QPjNqZ0WkKRC1ibrtOy67pMv2cmG5I
 YLSpdM1mIq9ESz2h5N95khdKrRDOb5Tja/eSJ+g4vEzjDFTiOksOQrP73
 OMNMJZHw/CG4m8JZiDEnpXk+qod6D08ob6dkmZCpFQMaLUbJOU/B5A1Pw
 QuxxRUXhMFYFjzZaiFsMQ30YCknxDAJR3AjKowYuUgkqgW6mBiQsbWXzQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7791982"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7791982"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 22:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="761646598"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="761646598"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.124])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 22:42:26 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, clg@redhat.com, peterx@redhat.com,
 jasowang@redhat.com, mst@redhat.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [PATCH 0/3] Two minor fixes on virtio-iommu
Date: Mon, 22 Jan 2024 14:40:12 +0800
Message-Id: <20240122064015.94630-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=198.175.65.11;
 envelope-from=zhenzhong.duan@intel.com; helo=mgamail.intel.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.287,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gg+MTpoDQ+Tp

PATCH1 fixes a potential issue with vfio devices when reboot to a
different OS which set bus number differently from previous OS.
I didn't reproduce the issue in reality, but it's still possible
in theory.

PATCH2 is a prerequisite of of PATCH3.

PATCH3 make virtio-iommu support PCI device aliases. If there are
more than one device in same IOMMU group, either due to topology,
isolation feature, etc. virtio-iommu can only make one which has
alias BDF works. This impacts both emulated and vfio devices.
I have reproduced the failure with an example config to have two
vfio devices under same pcie to pci bridge.
This patch also make a proper place in virtio-iommu to store
iova_ranges from vfio device when vfio device shares same IOMMU
group with other devices, either emulated or vfio devices.

Zhenzhong Duan (3):
  virtio_iommu: Clear IOMMUPciBus pointer cache when system reset
  hw/pci: Add two parameters to get_address_space
  virtio-iommu: Support PCI device aliases

 include/hw/pci/pci.h     | 11 ++++++++---
 hw/alpha/typhoon.c       |  3 ++-
 hw/arm/smmu-common.c     |  3 ++-
 hw/i386/amd_iommu.c      |  6 ++++--
 hw/i386/intel_iommu.c    |  6 ++++--
 hw/pci-host/astro.c      |  3 ++-
 hw/pci-host/designware.c |  3 ++-
 hw/pci-host/dino.c       |  3 ++-
 hw/pci-host/pnv_phb3.c   |  3 ++-
 hw/pci-host/pnv_phb4.c   |  3 ++-
 hw/pci-host/ppce500.c    |  3 ++-
 hw/pci-host/raven.c      |  3 ++-
 hw/pci-host/sabre.c      |  3 ++-
 hw/pci/pci.c             |  3 ++-
 hw/ppc/ppc440_pcix.c     |  3 ++-
 hw/ppc/spapr_pci.c       |  3 ++-
 hw/remote/iommu.c        |  3 ++-
 hw/s390x/s390-pci-bus.c  |  3 ++-
 hw/virtio/virtio-iommu.c | 21 ++++++++++++---------
 19 files changed, 58 insertions(+), 31 deletions(-)

-- 
2.34.1

