Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1885554wrp;
        Thu, 12 Sep 2019 02:11:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUQjx5XwfpkDzNd4txlu7/SRMHqU8gxTdYO5gF/Yngjps3szGpQ6N2alei8+Nnd5DN876M
X-Received: by 2002:a37:714:: with SMTP id 20mr39970873qkh.32.1568279479010;
        Thu, 12 Sep 2019 02:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568279479; cv=none;
        d=google.com; s=arc-20160816;
        b=03EiRPmXnY9vknXH4BokZ880Ps5+z90MKZZjxh0xW2RbCWID7qOgr2w5Yz6dBIm+O3
         xJkW7p+7Fu4jkzXfS8oAyVBXuu28mVbNnB3BpfiF8cph6Eozr2XVU6vmuAAfAedVtEC4
         hFuuwta3EZtWxO/Rvupf2m+/VmkHp0eyqhNnuyFT7eb6Z6DfPeefMXFcNCQXQpyP8oSc
         9oEgVxgmELBGimYF1iD5UJdOuGLqYaqFvNgzl1LKcIYfyPsgJhRpr9v3/3hO/fRsFx54
         YSxWlH3bjP8uFoP/lxBxNRprRYzttrQHNqoACkUVQKPOPnfei3uX2RfnrO/W7F9JN9lN
         tq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fjN5P0wM5n5cAbnTGz8QNFvuTGIcf+TJUZALuen0eKM=;
        b=n38ktovO/01jENyjpdLLsNYRmFDXhz5GOyxrgXN9C+ktHDiDKDa/OPIJve7KoFE0/P
         XsjSHfHwB7ESDnjUZXDiYaSlgytZWRFzlETgQYklxPjj+km5ZxOwbZ2sz0H2Ocsp2StQ
         R9g+6TEGksnVHIr2eqF+OlMQIKJE9dlc6Htur8HztPGfP6L6OjJ2zkA7Y7/TZnMo+BSi
         jimNeRSKqlA/jcZa+AgxCpIFyPhtZLn1/g5MVmofOlaVFDIeH59JxPPot0VLPRKa7JKJ
         ItP887LYD2+8EOQQzYy/LFt9PPeBEdlPuYjndAKi9pFTUxLJ5LX7eEe/GBqSWRk6NTmO
         p39Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yKSyTQVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h25si7401720qkj.177.2019.09.12.02.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2019 02:11:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yKSyTQVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i8L8I-0008Lu-9v
	for alex.bennee@linaro.org; Thu, 12 Sep 2019 05:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1i8L88-0008LK-1j
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 05:11:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1i8L86-0001w7-41
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 05:11:07 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:40780)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1i8L85-0001vg-PV
 for qemu-arm@nongnu.org; Thu, 12 Sep 2019 05:11:06 -0400
Received: by mail-io1-xd41.google.com with SMTP id h144so52716226iof.7
 for <qemu-arm@nongnu.org>; Thu, 12 Sep 2019 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fjN5P0wM5n5cAbnTGz8QNFvuTGIcf+TJUZALuen0eKM=;
 b=yKSyTQVIwOlJB/pyXlaLU4BM2G61Bir//KZz/q1/m73pQ3sVrLDLK+zfNEEddBBNpE
 yah8Dvlhqp1ibsslZMkJQC2Scm21wdK8YqzZCzS9mzpA2eOveubXmNUo6UHWEit/U+hk
 OHuJSlm5uBT0hHTL6CRk3hJLuY7i2XC3rrdG5Hv9WVcJVpoe3T07jueRVfe+aRRX61DA
 0Ie/imUd3OZsobOA7y0uCRBQf7nGVZwncdEvbc93dANuzO1v/LDIUGF9Dl2zKvm8OGDX
 XwRjU+jw3DFTSKhSjRWTwSbIp/HBGAPupnLusyGD5S+vswbIC7mn/RmygrwULkQ7pKSa
 bBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fjN5P0wM5n5cAbnTGz8QNFvuTGIcf+TJUZALuen0eKM=;
 b=I6Jl5SX7t+uNWjJPWePrOCBVSE2LBOEKQT8FLXLsSKE4zuzaNCHcjJ0FD3Hn38GY10
 gMHROcay10ths1F0j1Ycsbnt2yuIsLGE46ERvOP+5cAgumBYbz2cFPmbAvESfJabnNpL
 ma+jswx+hl/VquJazUD/ulBHjTi6IwApecOR4k1lL7nAwVVMmk7P1YkweJ2Qt/lENgfq
 r7EE/rW1nJronE0iAJrSrO/D6Rzd4vg+rweZOeE1+NtA4ndvF55knQRCKXgt3hAoTK3p
 +sCtK9ImQSi37CBeG0LGbAWaabKobg5THClIQvkbxobYiVYwNDidK2YVMCZf2rGrQkZR
 Y5mQ==
