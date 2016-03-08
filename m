Received: by 10.25.208.211 with SMTP id h202csp1782875lfg;
        Mon, 7 Mar 2016 23:36:44 -0800 (PST)
X-Received: by 10.140.173.193 with SMTP id t184mr10275683qht.23.1457422604702;
        Mon, 07 Mar 2016 23:36:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si1809316qgt.99.2016.03.07.23.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 23:36:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1adCCC-0005h8-7Z
	for alex.bennee@linaro.org; Tue, 08 Mar 2016 02:36:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adCCA-0005gq-9D
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 02:36:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1adCC5-00058L-VE
	for qemu-arm@nongnu.org; Tue, 08 Mar 2016 02:36:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1adCC5-00058H-Pj; Tue, 08 Mar 2016 02:36:37 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 61F1572095;
	Tue,  8 Mar 2016 07:36:37 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-232.pek2.redhat.com [10.72.5.232])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u287aSmF024053; Tue, 8 Mar 2016 02:36:29 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Mar 2016 15:36:19 +0800
Message-Id: <1457422582-28799-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 08 Mar 2016 07:36:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v4 0/3] ARM: add query-gic-capabilities SMP
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
X-TUID: nBgT/acyGpxD

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

Peter Xu (3):
  arm: qmp: add GICCapability struct
  arm: qmp: add query-gic-capabilities interface
  arm: implement query-gic-capabilities

 monitor.c            |  8 +++++
 qapi-schema.json     | 33 ++++++++++++++++++
 qmp-commands.hx      | 26 ++++++++++++++
 scripts/qapi.py      |  1 +
 target-arm/machine.c | 98 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 166 insertions(+)

-- 
2.4.3

