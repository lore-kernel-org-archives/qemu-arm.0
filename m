Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp2322191ejg;
        Sun, 21 Jan 2024 22:43:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIk7gbCT1goJd9BznYvrvlIOymt4cYmypAh0bJCwXAkvWeHYXn+CW8pDkQwUqzZWEx1iUv
X-Received: by 2002:a05:620a:119c:b0:781:baba:1f93 with SMTP id b28-20020a05620a119c00b00781baba1f93mr4602310qkk.126.1705905806332;
        Sun, 21 Jan 2024 22:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705905806; cv=none;
        d=google.com; s=arc-20160816;
        b=VpmpYhXZP8mQq6wKEIwVt6By00oEJKuy3Vah57TYVXq5uLGBHJkknjB/0y/rXvfm6J
         WxgubV9e09tdg2bfF17Yd8PHSP9/bxnJtXpJIklHSCthMdjcEarTi+Vb+WWkVFX1Ya+B
         j5MciKK9/cB9HNHugADxPVZI6lnGC3g1OhPIE21nEVqqjTl3rA8R4pjj9tCp8zsUnPmG
         uGEokF1GrUCdzCKvwzTDULriTpzYRxtrFa8zXMZRzP5NPTvtju4y9uWP6UqYa20/M8rl
         zBIhW2sA2M/TsnT/E67FlplRGS5s6nuvdRXKQtP+p/ALr5q4xYu4sJAYA37nFEzfb5s8
         cR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dZFfiej1iBV5OvPWxn2He31XfiDUyYaE+KpHm6XdWNk=;
        fh=/z5KzLhWirsY4GQ5R7Xcc9LzN08KEIo56/BLcBd1lg0=;
        b=Kc9fvT9Gino40pOqcDg4FSvKJf3C7RvKE6nhb8+lYTYxh/dUOEwmyRS4NrvKSMsXTY
         SmtqtFS5UKTsim26EL+9jeOuEdXqx4d7wbrgeFgE/dA4txK5xjqA9kP2lreMy0vdOTQ/
         MFck+keleip7BDVKBRz/xUw+HXkpJ9uQraMtjwgADzxYqSKWJJ5J+KYA0YZe9Kwq6lcV
         sfdOQCvC6agpbwefiO81GtT+4gCkJCiAxhSg0Cu9UCIDjoUgzKOVk+/lQ8/u+I9xva2F
         E8E2tfRZPYTmKs3JfJFVCeAdMls3x749RXYgCjO8OWrX4YXbH59qn5b3FOqNeBSI4f9P
         p/4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KZETwAGc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020a05620a13f400b007839b6cc4d4si2419840qkl.609.2024.01.21.22.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jan 2024 22:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=KZETwAGc;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rRo1I-0005AB-76; Mon, 22 Jan 2024 01:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rRo15-00057y-8u; Mon, 22 Jan 2024 01:42:43 -0500
Received: from mgamail.intel.com ([198.175.65.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rRo13-0007FD-1P; Mon, 22 Jan 2024 01:42:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705905761; x=1737441761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZQY0H75u+yRvchuolvuAcTS1ZqiXfRlinti37nkbD/Y=;
 b=KZETwAGcOs81cGrFxEXllrgm9AekN9LBdJnE6tQ9sjqKoTqspCCoAln7
 8u3xB32BxzPenwo12RpJl23zDHGRCdlqC7yEb9qEkVBI/4uXQMpN2MfWt
 FwGyL9okMxku5eLzQDw0jWg/Iihx7CBxzBqC8EQvBepYFtwU5dmhhXKb9
 ZLAMMqJ7cKBfLqLqt4BIn4q8ocREgVTyK1tY26tLtDHTp8QLcIkANyhWJ
 g2qmyeIlnn3ErWRKaft3ON31gbAlcourgCvck6CDXdRsgpxIhaCxXZDnw
 djYF/LdXC7/RuZrhvI4DgqV4YKpDmZ2N2mF6i78OQMDWsUKTHn7s9unAM w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="7792045"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="7792045"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 22:42:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="761646631"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="761646631"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.124])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2024 22:42:30 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, clg@redhat.com, peterx@redhat.com,
 jasowang@redhat.com, mst@redhat.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [PATCH 1/3] virtio_iommu: Clear IOMMUPciBus pointer cache when system
 reset
Date: Mon, 22 Jan 2024 14:40:13 +0800
Message-Id: <20240122064015.94630-2-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240122064015.94630-1-zhenzhong.duan@intel.com>
References: <20240122064015.94630-1-zhenzhong.duan@intel.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QYuuSec5C6vT

IOMMUPciBus pointer cache is indexed by bus number, bus number
may not always be a fixed value, i.e., guest reboot to different
kernel which set bus number with different algorithm.

This could lead to endpoint binding to wrong iommu MR in
virtio_iommu_get_endpoint(), then vfio device setup wrong
mapping from other device.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8a4bd933c6..bfce3237f3 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1264,6 +1264,8 @@ static void virtio_iommu_system_reset(void *opaque)
 
     trace_virtio_iommu_system_reset();
 
+    memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
+
     /*
      * config.bypass is sticky across device reset, but should be restored on
      * system reset
-- 
2.34.1