X-Gm-Message-State: APjAAAX4u5XoEcFF/45cb/SMqs7dzF3eWDhNdLQZeGTyEDUspfydaQE+
 Ar5/zN9QnUVSIIQ/3UEB73gLAwUXws89BZtqhKKfXw==
X-Received: by 2002:a6b:b714:: with SMTP id h20mr3199503iof.302.1568279463439; 
 Thu, 12 Sep 2019 02:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-4-beata.michalska@linaro.org>
 <20190910102601.GA2797@work-vm>
 <CADSWDzs_Cof-L8dGBeYVEY1dNx4Ot6sNcAKtCrvcxZW-3+KUvA@mail.gmail.com>
 <20190910131617.GC2797@work-vm>
 <CADSWDzuuWqBF9rP57Zv7jFPKUhFdVLq-O_uqs29i4dAFz+CgUA@mail.gmail.com>
 <20190911103645.GF2894@work-vm>
In-Reply-To: <20190911103645.GF2894@work-vm>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Thu, 12 Sep 2019 10:10:51 +0100
Message-ID: <CADSWDztimAoz_bjfOUPQH7t8vLuJWaqYFOJvQkc-rBHi8Mnyxw@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-arm] [PATCH 3/4] migration: ram: Switch to ram block
 writeback
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
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UERZ+B8Mv4Un

On Wed, 11 Sep 2019 at 11:36, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Beata Michalska (beata.michalska@linaro.org) wrote:
> > On Tue, 10 Sep 2019 at 14:16, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Beata Michalska (beata.michalska@linaro.org) wrote:
> > > > On Tue, 10 Sep 2019 at 12:26, Dr. David Alan Gilbert
> > > > <dgilbert@redhat.com> wrote:
> > > > >
> > > > > * Beata Michalska (beata.michalska@linaro.org) wrote:
> > > > > > Switch to ram block writeback for pmem migration.
> > > > > >
> > > > > > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > > > > > ---
> > > > > >  migration/ram.c | 5 +----
> > > > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > > > >
> > > > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > > > index b01a37e7ca..8ea0bd63fc 100644
> > > > > > --- a/migration/ram.c
> > > > > > +++ b/migration/ram.c
> > > > > > @@ -33,7 +33,6 @@
> > > > > >  #include "qemu/bitops.h"
> > > > > >  #include "qemu/bitmap.h"
> > > > > >  #include "qemu/main-loop.h"
> > > > > > -#include "qemu/pmem.h"
> > > > > >  #include "xbzrle.h"
> > > > > >  #include "ram.h"
> > > > > >  #include "migration.h"
> > > > > > @@ -4064,9 +4063,7 @@ static int ram_load_cleanup(void *opaque)
> > > > > >      RAMBlock *rb;
> > > > > >
> > > > > >      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> > > > > > -        if (ramblock_is_pmem(rb)) {
> > > > > > -            pmem_persist(rb->host, rb->used_length);
> > > > > > -        }
> > > > > > +        qemu_ram_block_writeback(rb);
> > > > >
> > > > > ACK for migration
> > > > >
> > > > > Although I do worry that if you really have pmem hardware, is it better
> > > > > to fail the migration if you don't have libpmem available?
> > > >
> > > > According to the PMDG man page, pmem_persist is supposed to be
> > > > equivalent for the msync.
> > >
> > > OK, but you do define qemu_ram_block_writeback to fall back to fdatasync;
> > > so that would be too little?
> >
> > Actually it shouldn't. All will end-up in vfs_fsync_range; msync will
> > narrow the range.
> > fdatasync will trigger the same call just that with a wider range. At
> > least for Linux.
> > fdatasync will also fallback to fsync if it is not available.
> > So it's going from the best case scenario (as of performance and range of mem
> > to be synced) towards the worst case one.
> >
> > I should probably double-check earlier versions of Linux.
> > I'll also try to verify that for other host variants.
>
> Well I guess it should probably follow whatever Posix says;  it's OK to
> make Linux specific assumptions for Linux specific bits - but you can't
> do it by code examination to guarantee it'll be right for other
> platforms, especially if this is in code ifdef'd for portability.
> Also it needs commenting to explain why it's safe to avoid someone else
> asking this question.
>
I will definitely address that in the next version.
Will just wait a bit to potentially gather more input
on the series.

> > BTW: Thank you for having a look at the changes.
>
> No problem.
>
Thanks again.

BR
Beata
> Dave
>
> > BR
> > Beata
> >
> > >
> > > > It's just more performant. So in case of real pmem hardware it should
> > > > be all good.
> > > >
> > > > [http://pmem.io/pmdk/manpages/linux/v1.2/libpmem.3.html]
> > >
> > > Dave
> > >
> > > >
> > > > BR
> > > > Beata
> > > > >
> > > > > Dave
> > > > >
> > > > > >      }
> > > > > >
> > > > > >      xbzrle_load_cleanup();
> > > > > > --
> > > > > > 2.17.1
> > > > > >
> > > > > --
> > > > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
