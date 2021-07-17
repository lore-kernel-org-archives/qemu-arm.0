Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp2527924lfc;
        Sat, 17 Jul 2021 15:14:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXoI94d3QfXB/BViXXBuBCf2Ej3+O1attUgq84UNSGNAIDDDE4Cn5piV9PLWjM303QKQWt
X-Received: by 2002:a05:6602:2406:: with SMTP id s6mr7548520ioa.159.1626560048707;
        Sat, 17 Jul 2021 15:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626560048; cv=none;
        d=google.com; s=arc-20160816;
        b=D4SkG+fVFsI7TZNqvvKF4p/O6XzpzA7N4U5DLdSpNu4hYhMdCKZEyke4Kwox3Pyx/7
         g0NlHOBfSLkBNfabXkLH0jMNqbO55+4oXfsITLZAI/rMXdzq9LYEahKb5CLnfqwTIx3S
         h52pWl2/e4Am7Cih0SO8u0vsJ5XAfqzjFFCZOIJ9th6byZGcoUmQny/OKSo1I//hfzW+
         As00g1hWPuxJNfBklz/3V2DfQdMXt2FwpAn9AyFLA+bUtG4YLKcMtiia4NxTydNa0jgF
         UZsG2g2J9CZo5OqEN4q0d/Gu0NoSYnavo9xDc/rm2Y1xxDjNbnhCKjnkr+AcGbQUMiMF
         1PPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FIgarR9/qgxUq7R/uAEm5SVr7tfT2FDLaa/OH+bmkSc=;
        b=DZ3xhTzh7WynQwSssnItudpN3/lVMBgW+po8kQfYC5P6g/9tC7wY8U9ybc3U5uekFN
         y7KJkf/fhvrBrpZc0W+bd94JJX/vZUUuOsNWJh0oJI8WdE9kYcRIewn9kEoJal32wp12
         Od5LmlX05acv3Rh2G2N2zAvqntrdLpG9iuXeByxswChWDpRZ7XEmto4Px95eE12Sw4gt
         Wm0cVlKCoPtVY3+EF7lSi/aEupbz0NMw9Dr8nPPlx2adCldN34Mh973XjVQNOZ0I3dzy
         fO5yVNtXkdVkDrDAWk/DR0nBr6ZikrYb0fXhoUNIG950qSFliphKmX1gU4fUqLtaPbaD
         m0lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfNo5j1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si4927278ilk.99.2021.07.17.15.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Jul 2021 15:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfNo5j1G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4sZT-00048q-Vq
	for alex.bennee@linaro.org; Sat, 17 Jul 2021 18:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4sZF-00048S-Qh
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 18:13:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4sZE-000787-7O
 for qemu-arm@nongnu.org; Sat, 17 Jul 2021 18:13:53 -0400
Received: by mail-ed1-x534.google.com with SMTP id l26so17776411eda.10
 for <qemu-arm@nongnu.org>; Sat, 17 Jul 2021 15:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FIgarR9/qgxUq7R/uAEm5SVr7tfT2FDLaa/OH+bmkSc=;
 b=zfNo5j1GhwgNo9YDB2aj70kFswVc5IESMmnW0kM9jKLVGDqmRMCl7KM9XqVJbeh86q
 zm4hg6KSvoj5A4dnWDrkp+kLHSzUSPYvyC1QHDuDRgGWUwA1FHlA0+fnTR/6n8uLQ7Kz
 Y+ZNlMpviFVnPwxgUeEDRZ9EjL/yLjuh65n7uBqiZvNf33h4LIg0v1ZdVmqbuj+ZN9ZN
 4SDYWRaeKyVoMAihTgQYBCytYdALTlUxpoYlV4WhZjp9o72ftD/wejQjmHwkpbW5JFRv
 AZfWBRfuxhJz6cx2+kwrw1mu3tmgADcb/0LrqK+3K9FCln4bx+a8lOr2IarxXYf69kwZ
 4E6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FIgarR9/qgxUq7R/uAEm5SVr7tfT2FDLaa/OH+bmkSc=;
 b=TACp7gQkdQl5Ov8l3HyDbXGb2lAU00SGZPuyyRUYn0sL1mLQWF8pfNEcjMLSmS7Ye1
 +aMEeFP3ecOli9E9iXleRmSSEiT0rFU6rQIk/p4dW1AKhnmHqUFQqfDxScOZK+XK7KQA
 j5SHGXDz7HiLEoY9sxGbb2uAEKDv3/K+zgX9aNoM5bXTy5Zi9O4wPWigYGlsXYToUWbX
 9bPz8ftBTF5OU2ZXURBhuZaiCj/bhpNtSllmF8KIZkl5iTKOFA8CTx1klN8Ltlt7iJHM
 InbIN/NpyOUIs0uPAcjrrTcy2o28viWcWGbCcPjPpMYoaa/+EQql+RiKPDL0ylIG4AEb
 w9+w==
X-Gm-Message-State: AOAM530nq9dagD8+OjZW4t95co9ZtzecsJNqZ9aZnAfaStxl5NysVA1m
 TgZrWRPwE+PD3DOMFN/W2zTlDjyC5HP9c/yxhzgPIA==
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr23950628eds.204.1626560030376; 
 Sat, 17 Jul 2021 15:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-22-peter.maydell@linaro.org>
 <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
In-Reply-To: <619cc6fe-c865-2070-e52f-285882b8ed2e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 23:13:10 +0100
Message-ID: <CAFEAcA9DER=N8meJ_8oy6z3wN8n7Rot-ssmJ0dA-Z1Di-8Q4Rw@mail.gmail.com>
Subject: Re: [PATCH for-6.2 21/34] target/arm: Implement MVE VABAV
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: qwbjpLRJ1K2f

On Sat, 17 Jul 2021 at 21:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/13/21 6:37 AM, Peter Maydell wrote:
> > +#define DO_VABAV(OP, ESIZE, TYPE)                               \
> > +    uint32_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn, \
> > +                                    void *vm, uint32_t ra)      \
> > +    {                                                           \
> > +        uint16_t mask = mve_element_mask(env);                  \
> > +        unsigned e;                                             \
> > +        TYPE *m = vm, *n = vn;                                  \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {      \
> > +            if (mask & 1) {                                     \
> > +                int64_t n0 = n[H##ESIZE(e)];                    \
> > +                int64_t m0 = m[H##ESIZE(e)];                    \
> > +                uint32_t r = n0 >= m0 ? (n0 - m0) : (m0 - n0);  \
>
> Any particular reason you're not using TYPE for n0 and m0?

I wanted to definitely be doing the subtraction with a signed
type wider than the inputs, because that's the way the
pseudocode effectively deals with it, and I didn't feel like
thinking through whether using the smaller and possibly
unsigned types would DTRT :-)

-- PMM
