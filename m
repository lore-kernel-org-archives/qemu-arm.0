Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp844020njg;
        Wed, 26 Feb 2025 03:53:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzN/oouUu8yb2HIvQFsikqeKxUvhc5D574V8QwJpYmM57mcwfwCn6gqORFvLz6elTrKwIfqwmW9mcglQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFOUhKVkpsYT51JA8UlV5rOw2x+wDLYip/fIWNUbiIJE7YAt/T9DNQ2omlp/ASHbdGOkOgP
X-Received: by 2002:a05:622a:20f:b0:472:1517:cb3d with SMTP id d75a77b69052e-473771186famr77144551cf.7.1740570822879;
        Wed, 26 Feb 2025 03:53:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740570822; cv=none;
        d=google.com; s=arc-20240605;
        b=Uibxi4QFA9J7RkoMGjzrErCvqyvKqZQnZjFmNjoq/VtzMR1Mf40h8Pag9MOPomgn7X
         FsWz/ekKzuiG8Pf++LY4wePvjgfRBkbX5yZnxrkbH+5szMixnR/dN4lwyQeTy91YslBp
         M5JDMa11YVTvukBy4+3U+s7L9LvY3ElgYPdPHoJWYm7dnaxWOCCJmBsc+/SH4PFXsmlu
         07a1BkDUwz34XaPra/SXzknF+WkjEYYvr5Ch8gVyms8zcUkYvdkl5k1xZWDmVq9kTap9
         YoYNQ0nUQllhqusv5tU45rFNpiwbCPS0WGrqVcXj3ChcSqOOpzPm90Brmx6xJGeMuBs1
         1yng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=YqPvyMOeEHsZyMMg3Pi86QbyPypugS3EcHBB4E9kGas=;
        fh=6QSQCb6V610IihTmZEE57XXb7RIdbL/8JLlR9LQ+z9M=;
        b=gymF9T9tUZTtWZthy2aeqp5C1PBrgua/BzEwkhJmAZYYOtGwE+I2+L57VHc0K2gJdh
         CG1+KTjCjBX/mMcqxMLaeJZDf5U5zTITTpcW8Vt60Ej3/G8/w1RlW5wuC/I1lYt3bPtF
         TBXzgDqB+MfCWu5EGAyK7t/AjktvEYBV6qo1WvCnrd7C/+/jkS0DORnXQtY4gnPzzUgP
         iAN5M8kTMTT6BaMA7fFoS5/FYpbdrOOZD/IVLvrtFUUJANgRm25D8vBcrqDr6JWXkHHI
         F1ZyGV64/WftG/mN2vIz40VNkcAK3tpl6aCkxNr31+Pz5yjUQtk9VxyOm7scr9OTaXIv
         iNYw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2BI3dk1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-473780a8db3si32633201cf.538.2025.02.26.03.53.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 03:53:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S2BI3dk1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnFyh-0002hB-T7; Wed, 26 Feb 2025 06:53:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnFyf-0002gF-85
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 06:53:25 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tnFyd-0005nJ-5E
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 06:53:24 -0500
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e549be93d5eso7257741276.1
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 03:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740570802; x=1741175602; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqPvyMOeEHsZyMMg3Pi86QbyPypugS3EcHBB4E9kGas=;
 b=S2BI3dk1agpo5OjK0NKPAhgNNKNgVJRC7jYMKLV5A2/qd723h1S21b+LHF8cBu1gnB
 08EFWaalj7Q6zdW416nsKD62BfRWfrZfUtRr2cfWmmaEP4DL4+a4ICqgQDZwkaEvTszg
 LygEOBmGL0YqSwJGkHrNHhx1chqX/TAb08+PR4oa7SNzwn7bc0AdQNUnzImaaiqn3eYV
 7Epfc41bEBgif2HpstIBvh7wmub1nh2HR/zeqLrjpkOTEowvdZB8KQ2fM1wKuo9AJGV8
 YXhnVKDd32dt9Wjkah6fW3V60nJheMPU2PlyjY2Ifa3OKPd9VXbvRRmLrYHtF4KZTxT1
 tl8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740570802; x=1741175602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqPvyMOeEHsZyMMg3Pi86QbyPypugS3EcHBB4E9kGas=;
 b=gVR9cxd5Kn5gZ64CQk/mis0iIB4DLjqhXWnkSL4YyQVoZ+wYSnyDTwaQjWutVv9fN0
 ej18V2TZXO47hiyxQeJZuT6h5X1UjUHQIlfEpNO5BcL72TenjtMj/334JMVD6AEWcRmc
 bLyfTU50YmK1/qY1qzHeW+iIHiZ/+ujjh/+ZPJWVd3aDSTyawAPviuohAZToG8wcytg3
 ZAhmVfJIY8qRpGubd/UOmzjHGYcrv8RSlCfRGprOqwIIjCJ4ulmZ9EyelIr2BIndZWvz
 Bf4HWspRaK8CV5DKPms18TrprrBlsK4KWExR8zUcHINqYHRSCNZ2PDqcw3hCsXDSJFK0
 Z8FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDPOZ19l2kBhTmj4LJ2BeItkihkDbiXJWOBSu889bYK4drbRAoeKl/dmUXpA4lCr4oXYuXwCgVzA==@nongnu.org
