Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1180787wme;
        Wed, 16 May 2018 07:27:49 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrCfAlJtDhJQaSKR6NZIHTAB7A5XPUnd86X7RlBWwcK/P1b6uuAJ+eHxX+k8FkTOETuP0w5
X-Received: by 2002:a37:3612:: with SMTP id d18-v6mr1131588qka.86.1526480869081;
        Wed, 16 May 2018 07:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526480869; cv=none;
        d=google.com; s=arc-20160816;
        b=vhDM1hi6LOAupu/Y+kAXwHi4OrLzjNesCtWRdYvLzuuKv7xGqT4VARO4JBHQYYvGVB
         TbA7zSJe3v2znuoknQGoZrimYrtp9aQTBoG9Csv/wGbjmzwQ0+iE9Kui5sZ0l94PtTn6
         Cig6mK/S4HJCcUBn/G50m/caUrg2rR0++fh8bKUW9+woiuOkKDtcEYGHYlorvHbz+BVG
         15kdmtCX6lwow8R2xE+tflo6aAa11DKj40Tp9TeMYgkWBkn9XCkwRtxpfT/ZDe0wy7dH
         7hOteaw6OzJn09XG2Lf+GFyrBfNfQYMumFxFBwMJJTtx7uV5R8D4ZktNx3JGej6fbaWs
         yU2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=r2T+6B0XymdsNSwewusLaKf23F8AGeFi6uERmwKYqUU=;
        b=H41kx1EQ3WzGF/sPdqQZE3DeCqFOAXe6x76v3PH0h0Q75XPx354lKh9lNO8KWVX6LK
         jIXQjl43MRyKUMN21C+izOiGpdreY/W82WUQoL/Bsl4sgWJlvsBdsUGQ1utd3rS9gYJK
         esL7wnwm7O4c64LqS1Ap5OW1KxUCExtuPhzMD6y9kPsu3r8wF/2qH/b/5fOJ+NKE1ULf
         7mFHeLBOrv2iw3GDhA5hNqCYh+SG9b2Crs1dRK7NawZQgN5EU97NaCyELrKNBE+JDe1I
         knGSToJpZrw8cZS+cUkero9BXDP458wiyoqrzcZU829X34pbCMo97zAxOBmTdjLymxNw
         9HNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 69-v6si576153qte.139.2018.05.16.07.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 07:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48872 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIxPA-0002oJ-EA
	for alex.bennee@linaro.org; Wed, 16 May 2018 10:27:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIxOa-0002ls-4L
	for qemu-devel@nongnu.org; Wed, 16 May 2018 10:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fIxOY-0000QI-Uw
	for qemu-devel@nongnu.org; Wed, 16 May 2018 10:27:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51908 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fIxOU-0000Of-Ck; Wed, 16 May 2018 10:27:06 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C46F840201A3;
	Wed, 16 May 2018 14:27:05 +0000 (UTC)
Received: from dhcp19-241-177.khw3.lab.eng.bos.redhat.com
	(gigabyte-r120-16.khw3.lab.eng.bos.redhat.com [10.19.240.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B5C610AF9D2;
	Wed, 16 May 2018 14:27:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 16 May 2018 14:31:11 -0400
Message-Id: <1526495474-26394-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 16 May 2018 14:27:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 16 May 2018 14:27:05 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH 0/3] ARM SMMUv3: IOTLB Emulation and VHOST
 Support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pGu91LgizvxU

Those patches were previously included in [1]. Now that the
core implementation is upstream let's try to optimize it.

The first 2 patches implement configuration structure caching
and IOTLB emulation.

The last patch implements VHOST integration and allows to run
VSMMUv3 along with VHOST emulated end points.

Best Regards

Eric

[1] [PATCH v12 00/17] ARM SMMUv3 Emulation Support
https://lists.gnu.org/archive/html/qemu-devel/2018-04/msg04344.html

This series can be found at:
v12: https://github.com/eauger/qemu/tree/vv2.12.0-vsmmu-optim-v1
Previous version at:
v12: https://github.com/eauger/qemu/tree/v2.12.0-SMMU-v12 ([1])

History:
v1: [1] last 3 patches resent in this series

Eric Auger (3):
  hw/arm/smmuv3: Cache/invalidate config data
  hw/arm/smmuv3: IOTLB emulation
  hw/arm/smmuv3: Add notifications on invalidation

 hw/arm/smmu-common.c         | 119 +++++++++++++++-
 hw/arm/smmuv3.c              | 330 +++++++++++++++++++++++++++++++++++++++++--
 hw/arm/trace-events          |  21 +++
 include/hw/arm/smmu-common.h |  24 ++++
 4 files changed, 480 insertions(+), 14 deletions(-)

-- 
1.8.3.1

