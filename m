Received: by 10.25.208.211 with SMTP id h202csp1189755lfg;
        Sun, 6 Mar 2016 20:23:52 -0800 (PST)
X-Received: by 10.140.98.170 with SMTP id o39mr9101604qge.44.1457324632461;
        Sun, 06 Mar 2016 20:23:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u82si7826370qki.124.2016.03.06.20.23.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Mar 2016 20:23:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53482 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acmhz-0006B0-Ux
	for alex.bennee@linaro.org; Sun, 06 Mar 2016 23:23:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmhx-0006As-PB
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:23:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1acmhs-0005Xt-Q8
	for qemu-arm@nongnu.org; Sun, 06 Mar 2016 23:23:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43312)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1acmhs-0005Xp-Ks; Sun, 06 Mar 2016 23:23:44 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 8AFD6249;
	Mon,  7 Mar 2016 04:23:43 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-200.pek2.redhat.com [10.72.5.200])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u274NYnR001687; Sun, 6 Mar 2016 23:23:36 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 Mar 2016 12:23:25 +0800
Message-Id: <1457324608-11434-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, peterx@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: [Qemu-arm] [PATCH v3 0/3] ARM: add query-gic-capability SMP command
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
X-TUID: jTllAh5Umszp

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
  arm: qmp: add query-gic-capability interface
  arm: implement query-gic-capability

 monitor.c            |   8 ++++
 qapi-schema.json     |  33 ++++++++++++++++
 qmp-commands.hx      |  26 ++++++++++++
 scripts/qapi.py      |   1 +
 target-arm/machine.c | 109 +++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 177 insertions(+)

-- 
2.4.3

