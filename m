Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1855990ejy;
        Tue, 20 Sep 2022 08:18:39 -0700 (PDT)
X-Received: by 2002:a17:907:a408:b0:780:3d91:9232 with SMTP id sg8-20020a170907a40800b007803d919232mr16978924ejc.506.1663687119742;
        Tue, 20 Sep 2022 08:18:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663687119; cv=none;
        d=google.com; s=arc-20160816;
        b=gE26wcPWgd2CkFPAKbJedQo5b6dhVcMYjwxXb/n3sIaFRh/hDeOqvr2U+XqWD8CXib
         Uu4PbeNORMO4MGEeW6rtgYGPF6k2GOBMUDPgEwvy0fVZFko7wC8f5nGi6zKrpvs6f8fM
         KzrMNPrUo05LMnpR/p7vWLekpIQvBqS4qkRLCUTjfn/cUy2rou2tEg0KKyNEEvNlbAW3
         daTYL1pN9/tDMlEYJzFSGMvW0/C+6Fr6qBKbrY/R/aUkOavf/GM5ZgprkCNi2mcllce1
         veMMuiVWmWvDdPLyWR2EaNScUiLes8ookzarRFevNWlBL0ZcdIAlMYqepkNmguxVAb1A
         KilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sfXm8JPqyolFGBsbKPlGJveB/0mVA6tcrYHTaZ5B/Qk=;
        b=YtTDujh9DHqMO14VUF+UWz0RHGZQY6WLPNeaxoyxPYAG5pIs1y+3GEUHcpCYql5pBY
         r9lAqmkiXxk9OhJW1+R2ebEYpuB5TDJMfWq6F78Bh7aFDlCP7KrUxfiiqJcojKvwcToq
         GJvASj+EmcMmWz7pggj5vxL/pBh/Z9dN09etENI4lp/vmDODhrV3OYQSHZmcUPqQsCl1
         q0EVJbf0a9yPWNy3Na5ryYLmuPcF31XmGJ2p63BoJpYhrlErpMfUB9kbvYrd9dyXyL7K
         qdDdzhhsRmeNdfDrGbEk8dKVIuxUCqXpblnDMJ/Ir5BHmlcbBwNMNf6vYIn9pMAj4rv4
         xEIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vq1i8uS5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g20-20020a1709064e5400b0073dbab55edasor933700ejw.111.2022.09.20.08.18.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 08:18:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vq1i8uS5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=sfXm8JPqyolFGBsbKPlGJveB/0mVA6tcrYHTaZ5B/Qk=;
        b=Vq1i8uS52Iujs7UyxVyvomxBmKfHoAPu2tCYiW0L6YkzpZjxj0uzF2VgiS6ze/5AqA
         a22gUyKTsWDSXsod5yhWQoq8h4o5FUM5tDWBLSJMNNHs8wMlfb41NoIk8HtQ7iOFMrcc
         0dGKsl7YUHx0GJvj0hyr68q+Cseu07CirO/NyoQ0zjZZYvrIA1h4cgp36hJ2abM6k2Hy
         0qJDU53ZE3rScJZ9l4bMAiB8GMumarbLjtqLstMYFHRFMLZd27o6/ZiLg9mK0dOsnIBa
         BNKQLEaipAmpJYgZQocyejULN1+blgtAmn/311Svn30127jMFHt+gsf8sptf0YmkPTJQ
         7v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=sfXm8JPqyolFGBsbKPlGJveB/0mVA6tcrYHTaZ5B/Qk=;
        b=Ucnm/LyjflMX2HjT2HUHOjMVdfBeKj7rDt5LwEdiz/4ov7plrYNZ2+StigAwDE2nIw
         aAeU1UxzoUFHnQLyY+D3FKyxuHCsy9uUeycV62e6Z7pnwJKIghEvKFBAuiuB2xtmr3gv
         3GKOe8UdIxaF4ZKvpEJDvUeoYCJndwafb+z8s4yA9UbWFHwdu0M8rZ7fRyiz5k4+mIe7
         W6OFo92gTQisIjnD6OWZcStYV94ErwA4gDomqLA6DCdEudd9p1ZOR9tLcER8ZaUnyeCs
         8uHISJBdiZD59BUV5VG7ujDoSqFTC5UweHDPX9apj8iNNoIiydc3iX068XC0Fvve5ek5
         40lQ==
X-Gm-Message-State: ACrzQf3WMtgTfPM1xAE9+Evu9kFDQFeO6N6pyHYFUlDL2BoQfg70WXkk
	i88tnCkPLZT8hwE/0L0rqg1Qdyel2C4HJqSUWXmb55Hq
X-Google-Smtp-Source: AMsMyM7oP4bVI1p1n2Y7jTaixeHJYDFW07V+cmejbapOoWtDVyr485TtK7tzkQ6dkRjIPVn8sbY+y3ONPc2ZIxq3hL4=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr16682900ejb.609.1663687119564; Tue, 20
 Sep 2022 08:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-21-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 16:18:27 +0100
Message-ID: <CAFEAcA-z1XY0uKmz_R-+exRwkNH4UWCTENpJkEJJC_Otvw4Umw@mail.gmail.com>
Subject: Re: [PATCH v2 20/66] target/arm: Add is_secure parameter to get_phys_addr_pmsav5
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qcBXduWuIhU3

On Mon, 22 Aug 2022 at 17:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove the use of regime_is_secure from get_phys_addr_pmsav5.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
