Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1319105lfq;
        Thu, 8 Oct 2020 06:03:45 -0700 (PDT)
X-Received: by 2002:a0c:fe49:: with SMTP id u9mr7909821qvs.40.1602162225125;
        Thu, 08 Oct 2020 06:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602162225; cv=none;
        d=google.com; s=arc-20160816;
        b=JPHqZdenl5WEJHa63mXkUyccfS6UpvfmDoxPjFOe2JpaurzgxUUh48fd4ac3a61Fsy
         Np3b73q+xgE3XfYtzekS5GCu/7rGnIxIxNpZQGeXo/+jIeWigOa+gzcNsnK8G0NbzZEs
         KFCnkcy4Xr/Nwf+qg8fmTv793vb5Tecd1FpGcACrumFZJDnzSbl+sgihFWGotRv54W9d
         UaJagj9FnBWoputAx6zmgi4RuiKORTJ5/3LKMmjze1Ey0jvbkEohPQX5wnlwfmYOWj12
         c6h81mgakJVTRqkxTe9CYzBoa0L2/wG++f6jKjvBY/rJedlZbiq10Dzitc9oUKMcZVd4
         1LbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8VE0OJTYu/kfj7Ku7R4xwIwNrgngP0Ve9pQKoTkgoL8=;
        b=AUzTz6vRQk0oMim7whw7nQfITRI0gxozvrDvYbRWbo4ZfGhsG6e0yq4ZnpeVPscpDP
         ywRaHq0ngRwpG+QuG683hBC60kW+7XkQPK2n1brO5wXRW/U1HRu3HvvnZ/cTvPh2LwIE
         6oaj0AzamaU6b+KHllEAB61isoq8ddFwXLosr3PBn4JOrcG3dxzACB0SzNFrXWa03h1V
         AYzOLTT1om2VE+odIAgRL4Jkd1fT3HwhE7hEzgHy5x+1ClDBt2vIGGF/QleGuW0V0G4U
         zR+eii1cPToMMmKHjGTdDseSyJ9Bs9lK+sOS3TcastcG4PLoHhdtaT5IT8FwLAFht/p2
         pHfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQjHHCBH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e64sor5535181qtd.22.2020.10.08.06.03.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Oct 2020 06:03:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CQjHHCBH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8VE0OJTYu/kfj7Ku7R4xwIwNrgngP0Ve9pQKoTkgoL8=;
        b=CQjHHCBHyuj/ChjPmkA1qIR0nkaWlqwScCKE06dQzJOMNsL0kgCvsZ0eKOL4A8zTJr
         TxP5YAvxDmAb+MAA5nfyCNknRbBfp0l+8sqF/y1V2094gHLxZObF+wW5y+df+x6TB82e
         YBfOm2UHugq5Z9dInbxS5W2AkRZ9vC3Jo1KBii369e2lUrkw1i4olX4XvE3vo1JNw1w3
         lkfg0IKrydYQHD6wlKq+olJfJVtUSz/rFc43LEeXECEhJ59xeHADQ0CcYou2hb7ziyxJ
         OEWP0TjOBK9aLtp5//ipFvyYuerkdYAQDRVxVyOnetUzzRk3PeFF6iVS6CS2tzYOt5DK
         JESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8VE0OJTYu/kfj7Ku7R4xwIwNrgngP0Ve9pQKoTkgoL8=;
        b=dHKdmW9nqY89pZ/M4UJMJXramNEf2sn8SxqFKbWLPiAbyRDH52TdSem9h3IdG/HC5P
         c74sa96Du5FrXbYpdjlVe34KnDXFktitl6St3w4wKT/AVfEwb9dgV31+kRwgIYh4k7PS
         Wu9unzP1sFNf4wpcByOshrw8TWkcOCmoya17W5u+pgAeNStlPlEZ7k+CPpvXnFGWFb+m
         sKNKU0AWljo0OW3sUJv0KH+mhIe0Msp55WB/NztmSWCGaaZLuM9TX430MGOyuRqB8gFP
         iZ9r0lmR1oemx/bbZk/WMsYF1i3PqMnDKFea3lj0S3VJ1caLbB53721gswJS3Ydoe5Fb
         wMUw==
X-Gm-Message-State: AOAM532SvCkZVLlLNCY8P/4vc+LuQpOHAfGEEgXKIPdWLlF7kIVYisk7
	ORNsNeSUrdVHqIFmsP5JNOoBshXgpfo+MniECBCuB+k0
X-Google-Smtp-Source: ABdhPJz9QFa0Hdal5/YdDCfwYTYHhcnJTmUJch8jr1LKSi/PVsi/1GL5EaEUAZhWlMjyqzllgAyjcn2uqNUmAMeQ6ws=
X-Received: by 2002:a17:906:1f42:: with SMTP id d2mr8524433ejk.407.1602162224590;
 Thu, 08 Oct 2020 06:03:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201002215955.254866-1-richard.henderson@linaro.org> <20201002215955.254866-5-richard.henderson@linaro.org>
In-Reply-To: <20201002215955.254866-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 14:03:32 +0100
Message-ID: <CAFEAcA-y_PtciTq0+GQAL6cAKhJvdV+PZU1y5T5rZa8hX+S5Qg@mail.gmail.com>
Subject: Re: [PATCH v10 4/8] linux-user/elfload: Fix coding style in load_elf_image
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-TUID: HmVh1zw/+wyw

On Fri, 2 Oct 2020 at 23:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Fixing this now will clarify following patches.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/elfload.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
