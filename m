Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6168287wrp;
        Wed, 18 Sep 2019 00:33:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwhz894hYS4/94+h3Sx9m7d1osnffSlzhTCH2JNDLB7bozd9ERBHcA1itdgOEP9A5cBUyW
X-Received: by 2002:a17:906:4a06:: with SMTP id w6mr5597459eju.214.1568792032280;
        Wed, 18 Sep 2019 00:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568792032; cv=none;
        d=google.com; s=arc-20160816;
        b=qnzrBvwsu6texJdD8zeDw8Fl7g4iCnF02uf5emd0eh8Bwm+XxFUR4qzjwy81QWA4Qv
         42vTQD3uM79M6vfXXbpGgRxqbkqXcIWJL73c69MUS2+zBSwXQj7hqbjGNPuxzw8miFy/
         vmHCyIO8Aou+EqjqWp44oeFIVRWZI4Ha7wK1mTCD309KQ1KN7AUEvo/4BXJSGqlcs3UD
         +yqtDwhgSjwYTo0DsaWcOhjsPVEpK7V0sHvoy61tl2+eq2CaW6VSmYd/aZeMineT1N2K
         +pTinD/ZOApUiBGGREtk0aLcRhqpPblQk9ZFI+DyEuUM3+j23YHTQI5UTSHuCn1Bn48U
         21MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xfeRFbd1Z1Y9dp/AlcIFjc76CMPOeAPWo9XvL/2iN0I=;
        b=dsEC8firkS/6GD+0n10q1vTuSCz/QURs4JJ55dkhBg3q6Skt2jJW12fyQlEiAdsstB
         y5+8L18PSKuzDTKHaQVilr/AIha2pC0usSP9cpPaD39rzpZUiy97HhZYGkYcGJDa0Eke
         fcjFUxXJ9kz61bw06O9ZpG1uUvO3uhXODsXHyRv1n2tSnlpjlsXkQSJh3uG7wlZDFXaD
         Pv4Uns0qzPjjhnR5OQdgK57ZG8fCSlb/cp0WRfwEH1xGVC3uFwlbI1UzreKhZhMGQ+mD
         P6e2iutqFfFI0B6w4qUevfxv19ht5qfrzW7oon6aHIosmJVn7RWbkCb/UUANEPD41u57
         155g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b20si2710264edc.359.2019.09.18.00.33.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 00:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAUTG-0001Kc-He
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 03:33:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAUT3-0001KB-P5
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 03:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAUT2-0001Z5-My
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 03:33:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40520)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAUT2-0001Yr-FJ; Wed, 18 Sep 2019 03:33:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0C3528980EA;
 Wed, 18 Sep 2019 07:33:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-230.ams2.redhat.com
 [10.36.116.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A08D60606;
 Wed, 18 Sep 2019 07:33:13 +0000 (UTC)
Date: Wed, 18 Sep 2019 09:33:12 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: John Snow <jsnow@redhat.com>
Message-ID: <20190918073312.GA5207@localhost.localdomain>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871564329.196432.5930574495661947805.stgit@bahia.lan>
 <19e78ae8-96dc-6154-6572-d7176057eeb7@redhat.com>
 <20190917144631.GF4824@localhost.localdomain>
 <8cbb8459-a4bb-2efc-c9f8-d9e95230b3ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cbb8459-a4bb-2efc-c9f8-d9e95230b3ac@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 18 Sep 2019 07:33:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 02/17] block: Pass local error object pointer
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
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2WAL0+lOiw/c

Am 17.09.2019 um 21:10 hat John Snow geschrieben:
> 
> 
> On 9/17/19 10:46 AM, Kevin Wolf wrote:
> > Am 17.09.2019 um 16:39 hat Eric Blake geschrieben:
> >> On 9/17/19 5:20 AM, Greg Kurz wrote:
> >>> Ensure that hints are added even if errp is &error_fatal or &error_abort.
> >>>
> >>> Signed-off-by: Greg Kurz <groug@kaod.org>
> >>> ---
> >>>  block/backup.c       |    7 +++++--
> >>>  block/dirty-bitmap.c |    7 +++++--
> >>>  block/file-posix.c   |   20 +++++++++++++-------
> >>>  block/gluster.c      |   23 +++++++++++++++--------
> >>>  block/qcow.c         |   10 ++++++----
> >>>  block/qcow2.c        |    7 +++++--
> >>>  block/vhdx-log.c     |    7 +++++--
> >>>  block/vpc.c          |    7 +++++--
> >>>  8 files changed, 59 insertions(+), 29 deletions(-)
> >>>
> >>> diff --git a/block/backup.c b/block/backup.c
> >>> index 763f0d7ff6db..d8c422a0e3bc 100644
> >>> --- a/block/backup.c
> >>> +++ b/block/backup.c
> >>> @@ -602,11 +602,14 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
> >>>                      BACKUP_CLUSTER_SIZE_DEFAULT);
> >>>          return BACKUP_CLUSTER_SIZE_DEFAULT;
> >>>      } else if (ret < 0 && !target->backing) {
> >>> -        error_setg_errno(errp, -ret,
> >>> +        Error *local_err = NULL;
> >>
> >> Can we go with the shorter name 'err' instead of 'local_err'?  I know,
> >> we aren't consistent (both styles appear throughout the tree), but the
> >> shorter style is more appealing to me.
> > 
> > I like local_err better because it's easier to distinguish from errp.
> > The compiler might catch it if you use the wrong one because one is
> > Error* and the other is Error**, but as a reviewer, I can still get
> > confused.
> 
> Doesn't that sound like a striking reason for condemnation of this
> entire model?

Might be, but do you have a better idea?

Kevin
