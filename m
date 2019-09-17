Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5473408wrp;
        Tue, 17 Sep 2019 09:44:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3TH3rpyyy2v8yZ5pMqMavcsXC52w0uJuDvE8MAiRsar3Zsicv2G8R0GkGAbznU5A5+Sp9
X-Received: by 2002:a17:906:ce46:: with SMTP id se6mr5638782ejb.198.1568738693099;
        Tue, 17 Sep 2019 09:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568738693; cv=none;
        d=google.com; s=arc-20160816;
        b=x8UO5IeXU11zIcrVDiho424hoI9f7oNNc7a1fkfvu65jQaBsR4iGQ6FlFxUfPYaW9A
         lZpAfTYoqJwE5HEeRP9tHiBFk0qhSv7r+VngatBDUkgJzExR07opSu4URJx+kMDL+lws
         yJoA8QSEwDivZ6ILrZpN2gUulpwYVHhnbiTJFe8cq4gr//BXTX6jrotyer2D/HUBY8JE
         WIkxB5O6lSplkaVffdV4kRANw1qhIHVILX2+Dblp0CTfuyspVxfevCspoxVXXAPUVts2
         iF90FpE5cWZbv0EX3eGdaUcCygBbV4SxNOjtOxlavvvMDdLrOc6FXoOWow3tPA2VKcpt
         CjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Eo7w9Yf7lLspQhs+pfoV+Oy/JDXcVM2UELfdCYyo1cU=;
        b=GrT8h48Bvn8Y2ikQtiCPbAQPDQTDka23NawC3Cow+Ow5u5O2Yd+JW43PLFWRHbee0x
         72JYCjiP4ua60ZrZ5uQrox60WWX9ZuvXouMWDEAgY36qcRy4Us6K64+b0qGAfsI3YLoz
         3DabV2D9Bh5Ng3g5m92P4l73VrdoxYdwP3gdgugNNkLcur1kVAjceqXn6Ns99mSUz7Fm
         lGsey3Gu+BGQY0gTIfQByDjmgMT4h4ID/xy5rDIFa7UG63h+PsxwAcYUCu0AEVSB8pQw
         Lq0xYB3Q7Y650oeK7ln7DyND8DRqKwyKDWrWLlCUm9ngCcVPZCYV4WAu121dzLyeUmdz
         fi3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k7si1432595ejk.266.2019.09.17.09.44.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 09:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAGax-0004PD-V5
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 12:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46023)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iAGTM-0005yR-QP
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:37:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iAGTL-00031k-ML
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:37:00 -0400
Received: from 8.mo178.mail-out.ovh.net ([46.105.74.227]:34678)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iAGTL-00030s-E8
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 12:36:59 -0400
Received: from player772.ha.ovh.net (unknown [10.109.160.39])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 5863978E21
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2019 18:36:57 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 84BF69E615EE;
 Tue, 17 Sep 2019 16:36:21 +0000 (UTC)
Date: Tue, 17 Sep 2019 18:36:20 +0200
From: Greg Kurz <groug@kaod.org>
To: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20190917183620.044e980d@bahia.lan>
In-Reply-To: <20190917132412.6610576c.cohuck@redhat.com>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871569396.196432.12307975838741351907.stgit@bahia.lan>
 <20190917132412.6610576c.cohuck@redhat.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 839639857592310210
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeigdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.74.227
Subject: Re: [Qemu-arm] [PATCH 10/17] s390x/css: Pass local error object
 pointer to error_append_hint()
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
X-TUID: y0677x7EsGdi

On Tue, 17 Sep 2019 13:24:12 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Tue, 17 Sep 2019 12:21:34 +0200
> Greg Kurz <groug@kaod.org> wrote:
> 
> > Ensure that hints are added even if errp is &error_fatal or &error_abort.
> > 
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  hw/s390x/s390-ccw.c |    6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> 
> Can also take this via the s390 tree, let me know what would work best.

I guess it would be easier to merge if each individual patch goes
through the corresponding sub-maintainer tree. But Eric mentioned
in another mail that the whole whole series could maybe go through
Markus' error tree... so, I don't know which is best. :)
