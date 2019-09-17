Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5338621wrp;
        Tue, 17 Sep 2019 07:47:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxmOdphRBLeRHlY04dJDlzlV0y8dEsFgsF5gimn2CBYqHjpL2o4fzL/EbgGqcEtwhniKpOv
X-Received: by 2002:ac8:2c50:: with SMTP id e16mr3972154qta.257.1568731639581;
        Tue, 17 Sep 2019 07:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568731639; cv=none;
        d=google.com; s=arc-20160816;
        b=0x3S33acNVuU1X3fwSPNr4mI8pdypSq/qznxz3XJ9jftbKq2g0mP1zzQpGvGpWhJGu
         DljTG5gRQubkx07278VBRE44J/bbDOg9DgEv+FQrpCokpqVo4z5VNFSmOfiy/+5248XG
         CX+URCjz431GRyAv3c+BFbJTaCQgUn3Kd30D7U9p2WKEz/NFMk7asH0wSwAathE3wLyg
         kBNP7KtpBx3G926cb6vXyZWG/EN+7Cs5Hvo8jv/zaCmrcJ3nBOL6DLXmWtQqWeCHNh/N
         Fo1IXG+3ZgRfxCCILqQ3yI5KIWd5rJ3yu9wEBum49oOD+pQoWo86G8lPxGBKMMl8vAbo
         Ys5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=68NWoWtZnf5UStEjOpxmpqF0tZKcstDcP1LO27o4xEw=;
        b=gaKIMq3VthifUUSb9upHMRv/uKzxwxExMqf05S7R5/U/8zx8nDV1Wu+/A1sA779HkR
         J53mN6+DuUYNM+rXywl5W8JdGRr4uPf3OblvIccIOTf2f8w6EoSm1O/cQDVdKyhul3SF
         rA40S/q869umi7yZf4lce2CRls5b7WDnEfdxBcNmzekWtsCxTZsUhDf9shmBOtNk6ufg
         fMADT8+6bl8uS8ko2yF3/AIlnnQXeRllrSWw/4LFsSjHOetUUuQyc4/oOSq9Tj8Ve/gp
         K+sv8EuX/kn1vsK5XJqvke31y6C3i3dlmhyxzGpfBOit6J6z2XiAGi+CaSTymlXKyWab
         gC6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si1821096qtc.289.2019.09.17.07.47.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 07:47:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAElC-0000kC-CN
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 10:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55582)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iAEkc-0000ji-6j
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 10:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iAEka-0000iz-LA
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 10:46:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47970)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iAEka-0000iY-Dc; Tue, 17 Sep 2019 10:46:40 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7970C1DB0;
 Tue, 17 Sep 2019 14:46:39 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-202.ams2.redhat.com
 [10.36.116.202])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F3B85C1D8;
 Tue, 17 Sep 2019 14:46:33 +0000 (UTC)
Date: Tue, 17 Sep 2019 16:46:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190917144631.GF4824@localhost.localdomain>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871564329.196432.5930574495661947805.stgit@bahia.lan>
 <19e78ae8-96dc-6154-6572-d7176057eeb7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19e78ae8-96dc-6154-6572-d7176057eeb7@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 17 Sep 2019 14:46:39 +0000 (UTC)
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
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Greg Kurz <groug@kaod.org>, Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GJiTX32lBHhS

Am 17.09.2019 um 16:39 hat Eric Blake geschrieben:
> On 9/17/19 5:20 AM, Greg Kurz wrote:
> > Ensure that hints are added even if errp is &error_fatal or &error_abort.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  block/backup.c       |    7 +++++--
> >  block/dirty-bitmap.c |    7 +++++--
> >  block/file-posix.c   |   20 +++++++++++++-------
> >  block/gluster.c      |   23 +++++++++++++++--------
> >  block/qcow.c         |   10 ++++++----
> >  block/qcow2.c        |    7 +++++--
> >  block/vhdx-log.c     |    7 +++++--
> >  block/vpc.c          |    7 +++++--
> >  8 files changed, 59 insertions(+), 29 deletions(-)
> > 
> > diff --git a/block/backup.c b/block/backup.c
> > index 763f0d7ff6db..d8c422a0e3bc 100644
> > --- a/block/backup.c
> > +++ b/block/backup.c
> > @@ -602,11 +602,14 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
> >                      BACKUP_CLUSTER_SIZE_DEFAULT);
> >          return BACKUP_CLUSTER_SIZE_DEFAULT;
> >      } else if (ret < 0 && !target->backing) {
> > -        error_setg_errno(errp, -ret,
> > +        Error *local_err = NULL;
> 
> Can we go with the shorter name 'err' instead of 'local_err'?  I know,
> we aren't consistent (both styles appear throughout the tree), but the
> shorter style is more appealing to me.

I like local_err better because it's easier to distinguish from errp.
The compiler might catch it if you use the wrong one because one is
Error* and the other is Error**, but as a reviewer, I can still get
confused.

Kevin
