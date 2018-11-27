Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1248734wrt;
        Tue, 27 Nov 2018 05:10:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XkAvS8Kujmt8VhDquYScDLj2IutBgsLUqed1RFXy3viyFdItPDaiHeL5Vjpdm/ICJKSqpa
X-Received: by 2002:a81:5791:: with SMTP id l139mr19372869ywb.413.1543324241255;
        Tue, 27 Nov 2018 05:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543324241; cv=none;
        d=google.com; s=arc-20160816;
        b=jAsIYn/13w0+98Ft03kAZvx3dkyF1OKineZ3qWJF8gC9LPPeJ0vZafCdbwXCM5WDMv
         ziQtJBw5dw43ICSvkFzeW8X/tNfblmQFJGfMc7qHZLhlssi/ep5KBON8Va/2Tw8fi1H0
         AdhB4hIQG2OVR6IAb3CadkDjR9e6Y/2NUit6GGQcs8D6GgNRk1md6qhgZWH1Kt3VyMV9
         PBBpwI5x9szuR3CbDK+XiOlE9qunQ1IP/qSyJcr855XaAq2W14gGIN4CNyagUEJfN0Vf
         yjZC7fcmS81dyhFsPlUkGmuU/WbHtKGadDA+n7t7ppjLNW06Y0T91yDO1h1CMZC+ifw5
         3Myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=6cGpkftk9i5qol+2GRHZyCXlBuA7VT+xHDbge3m5KRQ=;
        b=Lu0U7fZvJE0I3OkEs8zG9hyjqb7dS3Acmxv27dCYfyNctYkeeoUVmEeoa3Bb3WDyYM
         rH8gPmKx5JK24pgkuiL2V9XgOxTnR8beVt0bpQdg4kgifsVslhYw1NZNfriTJjRPC5Eh
         wXUQkgiXvUogGUBcJ/+lKRrXMMkotj2HufdW0EjkYIQ66UzeHrP8zPI7AHSnBEzz/SS3
         gVHTGYDYNPLWmNAPCThSi6Sbub+VfvtJp6iVGEhdkcmRX/qRPAm7o24CgUQO9BD0Enlp
         bL4VZrkfZ5jH1smnS69ILmmWuQ/zIpOA4cYYaKHOfy3JFAn4MSV6UY7SI1MWleyokYfp
         fIXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v82-v6si2763782ywb.213.2018.11.27.05.10.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 05:10:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRd8R-0007tl-Ra
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 08:10:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1gRd8A-0007rv-SY
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:10:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1gRd87-00023D-O9
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:10:22 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:43180)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1gRd87-000228-HK
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:10:19 -0500
Received: by mail-qt1-f196.google.com with SMTP id i7so21575425qtj.10
	for <qemu-arm@nongnu.org>; Tue, 27 Nov 2018 05:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6cGpkftk9i5qol+2GRHZyCXlBuA7VT+xHDbge3m5KRQ=;
	b=lgFRoy2KQQpdcXsILZkRwS6ToAYqPmSM3jYKXz0XfAy6UbwTGou0QJYa8MJh101Jrw
	6o52WZINptCJO6/TM3AMlZBwhjhTU6FH8wePWZSqxbPgmf504RohBV1ZvsQp8fSCHYaj
	q16K3/J7xx8y5W348feKkw+DSm3FSlmaDf/MJncuCour3lYMf18HMKsK+aJDW//DFH00
	uJlY7AjLzs4oIA5iscPZNG462BsWk2L/hfXvJ/xvFPHS1VVITqsPcqGsaNk3wdmk4v6F
	YQrfeUcntcskgIMNshg5zJsSxdCh2+18FQEyZzZInng3u2rweaS3Xr94B5d/SfKFXfnA
	/FnQ==
X-Gm-Message-State: AGRZ1gIRM50B3ApMfJ1ey8QR4opd6UwIEkDg/igELOMv3PuNeEe2HjY6
	dZZivc0jX6G6ofYeHb/gteilKbFs89SpY6fR/rSdaw==
X-Received: by 2002:aed:2921:: with SMTP id s30mr30640338qtd.346.1543324217934;
	Tue, 27 Nov 2018 05:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20181127092801.21777-1-marcandre.lureau@redhat.com>
	<20181127092801.21777-17-marcandre.lureau@redhat.com>
	<20181127125644.GB18284@habkost.net>
In-Reply-To: <20181127125644.GB18284@habkost.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Nov 2018 17:10:05 +0400
Message-ID: <CAMxuvaySoJ2TokV8M81CVU3Hp4dC25c+PW_p2kk+V88-88U-CQ@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.196
Subject: Re: [Qemu-arm] [PATCH for-3.2 v4 16/28] hw: apply machine compat
 properties without touching globals
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
	"Michael S . Tsirkin" <mst@redhat.com>, cohuck@redhat.com,
	David Hildenbrand <david@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, borntraeger@de.ibm.com,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Bonzini,
	Paolo" <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, david@gibson.dropbear.id.au,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YRmNjXW+bhD6

On Tue, Nov 27, 2018 at 4:57 PM Eduardo Habkost <ehabkost@redhat.com> wrote=
:
>
> On Tue, Nov 27, 2018 at 01:27:49PM +0400, Marc-Andr=C3=A9 Lureau wrote:
> > Similarly to accel properties, move compat properties out of globals
> > registration, and apply the machine compat properties during
> > device_post_init().
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> [...]
> > diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> > index 7066d28271..3b31b2c025 100644
> > --- a/hw/core/qdev.c
> > +++ b/hw/core/qdev.c
> > @@ -971,17 +971,26 @@ static void device_initfn(Object *obj)
> >  }
> >
> >  static const GPtrArray *ac_compat_props;
> > +static const GPtrArray *mc_compat_props;
> >
> >  void accel_register_compat_props(const GPtrArray *props)
> >  {
> >      ac_compat_props =3D props;
> >  }
> >
> > +void machine_register_compat_props(const GPtrArray *props)
> > +{
> > +    mc_compat_props =3D props;
> > +}
> > +
> >  static void device_post_init(Object *obj)
> >  {
> >      if (ac_compat_props) {
> >          object_apply_global_props(obj, ac_compat_props, &error_abort);
> >      }
>
> Why not just use MACHINE(qdev_get_machine())->accel->compat_props
> directly?
>
> > +    if (mc_compat_props) {
> > +        object_apply_global_props(obj, mc_compat_props, &error_abort);
> > +    }
>
> Why not just use MACHINE(qdev_get_machine())->compat_props
> directly?

This was the approach in v3, but Igor didn't quite like referencing
machine in qdev:
https://lists.nongnu.org/archive/html/qemu-devel/2018-11/msg04774.html

>
> >
> >      qdev_prop_set_globals(DEVICE(obj));
> >  }
> [...]
>
> --
> Eduardo
