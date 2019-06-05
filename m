Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3641678wrg;
        Wed, 5 Jun 2019 13:34:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpZnKgPoAGslQXGJjvPoCdPAKRF0NqOEQGc/j+1OwyZQPAltCFV/SlJKPPrN/7NHS2SptR
X-Received: by 2002:ac8:3918:: with SMTP id s24mr37237081qtb.226.1559766854160;
        Wed, 05 Jun 2019 13:34:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559766854; cv=none;
        d=google.com; s=arc-20160816;
        b=dkfRtL14jjl4k+/WvFsyy8gxSitnFkthNtPJ3XfJj2e71vPfvPVwOUfuqy0il6BsDS
         NDzxQ/1uke/XRvlbPgFkobxt0JrjZn4RDvn22v8VWtQnaCISPjAuf1MOhX8iTOGFFRxa
         OD1c2uNTDdbpwcOGnC2jEwJIGaAxdxvQR2OMHT7ameffr8o+EbZntAW+YRKW+NxqfMCq
         ISzzuAm2XvBufJdU6yv92mv+ECF4UyqemQLZm0MhL4dZFcRoYtJOZdWUtA/3NDYhpf+Q
         QH7YROTOUjyQbZwWoJL4/gy9tZaO7VGz9edZEYtrYpMAyJCe2LFyqTyWEGXbgXhouuAM
         +eBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=I4YjWYdacRhE5/8lBw/PZZ7wXuyuWFyGbHzXDb5ZgEs=;
        b=Km+XKRr4hlg/+JQpkTh66yHOn64F3GC2BBJXHScnPiETuLGJgCrp2ywtMr+bv/FziE
         4bFLA+vp+oKm6dlueLrHxkWpdChvatEOSzoEylspppKlbTceG5mPT9Hx9Xa2t2AuzPc8
         EFI5tSEB//07yEy49OT3O908+4tTxajr4WCOtkZAnyLxKItwoq1CfIpQmoXS2Pe+rzlw
         8EfSdEbt+AVS+o3HZ4LnDZd8z7r+6IV9S/xNieE3d9VSSS4V6tldHF/cjVpkM7QfDYGe
         8OHfAqKLss2I+PcpIcdFzq6jQC6VAlAVFpnCkGIpHcPUoFOQ3yzOSJ/23hbtb2hu2+gK
         BRzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h64si397506qkd.193.2019.06.05.13.34.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Jun 2019 13:34:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYcbt-0002R6-Lz
	for alex.bennee@linaro.org; Wed, 05 Jun 2019 16:34:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYcbl-0002Qo-R1
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:34:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYcbi-00059M-SS
	for qemu-arm@nongnu.org; Wed, 05 Jun 2019 16:34:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40764)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hYcbg-00051d-7y; Wed, 05 Jun 2019 16:34:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5D8377E422;
	Wed,  5 Jun 2019 20:33:50 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9798D619A9;
	Wed,  5 Jun 2019 20:33:37 +0000 (UTC)
Date: Wed, 5 Jun 2019 17:33:35 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Message-ID: <20190605203335.GE22416@habkost.net>
References: <20190312234541.2887-1-philmd@redhat.com>
	<20190312234541.2887-3-philmd@redhat.com>
	<20190522205234.GY10764@habkost.net>
	<1204725743.24201394.1558559144548.JavaMail.zimbra@redhat.com>
	<1088d160-20c1-00ed-b494-fede1a3a8410@redhat.com>
	<1894627419.24355320.1558618806274.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1894627419.24355320.1558618806274.JavaMail.zimbra@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 05 Jun 2019 20:33:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test:
 add a test for the Raspberry Pi 2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k1wWemfAxr0Y

On Thu, May 23, 2019 at 09:40:06AM -0400, Cleber Rosa wrote:
> ----- Original Message -----
> > From: "Philippe Mathieu-Daud=E9" <philmd@redhat.com>
> > To: "Cleber Rosa" <crosa@redhat.com>, "Eduardo Habkost" <ehabkost@red=
hat.com>
> > Cc: qemu-devel@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>=
, qemu-arm@nongnu.org, "Philippe Mathieu-Daud=E9"
> > <f4bug@amsat.org>, "Andrew Baumann" <Andrew.Baumann@microsoft.com>, "=
Gerd Hoffmann" <kraxel@redhat.com>
> > Sent: Thursday, May 23, 2019 5:29:22 AM
> > Subject: Re: [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test: add=
 a test for the Raspberry Pi 2
> >=20
> > On 5/22/19 11:05 PM, Cleber Rosa wrote:
> > > ----- Original Message -----
> > >> From: "Eduardo Habkost" <ehabkost@redhat.com>
> > >> On Wed, Mar 13, 2019 at 12:45:41AM +0100, Philippe Mathieu-Daud=E9=
 wrote:
> > >>> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > >>>
> > >>> Similar to the x86_64/pc test, it boots a Linux kernel on a raspi=
2
> > >>> board and verify the serial is working.
> > >>>
> > >>> If ARM is a target being built, "make check-acceptance" will
> > >>> automatically include this test by the use of the "arch:arm" tags=
.
> > >>>
> > >>> Alternatively, this test can be run using:
> > >>>
> > >>>     $ avocado run -t arch:arm tests/acceptance
> > >>>     $ avocado run -t machine:raspi2 tests/acceptance
> > >>>
> > >>> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > >>
> > >> We're getting timeouts on travis-ci:
> > >> https://travis-ci.org/ehabkost/qemu/jobs/535468057#L3289
> > >>
> > >> I don't know yet if the guest is hanging, or if we just need to
> > >> increase the timeout.  I could reproduce the timeout locally,
> > >> too.
> >=20
> > That's odd, I can't reproduce (this test is quicker than the followin=
g
> > test_arm_emcraft_sf2 which start u-boot then timeouts and start the k=
ernel).
> >=20
> > My guess is network issues, since this test use a different mirror:
> > archive.raspberrypi.org
> >=20
>=20
> It could be a network issue, it could be something else.  I think the v=
ery
> first step, and I'd urge us to get that on master ASAP, is to show the
> entire logs in CI, I mean:
>=20
> ---
>=20
> diff --git a/.travis.yml b/.travis.yml
> index 6fd89b3d91..fd8f6ca2d2 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -225,7 +225,7 @@ matrix:
>      # Acceptance (Functional) tests
>      - env:
>          - CONFIG=3D"--python=3D/usr/bin/python3 --target-list=3Dx86_64=
-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-=
softmmu,alpha-softmmu"
> -        - TEST_CMD=3D"make check-acceptance"
> +        - TEST_CMD=3D"make AVOCADO_SHOW=3Dtest check-acceptance"
>        addons:
>          apt:
>            packages:

I have applied this change on python-next.  The failure can be
seen here:
https://travis-ci.org/ehabkost/qemu/jobs/541758418#L4033

While we don't fix this, I'm removing this test case from the
queue, so I can send a pull request.  Sorry for taking so long to
act on this.

--=20
Eduardo
