Received: by 10.80.163.71 with SMTP id 65csp3791783edn;
        Fri, 7 Oct 2016 07:10:13 -0700 (PDT)
X-Received: by 10.55.156.18 with SMTP id f18mr18805976qke.177.1475849412994;
        Fri, 07 Oct 2016 07:10:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y123si5279535qka.7.2016.10.07.07.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Oct 2016 07:10:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36140 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsVqm-0002ps-FI
	for alex.bennee@linaro.org; Fri, 07 Oct 2016 10:10:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bsVqi-0002n5-3H
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:10:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1bsVqc-0003Jp-CI
	for qemu-arm@nongnu.org; Fri, 07 Oct 2016 10:10:07 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1bsVqc-0003JR-2W; Fri, 07 Oct 2016 10:10:02 -0400
Received: by mail-wm0-x244.google.com with SMTP id 123so3166451wmb.3;
	Fri, 07 Oct 2016 07:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HRZOpCTfICjfPwjZckjITYWbMphzZwlQt+Mdbu5cTG0=;
	b=P+XFP2nLkjDr5+XGg/RK70rT/jbhMLjCGobxZeJgRS8LKkE3JROHR22/c4GewtnO6H
	t61vnQ7uNHd9/DmSkwLa3NaorsGxxOhJKcItauYhZbw0mOIJQsr4q+xnB278vPYb6J6J
	b1/33GO3g8JwGeiE5BPrsbatiwvvLFBZFZ93FkuoTNLqMmpi8nyxYoBe+i9mTWpybgFo
	Gf/E+XFphnv27rDi1aDyXQWzRMGhtA7Bf0vngIFRunJvmz4SYBCNRRlIC9x0T8PEStFP
	wzwMhGxrO7g3Z1YJh6co7D81sMc/LKrQPAko0pIU78YxtPEV8r8I+a12HMexGwwp0BLY
	aPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HRZOpCTfICjfPwjZckjITYWbMphzZwlQt+Mdbu5cTG0=;
	b=E28Lbq3luFvFhwXkAjuEaU3mPDsdzQhuKl+HemTnSIAvpYYoXmyrKasJ1muWkxxCEn
	JCP5bRNmFADOPQAziHojR9Bk48tErzL3jLpFih/pAU+LoK/VQfIZiR7vochkQ3XPEYiA
	WWbhOH9fXvkHFhIjzUjW9f/QQs+1+z+uSeiuO7gqFFH9CwzDAiOgPTWlxiXbO9qEbz9Z
	8DAOn6etnMkZTn+4ge0PfNKaLIwdEyHdn1J6rcKLfGDBZuzrwt21h0UPfaBuuZlkLmM4
	v9RE7iRg9B6tgrYLhMaorY95Kp2Ov2/j7Mq2t8LgS2FdRshRL65j++gomLFDh57K5+D/
	HJ5w==
X-Gm-Message-State: AA6/9RlByAWxTsn8wVZFTfLfi92OGcUmdV5DSABUlIotwAHA45utF4lflrJ9HdjZPfvUrQ==
X-Received: by 10.28.56.196 with SMTP id f187mr2191329wma.73.1475849400892;
	Fri, 07 Oct 2016 07:10:00 -0700 (PDT)
Received: from localhost (host81-154-58-16.range81-154.btcentralplus.com.
	[81.154.58.16])
	by smtp.gmail.com with ESMTPSA id q5sm3199426wma.15.2016.10.07.07.09.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Oct 2016 07:10:00 -0700 (PDT)
Date: Fri, 7 Oct 2016 15:09:59 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161007140959.GA1831@stefanha-x1.localdomain>
References: <1473520054-402-1-git-send-email-m.olbrich@pengutronix.de>
	<CAFEAcA9UoqKSqH+b_zF435u+pZQCdGWu_KDGFW=MH+71Q_j6ng@mail.gmail.com>
	<20160923063317.kmsbek755fcun5ea@pengutronix.de>
	<CAFEAcA-MCsLWEFWcFFQqgOxUb-su+k=tw57X2-z85k1u7+n1FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jRHKVT23PllUwdXP"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-MCsLWEFWcFFQqgOxUb-su+k=tw57X2-z85k1u7+n1FA@mail.gmail.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/boot: allow using a
 command line specified dtb without a kernel
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Michael Olbrich <m.olbrich@pengutronix.de>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IfPjrqbuEz4B


