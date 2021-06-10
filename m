Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp457939lfa;
        Thu, 10 Jun 2021 05:40:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPYUyt4zxan6TLVUqYehtv4U1Il0HsEDKdLMgyg5epIxgW0BOujIVsTa1hWmL/YkHFvpun
X-Received: by 2002:a05:6102:383:: with SMTP id m3mr4263764vsq.15.1623328858860;
        Thu, 10 Jun 2021 05:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623328858; cv=none;
        d=google.com; s=arc-20160816;
        b=SNtXQrIaNVZ2VOi/ocMNOIzwU1HqT2h9955A/Y9clP4seoumGiSUQyv5DTxy5vKDrg
         rMGVjTYJ/6ZPxoUSnsZFTp7+Amz7MLtQelwc+5VamFd6/KVEnbctuNUco5QBjnd8RTY0
         lhFk7+f3C3HR4L4QpY0Dy5MWSZ1MhO0t6NPKAKsp6vGxq9IuUWa6ZjxqoHfzFS3GtaUa
         7SaRcykkwr6p42qyZhyK1WlMjX0HplrpkQBfHPy5sAAaiyyQMeupSrRCGwCl8ooQ6sb9
         2ndHYsxtbGQAfQVRwQAVJSoQXzIKGbxd8iSaOsjJwvDkjjuAC6Q1j8053kitNeD4hUGW
         oTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXMh0eWSot/C6iO763Pkxri62CDVNRHyAFSOO/335uE=;
        b=vxL7AOck8ss1nEgokWN+lxGW/pBaObcuUDNRDjcDPUBDe51J5EiFrJLgNjmA4JGTfi
         lWhjQFfbozgomffrqKUWTUtnbElHpg+B7jEwdR9eDpSxlsUE5I5ZSnZbOxf4+rTzal2O
         Zl9j4inwU5ovb1/cPk1JqLLrvdo5hzA+0fdh/0sYNcJXO0hw5xUsa/jxwAGVQOBcPrfR
         KLaLhwbHM9aB/CIVxdUJJklrHvENSaSxKSr7apq8QpWmLN6kl1IcjdzMaf7Tpy0oS8Vp
         TK0Bm8rKZ6TNkOlJhhgbzo3q1cnQbJov73JxFNPtVsYzNH1PqHlHOY4gxi5NJFT7yEbl
         kcFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+5WB4Mx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v26si1344758vsd.127.2021.06.10.05.40.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Jun 2021 05:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u+5WB4Mx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lrJzW-0006bW-5k
	for alex.bennee@linaro.org; Thu, 10 Jun 2021 08:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrJzJ-0006ZU-4k
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 08:40:45 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrJzF-0002Jj-6N
 for qemu-arm@nongnu.org; Thu, 10 Jun 2021 08:40:44 -0400
Received: by mail-ej1-x62a.google.com with SMTP id g8so43996275ejx.1
 for <qemu-arm@nongnu.org>; Thu, 10 Jun 2021 05:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qXMh0eWSot/C6iO763Pkxri62CDVNRHyAFSOO/335uE=;
 b=u+5WB4MxTgXUGPNbm2MjimJwQ7z63NmuL4TwFUsAdCe0G/Ousho6T4MZtzUjjUaWK6
 tA0zF2lrgANY6BiT6QCRaQiZLUYvNONulVwh+JPBKxYm65+EiFf61JVr4eebozF1MhpK
 g+ufC5oe/c54tiPraHwwvlqcS3LXlMDH5q1S1s2t0tKIoukw6s+6emywOPqOhQvt4qpx
 BR4PwSV3KGTc5fhT2HtoiqQFl44Z4eUKe8lxhwyaiJhBZ5E/UEQBOICiBL3vkpXmSiZM
 7W3vROGBOXcilkPNVta+pDWhhhvO2euZs9UkrkEwyfcm4MvrhqqnwZy7wXiza6D7YMBt
 magw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qXMh0eWSot/C6iO763Pkxri62CDVNRHyAFSOO/335uE=;
 b=mWFp16BAw7OGOHupvQvK3ShttKK87HZXUnRxR+OjT0GaiqhCpbknBgj7b7icBmXv2E
 aVuwwzyhpbxfhxrUcreIvEBJVSkWOJwRjyUxCxkVWuoywTEH/Jbvsu6V0f/yWgTwBrJK
 WAJJX0sER5pnWyaybzXnUXyh9XPbjr41o4aF1m9Dz5u+Waf+Sob2wiJNWPn2XeSMYx2P
 YhQFmulnJXWTlkDUM1HqIpAQktZ2hyANnuckFgcQ+UbL+knmuOS/dG80dxx02DrNvnzB
 grzeC/oiYBTjn4eHl1Ozfs3YpEXgDbG8rs844Nj7CsljlHMoK+mJXujjNLuAuAzlHCUU
 m2Ww==
