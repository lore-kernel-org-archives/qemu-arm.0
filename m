Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8088511wrt;
        Tue, 4 Dec 2018 05:49:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VqSa/67N3PV6xGt5C28RgJA8bneNcm/mKI75VMoQfP0XqTzKdpbL6iBgcJxtb1qcmzsfj6
X-Received: by 2002:a37:a703:: with SMTP id q3mr18786419qke.272.1543931351194;
        Tue, 04 Dec 2018 05:49:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543931351; cv=none;
        d=google.com; s=arc-20160816;
        b=aysF6tY0Gxd+moO84ky7pCtFu+aSIbHfti/w5/NkSo/OEdmcJpE3PeS0dEFr264rts
         58n4YRoOUGMcoWrhnzTG6aEPe/t+YARihmuZuQl3pptvgZdcdk8VIOTyxzP1NLyBM+wS
         SLsgI8N4o6BLXp9UZGYoU7Pnuqmux0r1ehxq4O6PpJ/mLL9nz/o0v+oNpCvbMd+BWYss
         1pw1Cfaub9qbQbuyLQE3nnHkevUHmS2d2FJEk6Fs/DfAXe+oGppDDdXMCGOc+BMb0gxE
         gMUIvy0B0OhNY74EB4Of9DLs0BEvjynmjY7BSQ2FH+1nykXsk3vdr1i6SHVNzS6MUEQN
         zwiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=R1/XZkjHFIh73kkkm6wmS0FxL+r0xjHwYT0ZVjHYbWk=;
        b=lLUo8zGR2qr94jeDDlQ09idRMplcgABVEico4Z5XavLrXNabtWSBuMAgHB48X6r1F3
         qS+dj+J6QSrN9EKm+34vjAcbZhvsx7SBT/54qk8hQk1toc6nl1VwIkm5VY+0YXoFZUD1
         ENUGqE3N9dnPvNZr8z/LYBBdIEmmFaQ09uU724gAtgYPnke5IjlaSzm4srTP7dDpNZoa
         KMARCmNh3S8Mg365J9uewDVX6PkUtYz7lt6pHGQDElAfyaqz+IyUPFnYdX3h84eMYBcA
         XcJN12QynhRI0XMMbFxVVidk5IsZxnSCdW+MlzcVlZjqHDzo0FDvJFmrlWBGSqsg5lfH
         8w9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si2932318qvs.160.2018.12.04.05.49.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:49:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUB4Y-0006QF-OA
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:49:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gUB42-0005v4-6O
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:48:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1gUB41-00010k-5f
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:48:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57014)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1gUB41-00010O-09; Tue, 04 Dec 2018 08:48:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5126E307DA35;
	Tue,  4 Dec 2018 13:48:36 +0000 (UTC)
Received: from redhat.com (ovpn-112-67.ams2.redhat.com [10.36.112.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5A4480D90;
	Tue,  4 Dec 2018 13:48:33 +0000 (UTC)
Date: Tue, 4 Dec 2018 13:48:30 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181204134830.GB17825@redhat.com>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<20181204124739.GA17825@redhat.com>
	<CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 04 Dec 2018 13:48:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jn03AlKZq9Nz

On Tue, Dec 04, 2018 at 12:59:51PM +0000, Peter Maydell wrote:
> On Tue, 4 Dec 2018 at 12:47, Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> > After it had merged there were some changes and the question of turni=
ng
> > it into a PCI device was raised. Paolo was concerned that the guest O=
S
> > is in an unknown state (arbitrary locks held, data structures corrupt=
,
> > etc) when panic is fired, so simplicity of the I/O port was desirable=
:
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03309.html
> >
> > Anthony countered that even a PCI device could simply do an outb() in
> > config space:
> >
> >   https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03325.html
> >
> > So it is not clear using a PCI device is in fact a problem in terms o=
f
> > reliability at time of firing.
>=20
> ...and if we'd done it that way in the first place for x86 then
> we wouldn't be having to do anything at all now for Arm.
> That suggests to me that we should do it that way now, and then we
> can avoid having to do a bunch of extra development work for the
> next architecture, or the next interesting Arm board model.

On s390 there's always a panic notifier mechanism as it is a
integral part of the architecture.

On PowerPC, pSeries guests have access to a panic notifier provided
by the firmware.

On x86, as well as pvpanic, there is also a paravirtualized
option defined by the HyperV extensions "hv_crash"

IIUC a PCI based solution would be usable on x86, s390, powerpc (pseries)=
,
aarch64 (virt) and eventually riscv (virt). Of those, it is only
aarch64 and riscv that lack a panic notifier solution today.

I feel like we've already lost from the pov of a standardized solution,
but that doesn't mean we shouldn't still consider using PCI if it does
look like the best otion for arm/riscv.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
