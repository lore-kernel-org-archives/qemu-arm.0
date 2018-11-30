Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3466362wrt;
        Fri, 30 Nov 2018 03:37:35 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VWQ00vS2yi+fyY7Obnv1eE904UKogaPY0TlWKUikF1RMaMIuOkOSa78AN12b95HQexYruj
X-Received: by 2002:a81:ac15:: with SMTP id k21mr5060029ywh.460.1543577855607;
        Fri, 30 Nov 2018 03:37:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543577855; cv=none;
        d=google.com; s=arc-20160816;
        b=B1OJlXXuVcaazN/gt3oZi4wE80JeWTeMWJ5uboJd48ATz76wnqcTsHiVe74fWbFaEu
         gbgxqu6MHvY1q5PJ0J4ulUqDbZ5CpUdgEmcNaN1qNQyTcLyb+d4hS30QMT8vRH4o4auo
         Q46M+ESbXfONDwLnBr1CEpJTSktOuLd/9RwMFQqYK8eaBCNJXfyp0NjlAa7KFTkXnig9
         kWHkIz7uAriYxCcRDpQOlrFTovidOIR52sCsIpBbqRTUr+PH2fxu+FhVX+R+9dXAGWdR
         ZhIH34JxbYlDvtAtBDCG5m2Jby5URMu8xxmsnujdEfRdyU+6Git4yy7mG8yupJwvOvSU
         omnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=ShO1NNARbWhOKBm6VLbd+8DUKlq/JbDlZemZM1v6bBw=;
        b=sCY4FJetIj8WaHZa+aTYo3YIH4gbeo02B8yxrGqz6nA+hkTTz2JqQhupKeOGI3qEMx
         fyVVduOF/Xi3s/EKKfx8+vx5Tr1iUA0IJrS+O5sZF5QGBo4GPW1A0JjsY7IU2w4RM79V
         NgLY5yX62XuXi26Pk/lItHaOY2bPqDRHjhTQa8TKF5BBI4BiXEr1mvXw6XdADns9Ufgr
         9jHirUOhkDVBdl41EX3e4SaSB4n0Vd+CDS1Rxmz90a3VS1xNJQqumC2vUAUzppr5gqih
         XWrq7EN+QJuHAoMgGG5KtebKA/CHHHN2oZ1ps2mKKExjRm0KB4lo0S5ZaKOmyl2nO1gh
         9guQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p124si2908806ywd.454.2018.11.30.03.37.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 03:37:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59445 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSh71-0000x3-2t
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 06:37:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSh6r-0000vh-3C
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 06:37:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gSh6n-0000vr-UZ
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 06:37:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gSh6n-0000vh-Oy; Fri, 30 Nov 2018 06:37:21 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D819130A3144;
	Fri, 30 Nov 2018 11:37:20 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA271057063;
	Fri, 30 Nov 2018 11:37:12 +0000 (UTC)
Date: Fri, 30 Nov 2018 12:37:10 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20181130123710.35c59ac0@redhat.com>
In-Reply-To: <CAJ+F1CK5NkgsJWFGZ7kvR81KyeOPE_ytk=tOjKqTUGtbfywmJQ@mail.gmail.com>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
	<20181127133527.GI18284@habkost.net>
	<20181128184027.7d584eaa@redhat.com>
	<CAJ+F1CK5NkgsJWFGZ7kvR81KyeOPE_ytk=tOjKqTUGtbfywmJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 30 Nov 2018 11:37:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v4 16/28] hw: apply
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
X-TUID: n1ZYoHu9LbxW

On Thu, 29 Nov 2018 14:32:18 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> Hi
> On Wed, Nov 28, 2018 at 9:53 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Tue, 27 Nov 2018 11:35:27 -0200
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > =20
> > > On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=C3=A9 Lureau wrot=
e: =20
> > > > On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.co=
m> wrote: =20
> > > > >
> > > > > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=C3=A9 Lureau =
wrote: =20
> > > > > > Similarly to accel properties, move compat properties out of gl=
obals
> > > > > > registration, and apply the machine compat properties during
> > > > > > device_post_init().
> > > > > >
> > > > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.=
com> =20
> > > > > [...] =20
> > > > > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > > > > index 7066d28271..3b31b2c025 100644
> > > > > > --- a/hw/core/qdev.c
> > > > > > +++ b/hw/core/qdev.c
> > > > > > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> > > > > >  }
> > > > > >
> > > > > >  static const GPtrArray *ac_compat_props;
> > > > > > +static const GPtrArray *mc_compat_props; =20
> > why you didn't use just 'compat_props' for both?
> > (it would be cleaner have single registry for compat
> > properties, and the place that takes care of registration
> > will take care of necessary ordering) =20
>=20
> There are two arrays, one from the accelerator class, the other from
> the machine class. We can't make it a singleton (all compats props for
> the various machines would be mixed).
My impression was that we register properties explicitly here,
so only registered ones endup here and in the order they were added.
Hence machine and accel compats could be merged here.
=20
> We could create a third array that would be the set of both, but that
> would require more copy/allocation.
[...]
