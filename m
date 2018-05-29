Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3696589wre;
        Tue, 29 May 2018 08:28:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK163wTPX/WlAYaFoOL/dUX8RHG0Zumw7llk1Hy7USvkf1I3/tf2293T9u1LoK8fddja7PE
X-Received: by 2002:a37:cfcd:: with SMTP id v74-v6mr15570035qkl.240.1527607685116;
        Tue, 29 May 2018 08:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527607685; cv=none;
        d=google.com; s=arc-20160816;
        b=PFc4+kc6eHRoyb/D86KrYRgkBEGo/6Q46cm3lk5QVgSmDE0MUPJVZK4bV0a0MBkKQx
         /UM/ueIkPcgImEhw5GvznjNQiUQfRWdhzEwM+OnbGbIp4iSiM6NIHxQCrqQvt36MXoEa
         spcCEcyMyqucNcGpsybfHi0Px8GRE2FoZpdTsVfdLCWS7gKBgZZXearTPHzhhqCIZVam
         jd755IgvtoYpzFGVZygy3MTOf1pOZeAcSUqFuf4m7kmCKG1hagCXRui/gfjwhaPGRfCa
         tO6cQVFlPh/nk5zZgEmj0IDyQkDRLuLMULzsmI+5tuq2ErbZbLLGzjDAaYi3Z0pEthYJ
         3k+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=285OnojtXJuOnqfVYtGNcVk78kULha7cNyNR+Qo4kXk=;
        b=SUg4Re2pW9jNJgfwafUcwbmqxK/0Vt3sEpjMKO7QBvIgaI0mjWAxCtT0QHwrBypkFi
         Mh5xZl1iYWDVhT9Hr9Ma2yM0hxVVq0TF34UpHqUPQipY9OzM8MRfUOGV1A12opGHXstm
         f8IHM7NeNWCXKyqJuqJnZBzAree0lqHtHphj7p167PgpRHhoQTVcsNV2tRsaQIr7vWq+
         h9R/c9oQpQQDeHJedVAJTd2hhBDmB8Ily8x07mFND8BAmdxiPCF20RyziCNgY+3CKosc
         ArLUPgq5ydDQdf3EeYcGvzpwyS1jJ75bsPWtQI9glYLgitP8/FKjD/vPj/vFUdW7OMrU
         xuKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GLC4I/wZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7-v6si3288717qkf.265.2018.05.29.08.28.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 08:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GLC4I/wZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33548 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNgXc-0003xf-IZ
	for alex.bennee@linaro.org; Tue, 29 May 2018 11:28:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNgXC-0003w4-RD
	for qemu-devel@nongnu.org; Tue, 29 May 2018 11:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNgXB-0002Jp-Sd
	for qemu-devel@nongnu.org; Tue, 29 May 2018 11:27:38 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:43883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNgXB-0002Jf-Nj
	for qemu-devel@nongnu.org; Tue, 29 May 2018 11:27:37 -0400
Received: by mail-oi0-x244.google.com with SMTP id t133-v6so9811462oif.10
	for <qemu-devel@nongnu.org>; Tue, 29 May 2018 08:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=285OnojtXJuOnqfVYtGNcVk78kULha7cNyNR+Qo4kXk=;
	b=GLC4I/wZ9Lb9iWRJ1SNOL5lQgZddqapU7sGpkQIeR6TuzRN74afGTfiDivPj70dHsh
	fHPFgmgycZ9z3f8LB5Lkmt+rvtzaC3cqaLEt0EPUysgHoe1pq0E1altpSHTGunnsEv2b
	sx90E43PwOP7kUY4XK18KOJ5sOU4+tB/tI/kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=285OnojtXJuOnqfVYtGNcVk78kULha7cNyNR+Qo4kXk=;
	b=W8+LvKeLmKhL9/uEBuuCrpIIYMw3H4kfCW6RAAlGeWfHS9qpKNKcoLfJbMQ3NqAlYQ
	u5QqBj5CpiS/OFm327eiCRTERlcw+Rv+xQZsisxs2HdBJxLD9BV9N7TwLg+Hzqz1LscI
	j1GRTGqENTKdVbU6LLDrGIZKaTNt83uZ/fxYz0VVayMPuVus6kAyKNYU1t2c+mkkqBq8
	h+mRsYzp2EQw/lqZY/ktxQs2sAggd2lA0v9pHYm8tlQMBS0VwPYLyWardFAlYP5BqEne
	EetKqXZ5qH1SAfF0D3yS6GQ0CaaZ4enN/xYblG4CZSIyPj16EELTRjD6J5E5UrKGys3P
	uEzg==
