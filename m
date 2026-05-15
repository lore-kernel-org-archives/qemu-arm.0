Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F0CCD4F25
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:18:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtMW-00065w-IW; Fri, 15 May 2026 10:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtLj-0005ho-FM
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:17:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtLf-0005uq-OC
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:17:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-449de065cb3so8474909f8f.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778854626; cv=none;
 d=google.com; s=arc-20240605;
 b=TqdI1BKgck41VK5Y5/mvNW9jYurSiIYJpLa8DWV31QTZWz4Ln8ELaVDfNIxDMBoTiD
 BGkBJHGP94Jr/nwxn2DbyvjZP6/vUNIOgL9Fb4u52QgvhVY4WCR9xcKmI+Rnfh7L0dUN
 lE8aXqD1FTVyPBcEfwP+WjWK6Y8fBZAxphhfc3fjzO122s38mCJx+k+mHrVrexp+feMu
 K+d895Ffif/DnAIfL41M+SYMs57ZecBlg7paQn1taiyyzXbl+UWreQ06g7t0A5OXtyig
 SMIQzyA1rTqNpj9dV4mJylmU++4QzpJU2I3y3YAMjFOjtwBF8ggYVb0nnzYVdmrxrMTN
 a5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UOp7CuZHjDBgJG2J8FccCnQW2jyNecZ9QuOydA4HVmY=;
 fh=XLuAlnLKklrjKy2TH+1jjOvczwxtk5Zgihrbc9YKFI8=;
 b=S68LijRXZHaNefRs/2rV6wLFaq3zDJHdEvVdhif2fDH2JVgh6Fq4rT/7lUaQntSZcX
 CeusXYEFpuZKJ9YLGYLTf1Jzc0nstw0TyhINdmjg1k2GIZjkWCeTDv8O+2peeyNHM2O7
 pTr2wuIY6VIbFzA9EPFO99GMEitxKx7bfxlbc5xQp2eVskVi7IlAzwivV3ioRl9GSWLH
 etZiWSXlDvyQODB4ikel6myqFuR5nSS1cA1qvQIcbM9j5gCk6ie45HylG96i4/enf7Rh
 niIZgBlv7ylNTjpnLNTql/65eSlMXhgmjM7xx+j8lg8gRwN0DKtTwqK6aGRVOj21dCL/
 r66A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778854626; x=1779459426; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOp7CuZHjDBgJG2J8FccCnQW2jyNecZ9QuOydA4HVmY=;
 b=iX3Kh9XDBpw3AisSu5SQW//6JSkvi3qo9n3P0g7TWet0iuVGIaxOOwviUOtMGVkHRq
 XbiuKiSLAqV12O92rER3s6Y03tMnBhzYHVvkkDs8PNMn3AguiozabrCuEdjEhi+mdnWO
 5cG7JjjxQUoDA+ADyRustZBSxeH5Xqp+hcvr8npHuaq1ww8bE10T6JV5wq1fB/9StFN7
 8p63C+t3xXBfrQzgLbK2fm/rjqC61KwTps5/bskk1mRjauk7mi2AmjOyeQ59TjAcZy+Q
 jLzUBqiNWRebTb83AymE39WD93jWLRnNqY/vwyMsXs64n46geVTkQzfJcrEnWIcRlc1g
 Hh3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778854626; x=1779459426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UOp7CuZHjDBgJG2J8FccCnQW2jyNecZ9QuOydA4HVmY=;
 b=Ox1HR3nQnREeMB8iOikM4y/cOAHIFXYl4ZB6VFkYnZGBrpTzcQ3wIGVserVM6Xfeu/
 G+mMXNbKaLipS/ipnpES0bc9l0GPOpTELOXwHGk+lpqi9AIJL/n/Vt5liB9A+SIJbTaF
 8EGTkO6jlEoXqaD9TLYimaFh24CPZGqqGJivOm2JUVMUdv2LhZiBNemCDO+0IbJGKVYT
 8dUuRsWLhOTZ1qzyHd4/+E7LxA+/TQVJ6FPevmig0imoDsF3XFgGm+c+HYtFRhVYdCI4
 kPBOIrHMV1r0gOAzdLUABLHNFYQVNtXspQ/nHewznAQcWgAqEPddfvu5RwVKbynITObB
 WaEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9eneLdvydWryzoOkYOu5uYBWrl7EyHVBNOONi2Vd/tekdDsT3hvFFqrbutdgF5IN3StKkaDzr0xQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxvs8UdP764ujbQcgtS9eyPOWjg6+I3ptRap/lI+J+oX4r/TB7i
 L6XWZ5AVtivKCAmUwRxD6c2BbPzJp9Ox4llS7Lt3mapPbcxh+0eFjoFi6eoGWVpgMp8udcB3xiq
 ApQeP8q6gCWs3pJYEWOiCK/G6lPz4yhIGPEEzRSCXNA==
