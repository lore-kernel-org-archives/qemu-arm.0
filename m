Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3470482wrt;
        Fri, 30 Nov 2018 03:42:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XZJXPz0aoCqeMgwvwpBtX2ghC7oSF4ymrai2w+BPx6CPRxRYKQAyRteg7xWlu58GTGfCNE
X-Received: by 2002:a25:c107:: with SMTP id r7-v6mr1281825ybf.360.1543578130873;
        Fri, 30 Nov 2018 03:42:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543578130; cv=none;
        d=google.com; s=arc-20160816;
        b=kGM4DAXDFj5z08EogBDlFnkys4lpHAcPyVRf2VOkd413MYjaYoMjsw8jyl2kpqpKgt
         t3baPTKx1HdZrRiWvLeolCCZ/Sq4qMvN69Z94TkduC7/mOOFgTrtqs7MMSHotCx+iWmk
         0lZQCyyn+sWxI6PmeFP0ULM33P2bgqIQeG3x2xyBdphIbtZN2QD0S+91PNEKC9S7eZhY
         BiTelZxdGArxiV4VTeQzHSDUvfHhP1cQ+qHYLTAVcDI9xT2dF4gYbXtwBN1OPkR0AFJR
         TLe0nJlkhiJRXXENbE8kAsVgp/Tu93id++exBjuBeT0ll5UCuM17NrT4g3tJoms87lju
         dfZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=5TU26ngAW/hQRHcdWD4BI1FWEU+PsmTXbzNJ+2VSXxc=;
        b=XZYiyoj34uafaB19P+5om7u+WchDvI/uFXITO6XuXtA1LARRC2eR3Q4BjN+zq57V2e
         825isomHQk7pY7lWqf8IJNAV+P4qvGDEYdqHN9XziKHd+6dlzCdg2VgfAzbJSJ5wdSMr
         aA8OXQepO6ziNLYg6ajqLsxIwSmrb3k7qM0J3H0SHIjDJQuUN4wQhETg6b0dn59Be81P
         +bS5br7nB9XLgIRdJNBNnUocZwld+8yhovWkT8rp1kvv6f6fbtl34HdcTgTHlJAsURjd
         UCY8Pg/Nwr0nLRTRiVsR2cBR/EhrZG7N5Wf03xz95/NaPED/Y68fyd99h4hGbw7O/qZu
         8Ebw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m202-v6si3252925ybm.118.2018.11.30.03.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 03:42:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59457 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gShBS-0004tJ-9B
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 06:42:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gShBD-0004s1-33
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 06:41:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gShB9-0003Qv-Vh
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 06:41:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57884)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gShB9-0003Ql-Ng; Fri, 30 Nov 2018 06:41:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D90A73001D5D;
	Fri, 30 Nov 2018 11:41:50 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 676F9600CC;
	Fri, 30 Nov 2018 11:41:44 +0000 (UTC)
Date: Fri, 30 Nov 2018 09:41:42 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181130114142.GV18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
	<20181127133527.GI18284@habkost.net>
	<20181128184027.7d584eaa@redhat.com>
	<CAJ+F1CK5NkgsJWFGZ7kvR81KyeOPE_ytk=tOjKqTUGtbfywmJQ@mail.gmail.com>
	<20181129175055.GQ18284@habkost.net>
	<CAJ+F1CJBKVibRrgjiNKjSJ5ufK=CUodx26aHnKzeL3Cs7adbeA@mail.gmail.com>
	<20181130115526.5974ca7a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20181130115526.5974ca7a@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 30 Nov 2018 11:41:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: paAEtm/YBbgq

On Fri, Nov 30, 2018 at 11:55:26AM +0100, Igor Mammedov wrote:
> On Fri, 30 Nov 2018 01:36:03 +0400
> Marc-Andr=E9 Lureau <marcandre.lureau@gmail.com> wrote:
>=20
> > Hi
> >=20
> > On Thu, Nov 29, 2018 at 9:51 PM Eduardo Habkost <ehabkost@redhat.com>=
 wrote:
