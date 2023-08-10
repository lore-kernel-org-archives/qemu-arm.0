Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp805296ejc;
        Thu, 10 Aug 2023 09:44:26 -0700 (PDT)
X-Received: by 2002:a05:6512:1052:b0:4fd:f590:1ff7 with SMTP id c18-20020a056512105200b004fdf5901ff7mr3048255lfb.40.1691685866252;
        Thu, 10 Aug 2023 09:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691685866; cv=none;
        d=google.com; s=arc-20160816;
        b=OzxrdAOR3IIqSqpp5C+wxMsuapi8o7tx/sm3NVqjXyUipfPP6wedrwHxwIAiDJZj8O
         nQnlUpkD18KhxqtHzHTNiuI3jincpcTpBh7TzLkyUaRIu7Q7tJcu4HI4KbRs1yERVcfX
         HFVi1iDGyy3nkFfMvyZNCceH73Igq0dri765P8pCy8qH/yBZ1Pm98ACs5Okt897Qfhzo
         skXbizZJXB7VYq5p2f4SLN6cAvDqVVsZlNgaN/1M3bKkv0pSlrqSn3G96EAbrfePE5Qp
         9/4X+m3eZMZnEbiSSMUL5wZBmVoFc0FDy6lkplWam7URREksnHUlBWIZBG18iffnvoEC
         saJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u1PINb9Y/QoehjsjEFWDVOS1APnWFsBfKDEf7P1YdGI=;
        fh=m2Pc4+VSAKVwFT+LMWxp8cXDr+sjnbhKXJG10/TtTq0=;
        b=ZC0WQ+6+ArzP2FeEIAdyYFf1vpq2VRiALru9vba506VZprXs4FqkEIXqd9hn1tHy+C
         KQwqE3seMKiGBhQgj/f65iYjG+KMd8mGqMX5PrGkN+oj9MVav0hKyVObr13eCimlhSdg
         MsbmPEAmGdWF+Z5lSx+XdMpcl2LKKJJW0fT/P1FfHomEDmTkinl5mEjHh1Juc76sIn+g
         mwg5qiABu1P2lM7ZZ7JO4ebxPEnmLTaY0MFOOA8OJ3n1iVRusiso9R8jwRErzl3slSNA
         RqifDv1meWydw/diZ03rOjTEh6QSF41y4B+2qvcLLhqgOV6eoC+8YHrc/YwNk0WDx1Kr
         zfww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIkjvjQZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s23-20020a197717000000b004fe28f5109asor801470lfc.11.2023.08.10.09.44.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 Aug 2023 09:44:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZIkjvjQZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691685866; x=1692290666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1PINb9Y/QoehjsjEFWDVOS1APnWFsBfKDEf7P1YdGI=;
        b=ZIkjvjQZMsaulYr5eEXB53eXMei9wIxoc3CQ6BybMkcN9pD1v920lMLwC85vnqbUfQ
         4U1NH4Gr3cyAvZPLkPJKocVto0pZoFMTjHtNiRssJs42VoflBchfR2Qylvh7QWr2azU3
         snt5THF3y/jbtFgNC/4bRyxmrocDXzQP7/Xnf2lq3xVKJEvwRAGuyrI2bc+wGr0qyZUP
         5cplFlXPsl/1bpJz6+kQgLGbud3roGsb1YLa/hcdDi1jzXTiKl2cCqol9sxC+t8WidEQ
         4NRTUR1LFIM3p+AXQdwnUrDluPiuVMVmKSBLmQjlGPc8pUrc1gPK8f/sw0pU/Xsl1LF6
         eQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691685866; x=1692290666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1PINb9Y/QoehjsjEFWDVOS1APnWFsBfKDEf7P1YdGI=;
        b=ipp035Fsm+KljtupkiGIs2Jjt9sA9XcPvhzKRlKnoZFlxmU+Smd3ps3mnB8qCVBftT
         Ndfp05KJFmeSCWsV97Zx1tRrmBb52GG2scmiklbPQUffMM8I1a3w7N+0aeJvMHI1vH4c
         A5EJ+N39NzmqUWSelsxRvY0V2pNga7fkCCMQRZg576nvzr9z7gD2cfQzQL8CF+QXRLrH
         4nva+DfhhIsGmqNzDsc0Ne6UkoPVxspzayRDzTL2cnJ4KzL8AX2Ra24kPZism/hKMgVW
         tmbZ4oDjlF4Q/6a5YIXXMij20J3G0tI4tOHfSa9AO/E0j38kfZBsD/M83FJS6hOCxhAS
         zJSQ==
