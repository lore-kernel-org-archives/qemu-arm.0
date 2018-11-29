Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2165751wrt;
        Thu, 29 Nov 2018 02:33:08 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UsSiwX/nqtFQDeQhjqyAiZ9z2+5gHaunjW3WOeAoP2zazGW57iTiS5to8uqGL+sDmS9arU
X-Received: by 2002:a81:4641:: with SMTP id t62mr728881ywa.261.1543487588304;
        Thu, 29 Nov 2018 02:33:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543487588; cv=none;
        d=google.com; s=arc-20160816;
        b=SXATPueMhIdbnFGpuVro1iWRNO9D6bXnmjRIEYDKCVdGu4Mv763t8tEp9raAtdn2D9
         DmGd6o2XzRTnS3aRE0Pd4lIAQU1pFuoG+4nU7nGBIzImHodngErXcidGRmONRGpGXZMF
         YttD8Ht6DAXceEtmPGhdjuewsNO09TGCe+CH/9gj8ULcmm47OTMXyHUyI0rujDHaw1Zc
         RXn8lJ6a/5ib4sCKHvZY9LZPEvNM0yFzCsN/k7CTWvfYunW0bkOBeEdNosDdHHcQXq1m
         FV7PXOSt2y76W++14RqahPAwHtSqEPOGwGP+uNZZV9F5Lwi7EK93VrzEP/bVoBVG/P7m
         iqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Tg5Sw/Qc04u9qEDzIXjkDgDZzVn9bQMa93MNR0JADNE=;
        b=FFRgC0O0DrqvzPsnbMqloHTETsDcmkQU+74xlCA/B1hHr4P1u176HX+tTb9ATATFdf
         WakhFKoob4ATx7vc4rETkjHxUcUmXXRtRatxP3BZ9lYx+b8y9HpVp4uczWs8KlZeIlTH
         Rw0cM482pKqzBLPbKXYwnd25knG9fOINfL4DxtiAKSJk2WUw7LCD749yxv7vJnsXgaXS
         yCDwlyfbGCHGL4gqtS6R/TKApjgLBTqZuqspIb8fsW77XO1hkBdpTv7fGdBKk9wwwFgD
         heqvV3dvkiulfRJSJv/c5TZ0kT2oh6IrJHb1MKdvnP7ZEVSMuTQ3k6WBZMHuAgUCRxBF
         fIOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SB88wbWA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l78si896077ywe.174.2018.11.29.02.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 02:33:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SB88wbWA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSJd5-00021W-P3
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 05:33:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53912)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gSJcY-00021O-Oz
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 05:32:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gSJcX-00009h-Ji
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 05:32:34 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:37389)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gSJcX-000097-Ar; Thu, 29 Nov 2018 05:32:33 -0500
Received: by mail-wm1-x343.google.com with SMTP id g67so1657344wmd.2;
	Thu, 29 Nov 2018 02:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Tg5Sw/Qc04u9qEDzIXjkDgDZzVn9bQMa93MNR0JADNE=;
	b=SB88wbWAfXg/r9ph5nVqhJgtlU4G/vS2FTCYlY+MYzzVYR2Z8vaB8ElmaHf1+k/hVA
	hDpQ91sqTQXdO9ooOPOJBvD6GMh0QtQybwREtSY8BDr25Q+OID1zIwNickG0X2bePSdh
	RBxF908cv8KndlsbSsK4OHgPMFdIzbaVPPiagHf6iophXTq+SqnGSQlodC9b3N0df1FG
	Ls7X3oXUgtg4ybJWghk6aB+VUAyq1JlKNDr7bz2rZ54mBaq7tzpikc/OC04+RWmHRjLH
	myOimcXmEo7KwecPc9Z2cGrS+JkxwaE4fTStSUt+n0jYFkYMS6RQ+x+M6MEGibIY1qKm
	6naA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Tg5Sw/Qc04u9qEDzIXjkDgDZzVn9bQMa93MNR0JADNE=;
	b=OS7YCtadPKfAHEnIXDQkIccAdSPZVsuNpjPTQTZzIz8VN4Z8pxHFfncifhMs3IuNCW
	mQv8O1niFin8K7lq4s5obWADdOlfeK6fdt7TgO1KkAk61wPxZtgWPSGUE5IRlgfHPaFi
	9AIhiUi7gzrBwcFuovof2IK10I7xL6oLQ+AnFCZzteUtj2yLRVgIf5lwsZbOZbyzW03A
	GjV67QaAhbUkoy7Z4KrK002K9WzGVLvNbjTbN0XfyAMKUkVe7NOYSE989+BQW6boHJDr
	M8eXE7b4WU8YjXqOY5Cv3BglL2LqpeaK8U2H8ZA+tbFq9f2i1jFiAT/4IWwLXAOUj6CI
	nhIQ==
X-Gm-Message-State: AA+aEWb4hbIb4KrtCrhvPJlOm+Cxv9tsRVZz9maRxQKaVs9ihuMaSWBe
	qvOsJ0zGNPD5QOGUR3e+XFwMTsm0DrIl/DNBd1A=
X-Received: by 2002:a1c:2981:: with SMTP id p123mr1171479wmp.19.1543487551804; 
	Thu, 29 Nov 2018 02:32:31 -0800 (PST)
