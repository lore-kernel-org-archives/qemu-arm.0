Received: by 10.25.21.156 with SMTP id 28csp2672856lfv;
        Mon, 1 Aug 2016 07:55:19 -0700 (PDT)
X-Received: by 10.55.71.196 with SMTP id u187mr9606909qka.188.1470063318948;
        Mon, 01 Aug 2016 07:55:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z88si20212676qtc.23.2016.08.01.07.55.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 07:55:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUEcg-0002FY-Ca
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 10:55:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bUEcY-00029z-8C
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 10:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bUEcT-0000fB-KQ
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 10:55:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bUEcT-0000f5-Eo; Mon, 01 Aug 2016 10:55:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3F2180088;
	Mon,  1 Aug 2016 14:55:04 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u71Et1S0002969
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Aug 2016 10:55:03 -0400
Message-ID: <1470063301.3971.15.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 01 Aug 2016 16:55:01 +0200
In-Reply-To: <CAFEAcA97p9GFrp+tX3pwqeVaSxjxVwuPvCAgZt5aYd_Yk+mGnA@mail.gmail.com>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
	<1470053099.3971.11.camel@redhat.com>
	<20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
	<1470058019.3971.13.camel@redhat.com>
	<CAFEAcA97p9GFrp+tX3pwqeVaSxjxVwuPvCAgZt5aYd_Yk+mGnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 01 Aug 2016 14:55:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 1/1] arm64: add an option to
 turn on/off vpmu support
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0qhZoymUwv+T

On Mon, 2016-08-01 at 14:32 +0100, Peter Maydell wrote:
> > Wouldn't that mean that you'd be unable to use
> >=C2=A0
> >=C2=A0=C2=A0=C2=A0-cpu foo,pmu=3Doff
> >=C2=A0
> > if CPU model 'foo' doesn't support a PMU? I'd expect that
> > to work.
>=C2=A0
> The current precedent (has_el3) doesn't work like that: if
> foo isn't a CPU which can support EL3 then the property doesn't
> exist, and it's an error to try to set it.

Doesn't look like the pmu option works like that on x86,
though, unless I'm missing something.

I have a guest running with

=C2=A0 -cpu pentium,pmu=3Don

and I can't see hardware perf events from inside the guest,
eg. dmesg reports

=C2=A0 Performance Events: no PMU driver, software events only.

and perf tells me

=C2=A0 <not supported> instructions
=C2=A0 <not supported> branches
=C2=A0 ...

I'm not sure whether that's because the PMU is being
emulated but the kernel doesn't have a driver for it, or
whether it's not being emulated at all. Any way to find
out?

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
