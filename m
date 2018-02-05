Received: by 10.28.71.27 with SMTP id u27csp2328492wma;
        Mon, 5 Feb 2018 02:40:15 -0800 (PST)
X-Google-Smtp-Source: AH8x225mwi9uq91T4T2o2koGA0LIA4Sp2/EKnNJPeMcdB5E4j7PQ1J4s8gyKXvQPewgs1gAZ5jGP
X-Received: by 10.37.9.13 with SMTP id 13mr5638950ybj.125.1517827214955;
        Mon, 05 Feb 2018 02:40:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517827214; cv=none;
        d=google.com; s=arc-20160816;
        b=xRCnCgAVgYf47wizSy8E0TNPteLxyLGYcqCddUE1NkPtSCmYkjdU07dkixnrw+H47v
         BS/Vvw5+kM1bi2VJNo9sZQZXt5NQxM1GqDirXiOAJDc3jG0XdLy9EmTqYSPutdeR88p1
         Bcsyj24AVg7CjRKmuy0IcH/tVbhdulPmQYog0jIN/vYsQrZRwO80yzmZj6Rl0F2bn4We
         OTaU4/5fORkCMmO9LOtJMmYwHWkKNNnonZysj/z2scizYo35xUsQgdtJ2IIvHP2qSIVO
         t4UKlSpgxatMuqhiwtD2/upYEFlvwfF7mMBV9mgTKc7+3vYpcRChFmU/lfscEN9+X5D8
         EnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=Y/38AdjTPY+LMyNWSVrK8fGXKMztd++uh7CclAS32vY=;
        b=UuAFDN+8ofYkWDOJdlYaqPmEzJK3CoaORupxhjlu+lpij6C3DhCGyAnwcDAiJbscE9
         wawnQFrn+JYJ0Y42xEujsM+j/5HLWYPjjFxqjntZvzm+AHv7DKFi5bywBiRKRLw8Gvdr
         D7Eop2I90x4zkMIvzzgIQejcaJbgCeCjLtAtviHsNN6qFv4WK1+THB+66TaFX2bQnyPo
         odvgZyH3l35xtBQ6TPdR2ItsyL079/ZsNNHveDL6mBpy9se9uALRMSAOyzCp1W7j6hXS
         zmOHg6NIgMkWsv59e5mFbuIHLdtT2Ns4m7vlkTnYp5ohZU+shBKA/FyU7wYVMpe5URBA
         HFng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r206si1396299ywg.655.2018.02.05.02.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Feb 2018 02:40:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eieC6-0005pu-Ft
	for alex.bennee@linaro.org; Mon, 05 Feb 2018 05:40:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eieBu-0005ne-9J
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:40:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1eieBr-0000c5-6x
	for qemu-arm@nongnu.org; Mon, 05 Feb 2018 05:40:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54452)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1eieBr-0000bQ-1K; Mon, 05 Feb 2018 05:39:59 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 739CD4A6FA;
	Mon,  5 Feb 2018 10:39:57 +0000 (UTC)
Received: from localhost (unknown [10.43.2.134])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DCB65D6A2;
	Mon,  5 Feb 2018 10:39:55 +0000 (UTC)
Date: Mon, 5 Feb 2018 11:39:54 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180205113954.4dc30b5f@redhat.com>
In-Reply-To: <CAFEAcA-0wV+DDwFEEnB1=VvUSOsG2yQRCDFBHRF+O=gayPGLVQ@mail.gmail.com>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-5-git-send-email-peter.maydell@linaro.org>
	<d8c2c2ca-5046-f19b-9514-d3cbef3b7c3a@amsat.org>
	<CAFEAcA9k2KKrXk+2LQd+X7-RFuDQO96bYSo8xi81zfb80+ApFg@mail.gmail.com>
	<fde1ca29-873b-5e5c-76d3-d620301c924b@amsat.org>
	<CAFEAcA-0wV+DDwFEEnB1=VvUSOsG2yQRCDFBHRF+O=gayPGLVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 05 Feb 2018 10:39:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/6] target/arm: Add "-cpu max"
 support
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UXYOq62xWS3Z

On Fri, 2 Feb 2018 17:54:43 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 26 January 2018 at 15:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> > On 01/26/2018 11:33 AM, Peter Maydell wrote: =20
> >> On 26 January 2018 at 14:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote: =20
> >>> Why not use arm_any_initfn() here? =20
> >>
> >> That function (and the 'any' cpu) are deliberately only
> >> included in the linux-user binaries, not the system-emulation binaries=
. =20
> >
> > why not use the V8 features? =20
>=20
> What v8 features?
>=20
> >> (Also arm_any_initfn() only initializes userspace-visible stuff, it
> >> doesn't provide ID register values etc for kernel-visible things.) =20
> >
> > I'd still use an unique arm_max_initfn() such
> >
> >   // initializes userspace-visible stuff
> > #ifndef CONFIG_USER_ONLY
> >   // initializes kernel-visible things
> > #endif =20
>=20
> >>> Actually what seems cleaner is to move "any" features here, and kill =
the
> >>> "any" cpu, using "max" for this purpose. =20
> >>
> >> We can't kill 'any', that would break back-compatibility
> >> of command lines. =20
> >
> > and use an alias for 'any' -> 'max' or just
I'd suggest to place easy any -> max compat hack into
arm_cpu_class_by_name()

> >
> >   { .name =3D "any", .initfn =3D arm_max_initfn }, /* backward compat *=
/ =20
>=20
> Yes, we could probably do something similar to this.
>=20
> thanks
> -- PMM
>=20

