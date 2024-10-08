Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp229268njl;
        Tue, 8 Oct 2024 07:24:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVH0pF7/Z8InxaqLKrkgN3ATQF13eDha/cO7IHxtlVMIbiKqw9vkducfLnAnJtWzXfe2cMfJevRyp23Pg==@linaro.org
X-Received: by 2002:a05:6402:3210:b0:5c7:927:6a5e with SMTP id 4fb4d7f45d1cf-5c8d2e36dfamr12728888a12.21.1728397467545;
        Tue, 08 Oct 2024 07:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728397467; cv=none;
        d=google.com; s=arc-20240605;
        b=DqAVZsAnjDqrE5tePei4McV0pqnX3H4nU/2kTX927yI8PW/c79qTtJNyWzSdRiE56h
         MhxzsIMK8TiRmKsWiEvYOY6/I/ZiC/AzrROfsEX8ez0nwYtJ+w9UJKxsDBd+/PyOr/yT
         h0JHTewl+ldZbLir5jnIVPqMseZlgeuX1r6TRidMqb8ipmC2oL5Swgs2vsNtRRFAF1jq
         6brUyNHMLuN5UGpuYBrxDX3mlK84GLrtT1wFMWIS776O23Uh3iIFvOMnvFDvjNWlpvG7
         kdWm/SU2mACa4myn/ozUG+i1eq/GOQ+m905XOblP3z0lc1SUUosQ+PuZzUBFlTyisQ5C
         sjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z4aiC/7up85pu8OiJPObcHH8gZqfcYf+jIO69S39Gcc=;
        fh=PUcdvYKSEpD4asIPBKvZjusESqlTdVShtZww+ML4bUg=;
        b=HcBDvJjedlOvoKTa7g60m8orDBw8T8fazWatAJ7oh7nWYpgj6jwh4dHqTBvygJXQff
         s5E7Ahq8npCmPLyl4s/w/XhCa8d+uY/o4Jwwt6kIIC0FWwC7WR9b8W0QgyUY/XJSQNEh
         ZNVfeqoRrGLF4MrTw5wfedaE/EP6EP4NQtaW8FVMpv94/HNjhCkMum0HV4gsLjtiXT7B
         b3p5SqB1KHl3++gTxLOsM/ayGKkiirHLZpE9TEcpjxLsoXEw9r8npgIWO1PZJqdUZMax
         NNmJR+BcR59/7hMu3wYjeB5Bc22WhDQBQ5mTZ/nS1uLAEtQTfuLkXvHyIhNCA6tcZdop
         xzUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzUcU0bu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c8e05a2f6csor2031389a12.4.2024.10.08.07.24.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JzUcU0bu;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728397467; x=1729002267; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4aiC/7up85pu8OiJPObcHH8gZqfcYf+jIO69S39Gcc=;
        b=JzUcU0buLRE/PgMf3CY1DIBwbImQ7HoVqnuBr3PQgEmmamye5Y/+mJ13XuKb7zrPhE
         j8ZSlPQy32/gsSMyHR+83ESJe9tu8L8066SOlKSd40qcv9WOfDj3Lbeb9ITnfOVnoTYZ
         UoEll/iLWc2Fn8YZRGnZo5vO0lErptht2dyHYhLUFCZiThI/s1Kf1iycJUnlAdje4jX+
         pLTxEThYrCASj/W7JI0NQUXVFOMaslt1lMm9lA7G1YLoBXglB7itSI98yt7rKyIxOgqq
         M+EVwtUVIzdBTLF/gKStzT7EgmeBqC7mmR3UnlyZpQo5jxfndW7F/w7D3RG1wPFNtggR
         wa1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728397467; x=1729002267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4aiC/7up85pu8OiJPObcHH8gZqfcYf+jIO69S39Gcc=;
        b=vTneY/x63pOZUxxpR8M/k3IAJBRnAwOAE5KLuoJspj4FKZEMB5r3ymnupaFroYKzAX
         NXukB6LiyEnLtjaAp1FTIpwsiiNxNzURY/E9jKbp12+V2CJdmRJCfqnP3KJ8sOvsto+t
         /DpljyWXJ0BqV9WqtMZseIBxi5WyVquVrejqv/1GpObR8fBSWIrC4T1lnVmlmJiPli4q
         hoYbiOmUuepHgC/Pf1prNvw43s3OJj37ZbjMypaL42dT4XbwMRL+Hn9rLFWOI8RiHD9O
         bqXqNUXmHlEf5nrKNQ1I/7ZUDfs78/q6qQgLPU0qmT1jvBRkZdHjfaoEtGn4k1Rh2/dK
         txeA==
X-Forwarded-Encrypted: i=1; AJvYcCWk5+7UKwGD5tsJ8iBq95sNa4rF92se/rDQefI1xFGNFcgptgcnY6L0LCSji8buzXCCBYSWSALoinTqug==@linaro.org
X-Gm-Message-State: AOJu0Yxm0A3/lg2PFJxTYq2zaKChY/F/8uYYL1UZScXqd20nnRBp3D+H
	YTS3d1cnswBAsnA45NUXifiK1m6afDoHRA9g0AQbbwO+Di+nn5TPZ5PUEdRgNBIWoI/h8k6KNAe
	/c3Y5hTm2NueVvrNA+nipe6Txi87Ocnog6fth0387
X-Google-Smtp-Source: AGHT+IFjmaXftKW+6p8dHDnPmSfWnXvCGIMLOzreTCd39rQv0liiKgCkuBl94L1p1zuof0Lcc7z7N+hK0iYL5rshMJc=
X-Received: by 2002:a05:6402:4286:b0:5c0:c10c:7c1d with SMTP id
 4fb4d7f45d1cf-5c8d2e71be8mr13160085a12.23.1728397466890; Tue, 08 Oct 2024
 07:24:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-19-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:24:15 +0100
Message-ID: <CAFEAcA_F5V43XofxAOUCdnHfU5_xArJucqvWczJqi8eqgKREoQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/21] target/arm: Pass MemOp to get_phys_addr_lpae
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: dXZHhkq5Ekrv

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the value through from get_phys_addr_nogpc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
