Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60B7D44C60
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 15:00:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgOpG-000071-N5; Thu, 15 Jan 2026 09:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgOp0-0008M5-B4
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 09:59:39 -0500
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgOox-0007Mf-88
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 09:59:38 -0500
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-6467b7c3853so763898d50.0
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 06:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768489173; x=1769093973; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXLZnAZvRwHnq2PUi9dkxfby2U/w5lz7DGcJF0nU5QY=;
 b=ym+znmv4b5kY6qjcyme0dLPWgv8sBcdDZbD3F+HaQWmkZZHvyVuA+7uvjURbzhhBjc
 gKpY7FcKMrfW228murmuYlC9gKPfudGVJ2PrYcIx5Q10vSWzGxc/cHFU3XNFJI2wAVBQ
 tSwNtKvL+irI9LxKbH3bjwf29pp4zIgGy480iFItCJ4ZQCJIGkUIcArwH8fzv+aXnYdq
 9cb6QnXZEibxyU3lwQtf3kfjJPjHSv/jQ0TXljIKw2TXQyYK3mz8bfFJ2Yp9ssPUT1m2
 Xb9J4vYkVngSLg/l3XRR/lKerbzhADaxdkzu5gKkHSOSWjGC741OHxiyhCSrAxHqtmul
 c2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768489173; x=1769093973;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JXLZnAZvRwHnq2PUi9dkxfby2U/w5lz7DGcJF0nU5QY=;
 b=CTxiPEh57c33DEZzSFwmyAHzANnroyDgBCjOc8qi3z/TvwawYPwibQlFO3T0Blv6XR
 bFIxT9jjDXqa/02/P0QZ7+Tw/eBmr3lrZdK4qgJ3A+LdkvnwtGIm4RGvNlDRx3aiNBwR
 e9YnGadaKCuH3FLG7Xtn4C6xptsvdsCACPSjkEwA6bavNtdb9Kt88SMzHm6UanNHhRsE
 MUUFI41GrBT9X5SLVSOvHOYMRCCAnkjalUrJh3XWOEGIxxh5VZsRqmODdtTQZ4F3hX2i
 qK1H48m4o4LTiUpjMON4kjzMbLC+NZD6qPc8XqQVL4zjwCD6jh/rlI5A2nHAKqFka1SI
 A9ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdtQ7tc6XBDuvDLGyZGYlrAqX+F1FFzBMpzOQYdLPk8IP+Mfdp3JJga5ehNdidiOprdUThhCVYFA==@nongnu.org
X-Gm-Message-State: AOJu0Yzh1fRkwsYrxldXU1sB6SKwHXIqxEC3IDi618c1IasNCDbvRJlU
 EZe/1tE1B7brgbdrUDnDSLOYsZ9xdm61A/7dEKUy/na+ygagkpSQujhOwQiuN+2df2GeLPwh/aO
 iCy4nkdGXL/4xJlY0v12M4yY4pyOG99aCF1zdOObrjQ==
X-Gm-Gg: AY/fxX4+JEUobq9uXcVjq/NfHQxywrLqDTe1eichb3yP43BDTw6WPjxgFv6PEPXi8/v
 Dtu50QNqWc+M16ebWR2OyQRoqtRm0iwz8VPbb67+oyCMJCYtGmD9H2MFWMRVba10EHD8eC0qVtX
 mGxUrPKm627mB1+YIKm61MswiQg2cXnGLrHu+b4pg8zWlX5mrwkifZBdNvnBP+3jJCIvTrIppHZ
 0AWrUBfQsMXR+c2i/kRmBOmlBfjitxOSgaZieYOvv9XNzIdKAU5VoMoq3wcPjrh1aivSFet0aRd
 jtpf3ROgT7IlGhb/0cmMhXQ=
X-Received: by 2002:a05:690e:d5a:b0:644:60d9:866d with SMTP id
 956f58d0204a3-64901b2fc83mr3986656d50.94.1768489172949; Thu, 15 Jan 2026
 06:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
 <20251204093502.50582-15-corvin.koehne@gmail.com>
In-Reply-To: <20251204093502.50582-15-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 14:59:21 +0000
X-Gm-Features: AZwV_Qi4YPYBHEkKF0YAXAzTIEMPZ14dQhaGQgrhS_b2z_PPlMbio1ogoSx6BPk
Message-ID: <CAFEAcA82FoVFwmoj2CrBK_bjzQ52NxrUYKcZrVYw6Dx2yJfLFQ@mail.gmail.com>
Subject: Re: [PATCH v5 14/15] hw/arm: Add new machine based on xilinx-zynq-a9
 for Beckhoff CX7200
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, 
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Thu, 4 Dec 2025 at 09:35, Corvin K=C3=B6hne <corvin.koehne@gmail.com> wr=
ote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Introduce a new machine type 'beckhoff-cx7200' that inherits from the
> xilinx-zynq-a9 machine. The CX7200 is an industrial PC based on the
> Xilinx Zynq-7000 SoC.
> The machine preserves all standard Zynq features (boot-mode selection,
> SPI, UART, Ethernet, etc.) while adding CX7200-specific hardware
> components.

> +    /* Find A9MPCore and set timer frequencies directly */
> +    a9mpcore_dev =3D DEVICE(object_resolve_path_type("", TYPE_A9MPCORE_P=
RIV,
> +                                                   NULL));
> +    if (a9mpcore_dev) {
> +        a9mp_priv_state =3D A9MPCORE_PRIV(a9mpcore_dev);
> +
> +        /* Direct struct access - devices are already realized */
> +        a9mp_priv_state->gtimer.freq_hz =3D CX7200_PS7_CPU_CLK_FREQUENCY=
;
> +        a9mp_priv_state->gtimer.periphclk_divider =3D CX7200_PERIPHCLK_D=
IVIDER;
> +        a9mp_priv_state->mptimer.freq_hz =3D CX7200_PS7_CPU_CLK_FREQUENC=
Y;
> +        a9mp_priv_state->mptimer.periphclk_divider =3D CX7200_PERIPHCLK_=
DIVIDER;
> +        a9mp_priv_state->wdt.freq_hz =3D CX7200_PS7_CPU_CLK_FREQUENCY;
> +        a9mp_priv_state->wdt.periphclk_divider =3D CX7200_PERIPHCLK_DIVI=
DER;

You shouldn't be reaching inside the device's private state
struct fields like this -- please find another way to
configure it with the correct frequency info.

-- PMM

