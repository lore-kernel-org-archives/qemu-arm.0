Received: by 10.223.173.229 with SMTP id w92csp1972454wrc;
        Mon, 23 Oct 2017 08:36:14 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RSmrKnU4PYM+HzL1X00AW79Ra4l1If9rl2B7nlkt3icZs34KfyRwg4VYpSJL9H2A3TDnuR
X-Received: by 10.200.53.111 with SMTP id z44mr21082831qtb.12.1508772974673;
        Mon, 23 Oct 2017 08:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508772974; cv=none;
        d=google.com; s=arc-20160816;
        b=VTBw5gywn3SKtEGi+Rrp+9ZJEloP8gqLZnySSPTvDbVh3dkrgnJM78EOIrrwkYVlv1
         fOALnMU2fKN3+oj7gN3g5AKZLzckrgVlta9fUk79HjBBuJPagYjbxLFxE7TtIAWJTmeI
         PIKpEEzo9YrZ4jpBcgi1F7KKeTGFSHJsVmqZVj3UcoDbAQ9gcIYQ8ak2H67rVhqtxpa+
         IabGT217s5NGHQvv7QWM7Ag2I90BGALWG1mrSrDarC2cddV406kL0N8j+FwKDKA159l1
         MfuKN3pDBSdH1J0bZxTeARPcMazGe3/K9NecOkrO1sRaVFlFYxryxE4uprcOip/HNIxa
         uuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=z4F7nrUggvejtsGgQ4so3To/fWROFUR19SGT3pckfqo=;
        b=L4Z7HqyldJBDzrpRDyy9DouzEo04WuCgqibwncJqBBP526opF18Vfjsw2juOPAYDeH
         2xTmHl25yReXVxRFCLvA5YUvTI4GI6sEzgDJwcdT1n9k7NEB72OKUrP6hcnvCvauqq56
         eaqslvCGtOrPUVlO4x4zq1EisCqvnV4wXMX1v8DPyQfq8ud2AHZGGAVJYQSCuz02EQ1A
         5R8b0j5k90KZuv2AzcPCucxVpySRaAs9KD1V0M8EBcwOwod7MNSuggbYJ78xVO2sA5J5
         lxrXCXMyHkqO7efWXZdijjYu9kLQE+lhXtJ42laJMn0LljFbraSD4OXK/5IWVroEMLj3
         yKNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w5si863031qtj.142.2017.10.23.08.36.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Oct 2017 08:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6elv-0002dE-U0
	for alex.bennee@linaro.org; Mon, 23 Oct 2017 11:36:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6elk-0002cf-6m
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e6elh-0004h3-3X
	for qemu-arm@nongnu.org; Mon, 23 Oct 2017 11:36:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50964)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e6elg-0004gq-Tk; Mon, 23 Oct 2017 11:35:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D5B761D1F;
	Mon, 23 Oct 2017 15:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3D5B761D1F
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-117-27.ams2.redhat.com
	[10.36.117.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 68134795B4;
	Mon, 23 Oct 2017 15:35:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Mon, 23 Oct 2017 17:35:33 +0200
Message-Id: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 23 Oct 2017 15:35:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v2 0/4] vITS Reset
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, wu.wubin@huawei.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GQNTJMNuwJnA

At the moment the ITS is not properly reset. On System reset or
reboot, previous ITS register values and caches are left
unchanged. Some of the registers might point to some guest RAM
tables which are not valid anymore. This leads to state
inconsistencies that are detected by the kernel save/restore
code. And eventually this may cause qemu abort.

The two first patches would need to be cc'ed stable. Assuming
patches 1-5 of "[PATCH v5 00/10] vITS Migration fixes and reset" 
 also are cc'ed stable, they fix the above issue, without 
implementing a dedicated ITS KVM device reset IOCTL.
Patches 3-4 use the new reset IOCTL which clarifies the reset
process.

The series is in RFC state as it depends on:
[1] [PATCH v5 00/10] vITS Migration fixes and reset

Best Regards

Eric

The series is available at:
https://github.com/eauger/qemu/tree/v2.10-its-reset-v2

History:
v1 -> v2:
- Clarify why abort should be removed for save. Leave abort
  for restore.
- Adopt the same reset infra as vgic
- introduce "hw/intc/arm_gicv3_its: Implement a minimalist reset"
  which perform individual register writes. This is sufficient to
  fix the issues without ioctl

Eric Auger (4):
  hw/intc/arm_gicv3_its: Don't abort on table save failure
  hw/intc/arm_gicv3_its: Implement a minimalist reset
  linux-headers: Partial header update for ITS reset
  hw/intc/arm_gicv3_its: Implement full reset

 hw/intc/arm_gicv3_its_kvm.c   | 53 +++++++++++++++++++++++++++++++++++++------
 linux-headers/asm-arm/kvm.h   |  1 +
 linux-headers/asm-arm64/kvm.h |  1 +
 3 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.5.5

