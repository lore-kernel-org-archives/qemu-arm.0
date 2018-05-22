Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1394894wme;
        Tue, 22 May 2018 04:56:45 -0700 (PDT)
X-Received: by 2002:a9d:1ba6:: with SMTP id z35-v6mr16584845otd.216.1526990205472;
        Tue, 22 May 2018 04:56:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526990205; cv=none;
        d=google.com; s=arc-20160816;
        b=zjnpp8BYvEl/KQhvt1ZSKKTzXj8h/JVaxRDz0KFDecWI0Qpxe5WqmqubVQ43q0RSuS
         a7U6DvOotU7xnZc2DkrsY9UY6VJPKC77JkltBX3uMJ67SWI4H4Pkd8xOwkqwas52mqsp
         hSzOiQIMMjtvFwhKtIKzNP7euJ41WyfE+R1n25qOE8TOf4xWnd/FKWR0udKmCNtdx+Ue
         FeCDwvYwEfQjvovvnLmha/P01B981yzw364LAFJ6UfClmBgGl/++hsUqWZ2HtqxnTKJx
         voH+L2hvY1D/TIwSZsvgWpPdxq870IfoPMS4STMYVqQ6yeodEYIm0pfMwj4xNiII46gI
         GgfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=ebk2m0l0FP392lSGDiyqnWm+hafGiPnYZ1i0gkBF4Zc=;
        b=L48GUBXmYijB/p2ErOxnW3/kHYIUC3dgtnsWQYRB3hNgplsoOrsvmFDYs1H8At1tC6
         FZLGZhJv081uPWvaumKrhEyNs+aISTt27qjDctadj1S0BDdV4GkfUxXwurcEBSmWUtbq
         UNjWQ59WNxYYjIKXXVXQflGyEl7cqKP5r7qlNKZMU2hEKa6+r/cTxgNobztiVbyp86oq
         rFrZsjducBWgL80pyDeaM6vtrvff7L4dkRXhCFgE+Qeq5OzBNyB6QGLDcAO5jyKGf//5
         v5MNb3TP1iaKxoLYeMxmcNhWu91XNs1po5iq0BwMMbNiOYPgVhIRlN7Gy/jFEPlCEJhw
         SYpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWMqxM/6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q186-v6sor7987399oib.167.2018.05.22.04.56.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 04:56:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TWMqxM/6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=ebk2m0l0FP392lSGDiyqnWm+hafGiPnYZ1i0gkBF4Zc=;
        b=TWMqxM/6DI9QPbqbbui/3DxDgbIuEIYyEUtcNVqVH55t/i71Z4j4hvQ+2wTedAuIjD
         WdmBVYOplxrmigW17Z6q+QBgDplbexn6G2e7sRPKZHdcW0n1m7a9woHKV9BkpRkWreR1
         h4vXpZ1iDyyr+Lv2CUtjVDyrjx/ubijKgrpRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=ebk2m0l0FP392lSGDiyqnWm+hafGiPnYZ1i0gkBF4Zc=;
        b=cK/6MQ/pfQ3/Vc3uFuVCwhCuSzkynDGBxlazFIvLFB0Sh6mHhBCKIMW6ZfZJqo6myF
         MoDb2LQY2PDbf/4ChwcVQzCTvppGOLivqQUIHhvEOuh0Yms+7OwdjVZlsJWW2a9HvNnK
         Y0iKkzKXNrR+1G64hLyVVLEYe2TbahlpP+zcnb9yM5VkqikXLzALcG/72laKTp1KK6P0
         bRNvMDTL9LnNqd0Om7sROI0kZ1UP+aAcFRCem67wN03G/rzqeS+/cwtN0Ke0qNOVYDGA
         DtTHu3XmYwGdh78v7616NccT3Ix89cQFT/tyZ1bpKK2vh4USqYUxYsxNZkXcYaLiOwmc
         r7Vg==
X-Gm-Message-State: ALKqPwccFACIZ5do64hYCTu0dc/66YtHOeSNM050GFga8NF/wvM7wGP/
	JQxpvS5XtgOS8J4Q+cceNz5GPnwrYogdp64U9sSxebSIjko=
X-Google-Smtp-Source: AB8JxZqeL/7KsENq86/gJdeMq2vIBAeZiFUGCEVdatJLA6k1kt7oGXWxOZcIy3RMKUrZgTKcFg/jrfC7F+eYaKPqKvw=
X-Received: by 2002:aca:cd0b:: with SMTP id d11-v6mr13055372oig.337.1526990205085;
 Tue, 22 May 2018 04:56:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 04:56:24
 -0700 (PDT)
In-Reply-To: <5c004b51-6d28-58e8-2674-0df659c51e65@redhat.com>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-19-peter.maydell@linaro.org> <5c004b51-6d28-58e8-2674-0df659c51e65@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 12:56:24 +0100
Message-ID: <CAFEAcA_NWGczOhpRqRaZfdeeifubEiLqjZXytuYx+vRrv7rPTA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 18/27] hw/misc/tz-mpc.c: Implement the Arm
 TrustZone Memory Protection Controller
To: Auger Eric <eric.auger@redhat.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AWo1oPdhjsuD

On 22 May 2018 at 12:30, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 05/21/2018 04:03 PM, Peter Maydell wrote:
>> Implement the Arm TrustZone Memory Protection Controller, which sits
>> in front of RAM and allows secure software to configure it to either
>> pass through or reject transactions.
>>
>> We implement the MPC as a QEMU IOMMU, which will direct transactions
>> either through to the devices and memory behind it or to a special
>> "never works" AddressSpace if they are blocked.
>>
>> This initial commit implements the skeleton of the device:
>>  * it always permits accesses
>>  * it doesn't implement most of the registers
>>  * it doesn't implement the interrupt or other behaviour
>>    for blocked transactions
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> this patch does not seem to apply on master.

Clash in the MAINTAINERS file? There's a dependency on another
MAINTAINERS patch, see the Based-on: line in the cover letter.

thanks
-- PMM
