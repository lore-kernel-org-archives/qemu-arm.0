Received: by 10.28.71.27 with SMTP id u27csp901209wma;
        Fri, 23 Feb 2018 10:17:47 -0800 (PST)
X-Received: by 2002:a17:902:461:: with SMTP id 88-v6mr2506386ple.88.1519409867128;
        Fri, 23 Feb 2018 10:17:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519409867; cv=none;
        d=google.com; s=arc-20160816;
        b=i+dW9uIXXtZsSTwMQx0vQeMZzwA8dD1K2ZqX2pAyBCdkb2kBcb9027qLJS+KQj1Sh+
         DEy7hkkQQ5ItE5LDCiVbdaXDo6JYppkr6Pmy/jujiaujOJHP+jgVSnzZW8Xk8OpwLj98
         2NnJQZdoQ4oird6ARO+8zbOQ6QG+iBhd/tPD/3i0XwwlOaUH2GzUJWwnAlc7E70NgiBL
         /F8exHkJlQxGz8xTB8sVmugRTLUgemxkmrGBT/+KmHdvS8cOXl9U7UiRXe12ppUVGHUF
         qoQLQ5ALibSBzmLJXBsivE8hxPOHf1DalrjXAXBHzX0FbnmZdDmU0VAnqDrNmA1fnY3P
         AmAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZsRv7FiUlRFZxXZpH/w6DBKmolC1uAoz7d2xS89DhfM=;
        b=q493bp83n7YLpErx8n7FuMLL2dyn1aKzQ5euJ9aisVUhAdhZbqtqA2vanLU6zWPrbu
         EV0sHJYEH0RbCHhfpEZsxYjcQedJfwVF0HrWpWh/x4WiNtp1+idUVCmpOnxQgjww0CBL
         QfHMA/AfM2c8OcwTYgaQ59KEUGTkMlFWFxrgpOjBlyQNPajfdN3pDwj7l68/tTTetoGJ
         +AbACr/25jo3uKtYxB9yVHg9jN6ydmcMBgbc5JEmPuLQUADci0D/W6gai1osF8lG+JhN
         vi0CqRP9sJdZUAcdhpZOQHgtx/7r9oBI0UGKzcmB61uJn8V+c/muoY/vn2uwkJWzsUxw
         CEDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIw7YTBS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x4-v6sor989340plw.142.2018.02.23.10.17.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 23 Feb 2018 10:17:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CIw7YTBS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZsRv7FiUlRFZxXZpH/w6DBKmolC1uAoz7d2xS89DhfM=;
        b=CIw7YTBS1tbLu0FcALqY14YnzRjifHbpcwnZwip55x3i5vIhEGGG6jEBdE+4lLkhof
         BW6fW3KubEHsn65sXqpTujL60O4wvq235Tu6Kh26pQmbt73GPuJPijDqe5c7XlGKJaEP
         Jyj7WROUOwuH9HUmsLHf/ZTkxaAbQgEVAWQvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZsRv7FiUlRFZxXZpH/w6DBKmolC1uAoz7d2xS89DhfM=;
        b=TXcROAN4jbjjOlFrcO2NdanTLttL8XFZNAlxHjLvvlQjeMseoFFxYMPLe9POVEqtAO
         5dLGmyM3gJ3oCtcFtxeTLcEnElTK0isaVi+nhr5JzIay+lhn8FMioUY/4okzIpQ5f9Gu
         zcEP8rbh1VssFw2PsG8o354PrmT7h1cue0GeinClJ3ZL5f7HcAahojXRZ8Tl+odMt1zX
         eiVdpBnKfshjdbno3ZWfbtg+yb0uODxkslLmGoXQcdkWG5fwJD0pm5gorgVrfzQHOt23
         MmSoqIh609HuDpd8rGNZJS7WrWwZ2kMpd3OtPHDZ8AJ8UgazPfJ5+IQlQJFLMJEbcPOT
         WmoA==
X-Gm-Message-State: APf1xPCaHFqgN3Ee2YloqVjqHiE4l+veqqNJXAvGG3ZnTpgxhJ1UUQYw
	Qzjq1+cs8GJxUDYQcihOXUMw24t98lhfhzyHvp2LjV5Hn8A=
