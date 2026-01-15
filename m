Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8619ED41179
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 11:58:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgLyy-0002w4-I1; Thu, 15 Jan 2026 06:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgLyv-0002tk-Cn
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:57:42 -0500
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vgLys-00044q-D5
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:57:41 -0500
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-790b7b3e594so7058707b3.3
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 03:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768478252; x=1769083052; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhSQBKfxXI2WsQjOVZiYLAiw51bdDJWmLOFxmvaZu5g=;
 b=WSF8uMykznuMrV8KcA6V01i5Wy5gczge6rB7ALAlBr14G5xxHQItngdaIP7DvJE6LK
 dEH4VFTsVzOeudbITp3a1bCPvrl0Nwurn1ZLAnBpXpym9ydW1wRKOMSG09D0ScoTa0CC
 wdPvwrqVPxVucwDuPv6JyeIPxs/2EHHt0DWi2mzn+nUyoFhIo0FX6G1unRVd5XxMHUis
 JGpgedqLFDhCqCkOrr4F5K0dwApZJKrjcJG8XCdsjrLYBCqkgZlz8QPhV2bxSXyFGO83
 IDIuRwET1S6K3GmOfLjTqvGbV4ITWL9PtwwtT4qdxf8+au+N6+o0FSPZH8o1bSR7ixSM
 SryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768478252; x=1769083052;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hhSQBKfxXI2WsQjOVZiYLAiw51bdDJWmLOFxmvaZu5g=;
 b=OORaaA/iKFVQ21E2FsA6QcrXSIcsNLY7hCxmshno5DKX8/nVetvHhlzJ736iDgVYiL
 2baZVWFJVrypFiPKhrD0ZIPqT+/1sjO1MlpcDhgjbh0HMuxFkZtyVoNNwQY6PcEU+yAD
 2cpN3ip+XICc3tEL9YMtSyXMKY3giXm1GXjm79wLTq5tiTV6j9w0/HLQ2Tzd8THYGtSF
 xJe7Gatx2O6iSl+PNA7a93EvfjEixVdf3nlUPxePB66fR6m6OV5J93LoL0290V+Y+fW7
 nxYmTiQ+PLiCtazBgz3M/fU0o4jcJmrNtdA5m1gz61znq8KwF7RTkMelIrVzdgJ8V3Vj
 IjAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3HByGBvuw7qQekSnx7P+vhUu6i+MOFcCLfqgLadSrMqJIvJQ5YHasymXvXIwVRPKylUGtqsYlvw==@nongnu.org
X-Gm-Message-State: AOJu0YwsE3BN8QxK9doWhYfLBy5byfp5MISYmVDJs1KjigSXlG+WwUWx
 7qInXlo8Qia3GtDNRozraY8WLfX7RC+apPtumEQquBmxbk3Twss2dkVQ78o/U0BAX9qnT9HSFYt
 hzQ4mmXEeUoqjgYeCtGZuJSObBDLipfr5kYMVucCQFw==
X-Gm-Gg: AY/fxX5oCrYft2OtlhhIh7Aql3APsZJPN5h1ZN1Ru92dPxQuj09TOch1BrvZM/etl1O
 mOKU83tqrGgyrWV2jEaWeWMkKecpBY0iQoX3X4pm1zhcVw/YlxWNq31M/BhDT502fyGO7dIpQ/6
 nj20oh6SP+ahpbwIvSC3XwDUV1h5yBREUQJAzbI1BOJ/UeaS5QC+M/6uzLTVrP/MOjhJT/61M+g
 ZZYWhAu2iSr5Km52cuwd+BDIeBqIQCrwtEreP1GcLxiAPnFPNKRqx9x0RfO2alYIOXAGlARu6nq
 j/ixJ7istke9yTQwbiG2fyE=
