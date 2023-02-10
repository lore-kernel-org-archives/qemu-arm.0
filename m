Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1994544ejb;
        Fri, 10 Feb 2023 08:05:19 -0800 (PST)
X-Received: by 2002:a17:90a:9311:b0:22c:afd6:e597 with SMTP id p17-20020a17090a931100b0022cafd6e597mr16953771pjo.17.1676045119360;
        Fri, 10 Feb 2023 08:05:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676045119; cv=none;
        d=google.com; s=arc-20160816;
        b=JuPZgVVro1xEAB0fY8hcLDqF7nqs9z+73gnfhmPmt3DsU/BIUNnWKHP5ZOVie0/pb1
         X82X9SgxCdeYkcKrNewNhiA+sJ3And3zjVwoNO6a9KxnqBCyhFFPlG9v7idX4mmJkNBI
         HjM8FO/r0HYi27hhf5GgCw1s1YnaXZxYsdg8EetTi83+JLSqf/d+fgiiGmb+8eS0qr06
         o9f3EJ+7gH0m2AiXrRc2AxxnXRvomO/XBa9m/Tu4rP7LCUeYjINMqgmrp3yxnDhm3ZwD
         3cLcinm10gnJmtP3AfuA5jN1GbSru8FiVB41DF8qBqJ5JHN5INxGS0yakpvqcLdTXOLx
         Zi3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KDzH8gFRc6QSgS5xX+xi21bbMDDxvyItDJ2vn+X2epo=;
        b=iQB1weMjIpc+IszsvtwDPRjPAnpCaMxjTZp84SIt576npDFf1hBPWIv1Hr5LrwcozO
         oPmEh0u9unMgwy/9qg8697L33LOuDyibPmcJ05tOnz9HNgm/ag/PQmI2s/ErRvSAkFjz
         iEjB7OnC7QlWZ5WAOkdRezK8ID+ik27ku+5QpIL4wX+bnXUACQj8sqzfZ10LmKa5uxiD
         qnuEe+yBmC8BmTiDytZZv1i1frDCWxk4jVO+ZIVZyh82F6e1LafV9Gb/l2a6SXR4JY2P
         BBp68qdnMaG7DYccK6wU/0MSTQrXvHFU7gCInwh8n8YiODBwjpK7XDec6zhx0ThQpC1/
         KL3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O16kRZC8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id h7-20020a17090ac38700b00232d2c66868sor2324299pjt.12.2023.02.10.08.05.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Feb 2023 08:05:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O16kRZC8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDzH8gFRc6QSgS5xX+xi21bbMDDxvyItDJ2vn+X2epo=;
        b=O16kRZC8keuMRZLMwG6ww1TPWDKaPAjtv6Rybr+SRgCnKLFiy9nWzmBFcj/iBxOtVG
         pJLwhmtfy06Jy0KOhpO/mnjcHopViPNnEbW6NYWCIoFm3FslWsSmERX0xGJa66D1cRdJ
         Bs7k6A7hzNUuLJ13tYvPGGmYaNP/kDue2eNWJBvpoapbFHXdeNZfOuJGOWdlh+hQvot/
         qjw401uo84h9AotK1Z6POiLEaE0z4UWTRq/GLU8isKsk2TMsH7javWgExQD3pYCBMmL5
         5N7KKkkzZeyFcQn00cQTm5BvUQk7ll7wH3srSvigwVkrDzjGMftwTdlC3ZL8EasuRFPQ
         5+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDzH8gFRc6QSgS5xX+xi21bbMDDxvyItDJ2vn+X2epo=;
        b=WO6IPHx+0ZQdQp9hsCvCfKdvzN7z6oOS4lfPjiRnrduV0MDXbd/6XvgINj0UlwjtZx
         SePQC7FDtFPDV86zVDvUoFy45uAN+YQIF6K55zQuuteCJK5tWI7pyFY2eaORi8TWr1oC
         En/VZBWb2tBUlAo+5ENYbckelV/Gf6HrzJcoaU83u/sigLqOgxZXDwTB2dm75THMTCFS
         1BwygqAXg7gGPS1an+3Qe6i2+bf2NXGQ+96Ww1730A0W0QH0Y8VfdfjVCWvyMcdrnQwQ
         G4ariwu87/OLQTTc+VEHAuVtEIs3U0IQgEaG8T0+9LiX418XqMPUnppGCf5nr4I3j08J
         w1lQ==
X-Gm-Message-State: AO0yUKV/To+mH+rd5s3WUHhbWO7FFYZbtpvYIUZzAoNilfPHF8Ptw5vS
	8+vCh8kNBn+1Pnmgmkb+Q1Rgag9kJdurq7wEOrNARLVenL20LcKK
X-Google-Smtp-Source: AK7set8lW2QM55HAOLEf0zQN7fcNuUnzqTtt9EPBACdfDMUC21Uaovna5SELASAloZUPHnku+VUGeqhw9qRdiw7a6KQ=
X-Received: by 2002:a17:90a:8581:b0:231:2896:597b with SMTP id
 m1-20020a17090a858100b002312896597bmr1711487pjn.89.1676045118890; Fri, 10 Feb
 2023 08:05:18 -0800 (PST)
MIME-Version: 1.0
References: <20230203181632.2919715-1-alex.bennee@linaro.org>
In-Reply-To: <20230203181632.2919715-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:05:07 +0000
Message-ID: <CAFEAcA_NNfc5OAjM75-pOat46sZza81vXs3b22Ng_niuK8ovyw@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/avocado: retire the Aarch64 TCG tests from boot_linux.py
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: cZporq1Wb+fH

On Fri, 3 Feb 2023 at 18:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
>
>   Overall coverage rate:
>     lines......: 11.2% (59584 of 530123 lines)
>     functions..: 15.0% (7436 of 49443 functions)
>     branches...: 6.3% (19273 of 303933 branches)
>
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
>
>   Overall coverage rate:
>     lines......: 11.0% (58121 of 530123 lines)
>     functions..: 14.9% (7343 of 49443 functions)
>     branches...: 6.0% (18269 of 303933 branches)
>
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.

Applied to target-arm.next, thanks. This should significantly
improve my pullreq-assembly experience :-)

-- PMM
