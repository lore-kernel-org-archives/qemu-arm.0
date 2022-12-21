Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5119590ejb;
        Wed, 21 Dec 2022 04:33:51 -0800 (PST)
X-Received: by 2002:a05:6a00:27a0:b0:56c:7803:1ab0 with SMTP id bd32-20020a056a0027a000b0056c78031ab0mr2669773pfb.29.1671626031143;
        Wed, 21 Dec 2022 04:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671626031; cv=none;
        d=google.com; s=arc-20160816;
        b=ollGK1NvxmswxNj9skLCuccVjrGd79wnk1v5DlHLRoTrUU5QGb2eeMMsMhn5FZCUyP
         i1ZdK0IiV3wYNvGdZtZ3T4WUONfqmDXFPPFBWG+JpHeVPyf9lCIlUXqXl2BlhovLu/IB
         DL7ci1sMmBgmDsHvpYnOBEVCzVXqnNjyXQo23JF7ddxjf8D1ChEU/NFRVfb4dwjHFxK6
         xX8cQ4cMt7J3DGx56I99NYEVknSNRVlmJ/xJITeURzPL4mJL8UX3RdAk+e1Vg6f+lS1t
         FueSMNOxGQEDQG4gSSTPAYT76xG115ofiKfR2YHgxoygGNH92Lc//4haK/M0KnIVhtac
         sQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2gUepqRJ7JuPnGa6uYh1XSbS16AVlek0FK2REpxb6AA=;
        b=w1KNi0Cak6uxB9t4YyJSYSqC0hca+MufLgm2MyVCYbRLmDtgEuBHIZivrD314wVLj7
         FF10nxJ9TEeHk1lZjAXIATBFwYKrVaSIKEDbtmzC0No9POo5Z3Uf5RgxlzBPcVWdvN9r
         R+DdKGDwaGVGcd21DbWxA4ppC0np8NZqf8RDeF8auoVBe9cOrZYc3xKmxKPjiSpZ2WJw
         h2H0WNtdkY/+QDpx3nIGo4HP48zHOmUk2qAjpSWrf8gp/VcDDNtj1SMVp2eujZpYjySL
         VCjI8f8RYXpmeLCFwfm6aUShbxghOmw0vNm9itIrpqtezzQ6ZsGN/Dhjx0nPre0GcWxK
         xc2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jJG0EVh9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e15-20020a62aa0f000000b0057a9b1468d5sor6586947pff.43.2022.12.21.04.33.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Dec 2022 04:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jJG0EVh9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2gUepqRJ7JuPnGa6uYh1XSbS16AVlek0FK2REpxb6AA=;
        b=jJG0EVh9zw6L1d9Pn6k0cCNhXTrHPYVTq8iOY6mOGMUpRC3CD55h/je4laY8Fv1H1M
         7HQ1Vj1tnGiaq4gBwHLfr4hWjqJYwglvx/2xxpDgszY0xCZVix239HBtL4yidQfY14Vr
         +iTdGYWT4m5lr2JGDrJPN/LZqCn3Dz3nyrDzgE7bdjLUF+IsfZ1h6VK4l4Sos2QUXNaH
         28HOkvdQm+hhhGlZz/EDKshRrEu1q45AGoF8adXG4gB0QITj9joWw1TQGVsClXj68esR
         t+zQX5f887gF69AJHmc2ZQGocnD8NNVRM66iP1gcL1wfz3Fh/f1ItGrQa4+DnPC5L4GK
         ezwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gUepqRJ7JuPnGa6uYh1XSbS16AVlek0FK2REpxb6AA=;
        b=oXOHV8hb24etl8Q69OSpm2/i58NBA4IQFe/O4Y8eNXui3AGMWTpdOTZKNavsFgF5ax
         69iDyP1rIPh8aRLyoDK9L8yLRvA2VMxc96wfZ9MrXgCMF9pOgP5rfVSpFJQm62+zi3Pa
         mpJ9tzRmjMYeYqpaK/4uwK9EcMhaVpddUovH6zNVQw9AqALgxaEBHj5jMYNoan7QG4li
         9ACUrH0TssX3GqZW32T24BClBSKf/UnlI40cmonOV0TN/VvetD+4ya6ANAReuWvP6G1E
         i8/LpAbzy6IjqtCwSe/E5tqCdoPSq1aPjB6p80DCKsp8I/JuE6GzB3TxLhJH4jnFcGon
         YhiA==
X-Gm-Message-State: AFqh2kppPhWBc24N6mMsrGaHu/GTgmLz5Cm4QgfEY6gcgmhdFfpoBIi9
	xW3c3scJXTZaigxQ2UpuGXsC+v6nJhRt/C/WXtXS/f/I445yPx50
X-Google-Smtp-Source: AMrXdXsh83HjF9RGLEdXJCc+AKRUwIGHGh3J17Ll9HJqw+jo4kbjV/ormeZ6Trl7Ug8aqxWK9HUcA5UybqBQg5Q1TZA=
X-Received: by 2002:a63:3d4:0:b0:492:50dc:da4d with SMTP id
 203-20020a6303d4000000b0049250dcda4dmr53017pgd.192.1671626030627; Wed, 21 Dec
 2022 04:33:50 -0800 (PST)
MIME-Version: 1.0
References: <20221213125218.39868-1-philmd@linaro.org> <20221213125218.39868-3-philmd@linaro.org>
 <CAFEAcA96ncqvN9iXybCd2SrVKJ9CKsu5t3_GtdNt1ZEDAkFt0w@mail.gmail.com>
 <e8c3fdcb-81f1-7067-217c-c49e8748b84a@gmail.com> <CAFEAcA_jH3Zn1cFfnvsd_GhiBj1bNKscs7S7cwFa+FnTC9QC=g@mail.gmail.com>
 <Y6AFLpDEkpS+muSJ@yekko> <CAFEAcA9CUtdLXKPOqC0uRCyA0xQFZ_SrJ62SSDvPKESaxL3X2A@mail.gmail.com>
 <Y6JeXJn1qCkeIzuz@yekko>
In-Reply-To: <Y6JeXJn1qCkeIzuz@yekko>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 12:33:39 +0000
Message-ID: <CAFEAcA96faOvyo9cqpTZm+U1iMpRphnxvXfUuqStonzGGcMTLQ@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0 2/3] hw/ppc/spapr: Replace tswap64(HPTE) by cpu_to_be64(HPTE)
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-devel@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alistair Francis <alistair@alistair23.me>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz <groug@kaod.org>, 
	qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: O+uHx3q2wVas

On Wed, 21 Dec 2022 at 01:35, David Gibson <david@gibson.dropbear.id.au> wrote:
> On Mon, Dec 19, 2022 at 10:39:40AM +0000, Peter Maydell wrote:
> > OK. I still think we should consistently change all the places that are
> > accessing this data structure, though, not just half of them.
>
> Yes, that makes sense.  Although what exactly constitutes "this data
> structure" is a bit complex here.  If we mean just the spapr specific
> "external HPT", then there are only a few more references to it.  If
> we mean all instances of a powerpc hashed page table, then there are a
> bunch more in the cpu target code.

I had in mind "places where we write this specific array of bytes
spapr->htab".

thanks
-- PMM
