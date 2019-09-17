Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5472718wrp;
        Tue, 17 Sep 2019 09:44:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzhgXIE+QRViV33uLHPxTo+PNC01gdExRRLrwpf55IOfvTuCKZcB3t0IDO7BMZrwQ+Dyol/
X-Received: by 2002:a05:6214:452:: with SMTP id cc18mr3868718qvb.41.1568738649545;
        Tue, 17 Sep 2019 09:44:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568738649; cv=none;
        d=google.com; s=arc-20160816;
        b=Js+0E0a4gNEaFBufD0HGX87U5ru/zUlN6v/prdz5b6d4Pxy0DBmcdM2Jk5jpD54sMh
         SfX36tbWmTqzxht0xNcIGQuWJj/y1jM5w7Tup0kDJbFLQ2i3f+PEmWAs3/uARjEUwcnP
         piMOIlFKeXfOuD+HETv/e6y+yuSbu59ITdU8QR8ZP9wzvdXrFRAumVEv6sIui7faa9Go
         lY/3UDHpkVK8+EEBicDGZU2Jdh+6d3V3n1i7R/mhuis9wc/ewcUGvHhZN3xsC3clMICQ
         zTRDeI/CU8YLKodie46nmI3dPVkjUHq0IkmAnjB8fmAp608VfTqvbP+3TaxeFJsmERB0
         5Lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=BhLYmmxQRCu3IffZfU1BcUa8pTwd6yETbw437LyrrG8=;
        b=sDsZjZXEQ8ql1W4gJ+tegybqfQ9ye93Y9JB+WJ7Ror8jWPGuMieVAslyEafO0Hap21
         un4/OzEddFeNR3yAmTqI2Kzh9gTtJKxpyAC01u4XmjpdY1lRtcY9PdnJX3vzUFtZ/Sa1
         k1Lc43kSBdYNBJ5XYKTThCZ3EADpdaVAjA6GfA6c9L9eY1kj/jRoEB9iGF5+ISp1nday
         Ld2R4tCIVHRl5/2CZUo37l11lwgF6wKR0gyMA6ugjvfTiZHeEZh4HAdPjM7XaMbMay67
         1+32a4w2/SPU+/LjWIrwPhoyLu2AXqRpKvqe0wb7xN1S+SNT+dqPkzKb1mQ88NUemBA5
         iZWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 42si2252015qtp.220.2019.09.17.09.44.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 09:44:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAGaG-0002x5-HB
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 12:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAGX2-000143-GP
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAGX0-0004Tv-W8
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:40:48 -0400
Received: from 3.mo178.mail-out.ovh.net ([46.105.44.197]:59711)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAGX0-0004T2-PT
 for qemu-devel@nongnu.org; Tue, 17 Sep 2019 12:40:46 -0400
Received: from player690.ha.ovh.net (unknown [10.108.54.36])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 060B378BBA
 for <qemu-devel@nongnu.org>; Tue, 17 Sep 2019 18:40:45 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id B105E9CEC431;
 Tue, 17 Sep 2019 16:40:09 +0000 (UTC)
Date: Tue, 17 Sep 2019 18:40:08 +0200
From: Greg Kurz <groug@kaod.org>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190917184008.577fcccb@bahia.lan>
In-Reply-To: <20190917144631.GF4824@localhost.localdomain>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871564329.196432.5930574495661947805.stgit@bahia.lan>
 <19e78ae8-96dc-6154-6572-d7176057eeb7@redhat.com>
 <20190917144631.GF4824@localhost.localdomain>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 904097628508363016
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigdejjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.44.197
Subject: Re: [Qemu-devel] [PATCH 02/17] block: Pass local error object
 pointer to error_append_hint()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kU16D+jtJkGb

On Tue, 17 Sep 2019 16:46:31 +0200
Kevin Wolf <kwolf@redhat.com> wrote:

> Am 17.09.2019 um 16:39 hat Eric Blake geschrieben:
> > On 9/17/19 5:20 AM, Greg Kurz wrote:
> > > Ensure that hints are added even if errp is &error_fatal or &error_abort.
> > > 
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >  block/backup.c       |    7 +++++--
> > >  block/dirty-bitmap.c |    7 +++++--
> > >  block/file-posix.c   |   20 +++++++++++++-------
> > >  block/gluster.c      |   23 +++++++++++++++--------
> > >  block/qcow.c         |   10 ++++++----
> > >  block/qcow2.c        |    7 +++++--
> > >  block/vhdx-log.c     |    7 +++++--
> > >  block/vpc.c          |    7 +++++--
> > >  8 files changed, 59 insertions(+), 29 deletions(-)
> > > 
> > > diff --git a/block/backup.c b/block/backup.c
> > > index 763f0d7ff6db..d8c422a0e3bc 100644
> > > --- a/block/backup.c
> > > +++ b/block/backup.c
> > > @@ -602,11 +602,14 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
> > >                      BACKUP_CLUSTER_SIZE_DEFAULT);
> > >          return BACKUP_CLUSTER_SIZE_DEFAULT;
> > >      } else if (ret < 0 && !target->backing) {
> > > -        error_setg_errno(errp, -ret,
> > > +        Error *local_err = NULL;
> > 
> > Can we go with the shorter name 'err' instead of 'local_err'?  I know,
> > we aren't consistent (both styles appear throughout the tree), but the
> > shorter style is more appealing to me.
> 
> I like local_err better because it's easier to distinguish from errp.
> The compiler might catch it if you use the wrong one because one is
> Error* and the other is Error**, but as a reviewer, I can still get
> confused.
> 

I'll favor the official maintainer, hence keeping local_err :)

> Kevin

