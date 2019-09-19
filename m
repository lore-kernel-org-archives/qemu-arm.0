Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1093114wrp;
        Thu, 19 Sep 2019 07:50:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEfv1/BX4p4VTDxr2WwElkKucxAvsOGvouhc0xO3m78r7l2auA14SbVTKkqgCjaB0W9kGv
X-Received: by 2002:a05:6402:7c1:: with SMTP id u1mr2167932edy.198.1568904652983;
        Thu, 19 Sep 2019 07:50:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568904652; cv=none;
        d=google.com; s=arc-20160816;
        b=y++LMhny9IgQtRXqYQPiuDnMvmguyVIhCtX74oiQXIg5F8p3G/1bAtmOOk1nLNWJ/J
         r6ouj6Z9tKw50sHv28PUxlIVOtYgcJDZ3wIPRmsHzcoXYlY9+e/x6aAeW9thdodh6GX1
         EoNI85bXebzly5pv5u3MFMR2e7yzpe1ZqIrlchh+rCaG9Z7xMWTn3Qk4vPDkmUx4OEpT
         WIuwhFGE5kJ3hdzigqztXf/VpDXKWkZ3ti+SaqvQW9Ead3R+aPl8LpvKQomQJ/C4PcUM
         koyQY4tgG6JzuU4lWM4y7w2YPUrbutwLx4k6hL9MDa2eG9T12l0hB/+ccfOyTLv8KjiS
         WHqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date;
        bh=9pyCyV2tultpffJ/KqrKyH/9Ek2lOH4cwhNis1q6cKA=;
        b=qPNl2KA/Qosze1Tqm9SpTfYMNZD0KQKP9Em7S1revhtGkgksdnW76PILkS11o+LXDI
         HzBIT29CDiVuB+A+fKayK+mdPdzCWQB7jJ7C2awkcmgxpSpAySiIgN2dJDZpWvWOiEZf
         eEjmr7Jtpce8oQ6h536v0H6dRYiQIC1p5sX56MS9RczBNy7SsC2lrt2DadguhsRlODAY
         H89eTaaYQxSNduAKjS0RSFRg7ZHYwMnREyLQCoIIN27kZGbz9T6yPgI/CB+Zn74VuaJe
         1fPqhBMh9c197DmDHDZvucArKwXh+TqmMuZ+WDijj/H8WaWYoU4y/LPHc1OX9PSaTCsf
         +wmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si4774393ejc.245.2019.09.19.07.50.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 07:50:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAxlj-0001We-RK
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 10:50:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iAxlO-0001Rb-PP
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 10:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iAxlM-0002OM-1T
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 10:50:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42442)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iAxlL-0002NK-NN; Thu, 19 Sep 2019 10:50:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 842C42A09A0;
 Thu, 19 Sep 2019 14:50:25 +0000 (UTC)
Received: from redhat.com (ovpn-112-51.ams2.redhat.com [10.36.112.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0C3D60872;
 Thu, 19 Sep 2019 14:49:50 +0000 (UTC)
Date: Thu, 19 Sep 2019 15:49:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190919144948.GR20217@redhat.com>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <20190919091720.GB10163@localhost.localdomain>
 <57483252-273c-4606-47a8-eddeb840109a@redhat.com>
 <35c972e1-bdb5-cbcb-ed45-6a51f19af98c@virtuozzo.com>
 <696673be-95c8-3f75-551c-26fccd230eb1@virtuozzo.com>
 <152afb5b-8efb-d968-d595-94f58ad02a04@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <152afb5b-8efb-d968-d595-94f58ad02a04@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Thu, 19 Sep 2019 14:50:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC] error: auto propagated local_err
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
 "mreitz@redhat.com" <mreitz@redhat.com>,
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
 Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ViSKiF+oAcr

On Thu, Sep 19, 2019 at 09:44:14AM -0500, Eric Blake wrote:
> On 9/19/19 9:30 AM, Vladimir Sementsov-Ogievskiy wrote:
> 
> >>
> >> To the same topic, of minimization: should we always call MAKE_ERRP_SAFE at function top, or only
> >> in block, where it is needed (assume, we dereference it only inside some "if" or "while"?
> >> Kevin, is something bad in propagation, when it not related to error_abort?
> >>
> >>
> > 
> > Or, even, we may use MAKE_ERRP_SAFE on every function, which have Error **errp argument, even if we neither
> > dereference it nor append hints? Is it what you propose by "SINGLE paradigm"? It's of course simpler to script,
> > to check in checkpatch and to maintain.
> 
> Yes. The simpler we make the rules, and the less boilerplate it entails,
> the more likely that we can:
> 
> a) avoid exceptions and corner cases that cost review time
> b) automate the conversion into complying with the rule
> c) codify those rules in syntax check to ensure they are followed
> post-conversion
> 
> ALWAYS using MAKE_ERRP_SAFE() on entry to any function that has an Error
> **errp parameter is dirt-simple to explain.  It has no performance
> penalty if the user passed in a normal error or error_abort (the cost of
> an 'if' hidden in the macro is probably negligible compared to
> everything else we do), and has no semantic penalty if the user passed
> in NULL or error_fatal (we now get the behavior we want with less
> boilerplate).
> 
> Having to think 'does this method require me to use MAKE_ERRP_SAFE, or
> can I omit it?' does not provide the same simplicity.

The flipside is that MAKE_ERRP_SAFE hides a bunch of logic, so you don't
really know what its doing without looking at it, and this is QEMU
custom concept so one more thing to learn for new contributors.

While I think it is a nice trick, personally I think we would be better
off if we simply used a code pattern which does not require de-referencing
'errp' at all, aside from exceptional cases. IOW, no added macro in 95%
of all our methods using Error **errp.

There are lots of neat things we could do with auto-cleanup functions we
I think we need to be wary of hiding too much cleverness behind macros
when doing so overall.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
