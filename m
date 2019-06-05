Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3662365wrg;
        Wed, 5 Jun 2019 14:00:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdlh2si9kSPVI+d9C6cwjTcwjrfCWdn5DE+4Ma6oyCHws3yDq1NVcdJKLdv6AWFeafKFQd
X-Received: by 2002:ac8:2537:: with SMTP id 52mr36592207qtm.5.1559768432608;
        Wed, 05 Jun 2019 14:00:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559768432; cv=none;
        d=google.com; s=arc-20160816;
        b=T8Pj3O8GTwaLi4JEFPGVzjO5gFjpOgstu6gPY2O5cIvngFkQJMZRZpUGZ3XKLarojt
         /NC6vHBEHB5T6ehlXDCB+9t5lj0UVAicdeJwmwm1UX5AzzpK5USVDaYtm9/8sZeDrKPy
         gNKaTxZ/oRqV+DJhLjQ4vUNFiENaXGReI4wYYV+uFfLGyoE1oRxGCBxFEktgqYi/1B2v
         LMDWO7RA6ldpx8+llV9ulr36xKyl2rQMU1QczwpG9/JtDmdmxn6DkAspMOunOzhJhOSJ
         sTDeaGHDB+EUPX12C7As56sTrUlslelrd5aJRv0lgZ1MQLl7WOZTgcHd106+7vlguCXR
         idxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=Evm2FkhSXBMqxtrJulSFSw08EDOu5Ms9rFqDEsNIt7w=;
        b=nDFjcq4eXaG5+CtaZPLLjtq0QhInUjUbotjDDm7Rzuii+1If3P4aF9RTYv+d18JPJ9
         2mTCy1aBAO+5L0WvXTGLg7s1grYz8IZRWJlqULLwW4sjhBEDbnbs4/qToum5c0dIqjQ4
         SdsBhk3qm6TE3o2Fe3AW4UJYT4QGqaKaxOZOGdNSiLHyTYZHTzE8BcNnVWsOwO24qn/x
         845GNTjp3Kp+wIhwjaZc8BL/0ukSEXRZwUKDL2DZ6K433F3aEYOmNVIwiHljt0BY5Wl4
         V6bNDVntsvcJBy1IEn/WjuC2XDnRXHxrkhhMm5xPcRoxp6E7LWhidRjuedag+GT2gxSx
         LfEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 55si1282143qvn.124.2019.06.05.14.00.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 14:00:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49950 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYd1M-0000a7-3b
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 17:00:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43871)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYcl5-0002d0-NR
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:43:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYcl4-0004MN-4R
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:43:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40122)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hYcl3-0004H1-Su; Wed, 05 Jun 2019 16:43:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B1D6530593D8;
	Wed,  5 Jun 2019 20:43:29 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 50C0A29AD9;
	Wed,  5 Jun 2019 20:43:24 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:43:23 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Message-ID: <20190605204323.GF22416@habkost.net>
References: <20190520220635.10961-1-f4bug@amsat.org>
	<20190520220635.10961-3-f4bug@amsat.org>
	<20190605160659.GB7080@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190605160659.GB7080@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 05 Jun 2019 20:43:34 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] BootLinuxConsoleTest: Test
 the SmartFusion2 board
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair@alistair23.me>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KGOkA77/WHDJ

On Wed, Jun 05, 2019 at 12:06:59PM -0400, Cleber Rosa wrote:
> On Tue, May 21, 2019 at 12:06:35AM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > Similar to the x86_64/pc test, it boots a Linux kernel on an
> > Emcraft board and verify the serial is working.
> >=20
> > If ARM is a target being built, "make check-acceptance" will
> > automatically include this test by the use of the "arch:arm" tags.
> >=20
> > Alternatively, this test can be run using:
> >=20
> >   $ avocado run -t arch:arm tests/acceptance
> >   $ avocado run -t machine:emcraft-sf2 tests/acceptance
> >
>=20
> The pattern accepted as a tag currently doesn't include a dash, see:
>=20
>    https://avocado-framework.readthedocs.io/en/68.0/ReferenceGuide.html=
#docstring-directives-rules
>=20

Why isn't this causing test jobs to fail?

This patch is already queued on python-next, should I remove it?


> My suggestion is to replace the dash for an underline.  This was done
> on the s390 test:
>=20
>    :avocado: tags=3Dmachine:s390_ccw_virtio

I would love if we stopped using the docstring to store
machine-readable data and used Python class attributes or
methods, like most Python APIs do.  e.g.:

  class MyTest(avocado.Test):
      tags =3D {'machine':'s390-ccw-virtio'}

      def test_my_feature(self):
          ...


I understand the Avocado runner currently tries to not run any
test code at the "list" step.  But can we have a mode where it
will actually load the Python module and look at the class
objects directly, instead of trying to parse the Python code
without evaluating it?

> [...]

--=20
Eduardo
