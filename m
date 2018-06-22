Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp529650wrq;
        Fri, 22 Jun 2018 00:45:23 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeaPZ1pOdjoxmL0LyCv1syW6T2priYE+DwGHCpxGyypwMHTdPR6l3QlA8OdoNdBkQgbENCb
X-Received: by 2002:a0c:9427:: with SMTP id h36-v6mr440973qvh.22.1529653523452;
        Fri, 22 Jun 2018 00:45:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529653523; cv=none;
        d=google.com; s=arc-20160816;
        b=Aj4omm8WAZHutMiffeYy/WFiIzV1uatPnvgqSGSnL1hS8e8P3aYyPAn5rH+jnVBv5C
         lvfDU9nXlFl9QJpW0NdmG7GL8V6IdqWD35zN1qJo+cIIZ6HM7vcrv6Z65FqnSP2pVF/B
         xOW5Q5Q6mOPZBpYm6Sa4T9GHgFm4pzvppG3Ip1O8RD2f64Vk+3dVp9JYKrzjyZsprKgq
         pSdoG7nlkktum/Pi9h7KgIrSE4UHB3biGGHo1pk8JdkE/Fi0He2M7J4TXBIgU82w1m+c
         HgBodCvkKCl8ke3r3QVdpkEO5UeON/L/z4fRfHj0Z+Lr/0TO3K4mlU3KQFai0bgO8D3J
         7P+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=03I/AV/B+N/wWuu/oENffl0p72E0LinQWvE+fsYuYFg=;
        b=lpS9WWLbi3smmhuuvIVVSf151DYbpYgm20a9PY7x+J1maPoek8OnMuAI+6Mem5N3GF
         V+Cz1XBx3x4O53uirZLxg1qZXnzd4POrTKmpesptPDi2gEFqof/hk8e/mGpt1uBzhH5+
         z4puOrq/u9fvFyaVNw0uEt0/rHsXkdLhm4hvl231jEEY5hGDmOWBnWRdTuBy1l0o5nX3
         b2AquYNQ8nRqUyaS/vvJWnliIClgM2JegFf9VZCj+O9pKgfhwz7B5IBNYvFE2fpoNbRI
         c/wwi5d2IzH+czpUtwvZ7FT2W/NYdi5k7SrjNHK2A9hwKBJfChqSB0Z/1leYc4zdLQi3
         sOyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m123-v6si1436697qkc.165.2018.06.22.00.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 00:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59844 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWGl0-0000yM-TL
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 03:45:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWGkp-0000ua-PK
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWGkl-0008Vr-Km
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 03:45:11 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46762 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWGkl-0008VU-GH; Fri, 22 Jun 2018 03:45:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0F7B123B67;
	Fri, 22 Jun 2018 07:45:06 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A60682026D6B;
	Fri, 22 Jun 2018 07:45:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, jia.he@hxt-semitech.com,
	hejianet@gmail.com
Date: Fri, 22 Jun 2018 09:44:57 +0200
Message-Id: <1529653501-15358-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 22 Jun 2018 07:45:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 22 Jun 2018 07:45:07 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 0/4] ARM SMMUv3: IOTLB Emulation and VHOST
 Support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W6joqQ/dziPW

This series brings translation configuration caching and IOTLB
emulation.  The last patch implements VHOST integration and
allows to run VSMMUv3 along with VHOST emulated end points.

The first patch fixes the passthrough mode bug reported by Jia.
It reworks the translate function and this series needed to be
rebased on it.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v4
Previous version at:
https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v3

History:

v3 -> v4:
- (new == IOMMU_NOTIFIER_MAP) replaced by (new & IOMMU_NOTIFIER_MAP)
  in smmuv3_notify_flag_changed

v2 -> v3:
- collected Peter's R-b
- do not use float in trace points anymore

v1 -> v2:
- addition of the 1st patch (including addr_mask fix)
- addition of the per device mutex as on intel iommu

v1: [1] v12 last 3 patches resent in this series
[1] [PATCH v12 00/17] ARM SMMUv3 Emulation Support
https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg04344.html

Eric Auger (3):
  hw/arm/smmuv3: Cache/invalidate config data
  hw/arm/smmuv3: IOTLB emulation
  hw/arm/smmuv3: Add notifications on invalidation

Jia He (1):
  hw/arm/smmuv3: Fix translate error handling

 hw/arm/smmu-common.c         | 118 +++++++++++-
 hw/arm/smmuv3-internal.h     |  12 +-
 hw/arm/smmuv3.c              | 420 +++++++++++++++++++++++++++++++++++++++----
 hw/arm/trace-events          |  27 ++-
 include/hw/arm/smmu-common.h |  24 +++
 include/hw/arm/smmuv3.h      |   1 +
 6 files changed, 558 insertions(+), 44 deletions(-)

-- 
2.5.5

