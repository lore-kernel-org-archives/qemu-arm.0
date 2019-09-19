Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1167768wrp;
        Thu, 19 Sep 2019 08:51:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMXCP3DyNm6GLZTAi3X59NHlSCdgBNNfqPhD8bGMr0Bz7QiCX9FyS71NrIxuqJ8JqITQz6
X-Received: by 2002:a0c:e501:: with SMTP id l1mr8475086qvm.1.1568908296899;
        Thu, 19 Sep 2019 08:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568908296; cv=none;
        d=google.com; s=arc-20160816;
        b=zg7MaoW/bDkoWo4EHkOG3qhCOvq3ohUe02SpG2J1nf0IufGCWvsLpldbEMvfbYK6va
         OT3+0KcNP7YXHsZntUnEfalWRTx8Ji9fFL4lLOZeKe9DEz30+uhqzirTNnPX7dtbZVGR
         vxOBKgeM7CcRxCb97a8AgQ1HvfX6rgp9q2QeLHMTLlbDR5RgNJfh4uo+PCB8Q9ZA9mhF
         MyRq0XE32heKThg65CYce4pkzW679o+8JtTBKWy+rj44rrTUQlzxEAX25p7G+SCsu8z/
         3L+nNzJRI/hUsCe0YfG2OdnDfwk44UcGgjtt7TSvi0yFcph1RlB7mtVTSk1hagYvdTa0
         Jcgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=IQhvPLZxpj8NU6OvFj9mJRxw56NkyAjBiyRdnENq6cE=;
        b=ZNyRhFV6w0XI9T3W3BgWLbgtjZipMZUX9fjNhE4lsuWi5SEoTi6fgFELI+DGucNzTI
         YhryI+YlMYV0Bfoocv/pKxZCTQHPj0TOHJy4RQ63BFMf33NjgShxeXBa39AedLKspa0c
         NYPvwo4vc/yobRVKZLgDl2gIJyR0jQbtfkK8ioObcY91CKunJfKU0noArXdp/R4Xb32B
         U5NUAWfru7Yg9Dc9LhXjfehNaKKvVOJ34S5Uhxx5qlyIA5pfzv38nqc2160OvXUrLzH8
         x+O7VZ4+g5+msRl0gmiVf1p+E9QQHqFWWoGCYdzBsZ8A7KZ2UBCwvWvjkovPD+q3SVCo
         6E3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si6905624qte.226.2019.09.19.08.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 08:51:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAyiV-0003Xo-G5
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 11:51:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38728)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iAyiI-0003Xe-8l
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 11:51:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iAyiG-00074w-HV
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 11:51:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iAyiG-00073A-8A; Thu, 19 Sep 2019 11:51:20 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 373CA308FBA0;
 Thu, 19 Sep 2019 15:51:18 +0000 (UTC)
Received: from redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A6AE608A5;
 Thu, 19 Sep 2019 15:50:48 +0000 (UTC)
Date: Thu, 19 Sep 2019 16:50:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [RFC] error: auto propagated local_err
Message-ID: <20190919155045.GS20217@redhat.com>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <20190919091720.GB10163@localhost.localdomain>
 <57483252-273c-4606-47a8-eddeb840109a@redhat.com>
 <35c972e1-bdb5-cbcb-ed45-6a51f19af98c@virtuozzo.com>
 <696673be-95c8-3f75-551c-26fccd230eb1@virtuozzo.com>
 <152afb5b-8efb-d968-d595-94f58ad02a04@redhat.com>
 <20190919144948.GR20217@redhat.com>
 <b5128e58-8b90-233d-6bb1-cc9009852d8d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b5128e58-8b90-233d-6bb1-cc9009852d8d@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Thu, 19 Sep 2019 15:51:18 +0000 (UTC)
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
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
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
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LwH6ZkTOX/xR

On Thu, Sep 19, 2019 at 10:24:20AM -0500, Eric Blake wrote:
> On 9/19/19 9:49 AM, Daniel P. Berrang=C3=A9 wrote:
>=20
> >> ALWAYS using MAKE_ERRP_SAFE() on entry to any function that has an E=
rror
> >> **errp parameter is dirt-simple to explain.  It has no performance
> >> penalty if the user passed in a normal error or error_abort (the cos=
t of
> >> an 'if' hidden in the macro is probably negligible compared to
> >> everything else we do), and has no semantic penalty if the user pass=
ed
> >> in NULL or error_fatal (we now get the behavior we want with less
> >> boilerplate).
> >>
> >> Having to think 'does this method require me to use MAKE_ERRP_SAFE, =
or
> >> can I omit it?' does not provide the same simplicity.
> >=20
> > The flipside is that MAKE_ERRP_SAFE hides a bunch of logic, so you do=
n't
> > really know what its doing without looking at it, and this is QEMU
> > custom concept so one more thing to learn for new contributors.
> >=20
> > While I think it is a nice trick, personally I think we would be bett=
er
> > off if we simply used a code pattern which does not require de-refere=
ncing
> > 'errp' at all, aside from exceptional cases. IOW, no added macro in 9=
5%
> > of all our methods using Error **errp.
>=20
> If 100% of our callsites use the macro, then new contributors will
> quickly learn by observation alone that the macro usage must be
> important on any new function taking Error **errp, whether or not they
> actually read the macro to see what it does.  If only 5% of our
> callsites use the macro, it's harder to argue that a new user will pick
> up on the nuances by observation alone (presumably, our docs would also
> spell it out, but we know that not everyone reads those...).

To get some slightly less made-up stats, I did some searching:

  - 4408  methods with an 'errp' parameter declared

     git grep 'Error \*\*errp'|  wc -l

  - 696 methods with an 'Error *local' declared (what other names
    do we use for this?)

     git grep 'Error \*local' | wc -l

  - 1243 methods with an 'errp' parameter which have void
    return value (fuzzy number - my matching is quite crude)

     git grep 'Error \*\*errp'|  grep -E '(^| )void' | wc -l

  - 11 methods using error_append_hint with a local_err

     git grep append_hint | grep local | wc -l


This suggests to me, that if we used the 'return 0 / return -1' conventio=
n
to indicate failure for the methods which currently return void, we could
potentially only have 11 cases where a local error object is genuinely
needed.=20

If my numbers are at all accurate, I still believe we're better off
changing the return type and eliminating essentially all use of local
error variables, as void funcs/local error objects appear to be the
minority coding pattern.


> > There are lots of neat things we could do with auto-cleanup functions=
 we
> > I think we need to be wary of hiding too much cleverness behind macro=
s
> > when doing so overall.
>=20
> The benefit of getting rid of the 'Error *local_err =3D NULL; ...
> error_propagate()' boilerplate is worth the cleverness, in my opinion,
> but especially if also accompanied by CI coverage that we abide by our
> new rules.

At least we're both wanting to eliminate the local error + propagation.
The difference is whether we're genuinely eliminating it, or just hiding
it from view via auto-cleanup & macro magic

Regards,
Daniel
--=20
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
|: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
