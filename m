Received: by 10.25.0.6 with SMTP id 6csp1885488lfa;
        Tue, 30 May 2017 09:03:16 -0700 (PDT)
X-Received: by 10.202.199.69 with SMTP id x66mr8465761oif.215.1496160196065;
        Tue, 30 May 2017 09:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496160196; cv=none;
        d=google.com; s=arc-20160816;
        b=s2B6GNhr42DNDCln5xo3CWTTM9D7WUwgTrWEHZ7D607x9J7MqHn1iGy2CDq4qT5aoa
         wB9MwICz445tEOiS9nhm29na1N428IIvyMiBEXrzQlOVT68qJXMt0HQD0m2XfMyL+by2
         sD3mCuYK6UPcz0tGl7eQaPJT88Awv1hEaxPYLGU9tGOW25txNQjgzNImY+05OkQK3+P5
         7/w93nmXcCOOjq/BCi3sN7KbOIwbS8vxoXoNFAF7riFF7G+dvzOxqlxa1ydN0le6c7T8
         FzOND3hMdr428ogWylSAJcXa6dPrqNQ4zGr0UrDfVZooJcc46dmh83XGP6/e6g0KCcmi
         66cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to:sender
         :mime-version:dkim-signature:arc-authentication-results;
        bh=raTSRfw47DscOJR7TT4sC7XXPHfmkiibRJcs+JCZ5k4=;
        b=hR+vqrfKftHAQKyYAhy9tE8NT1XtuAUArfrjLTs9k8JPQgtFP05g1XqeMrom4lG8Sq
         GVzOj1W92uR76y1KBNhoH1FdnNlbsS7U65lT5KsEWC1f/kUQHhuoljnzic6EMUUS+Zkx
         TXHX+OhBOCSRo9jo4LltKihFLtmF5WqwpiDEQYTMnSTLUNazeZjmpVXdR3rtpQP0AwrP
         zmclceNP0MCr9uULgTFO2slou1GPoPTg3w/HfjtW7TlG2B6UcwcO02tN8ENXTQ5Nfny/
         Yt7rVWTSy5Z2d34zzNyQD8KGtcYffsa90UC4XZJqAXtSwEmHUREL+/F2Sg8+SeZVskDr
         PpJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=alistair23@gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com. [2607:f8b0:4003:c06::242])
        by mx.google.com with ESMTPS id m23si759433otd.293.2017.05.30.09.03.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2017 09:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) client-ip=2607:f8b0:4003:c06::242;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of alistair23@gmail.com designates 2607:f8b0:4003:c06::242 as permitted sender) smtp.mailfrom=alistair23@gmail.com
Received: by mail-oi0-x242.google.com with SMTP id h4so16512222oib.0;
        Tue, 30 May 2017 09:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=raTSRfw47DscOJR7TT4sC7XXPHfmkiibRJcs+JCZ5k4=;
        b=SyPnC8guJH4kF5shWl3jaGQrfNfLO3aZjPVONav1+kMM0aBajRYEcoNEAIcT8z2yx9
         NeUjw1VwcgoahFrOQ9L6Q4MsNm4/lANgxpJbbg65err6fP9AMEOu/Dhn4KRRXuup49fu
         QW0/TNzEJS5/FOYgRhASqv85RoByluZUXhDwFdVt02hzZEohidKHSEA+j6NtLEjFpq1Y
         dMMtilxWvKLezAEIEGLgx++ig/FNBl7pXsUCvG36pGGQ7dyujnmb6pIm1ws1rAzMzSUJ
         JMQzFrcYhWlH3vnY182lSKrvB+iu+7CEADvX76cLDd1vcS2Vl4KpNjsiB7sYLQuHjUlj
         jTvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=raTSRfw47DscOJR7TT4sC7XXPHfmkiibRJcs+JCZ5k4=;
        b=OzgVu6fqzLj1O18YiFCIKln1WfVuXzK3AUzgBA3AM4mTkDN07TyCs3Dqaf4Hec7klQ
         +yuBKl6URz8b1WDLI5LziCt2HL/HnlDHDz0HFf0Tw67EEPEHsRrIDWUch3KZ1U30xwLr
         h9zziKSwMG21YKZ9UigxIthNfvm5TA5vPnn4bxPkpfJmfTNZyScpRhqv5GwKD7vJW9hs
         6ORjIiCDUsXpbowg7YrA8fOJb6IlZE5GMk5b/9jADhEOfQBa4gVYuCEom2a9twE3FZAI
         seXkopr7OmOpGqKomVa37UC42/J6dObeRlGCpc0Z2O+WTGR5SjNi4A6qvvukPcPte7aL
         TsIQ==
X-Gm-Message-State: AODbwcAKVKWaVT7/zaNDX/WPKNTxRqpcmNY5M1PRRHfiu9U4jAePnvkA
	rbIb7BEkwL1UIepmlkcKoLisq0mITI6i
X-Received: by 10.202.0.4 with SMTP id 4mr8910431oia.8.1496160195422; Tue, 30
 May 2017 09:03:15 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.2.37 with HTTP; Tue, 30 May 2017 09:02:45 -0700 (PDT)
In-Reply-To: <CAFEAcA9mo3HgVxG3OGAcMQLa4iwsHKofQ8CA8mZik5J2fm6jgQ@mail.gmail.com>
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org> <CAFEAcA9mo3HgVxG3OGAcMQLa4iwsHKofQ8CA8mZik5J2fm6jgQ@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 30 May 2017 09:02:45 -0700
X-Google-Sender-Auth: GVT9hhQl--dCvxbwRptqbow3eO8
Message-ID: <CAKmqyKOfvGUi74Kg9E28qKu=sJh0BvhBYSbTjgYWr317coRUAw@mail.gmail.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 00/13] armv7m: Implement MPU support
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: t899v2ejclFq

On Tue, May 30, 2017 at 7:05 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 April 2017 at 13:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This patchset implements support for the MPU in our v7M cores.
>> Support is on the same level as that for the R profile MPU: it works,
>> but regions smaller than 1K in size are not supported. It likely
>> has some missing corner-case features.
>
>> I wanted to get this patchset out to the list before I go off
>> on my break; I will come back and follow up on review comments
>> when I get back in June.
>
> The patchset has had review for about half the patches, and
> no this-needs-fixing comments on the others, so I propose to
> put it into target-arm.next.
>
> Let me know if anybody would prefer me to hold off so they
> can review the remaining patches in the set (2, 3, 9, 11, 12, 13).

All good from me, I'm happy if it's just applied.

Thanks,
Alistair

>
> thanks
> -- PMM
>