X-Google-Smtp-Source: AH8x227rvavTfi7jBEzFgXBY11pHqthkAl6ytSv7pzW4Zkjg9VGVQ6fZ0a6Dpfn3Uubxug+hLtq+MTF8wVoUtx0rtt0=
X-Received: by 2002:a17:902:8b85:: with SMTP id ay5-v6mr2546846plb.329.1519409866561;
 Fri, 23 Feb 2018 10:17:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 10:17:26 -0800 (PST)
In-Reply-To: <20180223154613.2096-4-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org> <20180223154613.2096-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 18:17:26 +0000
Message-ID: <CAFEAcA-2OMtdNNbj-R_e-2vJ8vhLfiC5Uj8vFyjqFwVSn72k8g@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] aarch64.risu: add cryptographic extensions for v8.2
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jilUghDtBkxt

On 23 February 2018 at 15:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  aarch64.risu | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/aarch64.risu b/aarch64.risu
> index 838bded..06a9f3c 100644
> --- a/aarch64.risu
> +++ b/aarch64.risu
> @@ -2937,3 +2937,35 @@ FCVTZUsi_RES A64_V sf:1 0011110 1 type:1 1 11 001 =
000000 rn:5 rd:5
>  # End of:
>  # Data processing - SIMD and floating point
>  # Data processing - Scalar Floating-Point and Advanced SIMD
> +
> +# These are optional ARMv8.2 cryptographic extensions
> +@v8.2,Cryptographic,CryptographicSHA
> +
> +# Cryptographic three-register SHA 512
> +# 31       21 20  16 15 14 13 12 11    10 9  5 4  0
> +# 11001110011   Rm    1  O  0 0   opcode   Rn   Rd
> +
> +SHA512H   A64_V 1100 1110 011 rm:5 1 0 00 00 rn:5 rd:5
> +SHA512H2  A64_V 1100 1110 011 rm:5 1 0 00 01 rn:5 rd:5
> +SHA512SUI A64_V 1100 1110 011 rm:5 1 0 00 10 rn:5 rd:5

"SHA512SU1"

> +RAX1      A64_V 1100 1110 011 rm:5 1 0 00 11 rn:5 rd:5
> +SM3PARTW1 A64_V 1100 1110 011 rm:5 1 1 00 00 rn:5 rd:5
> +SM3PARTW2 A64_V 1100 1110 011 rm:5 1 1 00 01 rn:5 rd:5
> +SM4       A64_V 1100 1110 011 rm:5 1 1 00 10 rn:5 rd:5

"SM4EKEY"

I also had a pattern for the unallocated encoding:
# unallocated encoding: O=3D1 opcode=3D11
SHA512_RES A64_C82 11001110011 rm:5 1 1 00 11 rn:5 rd:5

> +
> +# Cryptographic four-register
> +# 31       23 22 21 20  16 15 14  10 9  5 4  0
> +# 1100 1110 0  Op0    Rm    0   Ra    Rn   Rd
> +
> +EOR3      A64_V 1110 1110 0 00 rm:5 0 ra:5 rn:5 rd:5
> +BCAX      A64_V 1110 1110 0 01 rm:5 0 ra:5 rn:5 rd:5
> +SM3SS1    A64_V 1110 1110 0 10 rm:5 0 ra:5 rn:5 rd:5

and another unallocated pattern:
# unallocated: op0=3D11
C4REG_RES A64_C82 110011100 11 rm:5 0 ra:5 rn:5 rd:5

> +# Cryptographic two-register SHA 512
> +# 31                    12 11  10 9  5 4  0
> +# 1100 1110 1100 0000 1000   op    Rn   Rd
> +
> +SHA512SU0 A64_V 1100 1110 1100 0000 1000 00 rn:5 rd:5
> +SM4E      A64_V 1100 1110 1100 0000 1000 01 rn:5 rd:5

and again:
# unallocated: opcode =3D 1x
C2REG_RES A64_C82 1100 1110 1100 0000 1000 1 x:1 rn:5 rd:5

and I think you're missing these two lots of insns:

# Cryptographic three-register, imm2
SM3TT1A A64_C82 11001110010 rm:5 10 imm:2 00 rn:5 rd:5
SM3TT1B A64_C82 11001110010 rm:5 10 imm:2 01 rn:5 rd:5
SM3TT2A A64_C82 11001110010 rm:5 10 imm:2 10 rn:5 rd:5
SM3TT2B A64_C82 11001110010 rm:5 10 imm:2 11 rn:5 rd:5

# XAR
XAR A64_C82 1100 1110 100 rm:5 imm:6 rn:5 rd:5

thanks
-- PMM
