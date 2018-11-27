Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1323503wrt;
        Tue, 27 Nov 2018 06:13:04 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WafBjEkqDA31MP5qg17JQImjWkGIteURwQce4QDyRfnjjMrejS/WrlChF1geGmrP5F3RtL
X-Received: by 2002:a25:b28d:: with SMTP id k13-v6mr14178457ybj.222.1543327984157;
        Tue, 27 Nov 2018 06:13:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543327984; cv=none;
        d=google.com; s=arc-20160816;
        b=AZKr/qwsNi+LZMh/zfyu9UCxly36C5HBio+IXXgWMtPR++ogNhlBtdroHI5BDf8UFv
         2i6PiDD6ZXN1wbdhnVLDbydt29osYlZYy8VvmIgX7rmUOqmvyCvmqWTzgBsz6OiZ/ZYK
         tCXmggR9XgosRQcv+4iskv1iyxFV9QYpu0r6tTvwfM1wCNvldSJueHws9cRK9Cu9fIYV
         pLd5Qc6rtoTuNPHSYn/sd2tS/QOtAB4TVPERJ1Dml42OGkHRJGcgfKRroM/JnX3ouR8k
         yOWCRL33lITU5/hI5Uz6ieH3QE/flW1XY0rVQdTSTH8vC7RgzGiZD4a3zuaLK5pH59Mi
         mt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=tcaR+8XyvfhTR4BqXq4ivyde6hBg8cDfokVfhk/bXJA=;
        b=uVtCZn+UXVWiz81xtxP7PKP3KU+kf6ZTlBhrqkYDv8L74LQvnK5iy/OS1vO4pKyfTL
         /Q2fRxcpRUG89yka/gS/wGxKKiG0F8zDY2I3mC0c+YyFi1SVpnGGpJ+pEhkG+0zM2HYD
         2xDEDaT43Jqt8riUwHjthMOlzMNvq4JdRPRrmX4BaH5zWirDbeLB0l0oaYZqN9W0U0se
         3O1yDWI4NGmh6jUReOVBsBB18GSNZ+ixgnxN72fUYzqfaj++iBSQwkEHHhvJJyNtXN7w
         khcPHnJ5tHscmN+D/cyffho+6DmL07MHq+5wpkLAyheqRXg+xGEnsyZQA8J37Xac0GUI
         dKiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b2-v6si2655253ybc.192.2018.11.27.06.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 06:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRe6p-0003yp-1m
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 09:13:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRe6b-0003tl-8K
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:12:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gRe6V-0002gO-Ub
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 09:12:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46158)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gRe6V-00012Q-KB; Tue, 27 Nov 2018 09:12:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 723003082DDC;
	Tue, 27 Nov 2018 14:12:33 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A80A1A7CA;
	Tue, 27 Nov 2018 14:12:14 +0000 (UTC)
Date: Tue, 27 Nov 2018 15:12:12 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@gmail.com>
Message-ID: <20181127151212.4583e324@redhat.com>
In-Reply-To: <CAJ+F1C+XA0hzUCOgxm8MML1QZ-VfVUAG=yq1ZHAh1+t3jMbQgQ@mail.gmail.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-11-marcandre.lureau@redhat.com>
	<20181126142046.07c5e227@redhat.com>
	<CAJ+F1C+XA0hzUCOgxm8MML1QZ-VfVUAG=yq1ZHAh1+t3jMbQgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 27 Nov 2018 14:12:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.2 v3 10/14] qdev-props:
 call object_apply_global_props()
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Corey Minyard <minyard@acm.org>, amit@kernel.org,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, hpoussin@reactos.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, stefanb@linux.ibm.com,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,
	atar4qemu@gmail.com, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S97rWjir2z7t

On Tue, 27 Nov 2018 00:02:35 +0400
Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> wrote:

> Hi
> On Mon, Nov 26, 2018 at 5:27 PM Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Wed,  7 Nov 2018 16:36:48 +0400
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
> > =20
> > > It's now possible to use the common function.
> > >
> > > Teach object_apply_global_props() to warn if Error argument is NULL.
> > >
> > > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > > ---
> > >  hw/core/qdev-properties.c | 24 ++----------------------
> > >  qom/object.c              |  6 +++++-
> > >  2 files changed, 7 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> > > index 8728cbab9f..239535a4cb 100644
> > > --- a/hw/core/qdev-properties.c
> > > +++ b/hw/core/qdev-properties.c
> > > @@ -1223,28 +1223,8 @@ int qdev_prop_check_globals(void)
> > >
> > >  void qdev_prop_set_globals(DeviceState *dev)
> > >  {
> > > -    int i;
> > > -
> > > -    for (i =3D 0; i < global_props()->len; i++) {
> > > -        GlobalProperty *prop;
> > > -        Error *err =3D NULL;
> > > -
> > > -        prop =3D g_array_index(global_props(), GlobalProperty *, i);
> > > -        if (object_dynamic_cast(OBJECT(dev), prop->driver) =3D=3D NU=
LL) {
> > > -            continue;
> > > -        }
> > > -        prop->used =3D true;
> > > -        object_property_parse(OBJECT(dev), prop->value, prop->proper=
ty, &err);
> > > -        if (err !=3D NULL) {
> > > -            error_prepend(&err, "can't apply global %s.%s=3D%s: ",
> > > -                          prop->driver, prop->property, prop->value);
> > > -            if (!dev->hotplugged) {
> > > -                error_propagate(&error_fatal, err);
> > > -            } else {
> > > -                warn_report_err(err);
> > > -            }
> > > -        }
> > > -    }
> > > +    object_apply_global_props(OBJECT(dev), global_props(),
> > > +                              dev->hotplugged ? NULL : &error_fatal)=
; =20
> > arguably, it's up to caller to decide it warn or not.
> > I'd leave it warning code out of object_apply_global_props() and let ca=
ller do the job =20
>=20
> The problem is that there may be multiple errors, and the remaining
> globals should be applied.
>
> I'll add a comment.
ok

=20
> > >  }
> > >
> > >  /* --- 64bit unsigned int 'size' type --- */
> > > diff --git a/qom/object.c b/qom/object.c
> > > index 9acdf9e16d..b1a7f70550 100644
> > > --- a/qom/object.c
> > > +++ b/qom/object.c
> > > @@ -392,7 +392,11 @@ void object_apply_global_props(Object *obj, GArr=
ay *props, Error **errp)
> > >          if (err !=3D NULL) {
> > >              error_prepend(&err, "can't apply global %s.%s=3D%s: ",
> > >                            p->driver, p->property, p->value);
> > > -            error_propagate(errp, err);
> > > +            if (errp) {
> > > +                error_propagate(errp, err);
> > > +            } else {
> > > +                warn_report_err(err);
> > > +            }
> > >          }
> > >      }
> > >  } =20
> >
> > =20
>=20
>=20