X-Gm-Message-State: AOJu0Yx6HYMPiDTNCV4XuI0ECmjDIEIn1GPzCggAVLQipde6exHO7d+f
	yCMdEifuVAcqHDZ7y0dOBGPjPet2CQhG5qewnEnmThyFdKWBUvXsiN0=
X-Google-Smtp-Source: AGHT+IHi25oISB2TlhH0k5GZsIc+Txmm618oIFNWTuNJLr0ZMRZQLTcqrWjzhcJ425PqL1Y9pNni3gwIRFuYl0tBDEM=
X-Received: by 2002:ac2:5936:0:b0:4fe:a2c:24b0 with SMTP id
 v22-20020ac25936000000b004fe0a2c24b0mr2124681lfi.26.1691685865721; Thu, 10
 Aug 2023 09:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230810161329.7453-1-philmd@linaro.org>
In-Reply-To: <20230810161329.7453-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Aug 2023 17:44:14 +0100
Message-ID: <CAFEAcA8o_W28cUoAtLekhpFUTTG+xEn_0uEmyWGh_xEM6j9Y=Q@mail.gmail.com>
Subject: Re: [PATCH-for-8.2] target/arm/cpu: Allow logging disabled CPU
 features at UNIMP level
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Vel7Yy7uPvEp

On Thu, 10 Aug 2023 at 17:13, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Some CPU features aren't strictly required to run guest code (such
> debugging features), so we don't model them. To prevent the guest
> to access non-existent system registers, we disable the feature bit
> in the ID registers (see commit 7d8c283e10 "target/arm: Suppress more
> TCG unimplemented features in ID registers").
>
> Since it might be useful to know when a CPU supposed to implement a
> feature has it disabled in QEMU, provide the ability to log disabled
> features at the UNIMP level:
>
>   $ qemu-system-aarch64 -M virt -d unimp -S -cpu neoverse-v1
>   QEMU 8.0.92 monitor - type 'help' for more information
>   CPU#0: Disabling unimplemented feature 'FEAT_SPE (Statistical Profiling=
 Extension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_TRF (Self-hosted Trace Ext=
ension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_TRF (Self-hosted Trace Ext=
ension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'Trace Macrocell system register=
 access' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'Trace Macrocell system register=
 access' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'Memory-mapped Trace' for neover=
se-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_AMU (Activity Monitors Ext=
ension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_AMU (Activity Monitors Ext=
ension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_MPAM (Memory Partitioning =
and Monitoring Extension)' for neoverse-v1
>   CPU#0: Disabling unimplemented feature 'FEAT_NV (Nested Virtualization)=
' for neoverse-v1
>   (qemu) q
>
>   $ qemu-system-aarch64 -M xlnx-zcu102 -trace arm_disable\* -S -d unimp -=
monitor stdio -cpu cortex-a76
>   QEMU 8.0.92 monitor - type 'help' for more information
>   CPU#0: Disabling unimplemented feature 'Memory-mapped Trace' for cortex=
-a53
>   CPU#1: Disabling unimplemented feature 'Memory-mapped Trace' for cortex=
-a53
>   CPU#2: Disabling unimplemented feature 'Memory-mapped Trace' for cortex=
-a53
>   CPU#3: Disabling unimplemented feature 'Memory-mapped Trace' for cortex=
-a53
>   (qemu) q

Generally the 'unimp' logging is "the guest tried to use some
feature we don't implement". Here we log about the fact we
don't implement the feature, even if the guest never tries
to use the feature at all...

thanks
-- PMM
