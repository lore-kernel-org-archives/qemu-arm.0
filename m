Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1149431wrm;
        Thu, 17 Oct 2019 09:03:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYs8HGk31uScTIZjbgltg1KZtKzuMHs7NOfU6GqIpi1xFOBSYpG1jnaWCzc5woMyq35OrR
X-Received: by 2002:a37:a8d3:: with SMTP id r202mr3780914qke.405.1571328184779;
        Thu, 17 Oct 2019 09:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571328184; cv=none;
        d=google.com; s=arc-20160816;
        b=VqzlKtjUrks+5N+94E25GcEkaT+UsMOLp6oT15AQotCPGKNj5Z4f9c6K0nO9J7i18F
         SO68zn5IxeS126zkmiFpuY+ObMwgL1WzbDic8wpjq6JXlP0bMChMwUGWkqZQOw8+Za58
         TXrTleleQrbH5s7QJvbV3Tjfc1jcona140sA7vJZhxrlrlLjSybqcwEwTp47gWC/FUaQ
         UUaLsj6aEHuLnW62pSjqotqWpSONGg5SHqjOLX7bybkJabX05sTWDpbji0tmj1OqFj0F
         Sx+viDN2mQ0EyXVznkfB3BbgN4yyYJtwE+SeoN8lggTA+iJoM4hycOph8cI7eRzsjKyB
         rmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fNuiZxDXxKW4b1rxU5MwVhy7UslYOkpsYFLTQrIrZh4=;
        b=o2EDxAlU2BpHkfWSzwYiPS+ReV+TPyLmH1hvKO1EQPlLPu15CBpUaLUsT0tqFUo+F6
         PUbROJyXlRFMjmmOuZDep4Ikzl16NcuEiw3iAu6ODhV1MOvxVYcKIG3mNbPvdzLTA65v
         2uBZgKlZZoWMA53a44fJj2E5GUWmuWamsGtNPDGdIhDF/ddJn8JjAILq2Sx1MH3RudT7
         a0428RdNpd2uQtTmbH5Frrc27IzF6TO5P3J6JoLC8Lc/x03SbjB4Gy7s0PaVmWM2BOnB
         mSjvHVWTv41+Ev4LBa/LDsRwP6/xkUptG5SeCrcYD7oTkXUvvJ5jVOzzKgj+9XxUGXYS
         7JNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cNcKwAxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3si2211095qtj.56.2019.10.17.09.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 09:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cNcKwAxh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL8Ex-0004L3-Cu
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 12:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54143)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL7MG-0000JH-Qv
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:06:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL7MF-0008D6-Ih
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:06:32 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:40100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL7MF-0008Cg-EK
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 11:06:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id y39so2170008ota.7
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 08:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fNuiZxDXxKW4b1rxU5MwVhy7UslYOkpsYFLTQrIrZh4=;
 b=cNcKwAxhUgNDOJvCTtgAtWQA3K+GQsbTih5kA8Nc/NPKcXN9yn76d8w7pyn4U4ZR8j
 by8ZQjjZ9TE8VFnKMCwrbnXlWO+atjUVoWlj56UvE2pcuyvkyUpKfsJP1gG90jLR7LoX
 6pf6R0TxSJGMXZcZ1U0SV7EwrotSxkT1KSTco+fODHwBoUSAIENrN8mk7LIJToSEq5m4
 YjLRb1skeHGFuTpHMrPwCJ74KtX1dNZwHAXYZx7DOnzWYMbSdOLsurRlF4mFJmDtxXxq
 eGndFYEQgnVEAAW0OVt1WZFHabtRBSnzHt41/KJG0yKs5pfLBbpJ4eUpDbAHh6cqTpXP
 yp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fNuiZxDXxKW4b1rxU5MwVhy7UslYOkpsYFLTQrIrZh4=;
 b=B87HqUnSl0fVYAP1AZhYAuT60ftFQnBRP2iCyelr0A3dww8O3e0rlMi6EmA+Rlq8Qh
 bpO4ecMy2sjApocQobPL/2u8PhXsOg5abvdOTsRpNKPDOyB2k0i8INLju/Jaz3eeQ5Re
 uGIhCC4GP0STydXaa36taiobS4mcAv5Qkhxciovwcd6nAjS+GE5Hm1g7kwpFwGSINkgC
 rH66gkA2fiRL+1NUgCcU5jciC0sJwxtHF8cPKqduSSg9+gg2IH032MJZhn5qjJfGn7EA
 2161mvunXQUIQTmXzpnwLkq7NFyc/wzQ4VJMHr/kgRSBBTgqtGcGtTC7VwqCsYsRG3wT
 NwQw==
