Received: by 10.25.208.211 with SMTP id h202csp2355528lfg;
        Wed, 23 Mar 2016 02:17:24 -0700 (PDT)
X-Received: by 10.55.33.78 with SMTP id h75mr1898856qkh.54.1458724644405;
        Wed, 23 Mar 2016 02:17:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7si1432275qhm.4.2016.03.23.02.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Mar 2016 02:17:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:42065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aieup-000252-TC
	for alex.bennee@linaro.org; Wed, 23 Mar 2016 05:17:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aieun-00024q-Hc
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1aieui-0007ax-J9
	for qemu-arm@nongnu.org; Wed, 23 Mar 2016 05:17:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1aieui-0007ar-Dh; Wed, 23 Mar 2016 05:17:16 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id F3133C00F215;
	Wed, 23 Mar 2016 09:17:15 +0000 (UTC)
Received: from pxdev.xzpeter.org (dhcp-14-238.nay.redhat.com [10.66.14.238])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2N9H2CR017842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 23 Mar 2016 05:17:08 -0400
Date: Wed, 23 Mar 2016 17:17:01 +0800
From: Peter Xu <peterx@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20160323091701.GP28183@pxdev.xzpeter.org>
References: <1458711153-15988-1-git-send-email-peterx@redhat.com>
	<1458723243.3546.32.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1458723243.3546.32.camel@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, libvir-list@redhat.com,
	armbru@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, eblake@redhat.com
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
X-TUID: xA0iz/iBVMZS

On Wed, Mar 23, 2016 at 09:54:03AM +0100, Andrea Bolognani wrote:
> On Wed, 2016-03-23 at 13:32 +0800, Peter Xu wrote:
> > v6 changes:
> > - patch 1 (squashed into patch 2)
> > =C2=A0 - explain more about the following in commit message: why we n=
eed
> > =C2=A0=C2=A0=C2=A0=C2=A0this command, and what does the entries mean =
[Markus]
> > =C2=A0 - explain what GIC is [Eric]
> > =C2=A0 - squash this patch into patch 2 [Eric]
> > - patch 2 (new patch 1)
> > =C2=A0 - fix "does not implement" english error [Eric]
> > =C2=A0 - remove useless headers in target-arm/monitor.c [Markus]
> > =C2=A0 - remove this command from whitelist [Markus, Eric]
> > =C2=A0 - return dict rather than array, with single key points to the
> > =C2=A0=C2=A0=C2=A0=C2=A0original array results [Markus, Eric]
> > - patch 5 (new patch 4)
> > =C2=A0 - tiny change in implementation to suite the new interface.
>=20
> Tested again on two different aarch64 hosts, one with GIC
> v3 support and the other one with GIC v2 only; seems to be
> working just fine.
>=20
> Now on to tweak my RFC libvirt patches to cope with the
> interface change :)

Andrea,=20

Thank you very much for your quick follow-ups (merely every
time). :-)

Hope that the interface (at least) could suffice this time.

-- peterx
