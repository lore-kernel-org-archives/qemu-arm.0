Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp834809lfm;
        Wed, 8 Jul 2020 15:38:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+iwGAI+b4TKp2+VqKJB3nbz8ZXshUYsEZLrkJQBCDYamESJwvD1RwISMNf4xK/t1frkUE
X-Received: by 2002:a25:684d:: with SMTP id d74mr40654310ybc.188.1594247911619;
        Wed, 08 Jul 2020 15:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594247911; cv=none;
        d=google.com; s=arc-20160816;
        b=bYX0sV9RykLPr6tE/e9rNuQYzaqurcVhCYbir4zkBnxGJvkStxWJCGtIPCVyXhQsUn
         krf/0bqC41uqWcvMRjbT/OZ+x23Tym0HkSuXnF/zhJ4iOPyW247sC8+39ycFG5HHqV0D
         /Swvj/u15M7mFmOqzJRFkgcajRVSzlo7fiOy2OQxFeFLm8pYgmtgeuCEA0111NLIN40m
         9AazGZoyShGZ+sGb55buGtaLpuON4KM6AvH9XJUI+Cnscyqqh0mVCJmyxeeYZoSSBe+3
         6GmpFdVdc9PdD/r7ZjiIB0k1BEl5irfmneZxdUDC5ev9tlz8hYfyp0FrcEHXJn+JM3+v
         L46g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=nDcp+wzmLs0Gb0DXNaH+rPXR0aLJmEU8tgRvZl5QKCg=;
        b=RCKfNhiKldRlQFn3Qqps57LGoGLTHjp67Y5KKkPNGFYwGlUcGIospfQ18XQF0172TG
         JeGxL7tZibas2JRg65z0EIjDRy2ttyJEiubQPylVA7XrC/77Wz36FgmnZFJhhRXDnu3p
         z2GuRgkGaAquQG5+y/CCHbsxmFxciyrrJ97zzMzNxV0s4MfD99/m+EQ+GnNlpnv6wcEg
         7tEvfNur0/AZHwb1sNNHsT7BAEhSZSMlchnYXoY/rg2ya5+k35tdFg2m+NcTVoON5Mue
         avxtysDZ24J+f0mOykuMmFj6Ll+JINrRwgzNoo9g23tLQOWpODYwO4W/zEu8vjz1Und2
         42aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZefM/xwo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si880500ybo.180.2020.07.08.15.38.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 15:38:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ZefM/xwo";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtIhy-0003d8-R3
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 18:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtIRH-0001IY-N6
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 18:21:15 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57541
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jtIRF-00011K-Qt
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 18:21:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594246873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nDcp+wzmLs0Gb0DXNaH+rPXR0aLJmEU8tgRvZl5QKCg=;
 b=ZefM/xwoxIlZ/e8G7IN/wtVES3ogenHslSOvVHMd5TsVv2y8+dXMe8yyS6PKuqxDsKE2Ro
 jScLf4zoKhxEKrRTBUNotiJsWaOAEEGtBYCzzgeBFzYSJ25hFNjHiRDSIcuLOTdQ98tz5y
 VVh3jOtMxP8/NWtaJ8u40yecTIDNK8U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-Ct8XxbkLMeqlVd75Wic3jA-1; Wed, 08 Jul 2020 10:19:13 -0400
X-MC-Unique: Ct8XxbkLMeqlVd75Wic3jA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D3301005504;
 Wed,  8 Jul 2020 14:19:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-241.ams2.redhat.com [10.36.113.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 423725BAC3;
 Wed,  8 Jul 2020 14:19:00 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, peterx@redhat.com
Subject: [PATCH v3 00/11] SMMUv3.2 Range-based TLB Invalidation Support
Date: Wed,  8 Jul 2020 16:18:45 +0200
Message-Id: <20200708141856.15776-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: jean-philippe@linaro.org, robh@kernel.org, robin.murphy@arm.com,
 mst@redhat.com, zhangfei.gao@foxmail.com, shameerali.kolothum.thodi@huawei.com,
 will@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x7Tomp5a49VG

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
branch: v5.0.0-smmuv3-ril-v3

References:
[1] [RFC v2 4/4] iommu/arm-smmu-v3: add CMD_TLBI_NH_VA_AM command
for iova range invalidation
(https://lists.linuxfoundation.org/pipermail/iommu/2017-August/023679.html

[2] 5.7+ kernels featuring
6a481a95d4c1 iommu/arm-smmu-v3: Add SMMUv3.2 range invalidation support

History:

v2 -> v3:
- restore the Jenkins hash function and keep the key as a struct
- simplify the logic in smmu_hash_remove_by_asid_iova
- added HAD support
- expose AIDR (advertise v3.2 support) and fix IIDR offset

v1 -> v2:
- added "hw/arm/smmu: Introduce smmu_get_iotlb_key()"
- removed "[PATCH 5/9] hw/arm/smmuv3: Store the starting level in
  SMMUTransTableInfo"
- Collected Peter's R-b
- In this version the key still features TG/LVL.
- More details in individual history logs

Eric Auger (11):
  hw/arm/smmu-common: Factorize some code in smmu_ptw_64()
  hw/arm/smmu-common: Add IOTLB helpers
  hw/arm/smmu: Introduce smmu_get_iotlb_key()
  hw/arm/smmu: Introduce SMMUTLBEntry for PTW and IOTLB value
  hw/arm/smmu-common: Manage IOTLB block entries
  hw/arm/smmuv3: Introduce smmuv3_s1_range_inval() helper
  hw/arm/smmuv3: Get prepared for range invalidation
  hw/arm/smmuv3: Fix IIDR offset
  hw/arm/smmuv3: Let AIDR advertise SMMUv3.0 support
  hw/arm/smmuv3: Support HAD and advertise SMMUv3.1 support
  hw/arm/smmuv3: Advertise SMMUv3.2 range invalidation

 hw/arm/smmu-internal.h       |   8 ++
 hw/arm/smmuv3-internal.h     |  10 +-
 include/hw/arm/smmu-common.h |  19 +++-
 include/hw/arm/smmuv3.h      |   1 +
 hw/arm/smmu-common.c         | 211 +++++++++++++++++++++++------------
 hw/arm/smmuv3.c              | 142 +++++++++++------------
 hw/arm/trace-events          |  12 +-
 7 files changed, 255 insertions(+), 148 deletions(-)

-- 
2.21.3

