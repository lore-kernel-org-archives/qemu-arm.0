Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5540719wrp;
        Tue, 10 Sep 2019 07:21:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxcrj+kOFcENXoxg1jlK7OOYQGRLd1yCPofzvSowAYHw2in6cwZ6sbEurTfYon+XV5zbxoa
X-Received: by 2002:a17:906:6818:: with SMTP id k24mr24609042ejr.271.1568125310432;
        Tue, 10 Sep 2019 07:21:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568125310; cv=none;
        d=google.com; s=arc-20160816;
        b=zfexUHYuuoOcLpXqvfDH33lBIlm0MzYJ8lzORHoVL+lUe4XvOSgXBjPaMHibm6mNcd
         ZfTsNwRstelMmw9x2OIkwt2nrPtIIJ8dKrfBewv5xlwCfTFpcU/P2cs01795bMwz4vqd
         TyXWQjiVuaE7NeX4+YSaMDB3rTwz0wu2/jsKqWdKfsnItp4vnNH4qAkUtLP2QHUSrUft
         H2B2sJb3QDhsYV4j9VuY3UPoJ7mwJYJfb317SexE0b5+WW3Gp5q+V60Hvk5lpsiwnt1N
         PZtYw0TivZIMEF0xROYkDSrfziOkYBv7Vu7lcd3qSCkmbm3xyJUK4Wiht+9G6pY1069B
         xp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wfRraz2ruSHapGr6bfmzq/GsC2dcKbWra3/cK+B22II=;
        b=IOiu3tdhF//j68IPV6Xmub6nvR8wgK3F1Fkhu2Ej/iQq9b2HWVJnz+WePHC9lAMq1/
         nunxLGXzvXvblEVp+gfQoxot85n24wWhDtD+IGflSmcmDMrBBXFLamqKoDyUHQD+jhne
         4QocYDjO8BqRgppb4mh9FlmDpXFJLyKKpCaXRvfwFCQyGZxNcCzjDEKO1BfOdb6lgOaT
         WKc98bMoKHSw+sB0rmBTChAV5y2iZwcvnlDLCtkpHBn+X1zGISGkqgTNsRypkrRrfTLq
         aRSSMnSJhvbOueI8xS20vA5zMSA5WV0lw1oeYU+TSa1D76b709XI+lqaM/QYjwzwfOwu
         9M9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ycqOOqAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si8254509edr.68.2019.09.10.07.21.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 07:21:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ycqOOqAC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7h1h-0002bp-DW
	for alex.bennee@linaro.org; Tue, 10 Sep 2019 10:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49414)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1i7h1W-0002bL-L2
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:21:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1i7h1V-0002QP-70
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:21:38 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:38078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1i7h1U-0002OM-VZ
 for qemu-arm@nongnu.org; Tue, 10 Sep 2019 10:21:37 -0400
Received: by mail-io1-xd44.google.com with SMTP id k5so12610568iol.5
 for <qemu-arm@nongnu.org>; Tue, 10 Sep 2019 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfRraz2ruSHapGr6bfmzq/GsC2dcKbWra3/cK+B22II=;
 b=ycqOOqACfAnPjwma5p/hFLiJ9hRtspl83x4g17PdzWEu4Nlu3Zx47AKGg1nyXy2lGd
 pJ6hlpxb58VE260bfd4za4ZBXasiHEw6YBUlzjXqH1W+pJq+zbDYpevVGT8XrpVlwV0y
 VuIIQN96avX3KL64eqd25D2KI6O1ojlEu9hLjB1ybIcsull7NKQttpEh6Tr3/W+nlSyv
 Al9odGL09637Lu/263IRRzsMY4++5c50Y1oQtppJr16x2qahmCLurQnvwZKwvKfVUPFD
 TTIiBHyLN445Vga5jhjn9p02qvhkk9K80VzgW+U7oYW1jczWHCz/3lDQWxLgJ9jWhUZk
 ZO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfRraz2ruSHapGr6bfmzq/GsC2dcKbWra3/cK+B22II=;
 b=nGujM22ZRULjU7D9FGEc8jiTJgxFxwIAZD0ECsVHakl5G+0KR5F+SmgDWSerr9eTrR
 A6+w/RDFiWo8DAgP7zb+YAVJILqQ4dxS6kHIbvY2RaxhuC6x1c2AhURznOwR4/LU3laG
 oUM0UIoS1iwjx71o/yLbqxrGZtFu8VebDXG7oVOqo6eG0trLQPPH67OTS2HIlvn4dg9W
 otftKvlGqHCeMrl8/Tmo35QWYMFrohGDtJSYPaEOsbbzg2h5RiRNfielrFDOwAQ05zWU
 5hQc9QTvRwGvQtWmiq23jFRGVuLiO7TvwgX/STqS6djZ/r7V/hNzCmn9JBbRLC7XfxG5
 vhsQ==
