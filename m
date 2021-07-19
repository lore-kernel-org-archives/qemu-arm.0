Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3895297lfc;
        Mon, 19 Jul 2021 07:26:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvvX7vPkzZT5JsbuSqbYGCX3euUyAj/A08ZNFkwFcqTwdwxP4CdMvQPSRBR3sE1iRhYYa7
X-Received: by 2002:a05:6102:5e1:: with SMTP id w1mr23880277vsf.35.1626704814847;
        Mon, 19 Jul 2021 07:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626704814; cv=none;
        d=google.com; s=arc-20160816;
        b=YhfVD5NO3FjrH7pyYDd9Kvfk0X3O9cJVGsOrhhQiaI0Q4JrzD9U3HU/CofBtR2nTzP
         LVVGPeGpxJhjRs8+Sme7i9FJwTWwf/zpnRlLP6agEHORFk5lZlSE7lTchnmEE5E9jy01
         D3QawZfBzEMvLO4xbq4SkCR+uq5fMOC6mxTvYKDOQbEggtx5KGc82KTp+l2NzqrLj2B2
         Yl1nNHfs0eQpbfa7vSotO9DUpr+tV/2Pot6I094d5j0pmHnr4ut2US1Qv9SWdMbu6aMC
         n2v7/kwDomdkceBBKm4eBH8uZ9xJoC3US22k0UCX0DqVUFMMedY9cXEb2H9XgRaJ24Tb
         al2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5pblmW0vmpsRvzxMBMyFDJE3s8IMFE9um6csAuFF9lg=;
        b=PcL8PhmnnNPHSCIE0vx7WS5XJcJPq241m2c5sveiyiCyXZOrykrBqVNU/4fMHO58Z8
         lQW75aQ+HoeweMxUY284fDkNt7SYuYLELrQxDqnYKBweFXwAFGOkwHSlEb3e179JtGvj
         Azx0AmbW/vH1VHT4joJyw7JmNkEFioy7Ms9cVju9bs10dez9Tan6AQSc94+cUZnI1uov
         GgMoUBOMLqU5tToVkKsXYNuuQdVm0sAQkiWQ5l6IDWSnq4kOzZXyeH7ZUsxsNxiQ37ue
         kMN1305KBs7ZNeM/6hwIeIBjZqSpS+rFrpB60cwJRCrKhOLUgamCAfUff4Bnf7N3/TiI
         SiFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2oQiUAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si15959372uap.28.2021.07.19.07.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 07:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a2oQiUAL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5UEQ-0002lN-3W
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 10:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5UDT-0001Ty-Qe
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 10:25:55 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:45023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5UDR-00076j-R9
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 10:25:55 -0400
Received: by mail-ej1-x629.google.com with SMTP id qb4so28976909ejc.11
 for <qemu-arm@nongnu.org>; Mon, 19 Jul 2021 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5pblmW0vmpsRvzxMBMyFDJE3s8IMFE9um6csAuFF9lg=;
 b=a2oQiUALlbmErbg+95/vy924OcsiiLEGrbYKEyr6kHelP3Stv+yHsGtsRd7P9m9mKi
 7fmhiQRUVaamhBlwvbyVE9BJeWc/WosVRlyhXMHz26NViy7tx2nO6oRbovKSAmEk8aBE
 4Q6XcdexsSMp+ZKOtUuZQIzvjyu02QKgTgttDHMRlV+fi3wHwdveblFZ9ljBwQ3szKxt
 wSJvS+HP84NjIXvJJlwZuKVlFUFyolqnVbemQkrSt5nl3O5nnn5dyJSZRikPYzk9nDMC
 I4t7MXCzLGQFLY6s4Ht0cT++ZwcB+xih0+k6FPjrzd3by/1oO38MLV3OAD9KvXJEPqzy
 cWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5pblmW0vmpsRvzxMBMyFDJE3s8IMFE9um6csAuFF9lg=;
 b=RDv2cpWg597EXn8AjEFg7LyreGHIrtvY5i2+lOrnZBKBKKWFKrNneWGUz3n4KRj6gV
 Cw0+9mcfAicJjEZJzvbDG7/fR9oX3Kz7djH7RotjzKBkg6yoN5JFHi0r5so54wxFvePj
 156YtEu6pjotG5U24rMdceHOgtNdCF/7ANL8bLBgG9+MnEurBMYaxVm9VfelfjFIzyCi
 iRb8B0q0k656WbjBd9/BXaljhPPfYq1IZF2M88vvWkcvkTDW5JaPLy+w8YYNrEjPrmnJ
 hsp6nwWH05QWJ/tA67czLd5Yv9m447R0eFZRxQvfoUPPKp1re+o8Z0qGOXQUnNaJ3UNb
 WMLw==
