Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp895806wrp;
        Thu, 19 Sep 2019 04:56:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy8xvlD7gqVnnLfqU6wn43shZNWvGX3yOtO/XClfvfmhRisZrH0cpqLyoxrp04UDhNtpkca
X-Received: by 2002:ad4:5494:: with SMTP id q20mr7526795qvy.8.1568894211248;
        Thu, 19 Sep 2019 04:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568894211; cv=none;
        d=google.com; s=arc-20160816;
        b=e28qWNchyW6FwoI1OElLBIfQA3y0pZRf/zt0FHgzYwEjojx1JuAp4FIp5rfKMTZJOS
         rx+/1KX7ZRSMQrbSzQALAF1sUBiDpfGtoeYc4Msl3cY15yeWkS7NwBP1n2fs1993pQRn
         rrKki8C2gZiyKdFDY8jZ0ojoNqYKZ+zCGC0z24bFSIHd9LoV+Upe9GeXbbz1ayaksCvh
         LP67bxmCDTLCvkGGA9zfQxOpC9RXA3dx1qRLBRN0B5TCqu6C5xKSoW9Mek30mDmI+Qwb
         2jBSEp7NeJrUWVpgYPJb++D09cdvgXa4awlN2kcqc75lYwLJvus8g/q2dqsj9uNfcLC/
         v6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=9UYSADYwsoxU2vBE3mBv0aGObRm+9vu39Ue4a7uiVZI=;
        b=UxQYMshWK7vE4Hm9NBnczvTvRxdUPd+wkXwaUrpB6XpuqRh333c3BRmVLbSVEZvtdf
         FCqbH/SCh7aE5YCX1c4ZLtMNerHMHPI499igB3FSg+3AcFacYuDn0D0i88o7u6b8J/Pc
         lQkmdXNGtdmo6dsruc7lPcqttB7QUVppV4LOhxfPVnvFzfmaXoYOyadKp6NjWtO7WRwE
         G+IOsmvR9yr5md0XYHsx2a4sb2Yytzo2pu2BwYn4g/9Bblp+xOni44ukBXhWH2hBYgN7
         uNowkwW8HTAJieIWNx/QHc0A2ALmTPWaErnVoAACL3pphF7zkJyvHg+7TibKL1717/EM
         LUPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3si6299533qte.320.2019.09.19.04.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 04:56:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAv3J-0003fs-Rk
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 07:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iAv2z-0003eA-8c
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 07:56:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iAv2x-0001SF-GI
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 07:56:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iAv2x-0001RB-8T; Thu, 19 Sep 2019 07:56:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 59CB730860A5;
 Thu, 19 Sep 2019 11:56:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 420CD5D6B0;
 Thu, 19 Sep 2019 11:55:59 +0000 (UTC)
Date: Thu, 19 Sep 2019 12:55:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190919115555.GL20217@redhat.com>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <20190919091720.GB10163@localhost.localdomain>
 <20190919100903.GF20217@redhat.com>
 <d6887113-f8e8-ca4e-1dd9-fa70d946e0fa@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d6887113-f8e8-ca4e-1dd9-fa70d946e0fa@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 19 Sep 2019 11:56:25 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC] error: auto propagated local_err
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "codyprime@gmail.com" <codyprime@gmail.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "groug@kaod.org" <groug@kaod.org>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y41VfSLCuUxj

On Thu, Sep 19, 2019 at 10:21:44AM +0000, Vladimir Sementsov-Ogievskiy wr=
ote:
> 19.09.2019 13:09, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Sep 19, 2019 at 11:17:20AM +0200, Kevin Wolf wrote:
> >> Am 18.09.2019 um 19:10 hat Eric Blake geschrieben:
> >>> On 9/18/19 8:02 AM, Vladimir Sementsov-Ogievskiy wrote:
> >>>> + */
> >>>> +#define MAKE_ERRP_SAFE(errp) \
> >>>> +g_auto(ErrorPropagationStruct) (__auto_errp_prop) =3D {.errp =3D =
(errp)}; \
> >>>> +if ((errp) =3D=3D NULL || *(errp) =3D=3D error_abort || *(errp) =3D=
=3D error_fatal) { \
> >>>> +    (errp) =3D &__auto_errp_prop.local_err; \
> >>>> +}
> >>>
> >>> Not written to take a trailing semicolon in the caller.
> >>>
> >>> You could even set __auto_errp_prop unconditionally rather than try=
ing
> >>> to reuse incoming errp (the difference being that error_propagate()=
 gets
> >>> called more frequently).
> >>
> >> I think this difference is actually a problem.
> >>
> >> When debugging things, I hate error_propagate(). It means that the E=
rror
> >> (specifically its fields src/func/line) points to the outermost
> >> error_propagate() rather than the place where the error really happe=
ned.
> >> It also makes error_abort completely useless because at the point wh=
ere
> >> the process gets aborted, the interesting information is already los=
t.
> >=20
> > Yeah, that is very frustrating. For personal development you can even=
tually
> > figure it out, but with customer support requests, all you get is the
> > stack trace and you've no core file to investigate, so you're stuck.
> > IOW, as a general principle, we should strive to minimize the usage
> > of error propagate.
> >=20
> > The key reason why we typically need the propagate calls, is because
> > we allow the passed in Error **errp parameter to be NULL, while at th=
e
> > same time we want to inspect it to see if its contents are non-NULL
> > to detect failure. I venture to suggest that this is flawed API
> > design on our part. We should not need to inspect the error object
> > to see if a method call fails - the return value can be used for
> > this purpose.
> >=20
> > IOW, instead of this pattern with typically 'void' methods
> >=20
> >       extern void somemethod(Error **errp);
> >=20
> >       void thismethod(Error **errp) {
> >          Error *local_err =3D NULL;
> > 	...
> >          somemethod(&local_err);
> >          if (local_err) {
> > 	    error_propagate(errp, local_err);
> > 	    return;
> > 	}
> >          ...
> >       }
> >=20
> > We should be preferring
> >=20
> >       extern int somemethod(Error **errp);
> >=20
> >       int thismethod(Error **errp) {
> > 	...
> >          if (somemethod(errp) < 0) {
> > 	    return -1;
> > 	}
> >          ...
> >       }
> >=20
> > ie only using the Error object to bubble up the *details* of
> > the error, not as the mechanism for finding if an error occurred.
> >=20
> > There is of course a downside with this approach, in that a
> > method might set 'errp' but return 0, or not set 'errp' but
> > return -1. I think this is outweighed by the simpler code
> > pattern overall though.
> >=20
> >=20
>=20
> Agree. But seems that such change may be only done by hand.. Hmm, on th=
e other hand,
> why not. May be I'll try do it for some parts of block layer.
>=20
> Still, error_append_hint needs local_err in case of error_fatal.

Yep, fortunately that usage is comparatively rare vs use of error_propaga=
te
in general.

To be clear I don't have any objections to your overall idea of using
attribute cleanup to simplify error propagation. As you say, it can
still be useful for the error_append_hint, even if we use the code
pattern I suggest more widely to eliminate propagation where possible.

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