--jRHKVT23PllUwdXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2016 at 06:58:37PM -0700, Peter Maydell wrote:
> On 22 September 2016 at 23:33, Michael Olbrich <m.olbrich@pengutronix.de>=
 wrote:
> > On Thu, Sep 22, 2016 at 05:23:17PM +0100, Peter Maydell wrote:
> >> On 10 September 2016 at 16:07, Michael Olbrich <m.olbrich@pengutronix.=
de> wrote:
> >> > diff --git a/vl.c b/vl.c
> >> > index ee557a1d3f8a..bbea51e0ce7d 100644
> >> > --- a/vl.c
> >> > +++ b/vl.c
> >> > @@ -4335,11 +4335,6 @@ int main(int argc, char **argv, char **envp)
> >> >          exit(1);
> >> >      }
> >> >
> >> > -    if (!linux_boot && qemu_opt_get(machine_opts, "dtb")) {
> >> > -        error_report("-dtb only allowed with -kernel option");
> >> > -        exit(1);
> >> > -    }
> >> > -
> >>
> >> I can see why you want this change, but what worries me a little
> >> is that this is changing the behaviour of -dtb for all QEMU
> >> target architectures, not just ARM (they no longer get a helpful
> >> message on user error). I'm not sure how to address that, though.
> >
> > Would a 'if !arm' be possible or useful here?
>=20
> It's not quite that simple :-)
>=20
> I think we have two choices:
> (1) just go ahead and remove the error-check, on the basis that:
>  * for some boards -dtb is useful even without -kernel
>  * -dtb might be ignored even with -kernel if the specified
>    kernel isn't a DTB-aware kernel, but we ignore that
>  * -dtb is ignored even with -kernel for target archs/boards
>    which don't support or use DTB, and we don't warn about that
>  * we don't warn about -kernel being useless for target boards
>    that don't pay any attention to it
> (2) add some kind of field to MachineClass indicating whether
>    the machine can handle dtb files with/without a kernel
>    (and perhaps also whether the machine supports -kernel at all),
>    use that to gate the warning messages, and update all the
>    machines to correctly indicate what they can or can't handle.
>    This would let us give warning messages when the user asks
>    for something we're going to ignore (including letting us
>    fix up some of the cases we don't currently deal with as
>    enumerated above), but it would be a fair chunk of effort
>    for a fairly small user-friendliness gain
>=20
> Thinking about it more, I'm inclining towards the simpler
> option (1). Paolo, do you have an opinion here ?

The error check doesn't seem worth the effort.  It's a convenience
message to notify users that their configuration is broken but we can't
detect all the cases where it's broken.  It doesn't seem like a good
business to be in :).

Stefan

--jRHKVT23PllUwdXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJX96y3AAoJEJykq7OBq3PIEB8IAJuZE1qkL0kEwasguqu8qtqR
5AlU7p/zjzxBqkrn+I3jrvuNzOr6u9dXGXUXH/J6DJh2OFM6Ze2HPwx66XuLab3y
XbfmTEOmRb8SO3aBVlkIh4sa/A/12cDBRUah7uua/dMBGCvM+n+KJwIQf8d34hlV
EQBZL5sQDFRXZIFEkibp4hETbZ2kjl41eyBLOaRMcCs6dMuJZ40f7mIDjQfeBwHo
X9xTK2q3wJTd9YOU1HdytADw7BFj74M1GBXa26yyvqKUMNlIXWBhZGVxbohXH0QA
BqtqMXbgAo88KtQPLUM0ShpEMYf7HVfv+JHBLBEATt/qnStsPrZthdwmfODUfRs=
=U3HV
-----END PGP SIGNATURE-----

--jRHKVT23PllUwdXP--
