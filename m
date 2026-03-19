Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE31088E62
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Mar 2026 01:44:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w32Qp-0004uD-Jb; Wed, 18 Mar 2026 21:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w32Qo-0004tv-B3
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 21:44:14 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1w32Qm-0006uj-Gu
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 21:44:14 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b97b7e0368eso55069266b.3
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 18:44:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773884650; cv=none;
 d=google.com; s=arc-20240605;
 b=KXmgyX5kzQvWF+4AIT8+/QR8NGrA0INFfbsllgQmFclO3iT1f/voSLb4iXN8e/0beX
 AwkceeF/Xd3wBpqBNK/YqjZTT9eebc5x0hL+gpyrVCvyak5mNqHNIYy7PDz19a1/ouK5
 1d9Ns+dKb4Pwh1J0ZvM/cItHOV4WGsICLXmkE9GFB6uDK9jeiIuK7ZCKW8FSAtv1eQmd
 DGhWingZIEdl8jSgiRKWuDvvEv7mkFzvDQdyf/T6QbKNX+191mwQKpFpBMeAMH3l2Bvf
 raSb4dMnM9eLIisz4PLFtpzmq0bjSlEUqMUTKL8g+RptrTNGHHsQyRYffBj1e7SF8OoS
 pojA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zPABj/ZH6U7RBqZofFfksVIr97NrQwgix9d6mOzviSM=;
 fh=2miRkoe7XpQ6/1WnjR1FxyJBAO/sFu+5iRnaYCNUE0k=;
 b=hJJN271uhjewezGW9sg/UfSRuvTciOPscnqzmdFQi7r+ez6BC04R1fzgLyjGZin/wr
 dESvXU8TZTQU9yVts7prukwqbYSaO35YjmrveWhq89NuG2Uf0NMVobqwsctBJ+XMJtWd
 s/3X9hnf+QeU0vHhsHgPZXz3S9W4ewnJ5Re9hzf7guGroUpPWumSfWQLEAC6UYwgN4Hq
 zROu8tbec4L5594Lv7n+3zV9Nj6hKDAeMN0dLVy0lsdBb8/NgxnzX+bluAB33SVv2+FA
 NC0REtN5HkxnEBh1JpUBF9pi6x+rcOTqmH4Y5aOrpwep2TG39jjBjeuDZvcZKfnSH8RQ
 weZQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773884650; x=1774489450; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPABj/ZH6U7RBqZofFfksVIr97NrQwgix9d6mOzviSM=;
 b=d/5tsNvEixGNNjrZFAB0ED2u9BN/psU/9MNdUEv7qpKI8x9o18ud38oYouRejacUvk
 VkbPCOZ+k8Za9y824+K/dliVDxZPQ17S5zXxddLJCX8jyuStLkdbAY8St1RVgn+vuoKU
 i3Xxmgf1MnsY1+yOhAXzREfCN4eRCMRqwa8MEi/PkKvcmrmdhPwNzxLsbqQsmkMoOI4z
 XvhcUxG8cvd1MmVQX3piWo/dRoLSwpJR0dDB5vdEZldSUOYhWspbbVdCEvYqqLlRFzlt
 B+N1QmN5LWkAO/8XnJIuUuhAUhO0eP1fAM4hsqodYXDmz+Wc6QsJBdQHhfHwMD3lnkXx
 DwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773884650; x=1774489450;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zPABj/ZH6U7RBqZofFfksVIr97NrQwgix9d6mOzviSM=;
 b=aQvxWYgvforR6/Y2tJLdoj56vjL5p6xQdP1ozY35hwZu+b1uj+Ddhmqv3vjW1eS+02
 yHBY925iNRnJus3DtEGbPND4qh0VGqQuFKrPWYPOXrj05E12MxO92RtC83ZyuPfqc8mg
 NCTtwS/pA6vw9kLRxBTTJ+aJ1pvn3/rvkg2o+KcNqIzOevjJQz6zO8+f3JKnQ+179luz
 pPsm+9f3ViY7wIhBcsWXwU6LOU3VaUy7ZkeavPkma6KZa4uHCGG+Jw/kFvTR2ubiePV8
 ERPqf+Dhiq+OsjuwWOdaHMryLoikdye7ra+/RYJd+UiD559W34k5lWOP0hEw9bDuHEWo
 gYSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWGPekzigR95uvEDhAVZg0VrEijY6X7bbG3BBM6xj7AHkibx1+Qat02ygpkHV/G8LbfIbERkmhrg==@nongnu.org
X-Gm-Message-State: AOJu0Yybn5rxk+0wMC9Dea8cqXSz9Pvl75o63faHYh1BMsOTAs+hcG0F
 ie8nG27ZPXHL5qkC+jCVm4+YdB4H4dtaR7GqC3SOMWZoaajMpMkW4yLEamHnIZmm3/0Ij6SQxXE
 ootk+gDlUCjlJ6tg69OPKV+SjSc7a9Jr9Id22
