Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp237719wrt;
        Mon, 26 Nov 2018 12:12:09 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V3pba7fMQxTm9iEeFt5pmtPAS/YfqrdhMW3PKgROeSbhtjKHN/JWTiHmrT7ZNBD/4RnBcV
X-Received: by 2002:a25:6ac1:: with SMTP id f184-v6mr16884526ybc.435.1543263128903;
        Mon, 26 Nov 2018 12:12:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543263128; cv=none;
        d=google.com; s=arc-20160816;
        b=QdLj4sXy2cHEzprNMN8Il6hS7saLY4ugbwGl1RzdnjsP4+sHA616gi9Kcdpth1nLs9
         O4rUe+sty5rRQ/Jc3J8TYjJOtg8bcIJaxT7L0UZkKZzNlWdZ/uCKgQoHgkaNcMgawAFN
         6rWrU3yN/aQfXlrrGOtyOnnTW4hUR0QXtJqzD1COvgJhyWIZFkfdH5kyW4WCgfwdlopZ
         P3YOoeuigEisVjUK+3+hZcDVuoVizCsizcvlW3Fz3S9BdrCpGd/8ucA0l171M+ii3/n7
         N0tdkUa+BvNQZ4+wTpdy+TS9E5+MzuUqj1Cdus3DzFh492ZGB+YZ+lLZQL5ve7idaxC6
         38OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=vDDG8sw8/cLynP82AyxpTCVexwlosrYkbYNu/D2cZy0=;
        b=eshuEXHNRIf8+BZGlpfcTWqJyOuOhFm6yaFDWrdWjZJPJMVFo/yW/HYc0wtQOO0yQc
         9mxo/ggVXUctLyJC40PQ7/Rxj+qoZrf1Zw+Dqnj8AYQgE9atDo9GLiupgyg8aMbFIbRg
         V146an5+2qDuBem4Wnl9mDJJe9CkRB9P5Uad+ztvKnn+Wpr3Tmk/smAGhZAwu3lRUMdS
         lkqnG4AwSycQZzygUYPgWJ/VJFgiIER5DOS4fQCqirbCN/VLPoPZrsmy3FZWmm2gyN1V
         RTETxRhefv7+zIspmwoAjRLAPpcOvo/+TArMcpc05LbrJB58xfG4Wapf/STuRCYJUbts
         xxuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EPBqw2Q9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x185-v6si922041ywa.178.2018.11.26.12.12.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 26 Nov 2018 12:12:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EPBqw2Q9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRNEm-0007sE-6U
	for alex.bennee@linaro.org; Mon, 26 Nov 2018 15:12:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gRN5v-0008GY-TP
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 15:03:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1gRN5u-0008L2-I9
	for qemu-arm@nongnu.org; Mon, 26 Nov 2018 15:02:59 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36642)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1gRN5m-0008IV-NB; Mon, 26 Nov 2018 15:02:50 -0500
Received: by mail-wr1-x443.google.com with SMTP id t3so20294736wrr.3;
	Mon, 26 Nov 2018 12:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vDDG8sw8/cLynP82AyxpTCVexwlosrYkbYNu/D2cZy0=;
	b=EPBqw2Q9WNRbPygYwTduKPjmnPMKIRsuanwWGQCu/DDilHQHm7j3IxF/shc5AGyHkE
	nm9PGMt2zQm3J9z/w89EzZOwOdbLkobeehhB5ZV4YTn9WjDdlMf+uwevicc5VfplO+F/
	nnli7V+Iiz6jDgjyNDlGxd6FCSUhjepMg191FTpUPKCtCa+o3anyYbC6poIfn8Jy5OJc
	HU2YF+6UMKjNmiRgIDTb5AW1DWMAZRxvotQcLOpex2n66jw3W/g0qRdI6e6qan7MmWl/
	QXdK21Z/os/KVheNjtCqXMpGnVb2lo5TAobWqvmL9+DEtjbFuYI2BGuYOQCCy9on4sOE
	kfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vDDG8sw8/cLynP82AyxpTCVexwlosrYkbYNu/D2cZy0=;
	b=Y5O9rnHQGft2QBFNPiini4wmLImmus0m4Jgg4ytCzT6UBLlGq2FGcG1Um67f5X8+dC
	1VnYn8ByhFSW6CJfvibxdrATRmtHyRda9mFrbdLb6p7005hLnsPw54+uQ6GZAQgrrHY0
	2Kf5iz16ObuJAjDlKCYoN72R8dCQG7AfTulL9JReMbAXIc8kfhgqOpt2QIXnPV8sN73R
	yh9TEIu/cKDb6feQL8wXTzJdokzvwUUXKuly5RwPqGqI706eewOeuG++HKUsbkHcV2mA
	C5p2mBcCHVrFIq8L/kvIVjidY1tQOECqi7Y0obrtu7I5UCoBvE5z7otGibdukvpQUAp6
	FF2Q==
