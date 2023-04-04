Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp759793ejb;
        Tue, 4 Apr 2023 08:45:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350at13bp95FlWxSFW3ASE5+bMux4sffprBdoLEMkFRLM+cu51B5JzF5nzg1UQviz+LIrBwVh
X-Received: by 2002:a05:6214:e44:b0:5a1:a8c6:77a6 with SMTP id o4-20020a0562140e4400b005a1a8c677a6mr4157979qvc.21.1680623122541;
        Tue, 04 Apr 2023 08:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680623122; cv=none;
        d=google.com; s=arc-20160816;
        b=h4ISOSjpEBwf3V3rU9AC7eC1P39HfFFPuOOvzMYyNKx7TdQQIwVGHIt9ZasEGW+Wkl
         Nvo52INP0ikF6meNOyQTXiZQZ5d3eH0loC0j2D+NEQNUzAYUJ1Vk9TmjG3HNKg4erb0O
         OBXfPnO9TJS2eYz7Mo59qfHE8BQPgw+s2PkWnKuLMkZKFdcqHpmiGg0cEb6UkdOv8ilj
         9zQLTh8INXyYvG8cD7Jhw67l4zYSVvDQpUWWXx2a6uyiHqgToEh+Wqe7ZIP3kde5XNM0
         fkID/TZKJ73hldIOLrGMHwufga82kNv7GWhxhFGVdRK6l/x/cget2goCzFljxUBLcqFX
         SuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uB+NUxhB2f9O1zfRnJO76Hbw627RcL7S8kpnJ5Esk2c=;
        b=iFy8gXzMi4WD0lTzf0ekoBQJRXCsNADFLBzyzqESGo/hxWvA0WkhJo8l++XrudlPpM
         CD3WbCQhFD5kJe6gvXKED65HfzSdgIr9Kl9PnzlyekyVvvwlUfb4R6p/IokZpB9jn3DL
         JBt/mZCpTIpfceGnyZpCo3ioefRnjhm41ILxGFu3cenpQzJgqK9SxvT5Z828vEWabGQD
         Hr+kGlDfoS0OEMutd16JJWkNbdT8VCsYcEw01JTvRsDm6RcfJQhrvJawx0+KSdbC2JY8
         niZ79c1vi+EHsTPFttwGMfDW/fgae55LAFMNDDOnS2XM16yLvrWoRL9tQ68p0LGwZRXH
         dauw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VLKPsGbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im3-20020a056214246300b005a927154b59si8125731qvb.354.2023.04.04.08.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Apr 2023 08:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VLKPsGbt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pjiqO-0004IC-J5; Tue, 04 Apr 2023 11:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjiqE-0004HS-W5
 for qemu-arm@nongnu.org; Tue, 04 Apr 2023 11:45:04 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pjiqC-000254-CX
 for qemu-arm@nongnu.org; Tue, 04 Apr 2023 11:45:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id b20so132440292edd.1
 for <qemu-arm@nongnu.org>; Tue, 04 Apr 2023 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680623096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uB+NUxhB2f9O1zfRnJO76Hbw627RcL7S8kpnJ5Esk2c=;
 b=VLKPsGbt5OCIQ9qu4KmoelgwWbofEkhiQ0gHYRNTkCy0bPCFDsSQtf9kvftrfiUia/
 208d5XBRPB7cYv6tNDzGmEdtiq0ZiQn35azf4wzlGKX8hFjnaWGWpQLXyIs5O3TRvQlW
 1QnX6hDiWjKoWWE/+Kmh0i3mWJZwJaf4KteF8WC95YefY8fw9+IZ9ye9IZLNpMvaCUud
 YUHJz8C3A1zLT8LI2hO1B4ylJv9zuhevvKthHfKXKS2qPHIjakBEH6mrtT0HjGdKGF/D
 +5dN3UeEN1u/XDcE8Lof6d9svF0WvKFdSSrjsh1d1sjv9ZC5RP+LGQL1SczCYt3Oh5we
 FcGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680623096;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uB+NUxhB2f9O1zfRnJO76Hbw627RcL7S8kpnJ5Esk2c=;
 b=7nCQjz8bx2IdUti6dUoegegcUfS9tmAhy+TbjdvGPiAkjUIzmTbCmSF9PC30D/TY/O
 phBd9dK17Pvjz9iJZF9zAnfrwvwaRRXMkPZBrmSawu+5CU/ht48KA3mA9WycGC6h0O3s
 pe+f6jb2nhxhmP9gRy9bxNi6yBK2GvyoUx0A+YL6FezgPMW7ukbYxKsQ8NLTnhzDHmef
 VlalHp+h+keTbE0GoJdBUIRhMLo3X+Zm6YCbVPLl/TlNCNQl7KwKZFZNAC5UMmTWEnTn
 SJhWOwk5Cb4JqGooptjXiXSHmZxGrOZmmSnbol1eOftW2WrKSI3cqJAfn5ddwaMof2XJ
 6C3Q==
X-Gm-Message-State: AAQBX9c9OUXKx10nwpX9KHNRudhg5xsiZO94Mxd3goj7WcIZQ95Vl5Sx
 2CKzwPaXgWw04TOWIM3+QhTxxRM9jthmCWTQ3UJH+VtUtPZFOQtSKSQ=