X-Gm-Gg: ATEYQzxceIsGM97MPO+q2EAosoQUjuM+WNxxbSmNASjQwzKtXJ0dJH14/FF3H+gunSt
 VHyHqyjIWfV6pZDB5yth4IkohA/6TCVAOBojviK0exVImW2TM5B1WZCIDQWQvObBisfrPzDad+n
 BmsdIxLDOZZptAc/X/Xnj8L6CNXjuwqgMyPY2SbxnNqBRUROyla1awRdMhNCVN/PJ3YeItIt14h
 xjtHYUrGqaXtRPZ5iExupvhEAKmo8+7aHA8KxBhKg3WzYj2Mxs8b3CVdfDnaxV36XwnYQWmxqJR
 ztMYfTQ9OvBZTX4VS2tWJyBc7PMeFLHiRJmAm7/cz/DeeJvv
X-Received: by 2002:a17:907:3fa2:b0:b93:3792:4b03 with SMTP id
 a640c23a62f3a-b97f4a7e7e1mr310986266b.32.1773884650142; Wed, 18 Mar 2026
 18:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260318103122.97244-1-philmd@linaro.org>
 <20260318103122.97244-2-philmd@linaro.org>
In-Reply-To: <20260318103122.97244-2-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 19 Mar 2026 11:43:43 +1000
X-Gm-Features: AaiRm51MxuAk7Nqv-ibJSXLy2B_mtFPvwBtnFUFSOSRywnr7-vYBG3Pb_zO_XWI
Message-ID: <CAKmqyKMNXkcZcknHEYWbFWKb0KduWLXdeW-mZErY1q7EJrp+hg@mail.gmail.com>
Subject: Re: [PATCH-for-11.1 01/16] hw/riscv: Mark RISC-V specific peripherals
 as little-endian
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Weiwei Li <liwei1518@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Warner Losh <imp@bsdimp.com>, 
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?= <frederic.petrot@univ-grenoble-alpes.fr>, 
 Vijai Kumar K <vijai@behindbytes.com>, Anton Johansson <anjo@rev.ng>, 
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-riscv@nongnu.org, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alistair23@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Mar 18, 2026 at 8:34=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> These devices are only used by the RISC-V targets, which are
> only built as little-endian. Therefore the DEVICE_NATIVE_ENDIAN
> definition expand to DEVICE_LITTLE_ENDIAN (besides, the
> DEVICE_BIG_ENDIAN case isn't tested). Simplify directly
> using DEVICE_LITTLE_ENDIAN.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/char/ibex_uart.c     | 2 +-
>  hw/char/shakti_uart.c   | 2 +-
>  hw/char/sifive_uart.c   | 2 +-
>  hw/misc/sifive_e_aon.c  | 2 +-
>  hw/misc/sifive_e_prci.c | 2 +-
>  hw/misc/sifive_u_otp.c  | 2 +-
>  hw/misc/sifive_u_prci.c | 2 +-
>  hw/riscv/riscv-iommu.c  | 2 +-
>  hw/sd/cadence_sdhci.c   | 2 +-
>  hw/timer/ibex_timer.c   | 2 +-
>  hw/timer/sifive_pwm.c   | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
> index 127d219df3c..26ed1aea140 100644
> --- a/hw/char/ibex_uart.c
> +++ b/hw/char/ibex_uart.c
> @@ -470,7 +470,7 @@ static void fifo_trigger_update(void *opaque)
>  static const MemoryRegionOps ibex_uart_ops =3D {
>      .read =3D ibex_uart_read,
>      .write =3D ibex_uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/hw/char/shakti_uart.c b/hw/char/shakti_uart.c
> index 2d1bc9cb8e2..d38920a03a0 100644
> --- a/hw/char/shakti_uart.c
> +++ b/hw/char/shakti_uart.c
> @@ -103,7 +103,7 @@ static void shakti_uart_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps shakti_uart_ops =3D {
>      .read =3D shakti_uart_read,
>      .write =3D shakti_uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl =3D {.min_access_size =3D 1, .max_access_size =3D 4},
>      .valid =3D {.min_access_size =3D 1, .max_access_size =3D 4},
>  };
> diff --git a/hw/char/sifive_uart.c b/hw/char/sifive_uart.c
> index af17cf9a6ce..4e31842df5c 100644
> --- a/hw/char/sifive_uart.c
> +++ b/hw/char/sifive_uart.c
> @@ -206,7 +206,7 @@ static void fifo_trigger_update(void *opaque)
>  static const MemoryRegionOps sifive_uart_ops =3D {
>      .read =3D sifive_uart_read,
>      .write =3D sifive_uart_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/misc/sifive_e_aon.c b/hw/misc/sifive_e_aon.c
> index e78f4f56725..ff2a7c18235 100644
> --- a/hw/misc/sifive_e_aon.c
> +++ b/hw/misc/sifive_e_aon.c
> @@ -250,7 +250,7 @@ sifive_e_aon_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps sifive_e_aon_ops =3D {
>      .read =3D sifive_e_aon_read,
>      .write =3D sifive_e_aon_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/misc/sifive_e_prci.c b/hw/misc/sifive_e_prci.c
> index 400664aabae..a4a60e7b406 100644
> --- a/hw/misc/sifive_e_prci.c
> +++ b/hw/misc/sifive_e_prci.c
> @@ -75,7 +75,7 @@ static void sifive_e_prci_write(void *opaque, hwaddr ad=
dr,
>  static const MemoryRegionOps sifive_e_prci_ops =3D {
>      .read =3D sifive_e_prci_read,
>      .write =3D sifive_e_prci_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/misc/sifive_u_otp.c b/hw/misc/sifive_u_otp.c
> index 7205374bc39..cececd4f7a8 100644
> --- a/hw/misc/sifive_u_otp.c
> +++ b/hw/misc/sifive_u_otp.c
> @@ -187,7 +187,7 @@ static void sifive_u_otp_write(void *opaque, hwaddr a=
ddr,
>  static const MemoryRegionOps sifive_u_otp_ops =3D {
>      .read =3D sifive_u_otp_read,
>      .write =3D sifive_u_otp_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/misc/sifive_u_prci.c b/hw/misc/sifive_u_prci.c
> index f51588623ab..4674d5925ea 100644
> --- a/hw/misc/sifive_u_prci.c
> +++ b/hw/misc/sifive_u_prci.c
> @@ -112,7 +112,7 @@ static void sifive_u_prci_write(void *opaque, hwaddr =
addr,
>  static const MemoryRegionOps sifive_u_prci_ops =3D {
>      .read =3D sifive_u_prci_read,
>      .write =3D sifive_u_prci_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .valid =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4
> diff --git a/hw/riscv/riscv-iommu.c b/hw/riscv/riscv-iommu.c
> index 98345b1280b..ef5d7df2385 100644
> --- a/hw/riscv/riscv-iommu.c
> +++ b/hw/riscv/riscv-iommu.c
> @@ -2375,7 +2375,7 @@ static MemTxResult riscv_iommu_mmio_read(void *opaq=
ue, hwaddr addr,
>  static const MemoryRegionOps riscv_iommu_mmio_ops =3D {
>      .read_with_attrs =3D riscv_iommu_mmio_read,
>      .write_with_attrs =3D riscv_iommu_mmio_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 8,
> diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
> index d576855a1a8..8476baf67fb 100644
> --- a/hw/sd/cadence_sdhci.c
> +++ b/hw/sd/cadence_sdhci.c
> @@ -122,7 +122,7 @@ static void cadence_sdhci_write(void *opaque, hwaddr =
addr, uint64_t val,
>  static const MemoryRegionOps cadence_sdhci_ops =3D {
>      .read =3D cadence_sdhci_read,
>      .write =3D cadence_sdhci_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl =3D {
>          .min_access_size =3D 4,
>          .max_access_size =3D 4,
> diff --git a/hw/timer/ibex_timer.c b/hw/timer/ibex_timer.c
> index ee186521893..0f12531934d 100644
> --- a/hw/timer/ibex_timer.c
> +++ b/hw/timer/ibex_timer.c
> @@ -234,7 +234,7 @@ static void ibex_timer_write(void *opaque, hwaddr add=
r,
>  static const MemoryRegionOps ibex_timer_ops =3D {
>      .read =3D ibex_timer_read,
>      .write =3D ibex_timer_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .impl.min_access_size =3D 4,
>      .impl.max_access_size =3D 4,
>  };
> diff --git a/hw/timer/sifive_pwm.c b/hw/timer/sifive_pwm.c
> index 780eaa50799..4f4f566cd4b 100644
> --- a/hw/timer/sifive_pwm.c
> +++ b/hw/timer/sifive_pwm.c
> @@ -388,7 +388,7 @@ static void sifive_pwm_reset(DeviceState *dev)
>  static const MemoryRegionOps sifive_pwm_ops =3D {
>      .read =3D sifive_pwm_read,
>      .write =3D sifive_pwm_write,
> -    .endianness =3D DEVICE_NATIVE_ENDIAN,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
>  };
>
>  static const VMStateDescription vmstate_sifive_pwm =3D {
> --
> 2.53.0
>
>

