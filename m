Received: by 10.25.77.65 with SMTP id a62csp308554lfb;
        Fri, 17 Feb 2017 10:56:50 -0800 (PST)
X-Received: by 10.200.57.75 with SMTP id t11mr9461079qtb.274.1487357810341;
        Fri, 17 Feb 2017 10:56:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v15si8073612qtb.3.2017.02.17.10.56.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 10:56:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ceni5-00039T-Ox
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 13:56:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cenhz-00039H-Ve
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:56:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cenhw-0007QH-Uy
	for qemu-arm@nongnu.org; Fri, 17 Feb 2017 13:56:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46774)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cenhw-0007Q0-OU; Fri, 17 Feb 2017 13:56:40 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 803553D97F;
	Fri, 17 Feb 2017 18:56:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1HIubLK022004; Fri, 17 Feb 2017 13:56:38 -0500
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 17 Feb 2017 19:56:32 +0100
Message-Id: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 17 Feb 2017 18:56:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC 0/3] generalize parsing of cpu_model
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ndGtNv33FGuI


Some callers call CPUClass->parse_features manually to convert
'-cpu cpufoo,featurestr' string to cpu type and featurestr
into a set of global properties. And theni do controlled
cpu creation with setting properties and completing it with realize.
That's a lot of code duplication as they are practically
reimplement the same parsing logic.

Some don't and use cpu_generic_init() instead which does
the same parsing along with creation/realizing cpu within one
wrapper.

And some trying to switch to controlled cpu creation,
implement object_new()/set properties/realize steps
but forget feature parsing logic witch lieads to 'bugs'
commit 00909b585 (hw/arm/integratorcp: Support specifying features via -cpu)


This series moves -cpu option parsing to generic machine code
that removes a little of code duplication and makes cpus creation
process more unified.

PS:
As I don't have time to rewrite this part QEMU, being busy
rewritting yet another part of QEMU,
SERIES IS UNFINISHED AND SERVERS TO SHOW IDEA HOW IT SHOULD
BE DONE. FEEL FREE TO PICK UP AND COMPLETE THIS PATCHES
TO HANDLE ALL BOARDS (series does it only for virt-arm/spapr/pc)

It compiles and pc machine even starts but otherwise is untested.

CC: Eduardo Habkost <ehabkost@redhat.com>
CC: patches@linaro.org
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Marcel Apfelbaum <marcel@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: "Michael S. Tsirkin" <mst@redhat.com>

Igor Mammedov (3):
  machine: call machine init from wrapper
  machine: generalize handling of default cpu_model
  machine: generilize cpu_model parsing

 include/hw/boards.h  |  5 +++++
 include/hw/ppc/ppc.h |  2 --
 hw/arm/virt.c        | 46 ++++++++++---------------------------------
 hw/core/machine.c    | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/i386/pc.c         | 42 +++++++++++++--------------------------
 hw/ppc/ppc.c         | 25 ------------------------
 hw/ppc/spapr.c       | 14 +++++++------
 vl.c                 |  2 +-
 8 files changed, 92 insertions(+), 99 deletions(-)

-- 
2.7.4

