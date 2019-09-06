Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp706718wrp;
        Fri, 6 Sep 2019 06:33:52 -0700 (PDT)
X-Received: by 2002:a05:6808:685:: with SMTP id k5mr6643935oig.96.1567776832692;
        Fri, 06 Sep 2019 06:33:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567776832; cv=none;
        d=google.com; s=arc-20160816;
        b=0T/Y3kjn2a46HOTZ9XscppPwENmK50HYrwQrcWsEGYrlENwhL3OhzMUQiGi1LPDaWH
         SimOPxsqhzHqIc2z4Jax74Lb5vlAtqjKCmbqY7QpLwH2mhIOfo1ABpWqDYqli/j0bp5o
         NFxfP+c11yQz+wpRgPkE8uVyMLYnzQCrrvIF7ZQu7Ligjh5Bo6MXNtDC68i8UUFMyG7F
         peZ0aXry3uAT50iJ7Zsb5K7hP/Lq1viiBahYPhObLH7/yEClFgUIzmu3grT9G9SVFJsz
         wD9NGdSA8fF35OW13nBEDLcrZ5tVHGh+W+WdaJIssCyXoPIrRpYcK0p2wMkgekaP2gaq
         blrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NS/1UMTaDY0XCtVgUqxtS3Q4KQf/c0k8Z4z/bVFMdpY=;
        b=KSgWJEwWwvn24VdeJZ2t7YXlIKUlx+HXvWOIT9FNK7h0tn2+Mjp1PxyClS7aGdg81v
         Ve8aDjN5SbWwsfemf5F74v9O8XKqdRFQ3+ihx9w62HBC03aQm1VFuCEFy7XbGE1u3enF
         kVVOULewxJg/y5lYc4KrUWcV5JZvpNofrYF8wGhfvvXistgc3A2zHGzqNs/khxhwr4/E
         YhWwq0ZnYfqHx0Pw7TIFyYA4bZSxusVFdytm+uP/BCCRcUdnVO+y83tdWE7oHlpImyHe
         +6DnkdmBTgZ0b3KOqATkLwgek7HYFAY4UVOEJqmjcVwhx8cJJbq6KBsd2EsGmoxpJklm
         yaNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FIbqUarH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z31sor2891367otb.170.2019.09.06.06.33.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2019 06:33:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FIbqUarH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NS/1UMTaDY0XCtVgUqxtS3Q4KQf/c0k8Z4z/bVFMdpY=;
        b=FIbqUarH52LiwfX+EGgj/r+HqVEIlhJ3rFYeur1IzMmFfBOyv/II4fU2UlNq2cZPMQ
         kpvqJgSpjK54VA4NOcdjsv7akR1Unl3VrwRJar6JNjwvo8qQws7TrYkV6nSzz31kTu7A
         /NAnwKxYpFlKd1nSa/QW/FaefhCGqLwePEFwIu+huKWZCo7dsDVYIpRn5bVo6nr7QD8g
         Gljqx7iEwdyvFSQfQiNNCJNQCjaRWKXHl1bXktaiEH5mj9WI3CGksbQiBzUhUvz9Ml6h
         L/GinfpptiEtuKS2xyi70KExbX37E4lodYWnxHSmQyCiXbwHYe0ndkDZUiiIUhKR0i0v
         fGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NS/1UMTaDY0XCtVgUqxtS3Q4KQf/c0k8Z4z/bVFMdpY=;
        b=SSrLVQS9NEvuWctXadppQjygYddKUc8GrP+lyasBbROhNU/1vPiC8WdiT7J23tRUK8
         H73h/ST12qtfwG0lYO9HAUrd7yVHlqzEZvC5/6WIJ2sVx+DweOv1jV5vPIcKE+19+XwM
         7HUvAgM3RDMmLSsgbsSqbLXB4N2rh7k/WtgpEr66VPtUFeuQ2DnfuZl1+a6ucYQUWqFe
         /AKAoKx2PmpLvfW02f7wjVsrFywqo1GwYZellOZm0C+9zrVBs9DjaaTB/UjE2W5HSnHo
         ZXPTBeslgrq5pQIdK5aK6xJc7TxBkhu2K4z+tD9muKQ8Mvgaq2de4qsiRpJcDqcODZZS
         b9GQ==
X-Gm-Message-State: APjAAAWM/pdggPEHh0kwbX3ea73w1WsOXHCk6VskB0zklFAcG++d+loH
	jwEcCHSH71vMTFxAph1A6JpSKdMnaV3sWyZGG1MOJ6bdYych/Q==
X-Google-Smtp-Source: APXvYqxi8BWFEkSb61Cl0Rx76KJ8dq2sBMjbSlqz/nqd/dSpHIO7nnZNUaxeUWuNl7uClmm6q3/jPdKnTZMy64pGZWM=
X-Received: by 2002:a9d:7504:: with SMTP id r4mr6913867otk.221.1567776832049;
 Fri, 06 Sep 2019 06:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190906124706.19145-1-alex.bennee@linaro.org>
 <20190906124706.19145-3-alex.bennee@linaro.org> <CAFEAcA84VXqw+ZGP9Nv=Wy069ZU_C0WkVdv0h28GVbnzyx6w6w@mail.gmail.com>
 <87a7bhzhsn.fsf@linaro.org>
In-Reply-To: <87a7bhzhsn.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 14:33:41 +0100
Message-ID: <CAFEAcA-r9D71LoLowae8vm=sp1oojUBhppm0t97sUck4s5tp1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] target/arm: handle A-profile semihosting at
 translate time
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: gvj0QLFq9qjm

On Fri, 6 Sep 2019 at 14:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Fri, 6 Sep 2019 at 13:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
> >
> > Doesn't this accidentally enable semihosting via SVC for
> > M-profile ?
>
> We must have done that before then.

No, we didn't do it before, because we were handling it in
arm_cpu_do_interrupt(), which is A/R-profile only. The
M-profile code goes via arm_v7m_cpu_do_interrupt() which doesn't
check for semihosting when it sees an EXCP_SWI.

> Just gate it with && !arm_dc_feature(s, ARM_FEATURE_M) then?

Yes, I think that's the right fix.

thanks
-- PMM
