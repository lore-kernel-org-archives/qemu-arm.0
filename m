Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1007983lfg;
        Thu, 20 Feb 2020 13:21:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqxDPMIifAjhDUf4wl5LeEIUmTdb/u3eHxxO6nnDrwvPLQgIy0rXwXI/cj5lfYhjWpgO+PvC
X-Received: by 2002:a05:620a:4cc:: with SMTP id 12mr29304345qks.153.1582233678519;
        Thu, 20 Feb 2020 13:21:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582233678; cv=none;
        d=google.com; s=arc-20160816;
        b=gF2GSlJviS/3Uk7IOwFQ2EpeQw4jZVJVqsRkgW96iTILvUwakzlkNaLJhVKts0GP/y
         4aczqKDizVV8ph4vtUGPVGwZftSrQTbztN/Bs6CqzqpQolXh9IQQ1eDmrSf0p0Cis35M
         92NfG4RSEByAD0/u2nr07W8uUQUtcILh5pAXKcOyq0QM5MkcUX0srbEd6MK4dmZ39Bhy
         N/GzqHTE4cC3fJYzjwYz8bQjs93EB3IZrnv31p6jPrgtZ38OCPSssxNqSo+BkgI39iEW
         w5gEvyu4d/GU7cJxC2YIDEej/XMAaeK0K8KhNdHQsgjh5iGoBeoKZNda1Sv7X4Yn6rkm
         tCKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YnFfOr1DIkvANCIdmIygvtIPcgNJtHgZY1pV50qrnYA=;
        b=ZrzArtd4tQ81urvpPeUzTlGINwh93RWTr+lAVZNnjBrIsvuTcf7gt25WzVsyHPhslm
         nqjDOHwxmhebgs85E3ko/E2nPZTJydP+jrw0Wd1Pe5CGdS+7hXhcEogqf2v/i5UrrCVF
         W1lcAC9q/LiqcdU8LsmQ8a4zIom7iKQkDm9x9D+u9loibw5kCeP6JlXOGTJ87tvfs6Fw
         g6C2m8XoXfLUtxyvZSas2VvlbVdg4pbK25ShJJ6zakpiurUBQgbPByULAaVe3b4G6Mlp
         i3inPrACvImIVmuTH11v3IlIr+srCLnDbhL6CkFKG3LgB7gYNArHf1nF5AMoccaSo5LL
         NVCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=auj4Et6T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 188si393713qkl.348.2020.02.20.13.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 13:21:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=auj4Et6T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4tG1-0005kr-Uh
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 16:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47247)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4tFt-0005kM-2f
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 16:21:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4tFr-0002JJ-ND
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 16:21:08 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:41509)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4tFr-0002Ir-HF
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 16:21:07 -0500
Received: by mail-oi1-x242.google.com with SMTP id i1so29025118oie.8
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 13:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YnFfOr1DIkvANCIdmIygvtIPcgNJtHgZY1pV50qrnYA=;
 b=auj4Et6Tlciab+LGElZTFsjgvl+7Tp5wVj0gxombpiXDbUKQWfDD14pfhUUn+X+Msk
 Bu0nCaGg0omAmKFreWQLLAP7L1T7d0/LB/l/dWuVCNfC1yROalZn+uapY6AvCYv4rPht
 tCyc0Lemk965i2UYwsrd3hz1J82OKNWtsGWTg22y0uAJWfIQmsT5YLM7eugsu0Hs19yN
 +L770TAoWYA3hO8wWFhy2xliGPYiIzwebGjVUjtSACw93blrO6p5lK9VXtnlJLrUXz3h
 nXgE0oVuMHJSb/tobgiOn/eZ35nK8GT2YQxQCVAyCjb277ME7hjiMSgTm6yngx6QXDxi
 pDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YnFfOr1DIkvANCIdmIygvtIPcgNJtHgZY1pV50qrnYA=;
 b=AIycnAG2ClrtwCvH8NzYxIFyUUkZV5v+n4YzZ3VRAhFvMXGDGkXdZn9yvDR/XX8/sN
 iTNZR4L6mvUsV+Ex154sTExOiZ7ILpFMz5Dk0/3/DUXe3X94FPYiyqa7ZKe1/xBBpZK8
 hYlFN1hh8wPtbMdrq6K8s55gdT5B/YoJW4yfPsXHKCl9aSi27C+qxmUBmDpCkxHvNeJ6
 4GhZQ3CHbaT1K+Avj7fYrqH/pmeV2eMd3V5wkrTeGilT/7kaD7ycQda23Nhemi+Gurwk
 bUEnHP3pbpspfwRBJtuy/zDGLOmQo9MV4l8Lgh33wiKMTdG3+4G72gDHY4rGyQbN6X+p
 SC8w==
