Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp1464825njn;
        Sun, 12 Jan 2025 15:43:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjktxMq3dUM1esMUKqGfqGXrRz6wiBLq4RDkkRvDr2ecpLgvBjcEbvWm/CzRy4snnuPqEuPAxb+Nj3pg==@linaro.org
X-Google-Smtp-Source: AGHT+IGvNTQisbSCmj8fK23PmihC/gxzZUz+FOT7jhv15ujivwayY2CUeXmxqv64+zMha5linsQa
X-Received: by 2002:ad4:5748:0:b0:6df:99f7:a616 with SMTP id 6a1803df08f44-6df9b1cdc5emr273470016d6.2.1736725428727;
        Sun, 12 Jan 2025 15:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736725428; cv=none;
        d=google.com; s=arc-20240605;
        b=hB0rdfGSs6wpMTJ2A5SjztVDex1gpIyzg4wvYMkemmKxLgJfMW3E0+jRSothnFxiSY
         fpxS3B8b6Op2RGU9SyFrlmI8DQKzFeQ8o4zH12GNO8BA8TkeCuPY20VjQ39SUgDxTAsy
         +i/XZP/8EVN8b6BVYHxTb0oOUecwLkFf9oIYb2qS5+8miokx9kVXMny6YBjVBDiWZC4J
         pHMmtpCsfQ/aCJNs2BJXkBJ/+kxCcJPrYjQiU0xr9DMTFANbsf789pZ+J4A1Y/UjNo4k
         Y0vFow0BIRrannOGV6p9/71s32A0uI9XtB1WN3Ux9RJOUTnzZq28XfOK02IxjBjXB9EI
         B7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0/DFP6yJ/sumZjVXldmaiLNXJ7Xf54Lp9fI8av/ELsw=;
        fh=vELSBuuetKq8xQoq5ogoBxWloPwtjtNYEe6IBNg9kWw=;
        b=K6StRSNiaILnY1NpN5U6Tu03mPSNBEqhY0gf3RhPWBK+GhHMn+nt7w9s4vPj/RP1jz
         E+VBlZnPol+8gAe9IMSyPUJzRPtZKvHrN5uWL/gky86gKDzQrYxFiU2agOadxuJ7kOYZ
         K20NTrIKhkrQtCZrMdpWik5sBoQgaVkjW+UpntCmSxu3X4mKKkAo3PNHnCYSGfMAPl1u
         wHKy07PM2OM0eNahYsGRaiqbnndKIVuzDp6+GF20s05U6t4r+rhxN9QDHTFxr0qr0sDw
         hy4W9kW1JVyzbdh8nRGhRYYCYE8t8MDn6ETfsTrPEDoegt1cg2BeHKVZ2Ys+gm/38wJn
         DWng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QxhGKtP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfae02609asi78424766d6.486.2025.01.12.15.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Jan 2025 15:43:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=QxhGKtP6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tX7c4-0001Ux-W6; Sun, 12 Jan 2025 18:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1tX7c1-0001UX-Q4; Sun, 12 Jan 2025 18:43:21 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1tX7bz-0007Ng-PH; Sun, 12 Jan 2025 18:43:20 -0500
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-518a52c8b5aso1207725e0c.2; 
 Sun, 12 Jan 2025 15:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736725398; x=1737330198; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0/DFP6yJ/sumZjVXldmaiLNXJ7Xf54Lp9fI8av/ELsw=;
 b=QxhGKtP65qOZFYKa5YurdUoN02lAJaWobpMkZxbfMKvURQf4KP4apV646af7T3N/43
 RNQRJzH66QN6JCBrhNaS4HyLQ8yHwTLZBlS8hhl9kvBz6B8ibM/5zo4eaQ241qY0vkT+
 4dSD0dzvJobsI8LvvCleaOT4f9aZnYo37gTIo37P+fi/d5DXKoKHctSC3H2ehnPUC9oP
 BRgtLjtdxgBMnF2RjEF/1Jbnn4Gja70GtMqv7XYDeaTpuDxRW8OfHgMrADZ+T/XezG0h
 wTvgtnaCL6UGcTV2BgFbixtmajIlNjOjydraRSrtM1yNVYjjPLFtO9ddMmG9eJ7yeMSk
 QPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736725398; x=1737330198;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0/DFP6yJ/sumZjVXldmaiLNXJ7Xf54Lp9fI8av/ELsw=;
 b=HCJTvLewKyDrKlnXcrN9VfBqDXqOjZDvfs2OH4IhloQ74j0ZtxmKME+Z/Axnxd5NXT
 EPF/21FZkaZ23BUr1+W2Zex/NljJkNo61/9+F2O/X5wZYUVMV2gDKxpA4YgxhrXYjktN
 Eh3drv/N/V7UFh0QGERbotgD42zksfMYWDmP5Msf9SdR+1MIFIo7yUFuQo4FTTIgJfF2
 Kdlbqyt7YZL96FCDsQxVimt3m/9GHLsDcTcZ/FB/i6JkVERDaQkdkR+vwAtapqaorqwx
 K2rLgsIbkk/svXd8UxOvDd6FPfAMM9U4hmkFEjoF8QtsC4/zaxVN4q0hD4Uu25B8FG8t
 ZyWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUByUMZ0ns0eqtMKSjZFagNE40WjQfxuY/43rDt9qkaWQ2rP3OVn/gtROyZrebXleKhYLdxTJHP2g==@nongnu.org