X-Gm-Message-State: AA+aEWY2Y4c9lVf5cTF0fMmnVo2IkMtibz9tcb+dCGrRX/fTpYbXrFNZ
	uNxpAjPBk1z8WTYrQ2AIzY5F7ZRaFpiVbuJQj+4=
X-Received: by 2002:adf:f550:: with SMTP id j16mr24489059wrp.258.1543262567852;
	Mon, 26 Nov 2018 12:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
	<20181107123652.23417-11-marcandre.lureau@redhat.com>
	<20181126142046.07c5e227@redhat.com>
In-Reply-To: <20181126142046.07c5e227@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Nov 2018 00:02:35 +0400
Message-ID: <CAJ+F1C+XA0hzUCOgxm8MML1QZ-VfVUAG=yq1ZHAh1+t3jMbQgQ@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
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
	Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>, hpoussin@reactos.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	"open list:sPAPR pseries" <qemu-ppc@nongnu.org>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	atar4qemu@gmail.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uvoyH94FvDEL

Hi
On Mon, Nov 26, 2018 at 5:27 PM Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed,  7 Nov 2018 16:36:48 +0400
> Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
>
> > It's now possible to use the common function.
> >
> > Teach object_apply_global_props() to warn if Error argument is NULL.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  hw/core/qdev-properties.c | 24 ++----------------------
> >  qom/object.c              |  6 +++++-
> >  2 files changed, 7 insertions(+), 23 deletions(-)
> >
> > diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
> > index 8728cbab9f..239535a4cb 100644
> > --- a/hw/core/qdev-properties.c
> > +++ b/hw/core/qdev-properties.c
> > @@ -1223,28 +1223,8 @@ int qdev_prop_check_globals(void)
> >
> >  void qdev_prop_set_globals(DeviceState *dev)
> >  {
> > -    int i;
> > -
> > -    for (i =3D 0; i < global_props()->len; i++) {
> > -        GlobalProperty *prop;
> > -        Error *err =3D NULL;
> > -
> > -        prop =3D g_array_index(global_props(), GlobalProperty *, i);
> > -        if (object_dynamic_cast(OBJECT(dev), prop->driver) =3D=3D NULL=
) {
> > -            continue;
> > -        }
> > -        prop->used =3D true;
> > -        object_property_parse(OBJECT(dev), prop->value, prop->property=
, &err);
> > -        if (err !=3D NULL) {
> > -            error_prepend(&err, "can't apply global %s.%s=3D%s: ",
> > -                          prop->driver, prop->property, prop->value);
> > -            if (!dev->hotplugged) {
> > -                error_propagate(&error_fatal, err);
> > -            } else {
> > -                warn_report_err(err);
> > -            }
> > -        }
> > -    }
> > +    object_apply_global_props(OBJECT(dev), global_props(),
> > +                              dev->hotplugged ? NULL : &error_fatal);
> arguably, it's up to caller to decide it warn or not.
> I'd leave it warning code out of object_apply_global_props() and let call=
er do the job

The problem is that there may be multiple errors, and the remaining
globals should be applied.

I'll add a comment.

> >  }
> >
> >  /* --- 64bit unsigned int 'size' type --- */
> > diff --git a/qom/object.c b/qom/object.c
> > index 9acdf9e16d..b1a7f70550 100644
> > --- a/qom/object.c
> > +++ b/qom/object.c
> > @@ -392,7 +392,11 @@ void object_apply_global_props(Object *obj, GArray=
 *props, Error **errp)
> >          if (err !=3D NULL) {
> >              error_prepend(&err, "can't apply global %s.%s=3D%s: ",
> >                            p->driver, p->property, p->value);
> > -            error_propagate(errp, err);
> > +            if (errp) {
> > +                error_propagate(errp, err);
> > +            } else {
> > +                warn_report_err(err);
> > +            }
> >          }
> >      }
> >  }
>
>


--=20
Marc-Andr=C3=A9 Lureau
