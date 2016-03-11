Received: by 10.25.208.211 with SMTP id h202csp1146930lfg;
        Fri, 11 Mar 2016 09:36:28 -0800 (PST)
X-Received: by 10.55.49.11 with SMTP id x11mr13162881qkx.86.1457717788678;
        Fri, 11 Mar 2016 09:36:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f81si9438815qkb.82.2016.03.11.09.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Mar 2016 09:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56914 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aeQzE-0000E7-3l
	for alex.bennee@linaro.org; Fri, 11 Mar 2016 12:36:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aeQzB-0000D8-JH
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 12:36:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aeQz6-00078t-JE
	for qemu-arm@nongnu.org; Fri, 11 Mar 2016 12:36:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aeQz6-00078M-ES; Fri, 11 Mar 2016 12:36:20 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A0282CF61B;
	Fri, 11 Mar 2016 17:36:19 +0000 (UTC)
Received: from apm-mustang-ev3-05.lab.eng.rdu.redhat.com
	(apm-mustang-ev3-05.lab.eng.rdu.redhat.com [10.12.0.116])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2BHaJIg014136; Fri, 11 Mar 2016 12:36:19 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Mar 2016 12:36:16 -0500
Message-Id: <1457717778-17727-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 11 Mar 2016 17:36:19 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	abologna@redhat.com, wei@redaht.com
Subject: [Qemu-arm] [PATCH V1 0/2] Versioning ARM virt machine types
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EAQkGpBbBlbJ

We start to see more features been added to ARM virtual machine models.
For the purpose of backward compatibility (e.g. migration), it is time
to consider versioning machine types for ARM VMs. As a beginning step, this
patchset defines an abstract machine type for ARM VMs. The current
"virt" machine is re-written based on this new abstract type accordingly.
These patches have been verified by booting existing VMs.

RFC->V1:
 * Rename the machine type to "virt-2.6", matching the imminent QEMU version
 * Remove mc->is_default (Peter's comment)

Thanks,
-Wei

Wei Huang (2):
  arm: virt: Add an abstract ARM virt machine type
  arm: virt: Move machine class init code to the abstract machine type

 hw/arm/virt.c | 57 ++++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 19 deletions(-)

-- 
1.8.3.1

