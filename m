Received: by 10.25.21.156 with SMTP id 28csp1538451lfv;
        Mon, 15 Aug 2016 10:24:51 -0700 (PDT)
X-Received: by 10.55.3.20 with SMTP id 20mr32719833qkd.34.1471281890991;
        Mon, 15 Aug 2016 10:24:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z24si14388692qtb.68.2016.08.15.10.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 10:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38178 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZLd4-0004id-Cd
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 13:24:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZLd1-0004iN-0y
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 13:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZLcw-0000ig-Q6
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 13:24:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53712)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bZLcw-0000i6-KC; Mon, 15 Aug 2016 13:24:42 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF70F7F340;
	Mon, 15 Aug 2016 17:24:41 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7FHOcM7011290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Aug 2016 13:24:40 -0400
Message-ID: <1471281878.3003.13.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, qemu-arm@nongnu.org
Date: Mon, 15 Aug 2016 19:24:38 +0200
In-Reply-To: <57B1EA05.2050908@redhat.com>
References: <1471067570-7503-1-git-send-email-wei@redhat.com>
	<1471253464.3003.5.camel@redhat.com> <57B1EA05.2050908@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 15 Aug 2016 17:24:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V1 1/1] arm64: Add an option to turn on/off
 host-backed vPMU support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, shannon.zhao@linaro.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +2191mfQ+5kJ

On Mon, 2016-08-15 at 11:12 -0500, Wei Huang wrote:
> > Did you already try driving this with libvirt? It should work
> > out of the box.
> >=C2=A0
> > If you haven't, I will do it :)
>=C2=A0
> No, I haven't. All tests were done based on command line to QEMU. :-)

Fair enough :)

I did some testing on my own using libvirt to drive a QEMU
binary that included your patch, and it looks like everything
is working as expected: if I turn PMU on using the appropriate
XML element (<pmu state=3D'on'/>) I can access the performance
counters from inside the guest; if I disable it explicitly or
don't enable it, I can't.

The host-side testing involved making sure the 'pmu' flag
was passed, or not passed, to QEMU and the value, if any,
matched the guest XML.

The guest-side testing involved running

=C2=A0 $ dmesg | grep -i pmu
=C2=A0 $ perf list | grep 'Hardware event'

and making sure some output was returned in both cases, and
making sure the 'instructions' counter was not marked as '<not
supported>' in the output of

=C2=A0 $ perf stat true

If the kind of testing I performed is not good enough, please
let me know and I'll do another round.

This was tested only with <cpu mode=3D'host-passthrough'/> (the
libvirt equivalent of -cpu host), because the aarch64 CPU
driver in libvirt is not currently capable of handling other
CPU models for KVM guests.

I also verified that TCG guests didn't accept the 'pmu' flag.

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
