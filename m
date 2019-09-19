Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1088101wrp;
        Thu, 19 Sep 2019 07:46:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsun5K9J1i5rxBmwLLVimhkuvGZd5GscmrXZCsWLtUHXWR5ff9Rb+4S2VG8MQomjv5S/Hn
X-Received: by 2002:a17:906:c310:: with SMTP id s16mr4044319ejz.178.1568904403682;
        Thu, 19 Sep 2019 07:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568904403; cv=none;
        d=google.com; s=arc-20160816;
        b=bva5TaAtztjMjGfDD8xsX9FLOI/yUBdxRKozyoRLSfiIQldcCnsJjDW6Bw6ADIHfLZ
         PPxGkRco07v45B3Y+ITwit7dnVLnBy/OY6Y91tTVkGq5ckfQQp2R5frTQeKNZR39M1gF
         psmscn9Z9axIAvUXAn3uGLP+ot/kcqo5xYgDCR7pLOMK/9iIZI6SlGGAlEHCvliZCTD3
         iJEJTKu55Kr/soKt7+5Gi+BfHFedMaSzue5sQ/U+IQOrmnrtYDgD2ZcXuMAMcewdQNqM
         wUxzSqDLJxEf+j23DbLBVUaxjeGdpYmgU9IKGqm7mLe+E5Vo6xJ/BIqEsrfON150vVLV
         aEhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=LGsvp9dilUATwZQiU8kJ05K6y6hBxmxgxvo4GDjsdXQ=;
        b=U4xP/++FySz0d7GCS/HeOmBhfunb6pb/l2m2UBdRcvR+c4OY1IUA1euvdgrEl2L/EZ
         h22Lj9Zu+lRaopiiL1bGGl0sSiZ6wSNyAG94MH0eOVuqpVRh8MQq/jYM5VYznUeEwqiz
         NLAgJLl+X8+Mh/P9CQxr/F0xULKoox3QeAjmKwWsPghnc70pjb2+OUzqoUqW1pChtwwk
         sj9rYmKEUWZiS1IyBYDa+ZolsEERA0xWlUk2MWr/vzzuQu8cem75v01IpsETfAR9E9cO
         Of/4rKkh3Zesc9De8KWZoR4y9UqiJgyn/x6T550qWi3fgGIjFZWG7bFTIAZAAgUqb5MG
         CPFA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j38si5469527ede.374.2019.09.19.07.46.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 07:46:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAxhh-0005YU-FM
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 10:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58015)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAxgh-0004tz-2R
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 10:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAxWI-0005Oc-Kl
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 10:34:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAxWI-0005OI-Cy; Thu, 19 Sep 2019 10:34:54 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4195A308212D;
 Thu, 19 Sep 2019 14:34:53 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.116.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 595896060D;
 Thu, 19 Sep 2019 14:34:43 +0000 (UTC)
Date: Thu, 19 Sep 2019 16:34:41 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190919143441.GH10163@localhost.localdomain>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <20190919091720.GB10163@localhost.localdomain>
 <57483252-273c-4606-47a8-eddeb840109a@redhat.com>
 <35c972e1-bdb5-cbcb-ed45-6a51f19af98c@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c972e1-bdb5-cbcb-ed45-6a51f19af98c@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 19 Sep 2019 14:34:53 +0000 (UTC)
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qh5Hf6tZogW7

