Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3700338wrx;
        Mon, 4 Mar 2019 07:02:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqySHBeUMmhSWUcM3OIrnG30ptC5wecqLQr/+z0J5VuLbeXo6kaGle43uE4+ePEm2y79eMyV
X-Received: by 2002:ac8:2ea6:: with SMTP id h35mr14923225qta.181.1551711770839;
        Mon, 04 Mar 2019 07:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551711770; cv=none;
        d=google.com; s=arc-20160816;
        b=gzh0f4k3gQcNHnM56M7X5U/qEH3UPEHiRbfNXKUmzn4uEwOUtAFjX/tQ30emG4MWYL
         Qe+NuABE7BSwpL318k7yA9NbZSgYeiSO2D3ZuxAIEJoQdmcDHUfMiy8EbkpWDV3hZnou
         cNsXF4o3n3qGYzRr4aMDeglk0cVRILE5EYA4bZ+9csZ0IZazKjMoT+YHdYqJRGOn4GA6
         YYByu/lfCJ5Kci7nquIRJctd/ovnUjRFYYhoMgqWB5iwuJPJ933L+/2df8q0M8IiCZ6k
         09iLK529EYSwmY6H6F1OJ4JDav0oUEh3oKDvsdpcDzN/Upxr+G/ogVS7Og+xYLk/+JDh
         vXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=mqotSjtDijwj5/Tu+vH8sCkfnjtySIkViv1+VO21U8U=;
        b=hIU7aefk+QatpSVUlNb+9l6Cxp0m8+vLOsOrax3S1JAB1l62zRg/Z58Vy48cDEf/i3
         N/kEnoonyuir61Z5UN3jIBAuvVIwUwHuzvQNHfeIsEvh6/JwYcUITkLLtzFOmy3UWw7z
         fwTsXsjOUv9bdE476Ge2lCQ7Ny0RJkH7N76LSEsaWQffHKrn3044ZDC4elpMfJG3EDZo
         G/0pWThw+Q8oe2ZODEMlfoDhFcrvFf+drI81Nz5Dn5C7HteqSHPgSugDg41wbAa+1nvk
         V60P6vkeANy1Pz3PD9tLu3Pc461LmArfnHP+ivSKfPvs8HdfkLHu9ryo0KmWhLBCuxeY
         1jnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b16si3290820qtq.32.2019.03.04.07.02.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 07:02:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0p7C-0007Pi-AQ
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 10:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0p6y-0007OY-A2
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:02:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1h0p6s-0004bl-BE
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 10:02:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1h0p6s-0004ZT-1C; Mon, 04 Mar 2019 10:02:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B510C30821B2;
	Mon,  4 Mar 2019 15:02:28 +0000 (UTC)
Received: from redhat.com (ovpn-112-62.ams2.redhat.com [10.36.112.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC3A45D732;
	Mon,  4 Mar 2019 15:02:21 +0000 (UTC)
Date: Mon, 4 Mar 2019 15:02:18 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190304150218.GN4239@redhat.com>
References: <1551454936-205218-1-git-send-email-imammedo@redhat.com>
	<1551454936-205218-2-git-send-email-imammedo@redhat.com>
	<20190301154947.GJ21251@redhat.com>
	<20190301183328.20b63e23@redhat.com>
	<20190301174806.GN21251@redhat.com>
	<15464582-e8a6-6654-7679-15d87c10af38@redhat.com>
	<20190304145510.57c73177@redhat.com>
	<20190304135909.GL4239@redhat.com>
	<20190304155457.206a7ff7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190304155457.206a7ff7@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 04 Mar 2019 15:02:28 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-ppc] [Qemu-devel] [libvirt] [PATCH 1/2] numa:
 deprecate 'mem' parameter of '-numa node' option
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
	ehabkost@redhat.com, libvir-list@redhat.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bdIaMWPOVZWW

On Mon, Mar 04, 2019 at 03:54:57PM +0100, Igor Mammedov wrote:
> On Mon, 4 Mar 2019 13:59:09 +0000
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>=20
> > On Mon, Mar 04, 2019 at 02:55:10PM +0100, Igor Mammedov wrote:
> > > On Mon, 4 Mar 2019 09:11:19 +0100
> > > Thomas Huth <thuth@redhat.com> wrote:
> > >  =20
> > > > On 01/03/2019 18.48, Daniel P. Berrang=C3=A9 wrote:
> > > > [...] =20
> > > > > So I think this patch has to be dropped & replaced with one tha=
t
> > > > > simply documents that memdev syntax is preferred.   =20
> > > >=20
> > > > That's definitely not enough. I've had a couple of cases already =
where
> > > > we documented that certain options should not be used anymore, an=
d
> > > > people simply ignored it (aka. if it ain't broken, don't do any c=
hange).
> > > > Then they just started to complain when I really tried to remove =
the
> > > > option after the deprecation period. =20
> > >  =20
> > > > So Igor, if you can not officially deprecate these things here ye=
t, you
> > > > should at least make sure that they can not be used with new mach=
ine
> > > > types anymore. Then, after a couple of years, when we feel sure t=
hat
> > > > there are only some few or no people left who still use it with t=
he old
> > > > machine types, we can start to discuss the deprecation process ag=
ain, I
> > > > think. =20
> > > Is it acceptable to silently disable CLI options (even if they are =
broken
> > > like in this case) for new machine types?
> > > I was under impression that it should go through deprecation first.=
 =20
> >=20
> > Yes, it must go through deprecation. I was saying we can't disable
> > the CLI options at all, until there is a way for libvirt to correctly
> > use the new options.
>=20
> I'm not adding new options (nor plan to for numa case (yet)),
> -numa node,memdev is around several years by now and should be used
> as default for creating new configs.
>=20
> In light of keeping 'mem' option around for old machines,
> Deprecation should have served for notifying users that legacy
> options will be disabled later on (for new machines at least
> if no way found for migration compatible transition for older ones).
>=20
> What I'm mainly aiming here is to prevent using broken legacy options
> for new VMs (like in RHBZ1624223 case) and deprecation is the only way
> we have now to notify users about CLI breaking changes.

The idea of doing advance warnings via deprecations is that applications
have time to adapt to the new mechanism several releases before the old
mechanism is removed/disabled.  Since the new mechanism isn't fully
usable yet, applications can't adapt to use it. So we can't start the
deprecation process yet, as it would be telling apps to do a switch
that isn't possible for many to actually do.

In the meantime, qemu-options.hx could be updated. It documents both
"mem" and "memdev" currently but doesn't tell people that "memdev" is
the preferred syntax for future usage / warn against using "mem".


Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
