Received: by 10.25.208.211 with SMTP id h202csp2564902lfg;
        Wed, 30 Mar 2016 04:20:35 -0700 (PDT)
X-Received: by 10.140.160.214 with SMTP id g205mr9323721qhg.88.1459336835594;
        Wed, 30 Mar 2016 04:20:35 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si3279869qgo.0.2016.03.30.04.20.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Mar 2016 04:20:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53183 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1alEAt-00024p-1u
	for alex.bennee@linaro.org; Wed, 30 Mar 2016 07:20:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1alEAo-00023f-GX
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 07:20:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1alEAl-0005ao-Aj
	for qemu-arm@nongnu.org; Wed, 30 Mar 2016 07:20:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1alEAk-0005aa-VD; Wed, 30 Mar 2016 07:20:27 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id E1DD950F4A;
	Wed, 30 Mar 2016 11:20:25 +0000 (UTC)
Received: from dhcp129-180.brq.redhat.com (dhcp129-180.brq.redhat.com
	[10.34.129.180])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2UBKMI9021354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 30 Mar 2016 07:20:23 -0400
Message-ID: <1459336821.4699.13.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>
Date: Wed, 30 Mar 2016 13:20:21 +0200
In-Reply-To: <CAFEAcA-Y=nXpaNmOUNPzsFBhSZES9SD2k+u3XhVhzABOr9qGrw@mail.gmail.com>
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
	<CAFEAcA-Y=nXpaNmOUNPzsFBhSZES9SD2k+u3XhVhzABOr9qGrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Andrew Jones <drjones@redhat.com>, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 0/4] ARM: add
 query-gic-capabilities QMP command
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
X-TUID: a9DgML1J+aUN

On Tue, 2016-03-29 at 21:10 +0100, Peter Maydell wrote:
> On 24 March 2016 at 02:55, Peter Xu <peterx@redhat.com> wrote:
> >=20
> > This patch is to add ARM-specific command "query-gic-capability".
> >=20
> > The new command can report which kind of GIC device the host/QEMU
> > support. The returned result is in the form of array.
> >=20
> > Sample command and output:
> >=20
> > {"execute": "query-gic-capability"}
> > {"return": [{"emulated": false, "version": 3, "kernel": false},
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0{"emulated": true, "version": 2, "kernel": true}]}
>=20
> I really strongly want this in 2.6 but we are very very nearly
> out of time. Eric or Markus, could I trouble one of you to
> provide an ack for this series for the QMP protocol aspects
> sometime before end of Wednesday, please?
>=20
> I also don't think I've seen an indication from the libvirt
> folks that this is definitely the API they want; did I miss it?

Yes, this works nicely for libvirt; in fact, I've already
posted an RFC implementation[1] to the list last week.

Cheers.


[1]=C2=A0https://www.redhat.com/archives/libvir-list/2016-March/msg00956.=
html
--=20
Andrea Bolognani
Software Engineer - Virtualization Team

