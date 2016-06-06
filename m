Received: by 10.25.27.66 with SMTP id b63csp1558381lfb;
        Mon, 6 Jun 2016 08:47:49 -0700 (PDT)
X-Received: by 10.55.90.130 with SMTP id o124mr17132206qkb.178.1465228069387;
        Mon, 06 Jun 2016 08:47:49 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o131si12431188qho.15.2016.06.06.08.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Jun 2016 08:47:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43259 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b9wkm-00023I-MZ
	for alex.bennee@linaro.org; Mon, 06 Jun 2016 11:47:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46193)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH3-0000PW-HT
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b9wH2-0006wz-EN
	for qemu-devel@nongnu.org; Mon, 06 Jun 2016 11:17:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58289)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b9wGx-0006vp-6v; Mon, 06 Jun 2016 11:16:59 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2B74E7574C;
	Mon,  6 Jun 2016 15:16:58 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u56FGtmt013155; Mon, 6 Jun 2016 11:16:56 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 Jun 2016 17:16:42 +0200
Message-Id: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 06 Jun 2016 15:16:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 00/10] cpus: make "-cpu cpux,
 features" global properties
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gmMb2ou1Cw/N

Changelog:
  since RFC:
    - include "target-i386: Remove xlevel & hv-spinlocks option fixups"
    - use Eduardo's version of:
        target-i386: cpu: consolidate calls of object_property_parse...
    - fix error handling of +-feat
    - add comment why +-feat is special
    - add comment to remove +-feat static vars
    - reuse x86_cpu_class_get_model_name()

Current CLI option -cpu cpux,features serves as template
for all created cpus of type: cpux. However QEMU parses
"features" every time it creates a cpu instance and applies
them to it while doing parsing.

That doesn't work well with -device/device_add infrastructure
as it has no idea about cpu specific hooks that's used for
parsing "features".
In order to make -device/device_add utilize "-cpu features"
template convert it into a set of global properties, so that
every new CPU created will have them applied automatically.

That also allows to parse features only once, instread of
doing it for every CPU instance being created.

Git tree for testing:
  https://github.com/imammedo/qemu.git cpu_parse_into_global_props_V1 
web view:
  https://github.com/imammedo/qemu/commits/cpu_parse_into_global_props_V1

Eduardo Habkost (2):
  target-i386: Remove xlevel & hv-spinlocks option fixups
  target-i386: cpu: consolidate calls of object_property_parse() in
    x86_cpu_parse_featurestr

Igor Mammedov (8):
  target-i386: cpu: move features logic that requires CPUState to
    realize time
  target-i386: cpu: move xcc->kvm_required check to realize time
  target-i386: cpu: use cpu_generic_init() in cpu_x86_init()
  target-i386: print obsolete warnings if +-features are used
  target-sparc: cpu: use sparc_cpu_parse_features() directly
  cpu: use CPUClass->parse_features() as convertor to global properties
  arm: virt: parse cpu_model only once
  pc: parse cpu features only once

 hw/arm/virt.c      |  41 ++++-----
 hw/i386/pc.c       |  37 ++++++--
 include/qom/cpu.h  |   2 +-
 qom/cpu.c          |  29 +++---
 target-i386/cpu.c  | 252 ++++++++++++++++++++++-------------------------------
 target-i386/cpu.h  |   1 -
 target-sparc/cpu.c |   7 +-
 7 files changed, 176 insertions(+), 193 deletions(-)

-- 
1.8.3.1

