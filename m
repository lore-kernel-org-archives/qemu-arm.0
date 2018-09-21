Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2788435wrd;
        Fri, 21 Sep 2018 00:02:02 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYbUp8WZdALKEY0pgiZhOsFG3SDXdG1K3l6mjRrlL68YoDxDkmnlhh8LojEz5vSDIF7CIpd
X-Received: by 2002:ac8:179c:: with SMTP id o28-v6mr30878760qtj.98.1537513322069;
        Fri, 21 Sep 2018 00:02:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537513322; cv=none;
        d=google.com; s=arc-20160816;
        b=Y4WGeYIImO89Q2VQ7cxuDVSIjhVWgV4ugSjVNA4ARhCM3OJnMblzGbhFA/7gUxajPp
         gUfx9K3pc93mLdx3RxMZCahlrgqXeJgkFkyF4Fl8W6AoFujZ2sgCQDjlHUMMQbmc/NoD
         qGuT9uvscVIMsHj7hxuhtnHniyed4SSxuL+iQ1UUamtbM5k65v07Pipm4U+ZmSkbHCiR
         UBHR39O/kUd9h3PxBOB9FA/tn1u17W+MwA8L/wLX4oPIvoLrfocmaSIu/9RJqazWHIgA
         GF4A+FweMCdDKYrKyiMyoBrSayeHfzLtPEupNRIn91V0F2olBfXlK8hDzX10mbzHqrml
         vg4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=Bd7LrASVu1nRfDxNS36OVPj9gkOQPWT/D0KDZgkCdEE=;
        b=hmgR7YD6jIpaeXxoPVqGdmS5CKygAu0jFvwlZlf/9SDpkiHuyWbfJ4c8fSpi5ZjRIU
         eoVpLNbwlVY71iYcWlssug+8me5pfW3Wu8fGAMnwPwAECCpAWRwW/L1meO6reen7JhxH
         nJZHDr1lvWQa+Pmqw0rwNspHPXv1W3Xo2c5Q1F3CbWi90NcmCCcD8GjrjkQf4/zaZ+ro
         WOeqtYoNxR+6M+WzpgFU8yiowUI8VA7342GB4384po1aw8z3j2LfZh480FnMag+XH1Qr
         sS5GaJE5Wf7aPihqed1IkfmGh4znAp3PUodyPOM/+UHtWyZY6W1QhzgLnihG6rRDim6w
         joFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11-v6si6143792qku.305.2018.09.21.00.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Sep 2018 00:02:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g3FRx-0002Pt-GD
	for alex.bennee@linaro.org; Fri, 21 Sep 2018 03:02:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3FRm-0002Om-Ud
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 03:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g3FRj-0005QU-OQ
	for qemu-arm@nongnu.org; Fri, 21 Sep 2018 03:01:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55200)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g3FRj-0005Lg-HL; Fri, 21 Sep 2018 03:01:47 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com
	[10.5.11.25])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C01375C9;
	Fri, 21 Sep 2018 07:01:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-87.ams2.redhat.com [10.36.117.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE2D12015AD1;
	Fri, 21 Sep 2018 07:01:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Fri, 21 Sep 2018 09:01:36 +0200
Message-Id: <20180921070138.10114-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.25
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 21 Sep 2018 07:01:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/2] ARM SMMUv3: Fix event queue handling and
 memory region names
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
X-TUID: uX+aCti4CPDy

This series fixes the event queue handling: the events were incorrectly
recorded and the interrupt was not sent as expected.

Also we fix the IOMMU memory region names. This last issue is minor as
names only are used for debug/tracing. However it can be confusing.

Best Regards

Eric

Eric Auger (2):
  hw/arm/smmu-common: Fix the name of the iommu memory regions
  hw/arm/smmuv3: fix eventq recording and IRQ triggerring

 hw/arm/smmu-common.c     |  6 +++---
 hw/arm/smmuv3-internal.h | 26 +++++++++++++-------------
 hw/arm/smmuv3.c          |  2 +-
 3 files changed, 17 insertions(+), 17 deletions(-)

-- 
2.17.1

