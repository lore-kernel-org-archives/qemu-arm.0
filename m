Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp38279njb;
        Mon, 17 Feb 2025 05:38:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXlrhM5pbsRa89MngIWRrgI2hezI3LPdJ2+wi3Cf8PvYf/kxsu7ajbKjs07tmsbwpPTUxWD5IZJTew7CQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFv/2vvK0bq3oXsgu6vZzCciOVJZGP8FjSdkRR63Xn676dB+tJBtE2zs8pRxerXasQLpXxA
X-Received: by 2002:ac8:7d94:0:b0:471:ab7c:3bb5 with SMTP id d75a77b69052e-471dbd24ed6mr136052741cf.18.1739799510106;
        Mon, 17 Feb 2025 05:38:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739799510; cv=none;
        d=google.com; s=arc-20240605;
        b=AqWMG5rMky/+6J8fB7Ev28JKUeddhwWvF9WOvm/myrZZsOmw/gjAKNlO0Y3XZKqNgY
         5UKhDg1LzZah6UqUzzkNAgIOpQTA01AwNA8X0ryJPxp7k+jJhGKJ5y5m0V0st8x8/sL9
         p6AIRkGzVMEBqZKpJB7jCxnOIwK6sVxI8+jBuvWTQEiMLwvOqGXHFk13pGHH17iYjUGk
         jIY487aeBnl0KR2JETu2oREwv3ulYzIyCKwAj59t9br/dqU0K+tL9dEwxe+FXmiqTP27
         ngap57z4uiPKEuAVA2nYE6UA16e0K6sHs4BqBtR3t1vwENVFygZW9SA3XkItmf60CTSV
         bFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ljrVVwT60+xjjljXfL7GKbgYajfRMb3sKNeGiwY6zFs=;
        fh=swiL4bERDBgIQIiNoTOu/2bBoUECE5mFI7R2Xc6Vuzs=;
        b=dXvzYQZs5ZDtvvgfQvniNSHl8P+8ov5GeO6Huqbdf2RsDvQDaomUI3pDQWyyPGsCen
         XRSvChNcMxLaYI/GgYln8mJF3HLrNEAKvasRSK4JRe04igB753aU3On3lOlEKXcZJ/UP
         ietN1JP/H/rPDKLmn4E/zKMHZ6y24qSJhE8DLH63NmCrUit4hFtyKpqiZeC48uMG2DRW
         nhUeZnKWs5pPwM8p4o7ZmDvx+/Su4iVmd2fDfNGtxBoRicgnvtqcwiQh5FFLdycJBYOd
         lZaGZlGwsioKPlKu0CfJijqQsn4iOrmvwyEwhjO2MimNMvs0xd/yoVyoKMYS8NZgYsQD
         5TCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IDyGig54;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f7975430si6702391cf.366.2025.02.17.05.38.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 05:38:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IDyGig54;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tk1KB-0007Xe-4V; Mon, 17 Feb 2025 08:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1K0-0007Tn-Oy
 for qemu-devel@nongnu.org; Mon, 17 Feb 2025 08:38:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tk1Jy-000288-Q2
 for qemu-devel@nongnu.org; Mon, 17 Feb 2025 08:38:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739799481;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ljrVVwT60+xjjljXfL7GKbgYajfRMb3sKNeGiwY6zFs=;
 b=IDyGig54c9O8j164MNHBh/UgcSD1cuXIFytEfhxanYjwjhG0z5f+B5iWAUpKnp0bw4Tqwa
 bnt1Jansy4IvUNQWxOGRmO7zg9si2SoMV+l4nBhw3l7uFn15EGyEDc9N/4f1IoZi00JwHa
 VAezewq+zUL9jlgTGnnOuaQGFZ75GBQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-571-ICKS3lJFNfOpRhWLc7e0qg-1; Mon,
 17 Feb 2025 08:37:57 -0500
X-MC-Unique: ICKS3lJFNfOpRhWLc7e0qg-1
X-Mimecast-MFC-AGG-ID: ICKS3lJFNfOpRhWLc7e0qg_1739799476
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 363BE1800871; Mon, 17 Feb 2025 13:37:55 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.45.224.254])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BB0941800265; Mon, 17 Feb 2025 13:37:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jasowang@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org,
 zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: [PATCH v2 0/5] Fix vIOMMU reset order
Date: Mon, 17 Feb 2025 14:36:44 +0100
Message-ID: <20250217133746.6801-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: whG6cXHvpV/a

With current reset scheme, DMA capable devices are reset before
the vIOMMU which translate them. This holds for the different
IOMMUs and various DMA capable devices such as virtio devices
and VFIO ones. With virtio devices spurious traces can be
observed at qemu level such as "virtio: zero sized buffers are
not allowed" while for VFIO devices, translation faults can be
observed at host level.
  
Virtio devices use 3 phase reset and virtio-pci devices are reset
in the 'hold' phase. VFIO device reset are registered using
qemu_register_reset() and as a consequence they are also reset
on 'hold' phase.

Note that the tree of QOM devices resets depth-first but it does
so while enforcing the 3 phases. First the tree is traversed doing
the 'enter' phase, then the 'hold' phase and eventually the 'exit'
phase.

However the QOM hierarchy is not built so that vIOMMUs get reset
before the DMA capable devices (IOMMUs are using either legacy reset
scheme or hold phase). Changing the QOM hierarchy does not sound
trivial while forcing the vIOMMUs to be reset on 'exit' phase
sounds reasonable and much simpler. Obviously this relies on the
assumption that all DMA capable devices quiesce their DMA before
(ie. during 'enter' or hold' phase).

This was tested with qmp system_reset and virsh reset.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/viommu-3phase-reset-v2

History:
v1 -> v2:
- Removed hw/i386/intel_iommu: Tear down address spaces before
  IOMMU reset
- Also move SMMU base class reset to exit reset. This was an
  oversight from v1
- Add last patch documenting expectations in terms of DMA reset
- Improved commit messages and cover letter
- dared to keep Michael's A-b for the patches whose code was
  not altered

References:
[1] [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/


Eric Auger (5):
  hw/virtio/virtio-iommu: Migrate to 3-phase reset
  hw/i386/intel-iommu: Migrate to 3-phase reset
  hw/arm/smmuv3: Move reset to exit phase
  hw/vfio/common: Add a trace point in vfio_reset_handler
  docs/devel/reset: Document reset expectations for DMA and IOMMU

 docs/devel/reset.rst     |  5 +++++
 hw/arm/smmu-common.c     |  9 +++++++--
 hw/arm/smmuv3.c          | 14 ++++++++++----
 hw/i386/intel_iommu.c    | 12 +++++++++---
 hw/vfio/common.c         |  1 +
 hw/virtio/virtio-iommu.c | 14 ++++++++++----
 hw/arm/trace-events      |  1 +
 hw/i386/trace-events     |  1 +
 hw/vfio/trace-events     |  1 +
 hw/virtio/trace-events   |  2 +-
 10 files changed, 46 insertions(+), 14 deletions(-)

-- 
2.47.1

