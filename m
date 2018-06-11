Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4086093wrq;
        Mon, 11 Jun 2018 07:03:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKZbIPOcqqkX9Q65lCUAEkv6sujZHa0jn70SJ21OVndOOAdhAXrVhxELHHhoqE+r7Tegz8N
X-Received: by 2002:ac8:19ab:: with SMTP id u40-v6mr16189208qtj.266.1528725808726;
        Mon, 11 Jun 2018 07:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528725808; cv=none;
        d=google.com; s=arc-20160816;
        b=mjvYhTqE6LgtwfMCyaf4JSjoqC3B8j9GjgWvww6ieuxoUiBNQSWYYrLN2mEVWzs1U5
         zyRa6sCWI4q+awrd1T3l1V5YMUP85JVO2L0Fco2mtrEjKFuhnTGgsntWDIqo6DgrHER2
         +ds5SjQBPWdzQW6kfLLWFIleKn69FtRYY1BWKshIfygvwNeYNoY1FqzddJFKKVJWRdzr
         oqJ/ZvrrmJNgmkVY4F7AhNUQTbvmBXC4SU721QbRIv5XgVlDFcz6QNejpISi7jEI6xPc
         XURotLIffuIOb+3BBPluzMh4qtOYkrwGG4CvadZgmHnLP1zgJtFJ9IMdFARy13FNuYFH
         jeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eyrDvRqP8tJMSEsxggVpO2nX89DTIoHHzMaOaLHlkFs=;
        b=ruFemHxwliu4N986mPWDkpdiSeDtGvSFfqC5HaD4wz0lUY5UXJNiT2j6wecHx1+KUy
         fpVHheDwDw02LjE0n2+Mzu3wS5/Z0SkVP9tuTTUerqsJj1idfjLEBQblwszuqZ5AvmGw
         5BFkLRrOL+A5RHyb8qjsZgg0iVDr7PvcWJXu9zEVS7yTo0tiVi+JmduXVoKoYtNBfwdE
         BwzvUeQDxpSMYmvp7fPu9CWnt2PighBGqYAFlRwf/8pbKSHu95AcA7Hi5bpzqWn4g5L0
         szu2osP91tTN98gm8zWS11HyY0bEb/vqtKB3pt/6A5OdgGS9F+pZI/8JajplmG/zn0pE
         cuTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9YaAPyU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18-v6si15780500qvf.10.2018.06.11.07.03.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 07:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M9YaAPyU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSNPs-0000kD-8s
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 10:03:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNPe-0000iK-5h
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSNPc-0008Dl-I4
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:03:14 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:44429)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSNPc-0008Cp-Dp
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 10:03:12 -0400
Received: by mail-ot0-x243.google.com with SMTP id w13-v6so23861181ote.11
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eyrDvRqP8tJMSEsxggVpO2nX89DTIoHHzMaOaLHlkFs=;
	b=M9YaAPyUv2RadGpn3R3Do0wP/CULIFijgdDGHopeghw3geGyyfVywFkLLcbz6CMwxs
	ic8LKexVHvaaFbYpNuimLPjwBiJNCR9sxUxuUZ4v1OEOBDjS4DUaHJW9Wtfxz4U3uBKH
	kRBesTK0zusKCph7yg1P39t2wqWlRRPtBoJI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eyrDvRqP8tJMSEsxggVpO2nX89DTIoHHzMaOaLHlkFs=;
	b=tkEOXOAK66pOs2dFR3M3SLDO1jnIxtXzSglkVuexLiZ3/gnbONd31VoQNdA8eKtyFC
	D0DDPO3jPxuAgn57HvbgpsNRsk4ft96T9h7aXXkCGSdYqum9LG4RAvwuL78C1FWBJPf+
	HIqtfUFzOZD0/sPUxwVsp9unmfqV+hPppdsEEo+lTCS/ZVh5uyXvI6skG9fMqIX4QySu
	4dqghAZsR1C1b76EbdcAk4GRASljrbHmfF1mkCeeoHW4/RMllVOFxSRmFRHI9MpXDAVn
	U+/LnNfRcPeMBC4bW2j1DrgK6Lbjbk74LXKVCdTa//+EqgNFr+70ci8kVRjrN6vbHtvJ
	HxnQ==
X-Gm-Message-State: APt69E1h1llAlf2/PQbqIcHWsM115Og7bDy6JWpEp8DwnHVPrAKp0Oy9
	OoajhVhXvQ3ZNNWxue4g9A95INJDCd7+8O+QoTRFpyp6
X-Received: by 2002:a9d:3d76:: with SMTP id
	a109-v6mr7986023otc.294.1528725791574; 
	Mon, 11 Jun 2018 07:03:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 07:02:51
	-0700 (PDT)
In-Reply-To: <CAFEAcA9TGnyeH8=f0xJ3sD9TtXQs_NbiJWBp9h6zsAz-UEOLrw@mail.gmail.com>
References: <20180515171446.10834-1-peter.maydell@linaro.org>
	<CAFEAcA9TGnyeH8=f0xJ3sD9TtXQs_NbiJWBp9h6zsAz-UEOLrw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 15:02:51 +0100
