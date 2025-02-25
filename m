Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp354485njg;
        Tue, 25 Feb 2025 09:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhfUaFV5WRU3k25n6uTSqIN0sk1BBGAX3u8L0fRiGHPM4Db9LdKcxHvACDV+g7OwAikNdz/hxtVdVvsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHFj0V+1+jSX1NoO+ibu72XIHG2RLYxhRaK+qQzOxs+1pbpmJxisniUqAD4frzuZndAr+W7
X-Received: by 2002:a05:620a:370f:b0:7c0:7d64:6da7 with SMTP id af79cd13be357-7c247f25843mr18030285a.21.1740503007071;
        Tue, 25 Feb 2025 09:03:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740503007; cv=none;
        d=google.com; s=arc-20240605;
        b=AcfS3eHunJc9HMxDMtnIefe1D77Uh8BhueVVH0VEODnK1ohUz1OHHxi0ym1grzzuMj
         pK6pVnWnRTNYewlGjzIRIFlRPeaXbk/qFkG9TCoOf7wJ516d3E2m6IzzOI17F0eV17/A
         7mqVu1FA0kUwVwEcVQL7sDxUFnJJR9vX13Buycvs36AAimauZBLEJx7B9FVNXMYXYhUN
         F0NxAl+QOyazjQC8cjz2LmtIOEdki60zZ6lj+f8/jMNBRiQdzlS9ITtRiDXw3M8C6oYH
         pbH4M6N1MhOpf1ehTK5agGcmR6e6iaKSk78JOEDvRAAjUqXyrAjoMS5+J3+wOrdB0Bir
         BGqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=M4dFCZW/85o9V/rsJaCHCE4r6BgNo9NPVq5fNOazp5M=;
        fh=BgZ+YmgkzyQD9qdMO9BAWth90N+vOVelqLXD30McF2E=;
        b=DUS4RvlVzkznfTKE3VbclV7HVOVa7SfvnLW2ACS+CZJ8IFAJD9tB5CCOMD7b3j7Yu6
         CphMKvyRSi+cRiHMWyk0cl3iSVcnAxQkAiSUKDO6hBT9QXgvWKXnHfuSPdSxXgOHYwo2
         H3P4sdR6f8j6/yv4KTIKq8VwgvikuMBzxYFL5BzNbWcH/sOjgFu6X1tvHvdOGwCppRNL
         tOuH0VhtlCiInMuJBEnEaoAUyHl+5MwCqBo/LztQBk8GZlcY9CtHgAeGNCv2v8W069it
         x7iaIS4ThhBYcIpHV3MG44qVK95AmPeQ7iZR8rMlVY0tBpeJq0BPhOkXbBO1xVKFatcZ
         zRsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Whhrkh0i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c2da709si219336585a.432.2025.02.25.09.03.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 09:03:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Whhrkh0i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmyJW-0000aV-GF; Tue, 25 Feb 2025 12:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmyIw-0000BZ-PG
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 12:01:17 -0500
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmyIt-0001kc-3q
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 12:01:10 -0500
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-e573136107bso4924290276.3
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 09:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740502865; x=1741107665; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4dFCZW/85o9V/rsJaCHCE4r6BgNo9NPVq5fNOazp5M=;
 b=Whhrkh0iQc5IbFbG4QL8k3X04h5ga58ns8LR0kHB01ZH2lGSGLje9bTVlxSV30IxQ4
 vOGT9AvAPH6euErFMYgtKg49Ui0px27rcyX3kRicAoennnO+FufqLrV569JiqIXQehTR
 HbfN4p9jdIRuYrKBT1YwCN/KstVbEGcT/4p5KO63qJowI7E+7CG4oD8zK+DUjpmLGLQ+
 gKRem35XWM/74+8PC2HAh1AJgTASd5lmLFl6Tbr9IvZ1QB40C0BgcsGQ8UPaEZP1BS/C
 VElnvMpeVpOGN8EN6hXCCTStNP16RmozD381hWlEoZ32KqTzXy87NSnoEqQETHtqdyaL
 VQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740502865; x=1741107665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4dFCZW/85o9V/rsJaCHCE4r6BgNo9NPVq5fNOazp5M=;
 b=YZPOha8NpK7d+WbHEXF2W6XQ72/W/n8Y+aMAG0MjxBSaiFqEBrOlAPwv/VtMCKJtWt
 EcFx0mZIDl3ZCEJ0HX/QlDWhrcbavd2Xl6P4dk8KKn71VYjrU3M5gRUPxlkWq59l0n7t
 mcJYI2nhDAwP/OzKOl/HiExMSYU2aOGHDCZyvcm1NjJsCDdjeGbtWlYBL5DNuFK7xW2u
 fkhpjBaPDb8KnlGcaGc2QnxihpsZ5EgrZUHEVKhn05IIp8IwyYG+JavEaiJa+bQuck8o
 luZo7JE4TCP54vzMh+9aFkrgXritRgVH/IpJirCb0nlbZp7VgZu6+IqzryTCb1rSk8kX
 jhhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Gmf+VYhPzQe2YsL6KuN2Btf+hhIOP+YSNk79PUe3Ju4Yvt95Shb40lr8sNY9nz2ESBOOZHAPUg==@nongnu.org
