Received: by 10.25.21.156 with SMTP id 28csp2630666lfv;
        Mon, 1 Aug 2016 06:27:16 -0700 (PDT)
X-Received: by 10.55.176.130 with SMTP id z124mr70309550qke.164.1470058036566;
        Mon, 01 Aug 2016 06:27:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g19si19966064qtc.40.2016.08.01.06.27.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 06:27:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50282 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUDFT-0001Xd-Vn
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 09:27:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bUDFN-0001Uc-5O
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:27:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <abologna@redhat.com>) id 1bUDFH-0000a4-2E
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 09:27:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43196)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <abologna@redhat.com>)
	id 1bUDFG-0000Zy-Sv; Mon, 01 Aug 2016 09:27:02 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 561F44E03C;
	Mon,  1 Aug 2016 13:27:02 +0000 (UTC)
Received: from dhcp129-212.brq.redhat.com (dhcp129-212.brq.redhat.com
	[10.34.129.212])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u71DQxex006780
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 1 Aug 2016 09:27:00 -0400
Message-ID: <1470058019.3971.13.camel@redhat.com>
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Date: Mon, 01 Aug 2016 15:26:59 +0200
In-Reply-To: <20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
References: <1469723896-28049-1-git-send-email-wei@redhat.com>
	<20160729065453.qq44y2hxohizk3yw@hawk.localdomain>
	<1470053099.3971.11.camel@redhat.com>
	<20160801130808.2igpsx52opi7ogvk@kamzik.localdomain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 01 Aug 2016 13:27:02 +0000 (UTC)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J3M57i2GwMII

On Mon, 2016-08-01 at 15:08 +0200, Andrew Jones wrote:
> > I'm not sure a warning is enough: if I start a guest and
> > explicitly ask for a PMU, I expect it to be there, or for
> > the guest not to start at all. How does x86 behave in this
> > regard?
>=C2=A0
> Peter had a good suggestion for this. We need to wrap the property
> addition in an arm_feature check like the has_el3 property. That will
> remove it from all cpu types that don't support it.

Wouldn't that mean that you'd be unable to use

=C2=A0 -cpu foo,pmu=3Doff

if CPU model 'foo' doesn't support a PMU? I'd expect that
to work.

I've played around with this a bit on x86 and it doesn't
look like it necessarily behaves the way I'd expect it to,
either, so maybe this is just a case of my expectations
being unreasonable? :)

--=C2=A0
Andrea Bolognani / Red Hat / Virtualization
