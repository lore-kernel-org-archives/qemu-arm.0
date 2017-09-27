Received: by 10.223.172.38 with SMTP id v35csp4798531wrc;
        Wed, 27 Sep 2017 07:57:21 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCuhFySlSFb7J/vUsdR0pRwHyy7kDuZNeltzt4ZifDXP+71IVEm5PHQw2sRuYrGeuKNcrFo
X-Received: by 10.237.34.24 with SMTP id n24mr2162598qtc.218.1506524241239;
        Wed, 27 Sep 2017 07:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506524241; cv=none;
        d=google.com; s=arc-20160816;
        b=g4GCoI9R/VhzOMY3x5MoNuGr93a2GB6LLfcO0/8Q03amI0NaQB+OlrzZH+CBKseQg7
         V1GZ6hNVckChV9YkuWIOglW15cJ3lxPOo2aQRLbETwXN6bKtmkIdKdicCOkGAkzauyco
         F5wGfk7rKoAHGsb4l+WWi3WCaMPRkvs4QOWCAMRDxSwp8nXzKfanzJ66gRoxz/0QfAfC
         TP+FvKaw0MX5Gb9T6D/PIjSITN9BXyG32Ym+qFbFixy5PJyqpL/WRLkHB+pyDwePsrLv
         s2xuaMP4o/AjlKncA8B+y2soX/UK7LXpBiLVAu6q6DsmnfLolkdzNsVBu5dc21eGMhqU
         WuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=uASmordp2GPtK+y4LkLj51UcUU+pkcv5VA1YCBkAeKk=;
        b=BD4bXz78aNLS5pmUd+gAh1lciG8uWlRx71SH7i+CImJ64CJB+TL7hSyBI4rEJONiUF
         JaSv4LtkIh3oFqBjANrRFFDN4WdHkSfdrfL3qonJuc2G8F8qwhULa3m0qNK0pZXXp/gb
         pIVJ/BkN9JHO7edeHGnp+PQWARmHPkiJBgvd6qx0fiTzYbOg5yEwVG4ExVzaM7m363wZ
         +Cedi4ewBmpTHsZc9Nr93XjdVRREp/O0b9coYBqOOJiJOyAIqsGZJRS3MNPYWUsOQZ9U
         xGev0t4hvyfH2trQZkPk0NHzsIDOpdXMs8t507gsvwJSqMTSQIM+x2Dvcp8K9C8yq/UN
         NxDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d50si820738qtk.314.2017.09.27.07.57.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Sep 2017 07:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55146 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxDm3-0000Sd-0X
	for alex.bennee@linaro.org; Wed, 27 Sep 2017 10:57:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56574)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDlo-0000RV-LW
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:57:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxDll-0001TU-Gk
	for qemu-arm@nongnu.org; Wed, 27 Sep 2017 10:57:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxDll-0001Sw-Az; Wed, 27 Sep 2017 10:57:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 264D121733;
	Wed, 27 Sep 2017 14:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 264D121733
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain.com (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E0F894C6D;
	Wed, 27 Sep 2017 14:56:53 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, wanghaibin.wang@huawei.com
Date: Wed, 27 Sep 2017 16:56:42 +0200
Message-Id: <1506524205-20763-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 27 Sep 2017 14:57:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 0/3] vITS Reset
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
X-TUID: sdFseJv+Fo8g

At the moment the ITS is not properly reset. On System reset or
reboot, previous ITS register values and caches are left
unchanged. Some of the registers might point to some guest RAM
tables which are not provisionned. This leads to state
inconsistencies that are detected by the kernel save/restore
code. And eventually this may cause qemu abort on source or
destination.

The 1st patch, suggested to be cc'ed stable proposes to remove
the abort in case of table save/restore failure. This is
definitively not ideal but looks the most reasonable until we
get a proper way to reset the ITS. Still a message is emitted
to report the save/restore did not happen correctly.

Subsequent patches add the support of explicit reset using
a new kvm device group/attribute combo. The associated kernel
series is not upstream [1], hence the RFC.

ITS specification is not very clear about reset. There is no
reset wire. Some register fields are documented to have
architecturally defined reset values and we use those here:
Most importantly the Valid bit of GITS_CBASER and GITS_BASER
are cleared and the GITS_CTLR.Enabled bit is cleared as well.

Best Regards

Eric

Host Kernel dependencies:
- [1] [PATCH 0/10 v2] vITS Migration fixes and reset

The series is available at:
https://github.com/eauger/qemu/tree/v2.10-its-reset-v1


Eric Auger (3):
  hw/intc/arm_gicv3_its: Don't abort on table save/restore
  linux-headers: Partial header update for ITS reset
  hw/intc/arm_gicv3_its: Implement reset

 hw/intc/arm_gicv3_its_common.c         |  5 ++---
 hw/intc/arm_gicv3_its_kvm.c            | 37 ++++++++++++++++++++++++----------
 include/hw/intc/arm_gicv3_its_common.h |  1 +
 linux-headers/asm-arm/kvm.h            |  1 +
 linux-headers/asm-arm64/kvm.h          |  1 +
 5 files changed, 31 insertions(+), 14 deletions(-)

-- 
2.5.5

