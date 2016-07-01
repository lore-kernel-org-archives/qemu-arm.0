Received: by 10.25.21.96 with SMTP id l93csp281207lfi;
        Fri, 1 Jul 2016 06:04:14 -0700 (PDT)
X-Received: by 10.13.206.71 with SMTP id q68mr984502ywd.26.1467378254879;
        Fri, 01 Jul 2016 06:04:14 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k76si2300684qkh.258.2016.07.01.06.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 06:04:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIy7C-0007k5-AH
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 09:04:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bIy5T-0006oY-T8
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 09:02:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bIy5R-000514-PT
	for qemu-devel@nongnu.org; Fri, 01 Jul 2016 09:02:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bIy5H-0004wE-PL; Fri, 01 Jul 2016 09:02:15 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34DEC19D053;
	Fri,  1 Jul 2016 13:02:15 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-139.brq.redhat.com [10.34.1.139])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u61D2DDB023420; Fri, 1 Jul 2016 09:02:14 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Fri,  1 Jul 2016 15:02:07 +0200
Message-Id: <1467378129-23302-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 01 Jul 2016 13:02:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] hw/arm/virt: tcg: adjust MPIDR
 almost-like KVM
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BmBQJx+11Al9

In some ways this v2 is more of an RFC then the initial posting, which
had a different subject, and is here [*]. In this version we point out
the real [current] goal, which is to get the guest MPIDR consistent
with KVM. However, what's debatable is we purposefully neglect 32-bit
consistency, as KVM likely needs to be changed, but will likely not
be changed until it gains gicv3 support. Also, potentially debatable,
is how keeping the 2.6 machine type compatible is approached. I think
it's right, and likely the pattern we should use going forward for
similar changes, but, hey, a patch is always a good conversation
starter... Way better than most centerpieces anyway :-)

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg380246.html


Andrew Jones (2):
  gic: provide defines for v2/v3 targetlist sizes
  hw/arm/virt: tcg: adjust MPIDR like KVM

 hw/arm/virt.c                      | 26 +++++++++++++++++++++++++-
 include/hw/intc/arm_gic.h          |  3 +++
 include/hw/intc/arm_gicv3_common.h |  3 +++
 3 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.7.4