Message-ID: <CAFEAcA8vS_uk7Yz+JgoHvHnwFjY-T7ShnOCiwO+QzikycQ_5yA@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH] hw/arm/mps2-tz: Put ethernet controller
 behind PPC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jKp+TJeYk7JN

I guess nobody else is interested -- applying to target-arm.next.

thanks
-- PMM

On 29 May 2018 at 16:27, Peter Maydell <peter.maydell@linaro.org> wrote:
> Ping for review?
>
> thanks
> -- PMM
>
>
> On 15 May 2018 at 18:14, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The ethernet controller in the AN505 MPC FPGA image is behind
>> the same AHB Peripheral Protection Controller that handles
>> the graphics and GPIOs. (In the documentation this is clear
>> in the block diagram but the ethernet controller was omitted
>> from the table listing devices connected to the PPC.)
>> The ethernet sits behind AHB PPCEXP0 interface 5. We had
>> incorrectly claimed that this was a "gpio4", but there are
>> only 4 GPIOs in this image.
>>
>> Correct the QEMU model to match the hardware.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> A minor nit that I didn't notice when I was modelling this.
>>
>> NB: I think the PSRAM is also supposed to be behind this
>> interface of the PPC, but we definitely can't model that
>> because our PPC implementation won't work for executing
>> code from RAM that sits behind it.
>>
>>  hw/arm/mps2-tz.c | 32 +++++++++++++++++++++++---------
>>  1 file changed, 23 insertions(+), 9 deletions(-)
>>
>> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
>> index 8dc8bfd4ab..c5ef95e4cc 100644
>> --- a/hw/arm/mps2-tz.c
>> +++ b/hw/arm/mps2-tz.c
>> @@ -74,12 +74,13 @@ typedef struct {
>>      UnimplementedDeviceState spi[5];
>>      UnimplementedDeviceState i2c[4];
>>      UnimplementedDeviceState i2s_audio;
>> -    UnimplementedDeviceState gpio[5];
>> +    UnimplementedDeviceState gpio[4];
>>      UnimplementedDeviceState dma[4];
>>      UnimplementedDeviceState gfx;
>>      CMSDKAPBUART uart[5];
>>      SplitIRQ sec_resp_splitter;
>>      qemu_or_irq uart_irq_orgate;
>> +    DeviceState *lan9118;
>>  } MPS2TZMachineState;
>>
>>  #define TYPE_MPS2TZ_MACHINE "mps2tz"
>> @@ -224,6 +225,26 @@ static MemoryRegion *make_fpgaio(MPS2TZMachineState *mms, void *opaque,
>>      return sysbus_mmio_get_region(SYS_BUS_DEVICE(fpgaio), 0);
>>  }
>>
>> +static MemoryRegion *make_eth_dev(MPS2TZMachineState *mms, void *opaque,
>> +                                  const char *name, hwaddr size)
>> +{
>> +    SysBusDevice *s;
>> +    DeviceState *iotkitdev = DEVICE(&mms->iotkit);
>> +    NICInfo *nd = &nd_table[0];
>> +
>> +    /* In hardware this is a LAN9220; the LAN9118 is software compatible
>> +     * except that it doesn't support the checksum-offload feature.
>> +     */
>> +    qemu_check_nic_model(nd, "lan9118");
>> +    mms->lan9118 = qdev_create(NULL, "lan9118");
>> +    qdev_set_nic_properties(mms->lan9118, nd);
>> +    qdev_init_nofail(mms->lan9118);
>> +
>> +    s = SYS_BUS_DEVICE(mms->lan9118);
>> +    sysbus_connect_irq(s, 0, qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));
>> +    return sysbus_mmio_get_region(s, 0);
>> +}
>> +
>>  static void mps2tz_common_init(MachineState *machine)
>>  {
>>      MPS2TZMachineState *mms = MPS2TZ_MACHINE(machine);
>> @@ -363,7 +384,7 @@ static void mps2tz_common_init(MachineState *machine)
>>                  { "gpio1", make_unimp_dev, &mms->gpio[1], 0x40101000, 0x1000 },
>>                  { "gpio2", make_unimp_dev, &mms->gpio[2], 0x40102000, 0x1000 },
>>                  { "gpio3", make_unimp_dev, &mms->gpio[3], 0x40103000, 0x1000 },
>> -                { "gpio4", make_unimp_dev, &mms->gpio[4], 0x40104000, 0x1000 },
>> +                { "eth", make_eth_dev, NULL, 0x42000000, 0x100000 },
>>              },
>>          }, {
>>              .name = "ahb_ppcexp1",
>> @@ -447,13 +468,6 @@ static void mps2tz_common_init(MachineState *machine)
>>                                                       "cfg_sec_resp", 0));
>>      }
>>
>> -    /* In hardware this is a LAN9220; the LAN9118 is software compatible
>> -     * except that it doesn't support the checksum-offload feature.
>> -     * The ethernet controller is not behind a PPC.
>> -     */
>> -    lan9118_init(&nd_table[0], 0x42000000,
>> -                 qdev_get_gpio_in_named(iotkitdev, "EXP_IRQ", 16));
>> -
>>      create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
>>
>>      armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0x400000);
>> --
>> 2.17.0
