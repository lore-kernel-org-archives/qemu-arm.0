Received: by 10.28.71.155 with SMTP id m27csp1635513wmi;
        Thu, 12 Apr 2018 01:20:39 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49U5rFUKEiQ8gO1n4Jw5eTrktLVszfkLFI+1N89kzSpqyVBdW5e+p3DNqhWbRmJ1JhOYtq9
X-Received: by 10.55.24.214 with SMTP id 83mr11639116qky.267.1523521239073;
        Thu, 12 Apr 2018 01:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523521239; cv=none;
        d=google.com; s=arc-20160816;
        b=nhlNGA1L002bbxyqCeRMnPDXr4uTPkXvxSrDJweDnbTJar2b9bHZ0gxuiarT2ly2ej
         zu9WIV1fejzVlJNShTouoy9uEUH5tqr9HOx2g5btvnP7VqMNLtt2wDXFyr+GlA7IqBT2
         gsFaXxiJJH1+ntNQLCgMvTNClsCb2TAxazwWEPZejFNF/8KXvnPEkZ+FDrIltlUQfjqc
         phFYnlV0UsbA55nRXpv+NThaDi3VZ71FNCyjIx+qVvbNpYrs4Dhm6uBe3EBBZ2ax9iq3
         LdAuLbFIHSefWLtZrMvHMvmReW5x5OPjT72Xd9fsWd+FezoCRLJ5UZ5ToO8Q6IpKOXrp
         4WLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=GR7uBTHX3HedyLkWMoUFsfqtm56P9ihdY3p5yJ3onfw=;
        b=uvHe1p0bMl29fBKSre//mjYE55JU5PxGOUToPZmBgUpaMVTbw42MXeAcaK99SISeF8
         VK2UyOQ+QMKmDr0S2A0QUMhtvV5szjV54Jm5t1AZTsjM0L3DXuC07WaUlO/7q1i4if8t
         mBQzRfvtjKLnRSSNyPJg16FumtVxTEbHTMB/t0h8iOOqQXs4/QngrL2ZOiDALT2LsGqN
         XKsFnqfZJ/yibybithmsi9jd2TA+qGNFOIQ2RDWlKAzfI64hCkWR9NZ2S3Ay8MFvHuXb
         jLqdilRMi4BK3UmKyHUIg0hjMs4B4qZljQYSoVxFExn2G6LRr0hOWuizKoBNIKO9UDOo
         mJSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w131si2002733qkw.40.2018.04.12.01.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 01:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6XTC-0005Zp-HJ
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 04:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f6XSo-0005QX-2A
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 04:20:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1f6XSh-0005l3-1U
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 04:20:12 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58432 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1f6XSg-0005k3-RQ; Thu, 12 Apr 2018 04:20:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 302638DC2D;
	Thu, 12 Apr 2018 08:20:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 883B7215CDC6;
	Thu, 12 Apr 2018 08:19:56 +0000 (UTC)
Date: Thu, 12 Apr 2018 09:19:54 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20180412081954.GB31024@redhat.com>
References: <20180409154921.29906-1-wei@redhat.com>
	<20180409155634.GO18283@redhat.com>
	<6bb12858-3b4e-e92f-93ea-b8708c8be870@redhat.com>
	<1523346093.16671.23.camel@redhat.com>
	<20180410085200.GD5155@redhat.com>
	<1523460955.2942.5.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1523460955.2942.5.camel@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 12 Apr 2018 08:20:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 12 Apr 2018 08:20:02 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/1] mach-virt: Change default
 cpu and gic-version setting to "max"
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kf/S8JjSlvcF

On Wed, Apr 11, 2018 at 05:35:55PM +0200, Andrea Bolognani wrote:
> On Tue, 2018-04-10 at 09:52 +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Apr 10, 2018 at 09:41:33AM +0200, Andrea Bolognani wrote:
> > > I figure the people not explicitly specifying a CPU model on the
> > > command line will probably also use '-M virt' instead of versioned
> > > machine types, which means they will get a different guest behavior
> > > after upgrading QEMU regardless.
> >=20
> > Libvirt uses versioned machine types and does not specify -cpu unless=
 the
> > user has added <cpu> to their XML. IOW libvirt assumes the default CP=
U
> > model is stable because that's what QEMU has promised in the past.
>=20
> Hm, you have a point.
>=20
> I wonder how well that works in practice, though. I started a guest
> with no <cpu> element on my laptop and it ended up having
>=20
>   vendor_id	 : GenuineIntel
>   cpu family : 6
>   model      : 6
>   model name : QEMU Virtual CPU version 2.5+
>   stepping   : 3
>=20
> which I guess translates to the qemu64 CPU model, based on the
> description. I have verified the -cpu option is not present on the
> command line.
>=20
> The name seems to imply that if I were using a QEMU release older
> than 2.5 I would get a different CPU model, but maybe the stable CPU
> guarantee you mention is just a fairly recent development.

That model ID string is tied to the machine type, so it is stable. Older
machine types use PC_CPU_MODEL_IDS() in pc.h to ensure they have not
changed.

> I also know that ppc64 performs some trickery if you don't specify a
> CPU model, so by default you get a behavior which is pretty close to
> using -cpu host.
>=20
> Basically I'm wondering how reasonable it is to expect a migratable
> machine and a stable guest ABI when relying on QEMU defaults instead
> of explicitly picking a CPU model.

Provided you have picked a versioned machine type, it is expected that al=
l
other defaults are stable, and that includes CPU models.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
