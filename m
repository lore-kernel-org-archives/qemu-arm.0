Received: by 10.25.208.211 with SMTP id h202csp185077lfg;
        Thu, 3 Mar 2016 18:53:18 -0800 (PST)
X-Received: by 10.55.82.85 with SMTP id g82mr7300070qkb.107.1457059998015;
        Thu, 03 Mar 2016 18:53:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z136si1614432qhd.112.2016.03.03.18.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 18:53:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38507 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abfrh-0002h3-Kj
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 21:53:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abfrf-0002gt-NH
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 21:53:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1abfra-0005jc-NW
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 21:53:15 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48462)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>)
	id 1abfra-0005jX-Hs; Thu, 03 Mar 2016 21:53:10 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id EF091695;
	Fri,  4 Mar 2016 02:53:09 +0000 (UTC)
Received: from pxdev.xzpeter.org (vpn1-5-93.pek2.redhat.com [10.72.5.93])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u242qt90023902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 3 Mar 2016 21:53:02 -0500
Date: Fri, 4 Mar 2016 10:52:55 +0800
From: Peter Xu <peterx@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20160304025255.GF30973@pxdev.xzpeter.org>
References: <1456993272-32292-1-git-send-email-peterx@redhat.com>
	<1456993272-32292-4-git-send-email-peterx@redhat.com>
	<1457007587.4468.2.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1457007587.4468.2.camel@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, armbru@redhat.com,
	mdroth@linux.vnet.ibm.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, eblake@redhat.com
Subject: Re: [Qemu-arm] [PATCH v2 3/3] arm: implement query-gic-capability
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
X-TUID: 0qYs3O5LcJRj

On Thu, Mar 03, 2016 at 01:19:47PM +0100, Andrea Bolognani wrote:
> On Thu, 2016-03-03 at 16:21 +0800, Peter Xu wrote:
> > For emulated ARM VM, only gicv2 is supported. We need to add gicv3
> in
> > when emulated gicv3 ready. For KVM accelerated ARM VM, we detect the
> > capability bits using ioctls.
> >=C2=A0
> > if we want to
> know GIC kernel capabilities, we need to make sure we have
> > enabled KVM when querying (like, with "-enable-kvm").
> >=C2=A0
> >
> Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >=C2=A0=C2=A0target-arm/machine.c | 48
> +++++++++++++++++++++++++++++++++++++++++++++++-
> >=C2=A0=C2=A01 file changed, 47 insertions(+), 1 deletion(-)
>=20
> Sorry for not catching this earlier, but I'm afraid this is not
> going to work -- libvirt doesn't pass either -enable-kvm or the
> machine option accel=3Dkvm when probing for capabilities, which
> means that, with the current implementation, it will only get
> information about emulated GIC.
>=20
> Is there a way to make probing work without requiring KVM to
> be enabled?

Ah.. If so, this is a good point...

I can do this, but I just feel it a bit hacky if I do ioctl()s
directly in one QMP command handle:

qmp_query_gic_capability()
{
    kvm =3D open("/dev/kvm");
    vm =3D ioctl(KVM_CREATE_VM);

    ...test create devices using KVM_CREATE_DEVICE ioctls...

    close(vm);
    close(kvm);
}

Rather than leveraging current KVMState stuffs (of course, I can
make things a little bit prettier than above...).

Another way to do is to generalize kvm_init() maybe? That's some
work too.

Andrea, do you know how much effort we need to add this support for
libvirt, say, we can specify "accel=3D" or "-enable-kvm" as extra
parameter when probing?

Or, does anyone on the list has suggestion on how to better do this?

Thanks.
Peter
