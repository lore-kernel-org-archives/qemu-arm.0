Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6311101wrp;
        Wed, 18 Sep 2019 03:27:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUhzzatWW1wEw0uO8xkSSaRi/j/mrgiM2pPDIHu6sCeD8CTrIUWAlMmLsjP4T2tna9FLY7
X-Received: by 2002:a37:b385:: with SMTP id c127mr3191963qkf.346.1568802435349;
        Wed, 18 Sep 2019 03:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568802435; cv=none;
        d=google.com; s=arc-20160816;
        b=Ou4GmL2uBsj7OcrjAYwd06A70Evs+4SY4otQ2BY3P0n982A6NEXuLUBHuLBHVb33/D
         o42y21Ki6xKzwD98xV/N3mguNQ3JcmNC2UmKl68PCVO03ayNjiCffHX2vriyC6DfjXmG
         sQcvneXU8xddKrEh63bJbkCy6GLmVwkU6Rd0t3SRfr8jGUr0zvK2+q9V+hZGQNAStLDP
         jhgPmhW7Vs5/MkoT63yqPWmvmQ7OigSFSc5lQZzj16RN9GFWHtpnqnHU5sD2BMAF25PZ
         J3X4gNbxkPqqnzjCS0KYN77+HCHIDWKtwnEt2J5sxNxUht6UjmemXTRFZtPxk7lCKOUN
         Ktzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=d34EH89fPOWgtToOQJln7JkzYKgIHH8+oqRYOLVpfDA=;
        b=khXimby4uXp+wZqJDu0LxLHq5cLKPo7d586+A9ued4MVaqrY/gzlPTcjE32k2QZjPn
         GG8sCg/NxqcgnJ24wO+DYOwMhmpcCo8qL4GUBXeetnj2+sHOb57+m0hkaxFKcZLZJSJy
         QBSLSjw/IQLB+s8F4BIaJIj/EQueqMEq0cP5PHpAguB/BP6Wa40m5ejbTQHHJ0tpKHUn
         W+cPDbkzHYjG/a8Qjy+LgGdi+W6AeRT++hqPbbz5p3lM6u3QheeMOBGQL0zkskybrkzk
         XIBayASbtXt1bY3X0NE0U/4/HZCSX05sjgJy97YBF7dg788vtWWspSHfPWCZ7Dv2I5p5
         sTYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si3646937qvl.73.2019.09.18.03.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Sep 2019 03:27:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAXB3-0004SR-U7
	for alex.bennee@linaro.org; Wed, 18 Sep 2019 06:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35919)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1iAXAo-0004SE-Sc
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 06:26:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1iAXAm-00047N-H1
 for qemu-arm@nongnu.org; Wed, 18 Sep 2019 06:26:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37724)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1iAXAm-00046j-Bp; Wed, 18 Sep 2019 06:26:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB85C882F2;
 Wed, 18 Sep 2019 10:26:54 +0000 (UTC)
Received: from gondolin (dhcp-192-230.str.redhat.com [10.33.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D443460A9F;
 Wed, 18 Sep 2019 10:26:30 +0000 (UTC)
Date: Wed, 18 Sep 2019 12:26:28 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Greg Kurz <groug@kaod.org>
Message-ID: <20190918122628.7acb9284.cohuck@redhat.com>
In-Reply-To: <20190917183620.044e980d@bahia.lan>
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871569396.196432.12307975838741351907.stgit@bahia.lan>
 <20190917132412.6610576c.cohuck@redhat.com>
 <20190917183620.044e980d@bahia.lan>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Wed, 18 Sep 2019 10:26:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
X-TUID: SqLg7VyBRdUV

On Tue, 17 Sep 2019 18:36:20 +0200
Greg Kurz <groug@kaod.org> wrote:

> On Tue, 17 Sep 2019 13:24:12 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Tue, 17 Sep 2019 12:21:34 +0200
> > Greg Kurz <groug@kaod.org> wrote:
> >   
> > > Ensure that hints are added even if errp is &error_fatal or &error_abort.
> > > 
> > > Signed-off-by: Greg Kurz <groug@kaod.org>
> > > ---
> > >  hw/s390x/s390-ccw.c |    6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)  
> > 
> > Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> > 
> > Can also take this via the s390 tree, let me know what would work best.  
> 
> I guess it would be easier to merge if each individual patch goes
> through the corresponding sub-maintainer tree. But Eric mentioned
> in another mail that the whole whole series could maybe go through
> Markus' error tree... so, I don't know which is best. :)

Ok, it's probably best to take this through the s390 tree, as I plan to
send a pull request tomorrow :)

Thanks, applied.
