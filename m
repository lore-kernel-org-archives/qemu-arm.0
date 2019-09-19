Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1237857wrp;
        Thu, 19 Sep 2019 09:54:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyFgmB8+ta47GA2OEkT+Ekik6j2s8r9FBIYHNcFS0BE0Xpvkj+HJpm3F0FB1dZa7bsyvUoX
X-Received: by 2002:a17:906:80d9:: with SMTP id a25mr15204854ejx.222.1568912049559;
        Thu, 19 Sep 2019 09:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568912049; cv=none;
        d=google.com; s=arc-20160816;
        b=ub1bqhmFB53YZ3ZLhcF3fWUvMrXcijHAJDMf3BW+lyZ3TQcBI0cEQlA0TlCpNmWb02
         fI5iphhMa0Hw606f+vN9/2+NRWGm0xvV/1EX1/vvjdxkKIFZqi6I0KhHGOlkErBMUjDu
         mAo1Fg+1GjY9PbrbBcxLTfwoODKDlK6R26Phte8yeMMaj37VaXA9IIQYw4wnOEc3c6J0
         LulRh40JSWY2s7qQ3pYv63h5kLrqk7PYOf2xbO1c1ogUceN92QQ7TdNyj3bfhoTBsMQG
         nL4C/DtbUZuvvusRAayH1e+uB44JiIAG/qVd5pL4+9Nb8fhKmrZaITGz/ZP0wg8NDEPj
         760A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=JlI6R4yfF0/TA3bzHjipoq2ebWhwv49JE3RokV96d2U=;
        b=P/kfmTCzWZRORbooN5FmA5khmgiewj5DwhYDJn3RX4JqoqnTeEC/IYr8cHfaeoz13Q
         XKTN9A5LzRhw+sOef+Rl9VDVarVZVnmicwhPXpt/lKnU51aJ57SmbGSUZrKFRyZ9xZI0
         MPhGWLckTgWVCJCkz11Bv+mythVNDz0aXVbeikwhY4m0Yk0xvDVNh0GYs/PV5aSIgQCl
         M9s+4dKiyEIC37QloP4QmFL2TojgJbqHbxWJTsL34miurQhGlvc3eTvdc/6KvEuviz5P
         wz9uGqVj4gln85bY1uXpwX5v3jaPU2rghxdUBY48rj2s5GBuuxjPIa3w/BLCWcjLb4vX
         FYfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si4892664eju.269.2019.09.19.09.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 09:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAzh1-0007KE-TG
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 12:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iAzgS-0006ut-Rt
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 12:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iAzgR-0002nD-H6
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 12:53:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37232)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iAzeV-0001tF-7J; Thu, 19 Sep 2019 12:53:31 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C857B89810A;
 Thu, 19 Sep 2019 16:51:29 +0000 (UTC)
Received: from redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 503B45C1B5;
 Thu, 19 Sep 2019 16:51:03 +0000 (UTC)
Date: Thu, 19 Sep 2019 17:51:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [RFC] error: auto propagated local_err
Message-ID: <20190919165100.GT20217@redhat.com>
References: <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <20190919091720.GB10163@localhost.localdomain>
 <57483252-273c-4606-47a8-eddeb840109a@redhat.com>
 <35c972e1-bdb5-cbcb-ed45-6a51f19af98c@virtuozzo.com>
 <696673be-95c8-3f75-551c-26fccd230eb1@virtuozzo.com>
 <152afb5b-8efb-d968-d595-94f58ad02a04@redhat.com>
 <20190919144948.GR20217@redhat.com>
 <b5128e58-8b90-233d-6bb1-cc9009852d8d@redhat.com>
 <20190919155045.GS20217@redhat.com>
 <27eccb19-a514-f44f-240b-1e40852fff8c@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27eccb19-a514-f44f-240b-1e40852fff8c@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 19 Sep 2019 16:51:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
 "armbru@redhat.com" <armbru@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>, Eric Blake <eblake@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "groug@kaod.org" <groug@kaod.org>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8KH2D+1KCqd9

On Thu, Sep 19, 2019 at 04:16:25PM +0000, Vladimir Sementsov-Ogievskiy wr=
ote:
> 19.09.2019 18:50, Daniel P. Berrang=C3=A9 wrote:
> > On Thu, Sep 19, 2019 at 10:24:20AM -0500, Eric Blake wrote:
> >> On 9/19/19 9:49 AM, Daniel P. Berrang=C3=A9 wrote:
> >>
> >>>> ALWAYS using MAKE_ERRP_SAFE() on entry to any function that has an=
 Error
> >>>> **errp parameter is dirt-simple to explain.  It has no performance
> >>>> penalty if the user passed in a normal error or error_abort (the c=
ost of
> >>>> an 'if' hidden in the macro is probably negligible compared to
> >>>> everything else we do), and has no semantic penalty if the user pa=
ssed
> >>>> in NULL or error_fatal (we now get the behavior we want with less
> >>>> boilerplate).
> >>>>
> >>>> Having to think 'does this method require me to use MAKE_ERRP_SAFE=
, or
> >>>> can I omit it?' does not provide the same simplicity.
> >>>
> >>> The flipside is that MAKE_ERRP_SAFE hides a bunch of logic, so you =
don't
> >>> really know what its doing without looking at it, and this is QEMU
> >>> custom concept so one more thing to learn for new contributors.
> >>>
> >>> While I think it is a nice trick, personally I think we would be be=
tter
> >>> off if we simply used a code pattern which does not require de-refe=
rencing
> >>> 'errp' at all, aside from exceptional cases. IOW, no added macro in=
 95%
> >>> of all our methods using Error **errp.
> >>
> >> If 100% of our callsites use the macro, then new contributors will
> >> quickly learn by observation alone that the macro usage must be
> >> important on any new function taking Error **errp, whether or not th=
ey
> >> actually read the macro to see what it does.  If only 5% of our
> >> callsites use the macro, it's harder to argue that a new user will p=
ick
> >> up on the nuances by observation alone (presumably, our docs would a=
lso
> >> spell it out, but we know that not everyone reads those...).
> >=20
> > To get some slightly less made-up stats, I did some searching:
> >=20
> >    - 4408  methods with an 'errp' parameter declared
> >=20
> >       git grep 'Error \*\*errp'|  wc -l
> >=20
> >    - 696 methods with an 'Error *local' declared (what other names
> >      do we use for this?)
> >=20
> >       git grep 'Error \*local' | wc -l
> >=20
> >    - 1243 methods with an 'errp' parameter which have void
> >      return value (fuzzy number - my matching is quite crude)
> >=20
> >       git grep 'Error \*\*errp'|  grep -E '(^| )void' | wc -l
> >=20
> >    - 11 methods using error_append_hint with a local_err
> >=20
> >       git grep append_hint | grep local | wc -l
>=20
> why do you count only with local? Greg's series is here to bring local =
to all
> functions with append_hint:

I hadn't noticed the scope of Greg's series :-)

>=20
> # git grep append_hint | wc -l
> 85



> Also, conversion to use macro everywhere may be done (seems so) by cocc=
inelle script.
> But conversion which you mean, only by hand I think. Converting 1243 me=
thods by hand
> is a huge task..

Yeah, it would be a non-negligible amount of work.

> I think there are three consistent ways:
>=20
> 1. Use macro everywhere
> 2. Drop error_append_hint
> 3. Drop error_fatal

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
