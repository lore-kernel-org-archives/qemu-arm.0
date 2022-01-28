Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp257241lfk;
        Fri, 28 Jan 2022 02:35:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIvtjSyS5OrzI/UiausiXGmyGGocL1vGP6rcbr2zRtcdrL+A4ChZZ0fxcl2AVN1naFO8Ag
X-Received: by 2002:ad4:5c83:: with SMTP id o3mr6927245qvh.15.1643366155108;
        Fri, 28 Jan 2022 02:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643366155; cv=none;
        d=google.com; s=arc-20160816;
        b=E2l4ckXIcr25IRKS1UdpB3c1byGmlqXkFnnd6S3umiUNnOiUAXLPybJH8oQLi0SbLC
         uBtYmU16uKH8LcB+JKociwevlAz4muGa1gXL1zuNaSyBaHhYw56lzWzo325lht/Q1Se4
         Zs07YMDPzwsF3Lbf1cFms5nnuD7K7kF81T+eSNYMaLFhShS/a2cn3/67D255IUMeljKQ
         iiSKXG4BrShbtB2bYjP9OhtJVee64CGYzVD+3X4jnugvEZIazyJa34q0cGM0r0SOXhF3
         iaHNM7yR2LobYCNMrbpYGdsA/yair8kJ7oMVf8q4tPeMHWEonp94pPSvCR+0YU12O03U
         fiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OsMGecQjmNLdmRCeJ6nf8hgOBeAPgZC8A21vF01b4es=;
        b=1H7NpLUsjyDZJtamntKwTYSxcdnSjU/9ZYsJjNLZZJlCRRK+lx1kyxn7C8mg0KdpCS
         oT5gqBgjFufYF2wn06UWz193bPt0Twl9axZiuuqDA4f4LVY76475qyx3p0xsfsWmElBZ
         Y/3Z4wCPzEPxa3s/ux+BkGiS+DVwhglqfpuwpJJIIfKCGbJtK6hcxyR1OEk2SJT9XpmL
         lb0/r6nsGZ+8Sv9KRpsclxATBWIgX2dXhTyYb74rJj+nH/bygIHbGERTxWrGAtCgkei8
         px4KGgufdKcaAw2FZYyIguBRAAixfL29/G+m2d7mikrmUZxl19fV63amBz8LWFlH8jr+
         SHcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DTS87BO+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si10454692qko.579.2022.01.28.02.35.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jan 2022 02:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DTS87BO+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDObi-0003fR-Kn
	for alex.bennee@linaro.org; Fri, 28 Jan 2022 05:35:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOb2-0003d7-23
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:35:12 -0500
Received: from [2a00:1450:4864:20::334] (port=55978
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDOb0-0000rA-Bd
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 05:35:11 -0500
Received: by mail-wm1-x334.google.com with SMTP id r7so4010817wmq.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 02:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OsMGecQjmNLdmRCeJ6nf8hgOBeAPgZC8A21vF01b4es=;
 b=DTS87BO+PfYHeyK7s4uCVSvCOB0Hz90jS3FhuWUk1ezFrgYi2gkw/aQwOIWpS89uIK
 yt2qEpX8QaSSo7pytnWl54Zj8OV6TZ1b7EeCEJaOioexmIyHCZd0xgh2ZNcJ4Iz8ZZmH
 Yyuibfz2Q8xiQUGx641luQfreRA6Zlkl3xb6twLXPw8kXxAfCByZ6IyoCgz6YutEMprL
 CAorNTinikrAdnRiCN+ec6w3XWcbKrWl3kM1vc4YND/NecOjbQIIprVFKtvRVT5aWjxs
 GbgqFgQjjZPZJ3ZoGxoJzSlUWxEHsU9eAIDQJm6Ty5Enbrt8rfGAEEaHDvisKNmKpXGr
 5tEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsMGecQjmNLdmRCeJ6nf8hgOBeAPgZC8A21vF01b4es=;
 b=C+0JnYdo7V2HmjHOdYhcD20Q5va29h+A/pemch1uw582yXetVL6XV8f1Rtydvc5QUb
 xr+nXY65kJEGYHw80BH7H9VhDzxjV58CdrIAQ3kWb2rUJt/NU2W8NFX8JJ6auQy8Ok/4
 jr0IAb0C7eyhgN6YUD/WCb41CC23aohaVhMeN6XPMuVRXPzHiS5Or+zMXnaUTC9uWniw
 XkcnOgNfWXg9xo/ye7zGuTKjtAvBH2KHRsbgUzFNkdns7pVm6qo3CkQT3S+Rn1JQSxps
 VVzr5IWT/XBzuYjgI4LKECDJMHp/S7MPyNP3wv3Obg5RFB/RgbrYiwUlubJwDbDgM5TG
 XikA==
X-Gm-Message-State: AOAM532XC6DpwHGiMb5RnvGpTQRMVe8Uu/g2zMUbQEQWt65Lu056h1vR
 b+eCZr/qhb8rL1nzEmvjPgOABLkgDtYBJOq9DjMFew==
X-Received: by 2002:a05:600c:4f13:: with SMTP id
 l19mr15987552wmq.126.1643366108594; 
 Fri, 28 Jan 2022 02:35:08 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
 <20220106230936.417020-4-titusr@google.com>
 <CAFEAcA-m6Pk+nzSR72hfTaEmEHoYKa+BvxvGij9kCtEu5vRXUA@mail.gmail.com>
 <CAMvPwGoSXYOJnUnDz1jdKWXmGKS3wdvjZ+oV-Pdrk1Z-AXF+Ww@mail.gmail.com>
In-Reply-To: <CAMvPwGoSXYOJnUnDz1jdKWXmGKS3wdvjZ+oV-Pdrk1Z-AXF+Ww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jan 2022 10:34:57 +0000
Message-ID: <CAFEAcA-DrG6EzkWVXLfhQc-dgy-CoPuyC7bLVO3Ca1gcE4NALA@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/sensor: add Intersil ISL69260 device model
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: minyard@acm.org, venture@google.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 36+Q01xUoCMR

On Thu, 27 Jan 2022 at 20:54, Titus Rwantare <titusr@google.com> wrote:
>
> On Thu, 27 Jan 2022 at 11:39, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 6 Jan 2022 at 23:19, Titus Rwantare <titusr@google.com> wrote:
> > >
>
> > > +static uint8_t isl_pmbus_read_byte(PMBusDevice *pmdev)
> > > +{
> > > +    qemu_log_mask(LOG_GUEST_ERROR,
> > > +                  "%s: reading from unsupported register: 0x%02x\n",
> > > +                  __func__, pmdev->code);
> > > +    return 0xFF;
> > > +}
> > > +
> > > +static int isl_pmbus_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> > > +                              uint8_t len)
> > > +{
> > > +    qemu_log_mask(LOG_GUEST_ERROR,
> > > +                  "%s: write to unsupported register: 0x%02x\n",
> > > +                  __func__, pmdev->code);
> > > +    return 0xFF;
> > > +}
> >
> > This device appears to have no implemented guest visible
> > interface at all, and yet it has a lot of object properties.
> > What's going on here ?

> This device relies on read_byte and write_data implemented in
> pmbus_device.c. Those generic implementations fall through to the
> device specific implementations for registers not in the standard.
> This qemu model happens not to include additional registers. However,
> I must change these to LOG_UNIMP which is more appropriate to what's
> going on.

Ah, right. A comment noting something like that might also
be helpful.

Something I forgot to note -- the filenames isl_pmbus.[ch] seem a
bit overly generic for "PMBus device for Renesas Digital Multiphase
Voltage Regulators" -- could you rename to something a bit more
specific? This will help to avoid in future people lumping
lots of different unrelated device models into the same source file.

thanks
-- PMM
