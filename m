Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4845936lfm;
        Tue, 14 Apr 2020 03:52:52 -0700 (PDT)
X-Received: by 2002:a05:6830:1f39:: with SMTP id e25mr18413952oth.135.1586861572473;
        Tue, 14 Apr 2020 03:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586861572; cv=none;
        d=google.com; s=arc-20160816;
        b=OL0ioqP6QvbRKjwNx+mk4XfTtThGsI/8Cl+zUI9uZr9cL0ZgCveBB5Adza9QeeCgb1
         MxhY94PmNj50p3eWZAJuK0F56rQ0A9OOpEHIPvQEPaNiXLHmlcxg2DCM/PIbL731qqb4
         ogsGNumt/icgw4BWYnyR3WDeMBymgIGp5j4q+ayPp4Zve+wQ/5h7TgaZrumsUZt3nPX0
         0F6rRFw1GwY1Sr+Q7FGqETnRWxhGqdt9gmfBUP5hOmFZDcRJBtNaukshKCqEh4GToQxZ
         dZGX5TDt2tiiCIMCab+gh9r4yEqm6VhsqYxR1JbNU1CRAPLHt+mTkoTcRODCjocvY45C
         gV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lDt9VI9Dnd04fVhIefsdFc1sEOdwVd9reAGSIgzTGFs=;
        b=VPbt/BSG9uAIUbVgH/dVSpaZYK5fuzJGcPN2N/OVpOJjuag/dJcwPVw0STy4xgD1Lj
         ULlZMJ6US07YLMyACmA/YA4IqJ2rUgvJEewyFDqQL5/euy/0SyPonGBciYBs/rSJexkg
         TZmBCUHsBr9v5sZJKFnBAfNTgIKdjtCClsB7qzPhK8O7DbILiX2Nyq5F1eUmMOLj+dpa
         5nINP7D7ATjpSH4ArfFNEcJ67NKq7LGLpzC1TJ355JyWVpx62v+Qx2HXnc7778ufp9bo
         fXoYpZlG+EN6LdLagnLOYKnlkyL/1OHB1ZKMaCVJSu7SdYnbrl3K3Frf1MGH3icpXH/S
         zs3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rjF9iL7N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w3sor5403617otl.33.2020.04.14.03.52.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 14 Apr 2020 03:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rjF9iL7N;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lDt9VI9Dnd04fVhIefsdFc1sEOdwVd9reAGSIgzTGFs=;
        b=rjF9iL7NYcf7se7p5xDSvfP6y5HKpv6lyjwfcEbb7laurEHMI6FdgcfeGc9AIKqj20
         DWE03Ra6JxIANn0IPKdiQ4xan8oWl1ODZ7FzEl5Fp8oNQj8XCkDtANIVFzLETyKFSM/b
         GP81RFy4/4rDAh3ZFq7i8hOVgGzRVeAn6aJENZEMHo55ZDZvGnpyx4pT1JnTEBifagHB
         YhVITsGjk4bVuu24nAWHVytA8rmj0tYIc53m4XisS9MoVrdnaIUgOeDjrTP2GyACFsPs
         XvoAuiAbcy2XJBfOOGqN0de5T/2LZL44EnN6q34Az+v9PnbuhlIBkbbRb8ZBdkrqOqfg
         8LBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lDt9VI9Dnd04fVhIefsdFc1sEOdwVd9reAGSIgzTGFs=;
        b=fn1lLsh8nZsufk+9ODG3eX4T+rT+f8l1mqiU6cpYuwXE4TCaiJrppMDPKU5aGD6wuL
         8V4nW37HP4QEDb2JH3nS+SY2i72VupAKvM2e+eiky4ndLUeJM6w8VELyTlMnURcOvdke
         uhy/J5BjGHf24AwGBtmSYL6c9V1LluuulzKQrc9XZ7uB2DLmkxKOf960BhShqAmYtXvh
         loZAaiCnHC2nrW8wSLAl6ORWfuYKHdRxZdIo4gng9z8jLMliQBZu7+E7pvUoQoIiMZii
         TzwobOt8Iu1XfeoEAr/SjNeJFDyypggtqyuUQsFp3QI5x/rejBfWWa63hL++oNBRj+mO
         wwkA==
X-Gm-Message-State: AGi0PuaDI8X+b4tay9wBXVneQMPiK39iZiEuD1784RTlshefWFKspmMx
	BK+ypq9Qq4Sq2M5BGkU7mongd60dyulB0Zj8zI5hqfVX
X-Google-Smtp-Source: APiQypLXe4Ajktdf9jjEoNIdi5D/8XbfVH/mGE4UnxTVzH2tQuVnxda/cJvv+dOxubXnsS1GL35pGfRbAo8Vxn2Qwpc=
X-Received: by 2002:a05:6830:1f39:: with SMTP id e25mr18413934oth.135.1586861572085;
 Tue, 14 Apr 2020 03:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200414102427.7459-1-philmd@redhat.com>
In-Reply-To: <20200414102427.7459-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Apr 2020 11:52:41 +0100
Message-ID: <CAFEAcA-PyMisjC25CSGyU5-ASjaAd7gQMabzMCR=uvudSBk-Fw@mail.gmail.com>
Subject: Re: [PATCH-for-5.0] gdbstub: Do not use memset() on GByteArray
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GFSpAS950vca

On Tue, 14 Apr 2020 at 11:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Introduce gdb_get_zeroes() to fill a GByteArray with zeroes.
>
> Fixes: a010bdbe719 ("extend GByteArray to read register helpers")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/exec/gdbstub.h  | 9 +++++++++
>  target/arm/gdbstub.c    | 3 +--
>  target/xtensa/gdbstub.c | 6 ++----
>  3 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 30b909ebd2..b52d9933ee 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -125,6 +125,15 @@ static inline int gdb_get_reg128(GByteArray *buf, ui=
nt64_t val_hi,
>      return 16;
>  }
>
> +static inline int gdb_get_zeroes(GByteArray *array, size_t len)
> +{
> +    for (size_t i =3D 0; i < len; i++) {
> +        gdb_get_reg8(array, '\0');
> +    }
> +
> +    return len;
> +}

The other implementation option here would be

     guint oldlen =3D array->len;
     g_byte_array_set_size(array, oldlen + len);
     memset(array->data + oldlen, 0, len);

For length values < 16 my guess is the perf difference is
not going to be noticeable though.

thanks
-- PMM
