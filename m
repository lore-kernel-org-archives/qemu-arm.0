Received: by 10.25.27.66 with SMTP id b63csp272161lfb;
        Wed, 1 Jun 2016 09:41:00 -0700 (PDT)
X-Received: by 10.55.113.197 with SMTP id m188mr35822368qkc.90.1464799251668;
        Wed, 01 Jun 2016 09:40:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f128si5223142qkj.174.2016.06.01.09.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 01 Jun 2016 09:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43116 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b89CN-00080i-2Z
	for alex.bennee@linaro.org; Wed, 01 Jun 2016 12:40:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899J-0005E1-Nf
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1b899E-0007r1-OQ
	for qemu-arm@nongnu.org; Wed, 01 Jun 2016 12:37:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58057)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1b899E-0007qu-Ia; Wed, 01 Jun 2016 12:37:36 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E28A062658;
	Wed,  1 Jun 2016 16:37:35 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u51GbXqc025067; Wed, 1 Jun 2016 12:37:33 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 Jun 2016 18:37:22 +0200
Message-Id: <1464799050-11002-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 01 Jun 2016 16:37:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 0/8] cpus: make "-cpu cpux,
 features" global properties
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
	mark.cave-ayland@ilande.co.uk, blauwirbel@gmail.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SH7GRkYXvD4w

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
doing it for every CPU instance created.


Igor Mammedov (8):
  target-i386: cpu: move features logic that requires CPUState to
    realize time
  target-i386: cpu: move xcc->kvm_required check to reaize time
  target-i386: cpu: use cpu_generic_init() in cpu_x86_init()
  target-i386: cpu: consolidate calls of object_property_parse() in
    x86_cpu_parse_featurestr
  target-sparc: cpu: use sparc_cpu_parse_features() directly
  cpu: use CPUClass->parse_features() as convertor to global properties
  arm: virt: parse cpu_model only once
  pc: parse cpu features only once

 hw/arm/virt.c      |  41 +++++++-------
 hw/i386/pc.c       |  37 +++++++++----
 include/qom/cpu.h  |   2 +-
 qom/cpu.c          |  29 +++++-----
 target-i386/cpu.c  | 155 +++++++++++++++++++----------------------------------
 target-i386/cpu.h  |   1 -
 target-sparc/cpu.c |   7 +--
 7 files changed, 125 insertions(+), 147 deletions(-)

-- 
1.8.3.1

