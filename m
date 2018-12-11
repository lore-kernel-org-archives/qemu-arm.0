Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp870892wrt;
        Tue, 11 Dec 2018 09:45:32 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UgbH/UKXYsTBV51X4sTJL2661ergotCx1I5ElI+oOy/Jjbl17GYAj2FllRPcO0R1v/4ggU
X-Received: by 2002:a37:7885:: with SMTP id t127mr15834151qkc.323.1544550332351;
        Tue, 11 Dec 2018 09:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544550332; cv=none;
        d=google.com; s=arc-20160816;
        b=TER3zTGyyvBGxCgu/9gtKjnmI7tuffPbdB+/wjCQ/3fdwenuo7/SEbu/Lcymcm+e3U
         yANzV2rHHcQB0pxbTxZSlEM0naFCEdEldFtbalOCJn0p2vKDGVFzAlAjSOFtA6xgP6ft
         dVXTOhddF5UMAwHqAvIQthg9wDcqf3GZlWQU9PeFULsjIgRUsqEaZiWrWYroBL52lzAx
         DwBdqLkQAOqnUohq68N8+KfuNMch+yP4EMzXgUS/7UKXpXk6rIjQHdzsQOEb/DCDT1dh
         99qtgNV6gSc1RX30bSh/eXsJcmFk4avWRn+ENhtjvUHXuBbflwJ0GTGLIQUkM6aqpCHD
         hSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=AZmwXBDrgEG4hEtSq2bHAq695WzsZcAf6iN3ao5Tcg8=;
        b=DeJAIZPTDsdzXLHjxxHkxGONSeTTEMjnwng1h/ZrSR4nVsp3u7ke/P6eq+MiIsavux
         CvPW9OFOjWd2wFLKevwoy+zoFjB6ZvrEcVnhapIbgcO4M3ERL4Iwo1yM8AV9VPvRvUZJ
         0/rumObdGtNzWb6rtksqTRaGlNWjEPFGWIlh2txvhDnr/YF4dnQGjdMqW5+4MSW4U2IN
         Cr+xrvd9v7kbdDAn4jCNc5wGRTnjbEkspP2TSsJbIOdF1uCBJ8vQsdOxYczsbHw/9N0o
         Ojt/phacJJH0q/hllbPGpHB5Eq/wgpFZ81K6kis4nHXFH6QXYxjNsRTx4NePigQzCYMy
         TIXw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n10si8969136qtb.25.2018.12.11.09.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 09:45:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40476 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWm67-0007eK-7d
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 12:45:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWm49-0004ix-HC
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 12:43:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWm44-0005S9-Oi
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 12:43:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gWm43-0005L8-1M; Tue, 11 Dec 2018 12:43:24 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F04D87633;
	Tue, 11 Dec 2018 17:43:10 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 436BD60C61;
	Tue, 11 Dec 2018 17:43:05 +0000 (UTC)
Date: Tue, 11 Dec 2018 15:43:03 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181211174303.GG7141@habkost.net>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
	<20181204142023.15982-9-marcandre.lureau@redhat.com>
	<20181211142310.GB20015@habkost.net>
	<CAJ+F1CKF7_MEtZNY2FEot9dG-RZQwGeZZ7+3+q1QgD98koF2SA@mail.gmail.com>
	<20181211165229.744f0c07@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181211165229.744f0c07@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 11 Dec 2018 17:43:10 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v5 08/19] hw: apply
 machine compat properties without touching globals
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IF4y0nFXgj4H

On Tue, Dec 11, 2018 at 04:52:29PM +0100, Igor Mammedov wrote:
> On Tue, 11 Dec 2018 18:30:32 +0400
> Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com> wrote:
>=20
> > Hi
> >=20
> > On Tue, Dec 11, 2018 at 6:24 PM Eduardo Habkost <ehabkost@redhat.com>=
 wrote:
> > >
> > > I have specific questions about the approach we are using to
> > > eliminate the macros.
> > >
> > > My main goal when asking this to be moved to a separate patch is
> > > to not make this discussion block the register_global_properties() =
&
> > > device_post_init() changes (which look good to me).
> > >
> > >
> > > On Tue, Dec 04, 2018 at 06:20:12PM +0400, Marc-Andr=E9 Lureau wrote=
:
> > > [...] =20
> > > > -#define VIRT_COMPAT_3_0 \
> > > > +static GlobalProperty virt_compat_3_0[] =3D {
> > > >      HW_COMPAT_3_0
> > > > +}; =20
> > >
> > > What about moving the array inside virt_machine_3_0_options()? =20
> >=20
> > Sure
> >=20
> > > =20
> > > >
> > > >  static void virt_3_0_instance_init(Object *obj)
> > > >  {
> > > > @@ -1883,12 +1884,14 @@ static void virt_3_0_instance_init(Object=
 *obj)
> > > >  static void virt_machine_3_0_options(MachineClass *mc)
> > > >  {
> > > >      virt_machine_3_1_options(mc);
> > > > -    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_3_0);
> > > > +    compat_props_add(mc->compat_props,
> > > > +                     virt_compat_3_0, G_N_ELEMENTS(virt_compat_3=
_0));
> > > >  }
> > > >  DEFINE_VIRT_MACHINE(3, 0) =20
> > >
> > > This is nice, because it's basically the same amount of
> > > boilerplate code, but I would find a NULL-terminated array much
> > > easier to use than having to use G_N_ELEMENTS(). =20
> >=20
> > But easier to get wrong too. I prefer the explicit N arguments. (it
> > also gives some flexibility, since you can point to inner pointer +
> > size, although we don't care at this point)
> +1 to explicit array size,
> it also allows to drop terminating NULL entry in compat declarations

I don't mind using G_N_ELEMENTS if you really think it's better,
but I wonder if it will be an obstacle for making
  compat_props_add(compat_props, hw_compat_3_0, ...)
work, because the size of hw_compat_3_0 won't be known by
compat.h or spapr.c.

--=20
Eduardo
