Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp805413wrq;
        Fri, 15 Jun 2018 05:46:15 -0700 (PDT)
X-Received: by 2002:a9d:e24:: with SMTP id c33-v6mr982418otc.118.1529066775707;
        Fri, 15 Jun 2018 05:46:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529066775; cv=none;
        d=google.com; s=arc-20160816;
        b=Vzc+RUDtaXrmSuLgucCjCI48jCJhJV5XN/rP/YjvBoBLbWBTw0NtvZW8FkUGMCQ8nM
         bwKAI4UxWpafB9R+MG0If7Zyl0OcMZxT3HYdOtHySBzcDg2IS1eYaf6XnERyvjh2VcSB
         vAznYB/Tmi5gNzCM2dDTRfA4NO3zzpSG6l6y2wbo9uwC4haeHkUb8k3UZUAK6ebOYl9i
         0cIWsedt2t/rK+8zHpiRD6VzZsgVq+hvfm+IxKW//jFH+eUxspqXkzhrqdxY2ZP3LLYp
         27yHC3ydYTFvlycwiTHI5+601hcuiVf9XLLW2SaSoXvaQZEPPax1L9ffStkKJnQkM+Ht
         HTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=JXy/wppQYWVAzbOxsWK9vHKL9QD16WSLjwiuk4RNM8k=;
        b=vYVlQb6UHOiMQDnHDhsQ01zY37usa7FSSdrKd0/vne9nKfck1Ro3VN59igO4pvh3Yt
         HjiNNp9mVK3lyE3C9JkVCclFOGj6l9INey8ogZ1KPN30tdntuQ83BvtgjnYL0yl4Ui7X
         CXaD/QXsKmBv8GVwvqZLCS4/mg+EncrVW+alN1/zTKq1+9qQpP0NGrFfzhO6+aH9UCNs
         /wCGOaiEhd2GOEkbbG8Vh1bLJTup3x1eyQ3OWKrLYKeuXDg3wxlXJe5EkOn7Ybwbz4cp
         vKo+vLXEKZCruzij/DqDqf+uRzEbYru6AViYEsmj7nVqsQZ/ZcqGA7aNmS4pJYtehab1
         qajg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CD4UkOWD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t18-v6sor2798373otk.3.2018.06.15.05.46.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Jun 2018 05:46:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CD4UkOWD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=JXy/wppQYWVAzbOxsWK9vHKL9QD16WSLjwiuk4RNM8k=;
        b=CD4UkOWD0EqcwDLTOVMS9tZMFpYOXHPGcVjY++EDkxWWzv5iwvinXma0H2p92Ql3U8
         8QHJ412qHcDR+vEJavZmI6niUl2L45lQj/5/KyPOcFPrVrx5VnYMDAwGVnCWFhOJCsqk
         NPvooKjDzW5gEKLZ49mkHKuz95Ey9oJ88oZNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=JXy/wppQYWVAzbOxsWK9vHKL9QD16WSLjwiuk4RNM8k=;
        b=We4EA82oIjApDPI6ShhF+EX28IzEwbqk9LJHlDtYpIcsFlyICEgdX4jNgecuS8X4Pa
         32HO1pzBRBKuK6XmtaS7KwqqgFF6oz7XFGVKIMT976ciy0LcKfVOHEvwSXE6uDgRBpt2
         WbkPvRCNlG7v23XZe/w0tmezQTf9prWdSnBfd794D9RYIJzY0lilIo0T9zzGzEr/jRP0
         EbLaryBOqpZebI0ceJTbeLfSTkpcLnCXhMqlTt4Hkj8za720wrgQzgAdL6DTBIJUuvz1
         Fjlv/N0lj0nkcLnY7C3XenK0/T5o2nFvknAlwOYxtxXBai/FdJr0KaT0tp8rzz3/YL9w
         Pz+A==
X-Gm-Message-State: APt69E2tiTjpqwt+6dNZONF0UPQ/1SViKknuxxbOpOXIeU+7fi6bzjsK
	0zyAqV2GPwRdTjbUo9g00JcEYhdAXe9lK5lBkaq0TaNa
X-Google-Smtp-Source: ADUXVKKRD+Ue/uznXTy7vDTyav+wnqcskwCCpLA6ES2ZfJzcgwVKW5EmcxWLWy5ndZL7ji7i8Kpw2hSmG7XtxrxUv9o=
X-Received: by 2002:a9d:3d76:: with SMTP id a109-v6mr960045otc.294.1529066775282;
 Fri, 15 Jun 2018 05:46:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 05:45:54
 -0700 (PDT)
In-Reply-To: <CAFEAcA8OO0SdmE4nJhcQg6kWPcqs-5g8BkjOREw40aUchc6RXw@mail.gmail.com>
References: <20180604152941.20374-1-peter.maydell@linaro.org> <CAFEAcA8OO0SdmE4nJhcQg6kWPcqs-5g8BkjOREw40aUchc6RXw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 13:45:54 +0100
Message-ID: <CAFEAcA-2xOnL=U1VGVAP8uZhgJBYffohM0rE6XO7_bRr_XaU9Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 00/13] iommu: support txattrs, support TCG
 execution, implement TZ MPC
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Cc: "patches@linaro.org" <patches@linaro.org>, Peter Xu <peterx@redhat.com>, 
	Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-TUID: OelDSrCL0s2e

On 14 June 2018 at 17:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 4 June 2018 at 16:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Hi; this is v2 of my iommu patchset, which does:
>>  * support IOMMUs that are aware of memory transaction attributes and
>>    may generate different translations for different attributes
>>  * support TCG execution out of memory which is behind an IOMMU
>>  * implement the Arm TrustZone Memory Protection Controller
>>    (which needs both the above features in the IOMMU core code)
>>  * use the MPC in the mps2-an505 board
>
>> Unreviewed patches: 4, 6, 7, 8, 9, 10
>
> Ping for further reviews, comments, etc, please. I'd like
> to put this in via target-arm.next in the not too distant
> future.

Thanks for the reviews; since 1-5 and 9 have been reviewed and
have no issues, I'm going to put those into target-arm.next
(to reduce the size of v3 of this series and avoid possible
issues with conflicts with other iommu related patchsets).

thanks
-- PMM
