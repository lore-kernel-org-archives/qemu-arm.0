Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1207317lfq;
        Thu, 8 Oct 2020 03:29:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwdWWpvZISFdvLJat9elidKLumxlbb0A23fxxpn7nxqPgXETaFBfVyp0GRFAFTlCWjx+S9
X-Received: by 2002:a25:1e55:: with SMTP id e82mr10612148ybe.282.1602152948119;
        Thu, 08 Oct 2020 03:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602152948; cv=none;
        d=google.com; s=arc-20160816;
        b=dEljZ/n0aMlZYOtzpsgzGqGKH1f9Yq6cYP+qW5vXd0YaT05f2RaCgxzmiKxItikFap
         ug5d7xBRY6OFhnvMqykzFM7IzsXSUOUfwYqzs+zZwN1C5QNl1ALWfk4Wa6mVJrn/k2b7
         bHu5VwDHXnyGExWmgP4Sj1XKSYN5ZyVmIG5hn2UGQSjjdn8QWOSijt1cp8xsTllI2sDq
         y+bmLwBV4U0mnCoRM44m8R4uK3sMr600Uyw8ONhbEPEa6GVPXKcGpdZduGAFiCSOtfdF
         Whq+yn2J5v7t5rMqB8LL5ZEpBMa5b02DRsrzGKnVY7Z+zwl+Umx9Ot8iaShL1G+5+Ab+
         D0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpFG6F80pPYCpWJ8Uu5Is5OLpc+9U57qrLDC/er5blQ=;
        b=p/fUjgaTn/UHpbFgm6W8qLcONjZJaW6MUkKl8yWtwDZoD4QSy5Nha0Mxd4Ou/OYE/n
         krblaKH+KK2jxuXnvZb69vAquubbExgrLbHVHTGAHQNRTz7/gZYHdr/EnsEoO7jfcY19
         e0TvF2zH2lUW+dyyCMXxHtuz8J6Ph0yi9F1zahiZ39MTSsgB9xsl5Qhr8MfG8qR7rARQ
         4iIPQ/dkmdHqT/Yol2tx6zn51Wx50vlRY2HeiuGmaTwkMhjw1xj2WZLfm6xfT1u5bHUn
         wXi9ALyHLZwucg2CKScLcvMIU3Ah3EUN0Isxi4Oasno/jvStUGGWPNIdl7R0JoRa0hMy
         it4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="w6b5Kk/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z128si4380499ybf.45.2020.10.08.03.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Oct 2020 03:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="w6b5Kk/5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQTAZ-00076Y-Gh
	for alex.bennee@linaro.org; Thu, 08 Oct 2020 06:29:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQT9P-0006EI-Uw
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:27:56 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:33326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQT9N-0004yC-Ju
 for qemu-arm@nongnu.org; Thu, 08 Oct 2020 06:27:55 -0400
Received: by mail-ej1-x642.google.com with SMTP id c22so7378870ejx.0
 for <qemu-arm@nongnu.org>; Thu, 08 Oct 2020 03:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kpFG6F80pPYCpWJ8Uu5Is5OLpc+9U57qrLDC/er5blQ=;
 b=w6b5Kk/51a6Z5Hrc1ljCFdIDvhTeU46I9kzDlxk859nNeCkyoHQ3pB3HD57kKabLPG
 AKZu7vkoR+q2XnrDbKUAV6YeU36IwxQQpw4OE2JGPZFmlUOWo4Aq6nie8BSfZBj94F4C
 B6KTR0emdIidJquQajWfKx8loGcmjSa9H07w1FM3YsjdaGaXPsEBS5HPQqAbFLfRSMsD
 kUE6nllCP2YO2cKtygbTJCXkuPF/McnrNBw+zWh/sQxNZf44+aIPjdym9B8AfmmY0k1x
 tH0eUdVz1DT4VDS3Jb7v2tz1cJVR4fFluhkFaOP0ugnRpChnEUWBJjtzBhvtxSYEOk0g
 Xndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kpFG6F80pPYCpWJ8Uu5Is5OLpc+9U57qrLDC/er5blQ=;
 b=uluvENsuTVHiNsuYvGbipC8/AaU6k4yngnXVAQyW8U5BbDw2pN6zXceE+wuhyv7ICb
 FeymNpi65ehs3C16x+0RzngTxN4oN0tBnqJnF3DMdhEoX2u3+HjP+fy17DYW2ILyAiP2
 lY5eeajpoz2wSwtYFSfm58ZpLyrCO7qdf6Ly9gLRoVypoTGyh2yjpXFqDUvUfS05eGZX
 q8XGHLB86EAXyxWwwzEx9TuRwHlfChBTEy7p7ewxaU69FzseUs2V5/4OiLXJcfTRnlgq
 zKMpDLrNb2W2KRxS7TakjJVv0HFyhouZKq/6VOz7QbGDdIJ+FdWOdXjU1+qM1HFyEQz9
 h/gg==
X-Gm-Message-State: AOAM533xWDT6ARG9HEjIa4DMbFnm90g3XgU9XUF+qmp1bhn1oVZGoGf1
 5SNpj8szjj3YF/5TS6D822yt+jw8zaqMK2TT8Hnasw==
X-Received: by 2002:a17:907:4365:: with SMTP id
 nd5mr8241447ejb.56.1602152871883; 
 Thu, 08 Oct 2020 03:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201008024203.112303-1-shashi.mallela@linaro.org>
 <20201008024203.112303-2-shashi.mallela@linaro.org>
 <CAD8XO3ZRGqNbr1GM6jMAdhm=pPXXr6K7m_F0MKRDQMnrDw=yDA@mail.gmail.com>
In-Reply-To: <CAD8XO3ZRGqNbr1GM6jMAdhm=pPXXr6K7m_F0MKRDQMnrDw=yDA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:27:40 +0100
Message-ID: <CAFEAcA9QRJhorL1XtWBCQk9uo21OtMHUrH7ipG3tiFbOBGizPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] hw/watchdog: Implement SBSA watchdog device
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Rados=C5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7Zf11X81SY5c

On Thu, 8 Oct 2020 at 11:21, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Thu, 8 Oct 2020 at 05:43, Shashi Mallela <shashi.mallela@linaro.org> wrote:
> > +static void sbsa_gwdt_update_timer(SBSA_GWDTState *s)
> > +{
> > +    uint64_t timeout = 0;
> > +
> > +    if (s->enabled) {
> > +        /*
> > +         * Extract the upper 16 bits from woru & 32 bits from worl
> > +         * registers to construct the 48 bit offset value
> > +         */
> > +        timeout = s->woru & SBSA_GWDT_WOR_MASK;
> > +        timeout <<= 32;
> > +        timeout |= s->worl;
> > +        timeout = muldiv64(timeout, NANOSECONDS_PER_SECOND, SBSA_TIMER_FREQ);
>
> static inline uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c)
> {
>     return (__int128_t)a * b / c;
> }
>
> #define NANOSECONDS_PER_SECOND 1000000000LL
>
> Interesting why gcc does not warn on  64bit signed to 32bit unsigned
> truncation here. Looks like it's too smart to understand
> that value fits in 32 bits.

What truncation? 1000000000 in decimal is 0x3B9ACA00 in hex:
the number fits in an 32 bit integer without truncation.

(ns = muldiv64(ticks, NANOSECONDS_PER_SECOND, frequency) is a pretty
common pattern in our timer devices for converting a number of
ticks to a duration in nanoseconds, as is the reverse
conversion of ticks = muldiv64(ns, NANOSECONDS_PER_SECOND, frequency).)

thanks
-- PMM