X-Gm-Message-State: AOAM533bcftcAX6bp0K7AcuHibanqsjBZSwdeG2YXTfkKVE2WrVtndPM
 gbcjqBuOFU1uf4UcSabTZkKcO8KbOGPF3R3UX58m7Q==
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr28042303ejd.250.1626704752189; 
 Mon, 19 Jul 2021 07:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-13-peter.maydell@linaro.org>
 <170925ed-040a-d117-9e16-fbee7604f820@linaro.org>
In-Reply-To: <170925ed-040a-d117-9e16-fbee7604f820@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 15:25:11 +0100
Message-ID: <CAFEAcA-mmARsqCBcc3KuAXgDyxvUBmg-YrpF12UX1DBS13EJVw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 12/34] target/arm: Implement MVE
 incrementing/decrementing dup insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LBtcSuUGtOZv

On Fri, 16 Jul 2021 at 20:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > +#define DO_VIDUP(OP, ESIZE, TYPE, FN)                           \
> > +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> > +                           uint32_t offset, uint32_t imm)       \
> > +    {                                                           \
> > +        TYPE *d = vd;                                           \
> > +        uint16_t mask = mve_element_mask(env);                  \
> > +        unsigned e;                                             \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> > +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> > +            offset = FN(offset, imm);                           \
> > +        }                                                       \
> > +        mve_advance_vpt(env);                                   \
> > +        return offset;                                          \
> > +    }
> > +
> > +#define DO_VIWDUP(OP, ESIZE, TYPE, FN)                          \
> > +    uint32_t HELPER(mve_##OP)(CPUARMState *env, void *vd,       \
> > +                              uint32_t offset, uint32_t wrap,   \
> > +                              uint32_t imm)                     \
> > +    {                                                           \
> > +        TYPE *d = vd;                                           \
> > +        uint16_t mask = mve_element_mask(env);                  \
> > +        unsigned e;                                             \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> > +            mergemask(&d[H##ESIZE(e)], offset, mask);           \
> > +            offset = FN(offset, wrap, imm);                     \
> > +        }                                                       \
> > +        mve_advance_vpt(env);                                   \
> > +        return offset;                                          \
> > +    }
> > +
> > +#define DO_VIDUP_ALL(OP, FN)                    \
> > +    DO_VIDUP(OP##b, 1, int8_t, FN)              \
> > +    DO_VIDUP(OP##h, 2, int16_t, FN)             \
> > +    DO_VIDUP(OP##w, 4, int32_t, FN)
> > +
> > +#define DO_VIWDUP_ALL(OP, FN)                   \
> > +    DO_VIWDUP(OP##b, 1, int8_t, FN)             \
> > +    DO_VIWDUP(OP##h, 2, int16_t, FN)            \
> > +    DO_VIWDUP(OP##w, 4, int32_t, FN)
>
> Would it be useful to merge VIDUP and VIWDUP by passing wrap == 0?
> Or merging VIDUP and VDDUP by negating imm?

I think keeping the wrap-versions separate is clearer, but yes,
we might as well do the negate in the caller for VDDUP.
(VIWDUP and VDWDUP have different enough wrapping behaviour
that I'd prefer to not combine those).

thanks
-- PMM
