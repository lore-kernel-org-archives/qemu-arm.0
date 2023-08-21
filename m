Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp123942ejx;
        Mon, 21 Aug 2023 08:27:09 -0700 (PDT)
X-Received: by 2002:a05:6512:114d:b0:4fc:3756:754e with SMTP id m13-20020a056512114d00b004fc3756754emr5881351lfg.56.1692631629410;
        Mon, 21 Aug 2023 08:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692631629; cv=none;
        d=google.com; s=arc-20160816;
        b=Vrhxxz574tYxjBVJ7PbK7nnHiJa2i0fyOSKwlWZ7qcf4Pw+72hqDiMDlpQvuqTyZAU
         JGPyH0akVW/cOJj5oqKdc43cTAKTa4Q/wiIw1JZ+AU7Wf2oPe7hbCJQauQEGWVkrK7CN
         tlKIpwdz+TjPTzdXoLnSo9bleIDGSRU5sN0u8Ov8X8JSzRU7vzhmZJANKDZ1UUmgMJoM
         IszaTXEpxIy1MQtWtADmmGhMx0Q5V79xRusUmUOgKS0C3TcMWc9P/Q1k+chJap4eIK/W
         3ZMzyxojozP0pS+pCg1AS9dZBFN7/uFiFBwBDx1R8+Nnt+gDwbhCtHQ/h69/WVEhPdm+
         59aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTnMedEBTDAlKVPNoyNlz8hunvni+j6uuFc/vVCbUUE=;
        fh=wiXqbcgWDFv4CjgUg1JIK4SbOBoux1HdT3Yyh0E/c7o=;
        b=MuxCLjxOl5oWjUg5ZeU/mwuLkI4oFaXd+i+kmSGZ+KeiL6vID0wVMmFZLoqQJbTGsv
         lFK1Hle55u0MMwItv2OmHPBUG+jihrQjK+ONKFn8wJThhV9m10b2oYE3i088haQLBWsj
         UQpFfgMoMlOH76sAxEyyB4vcfZS3jChRTC2MHgaPZsGGGB+F66y25VZTOKyl1qeYfrWh
         06BFDs/inWBJnobviC5K7091tVLTc2PGP3bpTWmN5k9+3sIeFz4mY5+n1Md18SkCbr90
         wB9flGtgLMOd7bRbz3pSneK1pZGgZDE9NfUKAeaVk93M3KbP+xi4maP5RexI2aY22/M7
         t+Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HB367TOV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c18-20020a50f612000000b00525810646basor85702edn.2.2023.08.21.08.27.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Aug 2023 08:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HB367TOV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692631629; x=1693236429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTnMedEBTDAlKVPNoyNlz8hunvni+j6uuFc/vVCbUUE=;
        b=HB367TOV7BnE++yA13TxI0CYI64BRboz2tjkVHwt8f2CSknEPOdAw/t2X9iDZ0BIzs
         z+BzgDMFcG1rRE3/bVVr9L5ESnXiOkqedbiulN7qIQUQIq/wy5CbWW0VZ/7nV5Dqd16b
         G1OEy7umCo83g3+EARD5u78ZF5OlFxh0WSpLrjP9H48OB9WZ9LVhOeke7c81qbD0MwvJ
         idq/7MLF3VK3pnI7hBY+dJ4AtcITChWm1C69xCp7EleDD8A2b2SvougBw7Dd4h8yC4z0
         7KL/E7vM3GVYtjBmBPQgCt1ZyLnU5dsX6grdIwMUCdDr7H81kZBqBjBp5aaB0fg47YCT
         TuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692631629; x=1693236429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTnMedEBTDAlKVPNoyNlz8hunvni+j6uuFc/vVCbUUE=;
        b=E7bk76mI5sc/s1Kxkg0sPOVJnjZqOOQAhK9aimCctRJg5lTlf68m9vdW8oQbVqFhk9
         uRp/anmPzMliSsslQkU//uGLtjxbOqCtUq/h2agO388bFF4kx4tUdntSnNajErPWJSY8
         rjp8X2Nw4tDgn6Mgc+i7180LIBvREjQ5k4QHoPr+qhZXHtzWfrqY4IO3De0C+R+lSnan
         JkfhJHYKydYXlcmXuQirSDZ/nF1nN9Olgv+oeVY22U4KQ1WKBruYQMc+lPlRIdtWddcA
         VozrFEUpukkFzM0Z0ERQv3+A/fWIqYPK/S0C7x5+bO9kCnw27DquvsFpN4mWVbBhFHhB
         UA9Q==
X-Gm-Message-State: AOJu0YyOV4GE8mKw8lDHr5WGbhTH7VRpeEVx3s8wSeU6XM7Q7TTqHGxc
	H68cTTuk4i/ZbGKh6QW6AcdSFLwENl/CCecBxFPGLhDhZFnE+qc4aHY=
X-Google-Smtp-Source: AGHT+IFLJ+/p96/atGdjRHKacRKbUx7R9Ts+oul00lZ7lLxiyUDPdOT+43qZLU849v3cP+FponJ3DZcJtUGdOZiMpCA=
X-Received: by 2002:aa7:cb42:0:b0:522:27ea:582 with SMTP id
 w2-20020aa7cb42000000b0052227ea0582mr5222742edt.37.1692631629052; Mon, 21 Aug
 2023 08:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230222110104.3996971-1-alex.bennee@linaro.org>
In-Reply-To: <20230222110104.3996971-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Aug 2023 16:26:58 +0100
Message-ID: <CAFEAcA8YSsByEUkVK7gWM51eoLR4JZV3P_GDakc3NaLAw=QwSA@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: properly document FEAT_CRC32
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Jymcn4zjwK5W

On Wed, 22 Feb 2023 at 11:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> This is a mandatory feature for Armv8.1 architectures but we don't
> state the feature clearly in our emulation list. While checking verify
> our cortex-a76 model matches up with the current TRM by breaking out
> the long form isar into a more modern readable FIELD_DP code.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/system/arm/emulation.rst |  1 +
>  target/arm/cpu64.c            | 29 ++++++++++++++++++++++++++---
>  target/arm/cpu_tcg.c          |  2 +-
>  3 files changed, 28 insertions(+), 4 deletions(-)
>
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rs=
t
> index 2062d71261..2c4fde5eef 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -14,6 +14,7 @@ the following architecture extensions:
>  - FEAT_BBM at level 2 (Translation table break-before-make levels)
>  - FEAT_BF16 (AArch64 BFloat16 instructions)
>  - FEAT_BTI (Branch Target Identification)
> +- FEAT_CRC32 (CRC32 instruction)
>  - FEAT_CSV2 (Cache speculation variant 2)
>  - FEAT_CSV2_1p1 (Cache speculation variant 2, version 1.1)
>  - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)

Would you mind resubmitting a version of this patch that just
fixes this documentation error and doesn't also do the other
stuff that caused this patch to not get through code review?

thanks
-- PMM
