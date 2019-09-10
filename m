Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5350108wrp;
        Tue, 10 Sep 2019 04:32:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzTa8PBCHRDp4FOCSBblnQS4VP+EfRxn8oJjZiPRfeSvbycNSMImVDlcrNDp6euJe6KfekK
X-Received: by 2002:a05:620a:70c:: with SMTP id 12mr25060258qkc.284.1568115120197;
        Tue, 10 Sep 2019 04:32:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568115120; cv=none;
        d=google.com; s=arc-20160816;
        b=NoMkOxSiqExmPf1PjihWHR9UEam/A/Ez2ILneLZjF4aeNI+22uflV8OsUO6ynVS1IX
         I7+wsOMWkscVFd7cL+1wBaRcM9gszpFsrcvDRFK/tVt5xgonjLnzIzGocrw2ZPZJP9Mn
         XEmAQgaP18YAlDmqtk+hVkZL7yTKD1kCnDpgG866e9jXKeNUN+egrn7e56PJeWSoV4oR
         3nOeefT38/NIOMwnOpW0S642MIMNezmdlWQhWWESdkUFDT5Q5EWFlvBeNuKyjKQqa2ws
         X92yGlP5JGXf9M/zQ5PYyMYvPzcNZp1WBA5rUgKz40bvdHQ3CkOsOeJdpoU8G21+xxfi
         eGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O3oX1egOxeXw7SUjymG8jGQX/6JZlM5z5MVOm/96pP0=;
        b=Qhqr0ETJFktO6DLvuFGCWDrXVIFhEYI6q5FHAjoSSV+z5obO4iLChNE5i51UpBlu8G
         b2f3cW5rGxLfWJn0Y1XOeYDFxDNxu8shqnMWZe1rmuqH6lzFd9Ee+DQxy6pZ/PzKavd9
         Rlrm61asZsQ2lTTPZc1efu5kEfqswba2trlgVxuVxCBQ7I/ps3KZpLDlCnEAE831OMFo
         xAVoqvi7v1CIwbd8t/5KRA94noD5WGALDcpb6bp/yskKsJsDayutENnHr0VelwAOmfp9
         D9sswecB2Buciq5UQKZMvVEBkKwfR6lnnkNR5VuKw9VV2+3/q9uNi8AqvGvZP8PL0IBm
         /F2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6ygo28X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si2777793qtl.35.2019.09.10.04.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 04:32:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h6ygo28X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7eNL-0005cP-61
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 07:31:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1i7eK9-0004WL-2s
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1i7eK7-00012q-MN
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:28:40 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:46575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1i7eK7-00012P-GC
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 07:28:39 -0400
Received: by mail-io1-xd41.google.com with SMTP id d17so14705534ios.13
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 04:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O3oX1egOxeXw7SUjymG8jGQX/6JZlM5z5MVOm/96pP0=;
 b=h6ygo28XCm7t4ZVDjZ91wl4toPoXY35Ox1/a7bcm1Q+Y7RYfFNmH3KeFxfb/5R00nG
 8obLV6LmUxRbNEXk3z5Ni+Ajjs6Q9eyuKyom1gJtsWBxq5dzmlfsY2kxa9T9XN9PbrdM
 NUr7IRsiKrS7CP2CK7wW1M2q4QByPC6+yjudDKJd2k39HANUXjEDMH87c7niMkUoohQ3
 1egXu5qlml8Zy4Asatx2NMt3bENKAGVAKN4PCzSRFbTN5PydJKNKDCiDZ5whOENY+/TH
 TJfFqYr5AbebhplzDvBYpzz+hKGmkZufYJUBO+IHx9qqlQZGckblRy/xxh4b5bQGq0gf
 hVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O3oX1egOxeXw7SUjymG8jGQX/6JZlM5z5MVOm/96pP0=;
 b=T1ZCTQ2Bjx4GAViO1rnosgGCJNd9TdxuEPMmevYkspigbjuA39PzDc4kFnKx1aHY+v
 ImOWJbZGptFWUmrj0PraxgSsH/j7YzE6/V+L++aEqaDvxFjFL+jZs0dPDEFh8eyidrJG
 AXLn3z+uYfisRBwB9ry67in/qyu1mAImSoP187YwZtr7ThOAk8eR/mkBJZUoQ2EgZ4Y7
 x7eJ2NbJKqxvyaHLQ1xdm3LpVH1RXOMou4YKUcwMkWqZTj1BK6waEu58UcJK+BIhT9HR
 dMqBBC9B8DXlKOoxIREhmmpF5E91V4OW+xkP5kTcV+ib7YGdKLaHoiOkf8VFCRWirW81
 ujtg==
X-Gm-Message-State: APjAAAUD8+RsMbo+xs6lnogAgwJXieOO+Xpsg0fixnHTR8hhfR7hRQ2J
 E7jOrDlnfK4qysCRA5KyqE2ex6JwqpJWLOtmGOMuqw==
X-Received: by 2002:a6b:b714:: with SMTP id h20mr33072115iof.302.1568114918697; 
 Tue, 10 Sep 2019 04:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-4-beata.michalska@linaro.org>
 <20190910102601.GA2797@work-vm>
In-Reply-To: <20190910102601.GA2797@work-vm>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Tue, 10 Sep 2019 13:28:27 +0200
Message-ID: <CADSWDzs_Cof-L8dGBeYVEY1dNx4Ot6sNcAKtCrvcxZW-3+KUvA@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-devel] [PATCH 3/4] migration: ram: Switch to ram block
 writeback
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
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fT/T1gT59o3h

On Tue, 10 Sep 2019 at 12:26, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Beata Michalska (beata.michalska@linaro.org) wrote:
> > Switch to ram block writeback for pmem migration.
> >
> > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > ---
> >  migration/ram.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/migration/ram.c b/migration/ram.c
> > index b01a37e7ca..8ea0bd63fc 100644
> > --- a/migration/ram.c
> > +++ b/migration/ram.c
> > @@ -33,7 +33,6 @@
> >  #include "qemu/bitops.h"
> >  #include "qemu/bitmap.h"
> >  #include "qemu/main-loop.h"
> > -#include "qemu/pmem.h"
> >  #include "xbzrle.h"
> >  #include "ram.h"
> >  #include "migration.h"
> > @@ -4064,9 +4063,7 @@ static int ram_load_cleanup(void *opaque)
> >      RAMBlock *rb;
> >
> >      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> > -        if (ramblock_is_pmem(rb)) {
> > -            pmem_persist(rb->host, rb->used_length);
> > -        }
> > +        qemu_ram_block_writeback(rb);
>
> ACK for migration
>
> Although I do worry that if you really have pmem hardware, is it better
> to fail the migration if you don't have libpmem available?

According to the PMDG man page, pmem_persist is supposed to be
equivalent for the msync.
It's just more performant. So in case of real pmem hardware it should
be all good.

[http://pmem.io/pmdk/manpages/linux/v1.2/libpmem.3.html]

BR
Beata
>
> Dave
>
> >      }
> >
> >      xbzrle_load_cleanup();
> > --
> > 2.17.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
