Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp445827lfy;
        Wed, 5 Aug 2020 02:35:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylj9Glad3le1Uc7X+L/cBadppoqOiea0UkGh8XIamBVtXbtfCx7gTztJkQxpSEWaQ0qi41
X-Received: by 2002:a25:2e46:: with SMTP id b6mr3441011ybn.196.1596620099969;
        Wed, 05 Aug 2020 02:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596620099; cv=none;
        d=google.com; s=arc-20160816;
        b=tdKaTnkssZZptRREWME9W3BbcAIzlbmY0ta807NfUTgKXICeLE79lFnWB3faUh+W8l
         SD1Y8ZnQKf4HTU6jSre57o650PYAVM9X3lIfeKh5XdHi8+zf4w+IOzv8rSMnxKZakY/z
         q4RCv9V0hC5V1mIQX1GEZqYn5gnn+soQV/g4lu0BCvMPWyI+jyCliT1McrFxYzNEda0E
         M/a1wAa3MPnAnqFJ3ywYAvQ1d0q518TtDjrLTHVjo6N/tkMp/iF53OeHRdmne06ZVITv
         bWSUugqoM7J0coCvusz5S3DQ/YBPYIE6AzOnvbhoWZyJXXGzU7USDw82lXrYXkIde7MY
         Ejrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=St1YfYYWsh60Fl2sbgBwDYlw7o9AnBMBdVT1RxVRkfY=;
        b=BV8GUrte1wBLyX2mgyCbhmr0HZzzJZd/mCJCROYw5tiZZr+M25N0gahTkR0LUbDuf4
         aiYi/9ZU5ZJY4iO1oWPuSB+jghj2E0Qa1hY++yz2afMK1IFXN8q5NjD8saxtGK4unrqE
         bNM0Yx0V8YJqGckCzk7/E4pEVPJVrHFgsbbIYeGDH2wwEWm5gThqsidwc+tYcfmNqdmO
         HodU8BZAv/fz8tQNe7euV/tJbrIPPMtuB/wohzfQkM8xqM1Dh6tvjP1I9pTRcp8SQXZV
         6zLajkkhlrCrfGdoPivjDC84udcN9xz/FK41cxr2hp1i+fF8xamNasn+35u3yKyVJdCW
         r2Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHJ0eXp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j188si1509524ybj.477.2020.08.05.02.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Aug 2020 02:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHJ0eXp9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3Fp5-0000qy-A2
	for alex.bennee@linaro.org; Wed, 05 Aug 2020 05:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Fow-0000ql-53
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:34:50 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k3Fou-0005m1-Ev
 for qemu-arm@nongnu.org; Wed, 05 Aug 2020 05:34:49 -0400
Received: by mail-oi1-x244.google.com with SMTP id b22so13079561oic.8
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2020 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=St1YfYYWsh60Fl2sbgBwDYlw7o9AnBMBdVT1RxVRkfY=;
 b=vHJ0eXp9GszrjJPzaejUsmw+xnUNpDEOAD7EDOArvUY86nfFf693HFMVACX2t3uen7
 N8U02nxIG0Gjwmm+DdjMPtb7GZdrVU30M/b1GQwU560vzg4nlAFOnsk5pIdTw/4pPBac
 aIeihbUyvLpIz5uUDW77gY9cxt8OJmFNgoEvhYf5Xks5txgRrGJ4lX7GzZoDxSOc62Qp
 2Z5cKLecg0PLI51rW+794HJ3ooKrgWI41pX5k4cpTyRD5V1qsM+lv8/Bq5H2LA6kSVpF
 jGX8gMFY2zCcGyoyJzttdzOkGmiMv207KNmxlA6OUrUqUwO01kLIYMypWgCVaVoXxnf5
 MZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=St1YfYYWsh60Fl2sbgBwDYlw7o9AnBMBdVT1RxVRkfY=;
 b=NEykHLnhtx7841JSXR0ecY6Rq/wjsTpxDW6M8BiVKBfmdCluy6+bxKQqk4Ci9zVTqh
 wKqsKZkt3sQ/LG4C5C81cZOGJWiTtAff+cytTAXmGXpY/QpcWhqP+RUQMiEOOF0z7k93
 NZbXyKcZU6+StOPtfBe/XrFL4Q+SMLT4MomrY++ChnmQ3fzoKdVY/QbEOwxxb4fwyVAi
 nTDIHG1+o9q8ofY8Pbpztqjjqzir5h7s1itajGyw0OV3Wh3/Qx/oEmmqOBt1xICRcmBY
 8A9flt0FHrLFOpqCZLY8gBjTmG17Mu7p8ySJOXN4uJyTGdFoN5qt9ynktlGnFYJlE2IH
 /JPw==
X-Gm-Message-State: AOAM533JcjVlfUmT3VNpsZB9qAJIHwkzfzbNxtulFUcEzF7IXp0+DHSn
 tb2Rty9sGSrOzGSkcYBqvPC/lmhiMQHIUe/NnWAW+g==
X-Received: by 2002:aca:50c4:: with SMTP id e187mr1899266oib.146.1596620087012; 
 Wed, 05 Aug 2020 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200803165409.15099-1-peter.maydell@linaro.org>
 <6b9b926a-0a46-1660-9a85-bae29cd56cf9@linaro.org>
In-Reply-To: <6b9b926a-0a46-1660-9a85-bae29cd56cf9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Aug 2020 10:34:35 +0100
Message-ID: <CAFEAcA_HPkO7w7LJH1GoqPGPy-7hLUcCmZpDBjLzDcKUCmpaVQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix Rt/Rt2 in ESR_ELx for copro traps from
 AArch32 to 64
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x244.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: WwQiO1R6irH8

On Tue, 4 Aug 2020 at 21:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/3/20 9:54 AM, Peter Maydell wrote:
> > +    case 14:
> > +        switch (mode) {
> > +        case ARM_CPU_MODE_USR:
> > +        case ARM_CPU_MODE_SYS:
> > +            return 14;
> > +        case ARM_CPU_MODE_HYP:
> > +            return 16;
>
> Hyp uses LR_usr...
>
> > +        case ARM_CPU_MODE_IRQ:
> > +            return 18;
> > +        case ARM_CPU_MODE_SVC:
> > +            return 20;
> > +        case ARM_CPU_MODE_ABT:
> > +            return 22;
> > +        case ARM_CPU_MODE_UND:
> > +            return 24;
>
> ... making all of these off-by-2.

Yeah, this is the bug fixed in v2.

> > +        case ARM_CPU_MODE_FIQ:
> > +            return 30;
> > +        default:
> > +            g_assert_not_reached();
> > +        }
> > +    case 15:
> > +        return 31;
>
> I don't see that R15 is mapped at all.  Is this really reachable?

It is -- you can get Rt=0b1111 for MRC to APSR_nzcv (as well
as for various UNPREDICTABLE MCR etc cases that will get trapped
here that we have to do something sensible for). Rt=0b1111
is mapped to 0b11111 in the pseudocode (see
AArch64.AArch32SystemAccessTrapSyndrome()); it's just not
documented in the text (yet) that this is the required behaviour.

thanks
-- PMM
