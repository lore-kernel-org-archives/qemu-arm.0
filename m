Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9696515lff;
        Fri, 17 Jan 2020 03:50:45 -0800 (PST)
X-Received: by 2002:a9d:70d9:: with SMTP id w25mr5971323otj.231.1579261845538;
        Fri, 17 Jan 2020 03:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579261845; cv=none;
        d=google.com; s=arc-20160816;
        b=OAgGYGpQfpIRWBYZ3x7rUsVXi+50EpME3bKmJDZMnzgO1I8Sq0t6MRqVR630IZd6L5
         EmfsFMOtQa6SpqcevkpC1rIo1DQ5UqAHF9x691aMMNNYpQ5CcYmanGqWSASoLd9GC0Q1
         wxHJ8LcShf748Y7Fxfyuqea81iRC/Tiko8vFDrRdw6qA8+h7oAo9K0uGkbTd1HGKgHvi
         2+wBNMW/WB6zUBwds2v/+JJIwvKtIT5YlUkFoo8RpkSK/02QJYVaElSg6vvPGS1ineFp
         INntDh44hT5hW4r4KyhUokACa05nGLzOxFAL+5wr65qi+V19JtJiOItDaQ2P4Vvrs30J
         xpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iDytm4TfZbY5oMmfZHzGiEQQcHLYD9MXz+DIQoueERs=;
        b=V2lugIXa/euxpAMm+twmk43VijNSnSi24p+PjSub1c7lL5XAfStIT7ZJrZIFQjLjWs
         VaYGL3NG85Vu0OBcDwhpPa0ueUHQR8y8mQZuC2eZ1tro5UObRFivSwxTqvPZbNLRsKKy
         87+2PAyDfr5NR3rMmracGazBAuFoycZNRer5FUGqJ1ioD51TYyXI9jBx3JVVs48zY/Z1
         jJV5cbUv1TGYq0rmIVFjYLDeQ0vH1CAgIfMwEaS1USbLG99bwOhkRmvTVDxOv/USdKtt
         jR/m9BDb2DNPpfbXpIoEeo+IyYbnfJulxF81p9CZI1rpPvUB/6A7FtKUGKlc2cKpL/Xn
         iw7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wI0m4sxN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f2sor12928220otq.42.2020.01.17.03.50.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 17 Jan 2020 03:50:45 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wI0m4sxN;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iDytm4TfZbY5oMmfZHzGiEQQcHLYD9MXz+DIQoueERs=;
        b=wI0m4sxNvbm7kjpw41olUT6lrYS4NLnKwPgFkxnop5WRGY15XoQspOE7HWiTQGN+40
         Hrc1k9esqY+X+d6lxw9s4DWqlyFWzHGJiDssVEa1rCumYDnZN+yArnFydppCHlp9pHLu
         YUGkZBw5SLv1EkzGmdvYHk8h/6yiaw3J5xFi6WMxLROQOIRuVOHGn+fgNKRJE3Lswaa+
         p2EeD2h6WHV30PgGhhlJsLDicjOj17VUO7D55BR9TdAuekdcbSgvS4Toj3rxJCPjdogG
         TIl4vLn6oOtahbJBFFLmTr79YFdyWKnLmk6KZcbzEAqBALJ7AAj/djPgrWd9qXuUTF9i
         rUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iDytm4TfZbY5oMmfZHzGiEQQcHLYD9MXz+DIQoueERs=;
        b=NcPi1Ynceot888GVMVKAMPwwsF5hR3g87+97v9zRjKMppCz+mBGDS8qozNscVsQDu8
         ltpTSiuW6pJGShL8Djg2voPzxJ4z85hA2KUE8Svg3txYI5FSWREXLGUNcn2GHESggaro
         yCe5cm1l6x4KzxUke+6Q9gXT8V3ayPHZWJe5v6qn2ubVq38OkDmWmv8mQugCBEPTqzwc
         TPgOafxNGCydOHe7YHoTbAdZFzkqpiNnYhxo1++YQFUR6lmH1lS8t1K4f8r1YIn6vklb
         Ji6Tc31fMxes/52Ms2uqGmgP3KrN2cL1giK7dm9odxey36vcUqgV0QZeohxcEeMgGUvh
         8wbw==
X-Gm-Message-State: APjAAAWzUUgTqneJAwP4VAOsAtAOKKzzj2jC8bDmYhuug2xLJALk1zlw
	pk+DzrBfPVYUsGqr1RNPJfHP6bSU35Fcx175q4Z/bIaTmhUbpQ==
X-Google-Smtp-Source: APXvYqznTo3qqyC+aPlCw4uEb42nRqdw3eWjM2c251Vfyx+z2XZp5X708DW4NhrXR2rmaiYu9TXygRzXp36b/v2UO3k=
X-Received: by 2002:a05:6830:13da:: with SMTP id e26mr5466797otq.97.1579261844377;
 Fri, 17 Jan 2020 03:50:44 -0800 (PST)
MIME-Version: 1.0
References: <20200110161626.31943-1-alex.bennee@linaro.org>
 <20200110161626.31943-2-alex.bennee@linaro.org> <CAFEAcA9nNH9pu+8E_YYkiNtzePjZdrEBjK_9zJv+XJaSvcnhmA@mail.gmail.com>
In-Reply-To: <CAFEAcA9nNH9pu+8E_YYkiNtzePjZdrEBjK_9zJv+XJaSvcnhmA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jan 2020 11:50:33 +0000
Message-ID: <CAFEAcA_0hHjkhKtVsQEsN=Xow=W6vPvGJPJdzHh=O6RG1=_mAQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] target/arm: detect 64 bit overflow caused by high
 cval + voff
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	1859021@bugs.launchpad.net
Content-Type: text/plain; charset="UTF-8"
X-TUID: ocjV9kyiPU8u

On Thu, 16 Jan 2020 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> There's something odd going on with this code. Adding a bit of context:
>
>         uint64_t offset = timeridx == GTIMER_VIRT ?
>                                       cpu->env.cp15.cntvoff_el2 : 0;
>         uint64_t count = gt_get_countervalue(&cpu->env);
>         /* Note that this must be unsigned 64 bit arithmetic: */
>         int istatus = count - offset >= gt->cval;
>         [...]
>         if (istatus) {
>             /* Next transition is when count rolls back over to zero */
>             nexttick = UINT64_MAX;
>         } else {
>             /* Next transition is when we hit cval */
>             nexttick = gt->cval + offset;
>         }
>
> I think this patch is correct, in that the 'nexttick' values
> are all absolute and this cval/offset combination implies
> that the next timer interrupt is going to be in a future
> so distant we can't even fit the duration in a uint64_t.
>
> But the other half of the 'if' also looks wrong: that's
> for the case of "timer has fired, how long until the
> wraparound causes the interrupt line to go low again?".
> UINT64_MAX is right for the EL1 case where offset is 0,
> but the offset might actually be set such that the wrap
> around happens fairly soon. We want to calculate the
> tick when (count - offset) hits 0, saturated to
> UINT64_MAX. It's getting late here and I couldn't figure
> out what that expression should be with 15 minutes of
> fiddling around with pen and paper diagrams. I'll have another
> go tomorrow if nobody else gets there first...

With a fresher brain:

For the if (istatus) branch we want the absolute tick
when (count - offset) wraps round to 0, saturated to UINT64_MAX.
I think this is:
    if (offset <= count) {
        nexttick = UINT64_MAX;
    } else {
        nexttick = offset;
    }

Should we consider this a separate bugfix to go in its own patch?

thanks
-- PMM
