Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1379578lfb;
        Thu, 21 May 2020 02:13:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZh5SuzYuFaY5+95lAcRwjQHoPPGrTwQQoam+G4VGOpJSpE/4Jko4nB1eNiCL4LPiSKe95
X-Received: by 2002:aed:2762:: with SMTP id n89mr9566506qtd.26.1590052381012;
        Thu, 21 May 2020 02:13:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590052381; cv=none;
        d=google.com; s=arc-20160816;
        b=S87E5PrQ1elarJIwLZT4ZLf4FaQV9Kiz58QV3exL08IvBAxZw3TftqFbntcLwq1aTA
         wmW065wbLiGJgYCKKCpfKivpZ9UBREQwYzcCE+HiKscBWOExilyIIBvszyLooaAprFOx
         vSmBrsrpZ3O7hx6EC5lmqlt2vTGrodAEzGg//qO3JsSybmKBDAHRqOgFUFZ/zQvbcbGD
         RrMtNLCqewc+Oxw5bcqk7croTSjcoersKCxPL+Iuaqeo37Dpch5Z9I0Ecr8YxlRoRYmf
         +E/61P38Em4vwqt8iGYvt7NDhgj6GKGZdV6KoBsVVzfNJKaC16GJB70zUYKD0ix0zBVP
         bNNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vOZcCyG6+q6mpWKybdwSRlg7xtE0dYIf0cnK+vy6ob4=;
        b=meOIiwIMmmGNyS174eADAXsoBgkP0cDvguf82Q9aDhe1NJfmQBC4t8PunrivlFPYR6
         +6d1qEV6xcVuO1gv3J1/0tHbtyfq4FWvBqzKisEGN0gkMfi3sJ5pwq66Rbxph0WYRIOQ
         HrpEEIgrUuntccSgCIW2K8e44qsOXCuMCvcrvHpwBoACE4ltnfJwA8NgavxTgxqEtJ7j
         xd8u1noWooqr7MmHtVDSXGKpm/KA/odkgLZMkrXldEBw88InvzMfo/cUlrH8qQk5KUEh
         wD392gcLqP5te5IdGfw0YYS6lgLf3zXl29f9YCU6DAj+F603YaSm3dwBxyCa/1990x1d
         8Xcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OX74XLME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c20si649463qtd.323.2020.05.21.02.13.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 02:13:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OX74XLME;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbhG8-00077C-FA
	for alex.bennee@linaro.org; Thu, 21 May 2020 05:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhEg-00045o-18
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:11:30 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:39472
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jbhEe-0005JG-Cy
 for qemu-arm@nongnu.org; Thu, 21 May 2020 05:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590052286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vOZcCyG6+q6mpWKybdwSRlg7xtE0dYIf0cnK+vy6ob4=;
 b=OX74XLME8iE6SeGImaVKdWfBMNARFy+6qYEJ8al3+zm+VjaROd/edWf6sViV6tdBZXR7ok
 /fKWV0aVTOFHcqX0Shm/bE9LlFhuqed36MtFkARqsu+o0gHlH3EAXq+FpV8Xo5EHjly1zn
 J34BrBe+GJer792+DFcRh3CSdmiU0Rk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-j6PeE6uPO5-NVxXYpvdLMw-1; Thu, 21 May 2020 05:11:23 -0400
X-MC-Unique: j6PeE6uPO5-NVxXYpvdLMw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5226C8005AA;
 Thu, 21 May 2020 09:11:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 296905D9E4;
 Thu, 21 May 2020 09:11:02 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH 0/9] SMMUv3.2 Range-based TLB Invalidation Support
Date: Thu, 21 May 2020 11:10:50 +0200
Message-Id: <20200521091059.9453-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 04:44:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: alwb4JhsOCq9

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

patches [1, 3] are cleanup patches.
patches [4, 6] changes the implementation of the VSMMUV3 IOTLB
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
branch: v5.0.0-smmuv3-ril-v1

References:
[1] [RFC v2 4/4] iommu/arm-smmu-v3: add CMD_TLBI_NH_VA_AM command
for iova range invalidation
(https://lists.linuxfoundation.org/pipermail/iommu/2017-August/023679.html

[2] 5.7+ kernels featuring
6a481a95d4c1 iommu/arm-smmu-v3: Add SMMUv3.2 range invalidation support

Eric Auger (9):
  hw/arm/smmu-common: Factorize some code in smmu_ptw_64()
  hw/arm/smmu-common: Add IOTLB helpers
  hw/arm/smmu: Simplify the IOTLB key format
  hw/arm/smmu: Introduce SMMUTLBEntry for PTW and IOTLB value
  hw/arm/smmuv3: Store the starting level in SMMUTransTableInfo
  hw/arm/smmu-common: Manage IOTLB block entries
  hw/arm/smmuv3: Introduce smmuv3_s1_range_inval() helper
  hw/arm/smmuv3: Get prepared for range invalidation
  hw/arm/smmuv3: Advertise SMMUv3.2 range invalidation

 hw/arm/smmu-internal.h       |  14 +++
 hw/arm/smmuv3-internal.h     |   5 +
 include/hw/arm/smmu-common.h |  24 ++--
 hw/arm/smmu-common.c         | 205 +++++++++++++++++++++++------------
 hw/arm/smmuv3.c              | 142 ++++++++++++------------
 hw/arm/trace-events          |  12 +-
 6 files changed, 246 insertions(+), 156 deletions(-)

-- 
2.20.1

