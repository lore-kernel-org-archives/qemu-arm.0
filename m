Received: by 10.25.21.156 with SMTP id 28csp1337692lfv;
        Mon, 15 Aug 2016 02:25:01 -0700 (PDT)
X-Received: by 10.55.182.135 with SMTP id g129mr33723278qkf.128.1471253101888;
        Mon, 15 Aug 2016 02:25:01 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e75si11707847qkj.333.2016.08.15.02.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Aug 2016 02:25:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35683 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZE8j-0005kO-AK
	for alex.bennee@linaro.org; Mon, 15 Aug 2016 05:25:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZE8d-0005j4-EL
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 05:24:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bZE8a-0005fL-7b
	for qemu-arm@nongnu.org; Mon, 15 Aug 2016 05:24:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53192)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bZE8a-0005fC-23; Mon, 15 Aug 2016 05:24:52 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 100B261A00;
	Mon, 15 Aug 2016 09:24:51 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7F9Om2e029639
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 15 Aug 2016 05:24:49 -0400
Message-ID: <1471253087.3003.3.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Aug 2016 11:24:47 +0200
In-Reply-To: <da84a3fb-79d9-bb15-0784-9f635b6363cf@redhat.com>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
	<1470053099.3971.11.camel@redhat.com>
	<20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
	<1470058019.3971.13.camel@redhat.com>
	<CAFEAcA97p9GFrp+tX3pwqeVaSxjxVwuPvCAgZt5aYd_Yk+mGnA@mail.gmail.com>
	<da84a3fb-79d9-bb15-0784-9f635b6363cf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 15 Aug 2016 09:24:51 +0000 (UTC)
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
X-TUID: rrkdC0uHrAF/

On Sat, 2016-08-13 at 01:06 -0500, Wei Huang wrote:
> > > Wouldn't that mean that you'd be unable to use
> > >=C2=A0
> > >=C2=A0=C2=A0=C2=A0-cpu foo,pmu=3Doff
> > >=C2=A0
> > > if CPU model 'foo' doesn't support a PMU? I'd expect that
> > > to work.
> >=C2=A0
> > The current precedent (has_el3) doesn't work like that: if
> > foo isn't a CPU which can support EL3 then the property doesn't
> > exist, and it's an error to try to set it.
>=C2=A0
> V1 sent. I tried to follow everyone's advice. See the following:
>=C2=A0
> * set default pmu=3Doff
> * like el3, add a new feature ARM_FEATURE_HOST_PMU
> * "pmu" property becomes CPU dependent. Only cortex-a53/cortex-a57/host
> under certain mode support this option
> * change struct ARMCPU field name "has_pmu" =3D=3D> "has_host_pmu" beca=
use
> IMO "has_pmu" is misleading
>=C2=A0
> BTW answering Andrea's question above: "-cpu foo,pmu=3Doff" won't be
> allowed in this patch if CPU "foo" doesn't support host-backed PMU. QEM=
U
> will fail to run in this case. Maybe this is what we want?

After discussing this a bit offline, I came to the conclusion
that there isn't a Single Right Way=E2=84=A2 to handle this - both my
proposal and what you implemented are reasonable behaviors
one could expect.

On the other hand, what you implemented:

=C2=A0 * matches x86
=C2=A0 * is more strict than what I proposed, so there's room to
=C2=A0=C2=A0=C2=A0=C2=A0change it later without breaking any existing gue=
st

so I'm happy with it :)

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