X-Received: by 2002:a50:a457:0:b0:4fb:3549:a708 with SMTP id
 v23-20020a50a457000000b004fb3549a708mr1593195edb.6.1680623096284; Tue, 04 Apr
 2023 08:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-8@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-8@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 16:44:45 +0100
Message-ID: <CAFEAcA9JLOhxa3LeiFJ8YqinuSV33N4Vbj2m4ZnoOxry0=YGGA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 8/8] hw/timer/imx_epit: fix compare timer
 handling
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ONb9TPPDKWAx

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> - fix #1263 for CR writes
> - rework compare time handling
>   - The compare timer has to run even if CR.OCIEN is not set,
>     as SR.OCIF must be updated.
>   - The compare timer fires exactly once when the
>     compare value is less than the current value, but the
>     reload values is less than the compare value.
>   - The compare timer will never fire if the reload value is
>     less than the compare value. Disable it in this case.
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Hi; Coverity has just noticed an issue with this patch:


> -/* Must be called from ptimer_transaction_begin/commit block for s->timer_cmp */
> -static void imx_epit_reload_compare_timer(IMXEPITState *s)
> +/*
> + * Must be called from a ptimer_transaction_begin/commit block for
> + * s->timer_cmp, but outside of a transaction block of s->timer_reload,
> + * so the proper counter value is read.
> + */
> +static void imx_epit_update_compare_timer(IMXEPITState *s)
>  {
> -    if ((s->cr & (CR_EN | CR_OCIEN)) == (CR_EN | CR_OCIEN))  {
> -        /* if the compare feature is on and timers are running */
> -        uint32_t tmp = ptimer_get_count(s->timer_reload);
> -        uint64_t next;
> -        if (tmp > s->cmp) {
> -            /* It'll fire in this round of the timer */
> -            next = tmp - s->cmp;
> -        } else { /* catch it next time around */
> -            next = tmp - s->cmp + ((s->cr & CR_RLD) ? EPIT_TIMER_MAX : s->lr);
> +    uint64_t counter = 0;
> +    bool is_oneshot = false;

Here we declare the is_oneshot variable...

> +    /* The compare timer only has to run if the timer peripheral is active
> +     * and there is an input clock, Otherwise it can be switched off.
> +     */
> +    bool is_active = (s->cr & CR_EN) && imx_epit_get_freq(s);
> +    if (is_active) {
> +        /*
> +         * Calculate next timeout for compare timer. Reading the reload
> +         * counter returns proper results only if pending transactions
> +         * on it are committed here. Otherwise stale values are be read.
> +         */
> +        counter = ptimer_get_count(s->timer_reload);
> +        uint64_t limit = ptimer_get_limit(s->timer_cmp);
> +        /*
> +         * The compare timer is a periodic timer if the limit is at least
> +         * the compare value. Otherwise it may fire at most once in the
> +         * current round.
> +         */
> +        bool is_oneshot = (limit >= s->cmp);

...but here we declare another is_oneshot, which shadows the first
declaration...

> +        if (counter >= s->cmp) {
> +            /* The compare timer fires in the current round. */
> +            counter -= s->cmp;
> +        } else if (!is_oneshot) {
> +            /*
> +             * The compare timer fires after a reload, as it below the
> +             * compare value already in this round. Note that the counter
> +             * value calculated below can be above the 32-bit limit, which
> +             * is legal here because the compare timer is an internal
> +             * helper ptimer only.
> +             */
> +            counter += limit - s->cmp;
> +        } else {
> +            /*
> +             * The compare timer won't fire in this round, and the limit is
> +             * set to a value below the compare value. This practically means
> +             * it will never fire, so it can be switched off.
> +             */
> +            is_active = false;
>          }
> -        ptimer_set_count(s->timer_cmp, next);
>      }
> +
> +    /*
> +     * Set the compare timer and let it run, or stop it. This is agnostic
> +     * of CR.OCIEN bit, as this bit affects interrupt generation only. The
> +     * compare timer needs to run even if no interrupts are to be generated,
> +     * because the SR.OCIF bit must be updated also.
> +     * Note that the timer might already be stopped or be running with
> +     * counter values. However, finding out when an update is needed and
> +     * when not is not trivial. It's much easier applying the setting again,
> +     * as this does not harm either and the overhead is negligible.
> +     */
> +    if (is_active) {
> +        ptimer_set_count(s->timer_cmp, counter);
> +        ptimer_run(s->timer_cmp, is_oneshot ? 1 : 0);

...so here when the inner variable is no longer in scope, the
value of the outer is_oneshot variable must always be 'false',
because there's never any assignment to it.

> +    } else {
> +        ptimer_stop(s->timer_cmp);
> +    }
> +
>  }

What was the intention here? My guess is that there should only
have been one 'is_oneshot', not two.

There's also been this bug report:
https://gitlab.com/qemu-project/qemu/-/issues/1491
which suggests that the condition for setting is_oneshot
should be "(limit <= s->cmp)" rather than ">=".

What do you think ?

thanks
-- PMM
