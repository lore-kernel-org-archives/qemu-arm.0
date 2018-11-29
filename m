Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2843850wrt;
        Thu, 29 Nov 2018 13:36:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UhIC5x8QGNvOVseWUqSxpj5JYiQC6RJxs50vWK5SKqvyg5p4OxtzXOVZ0tqFWFkZUF8ZeH
X-Received: by 2002:a25:b3c6:: with SMTP id x6-v6mr3006905ybf.508.1543527408520;
        Thu, 29 Nov 2018 13:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543527408; cv=none;
        d=google.com; s=arc-20160816;
        b=rgS6aDqAxNtoT5VCeKwGHsZ/fbHu7s7q2m3kL11o/jujdtfLIODrdXyUntO75H6IoJ
         So6y5eUwYtY72WdhnRp0T56d+g6gK+jBn4ty6eeKXF2b7CQ/l4uXqWa9wVZJM/UGRHdl
         PajeXy2WUk5zb2xYtig4TZ14QRQYR09KMOF7WHqwlJKohacPRgP0NYob7VxCJkr3F2k9
         99jA4Zto+YW4Dm6LIYPgETGU69kIvD4TD/6NdF3pq+LHy/XZPpoSgdGheD/YDlQT0rZl
         uGnTfLj+7eQSxSuP5sZR5aDfx4IOjeTjcbUnAzaORBHd4lMSpz19+L2hXYF+qrsTZHya
         gE1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=SBTCtjLw0QfHv8iwF93UeoNfX4GNnzVvsqCVMMnGFyM=;
        b=DlCShLIhxpV4SDy6fBHLPzBW4uM0RolimsnCzdZgOUwEFD2+n5T0nLQZNWqgZeB563
         gx3PP0GBj01SaE18iAZ+GqNlYITZ3CfiIVM6BftqhiHtGiNS/vl4/Lm908xQDv7osLKp
         uv3ljyFzh4mQ9JzN3lLs551KmjF1nH04zQyDYtC1YBh5ska6H4kd4vdg7dBWkK8UrlFh
         E49fBvg1rtLmbH20jCc0fW4d1R7/HUiPb6TtazI/dqcd+qE8xBdUI8uxxjlLzKo3evrM
         5uimBYjpXLQlbSgpXjxnjIF5BewOUodZIB1EG3BlIY3MJlle39IXVBqAyfGpAKJn9yuJ
         2YUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IUAU3P8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b14-v6si1880382ybn.14.2018.11.29.13.36.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Nov 2018 13:36:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IUAU3P8T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56561 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSTzL-0003wF-RQ
	for alex.bennee@linaro.org; Thu, 29 Nov 2018 16:36:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gSTz5-0003uN-6c
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 16:36:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gSTz3-000166-4S
	for qemu-arm@nongnu.org; Thu, 29 Nov 2018 16:36:30 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37033)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gSTyr-0000Ub-BZ; Thu, 29 Nov 2018 16:36:17 -0500
Received: by mail-wm1-x344.google.com with SMTP id g67so3723645wmd.2;
	Thu, 29 Nov 2018 13:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SBTCtjLw0QfHv8iwF93UeoNfX4GNnzVvsqCVMMnGFyM=;
	b=IUAU3P8TsdPdtJtfWajH6iEA/zUQATLq74dpbVquVDS4wqdo52LdF3HFrJ0shateX/
	+IKOUxTpl39kFTTn9iXoHSQS+CASvFMBE31Jl2V8VO0IAFma7OsB++1shkvGj4cTWfXE
	pK81BJRJgoNkV4wLiNdxQ+bxplKmkQLa7ALBfuo4YHeCcUnzGxfKAUWR2moQlBFK+PNm
	ZwmceX0Gyk/NrmPmMpMPVlGzOltAQu2buUVYK+B31a+340ogdNwcTK3uXMqN9512k3e1
	ipKfFP6m8G8LL0+MhoHK1+e14XKetWa3HtBwyAJ1iLSQfMGTv6ALFpCNsO2X7KsFwa+t
	GnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SBTCtjLw0QfHv8iwF93UeoNfX4GNnzVvsqCVMMnGFyM=;
	b=XQGLWzjGtY5zSixsyWB4wXRYNu8xFHGV+bUqwflI6sFuInkIQPR4EO7AwJ+LZoC77f
	muv6tL9jWBOpB//eSUSJ7p0ivgP1O7PE9e+UkWjuGGjfgPJBqtmdA6R5SuxsiIDDd2d4
	Bh+SAEu4iBHCwcFF/0r+odw0kwaN5MUQHCi4ZMlo0SGxsLkEG0HWa7aLmn42NdTZ4oe6
	aJtRfaJhOxLkY3ujJk9CCsni8YX3gBQz+YQpiDM+mU+h6H+nZi0YCdrXEqKm1118jSPf
	p0ypJSWCwb1KRYv2jgi0XtwKJa+JKV7emfYM26nVQU+yoDmIpO3bWLeYyVvz5Fnwl+uv
	6jSQ==