X-Gm-Message-State: APjAAAXEae5BGAPmR+TB+Eeplc0H9mWJXh7RIe6iE+/w4YHH7TPsllPy
 +9GZxuWQYUMWdUPpNMRGcb4grETLRS3fH1/z5B74sQ==
X-Received: by 2002:a9d:30c1:: with SMTP id r1mr3507111otg.91.1571324790733;
 Thu, 17 Oct 2019 08:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20191017132122.4402-1-peter.maydell@linaro.org>
 <20191017132122.4402-4-peter.maydell@linaro.org>
 <d9e7dd55-01e5-d852-bbab-84f5209abb6f@redhat.com>
In-Reply-To: <d9e7dd55-01e5-d852-bbab-84f5209abb6f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 16:06:19 +0100
Message-ID: <CAFEAcA_zz=SYwD=iDgwVZcvPF4seZW9qdvfGKfmK_UaaUDF7Vg@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/dma/xilinx_axidma.c: Switch to transaction-based
 ptimer API
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OU6MzZ/m3fqs

On Thu, 17 Oct 2019 at 16:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi Peter,
>
> On 10/17/19 3:21 PM, Peter Maydell wrote:
> > Switch the xilinx_axidma code away from bottom-half based ptimers to
> > the new transaction-based ptimer API.  This just requires adding
> > begin/commit calls around the various places that modify the ptimer
> > state, and using the new ptimer_init() function to create the timer.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   hw/dma/xilinx_axidma.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> > index e035d1f7504..fb3a978e282 100644
> > --- a/hw/dma/xilinx_axidma.c
> > +++ b/hw/dma/xilinx_axidma.c
> > @@ -31,7 +31,6 @@
> >   #include "hw/ptimer.h"
> >   #include "hw/qdev-properties.h"
> >   #include "qemu/log.h"
> > -#include "qemu/main-loop.h"
> >   #include "qemu/module.h"
> >
> >   #include "hw/stream.h"
> > @@ -104,7 +103,6 @@ enum {
> >   };
> >
> >   struct Stream {
> > -    QEMUBH *bh;
> >       ptimer_state *ptimer;
> >       qemu_irq irq;
> >
> > @@ -242,6 +240,7 @@ static void stream_complete(struct Stream *s)
> >       unsigned int comp_delay;
> >
> >       /* Start the delayed timer.  */
> > +    ptimer_transaction_begin(s->ptimer);
> >       comp_delay =3D s->regs[R_DMACR] >> 24;
> >       if (comp_delay) {
> >           ptimer_stop(s->ptimer);
> > @@ -255,6 +254,7 @@ static void stream_complete(struct Stream *s)
> >           s->regs[R_DMASR] |=3D DMASR_IOC_IRQ;
> >           stream_reload_complete_cnt(s);
> >       }
> > +    ptimer_transaction_commit(s->ptimer);
>
> I'd restrict the transaction here within the if() statement:
>
> -- >8 --
> @@ -244,9 +244,11 @@ static void stream_complete(struct Stream *s)
>       /* Start the delayed timer.  */
>       comp_delay =3D s->regs[R_DMACR] >> 24;
>       if (comp_delay) {
> +        ptimer_transaction_begin(s->ptimer);
>           ptimer_stop(s->ptimer);
>           ptimer_set_count(s->ptimer, comp_delay);
>           ptimer_run(s->ptimer, 1);
> +        ptimer_transaction_commit(s->ptimer);
>       }
>
>       s->complete_cnt--;

The timer_hit callback function itself writes to
s->complete_cnt, so we don't want to allow it to
be called (via the commit()) before stream_complete()
is done with changing that state.

thanks
-- PMM
