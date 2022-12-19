Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3842272ejb;
        Mon, 19 Dec 2022 14:05:58 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5HrSliumEsnHCZ+bZuqmBbGkMYI+axNT1EzeBUqyT2xPnTxQPY046oA544+XfdidWDD0CH
X-Received: by 2002:a05:6214:84:b0:4e1:bb55:1d9f with SMTP id n4-20020a056214008400b004e1bb551d9fmr45553353qvr.2.1671487557935;
        Mon, 19 Dec 2022 14:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671487557; cv=none;
        d=google.com; s=arc-20160816;
        b=hE0HCmu7zM2ey1aT/P0Su0GRp8ww9uOvbZ4SYIHojzpSwxPX+Fz3yx8JYpUCIY67Sy
         dEU1sVIMNlcuibCF69vJ6aEUq0dB5Qt2O6aupw6TM7gb4PNqgs3pbS9+1SbjkrFEkK7w
         wOpCkUPgTtFKZcNpDAh8nfWjc/P9Q693UrIsfwkhwOTknetB1bzfGmy3s9GV0aGbLVK7
         8HOvq5h1WOCHVGSIcQ7ahvCS7WcrtVj3/4pphTwbQH3c+ntvpF1cwV32Yqp/YwdsW2NZ
         HiICLTipPiMsrt7lciroYpcZ/BTj1lhT0LUE5UaduejEdznnf64fgoIOQvhYHE9v8KJ6
         xXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ycDw7OhDWV0wenYQxl5/LZUes6DN6MZeWTtGfKFGve0=;
        b=zSHZOPnQbxE4n/bYP37o/r0OOC/GogEEihlay4BDj71MJ5Nq7jtr8T0XZikDAfpPSp
         g3wCcXdoFutRoVTpyQPa+wgJbFgLv7N/854Fw/3jeJqnzs02wLhzZUtajr3GGChkCZzf
         A8HPxenImJBzOz3EkC05Wbv1iVKHDmaJfCS44DWaEP6gtwvZ1hb3jg/Q992jYOF3NAOn
         p57NPKPzjEqlyVRSpgHnP0vhcOq8BT6IeWeaCeOrbPPg1mekbVP5XDvoWOnDpx7RTcYU
         Bfk9Z51m8VTVdDZ+WmruQo8aJT5tglCNddLvIBwvINuA3lVjc5vNH/XhP1Rm1VaVSMd6
         iayg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JjdNmrKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id nv2-20020a056214360200b004bc22fd6796si2788134qvb.507.2022.12.19.14.05.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Dec 2022 14:05:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JjdNmrKK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7OGU-0006FI-SQ; Mon, 19 Dec 2022 17:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p7OGS-0006DR-Rd; Mon, 19 Dec 2022 17:05:40 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p7OGR-0003Sc-5j; Mon, 19 Dec 2022 17:05:40 -0500
Received: by mail-ed1-x52a.google.com with SMTP id r26so14914650edc.10;
 Mon, 19 Dec 2022 14:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycDw7OhDWV0wenYQxl5/LZUes6DN6MZeWTtGfKFGve0=;
 b=JjdNmrKKHrLTF5i5Etny0A46Bc3564yP4S6xwUfWX9bnn/nMsBw3ZIqPr/CJNWZOqu
 xCBhOJKsn5RRowRu51vayaQfuOobhA10IDnVvR4a0R2Tad4F2/9nZ5fPF2dRrT7SfqM3
 2AFQZKlz/KD1EV5E00Efyv2DJMbjXfEkzR7T0dtewVnhNmom12WGmArCsy38imOT4JBI
 ixH7Fk2+iWBmSwy7rtOH4nA4jEdTZSMgo4wUaGeO2EDPDyhkVVqXVFh4Vb79/QvFPy/Y
 TFWR/FcUOT0jRQEL8omwi88H5PAE2RBlUnZzDL9OZmlfIOK+mqzaqnvna3Kc5xQ25Y4m
 tXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ycDw7OhDWV0wenYQxl5/LZUes6DN6MZeWTtGfKFGve0=;
 b=hOOyGWyDen9cVzrDWy/sovP0QuC0hT0XHpP8OXw/CDJwgQZK+wOr1X8FF3NZq9KoEE
 kxcQiBzi29a9G8ntnxYIiIRwG6OUyLcba0jX4CGFYqfnbsDkla5oKQ0+QAxamj8DRca3
 k8PQWkPrlyqwr6FnzYDeyxyM+9AV3na/H5oaPVAm+pOMXVX0mpDKMVL3zxPgrKlSY0vB
 EFGKVcX70h8XyRkdxKcQOyoHDRPhHzAkBD+I5IA2PEbtx3UPOkCIFqVJhwi+qYjbEuDU
 DB5rteq84deMfI9qxSa05gSZ3ZfUgJUvCwiCBleOdIQke/R/zo/vQ0DmR0ajqNIXbxL2
 Gn+A==
