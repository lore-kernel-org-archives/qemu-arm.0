Received: by 10.25.208.211 with SMTP id h202csp1295614lfg;
        Mon, 7 Mar 2016 01:56:09 -0800 (PST)
X-Received: by 10.140.98.98 with SMTP id n89mr28011756qge.9.1457344569725;
        Mon, 07 Mar 2016 01:56:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x145si16090052qka.105.2016.03.07.01.56.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Mar 2016 01:56:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1acrtY-0007r8-7Q
	for alex.bennee@linaro.org; Mon, 07 Mar 2016 04:56:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1acrtW-0007qy-11
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 04:56:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1acrtS-0000MH-MU
	for qemu-arm@nongnu.org; Mon, 07 Mar 2016 04:56:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1acrtS-0000M9-HI; Mon, 07 Mar 2016 04:56:02 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 5712C7D0CE;
	Mon,  7 Mar 2016 09:56:01 +0000 (UTC)
Received: from ovpn-200-39.brq.redhat.com (ovpn-200-39.brq.redhat.com
	[10.40.200.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u279tsYI023057
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 7 Mar 2016 04:55:57 -0500
Message-ID: <1457344554.4468.12.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Date: Mon, 07 Mar 2016 10:55:54 +0100
In-Reply-To: <1457324608-11434-1-git-send-email-peterx@redhat.com>
References: <1457324608-11434-1-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, armbru@redhat.com,
	mdroth@linux.vnet.ibm.com, qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v3 0/3] ARM: add query-gic-capability SMP
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
X-TUID: k/8YiEhn51hZ

On Mon, 2016-03-07 at 12:23 +0800, Peter Xu wrote:
> v3 changes:
> - patch 2: remove func declaration, add qmp header [Drew]
> - patch 3: being able to detect KVM GIC capabilities even without
>=C2=A0=C2=A0=C2=A0kvm enabled [Andrea]: this is a little bit hacky, need=
 some more
>=C2=A0=C2=A0=C2=A0review on this.
>=C2=A0
> v2 changes:
> - result layout change: use array and dict for the capability bits
>=C2=A0=C2=A0=C2=A0rather than a single array of strings [Andrea/Markus]
> - spelling out what GIC is in doc [Eric]
>=C2=A0
> This patch is to add ARM-specific command "query-gic-capability".
>=C2=A0
> The new command can report which kind of GIC device the host/QEMU
> support. The returned result is in the form of array.
>=C2=A0
> Sample command and output:
>=C2=A0
> {"execute": "query-gic-capability"}
> {"return": [{"emulated": false, "version": 3, "kernel": false},
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0{"emulated": true, "version": 2, "kernel": true}]}
>=C2=A0
> Testing:
>=C2=A0
> Smoke tests on both x86 (emulated) and another moonshot ARM server.
>=C2=A0
> Peter Xu (3):
>=C2=A0=C2=A0=C2=A0arm: qmp: add GICCapability struct
>=C2=A0=C2=A0=C2=A0arm: qmp: add query-gic-capability interface
>=C2=A0=C2=A0=C2=A0arm: implement query-gic-capability
>=C2=A0
>=C2=A0=C2=A0monitor.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A0=C2=A08 ++++
>=C2=A0=C2=A0qapi-schema.json=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A03=
3 ++++++++++++++++
>=C2=A0=C2=A0qmp-commands.hx=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A026 ++++++++++++
>=C2=A0=C2=A0scripts/qapi.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A0=C2=A01 +
>=C2=A0=C2=A0target-arm/machine.c | 109 +++++++++++++++++++++++++++++++++=
++++++++++++++++++
>=C2=A0=C2=A05 files changed, 177 insertions(+)

I tested this both on a v2-only machine

=C2=A0 {"return": [
=C2=A0=C2=A0=C2=A0=C2=A0{"emulated": false, "version": 3, "kernel": false=
},
=C2=A0=C2=A0=C2=A0=C2=A0{"emulated": true, "version": 2, "kernel": true}
=C2=A0 ]}

and on a v3-only machine

=C2=A0 {"return": [
=C2=A0=C2=A0=C2=A0=C2=A0{"emulated": false, "version": 3, "kernel": true}=
,
=C2=A0=C2=A0=C2=A0=C2=A0{"emulated": true, "version": 2, "kernel": false}
=C2=A0 ]}

The output looks good to me - I'll leave reviewing the
implementation to someone with more QEMU knowledge than me, that
is, any QEMU knowledge at all ;)

One last, purely cosmetic, bit: should the command name be
query-gic-capabilities rather than query-gic-capability? Any
native speaker feels like weighing in?

Cheers.

--=C2=A0
Andrea Bolognani
Software Engineer - Virtualization Team
