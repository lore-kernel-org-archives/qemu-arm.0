Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1858930wrq;
        Thu, 21 Jun 2018 04:17:29 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKI/H/HUo/DDScuagiEfOezNGhpdTC5Qn9T/Q52A1LA5dXgZcmzVxEdCeKIqvWfrceYEMBGr
X-Received: by 2002:a0c:8f12:: with SMTP id z18-v6mr21840153qvd.222.1529579849562;
        Thu, 21 Jun 2018 04:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529579849; cv=none;
        d=google.com; s=arc-20160816;
        b=0y/EzQw8nGEfxJ/0580kCFZMCYwGa1rjvjPNzlfDf3xEayNqIV39JaVHZrCZ7IrspM
         v23lUMvn9iKDGawafVJ2T7zHDxuoWXWcmFTIA9Ht1FmzsuGu/w5y4qTlr6PaQA+1iDGu
         Do4X1uKCqyKp/poCGUTtMxAAIxyy6jSRe82Cu1v97aA24jVlQLPOoXNjcUoIF1BOvAR0
         vFciBcJTqz5lA43EwDqgw9ILAY6FkxcgAD0Q7Srhp0gUGfZpcKmTa5IVabmI7hFIrYRR
         T97mQtfGVdaOms37C2+u+Z7xgsj4T3ukcmoICnZ2U05uKe2EWbjyfdvQSn4Aa0UaIbIb
         aRKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=xQJzm7+5m38MZ6beWvOQx28mJMver/0oXL3j42iavwU=;
        b=qxLojAg3h9PRW61tVEffkBFUQ/YZIE5TmI7wx/MEze5vG3tk90CAZbFG/en2sFP6G3
         kyAIIu90e8w/sT0rlpyT9nFNjakFI1VKjfXGWZCw2d5CPrCAC+g3rsY7dq0C66c1luW7
         oMBFvvBRS6uiKDyXtz25wtd7AC74P45aPo+VLjZlPN3iIZDAn08GudH054kuX1jg6B34
         AMxYY+muQMlfCuhFXQVdYKM9aSPfn8PBsZCLSXb09RVM/tWyDcirgIykFqBHmNczVmIC
         A3fu5HEypR5vLdSYEjyoHid81khmI9dVVJtT0JxufX9zAVcxWu3Chl/OSXsOo8SXbueJ
         Ns7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t56-v6si4420426qtj.402.2018.06.21.04.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 04:17:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVxai-0003mp-Vi
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 07:17:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVxZl-0003Lf-5M
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 07:16:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVxZg-00038w-UH
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 07:16:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36522 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVxZg-00038i-PM; Thu, 21 Jun 2018 07:16:24 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 654914022905;
	Thu, 21 Jun 2018 11:16:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4187916877;
	Thu, 21 Jun 2018 11:16:21 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, jia.he@hxt-semitech.com,
	hejianet@gmail.com
Date: Thu, 21 Jun 2018 13:16:10 +0200
Message-Id: <1529579774-27795-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 21 Jun 2018 11:16:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 21 Jun 2018 11:16:24 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 0/4] ARM SMMUv3: IOTLB Emulation and VHOST
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
X-TUID: FDeXPYME2nKb

This series brings translation configuration caching and IOTLB
emulation. The last patch implements VHOST integration and
allows to run VSMMUv3 along with VHOST emulated end points.

The first patch fixes the passthrough mode bug reported by Jia.
It reworks the translate function and this series needed to be
rebased on it.

Best Regards

Eric

This series can be found at:
v1: https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v3
Previous version at:
v1: https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v2

History:
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