X-Gm-Message-State: ANoB5pmaBPTALAOFtM3NfPjewj+ypu/a3R7PYjlkZJqMgfZxuAKQFmkx
 hS9HkztBW3Xkpb17qW8vOmQ4Zllio5k460jgMVkj3z/+oHq4fA==
X-Received: by 2002:aa7:d85a:0:b0:46b:81a8:1ff6 with SMTP id
 f26-20020aa7d85a000000b0046b81a81ff6mr41745541eds.174.1671487537164; Mon, 19
 Dec 2022 14:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
 <df665471-7426-f313-aece-75b8638e0da4@linaro.org>
 <CABtshVQNAseuzxHS7htyxEtoZDEGVG0fdf0ERdAZJgcxe=znQQ@mail.gmail.com>
 <de6f6dfd-e6e1-39fd-1c4f-d30249451cd1@linaro.org>
 <CABtshVROYFnbsaS1Z9aeuDjJJgNxHrHw6uVyypcppc6MK1Ng0g@mail.gmail.com>
 <145bf162-f53b-cf46-baf3-11e7d8ff2d8c@linaro.org>
In-Reply-To: <145bf162-f53b-cf46-baf3-11e7d8ff2d8c@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Mon, 19 Dec 2022 23:05:25 +0100
Message-ID: <CABtshVQsA0x+g_ed79EFs6Th4dkzJNPC4Ne+f2i5p34FH2MSKA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/misc: Allwinner AXP-209 Emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GXpqcxlSgssI

On Mon, Dec 19, 2022 at 8:15 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 18/12/22 23:39, Strahinja Jankovic wrote:
> > Hi,
> >
> > On Sun, Dec 18, 2022 at 11:23 PM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org> wrote:
> >>
> >> On 18/12/22 23:12, Strahinja Jankovic wrote:
> >>> Hi,
> >>>
> >>> On Sun, Dec 18, 2022 at 11:07 PM Philippe Mathieu-Daud=C3=A9
> >>> <philmd@linaro.org> wrote:
> >>>>
> >>>> On 18/12/22 22:19, Strahinja Jankovic wrote:
> >>>>> This patch adds minimal support for AXP-209 PMU.
> >>>>> Most important is chip ID since U-Boot SPL expects version 0x1. Bes=
ides
> >>>>> the chip ID register, reset values for two more registers used by A=
10
> >>>>> U-Boot SPL are covered.
> >>>>>
> >>>>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> >>>>> ---
> >>>>>     hw/arm/Kconfig              |   1 +
> >>>>>     hw/misc/Kconfig             |   4 +
> >>>>>     hw/misc/allwinner-axp-209.c | 238 +++++++++++++++++++++++++++++=
+++++++
> >>>>>     hw/misc/meson.build         |   1 +
> >>>>>     hw/misc/trace-events        |   5 +
> >>>>>     5 files changed, 249 insertions(+)
> >>>>>     create mode 100644 hw/misc/allwinner-axp-209.c
>
>
> >>>>> +config ALLWINNER_AXP_209
> >>>>
> >>>> This controller is not specific to AllWinner. It can be plugged on a=
ny
> >>>> i2c bus. Please rename it AXP209_PMU. Otherwise LGTM!
> >>>
> >>> Do you mean only in Kconfig, or everywhere (file name, function names=
,
> >>> etc.)? Thanks.
> >>
> >> Keeping the file / functions names with 'allwinner' would give the fal=
se
> >> idea this is AllWinner specific; rather confusing isn't it? Besides it
> >> is not part of the SoC, this is an external component sitting on the
> >> bus. So "everywhere".
> >
> > I was expecting that answer, but I wanted to check :)
> > When I started writing code for AXP209 it was indeed without allwinner
> > prefix, but then checkpatch.pl complained about missing lines in
> > MAINTAINERS. At that time it was easier to add the prefix (and get a
> > match in MAINTAINERS) than to investigate if I should update the
> > MAINTAINERS file or ignore the checkpatch.pl complaint.
> >
> > I will update everything related to AXP209 so it does not have the
> > Allwinner prefix.
>
> Add a new AXP209 MAINTAINERS's section with your name :) Or add the new
> file to the Allwinner-a10 section and add your name as designated
> reviewer or co-maintainer :)

Thanks, I will take one of these suggested approaches.

Best regards,
Strahinja