Am 19.09.2019 um 16:13 hat Vladimir Sementsov-Ogievskiy geschrieben:
> 19.09.2019 16:40, Eric Blake wrote:
> > On 9/19/19 4:17 AM, Kevin Wolf wrote:
> >> Am 18.09.2019 um 19:10 hat Eric Blake geschrieben:
> >>> On 9/18/19 8:02 AM, Vladimir Sementsov-Ogievskiy wrote:
> >>>> + */
> >>>> +#define MAKE_ERRP_SAFE(errp) \
> >>>> +g_auto(ErrorPropagationStruct) (__auto_errp_prop) = {.errp = (errp)}; \
> >>>> +if ((errp) == NULL || *(errp) == error_abort || *(errp) == error_fatal) { \
> >>>> +    (errp) = &__auto_errp_prop.local_err; \
> >>>> +}
> >>>
> >>> Not written to take a trailing semicolon in the caller.
> >>>
> >>> You could even set __auto_errp_prop unconditionally rather than trying
> >>> to reuse incoming errp (the difference being that error_propagate() gets
> >>> called more frequently).
> >>
> >> I think this difference is actually a problem.
> >>
> >> When debugging things, I hate error_propagate(). It means that the Error
> >> (specifically its fields src/func/line) points to the outermost
> >> error_propagate() rather than the place where the error really happened.
> >> It also makes error_abort completely useless because at the point where
> >> the process gets aborted, the interesting information is already lost.
> > 
> > Okay, based on that, I see the following desirable semantics:
> > 
> > Caller: one of 4 calling paradigms:
> > 
> > pass errp=NULL (we don't care about failures)
> > pass errp=&error_abort (we want to abort() as soon as possible as close
> > to the real problem as possible)
> > pass errp=&error_fatal (we want to exit(), but only after collecting as
> > much information as possible)
> > pass errp = anything else (we are collecting an error for other reasons,
> > we may report it or let the caller decide or ...)
> > 
> > Callee: we want a SINGLE paradigm:
> > 
> > func (Error **errp)
> > {
> >      MAKE_ERRP_SAFE();
> > 
> >      now we can pass errp to any child function, test '*errp', or do
> > anything else, and we DON'T have to call error_propagate.
> > 
> > I think that means we need:
> > 
> > #define MAKE_ERRP_SAFE() \
> >    g_auto(...) __auto_errp = { .errp = errp }; \
> >    do { \
> >      if (!errp || errp == &error_fatal) { errp = &__auto_errp.local; } \
> >    } while (0)
> > 
> > So back to the caller semantics:
> > 
> > if the caller passed NULL, we've redirected errp locally so that we can
> > use *errp at will; the auto-cleanup will free our local error.
> > 
> > if the caller passed &error_abort, we keep errp unchanged.  *errp tests
> > will never trigger, because we'll have already aborted in the child on
> > the original errp, giving developers the best stack trace.
> > 
> > if the caller passed &error_fatal, we redirect errp.  auto-cleanup will
> > then error_propagate that back to the caller, producing as much nice
> > information as possible.
> > 
> > if the caller passed anything else, we keep errp unchanged, so no extra
> > error_propagate in the mix.
> > 
> >>
> >> So I'd really like to restrict the use of error_propagate() to places
> >> where it's absolutely necessary. Unless, of course, you can fix these
> >> practical problems that error_propagate() causes for debugging.
> >>
> >> In fact, in the context of Greg's series, I think we really only need to
> >> support hints for error_fatal, which are cases that users are supposed
> >> to see. We should exclude error_abort in MAKE_ERRP_SAFE() because these
> >> are things that are never supposed to happen. A good stack trace is more
> >> important there than adding a hint to the message.
> > 
> > We also want to handle the caller passing NULL, so that we no longer
> > have to introduce 'Error *local_error = NULL' everywhere.
> > 
> 
> With my plan of two different macro, I at least messed the case when we need
> both dereferencing and hints, which means third macro, or one macro with parameters,
> saying what to wrap.
> 
> And my aim was to follow the idea of "do propagation only if it really necessary in this case".
> 
> But may be you are right, and we shouldn't care so much.
> 
> 1. What is bad, if we wrap NULL, when we only want to use hints?
> Seems nothing. Some extra actions on error path, but who cares about it?
> 
> 2. What is bad, if we wrap error_fatal, when we only want to dereference, and don't use hints?
> Seems nothing again, on error path we will return from higher level, and a bit of extra work, but nothing worse..
> 
> So I tend to agree. But honestly, I didn't understand first part of Kevin's paragraph against propagation,
> so, may be he have more reasons to minimize number of cases when we propagate.

I think my concerns were really only about error_abort and "normal"
non-NULL errp losing some information about the origin of the error. And
from this thread, it seems that I misremebered and the normal one is
actually supposed to just work.

In any case, wrapping NULL and error_fatal should be fine, so I agree
that a single macro should do.

> To the same topic, of minimization: should we always call MAKE_ERRP_SAFE at function top, or only
> in block, where it is needed (assume, we dereference it only inside some "if" or "while"?

Hm, I think it's more obviously correct if done at the top, but I also
can't see any reason why using it only in a block wouldn't work. So I'd
put it at the top just as a matter of style.

> Kevin, is something bad in propagation, when it not related to error_abort?

Probably not, unless I didn't misremember, but we misread the code.

Kevin
