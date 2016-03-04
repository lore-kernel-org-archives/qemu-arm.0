Received: by 10.25.208.211 with SMTP id h202csp289608lfg;
        Fri, 4 Mar 2016 00:44:20 -0800 (PST)
X-Received: by 10.140.30.195 with SMTP id d61mr7460832qgd.52.1457081060201;
        Fri, 04 Mar 2016 00:44:20 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si2747193qge.102.2016.03.04.00.44.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 Mar 2016 00:44:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ablLI-0006tq-HD
	for alex.bennee@linaro.org; Fri, 04 Mar 2016 03:44:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ablKh-00068g-Kw
	for qemu-devel@nongnu.org; Fri, 04 Mar 2016 03:43:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1ablKg-0005Vs-Is
	for qemu-devel@nongnu.org; Fri, 04 Mar 2016 03:43:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1ablKa-0005Ti-HE; Fri, 04 Mar 2016 03:43:28 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 1CEC564D0F;
	Fri,  4 Mar 2016 08:43:28 +0000 (UTC)
Received: from dhcp129-59.brq.redhat.com (dhcp129-59.brq.redhat.com
	[10.34.129.59])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u248hObV014493
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 4 Mar 2016 03:43:26 -0500
Message-ID: <1457081004.4468.4.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Xu <peterx@redhat.com>
Date: Fri, 04 Mar 2016 09:43:24 +0100
In-Reply-To: <20160304025255.GF30973@pxdev.xzpeter.org>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
	<1456993272-32292-4-git-send-email-peterx@redhat.com>
	<1457007587.4468.2.camel@redhat.com>
	<20160304025255.GF30973@pxdev.xzpeter.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 04 Mar 2016 08:43:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Cc: wei@redhat.com, peter.maydell@linaro.org, drjones@redhat.com,
	armbru@redhat.com, mdroth@linux.vnet.ibm.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-devel] [PATCH v2 3/3] arm: implement query-gic-capability
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
X-TUID: o9vPRFOMLjDs

On Fri, 2016-03-04 at 10:52 +0800, Peter Xu wrote:
> > Sorry for not catching this earlier, but I'm afraid this is not
> > going to work -- libvirt doesn't pass either -enable-kvm or the
> > machine option accel=3Dkvm when probing for capabilities, which
> > means that, with the current implementation, it will only get
> > information about emulated GIC.
> >=C2=A0
> > Is there a way to make probing work without requiring KVM to
> > be enabled?
> Ah.. If so, this is a good point...
>=C2=A0
> I can do this, but I just feel it a bit hacky if I do ioctl()s
> directly in one QMP command handle:
>=C2=A0
> qmp_query_gic_capability()
> {
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0kvm =3D open("/dev/kvm");
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vm =3D ioctl(KVM_CREATE_VM);
>=C2=A0
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0...test create devices using KVM_CREATE_DE=
VICE ioctls...
>=C2=A0
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0close(vm);
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0close(kvm);
> }
>=C2=A0
> Rather than leveraging current KVMState stuffs (of course, I can
> make things a little bit prettier than above...).
>=C2=A0
> Another way to do is to generalize kvm_init() maybe? That's some
> work too.
>=C2=A0
> Andrea, do you know how much effort we need to add this support for
> libvirt, say, we can specify "accel=3D" or "-enable-kvm" as extra
> parameter when probing?

I'm afraid this is not going to be possible for the same reason
we have to use '-M none' when probing: at that point in time, we
simply have no idea what the guests will look like. Actually,
it's the other way around, in that the result of probing (host
and domain capabilities) will influence the guest configuration
created by the user / management tool.

And we definitely can't use 'accel=3Dkvm' unconditionally, because
then we won't be able to probe eg. the qemu-system-aarch64 binary
installed on a x86_64 host.

Cheers.

--=C2=A0
Andrea Bolognani
Software Engineer - Virtualization Team
