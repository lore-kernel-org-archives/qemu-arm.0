Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp236523ejb;
        Wed, 7 Jun 2023 06:03:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5eojWLLAeSJ6uAw7qS2saj/kIcGShKIkbrc4zjtR+NAjbo4Ou90rrZMwgk43ABIu7jGYy2
X-Received: by 2002:a05:6214:e4d:b0:626:3a98:968 with SMTP id o13-20020a0562140e4d00b006263a980968mr2979259qvc.32.1686143008936;
        Wed, 07 Jun 2023 06:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686143008; cv=none;
        d=google.com; s=arc-20160816;
        b=MbRCkrnPzVF583kIF4dry35Xc3dQnqbf+dZWRbm46tl1ORlNjCahsizjcFCC2FcYMN
         3x3PWHEip37QKarbxCZ2ofvTbYSxDkb9qn7X0sSx/bivgYDOs30E90hiHU7vDexeoRmn
         ul242EoJGWAuieNnZiwcKRyJJYUIqDUaT8vMkQsH12PhfPkJMlxqnAvgsac6vB3naJU0
         7mT5dznpoX4BtpEKkBTrp6DB/QbV7pbRORiZtdXLvDHRD0PztV54POln2pqKfJKrMA25
         r0OL33jy3U7NZpm1WP40lCt109Br+iMZNm3BY9rc9JR7vvDBgtkykVPsF+Up/EaB/fN4
         yuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZPsuLLJszRkrLz3vNy+y0fVXasjC5E/6eOWSU0fJyFM=;
        b=oYic1pQ9TBh/RSJHbb09jrlgdWASHOBADrGnztzTtx8EhLJ/7uXgxV+3y6J2J1nSIR
         f/nww9XPRndtu4zEqBiqzWOM62Q/91+nmOMSKCOCLv7kd97WWSSquO4TMoNeyLtlg3QR
         A84sMIMmzp1mZeRu9Hk7/VwrOFZLdd6o7UBYhACj+NPhHITJ/DF+gX0m5GV3wQZ3N5an
         3UUDap2tKFRSxE7ELAmFeNVmix+ohpbgb/LNoTrMZG/rRPeWRzQJnOAWs5UAKhUupKUf
         y6ZTDgZPwTKicyiciMQrut09KMWw+hzFTuPJX3klbPguZRharlolGW8QeeDsbTbDw9b8
         oLYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4yNbC5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if7-20020a0562141c4700b006258f40e7fbsi7790758qvb.454.2023.06.07.06.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Jun 2023 06:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4yNbC5K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6sot-0008I5-43; Wed, 07 Jun 2023 09:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6sor-0008FA-SP
 for qemu-arm@nongnu.org; Wed, 07 Jun 2023 09:03:21 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6soo-0006Qy-OH
 for qemu-arm@nongnu.org; Wed, 07 Jun 2023 09:03:21 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2b1afe57bdfso69024151fa.0
 for <qemu-arm@nongnu.org>; Wed, 07 Jun 2023 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686142996; x=1688734996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZPsuLLJszRkrLz3vNy+y0fVXasjC5E/6eOWSU0fJyFM=;
 b=O4yNbC5KPXt7Gs6qoJnG2hnNRVlZASLo+UyIQeUJ64BeE0783kKH3rj1RMVp4kU5L5
 NfbSsxEnrdI2Yg/TJnuGXqJ7ER73FO65Mz178GOlRHS2NmEbVv5XvqJd3gA0mdXYZ9S/
 28KQUFdmzBCohg52mqfD8ycuUlzM6boCfTMzPtFXxvvezcXrG78HZ8GgBbSDsXdOqoZF
 B+Z4qwM1zjGxLeOo9BiaUdqndX/8b2qL48a8aTF5LIQ13umrgk6ylmJoWi3pTKS7znJq
 +3DxevFVK8qTZ5eRF4ai5xyicft34mu2ru8XZbe4Cx/5Ky6bHS9KF+gvyHfIN2ELWfNQ
 q4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686142996; x=1688734996;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZPsuLLJszRkrLz3vNy+y0fVXasjC5E/6eOWSU0fJyFM=;
 b=jXuzLYFB9Bx6qUxbVoIdxD3DIQXs+4qFyATQ7dHYx5B/ZzDk3/2MOYTuohRjYHbxhx
 DbTgJ1NFgm1CYX/QfK+LcWeqDgTVKQyYWuXOD4nLRL9I2MM4RB0JUlqjrTkuVcBPZqOR
 6MtSB2mjC2QirnoK87xwhItF2kVhH7qfgvXBdvNV7wPD/piFnHbYj9amwQqwnWFzmT02
 WncXXWbpts4MpkNwUExNDW5J39rjDH+zCyjYj1rDK/emWlRlH2GlHvaNXFjWGCG7IaV+
 3aZXq/x8w3rRpkRbXFKDBUjerFKgN+JKzj5gHLKGL048BqekMpwJjfCJPyee7NdQ5qEf
 qNSw==
