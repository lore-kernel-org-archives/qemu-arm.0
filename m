Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp3106243ejh;
        Tue, 6 Sep 2022 10:54:04 -0700 (PDT)
X-Received: by 2002:a1f:d8c4:0:b0:375:8854:6d3c with SMTP id p187-20020a1fd8c4000000b0037588546d3cmr15781989vkg.34.1662486844620;
        Tue, 06 Sep 2022 10:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662486844; cv=none;
        d=google.com; s=arc-20160816;
        b=EaCEoyQEebNsYyXsfqPeL4RzP+aRtnk6FrC4qNn2FNG9pdgu+vn1uv2hhhRXK+90jy
         aozhm+fn67NLVN2HASo513BJ/bYj2f6Y+xsbQ9lq/8jWbiN7Hei1Dba4yFBn3CwTPwhv
         XPFk1SR39jB1Mx8jleXGKFV9b5atM6vWqroFZFdNA+DILONSOpaa5VafAmTs4mce2rpI
         02dm6c+MTobbD80pAjMydNgkvDNL7WcaDPBRsWmMSuHZD8OEUX8Y8Clj6Q5x0gHlZjWy
         9hbGmsS4E8HFH/GYW171AArHiCdleA3xnGzL+MGUnhw3RQ4h6LoQ54Z9DHBUdIcwQ0fq
         znRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=u55wOhmagVzyMeGKyU5rGsL8UbtxXQtu4xUjFY0YLtU=;
        b=z0uQ8JYDAJXwGKdTc/0rwGfLL7SYxb7OElTGFRLfuTDfjgq2JqfCHybz3rd4KPm/pf
         aAeb4Y23eMmcc5ZuB9dS2oP2wxIvSW81XIKSgR6sVRoPJYCb+hFP2KLK5AkkeyVBmJFX
         /34aldh2vfsIhSwRyeaESwWuOBNW4z99+MHnL7+tNimu/5aW8q9fxiNZTo9OS5Tq1GC7
         nhF1qML52Fk2G/NasCh5d9jjN7oGbvDWy00Dcxd9R1j5sszO+iU3mKl5AS9CwZLU8usA
         oh7kCtZVwB4oGg99RKOqAH4eXto5XM98mkN4afqHMqPnkBxeMpeCAiriQ0i4uBQoGDMX
         gz8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i33-20020a0561023d2100b0038811cdd9easor3179728vsv.1.2022.09.06.10.54.04
        (Google Transport Security);
        Tue, 06 Sep 2022 10:54:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u55wOhmagVzyMeGKyU5rGsL8UbtxXQtu4xUjFY0YLtU=;
        b=gwgqapVcEAAoQm3YHRSrCj8feyWD3BsHISxP00WCiXqB5H/jB0hl6QpndK4isGOMue
         G9GcwvIAzI660lDqm+15jLQND+FHCiPRU/cUlA0BkN7W21k7eT6MygiVLhEZI/rpG2D9
         4ofNPL9TLlA6gpPGRQY3wFpLsQVeCGK5upasiBH2Gi3lHfTk3vm/Uu/atA/UjEIBtI0i
         4Vw72lUms+EkYfM1FgfhLRqsMqVRah6gGi1DAdFrpVJd/JkNIjY4QQJlC1nfRwIFNYFe
         nqlaYZiPHRl5faQm85J63ZQ3cXjm/F3dq0xdRID+Z7gusCfyL/apWaNykf/gHK32tX8E
         izYw==
X-Gm-Message-State: ACgBeo0ZQ02R102ufumOOtbr3PCWgRft9JEJePToPSmZKG4PLfUiy358
	i3uHyowCswYONC8uoHodJWBsTL5q+V+hBsoR+g6Fqk3zfB0=
X-Google-Smtp-Source: AA6agR4rq3aiLa1GpvJpD4K/pOLyrdhlA1pZhHmGqZDem7UdVCdXUZvlq4CNOTUlwjkkAIGkoo+0IUek7lrGi+vE95o=
X-Received: by 2002:a67:e083:0:b0:391:df54:ed3c with SMTP id
 f3-20020a67e083000000b00391df54ed3cmr12523360vsl.45.1662486843833; Tue, 06
 Sep 2022 10:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220906172257.2776521-1-alex.bennee@linaro.org>
In-Reply-To: <20220906172257.2776521-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 6 Sep 2022 19:53:52 +0200
Message-ID: <CAAdtpL5Agv1N4rvOBuibaLrBUcM_m6DbC8nVhy=bx9Yy=McbDQ@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: update the cortex-a15 MIDR to latest rev
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Arnd Bergmann <arnd@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: BvxnsWn4J/51

On Tue, Sep 6, 2022 at 7:23 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> QEMU doesn't model micro-architectural details which includes most
> chip errata. The ARM_ERRATA_798181 work around in the Linux
> kernel (see erratum_a15_798181_init) currently detects QEMU's
> cortex-a15 as broken and triggers additional expensive TLB flushes as
> a result.
>
> Change the MIDR to report what the latest silicon would (r4p0) as well
> as setting the IMPDEF revidr bit to indicate these flushes are not
> needed. This cuts about 5s from my Debian kernel boot with the latest
> 6.0rc1 kernel (29s->24s).
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Arnd Bergmann <arnd@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  target/arm/cpu_tcg.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
