Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp285910lfg;
        Thu, 11 Mar 2021 05:28:21 -0800 (PST)
X-Received: by 2002:a17:906:2dc1:: with SMTP id h1mr3142389eji.460.1615469301618;
        Thu, 11 Mar 2021 05:28:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615469301; cv=none;
        d=google.com; s=arc-20160816;
        b=YNQbagpm9YQRdO81az6WS/tZJWJjCtWkHib1P1MrRlXZMtKEQdSYV/jzf21Ba6wEw9
         ZdgDQMLzYxg3/Wnuam2PfwIqqSe3xAWEaD8R3OrqMkBGx39tGlcYAbnXnMsbrUo4lb/C
         39MkZUWhf6o0goqLt/1Pp3NddppMf0CTuXpbG1jEDcjPemugQs55fFWSajKZ+0p6uM5K
         UbnpIyjeNNGkS8zKaYfqyTp41Ha58taAwTq5VGdZDfJ/qAvQ+AOTyfiXAsR1mq5+3yI5
         NZcCrzD7z1n0Fy+HhPwZMe2fnL5kYCo97l4DPs/Bsww8zTTUpLDyNdz3+M6GLrS51DZM
         t77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PFAx6S4F8S98ohuzRiWJ92WWRqyelRiY0Zjv42L4ywg=;
        b=k7XK6m7SIV/U/wDMyJj64M9wCUxLxnJ7PTpHbqyVL1iORSfxjP+g9v7vIOW6lOroh5
         XKGqlwOngbjaw9tytxCRq4oGQZZYPVy6FYzhymz4JLS/jdoLtt84RlX6RmNFfwDGJZrS
         q9Q/FntyaqVD444HCB6jco1iPkEBGqb5FF7ig0lE6v69RVeivwJXv1qT2/c9V68IRfKW
         flZzoAHLmc0Kl1tJkLPHORvQXiBkKqwk8q7yJmYIGPdym1O6F0DyxwN39N7UK0H+qQkA
         D5MrDi7DWy2l3UuEUxlGg6hmYyfWpDj/VRKnWNsZHzeeHfeEZM4AH9UyqT1M6+uorbCj
         mP8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LZJU9KGR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bk3sor1598829ejb.88.2021.03.11.05.28.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Mar 2021 05:28:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LZJU9KGR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PFAx6S4F8S98ohuzRiWJ92WWRqyelRiY0Zjv42L4ywg=;
        b=LZJU9KGRWgTRuIuYNbAQvihVxkPaBYDdz1Y9jpyOd8Vd+gAB6n1MDFjqbT5dvg0SDR
         P6SThan9zKrjs4kYM+xYs4LxOIKZ7OKXi1LwkEd7bl8rd7HjrVwQ46rrp3AV2P3j0iBl
         6EaSRv9oeMt7/xTy1Qv9ltOxbRGFOJ67MN2Il7jN+pzbes9aObz0Q+Bs17mCg28WjCig
         HmcpWC1KyuI+Mbuabg79NpBolz+5XzDIG7gOJ5xFKqFM6h/OtdYA1ivVZr1zOZZ2i+PV
         6TXzfFFroQxpL06dIPh6TnF18Y6VatDgGXkcXTq+PY5C3HQjhBDfkVTJuYjGG96R7yUU
         dxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PFAx6S4F8S98ohuzRiWJ92WWRqyelRiY0Zjv42L4ywg=;
        b=VEZ69JkseC7eDpIMW2m2ZdZe0S5X91UhyTcqrwvgLXbmGgLEkS5JUNGwJy9L7oMbQ7
         arjBeAhJdkMg6VfToWGt/E4JxeD24pb/QU2SVzP9pHALV46jiJqLOau8/wzKTbmS1C/W
         yAoMC6rJtoXyfMPfVWRvCSWWPAa/4m1BQxH9/yMtSMa2dQQwleHOU0ohLPZLLzCTkSgM
         8CRtwpBW2U8ZhvdPZywDTplsUyWmFXFRP+eak6mhXAPxvIFWLZoeIZBUfHchZ0M4eY/r
         hGZY16tAcUCp+k7MB4ZY8S9k2YnHnV4SWlKom9SwO0JmLsbnGo2dUP/2l98+NJBzekVv
         /C7Q==
X-Gm-Message-State: AOAM532q5mX09P7QMU1HhPByjkXklMR45XU/Y8AVlUI/b03g+UskqYb8
	vPy5O5wj3pq/+itRAKxZzb9paTo8bLuyc1XV9gDQKJGV
X-Google-Smtp-Source: ABdhPJwzOF5sLJPMU7Yr682caCwCSyyQmRMj1S5Rc2xsAxdbpWzpeSOtRlBELGgLFdZe1ekSWzasPJIRg3g0f1jl7iI=
X-Received: by 2002:a17:906:b14d:: with SMTP id bt13mr3061967ejb.407.1615469301343;
 Thu, 11 Mar 2021 05:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20210309155305.11301-1-richard.henderson@linaro.org>
In-Reply-To: <20210309155305.11301-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 13:28:02 +0000
Message-ID: <CAFEAcA-pUd21VcKGfOdVAiJzeEEfYFwmmzqW4CP3Q56N6526Cg@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] target/arm: sve1 fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: PnCMooUKRP1D

On Tue, 9 Mar 2021 at 15:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Three of these have been hanging around on a queue for ages;
> the rest are new.  The WHILE and reduction bugs were found by
> RISU triggering an assertion on 384-bit (vq=3) vectors.
>



Applied to target-arm.next, thanks.

-- PMM
