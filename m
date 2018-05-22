Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1715322wme;
        Tue, 22 May 2018 09:37:40 -0700 (PDT)
X-Received: by 2002:aca:a803:: with SMTP id r3-v6mr15239787oie.200.1527007060298;
        Tue, 22 May 2018 09:37:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527007060; cv=none;
        d=google.com; s=arc-20160816;
        b=S3+riBMO1kvpbaajKsWm4R8nraa8K0aOkPzSHK/gpfsgTf7v+P1kKYUP3isx7GoPYQ
         bhe8w72hzEeQiQ0lAWe/bpdCWhiPQaZjlVTslVvAap9XVeZQQlZCbScudGqtbS6I6cot
         Hh7CTZ1skj5/quJyYh9Kk7kq++dlTGQ2bYi+R440A4BAV7RDbx0M+NAvsWD71kWhFiRN
         m1gdE0z8dXWFtPW8poIOdMao/ecLHsrPdifsog5+Irkcg9SvdXR25WdgezS0xyuktqW5
         wroWmx7Tgja9xxVnZm7Pv2Lt1VzD8aJgsOzKoB/X5Pd8pqGv2B0QgS/Ai0WyJJtVgKp/
         2IBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=CXJAfDMvUXD6H1QelIo5keJ8t/x91ujsRar/3y9IXdE=;
        b=oftgJfpXhWGrF77+1wIbOOE3zAivkMWR8cSVxGC9H3Jk7v1WVYHZQK116+4yG7WtT7
         H5fuF+1BH5JKoRcMQ93TOcqo7/1XmxXXZnQRGNBuEzfbeW12SVz91g3SAePjv0pLpwrr
         rriGj8GnOIO1QnljY5Pyac847jNYewi6a5ZVOL327hPKF/iqvCNGIhrHgTu4rCcub7Tk
         rvh2UnswIPufRVGEtOa3u0Q9XNGRdxeOCSmE6sDU/6nyPYXvT0pooqY/IcNB7RBPmA5b
         9Uzv0oAljzq0fzbSkfl+zMli/yE57O5R045vgCv5yW1QY7PqPQYPkjxyG1e1zEdtd0QR
         G0SA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuroZE9U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id b136-v6sor8350795oii.104.2018.05.22.09.37.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 May 2018 09:37:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XuroZE9U;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=CXJAfDMvUXD6H1QelIo5keJ8t/x91ujsRar/3y9IXdE=;
        b=XuroZE9U6zTiBHIKxaIlOz5kMXxUboCUJzyDiPEJdX1WBoGJyacSorBYUhxFS2BHDv
         bTBBxh8y5FMC/WseptEierEJ2B2sYlhIkjlM1jYjpKoR5zAPXdvYhWMYpPeNKbb6v18E
         4uXbEyKr1M7xeFD5uC4BgvQR0C16cKVzb7ACA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=CXJAfDMvUXD6H1QelIo5keJ8t/x91ujsRar/3y9IXdE=;
        b=eJ4t3DenPAyqOi/Uc5X5bc0uCLx0eNMgmBAjPA7P5F2h5xURiwqeqYw4GTd1yxJESU
         ouHMtZEhfz0lJTzbYviSlNYDMb1ugO2s8P4hwI7xvZ/Ph445WMG0pEvViEJnn7nX1F8q
         94a6zsAY+r0CS645eiVwEJFab5uaW8C0xnwr0RTcX0+VFtP/P/jUADgw7a9mEo2nbZ0y
         5N8joQfwAiw/tq9tkX8pzNpMdU5m7YuTd7QyGWKhuvD5g/tGT/5Zh+NpNFzelCNN/27X
         hETbWKTf35uicD559/I1q4A/Juc7DbUDmnewIRnV0xHNpH5SD3jHz5Jy6kXdskhP9eBS
         b6bw==
X-Gm-Message-State: ALKqPwcrpaY9w7SgR+IKGxfq9TT32+w38cbpFl7yLDTXCXHHrAqgbNE3
	9olbnsCzx69LOBx399rGAOWjFHmlL47kZMEl+px4I29g
X-Google-Smtp-Source: AB8JxZpjAyj3o1x8Cyr7SYznhNwOeKIWP1TIu+iFsLliOoywH7OAPZDArUlFFnIJTm2f1Wz7FpMapPvi+kqYi0lG0/U=
X-Received: by 2002:aca:b855:: with SMTP id i82-v6mr14702697oif.12.1527007059794;
 Tue, 22 May 2018 09:37:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 09:37:19
 -0700 (PDT)
In-Reply-To: <d022028c-624d-ed88-9ba6-d0fe88d8adcf@twiddle.net>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-10-peter.maydell@linaro.org> <d022028c-624d-ed88-9ba6-d0fe88d8adcf@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 17:37:19 +0100
Message-ID: <CAFEAcA8V_8xOpGuVKSQQYUZ=GZ+a21Mom5=dq+Nj=t5nyrYJWA@mail.gmail.com>
Subject: Re: [PATCH 09/27] Make flatview_access_valid() take a MemTxAttrs argument
To: Richard Henderson <rth@twiddle.net>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 3s/2FSS4eeyC

On 22 May 2018 at 17:33, Richard Henderson <rth@twiddle.net> wrote:
> On 05/21/2018 07:03 AM, Peter Maydell wrote:
>> As part of plumbing MemTxAttrs down to the IOMMU translate method,
>> add MemTxAttrs as an argument to flatview_access_valid().
>> Its callers now all have an attrs value to hand, so we can
>> correct our earlier temporary use of MEMTXATTRS_UNSPECIFIED.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>>              /* When our callers all have attrs we'll pass them through here */
>> -            if (!memory_region_access_valid(mr, xlat, l, is_write,
>> -                                            MEMTXATTRS_UNSPECIFIED)) {
>> +            if (!memory_region_access_valid(mr, xlat, l, is_write, attrs)) {
>
> Kill the temporary comment too.

Oops, yes.

thanks
-- PMM
