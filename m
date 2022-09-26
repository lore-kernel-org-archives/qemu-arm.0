Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp2237423ocs;
        Mon, 26 Sep 2022 08:07:57 -0700 (PDT)
X-Received: by 2002:a05:6402:35d6:b0:44e:f45a:8f79 with SMTP id z22-20020a05640235d600b0044ef45a8f79mr23179981edc.393.1664204877615;
        Mon, 26 Sep 2022 08:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664204877; cv=none;
        d=google.com; s=arc-20160816;
        b=GIy/jy3osoQAOLLl1uvwiO51kszCmKClTIEMxsAkzlNtTtkC6GwSMqP7KygiYHdRvG
         88maKLsvFc7+C4TvhxzNEWMA5s6DkVetqtXaUFiRWgc8Qq6Xf8PlhIbWsabWGV1o4Pcs
         MvMLDK4g3EfOMASpN0tLJijsNFjW88I/y6oKlPrmEsqQVdK7EPNYbU60KcrgF07bMpXb
         xnJmrFRxG2GvVhcU/XSfWzgC7cEnnvByDF4C1dfolRQWIj6Q1BN7FXV5lHWl5wxi5i4r
         Unq5xWBPi1QlY69pA3xNNBu58mopJOwQcWMAKJYQ2fA+GBgAngYgyBzSyLFxqnSm2ZVB
         2/bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zeul5dHZDsmNx5pH0BAXKE2LMYBR5Stn64G6TJC2FLk=;
        b=VlPZc4e/T3vUeqZQ0JKh9iLbkGebGtKbeuTIOPSrIJVsxlKyXMvV1E4nn50NVC2I6O
         mry1oKDDycqI1Xytt2+a2QOrBJM/z48mS65v/LrUPA/LlC1sAwFURpxshpvq2lg+v0A9
         wbzJMwivRIGsimqtlzcB1bGLsJ/MCww84pbJ9WPXlrETVRGYrKcF7mkaWLt96zC4FWkH
         RGH+rz2en3y5hqtk7MfS+74NDlHW++d6z0nHmtH0KKkNjyvDPxviWxaf2QBDSLMJV2La
         5xseWYPBeAJcyZ5Yi7ZFmyLas35ZDtbk/MX09yy7jYAuuYaO8WFjfci8pu/Tjd+qpBj1
         B4Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CUV5OeVW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l16-20020a056402231000b00448a00bdce9sor8314463eda.46.2022.09.26.08.07.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Sep 2022 08:07:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CUV5OeVW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=zeul5dHZDsmNx5pH0BAXKE2LMYBR5Stn64G6TJC2FLk=;
        b=CUV5OeVWHRrX5wO+PaTLLiU47Oq1OoVT1ULoFUBMl6AlZ2ijugpMeClHj7iABiWiW3
         2cyT0ulqaO09vEA2e/yAupy1+ubxbELDmD5sOh9bsLjnt1JdhFIb2iGZZY9RJp5f8zRX
         51eIl0Pf+3D4t6TJkAhJFgZZgJiFrpa9BYvSnXWPUSkoB9jjxHhcGC+vfd1lO5E5tG7/
         KhiFQqYshlTeW2dThgINnFj+nMekgRowcQaDemnra9z1GBbzTYHVHaWTV9gu/qKgu7sH
         0qhz0+8B6ipPAIL9rEhEw0y83kHxEKKnizc81MBfGugB01Xb6pNnHWubN+VjMX3TmGZ6
         SKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zeul5dHZDsmNx5pH0BAXKE2LMYBR5Stn64G6TJC2FLk=;
        b=PBIsJ9V7iimKFZDg7cAiB4XkXS7Lt0jcvdXhwnIrs3RAlzGkQh8PaoHubk7X3/tC2g
         G0W69PDb+zQ0JyTYFiOeUaGDZJ33YRaG4TbNBhneXCMwVPjUBWT8eSb2aP4Flg0QHiu5
         6tHhnaNQLWlEM/S34OjOe44ffZPYH2SGY4bbfFY5KoQ+/yXGuH8S3rV22IRX/jl+0Wuw
         0c33b6xKIdOBfVO93Knno0uLCRtZ2bohHhDiaNjvSXmm6rx4jqI7qa5V10FXCSIwGIN1
         6RV9PZ3kmAAzyN4Y8acMJ3nMmp2MMSO4a+HL/EouN4UGfjSnXKHcHSekhsmSHBWftDn+
         Ju5g==
X-Gm-Message-State: ACrzQf1CEQhDpwan8t7LuBU4CbWKLTTCUSRKHEkESn00Pzk0NJG64cRB
	SixI4WGrvDj8nFnA7SsIENswXunOyZPg4ehhaRZS/IHjTarA/g==
X-Google-Smtp-Source: AMsMyM4NUPY+edKXsvc/IktCmrMuVOxWZCt1hEBWG7fzT+SLbrnJyCgfC41Lysfi2hrC9jrqwinC8x6XwjGN2LzokjY=
X-Received: by 2002:a05:6402:1d86:b0:457:e84:f0e with SMTP id
 dk6-20020a0564021d8600b004570e840f0emr11127041edb.241.1664204877246; Mon, 26
 Sep 2022 08:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-3-alex.bennee@linaro.org> <CAFEAcA-gpE6XYbiacSAso1_66RXYEJD04z4+HW4fFpqeCvpdQw@mail.gmail.com>
 <87pmfi41lp.fsf@linaro.org>
In-Reply-To: <87pmfi41lp.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Sep 2022 16:07:45 +0100
Message-ID: <CAFEAcA9EQVExnhmYDNOtpptHYrnrSHEO5Baw4z96FNuadysP3w@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] target/arm: enable tracking of CPU index in MemTxAttrs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, mads@ynddal.dk, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tngxukUC7g8A

On Mon, 26 Sept 2022 at 16:06, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 26 Sept 2022 at 14:39, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> > This only catches the case where the memory access is
> > done via something that does a virtual-to-physical translation.
> > It misses memory accesses done directly on physical addresses,
> > such as those in arm_ldl_ptw() and arm_ldq_ptw(), plus various
> > M-profile specific ones.
>
> I thought they were just used for the page table walk. Can you place
> your page tables aliases with a piece of HW?

They are just used for the page table walk, but they are
nonetheless still memory transactions initiated by the CPU,
so if we're saying those should be marked up in the
transaction-attributes struct then they should count.

thanks
-- PMM
