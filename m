Received: by 10.25.208.211 with SMTP id h202csp2343846lfg;
        Wed, 23 Mar 2016 01:54:26 -0700 (PDT)
X-Received: by 10.140.19.98 with SMTP id 89mr1804686qgg.2.1458723266021;
        Wed, 23 Mar 2016 01:54:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q75si1345987qgq.65.2016.03.23.01.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 01:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41959 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aieYa-0007Eg-JE
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 04:54:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1aieYT-00074C-09
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 04:54:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1aieYO-0000pO-W0
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 04:54:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1aieYO-0000pB-R4; Wed, 23 Mar 2016 04:54:12 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 92DE480E42;
	Wed, 23 Mar 2016 08:54:11 +0000 (UTC)
Received: from ovpn-200-41.brq.redhat.com (ovpn-200-41.brq.redhat.com
	[10.40.200.41])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N8s4LL013766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 04:54:07 -0400
Message-ID: <1458723243.3546.32.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Date: Wed, 23 Mar 2016 09:54:03 +0100
In-Reply-To: <1458711153-15988-1-git-send-email-peterx@redhat.com>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v6 0/4] ARM: add query-gic-capabilities SMP
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
X-TUID: 79b+Hk3foF0c

On Wed, 2016-03-23 at 13:32 +0800, Peter Xu wrote:
> v6 changes:
> - patch 1 (squashed into patch 2)
> =C2=A0 - explain more about the following in commit message: why we nee=
d
> =C2=A0=C2=A0=C2=A0=C2=A0this command, and what does the entries mean [M=
arkus]
> =C2=A0 - explain what GIC is [Eric]
> =C2=A0 - squash this patch into patch 2 [Eric]
> - patch 2 (new patch 1)
> =C2=A0 - fix "does not implement" english error [Eric]
> =C2=A0 - remove useless headers in target-arm/monitor.c [Markus]
> =C2=A0 - remove this command from whitelist [Markus, Eric]
> =C2=A0 - return dict rather than array, with single key points to the
> =C2=A0=C2=A0=C2=A0=C2=A0original array results [Markus, Eric]
> - patch 5 (new patch 4)
> =C2=A0 - tiny change in implementation to suite the new interface.

Tested again on two different aarch64 hosts, one with GIC
v3 support and the other one with GIC v2 only; seems to be
working just fine.

Now on to tweak my RFC libvirt patches to cope with the
interface change :)

Cheers.

--=20
Andrea Bolognani
Software Engineer - Virtualization Team