X-Gm-Message-State: AOJu0YwzbFsDGvdEbTtHCIf9rCZMSiSgeWHPPskQt54pfHX8cI1WfCF3
 S3hnyDyWaOtXcpar9eo3A+xuKolEZyvwm1ai1camI9zU1AvFRENRgU/bS8ER0IAu2TH1QAicVSV
 eCMN6uvkaw1y53BFvQ4A2ZFtreH31P2C2xChQ9Q==
X-Gm-Gg: ASbGnctXrcEI+p9QfctknWecm0l5XJ/3xj3w+7WffmblTQaixPBOJU+RtDdXUtMkJje
 k7dWpjAZzTyRet3Xm+1bukw6XJPxz8pSvVkFAxY8B/Npow8A6R7TqJt6DZLm5WCnnb6+7mdGoNy
 RibIy5WZFo
X-Received: by 2002:a05:6902:2484:b0:e5d:c5f3:13e1 with SMTP id
 3f1490d57ef6-e608a808b2fmr174338276.35.1740502864897; Tue, 25 Feb 2025
 09:01:04 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-5-shentey@gmail.com>
 <CAFEAcA_XJfAVEe3cgHiXgcewTL3kF3SEevrnMh-Edvfk56G6sQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_XJfAVEe3cgHiXgcewTL3kF3SEevrnMh-Edvfk56G6sQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 17:00:53 +0000
X-Gm-Features: AWEUYZmeg4enO--jZ7xJfwSMhYUOdjuW8NkTogc9tup8QtGuBS-XNQ-uQG3NQFE
Message-ID: <CAFEAcA9e5FBrKLZrKRsw=wPThbwx3+gyVt9rv4_vx9OKfZ8qiQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] hw/arm: Add i.MX 8M Plus EVK board
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jPxB/Be0LwBm

On Tue, 25 Feb 2025 at 15:42, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
> The C compiler for the OpenSUSE CI job doesn't seem to like this:
> https://gitlab.com/pm215/qemu/-/jobs/9239416833
>
> ../hw/arm/fsl-imx8mp.c: In function =E2=80=98fsl_imx8mp_realize=E2=80=99:
> ../hw/arm/fsl-imx8mp.c:382:15: error: initializer element is not constant
>              { fsl_imx8mp_memmap[FSL_IMX8MP_UART1].addr, FSL_IMX8MP_UART1=
_IRQ },
>                ^~~~~~~~~~~~~~~~~
> ../hw/arm/fsl-imx8mp.c:382:15: note: (near initialization for
> =E2=80=98serial_table[0].addr=E2=80=99)
> ../hw/arm/fsl-imx8mp.c:383:15: error: initializer element is not constant
>              { fsl_imx8mp_memmap[FSL_IMX8MP_UART2].addr, FSL_IMX8MP_UART2=
_IRQ },
>                ^~~~~~~~~~~~~~~~~
>
> This is (gcc 7.5.0 "cc (SUSE Linux) 7.5.0") apparently. That's
> a pretty old compiler, only just within the bounds of our
> version requirements (which are 7.4 or better), so I'm guessing
> it's just not as smart about figuring out that the
> initializer here really is a constant value.
>
> I'll fix this up by dropping the "const" from the serial_table[]
> etc definitions.

More specifically, you have to drop 'static const', leaving just 'struct'.
Minimal repro: https://godbolt.org/z/5css4hv67

-- PMM
