Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp66619ejc;
        Wed, 24 Jan 2024 23:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvL1/2gb3w2ANlZ0k3DeuVtYDSdrjDdGrADxya2m14QuJYLzEMVImu0lfOnxDm4uHk6ASD
X-Received: by 2002:ac8:7f94:0:b0:42a:2b56:449d with SMTP id z20-20020ac87f94000000b0042a2b56449dmr690371qtj.86.1706168430085;
        Wed, 24 Jan 2024 23:40:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706168430; cv=none;
        d=google.com; s=arc-20160816;
        b=xTr69JQpsJxcVUOYA3yCyXdDZ7wQKy2dw7TdF0zXB22I6J75Dj3yoNwhPaj4Kek/vg
         +BrqO/tnPMQSUxvwFRzQWLvJAoMMLNb9PidXBGJT1uroF1FZmcHf9xBtj/M7GkxK2yl9
         6SvXaYqpSAyo80QUNY7BOg+HzUbAPQc8f5M5xOFl9BENJ08HPsFV9XiFQFlcFm2bQbX/
         5M6nmY6xo8b+m8/IUAlyX87eF3+O4aYrjHYbpeLm7LCNfQ0RH+ggZ5o02dTSm/ceeLC/
         dzi8hZL3IMIp+26lZU7ioqL2pD2bnj7oIvT3QSW+d1L/n2qt/+JWmcGh0HZe0qdVe/DG
         Y6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Us5CRYt0oMe5fLTWHp7gXj9S8avulCwnp1ZmqJLKl7Y=;
        fh=/z5KzLhWirsY4GQ5R7Xcc9LzN08KEIo56/BLcBd1lg0=;
        b=JzJPzUJUhtcDAJVxwObQGsRrYXNdOjbaC2tsfbTBSeOe0E4OlVYNDux/BCt5O0xhrx
         Erq4VOKJItI7JXwxdvBa/op72BKon1LK0v01pC+1urD3xd7ufyEyBWyqD3Amn0zu4gSA
         YVY0ESJvvd1ZtvenDRj0KsoT+RKWXpd73cvVt08msDhPFFno8cTcDENYZ/Fw29s9uk70
         ngAi7QUhakAWdO8LQfy6Yj3QpTtWph15CpYZm/fp9D4hDFunuogYI8Ix8VrMGPvtLNKb
         UxDUsNzDP9a2UfLd047RPNLoLmuhhxx2CrnXDH88trXJ27nys9bdnGTml6E9tkKXz3pq
         XQHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=J4NILJaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u22-20020a05622a011600b0042a6305a48esi2505971qtw.97.2024.01.24.23.40.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 23:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=J4NILJaa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSuKf-0004hd-Bn; Thu, 25 Jan 2024 02:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rSuKd-0004f6-PQ; Thu, 25 Jan 2024 02:39:27 -0500
Received: from mgamail.intel.com ([192.55.52.120])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1rSuKc-0002Z1-1w; Thu, 25 Jan 2024 02:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706168365; x=1737704365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5UPbvjnJVUH3Taf72eBNl8r8qzYN+VKXSZvKAc2YBa0=;
 b=J4NILJaaDwAu6raLK+TeLfZU+7PM2BRo/ocr4fEuZv0OwSdq10W8aGZZ
 9szNaRYkeG1qo8JTTRbl3x5LTitOqTtnPBvWQT74WfHewAA6fTnkDP1Mx
 qgOWSLQgsTex4cyfhGOqa0w54RD9aJxQHMms81Aci6X+bT81UgKKEvkcA
 +iMyBDmXPs10cHgrgv+oHiwBhtq/iLJhIHrtYc4DhPsRXBKEYnEgVMi42
 BJ6CZpFCkoFSnQErkKYkgeQXJ4Ji/IOca0ygAAZgFFvhPD0PEPpWNIp11
 GouVSHbeuAq6Wq/86u2tW120oETaG8F3xRgFW3XyQhsXWJC1fRCbNklwI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400942958"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="400942958"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:39:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2187721"
Received: from spr-s2600bt.bj.intel.com ([10.240.192.124])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 23:39:16 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: eric.auger@redhat.com, jean-philippe@linaro.org,
 alex.williamson@redhat.com, clg@redhat.com, peterx@redhat.com,
 jasowang@redhat.com, mst@redhat.com, yi.l.liu@intel.com,
 chao.p.peng@intel.com, Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: [PATCH v2 1/2] virtio_iommu: Clear IOMMUPciBus pointer cache when
 system reset
Date: Thu, 25 Jan 2024 15:37:05 +0800
Message-Id: <20240125073706.339369-2-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125073706.339369-1-zhenzhong.duan@intel.com>
References: <20240125073706.339369-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
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
X-TUID: 1FptsEsVyDac

s->iommu_pcibus_by_bus_num is a IOMMUPciBus pointer cache indexed
by bus number, bus number may not always be a fixed value,
i.e., guest reboot to different kernel which set bus number with
different algorithm.

This could lead to endpoint binding to wrong iommu MR in
virtio_iommu_get_endpoint(), then vfio device setup wrong
mapping from other device.

Remove the memset in virtio_iommu_device_realize() to avoid
redundancy with memset in system reset.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/virtio/virtio-iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 8a4bd933c6..86623d55a5 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1264,6 +1264,8 @@ static void virtio_iommu_system_reset(void *opaque)
 
     trace_virtio_iommu_system_reset();
 
+    memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
+
     /*
      * config.bypass is sticky across device reset, but should be restored on
      * system reset
@@ -1302,8 +1304,6 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
 
     virtio_init(vdev, VIRTIO_ID_IOMMU, sizeof(struct virtio_iommu_config));
 
-    memset(s->iommu_pcibus_by_bus_num, 0, sizeof(s->iommu_pcibus_by_bus_num));
-
     s->req_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE,
                              virtio_iommu_handle_command);
     s->event_vq = virtio_add_queue(vdev, VIOMMU_DEFAULT_QUEUE_SIZE, NULL);
-- 
2.34.1