X-Gm-Message-State: AC+VfDwkW5aS4z/kS+tnncP8q5k1BE5STaieQvkG3ZjSiHOiv4+uPut+
 Qkz/ftWk6QyZiCZSmqEa8FxD08saP6MspkqBJH+cFLWxd9LzRC8x
X-Received: by 2002:a05:651c:20e:b0:2b1:fda8:e653 with SMTP id
 y14-20020a05651c020e00b002b1fda8e653mr1103693ljn.27.1686142995724; Wed, 07
 Jun 2023 06:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230606134917.3782215-1-peter.maydell@linaro.org>
 <CACPK8Xd3_ets6btF9ULqjFn_eT55M8t8C+_iQXg-_eXGDLDWqw@mail.gmail.com>
In-Reply-To: <CACPK8Xd3_ets6btF9ULqjFn_eT55M8t8C+_iQXg-_eXGDLDWqw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Jun 2023 14:03:04 +0100
Message-ID: <CAFEAcA812y_cG2+AMPRwAE_8_9DGOM_J7_zqHFju5mazr9hqYQ@mail.gmail.com>
Subject: Re: [PATCH] hw/timer/nrf51_timer: Don't lose time when timer is
 queried in tight loop
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DAMX5Rr4pvBy

On Wed, 7 Jun 2023 at 12:26, Joel Stanley <joel@jms.id.au> wrote:
>
> On Tue, 6 Jun 2023 at 13:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > The nrf51_timer has a free-running counter which we implement using
> > the pattern of using two fields (update_counter_ns, counter) to track
> > the last point at which we calculated the counter value, and the
> > counter value at that time.  Then we can find the current counter
> > value by converting the difference in wall-clock time between then
> > and now to a tick count that we need to add to the counter value.
> >
> > Unfortunately the nrf51_timer's implementation of this has a bug
> > which means it loses time every time update_counter() is called.
> > After updating s->counter it always sets s->update_counter_ns to
> > 'now', even though the actual point when s->counter hit the new value
> > will be some point in the past (half a tick, say).  In the worst case
> > (guest code in a tight loop reading the counter, icount mode) the
> > counter is continually queried less than a tick after it was last
> > read, so s->counter never advances but s->update_counter_ns does, and
> > the guest never makes forward progress.
> >
> > The fix for this is to only advance update_counter_ns to the
> > timestamp of the last tick, not all the way to 'now'.  (This is the
> > pattern used in hw/misc/mps2-fpgaio.c's counter.)
> >
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > The hang in icount mode was discovered by the Zephyr folks as part
> > of their investigation into
> > https://github.com/zephyrproject-rtos/zephyr/issues/57512
>
> Did you get an image to test with?

Yes, somewhere in the comments on one of the pullrequests
associated with that issue one of the Zephyr devs helpfully
provided a test image.

> Reviewed-by: Joel Stanley <joel@jms.id.au>
>
> >
> >  hw/timer/nrf51_timer.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
> > index 42be79c7363..50c6772383e 100644
> > --- a/hw/timer/nrf51_timer.c
> > +++ b/hw/timer/nrf51_timer.c
> > @@ -45,7 +45,12 @@ static uint32_t update_counter(NRF51TimerState *s, int64_t now)
> >      uint32_t ticks = ns_to_ticks(s, now - s->update_counter_ns);
> >
> >      s->counter = (s->counter + ticks) % BIT(bitwidths[s->bitmode]);
> > -    s->update_counter_ns = now;
> > +    /*
> > +     * Only advance the sync time to the timestamp of the last tick,
> > +     * not all the way to 'now', so we don't lose time if we do
> > +     * multiple resyncs in a single tick.
> > +     */
> > +    s->update_counter_ns += ticks_to_ns(s, ticks);
> >      return ticks;
>
> We're still returning the number of ticks up to 'now'. Should we
> instead return the elapsed ticks? If not, we will expire the timer
> early.

Hmm, I'm not sure what you mean here. The tick count at the
'update_counter_ns' time and the tick count at 'now' should be
identical (because there can't ever be an entire tick difference
between them).

thanks
-- PMM