X-Gm-Message-State: AOJu0Yw7TKvxzYkfXV+21tKZjGn8cbKqx17c5smSPdgxVTJLcazoImcF
 Yk5BXCiovAML939wHyqyrxPMT6LevNti24F8NToJNl4eR9K2qpeFNztLmGv6yTeL4ZfnI/dqf0L
 JbhY3UZ/e92y5WnPBOaGzNJ1WV9M=
X-Gm-Gg: ASbGnctDZPRvzzZ/XJK89LeXwSYq/8cvdc3XnE3zDeEbdFG3RA/6wz/Oer1ZGP0rgd+
 r19Opsxk/HhAQxkHXnb5zeSYosgko1t6AYNPkw9wfeJSi7oFlY/8A4bJFzDsKR+1jozc=
X-Received: by 2002:a05:6122:50b:b0:50c:9834:57b3 with SMTP id
 71dfb90a1353d-51c6c46b338mr16503853e0c.4.1736725398238; Sun, 12 Jan 2025
 15:43:18 -0800 (PST)
MIME-Version: 1.0
References: <20250112225614.33723-1-philmd@linaro.org>
 <20250112225614.33723-3-philmd@linaro.org>
In-Reply-To: <20250112225614.33723-3-philmd@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 13 Jan 2025 09:42:52 +1000
X-Gm-Features: AbW1kvZT0RufijVamFGSdjzbi5Z--_YeeC4jQQHEcLlwpM4mOdBeTqK0QlMUEfs
Message-ID: <CAKmqyKPhDpHM68qKpr=6UrQ4z_md9kdqdRA-FamyxZgZyXCzJw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/arm/stellaris: Add 'armv7m' local variable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <sam@rfc1149.net>,
 qemu-arm@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, Felipe Balbi <balbi@kernel.org>, 
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, 
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=alistair23@gmail.com; helo=mail-vk1-xa30.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PCu3my3dPILC

On Mon, Jan 13, 2025 at 8:57=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> While the TYPE_ARMV7M object forward its NVIC interrupt lines,
> it is somehow misleading to name it 'nvic'. Add the 'armv7m'
> local variable for clarity, but also keep the 'nvic' variable
> behaving like before when used for wiring IRQ lines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/stellaris.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 1bba96df14e..7303e096ef7 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1031,7 +1031,7 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
>       */
>
>      Object *soc_container;
> -    DeviceState *gpio_dev[7], *nvic;
> +    DeviceState *gpio_dev[7], *armv7m, *nvic;
>      qemu_irq gpio_in[7][8];
>      qemu_irq gpio_out[7][8];
>      qemu_irq adc;
> @@ -1095,19 +1095,20 @@ static void stellaris_init(MachineState *ms, stel=
laris_board_info *board)
>      qdev_prop_set_uint32(ssys_dev, "dc4", board->dc4);
>      sysbus_realize_and_unref(SYS_BUS_DEVICE(ssys_dev), &error_fatal);
>
> -    nvic =3D qdev_new(TYPE_ARMV7M);
> -    object_property_add_child(soc_container, "v7m", OBJECT(nvic));
> -    qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
> -    qdev_prop_set_uint8(nvic, "num-prio-bits", NUM_PRIO_BITS);
> -    qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
> -    qdev_prop_set_bit(nvic, "enable-bitband", true);
> -    qdev_connect_clock_in(nvic, "cpuclk",
> +    armv7m =3D qdev_new(TYPE_ARMV7M);
> +    object_property_add_child(soc_container, "v7m", OBJECT(armv7m));
> +    qdev_prop_set_uint32(armv7m, "num-irq", NUM_IRQ_LINES);
> +    qdev_prop_set_uint8(armv7m, "num-prio-bits", NUM_PRIO_BITS);
> +    qdev_prop_set_string(armv7m, "cpu-type", ms->cpu_type);
> +    qdev_prop_set_bit(armv7m, "enable-bitband", true);
> +    qdev_connect_clock_in(armv7m, "cpuclk",
>                            qdev_get_clock_out(ssys_dev, "SYSCLK"));
>      /* This SoC does not connect the systick reference clock */
> -    object_property_set_link(OBJECT(nvic), "memory",
> +    object_property_set_link(OBJECT(armv7m), "memory",
>                               OBJECT(get_system_memory()), &error_abort);
>      /* This will exit with an error if the user passed us a bad cpu_type=
 */
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(nvic), &error_fatal);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(armv7m), &error_fatal);
> +    nvic =3D armv7m;
>
>      /* Now we can wire up the IRQ and MMIO of the system registers */
>      sysbus_mmio_map(SYS_BUS_DEVICE(ssys_dev), 0, 0x400fe000);
> --
> 2.47.1
>
>
