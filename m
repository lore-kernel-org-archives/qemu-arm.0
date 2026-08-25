Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EEFC5DF9C
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 05:53:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyk5z-0006Mn-1m; Tue, 25 Aug 2026 01:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wyk5x-0006M2-4f
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 01:53:13 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wyk5v-0007sP-Cy
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 01:53:12 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2d5335cf904so33695105ad.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 22:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787637190; x=1788241990; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XA7uT6LLB/NE/DOxlm4rlbbKclcgW0r6Edjk3dfnqzA=;
 b=oPx6BhFYj7sZMT7ukzLlaCoVAY5MF5d9VeHFQUcN7rVsfuPED61yZHtdctdjsDu2Yq
 NrGPiYuulweBCYeS0Je+CWbffrQmyGTfROdtfjOG5qKpe40DDrXFSZmM2ye+Oq6jWtX3
 KPySZrrrzyWP8bm79YlqHdsbcEQRDQNYwegiLjhiSS0TuTJYFdBgFjDwgvHXKOJUJSZg
 1mUi5heTlqAWxmIDJSV4FJQx8Jgg8+dSh8+gKGExcMo+W3othTndUAxNatfSpaytyif6
 vUQGw3NzSqknNEqhSdofCct8vaW2ZdxoU+2XKRih+6tD638jq8iI99Fg5+i2gAks/mpm
 8H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787637190; x=1788241990;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=XA7uT6LLB/NE/DOxlm4rlbbKclcgW0r6Edjk3dfnqzA=;
 b=frRouCjjgkXY5adxyfBN3HxpYiO7dywRAJgZx8CeqTJg6Ieqcb/PKcuFW0He99ZasP
 uxZ+ILl2MfkDX0BzTFcJLe6Di79LrNELBn1IYOekhRTm2eN7WOtJLb4g5jsw1+BXp346
 22wZ9MIwMEn/6cCoSOptwUxepHhQoSOKeHBu4gLFWO4Gm5aQ8GR/NF4isf/Bzw0Q9UFC
 396LAd9w5I2eIjVAG56aiOFD7omP47n8M/Z+rcZ9u9/3bBQyUfSY6p2xIqReS2T6S9Uy
 tKhlYg+z7SVjFrY8MVZzb2/YY4RC+StfaF+k8Amh5lwbSr6OUWD1oBnEgqa80Sfq+9jp
 YzhQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqw5hMN82N/Fx2SHNddCFZTePYRyG65Mn1FCqE9ImPzkQ9cunFJJ44boAD13rrirzIhWnHQsUGLZg==@nongnu.org
X-Gm-Message-State: AFuF++mqkrpQ4F5zNgX33BZRNNd/PMxImrE2rnEjCus+wUlrqxOjNCkF
 poL03ToXNV2jeP1fKYBqHht5K71/kCVpv8HvEDVYjQyr5wwwaMWwLI4z
X-Gm-Gg: AR+sD10bE8IQ/SL2lGdzK6aW3yORs18F8W40IY6FAc8pSJ1fG0xaL9HJOwrc7JQVMcw
 Z73UM/Z4e/0aJkfdl2I8Y1MKoz+hQGc7R3+Y2E3tzr/vorcZBbCrSZGkHW9g40k56Z8N2AU2SmJ
 INJOl3HBAJ86R+PVsNQ3ops2ayg3k9jpT3Y5F4NcyiuB4SaaLh705cQML6JCGJqQ9+adZf6F1lt
 nam6oaZ0Xrphzf/rF44ecS37oc3dwvbAucA74MJ0A6GxGnfC00Rr/xquI/11GRXe0VPsXX9IFqD
 yYGeABRHgbyW1B3FQD4IGLX5FCUh9Jo/DywjnpG9pIxgilljWoeLd1MfEt/qOeJB2ZpeSxYY8po
 eMFszBcORh2HDKWViThPISCFCYQX4J4s5OG/zoDFenWzuPKufUQvFyi2qMqb1U1/WFDDp1889eM
 /bh/wiFLDCRzZaLAA9zGevbfIj0Pce69haG2eJBXQ98YfF/sv8GYoDcaCiVaET1mGHBWZYgC0WL
 5U/kZ4=
X-Received: by 2002:a17:90b:1b43:b0:38e:9eb2:9d43 with SMTP id
 98e67ed59e1d1-395c357e8efmr54221579a91.16.1787637189675; 
 Mon, 24 Aug 2026 22:53:09 -0700 (PDT)
Received: from smtpclient.apple ([117.55.237.216])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39645bbb87esm2453813a91.13.2026.08.24.22.53.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Aug 2026 22:53:09 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 0/5] Add Axiado SoC AX3005 and EVB
From: Jack Wang <163wangjack@gmail.com>
In-Reply-To: <20260825021155.2475879-1-kchiu@axiado.com>
Date: Tue, 25 Aug 2026 13:52:51 +0800
Cc: qemu-devel@nongnu.org,
 peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <812FA8DA-88ED-437E-B9A0-E3418F092DDF@gmail.com>
