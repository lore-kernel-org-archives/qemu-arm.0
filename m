Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4921398ejc;
        Thu, 12 Jan 2023 08:45:25 -0800 (PST)
X-Received: by 2002:a62:58c1:0:b0:573:f869:2115 with SMTP id m184-20020a6258c1000000b00573f8692115mr73385113pfb.9.1673541925065;
        Thu, 12 Jan 2023 08:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673541925; cv=none;
        d=google.com; s=arc-20160816;
        b=WuU5EuPk0UMJs547LbDR0j3G1n4IvPPAfPBBZh3UNhXrz1W8dzmKSLo51nBsBJqgia
         C7msKNUeRV+z4UJWfjxROPjLal56gq5pumTDY7Pa60oY/MP0gE2dBAbpOHGM7hPoa3Nu
         +DewpaDVGW0KDhp2k13j3YcNhQwOGDkMk57GQnai8dfzsc6mhJCmJlXWH+J9TBYkYkVa
         OHgkvuPXw7SI/X95TZnmyRAs/TgkMhvJe0nwkv7A05XO0WISYUbfARca71YEbD0qW3VL
         48QRhLCQE5oQDqrms2iNfiQDZOhhsW2blyWq2oSeU5T2tGibF+Q0oIsywXErv1jehPHG
         UKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IX4jc6ICPyfSVLMTYVAaxQVG+cqEexbaNzKWqxc4deU=;
        b=IuLVn5uiNv4ekD0I3jJcEan2XS4yJw/5q6khaXKQjrmydeCUtSxZiMaDK7IoDiwqAF
         pPAZoV5YTwiKuyNJKXRR+WotsRdMM4vE7u4WyCBPzi33g1McB1LYxJgSeaSa5NJ6ThS2
         cVwh+1TodVdNodP80wmkezwQIxLF0bUDkt6GRRFZjjCLOOAEV224/s14NhcsP8rv79xM
         jQGn4LrQoXe7eXX6Erga7v4W2l/bT8qo9lTBkkkf0Yuo5dZH1Y56SD2r2bOQBGFcSAcT
         u7rYkggiu58V9VhMKiTWhdQVX11gT/t4N82Eb45Yusa9fgeApXxsn0Sn5TVixUxb2ooD
         NoPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpInqOOM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o1-20020a655bc1000000b0046b0e17658bsor9193963pgr.26.2023.01.12.08.45.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jan 2023 08:45:25 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GpInqOOM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IX4jc6ICPyfSVLMTYVAaxQVG+cqEexbaNzKWqxc4deU=;
        b=GpInqOOMRM5xZV53gtVGd83aH+taIlvRFg+vgT04hxwRNzjzU8IFJj7L9SwtpNTC97
         Eh9gGdcJ+E4tssHdv0XuKNncm57EIpN7cA0HuMXb/+hwdkL75UhEsFJhsJfmwQWMKgUT
         E07T3DHnXqI/iwyRtJGCtnOYUgfwhI1ZETVPmyTEAgQRcMdd4jjiM4WpthhNBl/YcCgp
         SWvM/XntFFNvCqG+Lgnasaos7jFSJhPlJ8IVmuV3G7RkkBbWxQGcsgohupKcStItLO7o
         g3bF0Se5OP+xjskAfPHYxSBVMMuojxtgXw8vP9muo/IsqolDRkaQP9FTlqM7SXx1QkME
         DELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IX4jc6ICPyfSVLMTYVAaxQVG+cqEexbaNzKWqxc4deU=;
        b=O0GjETiB9HWVq4qkovexrSIVkfmnTLNjMTz/L+Z3t+qD9q+Mqj4ybUGqjC4i3kEy/s
         pr06MyFZmbf9MTOSTtqPGsqXOZiX0JxlvslLpJHNz7ZnV+o5dGfVWU4bTi+0RbcmIx81
         CKKdyGEj0OYMhkjcqb7K/whbo9MPA8Y/OIlmgTkTxt7sAavJZItf1NCiwAz3IzFCEh9+
         4oNn+wVzpw1DX5xTb0Dk1CsFkAvUL0uVbtCmgb23uIKsiDu8KE9IziHHrNMQ73TJ6IyI
         y3Jgmo44KD5n/j31pwHJ24wgpFNUTQb75KKNgNzp+g9whulYvdECQL9us/s58UY5RvaN
         jTQg==
X-Gm-Message-State: AFqh2kpaIUX1VtqsUjLRj1i7jHTqjVqZZm9CSEyhZd4ZDVZJiAXcHMAl
	p3M5Jd8BZfb/P70QKrUVjCSuUZxLr6lOZaBEKgC5ldA4sqENfsJV
X-Google-Smtp-Source: AMrXdXvudL23d/l+c6aAhRPuSAmXDztgBwgOQnFkejiFpH8isGHVBRJji0ZXkafnvWILWGrj7HEj1LZPeMhR+lxOcHM=
X-Received: by 2002:a63:9d47:0:b0:4af:9f91:54d1 with SMTP id
 i68-20020a639d47000000b004af9f9154d1mr1211727pgd.192.1673541924653; Thu, 12
 Jan 2023 08:45:24 -0800 (PST)
MIME-Version: 1.0
References: <20230109170323.3796306-1-alex.bennee@linaro.org>
In-Reply-To: <20230109170323.3796306-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2023 16:45:13 +0000
Message-ID: <CAFEAcA8aBNcw7crRHXR2Cj2qHp-DsX+tqLLAzRAmS0hcUGMXxw@mail.gmail.com>
Subject: Re: [RFC PATCH] docs: add a proper feature overview in "About QEMU"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jagannathan Raman <jag.raman@oracle.com>, 
	John G Johnson <john.g.johnson@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: VjEAdUgYPlUc

On Mon, 9 Jan 2023 at 17:04, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> I decide to do this because I was looking for the best place to add a
> reference to a document on semihosting and there didn't seem to be
> an obvious place to do this. To do this I took the original pre-amble
> to the about index and moved it to its own section, expanding the
> description and giving a quick high level overview of some of the key
> feature of QEMU.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

To summarise from our conversation on IRC:

(1) I like the current short summary and orientation that we
have at the top of https://www.qemu.org/docs/master/about/index.html
and would prefer not to delete it. We can add hyperlinks to cue
the user that they can go look at the top level sections
for system emulation etc for more detail.

(2) I think most of this text would be better at the start
of docs/system/index.rst and/or in a new subsection at the top
of docs/system (which would be more easily findable from
the top level if we added those hyperlinks).

(3) I don't think we should be mentioning TCI this prominently.

thanks
-- PMM