MIME-Version: 1.0
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
	<20181127133527.GI18284@habkost.net>
	<20181128184027.7d584eaa@redhat.com>
In-Reply-To: <20181128184027.7d584eaa@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 29 Nov 2018 14:32:18 +0400
Message-ID: <CAJ+F1CK5NkgsJWFGZ7kvR81KyeOPE_ytk=tOjKqTUGtbfywmJQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [PATCH for-3.2 v4 16/28] hw: apply machine compat
 properties without touching globals
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ADEKvgRdWk2h

Hi
On Wed, Nov 28, 2018 at 9:53 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Tue, 27 Nov 2018 11:35:27 -0200
> Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> > On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > > On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.com>=
 wrote:
> > > >
> > > > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=C3=A9 Lureau wr=
ote:
> > > > > Similarly to accel properties, move compat properties out of glob=
als
> > > > > registration, and apply the machine compat properties during
> > > > > device_post_init().
> > > > >
> > > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.co=
m>
> > > > [...]
> > > > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > > > index 7066d28271..3b31b2c025 100644
> > > > > --- a/hw/core/qdev.c
> > > > > +++ b/hw/core/qdev.c
> > > > > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> > > > >  }
> > > > >
> > > > >  static const GPtrArray *ac_compat_props;
> > > > > +static const GPtrArray *mc_compat_props;
> why you didn't use just 'compat_props' for both?
> (it would be cleaner have single registry for compat
> properties, and the place that takes care of registration
> will take care of necessary ordering)

There are two arrays, one from the accelerator class, the other from
the machine class. We can't make it a singleton (all compats props for
the various machines would be mixed).

We could create a third array that would be the set of both, but that
would require more copy/allocation.

>
> > > > >
> > > > >  void accel_register_compat_props(const GPtrArray *props)
> > > > >  {
> > > > >      ac_compat_props =3D props;
> > > > >  }
> > > > >
> > > > > +void machine_register_compat_props(const GPtrArray *props)
> > > > > +{
> > > > > +    mc_compat_props =3D props;
> > > > > +}
> > > > > +
> > > > >  static void device_post_init(Object *obj)
> > > > >  {
> > > > >      if (ac_compat_props) {
> > > > >          object_apply_global_props(obj, ac_compat_props, &error_a=
bort);
> > > > >      }
> > > >
> > > > Why not just use MACHINE(qdev_get_machine())->accel->compat_props
> > > > directly?
> > > >
> > > > > +    if (mc_compat_props) {
> > > > > +        object_apply_global_props(obj, mc_compat_props, &error_a=
bort);
> > > > > +    }
> > > >
> > > > Why not just use MACHINE(qdev_get_machine())->compat_props
> > > > directly?
> > >
> > > This was the approach in v3, but Igor didn't quite like referencing
> > > machine in qdev:
> > > https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04774.htm=
l
> >
> > I disagree with Igor, here.  Core qdev code already have multiple
> > references to machine, I don't see any problem with that.
> (There are only 3 calls to qdev_get_machine() in core qdev.c
> blame me for adding one there. Which were hacks so we won't
> have to re-factor core qdev code. But that doesn't justify adding more.)
>
> This patch is an interim one and later in 25/28
> device_post_init() content is moved to a more generic compat interface
> implementation. That intended for use with types derived from Object
> (i.e. not only qdev stuff). Hence I'd like to decouple it from
> machine as a standalone feature as much as possible. So that
> machine (or whatever else) will opt in in using facility.
>
> > The previous code was clearer and easier to follow, and wasn't
> > sensitive to subtle changes in initialization ordering (e.g. what
> > happens if we create a device before *_register_compat_props() is
> > called?).
> Indeed It seems clearer to follow (that was my first impression as well),
> until I went through whole series and thought it's basically the same,
> So my choice was to use cleaner approach that we won't have to rewrite
> in near future.
>
> Thanks for bringing up ordering issue, we probably have one in this serie=
s.
>
> But beside possible issue here, even with v3 variant we would still have
> issues if objects are created before machine and accelerator instances ar=
e
> created.
> More correct way could be to register compat properties right away at
> select_machine() time, we don't really need an instance for that, just ac=
cess
> to machine_class and do the same for 'accel' option. (that's probably doa=
ble
> within this series) + some time later (on top of this series) a check tha=
t
> no TYPE_COMPAT_PROPS were created at the moment compat properties are reg=
istered
> so we would notice when we write something wrong.

ok, I can look at that

>
> If it's too much of refactoring (series is already big as it is), I would
> compromise on qdev_get_machine() and adding TODO comments (or a series on=
 top)
> to make it correct and "race-resistant".
>
> Marc are you sure it actually will work as expected with Object derived t=
ypes?
>    register_global_properties()
> is being called after
>    qemu_opts_foreach(... user_creatable_add_opts_foreach, object_create_i=
nitial ...)
> so there is no compat properties registered when objects are created.

Good point, but in the case of hostmem, it works because
object_create_initial delays its creation.

> > >
> > > >
> > > > >
> > > > >      qdev_prop_set_globals(DEVICE(obj));
> > > > >  }
> > > > [...]
> > > >
> > > > --
> > > > Eduardo
> >
>
>


--=20
Marc-Andr=C3=A9 Lureau