X-Gm-Message-State: APjAAAVHSj6HF5K4u6p2jG2SrF1bAarZDl4WmVyzVL6k/jJ/TGjOKQSl
 KoqGBWh7nvRaUp4SLdOKflijVzSWTKWOVc1jQvlf/A==
X-Received: by 2002:a6b:7709:: with SMTP id n9mr28108266iom.187.1568125295788; 
 Tue, 10 Sep 2019 07:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-4-beata.michalska@linaro.org>
 <20190910102601.GA2797@work-vm>
 <CADSWDzs_Cof-L8dGBeYVEY1dNx4Ot6sNcAKtCrvcxZW-3+KUvA@mail.gmail.com>
 <20190910131617.GC2797@work-vm>
In-Reply-To: <20190910131617.GC2797@work-vm>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Tue, 10 Sep 2019 15:21:24 +0100
Message-ID: <CADSWDzuuWqBF9rP57Zv7jFPKUhFdVLq-O_uqs29i4dAFz+CgUA@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
X-TUID: pxVC7qD2gIki

On Tue, 10 Sep 2019 at 14:16, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Beata Michalska (beata.michalska@linaro.org) wrote:
> > On Tue, 10 Sep 2019 at 12:26, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > * Beata Michalska (beata.michalska@linaro.org) wrote:
> > > > Switch to ram block writeback for pmem migration.
> > > >
> > > > Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> > > > ---
> > > >  migration/ram.c | 5 +----
> > > >  1 file changed, 1 insertion(+), 4 deletions(-)
> > > >
> > > > diff --git a/migration/ram.c b/migration/ram.c
> > > > index b01a37e7ca..8ea0bd63fc 100644
> > > > --- a/migration/ram.c
> > > > +++ b/migration/ram.c
> > > > @@ -33,7 +33,6 @@
> > > >  #include "qemu/bitops.h"
> > > >  #include "qemu/bitmap.h"
> > > >  #include "qemu/main-loop.h"
> > > > -#include "qemu/pmem.h"
> > > >  #include "xbzrle.h"
> > > >  #include "ram.h"
> > > >  #include "migration.h"
> > > > @@ -4064,9 +4063,7 @@ static int ram_load_cleanup(void *opaque)
> > > >      RAMBlock *rb;
> > > >
> > > >      RAMBLOCK_FOREACH_NOT_IGNORED(rb) {
> > > > -        if (ramblock_is_pmem(rb)) {
> > > > -            pmem_persist(rb->host, rb->used_length);
> > > > -        }
> > > > +        qemu_ram_block_writeback(rb);
> > >
> > > ACK for migration
> > >
> > > Although I do worry that if you really have pmem hardware, is it better
> > > to fail the migration if you don't have libpmem available?
> >
> > According to the PMDG man page, pmem_persist is supposed to be
> > equivalent for the msync.
>
> OK, but you do define qemu_ram_block_writeback to fall back to fdatasync;
> so that would be too little?

Actually it shouldn't. All will end-up in vfs_fsync_range; msync will
narrow the range.
fdatasync will trigger the same call just that with a wider range. At
least for Linux.
fdatasync will also fallback to fsync if it is not available.
So it's going from the best case scenario (as of performance and range of mem
to be synced) towards the worst case one.

I should probably double-check earlier versions of Linux.
I'll also try to verify that for other host variants.

BTW: Thank you for having a look at the changes.

BR
Beata

>
> > It's just more performant. So in case of real pmem hardware it should
> > be all good.
> >
> > [http://pmem.io/pmdk/manpages/linux/v1.2/libpmem.3.html]
>
> Dave
>
> >
> > BR
> > Beata
> > >
> > > Dave
> > >
> > > >      }
> > > >
> > > >      xbzrle_load_cleanup();
> > > > --
> > > > 2.17.1
> > > >
> > > --
> > > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
