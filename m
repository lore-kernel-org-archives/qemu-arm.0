Received: by 10.25.208.211 with SMTP id h202csp368573lfg;
        Wed, 23 Mar 2016 19:56:02 -0700 (PDT)
X-Received: by 10.140.176.206 with SMTP id w197mr8156490qhw.76.1458788162115;
        Wed, 23 Mar 2016 19:56:02 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n197si4804072qhc.23.2016.03.23.19.56.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 19:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47229 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aivRI-0001Ef-Kb
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 22:56:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41643)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRG-0001EO-3H
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:55:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aivRC-0000tH-UN
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 22:55:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aivRC-0000t9-Mu; Wed, 23 Mar 2016 22:55:54 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 4EB714621D;
	Thu, 24 Mar 2016 02:55:53 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-7-35.pek2.redhat.com [10.72.7.35])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u2O2tlUH013405; Wed, 23 Mar 2016 22:55:48 -0400
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 10:55:38 +0800
Message-Id: <1458788142-17509-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, peterx@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org, eblake@redhat.com,
	christoffer.dall@linaro.org
Subject: [Qemu-arm] [PATCH v7 0/4] ARM: add query-gic-capabilities QMP
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
X-TUID: 6KmmZYz1vW4I

v7 changes:
- patch 1
  - add more to commit log, about how to use the results [Markus]
  - change interface from dict back to array [Markus, Eric]
- patch 2
  - kvm_arm_create_scratch_host_vcpu should raise error when init
    non-zero, but failed to find a good CPU model [Sergey]
- patch 3
  - rename function to kvm_device_supported [Sergey]
- patch 4
  - comment line from "FIXME" to "TODO" [Sergey]
  - make kvm-related part another function [Sergey]
  - change result to array to follow patch 1's change

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
  kvm: add kvm_device_supported() helper function
  arm: implement query-gic-capabilities

 include/sysemu/kvm.h     |  9 ++++++
 kvm-all.c                | 15 +++++++++
 monitor.c                |  8 +++++
 qapi-schema.json         | 36 +++++++++++++++++++++
 qmp-commands.hx          | 27 ++++++++++++++++
 target-arm/Makefile.objs |  2 +-
 target-arm/kvm.c         | 14 +++++++-
 target-arm/kvm_arm.h     |  6 ++--
 target-arm/monitor.c     | 84 ++++++++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 197 insertions(+), 4 deletions(-)
 create mode 100644 target-arm/monitor.c

-- 
2.4.3