X-Gm-Message-State: AA+aEWaQQqsB0Err/gJma7rsr9X6h5S5mVbmCJvlQsOVR5SLSIScEIVm
	EB+dZRljlBD2MgbMfVYSMF9JljIL8SEEsmm6yqs=
X-Received: by 2002:a1c:2981:: with SMTP id p123mr3132523wmp.19.1543527375059; 
	Thu, 29 Nov 2018 13:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
	<CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
	<20181127133527.GI18284@habkost.net>
	<20181128184027.7d584eaa@redhat.com>
	<CAJ+F1CK5NkgsJWFGZ7kvR81KyeOPE_ytk=tOjKqTUGtbfywmJQ@mail.gmail.com>
	<20181129175055.GQ18284@habkost.net>
In-Reply-To: <20181129175055.GQ18284@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 30 Nov 2018 01:36:03 +0400
Message-ID: <CAJ+F1CJBKVibRrgjiNKjSJ5ufK=CUodx26aHnKzeL3Cs7adbeA@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
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
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>, QEMU <qemu-devel@nongnu.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Qemu-s390x list <qemu-s390x@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1IssRap4icP

Hi

On Thu, Nov 29, 2018 at 9:51 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
>
> On Thu, Nov 29, 2018 at 02:32:18PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> > On Wed, Nov 28, 2018 at 9:53 PM Igor Mammedov <imammedo@redhat.com> wro=
te:
> > >
> > > On Tue, 27 Nov 2018 11:35:27 -0200
> > > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > >
> > > > On Tue, Nov 27, 2018 at 05:10:05PM +0400, Marc-Andr=C3=A9 Lureau wr=
ote:
> > > > > On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.=
com> wrote:
> > > > > >
> > > > > > On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=C3=A9 Lurea=
u wrote:
> > > > > > > Similarly to accel properties, move compat properties out of =
globals
> > > > > > > registration, and apply the machine compat properties during
> > > > > > > device_post_init().
> > > > > > >
> > > > > > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redha=
t.com>
> > > > > > [...]
> > > > > > > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > > > > > > index 7066d28271..3b31b2c025 100644
> > > > > > > --- a/hw/core/qdev.c
> > > > > > > +++ b/hw/core/qdev.c
> > > > > > > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> > > > > > >  }
> > > > > > >
> > > > > > >  static const GPtrArray *ac_compat_props;
> > > > > > > +static const GPtrArray *mc_compat_props;
> > > why you didn't use just 'compat_props' for both?
> > > (it would be cleaner have single registry for compat
> > > properties, and the place that takes care of registration
> > > will take care of necessary ordering)
> >
> > There are two arrays, one from the accelerator class, the other from
> > the machine class. We can't make it a singleton (all compats props for
> > the various machines would be mixed).
> >
> > We could create a third array that would be the set of both, but that
> > would require more copy/allocation.
>
> I am failing to see the advantage of replacing the `global_props`
> static variable from qdev-properties.c with a collection of
> separate static variables scattered around the code.  I thought
> the main point of the changes was to reduce the amount of
> duplicate data stored in static variables.
>
> I was expecting something like this:
>
> accel.c:
>
>   void accel_apply_compat_props(AccelState *accel, Object *obj)
>   {
>       object_apply_global_props(obj, ACCEL_GET_CLASS(accel)->compat_props=
, &error_abort);
>   }
>
> machine.c:
>
>   /* Apply compat properties and global properties to an object */
>   void machine_apply_compat_props(MachineState *ms, Object *obj)
>   {
>       accel_apply_compat_props(ms->accel, obj);
>       object_apply_global_props(obj, MACHINE_GET_CLASS(ms)->compat_props,=
 &error_abort);
>   }
>
> compat-props.c:
>
>   static void object_apply_compat_props(Object *obj)
>   {
>       MachineState *machine =3D MACHINE(qdev_get_machine());
>       machine_apply_compat_props(machine, obj);
>   }
>
> qdev.c:
>
>   static void device_post_init(Object *obj)
>   {
>       object_apply_compat_props(obj);
>       apply_user_provided_globals(obj);
>   }
>
> object_interface.c:
>
>   void user_creatable_complete(Object *obj, Error **errp)
>   {
>       object_apply_compat_props(obj);
>       ...
>       ucc->complete(...)
>   }
>

I like that solution too (which you also proposed in the other
thread). But we have to decide whether it's acceptable to reference
MachineState, or if the compat properties should be registered.


--
Marc-Andr=C3=A9 Lureau
