Received: by 10.25.227.6 with SMTP id a6csp73076lfh;
        Sat, 1 Jul 2017 09:47:33 -0700 (PDT)
X-Received: by 10.55.101.206 with SMTP id z197mr32574815qkb.207.1498927652903;
        Sat, 01 Jul 2017 09:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498927652; cv=none;
        d=google.com; s=arc-20160816;
        b=Wfhuc2DmarQogygZ5vGnMLv01PWfHNzbde8zklYO/UZShOe0eWRWfmSD3oUv8Qz9oc
         88jTYcLZE3NkglkD/xVUHPXifMmpzAP1MqzaLgeFQWQ0rxhxvEcsKHb2mUnw/RiLaJMA
         FQ0ChW3FtfLM3uDAGq0FEMVep3BtXFTs0U4at+09z2vgr3ey4gevOzFhjpcIfzWP9q/+
         TMsTXSOiHC0cZHat+Uf0O7GkcpzzfPD5zr6sw7aiyRREQJ5HUTU0+75QXFfHwtKBLROK
         rSnKPxAF4TIqn4xMHyHQP0gvMs/Wvi+YtRHlU2tlAF1/Q3Bj4wK/KwqjdtvuYL/mQIsy
         dy1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=gBJIupRgsvJyg0ItZrNhFqGVGEoaea4C/2CcgUYY1oM=;
        b=0SGwXGXYww0HXcjq1cQYrP5pyWeN9//BpMLtZtgOAh3e7pMC1zy1OaJA5gV6LYhWBc
         tqlfBn8CEUvETs13Y/7wCRQ7UdUzMN+ewtE6XtNS3DZXToRS7ynPbmx+z4NHoIDkSpks
         fXqBHImUzm9v4dyeNudT4CRWtgws5w+1rKkBmdzCeX9X6VSMD8e6I7woGowCX/6SYIj+
         IzBQ8IN7PTtH8FNM2oPyJnhFsXYz57d3GTOCPplgJ3u0/U4fG2tP2z2f276cQhAfEPrv
         959sSzBnxX0coSsVTd4SkAynl2rBtlc4KdWjy6+/4LIXNwigZb8l4eMXIIxjDySkm9bq
         fD8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m25si10493887qkl.381.2017.07.01.09.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 01 Jul 2017 09:47:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55364 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dRLYQ-00084d-CN
	for alex.bennee@linaro.org; Sat, 01 Jul 2017 12:47:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52756)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYL-00083v-7l
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1dRLYI-0000PP-5J
	for qemu-arm@nongnu.org; Sat, 01 Jul 2017 12:47:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38516)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1dRLYH-0000O5-Ve; Sat, 01 Jul 2017 12:47:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55B638553D;
	Sat,  1 Jul 2017 16:47:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 55B638553D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 55B638553D
Received: from cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com
	(cav-thunderx1s-cn88xx-03.khw.lab.eng.bos.redhat.com [10.16.185.204])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B69C6863B9;
	Sat,  1 Jul 2017 16:47:18 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Sat,  1 Jul 2017 12:47:14 -0400
Message-Id: <1498927637-14496-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 01 Jul 2017 16:47:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] ARM: KVM: Enable in-kernel PMU with user
 space gic
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
Cc: peter.maydell@linaro.org, agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ATj1zoyZtlti

Andrew Jones (3):
  hw/arm/virt: add pmu interrupt state
  target/arm/kvm: split pmu init from creation
  hw/arm/virt: allow pmu instantiation with userspace irqchip

 hw/arm/virt.c        | 13 +++++++++++--
 target/arm/cpu.c     |  2 ++
 target/arm/cpu.h     |  2 ++
 target/arm/kvm.c     |  6 +++++-
 target/arm/kvm32.c   |  6 ++++++
 target/arm/kvm64.c   | 55 +++++++++++++++++++++++++---------------------------
 target/arm/kvm_arm.h |  6 ++++++
 7 files changed, 58 insertions(+), 32 deletions(-)

-- 
1.8.3.1

