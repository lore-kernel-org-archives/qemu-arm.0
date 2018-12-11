Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp749027wrt;
        Tue, 11 Dec 2018 07:59:20 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WNtiI78W1yMBgbpsxUABnVxqL6/EI1IydvSdsI7b+zr7jfgTRw+hvwGTcIU7e5gGbxSTyi
X-Received: by 2002:a0c:f143:: with SMTP id y3mr16196655qvl.21.1544543960004;
        Tue, 11 Dec 2018 07:59:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544543960; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGWeCvo2kRwF0OyBVtvyyqSY3DTm+kx25N5D9+hx/Pl5DPc3ouJUL6r/Jn2RGl7IhJ
         JnxWtgdeGZn5bcXqg+pX/vDmlTlCmUjaD7TGbC4bZj4GIZsFpqzFT1aEDgMWOpuhbnoa
         KcWodksSlQ50/WhMZO6Ai/QTGF7ftYhMqhH7WXaVb4TixNUqZtQeBXNmgh21oD64su3u
         yrrsDHWLYCiEARGLNLB3rrFLC7UWrolkthKrA3P8Qz3JTtoyMXoHyzRW9LNGUqgiON/0
         C2pB1T+aLjfFgnRAdHk04Gm/5g5kV1464fH6cAO2pvOYDJCKcqtYhJvAP+eM+4LYqqAw
         1JjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=6LryBYbNSljTqd8hFSGrW+lY6umXiQg5yJ2FZmBV9es=;
        b=OXgcWYVu6N7nur46DdHxTdlEd3fzkdz8d7H8psBqJaVvDctpNFkCUdISwHjD6Qorgr
         lgAwXyE79K7bBXGyS6YZzef66qaNind+0ZARTPj5xLizYnzVIca+drkLXaevtOc1/iQ0
         WaYEMBvm0TT2Tbct5nfVMcJRBWECEwXFc6UySF6CfdVFbRLogzRuo0N44Xfb/WQeAl68
         QCXXKwsT5U2v2n7+NADsW0oEWymgVNsF5yNmBsYdvbRNMVqu/wp5gDsoVZgBerJ7ysiD
         Jl0qjgdXKlR0LF2RVB+bf6M+oiy/EAPcDRH+2uwfVJTs2uXOOcA2lf/9NoRkNGFT3PNA
         jrpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u7si2455391qkd.236.2018.12.11.07.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39440 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWkRL-0005TO-Gx
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:59:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gWkL9-0007iX-2H
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:52:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gWkL4-0004b2-7X
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:52:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52508)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gWkL1-0004Tl-7M; Tue, 11 Dec 2018 10:52:49 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA36A3097042;
	Tue, 11 Dec 2018 15:52:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1E5F1057069;
	Tue, 11 Dec 2018 15:52:30 +0000 (UTC)
Date: Tue, 11 Dec 2018 16:52:29 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20181211165229.744f0c07@redhat.com>
In-Reply-To: <CAJ+F1CKF7_MEtZNY2FEot9dG-RZQwGeZZ7+3+q1QgD98koF2SA@mail.gmail.com>
References: <20181204142023.15982-1-marcandre.lureau@redhat.com>
	<20181204142023.15982-9-marcandre.lureau@redhat.com>
	<20181211142310.GB20015@habkost.net>
	<CAJ+F1CKF7_MEtZNY2FEot9dG-RZQwGeZZ7+3+q1QgD98koF2SA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 11 Dec 2018 15:52:34 +0000 (UTC)
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
	Eduardo Habkost <ehabkost@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4q04ytb0krOu

On Tue, 11 Dec 2018 18:30:32 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> Hi
>=20
> On Tue, Dec 11, 2018 at 6:24 PM Eduardo Habkost <ehabkost@redhat.com> wro=
te:
> >
> > I have specific questions about the approach we are using to
> > eliminate the macros.
> >
> > My main goal when asking this to be moved to a separate patch is
> > to not make this discussion block the register_global_properties() &
> > device_post_init() changes (which look good to me).
> >
> >
> > On Tue, Dec 04, 2018 at 06:20:12PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > [...] =20
> > > -#define VIRT_COMPAT_3_0 \
> > > +static GlobalProperty virt_compat_3_0[] =3D {
> > >      HW_COMPAT_3_0
> > > +}; =20
> >
> > What about moving the array inside virt_machine_3_0_options()? =20
>=20
> Sure
>=20
> > =20
> > >
> > >  static void virt_3_0_instance_init(Object *obj)
> > >  {
> > > @@ -1883,12 +1884,14 @@ static void virt_3_0_instance_init(Object *ob=
j)
> > >  static void virt_machine_3_0_options(MachineClass *mc)
> > >  {
> > >      virt_machine_3_1_options(mc);
> > > -    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_3_0);
> > > +    compat_props_add(mc->compat_props,
> > > +                     virt_compat_3_0, G_N_ELEMENTS(virt_compat_3_0));
> > >  }
> > >  DEFINE_VIRT_MACHINE(3, 0) =20
> >
> > This is nice, because it's basically the same amount of
> > boilerplate code, but I would find a NULL-terminated array much
> > easier to use than having to use G_N_ELEMENTS(). =20
>=20
> But easier to get wrong too. I prefer the explicit N arguments. (it
> also gives some flexibility, since you can point to inner pointer +
> size, although we don't care at this point)
+1 to explicit array size,
it also allows to drop terminating NULL entry in compat declarations

[...]
