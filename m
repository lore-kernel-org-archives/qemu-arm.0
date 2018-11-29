Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2636513wrt;
        Thu, 29 Nov 2018 09:54:38 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X+eeM+7nTPpL3jqwLvOiOSXTwYLM8TaTsxs0fRADBEpo48GqDTY0az4qTxleXVjxRMT2Sa
X-Received: by 2002:a25:8b88:: with SMTP id j8-v6mr2304922ybl.308.1543514078241;
        Thu, 29 Nov 2018 09:54:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543514078; cv=none;
        d=google.com; s=arc-20160816;
        b=HHtlAugvyLaHagp366LFjPKrOjAKFm0rn/1TfCnPusseUTfkE9YY6G53Sf8d2kSv4y
         4cO31SrwA57HZw6rid7RXV3XrXT6zAB5PbLPLJJqqfe2yKvpTqUUUPNDT/dWuPbQn6Rh
         sHtZLILKcjpMiOyJXL3L7UNm0j3lDz/+LrA00ZlXuu1I5uMHjNVS1yEPm1KNnpm9vHvp
         zb84+4IwQMBlXHlHUcqwd/fzqYKoWbJLQvNUE3gDvce2zGK5F18uVk1N2y/kbk+By6Nk
         +G4N+oKPaL/H7Xe13b4xtHlKoDFIl1G7ISBHCfuLpKNdJ5RMK5Rw45w8jx0LsEo39gw9
         XH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xadgkpjpNRG0Jrmp5mRb35Zp3SS8QJWqx0muRW4H8/E=;
        b=Up5ajubd8L2b04dC1aFuD3JRG/4o8q72E9aMnoGPla1mzeqDJ2S4ffWY9Ajvy/yP5G
         XOBpDoeoJwdW1LZ+WhZkQwM3VAqAGXvQM1uWbImyMigra199m9+yNyyj3GCC3/FfpJRX
         AL+RjRCKcezviY6pQcGuWwF4q6XSd1HGpMMtzYKRdDdJKARCnC2iY4+KJyG+4DQYndw1
         sfX1BtH2fZi2hiFciYmaGjzRnW5QN87C+bfSD61cag+388m5Hb7MUwvCRVT4GN/XmU5l
         eMx9wfkKcg4sQQumO7mI5t/Y6Rhvqyzqn9GqR/qNUFm1Xjw4oelMYjA53dSJ6P54BwFI
         aJWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m130si1678460ywm.385.2018.11.29.09.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 09:54:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSQWL-0004KV-Hm
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 12:54:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gSQT0-0002Fz-HB
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 12:51:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gSQSz-0008MV-KZ
	for qemu-devel@nongnu.org; Thu, 29 Nov 2018 12:51:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gSQSv-0008Gm-2r; Thu, 29 Nov 2018 12:51:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 534B289AEE;
	Thu, 29 Nov 2018 17:51:04 +0000 (UTC)
Received: from localhost (ovpn-116-21.gru2.redhat.com [10.97.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20CDD18EDC;
	Thu, 29 Nov 2018 17:50:56 +0000 (UTC)
Date: Thu, 29 Nov 2018 15:50:55 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20181129175055.GQ18284@habkost.net>
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
	<20181127133527.GI18284@habkost.net>
	<20181128184027.7d584eaa@redhat.com>
	<CAJ+F1CK5NkgsJWFGZ7kvR81KyeOPE_ytk=tOjKqTUGtbfywmJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAJ+F1CK5NkgsJWFGZ7kvR81KyeOPE_ytk=tOjKqTUGtbfywmJQ@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 29 Nov 2018 17:51:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /2L2urJOtTpP

On Thu, Nov 29, 2018 at 02:32:18PM +0400, Marc-Andr=E9 Lureau wrote:
> Hi
> On Wed, Nov 28, 2018 at 9:53 PM Igor Mammedov <imammedo@redhat.com> wro=
te:
> >
> > On Tue, 27 Nov 2018 11:35:27 -0200
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > > On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=E9 Lureau wrote=
:
> > > > On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.=
com> wrote:
> > > > >
> > > > > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=E9 Lureau w=
rote:
> > > > > > Similarly to accel properties, move compat properties out of =
globals
> > > > > > registration, and apply the machine compat properties during
> > > > > > device_post_init().
> > > > > >
> > > > > > Signed-off-by: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.c=
om>
> > > > > [...]
> > > > > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > > > > index 7066d28271..3b31b2c025 100644
> > > > > > --- a/hw/core/qdev.c
> > > > > > +++ b/hw/core/qdev.c
> > > > > > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> > > > > >  }
> > > > > >
> > > > > >  static const GPtrArray *ac_compat_props;
> > > > > > +static const GPtrArray *mc_compat_props;
> > why you didn't use just 'compat_props' for both?
> > (it would be cleaner have single registry for compat
> > properties, and the place that takes care of registration
> > will take care of necessary ordering)
>=20
> There are two arrays, one from the accelerator class, the other from
> the machine class. We can't make it a singleton (all compats props for
> the various machines would be mixed).
>=20
> We could create a third array that would be the set of both, but that
> would require more copy/allocation.

I am failing to see the advantage of replacing the `global_props`
static variable from qdev-properties.c with a collection of
separate static variables scattered around the code.  I thought
the main point of the changes was to reduce the amount of
duplicate data stored in static variables.

I was expecting something like this:

accel.c:

  void accel_apply_compat_props(AccelState *accel, Object *obj)
  {
      object_apply_global_props(obj, ACCEL_GET_CLASS(accel)->compat_props=
, &error_abort);
  }

machine.c:

  /* Apply compat properties and global properties to an object */
  void machine_apply_compat_props(MachineState *ms, Object *obj)
  {
      accel_apply_compat_props(ms->accel, obj);
      object_apply_global_props(obj, MACHINE_GET_CLASS(ms)->compat_props,=
 &error_abort);
  }

compat-props.c:

  static void object_apply_compat_props(Object *obj)
  {
      MachineState *machine =3D MACHINE(qdev_get_machine());
      machine_apply_compat_props(machine, obj);
  }

qdev.c:

  static void device_post_init(Object *obj)
  {
      object_apply_compat_props(obj);
      apply_user_provided_globals(obj);
  }

object_interface.c:

  void user_creatable_complete(Object *obj, Error **errp)
  {
      object_apply_compat_props(obj);
      ...
      ucc->complete(...)
  }

--=20
Eduardo
