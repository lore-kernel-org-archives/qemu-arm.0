Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5408105wrp;
        Tue, 17 Sep 2019 08:45:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyZr6dHDQG4T3h35nLQHYdAGOtPCismP3Q1jPy4hyyv1F+td9cT04tXUlUqoFjlRPcCFR+5
X-Received: by 2002:a17:906:4b47:: with SMTP id j7mr3832649ejv.63.1568735114044;
        Tue, 17 Sep 2019 08:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568735114; cv=none;
        d=google.com; s=arc-20160816;
        b=yoW8gA+hbUq6cI4Fz8toT87TBPCZbNq5/moonoI5gOYExHGB+kYB469CFWYkore+AD
         fyMRZ1k0J1c+fJzYPPjlPmH73w8DfkJu4exzaCij2r/jAv4Gyv8+MZ4t8pgB0ZRnRqAj
         ifOcM96EuLmDlbbWmqXEuKNmQBBiLUavOAY+XCEzKLWVn9IS76/vU7IDFS3Hk0PYNE2o
         tNfkwTQBS2Z9KxcCHFKg8Skp0NApY+m0lYusT2tccq5qvqsDTKhYp5q15fR1kmVOpuLo
         X2tizDujvXdZ5+3nTkMHbd3mMXEsNwC8c53A4+AafC0Bk4j2O5xnfhYuUWqXD4RlbCZO
         VsFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=OM655SOq2d/I4mo4quF8ZFtk9+j/NC8SNMjiALn0HH4=;
        b=yVme3098Sd1uBg6ceya50l9FJIezMYIZQtRzIPsg6GWq2i7z/6e8Sb6RsV6cE5cyBs
         /6bVfufeMbYNc/UQ/EOLHlGwCvyvyrOfcY1NO/pjA+xJw8Bj/IxP/gYATSeN3R3Eo7a4
         exSPMxFoP+Au1GbEWSDsuCtWLfRnRxaCYUOZNIu6GcP5EGgjM6fBrvMN+kbZX7x+3/IL
         +LKtcop02rLtklmD1uY+nboEdX5ZSNiwBSQMjw9OdxHU2bEsR3ul4rOUImGsmRqYh+KK
         VnYVqPqSuUeAsxTWgkQr+qWrnsDXO8IsNQgTxQFpjZLeOc7puu5gDSf5hjW1B+axp8Mp
         DRLA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x29si1561927eda.297.2019.09.17.08.45.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 08:45:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAFfE-0005Ix-SZ
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 11:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAFYr-0008WI-FP
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:38:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAFYp-0002aw-I9
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:38:37 -0400
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:52950)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAFYp-0002aI-AK
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 11:38:35 -0400
Received: from player693.ha.ovh.net (unknown [10.108.35.119])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 12B96664CC
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 17:38:32 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id 41F5A9E43ED4;
 Tue, 17 Sep 2019 15:37:58 +0000 (UTC)
Date: Tue, 17 Sep 2019 17:37:56 +0200
From: Greg Kurz <groug@kaod.org>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <20190917173756.5ff0e571@bahia.lan>
In-Reply-To: <5dba090e-8a59-6f42-a93a-eb676422211e@virtuozzo.com>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871564329.196432.5930574495661947805.stgit@bahia.lan>
 <5dba090e-8a59-6f42-a93a-eb676422211e@virtuozzo.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 18300377089483839827
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigdeigecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.233
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/17] block: Pass local error
 object pointer to error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: auanQo52gZRn

On Tue, 17 Sep 2019 13:25:03 +0000
Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> wrote:

> 17.09.2019 13:20, Greg Kurz wrote:
> > Ensure that hints are added even if errp is &error_fatal or &error_abort.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >   block/backup.c       |    7 +++++--
> >   block/dirty-bitmap.c |    7 +++++--
> >   block/file-posix.c   |   20 +++++++++++++-------
> >   block/gluster.c      |   23 +++++++++++++++--------
> >   block/qcow.c         |   10 ++++++----
> >   block/qcow2.c        |    7 +++++--
> >   block/vhdx-log.c     |    7 +++++--
> >   block/vpc.c          |    7 +++++--
> >   8 files changed, 59 insertions(+), 29 deletions(-)
> > 
> > diff --git a/block/backup.c b/block/backup.c
> > index 763f0d7ff6db..d8c422a0e3bc 100644
> > --- a/block/backup.c
> > +++ b/block/backup.c
> > @@ -602,11 +602,14 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
> >                       BACKUP_CLUSTER_SIZE_DEFAULT);
> >           return BACKUP_CLUSTER_SIZE_DEFAULT;
> >       } else if (ret < 0 && !target->backing) {
> > -        error_setg_errno(errp, -ret,
> > +        Error *local_err = NULL;
> > +
> > +        error_setg_errno(&local_err, -ret,
> >               "Couldn't determine the cluster size of the target image, "
> >               "which has no backing file");
> > -        error_append_hint(errp,
> > +        error_append_hint(&local_err,
> >               "Aborting, since this may create an unusable destination image\n");
> > +        error_propagate(errp, local_err);
> >           return ret;
> >       } else if (ret < 0 && target->backing) {
> >           /* Not fatal; just trudge on ahead. */
> 
> 
> Pain.. Do we need these hints, if they are so painful?
> 

I agree that the one above doesn't qualify as a useful hint.
It just tells that QEMU is giving up and gives no indication
to the user on how to avoid the issue. It should probably be
dropped.

> At least for cases like this, we can create helper function
> 
> error_setg_errno_hint(..., error, hint)

Not very useful if hint has to be forged separately with
g_sprintf(), and we can't have such a thing as:

error_setg_errno_hint(errp, err_fmt, ..., hint_fmt, ...)

> 
> But what could be done when we call function, which may or may not set errp?
> 
> ret = f(errp);
> if (ret) {
>     error_append_hint(errp, hint);
> }
> 

Same problem. If errp is &error_fatal and f() does errno_setg(errp), it
ends up calling exit().

> Hmmm..
> 
> Can it look like
> 
> ret = f(..., hint_helper(errp, hint))
> 
> ?
> 

Nope, hint_helper() will get called before f() and things are worse.
If errp is NULL then error_append_hint() does nothing and if it is
&error_fatal then it aborts.

> I can't imagine how to do it, as someone should remove hint from error_abort object on
> success path..
> 
> But seems, the following is possible, which seems better for me than local-error approach:
> 
> error_push_hint(errp, hint);
> ret = f(.., errp);
> error_pop_hint(errp);
> 

Matter of taste... also, it looks awkward to come up with a hint
before knowing what happened. I mean the appropriate hint could
depend on the value returned by f() and/or errno for example.

> ===
> 
> Continue thinking on this:
> 
> It may look like just
> ret = f(..., set_hint(errp, hint));
> 
> or (just to split long line):
> set_hint(errp, hint);
> ret = f(..., errp);
> 
> if in each function with errp does error_push_hint(errp) on start and error_pop_hint(errp) on exit,
> which may be just one call at function start of macro, which will call error_push_hint(errp) and
> define local variable by g_auto, with cleanup which will call error_pop_hint(errp) on function
> exit..
> 
> Or, may be, more direct way to set cleanup for function exists?
> 
> ===
> 
> Also, we can implement some code generation, to generate for functions with errp argument
> wrappers with additional hint parameter, and just use these wrappers..
> 
> ===
> 
> If nobody likes any of my suggestions, then ignore them. I understand that this series fixes
> real issue and much effort has already been spent. May be one day I'll try to rewrite it...
> 

For the reason exposed above, I don't think it makes sense to
build the hint before calling a function that calls error_setg().
I'm afraid we're stuck with local_err... it is then up to the
people to make it as less painful as possible.
