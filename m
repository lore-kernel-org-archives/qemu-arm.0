Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3047175ejb;
        Sun, 18 Dec 2022 14:40:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsyCR77XREsbOS2SwyVKhvbIVr4gIC1Th5qPfNQYSfUBPOldHqGvuR1JXnRPI7vAjt/X7x0
X-Received: by 2002:a05:622a:4d04:b0:3a8:18fb:d2b4 with SMTP id fd4-20020a05622a4d0400b003a818fbd2b4mr5797479qtb.22.1671403214188;
        Sun, 18 Dec 2022 14:40:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671403214; cv=none;
        d=google.com; s=arc-20160816;
        b=AceYR/pHeJ4jCbrDztEehCN3BFPl+UuaYWzzZNBHkobxzo0k4w2wxpWEuEKJCMoO6z
         6iRQ/uewrLY7hmHLmc6268os2FFzlMsIapnFZUbfMmL/nYjZHU9OMp53T6w2oqoH0P2f
         HMznUtj4VVxgX/BP1P3+E9yN0O8VXnCsdh2nu+D7ICiQVXhsBNXMtdrlJp/z+7Aa0JjO
         qqzNYv9rGBRE/bqIYadC/XmzLhgdOVhB9XU6mXcfOJhf79LFXjKcgkMU/hqQK+KJlNYY
         ncN/ePplBGv8AlmyKDL9kQ8yM6QXMaC3Z0eVxMSdooU8uLltq1sUw6FjB0YZYTDvso1b
         /Tyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=tPEAg52y9rpZLUJ3oxysKXbGG/4TGi9RDrzrY00Dbg8=;
        b=ukIm85t8JPOcWPcsqEDrkdVQewlt5WImd6j3QnDLWiAka8b+jqgl31bJwszSJboLgY
         iBKc31yE+6SQEz97kYzKEql1vbh0TzyYOWSUBOWrG55DHNkgUNQyEgL4SnsMzYTbBTCt
         9pRP9cpyd23s8bu7G6rz3qHx5FiPxMGiMlO5zVAtOp9JdJ2tY0VAZvUE1/lYkApu3W4t
         cqaK1sjFFhMpPnXI4iepPucpgZe9vdgi79EsPJOoDxpxMcYZ0wby2xjYvoZbYGoO/doJ
         0QVyMCC2WenNIz7kI4NJ3hl3khnmwzTzupVfCKX7a34LhHHutuMU+IAB5++EHO2IXXjt
         X58g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=X8RsYnwx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k20-20020ac86054000000b003a97e3eadeesi1887048qtm.405.2022.12.18.14.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Dec 2022 14:40:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=X8RsYnwx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p72K0-0007bo-GF; Sun, 18 Dec 2022 17:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p72Jy-0007ZQ-AW; Sun, 18 Dec 2022 17:39:50 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p72Jw-0000In-La; Sun, 18 Dec 2022 17:39:50 -0500
Received: by mail-ed1-x529.google.com with SMTP id c66so10644142edf.5;
 Sun, 18 Dec 2022 14:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPEAg52y9rpZLUJ3oxysKXbGG/4TGi9RDrzrY00Dbg8=;
 b=X8RsYnwxmOAMdezsyymkKP42cGaH7Cod4eXWCV80tufKYhjuXb7KNEXEUcyOSLzgeP
 JrTuwLLhKNe6rQLSmEN8QmJYuVGbf73OrHPslkaaB8hr1RLp6b7U3izcVDh7rTdyRvlO
 cESb6pEj53kB7iYfZltXFoF+/S/w1hljlyOBX+BdjSfUUJt12VkC8YU1cBZwNtvmxlvN
 63FKsDMY7/OdfJVJI2xuC73xsY2iZWhtMrUWD58vz3XqAorDrryTs/mg70Xl1kx4HecO
 N5PETzleJIv94Ydts8VKLAJ6ioE/kNr7h+H1hZ8AIwjbIoT24S8gEklv1XtuNs2zy+WK
 KNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPEAg52y9rpZLUJ3oxysKXbGG/4TGi9RDrzrY00Dbg8=;
 b=VrhQlSqA1Gb3mpPotVRFz17sRStmLHQmj4Hr1pCZanPkiz26kM63AkejV/tPDTWJ4D
 /tBpXR2oY4IDDLb8zk8TmBCAFpImsqVdXOkeoBts7+ijlzvN05CKO2qmacsmqmc5vT9S
 5LsYildHZv/jmRlInR6UYhRvWe927voGCr6BEL1DGf9RpRK0Yj0rLi4wOlhio1M12KTR
 RGaVHG1oie0MO5jyXyYMRrtJ7o9xehd+8bILcKyAJLoOo7lAqhesRs/BdGf2DC2whAgK
 B0B/0aK7hnmeuJnNRXY2NW1w4IirDKqdch+iliUwFs/WwygI/H7EtyEvAGxyRwohloij
 EMeA==