References: <20260825021155.2475879-1-kchiu@axiado.com>
To: kchiu@axiado.com
X-Mailer: Apple Mail (2.3864.600.51.1.1)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=163wangjack@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org


Hi Kuan-Jui,

Cheers for the v3, that was a really quick update!

The basic tests passed on my local machine, and I will look through each =
patch carefully next. I'm not sure if I'm qualified enough to give =
Reviewed-by or Tested-by tags yet. Anyway, if anything I do during the =
review is inappropriate, please just let me know.

I checked the https://axiado.com/products/ link you mentioned, but =
didn't find the critical info I needed. I googled for the AX3005 =
datasheet but not much useful infomation. AI tell me it's not =
public.emmm.. If you could offer me some key hardware information for =
the QEMU modeling, that would be much better.

Also, since you asked for my commands before, if I find any problems, I =
will attach the exact commands I used in the email to help identify the =
bug. I am testing on my Mac now, so please contact me if you have any =
trouble reproducing the issues.

Best regards, : )

JW..

> On Mon, 24 Aug 2026 19:11:50 -0700, Kuan-Jui Chiu <kchiu@axiado.com> =
wrote:
> This patchset introduces Axiado SoC AX3005 and evaluation board for =
emulation
> The model for Axiado SoC AX3005 supports
>  4 Cortex-A53 CPUs
>  Arm Generic Interrupt Controller v3
>  9 Cadence UARTs
>  1 SDHCI controller with PHY
>  8 Cadence GPIOs
>=20
> Refer Axiado website for more product information
> https://axiado.com/products/
>=20
> and minor changes for the compatibility with existing AX3000 SoC model
>=20
> Test plan:
> 1. Verified the machine "ax3005-evb" with following command
>=20
> qemu-system-aarch64 \
>    -m 2G \
>    -machine ax3005-evb \
>    -device loader,file=3Dbl31.bin,addr=3D0x88300000 \
>    -device loader,file=3Dtee-raw.bin,addr=3D0x88400000 \
>    -device loader,file=3Du-boot.bin,addr=3D0x80000000 \
>    -device loader,file=3DfitImage,addr=3D0x80100000 \
>    -device =
loader,file=3Dobmc-phosphor-image-evk-ax3005-qemu.squashfs-xz,addr=3D0x80B=
00000 \
>    -device loader,cpu-num=3D0,addr=3D0x88300000 \
>    -device loader,cpu-num=3D1,addr=3D0x88300000 \
>    -device loader,cpu-num=3D2,addr=3D0x88300000 \
>    -device loader,cpu-num=3D3,addr=3D0x88300000 \
>    -nographic \
>    -serial null \
>    -serial null \
>    -serial null \
>    -serial mon:stdio \
>    -drive =
if=3Dsd,file=3Dobmc-phosphor-image-evk-ax3005-qemu.wic,format=3Draw
>=20
> 2. Run QEMU test suite
> make check
> Ok:                331
> Fail:              0
> Skipped:           17
>=20
> make check-functional
> Ok:                28
> Fail:              0
> Skipped:           7
>=20
> Changes in v3:
>  1. Remove patch "hw/arm/ax3000-soc: Add missing class_size to =
TypeInfo"=20
>     because it was fixed by commit 4f50d637e2
>     ("hw/arm/ax3000-soc: fix heap overflow from missing class_size")
>=20
> Changes in v2:
>  1. Add patch "hw/arm/ax3000-soc: Add missing class_size to TypeInfo"=20=

>     to fix incorrect class size
>  2. Add missing class_size "Ax3005SoCClass" to ax3005_soc_types
>=20
> Kuan-Jui Chiu (5):
>  hw/sd/axiado_sdhci: Add header guard
>  hw/arm: Rename ax3000-boards as axiado-boards
>  hw/arm/ax3000: Specify SoC name in header and variable
>  hw/arm: Add Axiado SoC AX3005
>  hw/arm: Add Axiado Ax3005 EVB
>=20
> MAINTAINERS                                   |   2 +
> hw/arm/ax3000-boards.c                        |   4 +-
> hw/arm/ax3000-evk.c                           |   4 +-
> hw/arm/ax3000-soc.c                           |   4 +-
> hw/arm/ax3005-evk.c                           |  55 +++++
> hw/arm/ax3005-soc.c                           | 225 ++++++++++++++++++
> hw/arm/meson.build                            |   6 +-
> include/hw/arm/ax3005-soc.h                   | 102 ++++++++
> .../arm/{ax3000-boards.h =3D> axiado-boards.h}  |  10 +
> include/hw/sd/axiado_sdhci.h                  |   5 +
> 10 files changed, 409 insertions(+), 8 deletions(-)
> create mode 100644 hw/arm/ax3005-evk.c
> create mode 100644 hw/arm/ax3005-soc.c
> create mode 100644 include/hw/arm/ax3005-soc.h
> rename include/hw/arm/{ax3000-boards.h =3D> axiado-boards.h} (69%)
>=20
> --=20
> 2.34.1
>=20
>=20
>=20
>=20