X-Gm-Message-State: ALKqPwdMuQUl6RD4RnXwjlfLO4eVzqzb8bdA7BTl5fX3TE9QdOEj3xEP
	756rBC1vaDnokgfodgX2X4mYNfGdsnAE4H0Y8sw830EG
X-Received: by 2002:aca:538b:: with SMTP id
	h133-v6mr10306836oib.252.1527607657020; 
	Tue, 29 May 2018 08:27:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 08:27:16
	-0700 (PDT)
In-Reply-To: <20180515171446.10834-1-peter.maydell@linaro.org>
References: <20180515171446.10834-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 16:27:16 +0100
Message-ID: <CAFEAcA9TGnyeH8=f0xJ3sD9TtXQs_NbiJWBp9h6zsAz-UEOLrw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/mps2-tz: Put ethernet
 controller behind PPC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /3jhJTVbHdGl

Ping for review?

thanks
-- PMM


On 15 May 2018 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
> The ethernet controller in the AN505 MPC FPGA image is behind
> the same AHB Peripheral Protection Controller that handles
> the graphics and GPIOs. (In the documentation this is clear
> in the block diagram but the ethernet controller was omitted
> from the table listing devices connected to the PPC.)
> The ethernet sits behind AHB PPCEXP0 interface 5. We had
> incorrectly claimed that this was a "gpio4", but there are
> only 4 GPIOs in this image.
>
> Correct the QEMU model to match the hardware.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> A minor nit that I didn't notice when I was modelling this.
>
> NB: I think the PSRAM is also supposed to be behind this
> interface of the PPC, but we definitely can't model that
> because our PPC implementation won't work for executing
> code from RAM that sits behind it.
>
>  hw/arm/mps2-tz.c | 32 +++++++++++++++++++++++---------
>  1 file changed, 23 insertions(+), 9 deletions(-)
>
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 8dc8bfd4ab..c5ef95e4cc 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -74,12 +74,13 @@ typedef struct {
>      UnimplementedDeviceState spi[5];
>      UnimplementedDeviceState i2c[4];
>      UnimplementedDeviceState i2s_audio;
> -    UnimplementedDeviceState gpio[5];
> +    UnimplementedDeviceState gpio[4];
>      UnimplementedDeviceState dma[4];
>      UnimplementedDeviceState gfx;
>      CMSDKAPBUART uart[5];
>      SplitIRQ sec_resp_splitter;
>      qemu_or_irq uart_irq_orgate;
> +    DeviceState *lan9118;
>  } MPS2TZMachineState;
>
>  #define TYPE_MPS2TZ_MACHINE "mps2tz"
> @@ -224,6 +225,26 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
>      return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
>  }
>
> +static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
> +                                  const char *name, hwaddr size)
> +{
> +    SysBusDevice *s;
> +    DeviceState *iotkitdev = DEVICE(&mms->iotkit);
> +    NICInfo *nd = &nd_table[0];
> +
> +    /* In hardware this is a LAN9220; the LAN9118 is software compatible
> +     * except that it doesn't support the checksum-offload feature.
> +     */
> +    qemu_check_nic_model(nd, "lan9118");
> +    mms->lan9118 = qdev_create(NULL, "lan9118");
> +    qdev_set_nic_properties(mms->lan9118, nd);
> +    qdev_init_nofail(mms->lan9118);
> +
> +    s = SYS_BUS_DEVICE(mms->lan9118);
> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));
> +    return sysbus_mmio_get_region(s, 0);
> +}
> +
>  static void mps2tz_common_init(MachineState *machine)
>  {
>      MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
> @@ -363,7 +384,7 @@ static void mps2tz_common_init(MachineState *machine)
>                  { "gpio1", make_unimp_dev, &mms->gpio[1], 0x40101000, 0x1000 },
>                  { "gpio2", make_unimp_dev, &mms->gpio[2], 0x40102000, 0x1000 },
>                  { "gpio3", make_unimp_dev, &mms->gpio[3], 0x40103000, 0x1000 },
> -                { "gpio4", make_unimp_dev, &mms->gpio[4], 0x40104000, 0x1000 },
> +                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000 },
>              },
>          }, {
>              .name = "ahb_ppcexp1",
> @@ -447,13 +468,6 @@ static void mps2tz_common_init(MachineState *machine)
>                                                       "cfg_sec_resp", 0));
>      }
>
> -    /* In hardware this is a LAN9220; the LAN9118 is software compatible
> -     * except that it doesn't support the checksum-offload feature.
> -     * The ethernet controller is not behind a PPC.
> -     */
> -    lan9118_init(&nd_table[0], 0x42000000,
> -                 qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));
> -
>      create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
>
>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
> --
> 2.17.0
>
>