X-Gm-Message-State: ANoB5pnOV5zY+dH39fGEBBYV76CxwrhiKS892sVTQNu9iKHyPHAkttKn
 scQulVYCDxDbHZOTFwBun5bWH85QuSz/M/EX72A=
X-Received: by 2002:aa7:dd45:0:b0:45a:3c66:b0e4 with SMTP id
 o5-20020aa7dd45000000b0045a3c66b0e4mr89917435edw.33.1671403186762; Sun, 18
 Dec 2022 14:39:46 -0800 (PST)
MIME-Version: 1.0
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
 <df665471-7426-f313-aece-75b8638e0da4@linaro.org>
 <CABtshVQNAseuzxHS7htyxEtoZDEGVG0fdf0ERdAZJgcxe=znQQ@mail.gmail.com>
 <de6f6dfd-e6e1-39fd-1c4f-d30249451cd1@linaro.org>
In-Reply-To: <de6f6dfd-e6e1-39fd-1c4f-d30249451cd1@linaro.org>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Sun, 18 Dec 2022 23:39:35 +0100
Message-ID: <CABtshVROYFnbsaS1Z9aeuDjJJgNxHrHw6uVyypcppc6MK1Ng0g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/misc: Allwinner AXP-209 Emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x529.google.com
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
X-TUID: UCBGKvGv1Be2

Hi,

On Sun, Dec 18, 2022 at 11:23 PM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 18/12/22 23:12, Strahinja Jankovic wrote:
> > Hi,
> >
> > On Sun, Dec 18, 2022 at 11:07 PM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org> wrote:
> >>
> >> On 18/12/22 22:19, Strahinja Jankovic wrote:
> >>> This patch adds minimal support for AXP-209 PMU.
> >>> Most important is chip ID since U-Boot SPL expects version 0x1. Besid=
es
> >>> the chip ID register, reset values for two more registers used by A10
> >>> U-Boot SPL are covered.
> >>>
> >>> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> >>> ---
> >>>    hw/arm/Kconfig              |   1 +
> >>>    hw/misc/Kconfig             |   4 +
> >>>    hw/misc/allwinner-axp-209.c | 238 ++++++++++++++++++++++++++++++++=
++++
> >>>    hw/misc/meson.build         |   1 +
> >>>    hw/misc/trace-events        |   5 +
> >>>    5 files changed, 249 insertions(+)
> >>>    create mode 100644 hw/misc/allwinner-axp-209.c
> >>
> >>
> >>> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> >>> index 052fb54310..3855d937fd 100644
> >>> --- a/hw/misc/Kconfig
> >>> +++ b/hw/misc/Kconfig
> >>> @@ -180,4 +180,8 @@ config ALLWINNER_A10_CCM
> >>>    config ALLWINNER_A10_DRAMC
> >>>        bool
> >>>
> >>> +config ALLWINNER_AXP_209
> >>
> >> This controller is not specific to AllWinner. It can be plugged on any
> >> i2c bus. Please rename it AXP209_PMU. Otherwise LGTM!
> >
> > Do you mean only in Kconfig, or everywhere (file name, function names,
> > etc.)? Thanks.
>
> Keeping the file / functions names with 'allwinner' would give the false
> idea this is AllWinner specific; rather confusing isn't it? Besides it
> is not part of the SoC, this is an external component sitting on the
> bus. So "everywhere".

I was expecting that answer, but I wanted to check :)
When I started writing code for AXP209 it was indeed without allwinner
prefix, but then checkpatch.pl complained about missing lines in
MAINTAINERS. At that time it was easier to add the prefix (and get a
match in MAINTAINERS) than to investigate if I should update the
MAINTAINERS file or ignore the checkpatch.pl complaint.

I will update everything related to AXP209 so it does not have the
Allwinner prefix.

>
> Also, the "select ALLWINNER_AXP_209/AXP209_PMU" line in hw/arm/Kconfig
> belongs to the next patch "hw/arm: Add AXP-209 to Cubieboard".

I agree, will fix it.

Best regards,
Strahinja

>
> Regards,
>
> Phil.
