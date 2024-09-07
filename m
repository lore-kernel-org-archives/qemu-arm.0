Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp361704njb;
        Sat, 7 Sep 2024 03:38:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjli/7fvgJTYpFS3CDWCAB7gTFc4NggGsmaURqU4xnnwkXqSIeRrJYuZHkN7qYq6gz8GskHEne4QsG5Q==@linaro.org
X-Received: by 2002:a05:6000:cca:b0:374:c7f8:3d50 with SMTP id ffacd0b85a97d-37892466d41mr1508810f8f.58.1725705498475;
        Sat, 07 Sep 2024 03:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725705498; cv=none;
        d=google.com; s=arc-20160816;
        b=pZ6VmDBOcrkJaqiD1DSDDU30GCvDBeNl34V/qo/eoz8af9S//hABk+cj+raA5S8+3d
         NS38BC7c98ou2nReiGBGDH+cxT7ClW12Kqh09B0ijPuS06fT4vZNobBk9b4OMojpig6V
         DYq+DilbxL5KbIOLZwmbOSNUPmV/I0qZunTR+1+hfKnY65crtmreacWUq0169wDihmmh
         IxRQ4u8Jma/boZuwuOHpzSHeW37Yac6Q6qt87LIkyNb7VrwmgNsZ5FsB6icxLS9HVHoN
         B/M90eVFQ+v7y6ELBgvKkLDO0z1eJVhR1RXMNSQxpTXuFiRbQzt+sqg5H44JOh76OUPh
         ohJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IUtn1iZf+4tPsiWmBa8HqfPqfMkyZN6GIF9GSONOtWs=;
        fh=DGQ76czryiU4lvPRj/fqMwqmYre9hPUcJUnDgIXJ9U8=;
        b=fFRGjkNIGn2s6Br/8uS5oh3fGM+M5/OlCh4xgGRE+GA6n6+XcC0Sk+2iFJ+zp2WbB6
         Wagnx1elwn6JwRLBII006nROb5PMwXgU0IAgyiY7wuzkUPVz49EcmjvjVREE76nQQr9O
         5mgesbTa1sQuqOgMcw2P4vcxmwCpBcr9JCoxqzFslY1gqwRiQbLeURhAwc319EE4Z26R
         0aiAW6lDMjPqfNFPTiLNGz0BcXlzC4TP5kepCvriG28mC2jLeysHpHAigyxgv3VQiyqx
         LGcfsm7tc1IcJCSi0g7TWVqXxbPmg1lrmWAueNKlm0FGR8Lrok52IeOrNHTuHD+LFDyK
         6bxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cueVEudp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25860518sor12221266b.2.2024.09.07.03.38.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 07 Sep 2024 03:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cueVEudp;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725705498; x=1726310298; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUtn1iZf+4tPsiWmBa8HqfPqfMkyZN6GIF9GSONOtWs=;
        b=cueVEudpAlFFj1p8IipiDr3dcMTw+iDcPtgX6pGMJ9mx9rBNaXXoRe89+IoHE0pdp0
         19azMkLcX7eISwRolq7TFC8LkEJYLcz95Cqe7D/QC/Fpv+GtNXqvO2WmAX5SO3XtACNx
         VaB5tYi38bn3RDItCcutvbcD2eIUvTLT4LmP6LQ7r2QlBmaQmKmN/N1q/Luu9ygym5B9
         9AaSIb4XQPJ8CXSSKL/mCecNwJeVChkx+1un0blXNeoXHfrPQCuZuYJs6Z5uRBMgjbPj
         inyrut13Moc+z73Y7XILmzJo1oxJdnNfhAPefjqEuSflDxMqNgbiy9lX39g56CUR3H7a
         bhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725705498; x=1726310298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IUtn1iZf+4tPsiWmBa8HqfPqfMkyZN6GIF9GSONOtWs=;
        b=StcFNFvV/c+MzNeDB9N4TsV8Dcs48rOjKzgS422Xj5aFC+6eGvFHOEprKFkd+DcxVM
         65rklUnP+FcWXIPbp6tzhCaBsxD1i1YWj4o+of+1KYrhuQtXg8pspIhOGdcylZk730z0
         Jwb+h0WyrtvE9YmbzAK6Msa4ZooJ6NvxBjKVIVoHDOQtpfsg+0Q6tfgwYjtN9vrFSwPV
         a6fl/trW+yuzgFafa8fDukxu8QnizYx56QrbNLc5DlbeG3EGyDW6L9wFfn5SpOmOM9v9
         wQQfVDXDr6OUh+aXFf4yKYHtz1/+H7a6bfqJwQvNcWXnPG/w5nSTfi8GCv+ZBuTyXPVs
         1lCg==
X-Forwarded-Encrypted: i=1; AJvYcCXb6ZmUMPHCJgk6G4vDqgvjgV8seVA9Wg7QKXlvlBjjeG80zwBvkLYLtMIUGbmuu3cD94oco/d2iwUBiA==@linaro.org
X-Gm-Message-State: AOJu0YwbtrhRzD8F/IeuGJ32CPL8D31PP1t9zMyU7GPbDj/GOp25eXzv
	Y6qlI1J3bLHoDIELcQMcC92ZRspnGMueGDSKaKBGACqlkTtEe+candBs/gAAA4MLohycA99mJF+
	x/wws5qy3ba20bQMSlAnKJ6gRiVA7uFKczCPjnC+q
X-Google-Smtp-Source: AGHT+IFLEdkix1grotQ6GupBYAZveOlR00mvpnnBV5VJyv7YZmpUMsbOYvQFAgIG/Jne5YlnoXbQibDGABN2adEZJs8=
X-Received: by 2002:a05:6402:5405:b0:5c3:c296:1bc9 with SMTP id
 4fb4d7f45d1cf-5c3dc7c03d3mr3934864a12.29.1725705497756; Sat, 07 Sep 2024
 03:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240719181041.49545-1-philmd@linaro.org> <4bc83012-3b9c-4b99-8b6b-65f041652540@linaro.org>
In-Reply-To: <4bc83012-3b9c-4b99-8b6b-65f041652540@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Sep 2024 11:38:06 +0100
Message-ID: <CAFEAcA-x_avaFQcrWQj=-e8-5_C4NeWUNxgRqLqKbrJ2HpK4pA@mail.gmail.com>
Subject: Re: [PATCH v5 00/16] hw/char/pl011: Implement TX (async) FIFO to
 avoid blocking the main loop
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Tong Ho <tong.ho@amd.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: HRrefRqxKxTM

On Sat, 7 Sept 2024 at 06:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Hi Peter,
>
> On 19/7/24 20:10, Philippe Mathieu-Daud=C3=A9 wrote:
>
> > Philippe Mathieu-Daud=C3=A9 (16):
>
> >    hw/char/pl011: Remove unused 'readbuff' field
> >    hw/char/pl011: Move pl011_put_fifo() earlier
> >    hw/char/pl011: Move pl011_loopback_enabled|tx() around
> >    hw/char/pl011: Split RX/TX path of pl011_reset_fifo()
> >    hw/char/pl011: Extract pl011_write_txdata() from pl011_write()
> >    hw/char/pl011: Extract pl011_read_rxdata() from pl011_read()
> >    hw/char/pl011: Warn when using disabled transmitter
>
> >    hw/char/pl011: Rename RX FIFO methods
>
>
> If you don't mind I'll queue the reviewed 2-8 & 11 to ease my workflow,
> before respining the next version.

Sure, that's fine. I don't have anything pl011 related in
my queue that would conflict.

-- PMM
