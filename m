Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5144307wrp;
        Tue, 17 Sep 2019 04:48:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzS3Bf1BVjAMK/tW2Vpl7mVn7Fw0wi3nHii48JHaEbmMKtA9j9T5uggVyR2ozhlXVJ5DpbP
X-Received: by 2002:a05:6402:2022:: with SMTP id ay2mr4112846edb.109.1568720925928;
        Tue, 17 Sep 2019 04:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568720925; cv=none;
        d=google.com; s=arc-20160816;
        b=P2Pz1TbABF/RmYhz4X4akT2sv11DHpZHmse/szM2m+RCSKwupvoLSRhpr7gyyD4hkz
         6nu5cU4aH6XXmaDildDGGQ+xQIEO56mZJGgikoSwx/f9nN+Qwbk/aQIeIXVfiTCipiNb
         yYxNXYcWLTGRRNqO+tu8H0QD6FPTKLVm4bNPfGsUi8xQHT5aP+2A38Qb/1RvluyVIouw
         i5F9oAFEN1OLPryCPmj8c6PdN/6gDGh97DaPnMwWeQF+KFbleBYXrJN/JjEx0BArzp/C
         /KNxZbnHHx1DJ0RBWRpzDFX6eByQf4WRumHoXedEG3T6DBYgfD09zZTTfa1Wvy5KjxR3
         KRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=TVIcEbwGr4vm5OphCVFZO0rOrlbUtbIBNuAFv5oiscI=;
        b=KO4B3pctmVFa9xjs3ZbQygxBEVXdEHhokxhh0L1AzeSayESyTVpYw2QaRKlVUtPD6E
         IE69V9qe1N/ax0QGI7PmOpGgqoU/qsrtNYuBOi+pYp88cUCC0e1I2AKfc5o1x0gj+8kT
         HQXye063LU2Pr6MJfvTIWZs1HJE66aLBq1rSV5WynmWJ/phtVaCebBW2IaKqaa5aUlt+
         kDaZJBNWcQk6VAgm7DmJ5XsAwf9jHzIbZc/d965lqEEXblfGDeJy/3e2TLBJaLbqFZIN
         RiZGtJ2DZMNqlzAyUyHc/MR9WOgHT0LXlpz9Ap+eglI87ZeHUkTsMSLi2Z1fA0CaEDho
         Wt/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si1124783edx.302.2019.09.17.04.48.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 04:48:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAByO-00055v-7x
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 07:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iABy7-00052H-32
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:48:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iABy5-0003wx-V1
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:48:26 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:35568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iABy5-0003w1-OU
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 07:48:25 -0400
Received: from player687.ha.ovh.net (unknown [10.108.42.83])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 17D34767D7
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 13:48:23 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 2B3749DD6D0E;
 Tue, 17 Sep 2019 11:47:48 +0000 (UTC)
Date: Tue, 17 Sep 2019 13:47:47 +0200
From: Greg Kurz <groug@kaod.org>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190917134747.22a7e70f@bahia.lan>
In-Reply-To: <20190917132936.7a2b9c95.cohuck@redhat.com>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871573833.196432.7906362695920387537.stgit@bahia.lan>
 <20190917132936.7a2b9c95.cohuck@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14413207659628698050
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.44.197
Subject: Re: [Qemu-arm] [PATCH 17/17] checkpatch: Warn when errp is passed
 to error_append_hint()
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dpm3HryNiOUh

On Tue, 17 Sep 2019 13:29:36 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 17 Sep 2019 12:22:18 +0200
> Greg Kurz <groug@kaod.org> wrote:
> 
> > Passing errp from the argument list to error_append_hint()
> > isn't recommended because it may cause unwanted behaviours
> > when errp is equal to &error_fatal or &error_abort.
> > 
> > First, error_append_hint() aborts QEMU when passed either of
> > those.
> > 
> > Second, consider the following:
> > 
> >     void foo(Error **errp)
> >     {
> >          error_setg(errp, "foo");
> >          error_append_hint(errp, "Try bar\n");
> >     }
> > 
> > error_setg() causes QEMU to exit or abort, and hints aren't
> > added.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  scripts/checkpatch.pl |    4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index aa9a354a0e7e..17ce026282a6 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -2902,6 +2902,10 @@ sub process {
> >  		}
> >  	}
> >  
> 
> Maybe add a comment here?
> 
> # using errp is common practice, so that check should hopefully be enough
> 
> > +		if ($line =~ /error_append_hint\(errp/) {
> > +		    WARN("suspicious errp passed to error_append_hint()\n" .
> 
> Add "(use a local error object)"?
> 

Sure. I'll add both.

> > +			 $herecurr);
> > +		}
> >  # check for non-portable libc calls that have portable alternatives in QEMU
> >  		if ($line =~ /\bffs\(/) {
> >  			ERROR("use ctz32() instead of ffs()\n" . $herecurr);
> > 
> 

