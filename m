Received: by 10.25.208.211 with SMTP id h202csp1392922lfg;
        Mon, 22 Feb 2016 13:08:48 -0800 (PST)
X-Received: by 10.140.94.176 with SMTP id g45mr36965739qge.59.1456175328113;
        Mon, 22 Feb 2016 13:08:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f89si20255568qga.111.2016.02.22.13.08.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:08:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxip-0001jr-Fe
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:08:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aXxgs-0006gj-K6
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1aXxgr-0004S7-S7
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 16:06:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46190)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>)
	id 1aXxgn-0004QP-L0; Mon, 22 Feb 2016 16:06:41 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id BD56C8E3CC;
	Mon, 22 Feb 2016 21:06:40 +0000 (UTC)
Received: from apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com
	(apm-mustang-ev3-33.khw.lab.eng.bos.redhat.com [10.16.184.127])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1ML6dUT015881; Mon, 22 Feb 2016 16:06:40 -0500
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 16:06:36 -0500
Message-Id: <1456175198-25210-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	qemu-arm@nongnu.org, abologna@redhat.com
Subject: [Qemu-devel] [PATCH RFC 0/2] Versioning ARM virt machine types
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XzhbDnS6ChCX

We start to see more features been added to ARM virtual machine models.
For the purpose of backward compatibility (e.g. migration), it is time
to consider versioning machine types for ARM VMs. As a beginning step, this
patchset defines an abstract machine type for ARM VMs. The current
"virt" machine is re-written based on this new machine type accordingly.
These patches have been verified by booting existing VMs.

Note that I am seeking inputs from the community by putting RFC in the
subject line. Please let me know your opinions. I will send out V1
afterwards.

Thanks,
-Wei

Wei Huang (2):
  arm: virt: Add an abstract ARM virt machine type
  arm: virt: Move machine class init code to the abstract machine type

 hw/arm/virt.c | 60 +++++++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 20 deletions(-)

-- 
1.8.3.1

