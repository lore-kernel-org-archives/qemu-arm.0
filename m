Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp256247eja;
        Thu, 22 Feb 2024 06:01:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXYsn3xx+R/5B9r3TCU7eM/TBZ6dNDf/kHm3k7wydvKTmlWVWFv0v5EhjNrbwNGSXcCuFwqOeX9ZvU7LbRYi+dBwr2F1JRa
X-Google-Smtp-Source: AGHT+IGIKx1I9T2TRZ1A+sgE4VxraJEKTTxvp8L0Z5k5PZPL3bspTqJGqNGdHWhlfjnc4clN0aMS
X-Received: by 2002:a05:622a:40a:b0:42c:62e0:12bb with SMTP id n10-20020a05622a040a00b0042c62e012bbmr26151168qtx.62.1708610461666;
        Thu, 22 Feb 2024 06:01:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708610461; cv=none;
        d=google.com; s=arc-20160816;
        b=cLlAACHsF4bS429h4UhKoKjCFM9E3idBzgeNesou7ZzN6wxKu32ZgI5DiGZ8TkjO1V
         h5qvIRm13UI73qNiDk9LGNSczbcP0bh8E7vlPGbQ15C44XTOQqGqP44GKq11gVF4r/2a
         seZC4xrqI8VgmdYSWYqhOaD7csyBRlHOmd8TPzUxMqwxg0EZHBHKy/A0hbv2Ad9e5OW+
         7tFG5FlSie5fyyZTmKzulnAaCKyoOEpQ4FAeGSNdw1aVjiTLE3MX9khaUtQ6Uba/gO0c
         oJciy8Yo/rNcnsYJS0VgykSuADaVu2Hu+p1F8mTePSY5zQKE2+t/7Zmy8oeEeDDAHvwD
         Dpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2hFGk6XPuUEhnSARm3LRyJ0MRKVV4i2hJYqf5akPQ78=;
        fh=AZrTj1eqH4Rm1HQeCtdliuctK3clF5Kzk0w5YB82NOQ=;
        b=kOt3knfawnAwSddie6z5ADjyhG+4us5Ra/eEz2lM2eRZ83yWo/+WKMWUTezWhYxKFr
         TDQCx0ycNVEPiUUOYkX17mn3itSWmWAc1CtBiUDsIOtljAOEMlNcRNRdqSSsDD/Ef1Kl
         /IAUBUY0AUN1VkFwjUNa5OqNUuvLJCAEzIqvWeJUZ3YV3MoMq1vtu5Yug4zgIIj+Wb1V
         qG25Q+t8oM8hUBvTOlFgdU89kUC6uBVR/9KZgZH8ryuzZZ/KLcAFdZjaIiiRZ6k22d5b
         vUO2+H8qSZxKD+vH3d2heqOphDoNqo6vBQ/982aG3LrSGu1Nx/FVnskL48GAKeykul0l
         cqLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Je6RakzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020ac85d4a000000b0042df0409734si13655440qtx.787.2024.02.22.06.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 06:01:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Je6RakzO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd9cc-00030Z-II; Thu, 22 Feb 2024 09:00:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9ca-0002zt-Ah
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 09:00:21 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rd9cS-0000ng-SW
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 09:00:20 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563f675be29so7988903a12.0
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 06:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708610411; x=1709215211; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2hFGk6XPuUEhnSARm3LRyJ0MRKVV4i2hJYqf5akPQ78=;
 b=Je6RakzOkuEGo/qrfO8iz5lqrDPZ5oo2bRecHlt6ySpoMXb1ILBXkPwb+bFBSBQduf
 e+dh7OE+mKYOjEaUyOkqBe3PJ4ErWica23VzDa5VOD3+Bin3TIhkkRK5EzBcb7LVO6Cr
 ATUZPlhV1y+fXjQYW/OWurSXH3QEsXyBVoAXfV5JVrsRgQ+fZXgUr96gAaYiimR9SrB5
 uZA8v7FjAuwYU6wRHRYGhNcCqoD6eCZYYJEXK/q/MWtcHcSjJ/+UibB2ngB9y6EyZKpS
 fZ623VfM1EnPzyEXKOdfvM2n2bPdDVYde/B7F7J4QJicQowlaWAuN9YnyO/PdGH4TlAW
 hqNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708610411; x=1709215211;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2hFGk6XPuUEhnSARm3LRyJ0MRKVV4i2hJYqf5akPQ78=;
 b=etBWb0MPQGgUiNia76AAGGVFrLvMWy4KVwaWu3CLZ7q0VorSw6DtshAeWG2iF4zluA
 f3whQua2AW20HWONkykGYHY9VozrIMv2C6zo/2vecjYNX+4a0qgsh5L0As4+3gIv5jjh
 hjJ632Co+/Kdo03d5iYVdXha9OUhPRFT+GjucM5xSYZ894PuRYGu+3PkvzujRV+c18YR
 /Ff5x6glRDTWz2YU8frPDgQADjuNeUvjUEmGLf5SxaqbG8ORaZDFXiG7LALFgaalrXdU
 85M9Q/6uEF/7LAc9svuEtanc6JfNOm3gsIikJewusnKHPcetxvxu3ZLXWIZKDnyc3GOd
 pnLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHrz/UHktAlUa5R+u9/ddIDsnhXgBHOEzgMlybkXvn9rE7Eq+6o7c9t48vMW/LQPl8/39bdnf0pOCo6LtLOvXzKVad
X-Gm-Message-State: AOJu0YxcX0WV1ptcIz4JVeNKkQ8Np3INxq9zUhEPpx/YFtDDE4Fkm953
 YgcQUEO1WXYezyAMnSv9moHYZqWvkXy8vNIv/wUMwD2zdOL1p7UkEdcajjmxUQmuwev/87JvPXx
 68lU379V7rB4r6JZOOGfpTxViwPmQOeJCjvTigg==
X-Received: by 2002:a05:6402:176b:b0:565:396b:2c1 with SMTP id
 da11-20020a056402176b00b00565396b02c1mr1229669edb.8.1708610411221; Thu, 22
 Feb 2024 06:00:11 -0800 (PST)
MIME-Version: 1.0
References: <20240215160713.80409-1-philmd@linaro.org>
In-Reply-To: <20240215160713.80409-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Feb 2024 14:00:00 +0000
Message-ID: <CAFEAcA9C4WB6NZhs-i4pw-rruE4nDP-eJ2i1Q4CQ1inHicoe7Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Cover hw/ide/ahci-allwinner.c with AllWinner
 A10 machine
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zSIrlZp6WVu9

On Thu, 15 Feb 2024 at 16:09, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> This code -- which was moved many times around -- was added in
> commit 377e214539 ("ahci: Add allwinner AHCI") and belong to the
> AllWinner machines. See also commit dca625768a ("arm: allwinner-a10:
> Add SATA").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM
