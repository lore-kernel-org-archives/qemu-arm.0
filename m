Received: by 10.25.27.66 with SMTP id b63csp2667686lfb;
        Wed, 8 Jun 2016 11:25:09 -0700 (PDT)
X-Received: by 10.55.139.135 with SMTP id n129mr6353382qkd.56.1465410309103;
        Wed, 08 Jun 2016 11:25:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o106si1399556qgd.28.2016.06.08.11.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 11:25:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAiA8-0003pL-Hp
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 14:25:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAiA4-0003p6-3l
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bAi9z-0008Lf-3M
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 14:25:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bAi9y-0008La-U1; Wed, 08 Jun 2016 14:24:59 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2DF72AFF;
	Wed,  8 Jun 2016 18:24:57 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-205.brq.redhat.com [10.34.1.205])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u58IOtQl006939; Wed, 8 Jun 2016 14:24:56 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Wed,  8 Jun 2016 20:24:46 +0200
Message-Id: <1465410291-2971-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 08 Jun 2016 18:24:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/5] create the mach-virt 2.7 machine type
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HKIzSUmdHZK1

This is the first new machine type mach-virt has received
(2.6 being the first versioned machine type), so we need to
do a bit more than the average "new machine type" patch.
The first four patches prepare for easy-adding of machine
types. The last patch adds the 2.7 type.


Andrew Jones (5):
  hw/arm/virt: separate versioned type-init code
  hw/arm/virt: set is_default
  hw/arm/virt: introduce DEFINE_VIRT_MACHINE
  hw/arm/virt: introduce DEFINE_VIRT_MACHINE_AS_LATEST
  hw/arm/virt: create the 2.7 machine type

 hw/arm/virt.c | 66 ++++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 16 deletions(-)

-- 
2.4.11