> > >
> > > On Thu, Nov 29, 2018 at 02:32:18PM +0400, Marc-Andr=E9 Lureau wrote=
: =20
> > > > Hi
> > > > On Wed, Nov 28, 2018 at 9:53 PM Igor Mammedov <imammedo@redhat.co=
m> wrote: =20
> > > > >
> > > > > On Tue, 27 Nov 2018 11:35:27 -0200
> > > > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > > > > =20
> > > > > > On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=E9 Lureau=
 wrote: =20
> > > > > > > On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@r=
edhat.com> wrote: =20
> > > > > > > >
> > > > > > > > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=E9 Lu=
reau wrote: =20
> > > > > > > > > Similarly to accel properties, move compat properties o=
ut of globals
> > > > > > > > > registration, and apply the machine compat properties d=
uring
> > > > > > > > > device_post_init().
> > > > > > > > >
> > > > > > > > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@re=
dhat.com> =20
> > > > > > > > [...] =20
> > > > > > > > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > > > > > > > index 7066d28271..3b31b2c025 100644
> > > > > > > > > --- a/hw/core/qdev.c
> > > > > > > > > +++ b/hw/core/qdev.c
> > > > > > > > > @@ -971,17 +971,26 @@ static void device_initfn(Object =
*obj)
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static const GPtrArray *ac_compat_props;
> > > > > > > > > +static const GPtrArray *mc_compat_props; =20
> > > > > why you didn't use just 'compat_props' for both?
> > > > > (it would be cleaner have single registry for compat
> > > > > properties, and the place that takes care of registration
> > > > > will take care of necessary ordering) =20
> > > >
> > > > There are two arrays, one from the accelerator class, the other f=
rom
> > > > the machine class. We can't make it a singleton (all compats prop=
s for
> > > > the various machines would be mixed).
> > > >
> > > > We could create a third array that would be the set of both, but =
that
> > > > would require more copy/allocation. =20
> > >
> > > I am failing to see the advantage of replacing the `global_props`
> > > static variable from qdev-properties.c with a collection of
> > > separate static variables scattered around the code.  I thought
> > > the main point of the changes was to reduce the amount of
> > > duplicate data stored in static variables.
> Main point was to use compats for backends then on top of that=20
> we added split global from compat properties goal.
>=20
> > > I was expecting something like this:
> > >
> > > accel.c:
> > >
> > >   void accel_apply_compat_props(AccelState *accel, Object *obj)
> > >   {
> > >       object_apply_global_props(obj, ACCEL_GET_CLASS(accel)->compat=
_props, &error_abort);
> > >   }
> > >
> > > machine.c:
> > >
> > >   /* Apply compat properties and global properties to an object */
> > >   void machine_apply_compat_props(MachineState *ms, Object *obj)
> > >   {
> > >       accel_apply_compat_props(ms->accel, obj);
> > >       object_apply_global_props(obj, MACHINE_GET_CLASS(ms)->compat_=
props, &error_abort);
> > >   }
> > >
> > > compat-props.c:
> > >
> > >   static void object_apply_compat_props(Object *obj)
> > >   {
> > >       MachineState *machine =3D MACHINE(qdev_get_machine());
> > >       machine_apply_compat_props(machine, obj);
> > >   }
> > >
> > > qdev.c:
> > >
> > >   static void device_post_init(Object *obj)
> > >   {
> > >       object_apply_compat_props(obj);
> > >       apply_user_provided_globals(obj);
> > >   }
> > >
> > > object_interface.c:
> > >
> > >   void user_creatable_complete(Object *obj, Error **errp)
> > >   {
> > >       object_apply_compat_props(obj);
> > >       ...
> > >       ucc->complete(...)
> > >   }
> > > =20
> >=20
> > I like that solution too (which you also proposed in the other
> > thread). But we have to decide whether it's acceptable to reference
> > MachineState, or if the compat properties should be registered.
> I dislike pulling in machine into basic object code and
> I think a separate compats would be cleaner interface without
> layer violation. But to unstuck, lets go with qdev_get_machine()
> for now.

Which basic object code?  The only reference to machine above is
at compat-props.c.  I don't see any layering violation here.

--=20
Eduardo
