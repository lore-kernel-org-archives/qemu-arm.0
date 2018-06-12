Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5015944wrq;
        Tue, 12 Jun 2018 01:09:34 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKICUNc0VIpGc/N9IT31nfeOLeiI3UXRe8ftjKDjJoDz3dcTw/lx4Ww0izqfprA9CBeTr+ZC
X-Received: by 2002:ac8:520a:: with SMTP id r10-v6mr2405518qtn.227.1528790974415;
        Tue, 12 Jun 2018 01:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528790974; cv=none;
        d=google.com; s=arc-20160816;
        b=UC884HUL940jMB8RBX4zHyheedqDz9SIGZs/2+GMgTghqRkocZ4+30JwM8fYaNNWPz
         sPvLWajWP4LYQQfv4ZVoMcQXiGq+HdNvsLWXNuff9U1aP7p6HNiJG7RIetMIdDkUAQir
         rpd8dv9z8RjiQ/ERJRyo5gmrU/pFjXZm1/EGbwavfmBtJ3HBmwkA8C0sK6n/rrh5P++x
         7KpWQ+SnWy8JmEpVbBVp30Xa8DA+trrt7qBT9gVxnAk4Q0MF/+rpPPwOhTiPK9VuZ51y
         w1TCT1Rm+GrNEU5we7CHhnkrcRlY1vCKq2NRo4+U64Ek5aoHvwmqN97Lrb5o3zNHg/Eb
         ocKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=Pozt+YwWJZ6c7m5qyPxOAXxB/ok8zu7RoiYt5VT/kh4=;
        b=hVWcPGPK6tv22pkLvJAZKjc9r9dNSSDcNssDsh9f0dvggL2o+E+mtJkVg7nJMMGVdB
         XNGEPiXxMyfWrk/QtLzxZl4oekHvSmopAxtY1M7y3AZcbS+ejWkGEaRRZgSy7JyAWzDD
         5NVFe3/I/QY59fhoIxQjZr3QSH/DNZwFQbi83zmvDMxBG+F8LBQt20qdJW8iBKXumyjk
         2IBLD/tkJwYk1ds5u6gLOXw+pU+sA2KvSHOMaeMEJ5UAPRaMFe2ZQZnmh/C6XXV0Aroy
         ToxI9VO3GCKJh9ramo53l9fdiAQYVtMVZT7P/ngK9yCYwyNTks21/MJ51oyDgk4wAGx1
         Zu8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a194-v6si295239qkg.205.2018.06.12.01.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jun 2018 01:09:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSeMv-0007SV-QR
	for alex.bennee@linaro.org; Tue, 12 Jun 2018 04:09:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fSeM5-0007CV-Uk
	for qemu-devel@nongnu.org; Tue, 12 Jun 2018 04:08:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fSeM5-0003gH-07
	for qemu-devel@nongnu.org; Tue, 12 Jun 2018 04:08:41 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41450 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fSeLz-0003c8-FR; Tue, 12 Jun 2018 04:08:35 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AF8A84256;
	Tue, 12 Jun 2018 08:08:34 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E05242035721;
	Tue, 12 Jun 2018 08:08:32 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org, jia.he@hxt-semitech.com,
	hejianet@gmail.com
Date: Tue, 12 Jun 2018 10:08:24 +0200
Message-Id: <1528790908-23441-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Tue, 12 Jun 2018 08:08:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Tue, 12 Jun 2018 08:08:34 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-devel] [PATCH v2 0/4] ARM SMMUv3: IOTLB Emulation and VHOST
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
X-TUID: oXWEJx3Dbpcl

This series brings translation configuration caching and IOTLB
emulation.  The last patch implements VHOST integration and
allows to run VSMMUv3 along with VHOST emulated end points.

The first patch fixes the passthrough mode bug reported by Jia.
It reworks the translate function and this series needed to be
rebased on it.

Best Regards

Eric

This series can be found at:
v1: https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v2
Previous version at:
v1: https://github.com/eauger/qemu/tree/v2.12.0-vsmmu-optim-v1

History:
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