X-Gm-Gg: Acq92OFUU4TM0NodmOlmKP2oA+1Reh06TXttrHBdO6S59kMf4keoEt5+NXbx8rI0sdb
 d9ldxnXcfY6fp4CrwVrjfBCVVIuc89YHB6kjYUOSxHMn+W6PkV8GTN6rkKE59kWVYdNJJIlP+R1
 cMYeCa5VMo2X/FLC5oTnt6vmLVS/d6bA3I8aCnhuJLu6ZzrcAf/B/mAlLR9g/fMsSlAD2UrktLZ
 XIc5AOlFvhBo0gnIlIQt1oAz+F1ytcxyP9U6/kySuWr7+Kex0/33mcEQzi1QS7VcF0epPdbmd8X
 BYk2cmi0waSNTDtL3jv+Vpd29CunFmzh50pxhyfMQycXrOazf123Dl/QxOmw
X-Received: by 2002:a05:6000:40cc:b0:45a:c0e1:37b with SMTP id
 ffacd0b85a97d-45e5c5ccf6fmr5712567f8f.32.1778854625194; Fri, 15 May 2026
 07:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-6-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-6-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:16:37 +0300
X-Gm-Features: AVHnY4KxSKUANBiquY_aKqvXRjKg-JAV7XS5ZlBr3-ELxGtFvx2RvUeU8DBnbfY
Message-ID: <CAAjaMXZ=iK68KAkPc2voqkZ1eqAsuaAdqvrMh=kjWWMiP9f-aQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/20] hw/arm/aspeed: Build objects once
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x430.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, May 15, 2026 at 5:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Commit 064f1ce95fe ("hw/arm/aspeed: Split AST2700 EVB
> machine into a separate source file for maintainability")
> remove the last TARGET_AARCH64 use.
>
> Now than Aspeed machines can be filtered when running a
> qemu-system-arm or qemu-system-aarch64 binary, we can
> compile the aspeed.c file once, moving it from arm_ss[]
> source set to arm_common_ss[].
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  hw/arm/meson.build | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 144e4827660..7c3d66f4378 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -43,7 +43,7 @@ arm_common_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: =
files('xlnx-versal.c', 'x
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX25', if_true: files('fsl-imx25.c'=
, 'imx25_pdk.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX31', if_true: files('fsl-imx31.c'=
, 'kzm.c'))
>  arm_common_ss.add(when: 'CONFIG_FSL_IMX6', if_true: files('fsl-imx6.c'))
> -arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
> +arm_common_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>    'aspeed.c',
>    'aspeed_soc_common.c',
>    'aspeed_ast2400.c',
> @@ -66,8 +66,7 @@ arm_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files(
>    'aspeed_ast2600_gb200nvl.c',
>    'aspeed_ast2600_rainier.c',
>    'aspeed_ast10x0.c',
> -  'aspeed_ast10x0_evb.c'))
> -arm_common_ss.add(when: ['CONFIG_ASPEED_SOC', 'TARGET_AARCH64'], if_true=
: files(
> +  'aspeed_ast10x0_evb.c',
>    'aspeed_ast1700.c',
>    'aspeed_ast27x0.c',
>    'aspeed_ast27x0_evb.c',
> --
> 2.53.0
>