X-Received: by 2002:a05:690e:1898:b0:646:ba5e:4cf4 with SMTP id
 956f58d0204a3-64903b45b26mr4252154d50.51.1768478251501; Thu, 15 Jan 2026
 03:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
 <20251204093502.50582-16-corvin.koehne@gmail.com>
In-Reply-To: <20251204093502.50582-16-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jan 2026 11:57:20 +0000
X-Gm-Features: AZwV_Qg2qS95djnbs1LQP81AeoC4hcz9OBzeKUlAiFOlXgF8vAqjY1OMyOaxDBE
Message-ID: <CAFEAcA-fU1qxTCoHaEQfGOmPPHyFL2Q74DXvLyti+28xe2bM+Q@mail.gmail.com>
Subject: Re: [PATCH v5 15/15] docs/system/arm: Add support for Beckhoff CX7200
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
> This commit offers some documentation on the Beckhoff CX7200
> qemu emulation.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---
>  docs/system/arm/beckhoff-cx7200.rst | 57 +++++++++++++++++++++++++++++
>  docs/system/target-arm.rst          |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 docs/system/arm/beckhoff-cx7200.rst
>
> diff --git a/docs/system/arm/beckhoff-cx7200.rst b/docs/system/arm/beckho=
ff-cx7200.rst
> new file mode 100644
> index 0000000000..f060319b0f
> --- /dev/null
> +++ b/docs/system/arm/beckhoff-cx7200.rst
> @@ -0,0 +1,57 @@
> +Beckhoff CX7200 (``beckhoff-cx7200``)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +The Beckhoff CX7200 is based on the same architecture as the Xilinx Zynq=
 A9.
> +The Zynq 7000 family is based on the AMD SoC architecture. These product=
s
> +integrate a feature-rich dual or single-core Arm Cortex-A9 MPCore based
> +processing system (PS) and AMD programmable logic (PL) in a single devic=
e.
> +The Beckhoff Communication Controller (CCAT) can be found in the PL of Z=
ynq.
> +
> +More details here:
> +https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/Zynq-7000-SoC-Techn=
ical-Reference-Manual
> +https://www.beckhoff.com/de-de/produkte/ipc/embedded-pcs/cx7000-arm-r-co=
rtex-r/cx7293.html

This doesn't render very nicely in the HTML documentation,
because it comes out as two bare URLs with no line break
between them. Can you write this as something which uses
the rST syntax for links, please, e.g:

You can find more detail about this board on
`the manufacturer's product page <https://....>`__.
The SoC is documented in the
`Zynq 7000 Technical Reference manual <https://...>`__.

Also, is there an English language version of the product
page? Since QEMU's documentation is in English that would
be the better link if it exists. Otherwise we should warn
the reader by adding "(in German)" when we point them at it.

> +
> +The CX7200 supports following devices:

"the following"

> +    - A9 MPCORE
> +        - cortex-a9
> +        - GIC v1
> +        - Generic timer
> +        - wdt
> +    - OCM 256KB
> +    - SMC SRAM@0xe2000000 64MB

The "SRAM@0xe2000000" renders as an email address hyperlink,
which probably isn't what you intended. I don't think the
address of the RAM is particularly important to the reader
of the docs, so we could just omit it.

For docs changes, I recommend making sure your build
is building the docs by passing --enable-docs to configure.
Then you can look at the HTML that is generated in your
build directory under docs/manual/ to check that it hasn't
come out with any unintentional markup issues

> +    - Zynq SLCR
> +    - SPI x2
> +    - QSPI
> +    - UART
> +    - TTC x2
> +    - Gigabit Ethernet Controller
> +    - SD Controller
> +    - XADC
> +    - Arm PrimeCell DMA Controller
> +    - DDR Memory
> +    - DDR Controller
> +    - Beckhoff Communication Controller (CCAT)
> +        - EEPROM Interface
> +        - DMA Controller
> +
> +Following devices are not supported:

"The following"

> +    - I2C

thanks
-- PMM

