Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1800584ejb;
        Tue, 6 Feb 2024 05:47:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoMEJzGgMQx9JuURxF4rxYKHqP2J+J27hStBtP7Yk6rWpzErtFsJEFShMdpGDLsakLcJgi
X-Received: by 2002:a25:206:0:b0:dc2:1f56:11e4 with SMTP id 6-20020a250206000000b00dc21f5611e4mr1644471ybc.24.1707227243242;
        Tue, 06 Feb 2024 05:47:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707227243; cv=none;
        d=google.com; s=arc-20160816;
        b=mEW/RHbItafbEXIk5mo3cNBPd1hkhIKF4s4Asdc1gf+CRxLMjolx8L/aZZGoMQkpcW
         rTobVhMHQH/E25b1aCf0vtZbeP99peIDNVT1zbSepyZYZ3QbBW5giimHMMB5dB8jLI/E
         f6owgY/EDb6ld+35E0f9nHe2xJgnpGj2nzVHSf11z1OSHAj8L7vV7YYoU5YeXkSu680i
         178HzdjIMaY3n88BY3WbyFZbzRsyjUVOIgenkQEhk9e4EA+msobqjsw2HuF7UWIle0Eu
         Q9ijWw2YjS2IujxUAKbpnGz4N8Co+OX/Afoi6ehgLDkUIB/Gg17WqXutIbUn9wKy1qYj
         HFLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PYZHBgDpXXmGEn5czzfjRmYJvcYABvyjAKf0rvOwL1Q=;
        fh=KDE3rsWVbu7ZD/+Tm81J0TdMhX48KGsnKNJ09cvNq/w=;
        b=lPCDP9lqWmmg/QKyzu8NjxLSMGT0zhio+qg+9+r3AGt6qfI+Cdk/rhyLh3fuZt1IWD
         6+MqpF8jmT4mSPqaIZTz+28frbiH1fvBU1IUdzJszqJ2yWYEnjj8DJwZ6IGHMN2cZH7r
         F/EajU08oaFOTpWofZI86fBB3hfTVkaD3tg8jxLO7N4FMEurKANIjp2NsnzxbeuhJBfA
         sEBp2ZviKMJaQw24ZAwm/9KsOuGoEIMqZ9jNrck59pAkGRquke37CeWmtkJJTymRBNMc
         hh8V4/ZPf0reU6XKiwCvaO5zRaYLgUqtCWUxziLtdQkGoZuZ+s4wv/8zlvZjQSnUn016
         3MLg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZhVHdFnP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXa95z62w4XELu6dm1uLbL1B7KSH4O3wf5r9SWE4wRDagn6pn5fasSuDKAWFGtGxofaDYSeEkkWfQEM85fVW8QsVwF6pFHs
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vz25-20020a05620a495900b007834d5f9833si2274929qkn.78.2024.02.06.05.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 05:47:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZhVHdFnP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXLn5-0005jM-Jo; Tue, 06 Feb 2024 08:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLn3-0005iX-37
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:47:09 -0500
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLn1-0003sy-I9
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:47:08 -0500
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cf5917f049so66009841fa.2
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 05:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707227225; x=1707832025; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYZHBgDpXXmGEn5czzfjRmYJvcYABvyjAKf0rvOwL1Q=;
 b=ZhVHdFnP9zeTYD+SFIKwhGAaMR+vSwSQ8ednVVup/xb0HDFz58FELeUxe4MzwP2L89
 Xb/3rZWpitwIuz00a7maCVADE+AnvTV+J0fybk8zjT4gBNS9TgDW3HG6CfjsWtZdZOEE
 We4EHMuhPcuQ0SHY3usW/nTFg5PhbYFZgzaklmxYwIYHbMmKg+1BM6dAhW5wZTwpFr2F
 Jb2PexBiBvoH0DXWDrtxu9kkuH6LuydSZA2OG28z9B4i12ZTB7CgNrg+y7l6eGI3/dLm
 qgDHrp324/LEIU26+hGjdChxvFPLrtkvprehEvT9vflo9jc+UaNr3xdQG8JbfElNOGwO
 +QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707227225; x=1707832025;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYZHBgDpXXmGEn5czzfjRmYJvcYABvyjAKf0rvOwL1Q=;
 b=GFhpLyZexLkEfMHX2h1AQElBGuKNhk7OJP9KaxVStVFth5at+lMl7CMidHLz3Y/uEV
 a9DLxO3wAz9DUMJeS7UQ8q829mr/NsCo5J5OfxECW7CeKRNwmy6U3/DbLcHrV5h+YlQH
 76K6P159iYLcfNkIA1nsyfNsol68yBG6gyD1F2pOts/wZQrvBOzMJmpmVcKhqS2AlOzD
 NTM+DyXPqBv4Pk2PhqZOjFHJcNwoo34CNO4sYXy+wjg7QMMOmJy4XLlIt7/oX34etGuM
 pSyiLM7ICbbOwF7YVHJhrvkauqznMrFGweTo7ZqdgLRJmzRYxnfML6MG922qKSKTZvNo
 VpEA==
X-Gm-Message-State: AOJu0Yx2zc0gFDNTPIBTq20IzPMXQqjeoQsjU8OIw+7KaZr84tu1tMzm
 XM0ESmUADO5tKWczStlwvXSldF5YHXZZ3sMo4bnQFtV+/xjtEg+pIMCQGZuukcQu/9H7K6/Dqch
 2j7VVK4kmmwVlHZB10SMKCa7p5pFDP1ixrvc3ng==
X-Received: by 2002:a05:651c:b06:b0:2d0:772a:e5ae with SMTP id
 b6-20020a05651c0b0600b002d0772ae5aemr1969879ljr.14.1707227225389; Tue, 06 Feb
 2024 05:47:05 -0800 (PST)
MIME-Version: 1.0
References: <20240130152548.17855-1-philmd@linaro.org>
In-Reply-To: <20240130152548.17855-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 13:46:54 +0000
Message-ID: <CAFEAcA8Zuq0UjXZ1FZPGn7TVfAJ96tfxg0W=jtxjgxRBUzByiA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Wire FIQ between CPU <> GIC
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
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
X-TUID: BG2ukStjXEoS

On Tue, 30 Jan 2024 at 15:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Similarly to commits dadbb58f59..5ae79fe825 for other ARM boards,
> connect FIQ output of the GIC CPU interfaces to the CPU.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/xilinx_zynq.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 66d0de139f..ffad058107 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -246,6 +246,8 @@ static void zynq_init(MachineState *machine)
>      sysbus_mmio_map(busdev, 0, MPCORE_PERIPHBASE);
>      sysbus_connect_irq(busdev, 0,
>                         qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_IRQ));
> +    sysbus_connect_irq(busdev, 1,
> +                       qdev_get_gpio_in(DEVICE(cpu), ARM_CPU_FIQ));
>
>      for (n =3D 0; n < 64; n++) {
>          pic[n] =3D qdev_get_gpio_in(dev, n);
> --



Applied to target-arm.next, thanks.

-- PMM
