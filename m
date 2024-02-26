Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2176479ejf;
        Mon, 26 Feb 2024 08:54:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV63aWy23ewArbV/AqKO3Sj5TsFlrPmGh9pxGXTkvuHlHaKdM/ynrC6URg5cyrm09BibL+oXI06fQpYNio0sm95tTFpTj3k
X-Google-Smtp-Source: AGHT+IEKahnqC0SRqmrEsel3j+ooBIu9WEYbeI2q0pJTijLqqywp5yftThPLp2ZHNhT6DtgYruwQ
X-Received: by 2002:ac8:7f15:0:b0:42e:8ca9:cbb3 with SMTP id f21-20020ac87f15000000b0042e8ca9cbb3mr1995243qtk.33.1708966466235;
        Mon, 26 Feb 2024 08:54:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708966466; cv=none;
        d=google.com; s=arc-20160816;
        b=lJ23By09wgxwCIEuiItHW1yzSgKcJWfWX/7F48zV051PpFFhG7NozVtNwITkl8/jaX
         ndsXR4cHBCAZ7OK0KjiMNBlRCsan9hrnWUAfnbaRyuRxLEsmiDUO480s/+zNNPr8MBem
         2ObmNoSpFcfWtCrKd/eq8izSRxLJJiYujXEkmybepOgjFNvZ9pDG2POgQ/tpNGOJQyD3
         +i/A7w3PBecxZn1MfBt1b1fevBQFi71llL46svN0YMwYvLNl73eUYuOEhqwPKoXH8FGV
         La83R/7O8eRy4wl9ce+RvRuQfKb39/swTO6ORhdSELtvzwYGjcySjJwilJSYvqrbglO0
         oKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qizssl5kz7Kj4xa4duADsnx0VnNWR86cx9aqAcWnQsc=;
        fh=5saLnRJHv7jYTva36isZJW9+eWK3+2jcnmmJ4chZ9h4=;
        b=TTR6ZjiXRFqxhajBdvg91CTBAZH+Gv8bxrwIuIEai7YuvRHKNWtNKsXbbr0+WXwCBF
         lXOKQsc9Dw5El0CgZmDem38CAHOPrgkfjs8Lu2avg57gxs6RPrtYLFX0sIWOUVw7kdsu
         GooFc4mmjw4nj41M3lAg3BTu6YWEB/JBPTJlSEAXOr9Nn+eVSJLd50d04MWrUosG/XAU
         f+08igCqIwuAPSECc+Ih+vfjj2jwzuSDIdBmFN+Rk29gCwDh2M3bktJ8sXZFb2sE2Fgq
         HPwkIRQniVd1LGVk0zGytGnE39SzoxS9akFbsFyWt4KMrqJF16qNtGOqxxMTb5k4if8I
         cmpg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TKkq4mUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf15-20020a0562140e8f00b0068fcbda5f7asi5491346qvb.406.2024.02.26.08.54.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:54:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TKkq4mUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reeF9-0003n5-S6; Mon, 26 Feb 2024 11:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1reeF7-0003m6-KZ
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:54:17 -0500
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1reeF4-00072l-FN
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:54:17 -0500
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-512ff385589so1135417e87.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708966452; x=1709571252; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qizssl5kz7Kj4xa4duADsnx0VnNWR86cx9aqAcWnQsc=;
 b=TKkq4mUrPKrc9UEa7wIlr3kZRyUUC2MDBiO+3Em/uft6c69hyEVgztFD2Mvtz7rhjf
 WYlDaqn/BGi8rBkvVEdypRHR5iGDOiaPWpD9w+3g5ZslEXLZ1pAjYqgpuO2xyGO8wONM
 UKSU6MP71PHg9zdsfm6X6PgNVz9ReVsiDEc6uV7svgJT1Y0T1QQQAFJUlEnYAH4//KQD
 3hnPkhKH5U8cNp+x0uehrl97HfJE3/TSofznTvJcvPS4Mhhj+lEyQqzxBt8/ZqHG1Z3U
 9/ndlbT8ykpFJ4MdaOuoHTq/agdjlWFaSwcEisO3zpnkx0Z/JBkSOwgmG4iBOqyX355c
 vT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708966452; x=1709571252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qizssl5kz7Kj4xa4duADsnx0VnNWR86cx9aqAcWnQsc=;
 b=VwIew8HVFjBpsIw9dUoYuwS3FvsftQecWkdcc47VKO+EecBGx4Cka9y34yeTcqoe2H
 vHkF7py+j6Y+aC0rgBzcTqX+MNVcCZPw//GC5ADhehZnhDlTSVraIbB/sLEPqBugDFmh
 VEf0zLOj/XYtMgxWsbS8wOtobaNHSLNU5FatqhhhtPCYIB6n+p6ihuHmEpFb/ior/emh
 O5rE4HKCgUeOOGNOiHABOuPvU9Bgdo/rdPjfk4qVt/MjVYoVki69RfgrFauWKlfxp04g
 Uqw7FyW0AVY7W+FnoZrdQ4fI6s+CMhIauMiykMpOOZmnNHz+DvBBnAi5/09gfjnabPIN
 XrMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEvKoDm2kqBObiBMBUoW5BbgmQzNSMeOmkpvZi55EpD6ca+gFp1faXUBfKpDR4jkbk5CoMnX0iUSHJMmTzlS0uChPw
