Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp767877wrp;
        Wed, 11 Sep 2019 05:00:47 -0700 (PDT)
X-Received: by 2002:a05:6830:1be1:: with SMTP id k1mr12332029otb.364.1568203247528;
        Wed, 11 Sep 2019 05:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568203247; cv=none;
        d=google.com; s=arc-20160816;
        b=ePQht25hae+06E5l5rPhtjwX5BhajdsCQlKl7cHad1RiKd0Kf2ie0NBeaxCBEHjNMG
         AqXgHlAROl+nI/NsQNZ794FlFBi267CZd+87LBH7l/rbjNg/kna+fryQJUdAyVh/hu36
         BT055ZCqOl3A1KzpvrQ1rMuV5Vby49eQHvx1xXy6TZALM/Y4k/kRdAswandZGv7fOFxj
         YAlNr+Rj9weg2dPG1b04bFmskcN5RyovJofzFwY9+/EkrkJn9t2xlDpca+2hfGR2jr22
         em1thTIXIScPEF6L1JzNl7Z1rzB9gPvfgZ5OKFotBt9G49n7RuRqZ+ZVq2hsRlDdmMFo
         ErIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=znBKtWGumXHEWuNX1v6kCONpTPR5H+awa565uDytD3k=;
        b=iB0/75BtaPDDvnBMTb0KNOjnMK1AwJfpyu5pzB9tmxfjJZdOBqr8o4asiu+j6VMFq0
         4Xyxjj8lBHuG78wN5gMrTCA8lMKUwtdaK2dkBm/99YzfsmF4x/jAfYrej12miEPxMM7W
         x41qNjpVVOJEgYA36hureshdCggp2Qin4JLTMXP2hz9rTHOmof40NfabIqdIjJKRQOAT
         bnDqgogGK6PMOxbRO5Qr7VQFI67ZZrjw+PkJ0zFrd7fO1EMOkyTMbcAwNGsQfpOJgslf
         lmfhejnzntQhW0lDinJp901FWQc6YuIKBPfbB8dj5fYnC0KQIQgvNK/RHi3Wi3ciou6G
         cTOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nv2WubTd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q12sor10896127otc.151.2019.09.11.05.00.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Sep 2019 05:00:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nv2WubTd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=znBKtWGumXHEWuNX1v6kCONpTPR5H+awa565uDytD3k=;
        b=Nv2WubTddl9YRW9NLAUPUC2GbImLnWvDXc0iekHavCUTqJrHkMYaod0ske14HXszEb
         mMfWELXYDGDLQ5AQy2MK0z5jGCiytpVd+BCHoS/KPFu1CjTuixHeO/WACDOqk6gYy8k0
         Sf90Ks1UV5fnQn41m6LxRe9YTpxWqoveYmbP2g8OTtaD/xynXV1ccOXKZ0xYA+ee7l77
         XUuS2TOkt1zlb6Im5idhuzpihY095QwBa1KHpKCJ4iDhEU13cD3kUQtjpDOMSChouGQq
         d7XbwMsa4mYPnoXyoeJr7X4epuBTiV6sHAm+izsB1JRGXtMooYA5yzjGx0O6q/Hu3WDk
         hQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=znBKtWGumXHEWuNX1v6kCONpTPR5H+awa565uDytD3k=;
        b=aSjxFr4i1GvWDkkbh6iHOEFpyunTwKC6Q4gy2di33GNBH+IyJHkK1/ZPOMPNav/64G
         0z6dpO7bhJl/opT3j9NhvStLqj+zFCqdy0lW+OD+vPhrtxX4Npf4iHQ0PRfZQQ9fh01W
         0WFS3IbisYi5ZDbg7tkJpSEsHus/JsoKgH2pxayJydfOOaMt9AmyH0RKlxlZlL0CWAf0
         r417MCwpikQgRND9wEkC1b4eOfTr2UcW69T1ZFBV6gm44xVii2QExIEwLwHSBbueHXHy
         uA7zv8ewKTskZ8qke4DMNELcjf3soUw/L2pFq7MzqVjOLvc5i89upEvBEwWGbLE4MR1c
         tSkQ==
X-Gm-Message-State: APjAAAXTCqUbUT1iwbBXmsXUzjIKvMgkEofXuyqH/SRUU3cgWmTWhn5G
	3vbfbYa23YX+Im9xH46OqL568BVbpF84Taeq1jZiu5163z9ZXg==
X-Google-Smtp-Source: APXvYqzgxRrHdAxjvK0Osfz1dDEnU7xUib/UM3bgXyv9YKZhJSfIVh90f5MgOv5D/NMiO6VSBAEFWnrnAyqq/p8UWTc=
X-Received: by 2002:a9d:6a8a:: with SMTP id l10mr26316069otq.97.1568203246756;
 Wed, 11 Sep 2019 05:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190906202636.28642-1-alex.bennee@linaro.org>
In-Reply-To: <20190906202636.28642-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Sep 2019 13:00:35 +0100
Message-ID: <CAFEAcA-DQ0Zq40Xnw5wkA6ojOUCf67xfX83nMEoKW_UrysJhjQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] semihosting at translate time fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 0zfZ7gnoyAR3

On Fri, 6 Sep 2019 at 21:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Hi Peter,
>
> Hopefully this is the final version of the semihosting at translate
> time patches. I've applied Richard's IS_USER changes and gated the SVN
> for !M profile.
>
> Alex Benn=C3=A9e (3):
>   target/arm: handle M-profile semihosting at translate time
>   target/arm: handle A-profile semihosting at translate time
>   target/arm: remove run time semihosting checks

Hi. I've just been looking at these, and I noticed that
they seem to accidentally extend the "no semihosting
in user mode" check that is currently for softmmu only
to also cover linux-user mode (where it would amount
to "never provide semihosting"). This is because we used
to do the check in the helper.c code which is only used
by softmmu, and not in the linux-user/arm/cpu_loop.c
equivalent that linux-user uses. But now we do the check
in translate.c, which is common to both.

There's also some missed cleanup in that the linux-user
code can also have the "maybe EXCP_BKPT/EXCP_SWI is a semihosting
call" checks deleted.

> Emilio G. Cota (1):
>   atomic_template: fix indentation in GEN_ATOMIC_HELPER

I've taken the atomic_template fix into target-arm.next,
since it's unrelated.

thanks
-- PMM
