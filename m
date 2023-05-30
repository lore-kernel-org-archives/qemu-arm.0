Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2317072ejb;
        Tue, 30 May 2023 10:02:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ngwviqJiNbwkc53IU/NW5vGbge/UYM722qxazPsF3zstsOX+mW83CjQ4cknQRT3fRaOqz
X-Received: by 2002:a05:6830:2019:b0:6af:70b9:9672 with SMTP id e25-20020a056830201900b006af70b99672mr1501546otp.6.1685466171810;
        Tue, 30 May 2023 10:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685466171; cv=none;
        d=google.com; s=arc-20160816;
        b=JbpaX8YPKre7A/qWneC30ITs8vZA2DF+TGtYAZxjl3q/UJztXy6B2FLJd6XEmrXslA
         hf/vp08G/+DddP6A9WLtjnX4/pdj+vjkJ1PV2Qzn74NjsRjIDkX5G8w2yK6ICTdg1iMx
         l0B8HVFSwmUR/Lqx1stTpipZZ9l0d6oT+MZh8mA+YcQCIV3aYGFlvEUKg7sjW1nOL3iG
         Y4Ks+vvY/fTMdVJU7UGFTAX2/qRv8Nabzzmzgf92WDSapuAcMzG8tirKGhP2OCzBUo68
         TMK5kfFgNYmQJV7DQq76VNa0iNI3sBBRACfAzUB1yLVe144J0nCnSC0LSZ2mA+8MRnT0
         m7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bZixs7nkFVC8ORerRLmRoiL6KtRrGjYzvtjjGE4ZH0E=;
        b=az9yjImJHF9hg5R/UUy5K8Nwj7abbRxoEvTthoDkZDjP4L8+mzI2r59W/b2uFx8xF6
         IscLL9l56nwPGnxd66NHD5vOBR8EEQNMRy62aIbf3prAtun2mztsks7kCMEIm+o1jOyr
         HhLK7xO4e4yKl8lCW0Q7RTkozPJRpZ1AmMEN3LdvTdxJiEJ1CPlZNlNMxhRA0vD0jfNf
         0F5bw9YsjyC41dlZH6TxNQpNxDNnoED+ywTid/ai9poaT9IJc5+P415mX82j0Bv3HbRa
         IjMcjuDsURlsfBhseHnHIc8T9TJYhF/6qWWp7Uz8zSvrgrYo2luWQ+Z3IXCheKaS7q2O
         dxuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MMoJVDWM;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id cy19-20020a056830699300b006a442aafdd3si7487710otb.100.2023.05.30.10.02.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 May 2023 10:02:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=MMoJVDWM;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 77B0060DDD;
	Tue, 30 May 2023 17:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03E9C4339B;
	Tue, 30 May 2023 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685466170;
	bh=bZixs7nkFVC8ORerRLmRoiL6KtRrGjYzvtjjGE4ZH0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MMoJVDWMjFoDHhVqgzj5lQBTF+bwW3UpchbmOwQcb9PT9fjXNE1CMQUBAHImhe4n9
	 GPgJPNZEpyiw1yaEgEHy5L6gClYuIO8ODBHDyAZQrElv3JExRswFV7F4v4l7F8h6S3
	 H5eLhzCp4HL59b+jzcyI/XexyTIXRZSAtQDSPmGtyzrFuw632NN5Qu3Hc12llsPJTl
	 agfU9c7bTXuDKFcbG7yutgqGqpirN4sDRrZzkJJtcy80bXzRWIJ54gRmn3SDZFefGK
	 +FrUy591JmRzZdZ4Up5bmUHcae4y7sl4y8ToRJWQGWdgtkf/cm3shRWk+kLrUR1de6
	 kgOmAb8dSpyLg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f4f89f71b8so3328689e87.3;
        Tue, 30 May 2023 10:02:50 -0700 (PDT)
X-Gm-Message-State: AC+VfDxOp7ZEWcE2vNARFp8KnvRYl4gIs0RDGOeH+tMwjfBzMtJyaJn+
	OYDku4yHve3GVNx2pa7FZ3v5wwOnBi9RJJ9OBBg=
X-Received: by 2002:a2e:9f0d:0:b0:2ac:7889:3aa3 with SMTP id
 u13-20020a2e9f0d000000b002ac78893aa3mr1253687ljk.18.1685466168935; Tue, 30
 May 2023 10:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230530135204.2903761-1-ardb@kernel.org> <CAFEAcA-RwXQWx4RhMhWk_xQLsJ0a1+MDKDXyKHdCmguqsuNKzQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-RwXQWx4RhMhWk_xQLsJ0a1+MDKDXyKHdCmguqsuNKzQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 30 May 2023 19:02:37 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFMnsAnXcUgnZjncwa8h0eHeJfR2F1dxMn=-sHrErQr-Q@mail.gmail.com>
Message-ID: <CAMj1kXFMnsAnXcUgnZjncwa8h0eHeJfR2F1dxMn=-sHrErQr-Q@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: use x86 intrinsics to implement AES instructions
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: T2URdDCXJEYZ

On Tue, 30 May 2023 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 30 May 2023 at 14:52, Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > ARM intrinsics for AES deviate from the x86 ones in the way they cover
> > the different stages of each round, and so mapping one to the other is
> > not entirely straight-forward. However, with a bit of care, we can still
> > use the x86 ones to emulate the ARM ones, which makes them constant time
> > (which is an important property in crypto) and substantially more
> > efficient.
>
> Do you have examples of workloads and speedups obtained,
> by the way?
>

I don't have any actual numbers to share, unfortunately.

I implemented this when i was experimenting with TPM based measured
boot and disk encryption in the guest. I'd say that running an OS
under emulation that uses disk encryption would be the most relevant
use case here.

Accelerated AES is typically at least an order of magnitude faster
than a table based C implementation, and does not stress the D-cache
as much (the tables involved are not tiny).