X-Gm-Message-State: AOAM532F5PXQ+TTywJpclHs4yeEL9fvTXFbZYCf5JdPX9gf9M/2V7KUt
 FzXgivzsBkMlGXARewclizTseRSst9IcJwLiCg431Q==
X-Received: by 2002:a17:906:b294:: with SMTP id
 q20mr4226656ejz.382.1623328836068; 
 Thu, 10 Jun 2021 05:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-14-peter.maydell@linaro.org>
 <b04dd492-0394-5b1a-5747-bb21d772e621@linaro.org>
In-Reply-To: <b04dd492-0394-5b1a-5747-bb21d772e621@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 13:40:02 +0100
Message-ID: <CAFEAcA9Sa=mCMGGkmTm2HseanfkKa1PtDYOUiofO-k4eM_fYoA@mail.gmail.com>
Subject: Re: [PATCH 13/55] target/arm: Implement MVE VCLZ
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-TUID: u/3GWF+UkyhH

On Tue, 8 Jun 2021 at 23:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > Implement the MVE VCLZ insn (and the necessary machinery
> > for MVE 1-input vector ops).
> >
> > Note that for non-load instructions predication is always performed
> > at a byte level granularity regardless of element size (R_ZLSJ),
> > and so the masking logic here differs from that used in the VLDR
> > and VSTR helpers.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

> > +
> > +/*
> > + * Take the bottom bits of mask (which is 1 bit per lane) and
> > + * convert to a mask which has 1s in each byte which is predicated.
> > + */
> > +static uint8_t mask_to_bytemask1(uint16_t mask)
> > +{
> > +    return (mask & 1) ? 0xff : 0;
> > +}
> > +
> > +static uint16_t mask_to_bytemask2(uint16_t mask)
> > +{
> > +    static const uint16_t masks[] = { 0x0000, 0x00ff, 0xff00, 0xffff };
> > +    return masks[mask & 3];
> > +}
> > +
> > +static uint32_t mask_to_bytemask4(uint16_t mask)
> > +{
> > +    static const uint32_t masks[] = {
> > +        0x00000000, 0x000000ff, 0x0000ff00, 0x0000ffff,
> > +        0x00ff0000, 0x00ff00ff, 0x00ffff00, 0x00ffffff,
> > +        0xff000000, 0xff0000ff, 0xff00ff00, 0xff00ffff,
> > +        0xffff0000, 0xffff00ff, 0xffffff00, 0xffffffff,
> > +    };
>
> I'll note that
>
> (1) the values for the mask_to_bytemask2 array overlap the first 4 values of
> the mask_to_bytemask4 array, and
>
> (2) both of these overlap with the larger
>
> static inline uint64_t expand_pred_b(uint8_t byte)
>
> from SVE.  It'd be nice to share the storage, whatever the actual functional
> interface into the array.

Yeah, I guess so. I didn't really feel like trying to
abstract that out...

> > +#define DO_1OP(OP, ESIZE, TYPE, H, FN)                                  \
> > +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
> > +    {                                                                   \
> > +        TYPE *d = vd, *m = vm;                                          \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned e;                                                     \
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> > +            TYPE r = FN(m[H(e)]);                                       \
> > +            uint64_t bytemask = mask_to_bytemask##ESIZE(mask);          \
>
> Why uint64_t and not TYPE?  Or uint32_t?

A later patch adds the mask_to_bytemask8(), so I wanted
a type that was definitely unsigned (so TYPE isn't any good)
and which was definitely big enough for 64 bits.

> > +    if (!mve_eci_check(s)) {
> > +        return true;
> > +    }
> > +
> > +    if (!vfp_access_check(s)) {
> > +        return true;
> > +    }
>
> Not the first instance, but is it worth saving 4 lines per and combining these
> into one IF?

Yes, I think so.

-- PMM
