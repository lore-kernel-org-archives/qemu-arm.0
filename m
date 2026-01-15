Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132EDD41175
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Jan 2026 11:36:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgLeF-00062W-Vq; Thu, 15 Jan 2026 06:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vgLe7-00056e-Ey
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:36:13 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vgLe1-0004jE-FX
 for qemu-arm@nongnu.org; Thu, 15 Jan 2026 06:36:09 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso2846905e9.2
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 03:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768476963; x=1769081763; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ycDPsCwNaASY+uQrnGAoedQ8DFHm06IPlbqpqkvxwq4=;
 b=soKRfz7v0eGp59Pa4W7O+LE+IPcOmbswrvl0G0ZXx/oYjCa+V93PMp/wDMz5nKOVKG
 F1rLII5E+b4XkRgU3YzYyrn8wg+R8g3Mly15w8Dg6/oHcSf0GNt+fPr4sC5V/AJupxKT
 PGVICyeo+ao3l1MKr7ow7nj557bcOAdzzi8kdMQ8fvt6KGk1YNn2XJvZBQORbSdwsPWM
 2AFiX0fjd4jTtRPxH8X/ndU3uwdUpjuJ5I6Zytx9hxWzBVAW7et0T62gCh168PISd1bx
 JU79SRXW07dYc8LQFGSEnGOwCP4OUle3Q7lXfSmboDSfTK8WwPM/hkZ2bstNDdS3sDWm
 ob2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768476963; x=1769081763;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ycDPsCwNaASY+uQrnGAoedQ8DFHm06IPlbqpqkvxwq4=;
 b=NViJTK1zmjTzmZhUq9TSi8p+AoyLberrNoCHAB0pmFJWkoffJKk7J747Zi9P3RGLPb
 5PL5VkN/Punwta0d6uXntzblMIdvHIoMSxW3KHf2Oe//ChPF5S6vw5ak6oYOW566nFB7
 CwcNlxU/cftfmDqejHwg8C2Ey9yFW+Umt14csSHtbuqJb92SGAU6gJzxIuniey/fuzvL
 4RIqzq8SBVWS/mueRiKvUcr+oQNfFTPppWnCCD5cjOHdNk63k/NzJzyOvfdVFkDGtnvB
 f9Dg/ViutqMCoHeRfgiodMLx2NspBY6YPfimJGs0HieVwxXJp8/wauKI2gdOO9uty3Ww
 lUeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDfyRD4f/agzbzn2fIP0tGPiaRh1hN/ZjpM+xxd7HqLBtmgBFQ8Y0jaMIutJgadqIvPHinLeEJaA==@nongnu.org
X-Gm-Message-State: AOJu0Yw64pD5GXeEi6GUsj7TEgoXuDJlo66zmo28YV1HOC8ZIKEBtxtG
 bSBlifFSPtTSamV8rZ78iZ+2JEeTHMvR7Qg29hV/PXmqdAFS2qTRDztjp7X1PPw/VvY=
X-Gm-Gg: AY/fxX6iq6SUGnwg4JCct84pfRnNjoDJ90VoAB7aSctCB/SCqoezkOEmtbIB+5+jtI6
 kPHBzII8JiXRwZOywzI4wdaY2Nnrzv6SD2Py6EbI+R8lI/Tsqig5dWXDZPLnEOy0i5OW/wfV+EM
 ib2ESzNGxG5bdN6LjvTX+e6PixD45otK9zEQ14KqOtnEkqcn0kbJdLRYQchEYq1HzwQIWg2NwCt
 w5l3I3nkHsxlJiVw8cmMBsJ5Hx+GWyqSrVA2oxMhNoTMlY3BMGd/cV3XhdiKkthX+vd8VH/d36y
 6ReIVxw5T3bvLPaPUqIYnRt+2eeiApghS9pRlqawmrez9yJiTk7mviEfcScnPodm9bjztsGu7Gj
 77AtO/fYHEF7+sjwL2icUi1eZuMYflKkNNSkbyneB5Et6NPbR0Aardwi6c54YNAnAbURXgWwo2a
 cANkqBmd6nk/U=
X-Received: by 2002:a05:600c:c4b8:b0:471:1765:839c with SMTP id
 5b1f17b1804b1-47ee3394887mr65697325e9.20.1768476963188; 
 Thu, 15 Jan 2026 03:36:03 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ee0b48921sm47019475e9.0.2026.01.15.03.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 03:36:01 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 530E05F7DD;
 Thu, 15 Jan 2026 11:36:00 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Corvin =?utf-8?Q?K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,  "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Alistair Francis
 <alistair@alistair23.me>,  qemu-arm@nongnu.org,  Peter Maydell
 <peter.maydell@linaro.org>,  Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org,  Corvin =?utf-8?Q?K=C3=B6hne?=
 <c.koehne@beckhoff.com>,  Hanna
 Reitz <hreitz@redhat.com>,  Yannick =?utf-8?Q?Vo=C3=9Fen?=
 <y.vossen@beckhoff.com>
Subject: Re: [PATCH v5 15/15] docs/system/arm: Add support for Beckhoff CX7200
In-Reply-To: <20251204093502.50582-16-corvin.koehne@gmail.com> ("Corvin
 =?utf-8?Q?K=C3=B6hne=22's?= message of "Thu, 4 Dec 2025 10:35:02 +0100")
References: <20251204093502.50582-1-corvin.koehne@gmail.com>
 <20251204093502.50582-16-corvin.koehne@gmail.com>
User-Agent: mu4e 1.12.15-pre1; emacs 30.1
Date: Thu, 15 Jan 2026 11:36:00 +0000
Message-ID: <873447jefz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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

Corvin K=C3=B6hne <corvin.koehne@gmail.com> writes:

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
> +The Zynq 7000 family is based on the AMD SoC architecture. These products
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
> +
> +The CX7200 supports following devices:
> +    - A9 MPCORE
> +        - cortex-a9
> +        - GIC v1
> +        - Generic timer
> +        - wdt
> +    - OCM 256KB
> +    - SMC SRAM@0xe2000000 64MB
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
> +    - I2C
> +
> +Running
> +"""""""
> +Directly loading an ELF file to the CPU of the CX7200 to run f.e. TC/RTO=
S (based on FreeRTOS):
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M beckhoff-cx7200 \
> +        -device loader,file=3DCX7200_Zynq_Fsbl.elf \
> +        -display none \
> +        -icount shift=3Dauto \
> +

Is icount actually required for running? Or does it just affect the
fidelity of performance counters?

> +
> +For setting the EEPROM content of the CCAT provide the following on the =
command line:
> +
> +.. code-block:: bash
> +
> +        -drive file=3Deeprom.bin,format=3Draw,id=3Dccat-eeprom
> +
> +The size of eeprom.bin must be aligned to a power of 2 and bigger than 2=
56 bytes.
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index a96d1867df..e634872b97 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -82,6 +82,7 @@ Board-specific documentation
>     arm/aspeed
>     arm/bananapi_m2u.rst
>     arm/b-l475e-iot01a.rst
> +   arm/beckhoff-cx7200
>     arm/sabrelite
>     arm/highbank
>     arm/digic

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