X-Gm-Message-State: APjAAAWf0zFLyFwRxWRuiF1ZyDCg9rEdpc2VgCC+z5w+QZSPShXsqceI
 eIc1ZqAKJ9Nk1Fldu9Il8JFUjrE9x9I+oZwUMvzUsg==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr3695887oiy.170.1582233666323; 
 Thu, 20 Feb 2020 13:21:06 -0800 (PST)
MIME-Version: 1.0
References: <20200217032127.46508-1-pannengyuan@huawei.com>
 <20200217032127.46508-3-pannengyuan@huawei.com>
 <CAFEAcA_AxCVaAgho3g2q=kCifSdhz9Qi72eoVAM9gRjb3-_Sog@mail.gmail.com>
 <747a3358-09af-d4fa-9150-57ad3e349f24@redhat.com>
In-Reply-To: <747a3358-09af-d4fa-9150-57ad3e349f24@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 21:20:55 +0000
Message-ID: <CAFEAcA8ovMyTGNB_NA8ybPLdnneKjvNFY=qyP0DEFS9cmUJo-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw: move timer_new from init() into realize() to
 avoid memleaks
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 Alistair Francis <alistair@alistair23.me>,
 Pan Nengyuan <pannengyuan@huawei.com>, QEMU Developers <qemu-devel@nongnu.org>,
 mav2-rk.cave-ayland@ilande.co.uk, qemu-arm <qemu-arm@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Euler Robot <euler.robot@huawei.com>,
 andrzej zaborowski <balrogg@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RFybanZrA4Lk

On Thu, 20 Feb 2020 at 18:52, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 2/20/20 6:56 PM, Peter Maydell wrote:
> > On Mon, 17 Feb 2020 at 03:22, <pannengyuan@huawei.com> wrote:
> >>
> >> From: Pan Nengyuan <pannengyuan@huawei.com>
> >>
> >> There are some memleaks when we call 'device_list_properties'. This pa=
tch move timer_new from init into realize to fix it.
> >> Meanwhile, do the null check in mos6522_reset() to avoid null deref if=
 we move timer_new into realize().
> >>
> >> Reported-by: Euler Robot <euler.robot@huawei.com>
> >> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> >> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >
> >
> >> diff --git a/hw/misc/mos6522.c b/hw/misc/mos6522.c
> >> index 19e154b870..980eda7599 100644
> >> --- a/hw/misc/mos6522.c
> >> +++ b/hw/misc/mos6522.c
> >> @@ -465,11 +465,15 @@ static void mos6522_reset(DeviceState *dev)
> >>       s->timers[0].frequency =3D s->frequency;
> >>       s->timers[0].latch =3D 0xffff;
> >>       set_counter(s, &s->timers[0], 0xffff);
> >> -    timer_del(s->timers[0].timer);
> >> +    if (s->timers[0].timer) {
> >> +        timer_del(s->timers[0].timer);
> >> +    }
> >>
> >>       s->timers[1].frequency =3D s->frequency;
> >>       s->timers[1].latch =3D 0xffff;
> >> -    timer_del(s->timers[1].timer);
> >> +    if (s->timers[1].timer) {
> >> +        timer_del(s->timers[1].timer);
> >> +    }
> >>   }
> >
> > What code path calls a device 'reset' method on a device
> > that has not yet been realized ? I wasn't expecting that
> > to be valid...
>
> This is not valid. What I understood while reviewing this patch is on
> reset the timer is removed from the timers list. But this patch miss
> setting timer =3D NULL in case the device is reset multiple times, here
> can happen a NULL deref.

I should have checked the APIs here.

timer_new() allocates memory and initialises a timer.
timer_del() removes a timer from any list it is on, but
does not deallocate memory. It's the function you call
to stop a timer (and arguably timer_stop() would be a
better name for it).
If you created the timer with timer_init(), then the
code to clean it up is:
 (1) call timer_del() to make sure it's not on any
list of active timers
 (2) call timer_free()

So:
 * the mos6522_reset code is fine as it is
 * if we wanted cleanup code that undoes the timer_new
   then that would be a timer_del() + timer_free().
   This would go in unrealize if the timer_new is put
   in realize, but...
 * ...like the other devices touched in this patch,
   mos6522 isn't user-creatable, so if realize succeeds
   it won't ever be destroyed; so we don't need to
   do that. (This is a little harder to check than
   with most of these devices, since mos6522 is an
   abstract base class for some other devices, but
   I think it's correct.)

Side notes:
 * for new code, rather than using timer_new() or one
   of its sibling functions, prefer timer_init(),
   timer_init_ns(), etc. These take a pointer to a
   pre-existing QEMUTimer, typically one you have
   directly embedded in the device state struct. So
   they don't need to be freed on unrealize (though
   you do still want to make sure the timer is not
   on an active list with timer_del() before the memory
   in the device state struct goes away).
 * maybe timer_free() should call timer_del(),
   rather than obliging the caller to?

thanks
-- PMM