X-Gm-Message-State: AOJu0Yyh8Fa1V6ZZQkw9JXv/4rflKuII5O9bwcZjwiQTzDfU40JYxHuL
 2IsNPaGqultbSY+2pgTtaLI2UcepptZRg6d2VX27p8HaPXiJ2M5gpJlsPXSUw6xBF7tIuca0wCI
 WwnU3cewQz2W0GCAlCd3AUorf233x55DdP3wRbGfNP+LEjAcf
X-Gm-Gg: ASbGncvbzF9TEJs76M5NSHqDppKF2wBxEFiIAmXmyf7X/joui1M7CDjytE6sHvCC31K
 uaopkp0Cey3O/nhoXtHrkvHyiVbGzPADOF97voKK02Er27PNIrPjQ64IyHkmH0lN3PpQ5OTzNhj
 kvoPt3OrBs
X-Received: by 2002:a05:6902:a81:b0:e5b:1710:d3d0 with SMTP id
 3f1490d57ef6-e607a5693f4mr5117458276.43.1740570801872; Wed, 26 Feb 2025
 03:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-5-shentey@gmail.com>
 <CAFEAcA_XJfAVEe3cgHiXgcewTL3kF3SEevrnMh-Edvfk56G6sQ@mail.gmail.com>
 <CAFEAcA9e5FBrKLZrKRsw=wPThbwx3+gyVt9rv4_vx9OKfZ8qiQ@mail.gmail.com>
 <3AC73313-B9B5-423D-9E01-189E9010556C@gmail.com>
In-Reply-To: <3AC73313-B9B5-423D-9E01-189E9010556C@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2025 11:53:10 +0000
X-Gm-Features: AWEUYZkZzCodTHS8hKuXsa_I_7_0oaMVEPbahytCXcKZsaBFJBK-yr9rSvlk3uk
Message-ID: <CAFEAcA83wAdgkaFL5oOvVNuWYYFW=ffgsqKF8OcDQh49XDryNA@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: XY9fba/9KweA

On Wed, 26 Feb 2025 at 06:36, Bernhard Beschow <shentey@gmail.com> wrote:
>
>
>
> Am 25. Februar 2025 17:00:53 UTC schrieb Peter Maydell <peter.maydell@lin=
aro.org>:
> >On Tue, 25 Feb 2025 at 15:42, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >> The C compiler for the OpenSUSE CI job doesn't seem to like this:
> >> https://gitlab.com/pm215/qemu/-/jobs/9239416833
> >>
> >> ../hw/arm/fsl-imx8mp.c: In function =E2=80=98fsl_imx8mp_realize=E2=80=
=99:
> >> ../hw/arm/fsl-imx8mp.c:382:15: error: initializer element is not const=
ant
> >>              { fsl_imx8mp_memmap[FSL_IMX8MP_UART1].addr, FSL_IMX8MP_UA=
RT1_IRQ },
> >>                ^~~~~~~~~~~~~~~~~
> >> ../hw/arm/fsl-imx8mp.c:382:15: note: (near initialization for
> >> =E2=80=98serial_table[0].addr=E2=80=99)
> >> ../hw/arm/fsl-imx8mp.c:383:15: error: initializer element is not const=
ant
> >>              { fsl_imx8mp_memmap[FSL_IMX8MP_UART2].addr, FSL_IMX8MP_UA=
RT2_IRQ },
> >>                ^~~~~~~~~~~~~~~~~
> >>
> >> This is (gcc 7.5.0 "cc (SUSE Linux) 7.5.0") apparently. That's
> >> a pretty old compiler, only just within the bounds of our
> >> version requirements (which are 7.4 or better), so I'm guessing
> >> it's just not as smart about figuring out that the
> >> initializer here really is a constant value.
> >>
> >> I'll fix this up by dropping the "const" from the serial_table[]
> >> etc definitions.
> >
> >More specifically, you have to drop 'static const', leaving just 'struct=
'.
> >Minimal repro: https://godbolt.org/z/5css4hv67
>
> I haven't checked, but this might be caused by the multiplications (... *=
 KiB)

The godbolt repro case just uses plain constant values in the memmap
array, so it's not the multiplication that's at fault.

-- PMM
