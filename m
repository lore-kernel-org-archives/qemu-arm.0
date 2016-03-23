Received: by 10.25.208.211 with SMTP id h202csp2263596lfg;
        Tue, 22 Mar 2016 22:32:55 -0700 (PDT)
X-Received: by 10.141.7.68 with SMTP id j65mr977449qhd.29.1458711175627;
        Tue, 22 Mar 2016 22:32:55 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j69si833333qga.6.2016.03.22.22.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 22:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aibPb-00035U-6Z
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 01:32:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPY-00035B-Ka
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:32:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aibPV-0001CD-50
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 01:32:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aibPU-0001C7-Vj; Wed, 23 Mar 2016 01:32:49 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 860807F0B3;
	Wed, 23 Mar 2016 05:32:48 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (dhcp-14-238.nay.redhat.com
	[10.66.14.238])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N5WeSE011002; Wed, 23 Mar 2016 01:32:41 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 23 Mar 2016 13:32:29 +0800
Message-Id: <1458711153-15988-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v6 0/4] ARM: add query-gic-capabilities SMP
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
X-TUID: P8Zr59GcDSyd

v6 changes:
- patch 1 (squashed into patch 2)
  - explain more about the following in commit message: why we need
    this command, and what does the entries mean [Markus]
  - explain what GIC is [Eric]
  - squash this patch into patch 2 [Eric]
- patch 2 (new patch 1)
  - fix "does not implement" english error [Eric]
  - remove useless headers in target-arm/monitor.c [Markus]
  - remove this command from whitelist [Markus, Eric]
  - return dict rather than array, with single key points to the
    original array results [Markus, Eric]
- patch 5 (new patch 4)
  - tiny change in implementation to suite the new interface.

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

Peter Xu (4):
  arm: qmp: add query-gic-capabilities interface
  arm: enhance kvm_arm_create_scratch_host_vcpu
  kvm: add kvm_support_device() helper function
  arm: implement query-gic-capabilities

 include/sysemu/kvm.h     |  9 +++++
 kvm-all.c                | 15 +++++++++
 monitor.c                |  8 +++++
 qapi-schema.json         | 50 ++++++++++++++++++++++++++++
 qmp-commands.hx          | 28 ++++++++++++++++
 target-arm/Makefile.objs |  2 +-
 target-arm/kvm.c         | 10 +++++-
 target-arm/kvm_arm.h     |  6 ++--
 target-arm/monitor.c     | 86 ++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 210 insertions(+), 4 deletions(-)
 create mode 100644 target-arm/monitor.c

-- 
2.4.3

