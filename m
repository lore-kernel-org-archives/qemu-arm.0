Received: by 10.28.4.212 with SMTP id 203csp964341wme;
        Thu, 10 May 2018 05:41:16 -0700 (PDT)
X-Received: by 2002:aca:35c2:: with SMTP id c185-v6mr636090oia.326.1525956076343;
        Thu, 10 May 2018 05:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525956076; cv=none;
        d=google.com; s=arc-20160816;
        b=TI/EZLzRXJCGEQUthd7z1tATg/IC6IkyJeAXGL86QM9opZxoSc1sxeRpF3RrzOMbci
         GIrZyDO8SqZvle5RpkcdYY4Z1UcYNSzO3Yln5KmE3/mS61qhcJfF+JNOn+aJv0Oz06+m
         JcfkTR2Gl8zpT9bt0ICFaKFq+M5CJIhID1ko9sv0t2fVzyoz+mo8Y3TXacSys6xPbQya
         ToJDaFu/1baIDIP7Dhp23QIrSnW7kfh86KkdxwMikfhtl5McI2mo4B5K9tya9qmBp4SN
         +vXde8YUNJBW13Umt9EDhPAbe1zTjzqOZn7WuQ9pwc9nC6Wf1sjqXWRrsnLsW5TJ2jF4
         EFrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8irkllundZYv85XnFEBFjFDN5D4FCOZRCHL8RyxNptg=;
        b=vkFIZeBgmSKtz599GbY1nIBwrLg77Qoo+t7OWdxg4Smok7EUGWecBLhmCusKa1o6za
         55oLZDa6LBQUxyWf+xhcEa55yMjRggCzTJFvf9KdRUMbGHmmmJyAY335f0M1exxr4MqJ
         QKyUg9ywH82XwwRkjpluYrlHhKxRW4f0jodOi6kOKt/cq4HuqzI4htZmH1+Vs8fFiHt1
         bNtcYzTefOlQnLf6XXxW+K4yMgKg4DMOIpVN6dmu7IL/sYCAYEqzdjsAAEX0iqtCHy/A
         28bpuumTFaqQDmmtQUtYb8TaSM92CK1ORMw41JqxO9V9Z3LUOW6O4mo+NLd8tDuyK3W3
         3EAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1jzE3xt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w6-v6sor295856oib.119.2018.05.10.05.41.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 05:41:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b1jzE3xt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8irkllundZYv85XnFEBFjFDN5D4FCOZRCHL8RyxNptg=;
        b=b1jzE3xt9D1rV1fQJSOm3GKl19THHkkzvLzxc0IztVoPziitkBEL6E4UzTtBn+UDQv
         VenvyTxqo1ogCFSItT6uYFjs/O+j67Q6s6wwOg8BYSvkafcqJ/YS0+COtx2v1HlzpDaf
         GPIPrnyFNZufc2CpEgVO5qyXHnOXc16wlFvDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8irkllundZYv85XnFEBFjFDN5D4FCOZRCHL8RyxNptg=;
        b=tEAHU4D25AxYJnhhwQDlSrTQThVyvJmByjBbX/c5BYOz34jfuCBGCmw2n5F9axnjCj
         M6+fEv/fueA2MRtXb0RibZsJk9GwCW6oIg4cTgWfmXQTMrBd1mWkRkbl21ydHsTuD/i1
         TPI7axsvy8nHU2PqooQa050TGGwFAdfx5iFsCq+7GAeHsLNjD12n0wAt0b9S3v3ACKUX
         KFDQpjVjpOwsBtvlzZbYjhUVz/+Wjw/jDzQIIIXMhvpB/huldjepxZrnsHJl7J7q3Bq6
         OPpnEHGYl+EfdO7YX5HaO5tQdnu/ku5cPsnxA+V9ELv9mEmF29lO/tBuycnRAvJFXMSp
         1cRg==
X-Gm-Message-State: ALKqPweBDsOdyXtabA+VQ4VBKnYr8rdFFnQr1nMnKEvO0i0FzQdFIbCa
	MJs2NLqCxGeGWkBeSjkWEFYo5NQIc66VDJLP0NXiM1deALQ=
X-Google-Smtp-Source: AB8JxZrDTRi70QFkJtcGAkkVkYzBZ3j6w1M1GBvyvYdgPGVxT+kvjjUqDBFA+mcpUt5q1RO5EX0onPHQSXqLY/QLr9E=
X-Received: by 2002:aca:4384:: with SMTP id q126-v6mr628181oia.164.1525956075797;
 Thu, 10 May 2018 05:41:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 05:40:55
 -0700 (PDT)
In-Reply-To: <20180510094206.15354-2-alex.bennee@linaro.org>
References: <20180510094206.15354-1-alex.bennee@linaro.org> <20180510094206.15354-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 13:40:55 +0100
Message-ID: <CAFEAcA8jg2MR7hcdu2Fhb+GYKaS=2O+qv6LQGgdoGzTjwcuAmg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] fpu/softfloat: int_to_float ensure r fully initialised
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 9eksceA4yS+V

On 10 May 2018 at 10:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> Reported by Coverity (CID1390635). We ensure this for uint_to_float
> later on so we might as well mirror that.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  fpu/softfloat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
> index 70e0c40a1c..3adf6a06e4 100644
> --- a/fpu/softfloat.c
> +++ b/fpu/softfloat.c
> @@ -1517,7 +1517,7 @@ FLOAT_TO_UINT(64, 64)
>
>  static FloatParts int_to_float(int64_t a, float_status *status)
>  {
> -    FloatParts r;
> +    FloatParts r =3D {};
>      if (a =3D=3D 0) {
>          r.cls =3D float_class_zero;
>          r.sign =3D false;
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
