Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5456333wrp;
        Tue, 17 Sep 2019 09:27:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxS8ztM9S9+CjqXBicF7+2cB3PAwT8Om5LA4Z1Fbjx1t1BuKmPGpHSUj4epM559CoRcYw92
X-Received: by 2002:a17:906:20c7:: with SMTP id c7mr5433260ejc.248.1568737672565;
        Tue, 17 Sep 2019 09:27:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568737672; cv=none;
        d=google.com; s=arc-20160816;
        b=NGmAHTOHnu9Dv8cR0sYzdZRP8xzpLoQNNyrtLLGHHzEJY0+Ot/93zrkauorBAeVJo1
         Zw8QmuXw18eeuRg+ra1yIXdYN+UJD2y7gNCnkp208P4+71jwM8wcgvGBorT1y+aYzoCH
         IFg/XSvsMnbO3U7MVM6u993BdapybCwSgfmLrzRVhwF0d8yUGhFfEXFbPdnWiPwXah33
         /0lVBw2Ok0dCZBdchFUPqmUALHkQMEYcjbX57OECFBZ6Mg2g4mT000BY5+slLg61NvSV
         oJ8ER93wEbRW3wvgqHdTxkSKvpZrsEG0Jxo9s1wsTH0xR9C3CZujHGEQnrc0YqWWNnlD
         D2Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=N3NwcwX2sHAgAzd7uj2NHwfrGxt/xwj6BxFHPDuWy1w=;
        b=hsn4GzJfEvAehTOiI5RyZqZfXF0uf2W828HJH08hM23djHDUadRormRE/P53nV98lr
         c5Y6NDoWepC5V7scYel/vjK1GXiNFRI4CrvBiD7PpwMrrtlL/TsbY3jbkP0g7mpY76Ww
         PH4kHGtqh0yr7qF+VEJCk/Ye0zRw01EkOjM9sa3pri3cuY0ZJ4vBPs+OC+B4nBL32NjO
         Ok1IkrcArOPcA3RNvbwug/DVhlvkEsVjUhWHJG5wM+Lmpo9bCnRQsRLFDHoibPdwoiQf
         okmeyrF33usn9be5UFKu8iCZ1zRDiJKeyXdcp1nSm7uSJQxlh98/vYovJ6acKs7+JOG6
         7OBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j46si1684015eda.9.2019.09.17.09.27.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 09:27:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAGKV-0006NH-Ag
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 12:27:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44737)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAGKG-0006I8-EU
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:27:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAGKE-0006I3-Gd
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:27:35 -0400
Received: from 8.mo7.mail-out.ovh.net ([46.105.77.114]:57792)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAGKE-0006HA-8S
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:27:34 -0400
Received: from player799.ha.ovh.net (unknown [10.108.57.95])
 by mo7.mail-out.ovh.net (Postfix) with ESMTP id E974D13336E
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 18:27:31 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 2D3BD9E56172;
 Tue, 17 Sep 2019 16:26:57 +0000 (UTC)
Date: Tue, 17 Sep 2019 18:26:56 +0200
From: Greg Kurz <groug@kaod.org>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190917182656.1db277b1@bahia.lan>
In-Reply-To: <de1d7856-3c59-0e94-2ba8-d0438e9d0ff6@redhat.com>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871571297.196432.545961868971946073.stgit@bahia.lan>
 <de1d7856-3c59-0e94-2ba8-d0438e9d0ff6@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 680887968690772361
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.77.114
Subject: Re: [Qemu-arm] [PATCH 13/17] nbd: Pass local error object pointer
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
 =?UTF-8?B?TWFyYy1BbmRy?= =?UTF-8?B?w6k=?= Lureau <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e91Lo77Hyb6o

On Tue, 17 Sep 2019 10:15:07 -0500
Eric Blake <eblake@redhat.com> wrote:

> On 9/17/19 5:21 AM, Greg Kurz wrote:
> > Ensure that hints are added even if errp is &error_fatal or &error_abort.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  nbd/client.c |   24 +++++++++++++-----------
> >  nbd/server.c |    7 +++++--
> >  2 files changed, 18 insertions(+), 13 deletions(-)
> > 
> > diff --git a/nbd/client.c b/nbd/client.c
> > index b9dc829175f9..c6e6e4046fd5 100644
> > --- a/nbd/client.c
> > +++ b/nbd/client.c
> > @@ -154,6 +154,7 @@ static int nbd_handle_reply_err(QIOChannel *ioc, NBDOptionReply *reply,
> >                                  bool strict, Error **errp)
> >  {
> >      g_autofree char *msg = NULL;
> > +    Error *local_err = NULL;
> 
> I'd prefer 'err' here...
> 
> >  
> >      if (!(reply->type & (1 << 31))) {
> >          return 1;
> > @@ -161,14 +162,14 @@ static int nbd_handle_reply_err(QIOChannel *ioc, NBDOptionReply *reply,
> >  
> >      if (reply->length) {
> >          if (reply->length > NBD_MAX_BUFFER_SIZE) {
> > -            error_setg(errp, "server error %" PRIu32
> > +            error_setg(&local_err, "server error %" PRIu32
> 
> so that &err doesn't change line lengths.
> 
> >      case NBD_REP_ERR_SHUTDOWN:
> > -        error_setg(errp, "Server shutting down before option %" PRIu32 " (%s)",
> > +        error_setg(&local_err, "Server shutting down before option %" PRIu32 " (%s)",
> 
> For example, here, you went beyond 80 columns.
> 
> At any rate, I'm assuming this will probably go in through Markus' error
> tree as part of the whole series, rather than me needing to pick just
> this patch through my NBD tree.
> 
> Whether or not you shorten the local variable name,
> 

Regardless of which tree this goes through, it will be code for
which you're the official maintainer in the end. I'll gladly fix
it to meet your needs :)

> Reviewed-by: Eric Blake <eblake@redhat.com>
> 

