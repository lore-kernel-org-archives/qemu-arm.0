Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp66408ejc;
        Wed, 24 Jan 2024 23:39:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkKJv8bwcZcNxWi6ElX7SNZV9KlDRJtF0Ks8somunpHKHugRMJ/pmxqMKYFIKBk2M7PcHq
X-Received: by 2002:a0d:dbd3:0:b0:5ff:9305:1343 with SMTP id d202-20020a0ddbd3000000b005ff93051343mr344776ywe.41.1706168399656;
        Wed, 24 Jan 2024 23:39:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706168399; cv=none;
        d=google.com; s=arc-20160816;
        b=l6ANopZF0RpzIKWr+PFTlzuOfRse4HIb17j+Aq3WC5qUsbrcLT/haMApQFNZVc0Muy
         CXKvmlir3Pvg+O/vcokj6CucntPeqC3lkyXk4VpA4TpB3k08HnT2IU2yGAc3pTMfkAEl
         OrUd4vkmoQdl1ivSg/NZNYFO0vRGFFFRcvY9qa1nvOgiI4lHub3aoV9FVWfUxNA69l9o
         yw8zJQTHAubyCtg7ja13JOg0hEcSR9C3NOiKU5UVVifE244sakqn/rAI/7mQqET20WDk
         y/lHcX9n2U+hooYCXSBzyrsliMBryCydkc3vrVvIMgFIhX9WkRdTBVhNznUgOsdavbOI
         yC5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3QPUaBWqQCqdsCBa5XpXl2VYnnApy9L5VRzdQOzJHBM=;
        fh=/z5KzLhWirsY4GQ5R7Xcc9LzN08KEIo56/BLcBd1lg0=;
        b=WXJ8gZh0zs8/1hCaA9yfMyzXM6ZF96VUvsIKy/QQrq0Rdcne5w3SZz6RHw9WcbKGzV
         zLmdPv+DQxsaSx337Yvjbum0Ba1eG72aVgHy/9L0bLP+X7lGFITmey7psy28/iUuvEQ+
         LsElj9Dusyg2e4XRkGBRr17t5IUWIakvutm4m5ISFYzKrQ6Wzi8XHjcuMHkVN7hd/cZR
         KVQSQIje1mhJ2+hzHO8PfNhiqL6HH85/iWHL/1wYei5LV/97YKktZ+NZJ1aRcz9pJDSU
         dIvhNh8KbFcHBd6cBLnMTG3ECKXaI4k/N2oNu5OpoqoCxMY8GNGMRqO8Jdd7698OF/7y
         PdUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=k4nYdVPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20-20020a05622a051400b0042a220f0cacsi12280849qtx.650.2024.01.24.23.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 23:39:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=k4nYdVPo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSuKc-0004ei-9l; Thu, 25 Jan 2024 02:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rSuKb-0004eS-Dp; Thu, 25 Jan 2024 02:39:25 -0500
Received: from mgamail.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rSuKZ-0002YQ-OU; Thu, 25 Jan 2024 02:39:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706168363; x=1737704363;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VD+w9a50KOP5gQOa1rpKHZ8VF21XLZk8+rGBup4Yo5o=;
 b=k4nYdVPo2ARBhiDxyf+Uwmq+57vr0SFxyJq2jrmlJQjflvdF/rClGUt7
 LnLiJFSFut1gmc4bUvH/oi/PGuR4EinFDAwUkxHfcH235m/J2jf00aTtz
 v1ZEjmNrNv7cfMoIc6a3hwOCcS1XfgC4NR4MMqWhZW/O9uv48macCj4Rr
 nclO5Z+EToO/yJ/MYT4YASAy9wLz8kaZp2DVhdPFfI4/sAZGFdbI3Qk13
 HTIsmJAZhQJkMt1PKFEYBW1JDPP2NzSFCn2YkbIjbM/NLHYEifDQf1dpm
 M1ALac7JBghlBblIvsbvwhPjByI9554xi3SpUxTVGMSWncMeMEXLAqslA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400942952"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400942952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2187713"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.124])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:39:12 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, clg@redhat.com, peterx@redhat.com,
 jasowang@redhat.com, mst@redhat.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [PATCH v2 0/2] Two minor fixes on virtio-iommu and smmu
Date: Thu, 25 Jan 2024 15:37:04 +0800
Message-Id: <20240125073706.339369-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.120;
 envelope-from=zhenzhong.duan@intel.com; helo=mgamail.intel.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.5,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: pFsXNAF9ghOi

Hi,

PATCH1 fixes a potential issue with vfio devices when reboot to a
different OS which set bus number differently from previous OS.
I didn't reproduce the issue in reality, but it's still possible
in theory. VTD doesn't have same issue as it use some verify logic
to ensure right iommu MR is picked.

PATCH2 does same thing for smmu.

v2:
- Remove redundant memset in realize (Cédric)
- Add a patch for smmu (Eric)
- Drop the patch to support PCI device alias for now, as it's tricky in
  using two different IOMMU MRs and Eric already sent a smarter fix.


Thanks
Zhenzhong

Zhenzhong Duan (2):
  virtio_iommu: Clear IOMMUPciBus pointer cache when system reset
  smmu: Clear SMMUPciBus pointer cache when system reset

 hw/arm/smmu-common.c     | 2 ++
 hw/virtio/virtio-iommu.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

