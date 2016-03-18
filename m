Received: by 10.25.208.211 with SMTP id h202csp792798lfg;
        Thu, 17 Mar 2016 20:27:49 -0700 (PDT)
X-Received: by 10.55.72.196 with SMTP id v187mr18830268qka.97.1458271669062;
        Thu, 17 Mar 2016 20:27:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z48si10613270qgz.27.2016.03.17.20.27.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Mar 2016 20:27:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41269 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agl4m-0005jW-Kh
	for alex.bennee@linaro.org; Thu, 17 Mar 2016 23:27:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agl4k-0005fa-I8
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:27:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1agl4h-0000sm-DI
	for qemu-arm@nongnu.org; Thu, 17 Mar 2016 23:27:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1agl4h-0000si-7V; Thu, 17 Mar 2016 23:27:43 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id A589381F03;
	Fri, 18 Mar 2016 03:27:42 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-7-63.pek2.redhat.com [10.72.7.63])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u2I3Rce1023061; Thu, 17 Mar 2016 23:27:39 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Mar 2016 11:27:29 +0800
Message-Id: <1458271654-23706-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v5 0/5] ARM: add query-gic-capabilities SMP
	command
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
X-TUID: +YBCSjjgEx9z

v5 changes:
- patch 2: moved to target-arm/monitor.c (from target-arm/machine.c)
           [Peter]
- patch 3: splitted into three patches: [all from Peter's comments]
  - patch 3 (new): leverage kvm_arm_create_scratch_host_vcpu(), tiny
    enhancement of old one to suite our need
  - patch 4: introduce kvm_support_device() in kvm-all.c
  - patch 5: do the implementation.

v4 changes:
- all: rename query-gic-capability to query-gic-capabilities [Andrea]
- patch 3: rename helper function to kvm_support_device, make it
  inline and lighter. [Drew]

v3 changes:
- patch 2: remove func declaration, add qmp header [Drew]
- patch 3: being able to detect KVM GIC capabilities even without
  kvm enabled [Andrea]: this is a little bit hacky, need some more
  review on this.

v2 changes:
- result layout change: use array and dict for the capability bits
  rather than a single array of strings [Andrea/Markus]
- spelling out what GIC is in doc [Eric]

This patch is to add ARM-specific command "query-gic-capability".

The new command can report which kind of GIC device the host/QEMU
support. The returned result is in the form of array.

Sample command and output:

{"execute": "query-gic-capability"}
{"return": [{"emulated": false, "version": 3, "kernel": false},
            {"emulated": true, "version": 2, "kernel": true}]}

Testing:

Smoke tests on both x86 (emulated) and another moonshot ARM server.


Peter Xu (5):
  arm: qmp: add GICCapability struct
  arm: qmp: add query-gic-capabilities interface
  arm: enhance kvm_arm_create_scratch_host_vcpu
  kvm: add kvm_support_device() helper function
  arm: implement query-gic-capabilities

 include/sysemu/kvm.h     |  9 +++++
 kvm-all.c                | 15 +++++++++
 monitor.c                |  8 +++++
 qapi-schema.json         | 33 +++++++++++++++++++
 qmp-commands.hx          | 26 +++++++++++++++
 scripts/qapi.py          |  1 +
 target-arm/Makefile.objs |  2 +-
 target-arm/kvm.c         | 10 +++++-
 target-arm/kvm_arm.h     |  6 ++--
 target-arm/monitor.c     | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
 10 files changed, 192 insertions(+), 4 deletions(-)
 create mode 100644 target-arm/monitor.c

-- 
2.4.3

