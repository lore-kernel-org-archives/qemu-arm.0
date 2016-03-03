Received: by 10.25.208.211 with SMTP id h202csp2571163lfg;
        Thu, 3 Mar 2016 00:22:12 -0800 (PST)
X-Received: by 10.55.25.141 with SMTP id 13mr1344884qkz.69.1456993332053;
        Thu, 03 Mar 2016 00:22:12 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i109si4540117qgf.26.2016.03.03.00.22.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 00:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abOWR-0001wf-J0
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 03:22:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOVz-0001QG-16
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:21:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abOVy-0001fB-0I
	for qemu-devel@nongnu.org; Thu, 03 Mar 2016 03:21:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49125)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1abOVo-0001ca-1d; Thu, 03 Mar 2016 03:21:32 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id D6E408F4E7;
	Thu,  3 Mar 2016 08:21:30 +0000 (UTC)
Received: from pxdev.xzpeter.org.com (vpn1-5-147.pek2.redhat.com [10.72.5.147])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u238LKKf010446; Thu, 3 Mar 2016 03:21:22 -0500
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 Mar 2016 16:21:09 +0800
Message-Id: <1456993272-32292-1-git-send-email-peterx@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	mdroth@linux.vnet.ibm.com, armbru@redhat.com,
	abologna@redhat.com, qemu-arm@nongnu.org
Subject: [Qemu-devel] [PATCH v2 0/3] ARM: add query-gic-capability SMP
	command
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
X-TUID: cIRsT2Mzt0yi

This is a re-work of v1 patch:

https://lists.gnu.org/archive/html/qemu-devel/2016-02/msg05270.html

This patch is to add ARM-specific command "query-gic-capability".

The new command can report which kind of GIC device the host/QEMU
support. The returned result is in the form of array.

Changes from v1:

- result layout change: use array and dict for the capability bits
  rather than a single array of strings [Andrea/Markus]
- spelling out what GIC is in doc [Eric]

Sample command and output:

{"execute": "query-gic-capability"}
{"return": [{"emulated": false, "version": 3, "kernel": false},
            {"emulated": true, "version": 2, "kernel": true}]}

Testing:

Smoke tests on both x86 (emulated) and another moonshot ARM server.

Please review!

--peterx

Peter Xu (3):
  arm: qmp: add GICCapability struct
  arm: qmp: add query-gic-capability interface
  arm: implement query-gic-capability

 monitor.c            |  8 ++++++++
 qapi-schema.json     | 33 ++++++++++++++++++++++++++++++++
 qmp-commands.hx      | 26 ++++++++++++++++++++++++++
 scripts/qapi.py      |  1 +
 target-arm/machine.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 121 insertions(+)

-- 
2.4.3

