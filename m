Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1586026lfm;
        Thu, 2 Jul 2020 08:27:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGwmAxirJMVMj1uol9kfCya6JnnqVxMvfdym+PeYtuDV0p/HvH9NgSnbSlV/LB+uX/AniY
X-Received: by 2002:a25:850b:: with SMTP id w11mr48984560ybk.291.1593703658685;
        Thu, 02 Jul 2020 08:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593703658; cv=none;
        d=google.com; s=arc-20160816;
        b=eQA/SdL3WLaHBKIm2pVP3Wbei6DPnBDKMWzEdGQSm+BI6n8mez0kTORRtQ1+bZyIBh
         tDskGdprOgXJtRWVVsJxuQzibJC9DS+60szXryM/1J1+4cgSodtuPCa635GcSeJKi9CK
         q5mhHknF5141AmdzqIQWxAstYgmu+NwMcQQKEhBvBruDR64H+Nj3iMOb6S1gubCkqTZB
         SbTQBQ9k/dKfhd+wrNIM1sHKHSpEvgrnr4PxWUB/FE6yu6C/krsVAqtPmhgO9AxnRsJx
         OJDPwXrYc6LscufPnupmLOZ0ysrtkQgvxk1a9L09aGdA9yK+GlQSaNwK2tT9lk1NyrEI
         7owA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=pNH4rf3+4G6SG1/frQNPuCp7RTYauZbpUm977EG7OfM=;
        b=ysaA+we/mmcyGimoPaB6YdS5FtrOWH30RCsZsuqhGmfvOzLI2HoMUOybCH+r5pHScR
         9/obC/uUKtqSFo4oOc1sOPLG6BM6wRZLbwDGGY/AFH179/R3s55vGHE3QMl4msRjUgEX
         T9t7aTPzu3ifvu+ffoM6HmhwZOSPGMLlLVNf4+gLKDPIIWysrrLJut7zupCm3Mv7OOPj
         Zhsva4haTY5pOg/V2HiBhJ/3SKwzu63NBJUDHa+SflOwGIZvGd2QAvFrZ+Sx2wbeXxL7
         sJ5+CjNCcsq/NAsvsbPeVLOg5YPActRRfSELtniG+M0CrSLafA36tcjxF2FQj/eF/ziI
         /M7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cnxd/4wr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si8544342ybm.156.2020.07.02.08.27.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jul 2020 08:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="cnxd/4wr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jr17i-0000XY-03
	for alex.bennee@linaro.org; Thu, 02 Jul 2020 11:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17Y-0000Vx-Le
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30926
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jr17U-0006J2-SD
 for qemu-arm@nongnu.org; Thu, 02 Jul 2020 11:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593703644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pNH4rf3+4G6SG1/frQNPuCp7RTYauZbpUm977EG7OfM=;
 b=cnxd/4wrq92zGmotkTZdfcrRgT+a2hynH6iOOXODmtQSh9yZ3YXxNcM4lRvZX76Poahoud
 wfyleWnjuqOnOvHMYQSyr/FPRNILDD/JsUYNdrKVISECTgkosjNcN+PAAzZ4BQr/TCEOWO
 uSg2lTB1CTsvSIcGb8Q0J4vQdJ1Ji5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-X6EwhBTuN1m5OzDMNo2GIg-1; Thu, 02 Jul 2020 11:27:20 -0400
X-MC-Unique: X6EwhBTuN1m5OzDMNo2GIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76297A0BD8;
 Thu,  2 Jul 2020 15:27:18 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-70.ams2.redhat.com [10.36.112.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A4EE5DD61;
 Thu,  2 Jul 2020 15:27:05 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH v2 0/9] SMMUv3.2 Range-based TLB Invalidation Support
Date: Thu,  2 Jul 2020 17:26:50 +0200
Message-Id: <20200702152659.8522-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 03:23:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6GcFhpMxv2Yo

SMMU3.2 brings the support of range-based TLB invalidation and
level hint. When this feature is supported, the SMMUv3 driver
is allowed to send TLB invalidations for a range of IOVAs instead
of using page based invalidation.

Implementing this feature in the virtual SMMUv3 device is
mandated for DPDK on guest use case: DPDK uses hugepage
buffers and guest sends invalidations for blocks. Without
this feature, a guest invalidation of a block of 1GB for instance
translates into a storm of page invalidations. Each of them
is trapped by the VMM and cascaded downto the physical IOMMU.
This completely stalls the execution. This integration issue
was initially reported in [1].

Now SMMUv3.2 specifies additional parameters to NH_VA and NH_VAA
stage 1 invalidation commands so we can support those extensions.

patches [1, 5] are cleanup patches.
patches [6] changes the implementation of the VSMMUV3 IOTLB
   This IOTLB is a minimalist IOTLB implementation that avoids to
   do the page table walk in case we have an entry in the TLB.
   Previously entries were page mappings only. Now they can be
   blocks.
patches [7, 9] bring support for range invalidation.

Supporting block mappings in the IOTLB look sensible in terms of
TLB entry consumption. However looking at virtio/vhost device usage,
without block mapping and without range invalidation (< 5.7 kernels
it may be less performant. However for recent guest kernels
supporting range invalidations [2], the performance should be similar.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu.git
branch: v5.0.0-smmuv3-ril-v2

References:
[1] [RFC v2 4/4] iommu/arm-smmu-v3: add CMD_TLBI_NH_VA_AM command
for iova range invalidation
(https://lists.linuxfoundation.org/pipermail/iommu/2017-August/023679.html

[2] 5.7+ kernels featuring
6a481a95d4c1 iommu/arm-smmu-v3: Add SMMUv3.2 range invalidation support

History:
v1 -> v2:
- added "hw/arm/smmu: Introduce smmu_get_iotlb_key()"
- removed "[PATCH 5/9] hw/arm/smmuv3: Store the starting level in
  SMMUTransTableInfo"
- Collected Peter's R-b
- In this version the key still features TG/LVL.
- More details in individual history logs


Eric Auger (9):
  hw/arm/smmu-common: Factorize some code in smmu_ptw_64()
  hw/arm/smmu-common: Add IOTLB helpers
  hw/arm/smmu: Introduce smmu_get_iotlb_key()
  hw/arm/smmu: Simplify the IOTLB key format
  hw/arm/smmu: Introduce SMMUTLBEntry for PTW and IOTLB value
  hw/arm/smmu-common: Manage IOTLB block entries
  hw/arm/smmuv3: Introduce smmuv3_s1_range_inval() helper
  hw/arm/smmuv3: Get prepared for range invalidation
  hw/arm/smmuv3: Advertise SMMUv3.2 range invalidation

 hw/arm/smmu-internal.h       |  13 +++
 hw/arm/smmuv3-internal.h     |   5 +
 include/hw/arm/smmu-common.h |  21 ++--
 hw/arm/smmu-common.c         | 200 +++++++++++++++++++++++------------
 hw/arm/smmuv3.c              | 134 ++++++++++++-----------
 hw/arm/trace-events          |  10 +-
 6 files changed, 235 insertions(+), 148 deletions(-)

-- 
2.21.3