X-Gm-Message-State: AOJu0YybKVO5vIYzj1MNYUMXgRyZ9OUK1zK/zzVMJLiDm6cbT7GZWu9P
 xZUIP1b2rwdykBmqcIGF/F426ElxrImbAmkcP4+IDcsPZ64wDseAvRbc1Dq07qfewZOrrQyxi2K
 8ki60QsdoDGEfz7XVBBZ0zUT8qeOerB0xu13TtA==
X-Received: by 2002:a05:6512:2086:b0:512:a4ce:abb1 with SMTP id
 t6-20020a056512208600b00512a4ceabb1mr4313685lfr.32.1708966452447; Mon, 26 Feb
 2024 08:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-42-sergey.kambalin@auriga.com>
 <CAFEAcA_xdowvZkxFC7ypEFRJSTLDkdx+9E3_fwPNY=S2sK5=UA@mail.gmail.com>
 <CAFEAcA88NqshmyH5czz8ZC0Kbb81_-8VHRMCSQDbpHrPwm6AWA@mail.gmail.com>
 <37c4bf08-c3df-4311-9f3c-a4a5c9da215d@linaro.org>
In-Reply-To: <37c4bf08-c3df-4311-9f3c-a4a5c9da215d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:54:01 +0000
Message-ID: <CAFEAcA-9YO+6JvBwuaa4h+gnp2hQg6aHyv84KNxe9xdHhsWriA@mail.gmail.com>
Subject: Re: [PATCH v6 41/41] Add RPi4B to raspi.rst
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12c.google.com
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
X-TUID: ncXeEPwGRdVK

On Mon, 26 Feb 2024 at 16:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 26/2/24 17:43, Peter Maydell wrote:
> > On Mon, 26 Feb 2024 at 16:42, Peter Maydell <peter.maydell@linaro.org> =
wrote:
> >>
> >> On Mon, 26 Feb 2024 at 00:03, Sergey Kambalin <serg.oker@gmail.com> wr=
ote:
> >>>
> >>> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> >>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >>> ---
> >>>   docs/system/arm/raspi.rst | 11 +++++++----
> >>>   1 file changed, 7 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> >>> index d0a6f08b2b..c21b27744e 100644
> >>> --- a/docs/system/arm/raspi.rst
> >>> +++ b/docs/system/arm/raspi.rst
> >>> @@ -1,5 +1,5 @@
> >>> -Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3=
ap``, ``raspi3b``)
> >>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3=
ap``, ``raspi3b``, ``raspi4b-2g``)
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >>>
> >>>
> >>>   QEMU provides models of the following Raspberry Pi boards:
> >>> @@ -12,12 +12,13 @@ QEMU provides models of the following Raspberry P=
i boards:
> >>>     Cortex-A53 (4 cores), 512 MiB of RAM
> >>>   ``raspi3b``
> >>>     Cortex-A53 (4 cores), 1 GiB of RAM
> >>> -
> >>> +``raspi4b-2g``
> >>> +  Cortex-A72 (4 cores), 2 GiB of RAM
> >>>
> >>>   Implemented devices
> >>>   -------------------
> >>>
> >>> - * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
> >>> + * ARM1176JZF-S, Cortex-A7, Cortex-A53 or Cortex-A72 CPU
> >>>    * Interrupt controller
> >>>    * DMA controller
> >>>    * Clock and reset controller (CPRMAN)
> >>> @@ -34,6 +35,8 @@ Implemented devices
> >>>    * MailBox controller (MBOX)
> >>>    * VideoCore firmware (property)
> >>>    * Peripheral SPI controller (SPI)
> >>> + * PCIE Root Port (raspi4b-2g)
> >>> + * GENET Ethernet Controller (raspi4b-2g)
> >>
> >> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >>
> >> For the "no PCI/no ethernet" initial version, I'll drop these last
> >> two lines; we can add them in when we land the pci and ethernet
> >> patches.
> >
> > ...better, I'll move them to "missing devices":
> >
> > --- a/docs/system/arm/raspi.rst
> > +++ b/docs/system/arm/raspi.rst
> > @@ -35,12 +35,11 @@ Implemented devices
> >    * MailBox controller (MBOX)
> >    * VideoCore firmware (property)
> >    * Peripheral SPI controller (SPI)
> > - * PCIE Root Port (raspi4b-2g)
> > - * GENET Ethernet Controller (raspi4b-2g)
>
> When we add them back, no need to precise "raspi4b-2g" IMO.

It is the name of the machine; unless you think we should call
the machine just 'raspi4b', it seems better to me to match it.

-- PMM
