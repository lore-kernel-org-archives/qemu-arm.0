Received: by 10.25.44.15 with SMTP id s15csp1120765lfs;
        Fri, 14 Jul 2017 09:08:13 -0700 (PDT)
X-Received: by 10.28.46.3 with SMTP id u3mr3232533wmu.68.1500048493742;
        Fri, 14 Jul 2017 09:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500048493; cv=none;
        d=google.com; s=arc-20160816;
        b=zF6CufyPTEraaB3TXPTonm/RGsrCm6UBOGFy0x8WfcdMX68ZO00i4r8e5EoTvYFCck
         WSggHTOSDf0VGtk/koi+uiNWlr72eS7A5liMi0pCTar6aqyaN0h4x6I+CXyWPL7ygmOC
         fwI4CjL+WA4p5KmGA+H1I0h8nuUd4NxWbY53wt2U/JiEU0dxEq8bENs1rR2yHPrnk1EV
         8LPzSxo1Itu4Syq8cwBlQY8wgVqNtZ3h6OAKYEWwxLMIsB1mHtvSUzNc+L09sDtc4uFA
         rOMcr09R8VmBf7Zg4r+9LJJFR/zpcNRlce35VRkuetWXnwfPx+TThbAJQYqGDhGQQaRR
         OXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VM26kHv5S2y7mFhOA2v1W5OixwPqvwiE35Pf3szYH8A=;
        b=SvDzLlOwXb19OvZKKNKWshsrDCm6Lfg16637vZegLf2I+SJTY9kzkkOUdhna9MkNtH
         EaHHcL8wiyRdVlNJwQNcqwUCpBCrFf3srOI/9jCplmHD74lkT9/q/uv4BNbUP9eOO75r
         ZYLbX90UqWxTdF516H12T+NvKTuL7R386IIOrc2Nq2j6Fai42juX9nBGHUKpS+5uwwGA
         3GB2juBa2jUboDU9zLgCgJVvIp4nhBpUFCAUfEOMNBUeXPaLbeG44x5HbnZdJezCWTlb
         moHzs+LcTMfukVKNR6bReRjy45c3vyKiuoIdAqclY/QPsnmkZP2tO1DVxkO3oJmMBauz
         tjKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=YM32UUMy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x229.google.com (mail-wr0-x229.google.com. [2a00:1450:400c:c0c::229])
        by mx.google.com with ESMTPS id 60si6503631wrj.58.2017.07.14.09.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jul 2017 09:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) client-ip=2a00:1450:400c:c0c::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=YM32UUMy;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x229.google.com with SMTP id k67so69352846wrc.2
        for <alex.bennee@linaro.org>; Fri, 14 Jul 2017 09:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VM26kHv5S2y7mFhOA2v1W5OixwPqvwiE35Pf3szYH8A=;
        b=YM32UUMyfzmDB8ifnBrWBxSI+Dz2aHpk8YTk5u6mVxukEJvqnjjeA8SGVNaZ5zD6ad
         enJ1FyZOtm9HDSnljIcch2Tpehve6herVDRwsBb2pTUwNA5YE2qkzti12LMqVBJK9UsY
         nMPmjBfpG9dnaff7eSr42ClKrq/euKhhvevSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VM26kHv5S2y7mFhOA2v1W5OixwPqvwiE35Pf3szYH8A=;
        b=oiRSwpvkvOy9Aiz4oBHdKzmXKtz7A07faz97gWqXlrRDZyR03SSdB8ydoWDufpPP+W
         zvO/5VyprGCA6Cwq1wUpgDlxGIqCTTq8EK+yIIFah9jNRIY6qVDIaBONZM449f7FbUY6
         ybkSLQkOgoc7RKaizQXPpOVf8GvUrDBeaDrGaZwVomC1zgjhoAlhg2Zi5ZoKgq3ZeXQ0
         9y+GVwgFU51T4X4r+NQF3XUfrbz//If3vz3jbUhSkb1KVflRMRonNthkBbVbTN+y0nVI
         ymU/Br5RE+erHXz/5gMKlAjCKQSOkv7OM3HmxG9b/D0zwPlypaV87UpbkF3NUK4FZJ+q
         L3Kg==
X-Gm-Message-State: AIVw111DET4ryNUV0pSbtWKwtN6NPwYU5M4rKxrTdUNf4COWGoNUiWec
	mRDxIieZ2x4TVX15BQRA2E8m3myPmX5K9glVog==
X-Received: by 10.223.173.246 with SMTP id w109mr3201271wrc.113.1500048493167;
 Fri, 14 Jul 2017 09:08:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Fri, 14 Jul 2017 09:07:52 -0700 (PDT)
In-Reply-To: <87lgnruibx.fsf@linaro.org>
References: <1500029487-14822-1-git-send-email-peter.maydell@linaro.org>
 <1500029487-14822-4-git-send-email-peter.maydell@linaro.org> <87lgnruibx.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jul 2017 17:07:52 +0100
Message-ID: <CAFEAcA--sxG2rOdeTvD=uNsOj=RFW8wFVALSaE1QU92Xzow1wA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 3/9] hw/arm/mps2: Add UARTs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Alistair Francis <alistair.francis@xilinx.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IprtNmnvOQTH

On 14 July 2017 at 16:52, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Add the UARTs to the MPS2 board models.
>>
>> Unfortunately the details of the wiring of the interrupts through
>> various OR gates differ between AN511 and AN385 so this can't
>> be purely a data-driven difference.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>>  hw/arm/mps2.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 86 insertions(+)
>>
>> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
>> index 3dad02d..180c5d2 100644
>> --- a/hw/arm/mps2.c
>> +++ b/hw/arm/mps2.c
>> @@ -27,9 +27,12 @@
>>  #include "qemu/error-report.h"
>>  #include "hw/arm/arm.h"
>>  #include "hw/arm/armv7m.h"
>> +#include "hw/or-irq.h"
>>  #include "hw/boards.h"
>>  #include "exec/address-spaces.h"
>> +#include "sysemu/sysemu.h"
>>  #include "hw/misc/unimp.h"
>> +#include "hw/char/cmsdk-apb-uart.h"
>>
>>  typedef enum MPS2FPGAType {
>>      FPGA_AN385,
>> @@ -206,6 +209,89 @@ static void mps2_common_init(MachineState *machine)
>>      create_unimplemented_device("Ethernet", 0x40200000, 0x00100000);
>>      create_unimplemented_device("VGA", 0x41000000, 0x0200000);
>>
>> +    switch (mmc->fpga_type) {
>> +    case FPGA_AN385:
>> +    {
>> +        /* The overflow IRQs for UARTs 0, 1 and 2 are ORed together.
>> +         * Overflow for UARTs 4 and 5 doesn't trigger any interrupt.
>> +         */
>> +        Object *orgate;
>> +        DeviceState *orgate_dev;
>> +        int i;
>> +
>> +        orgate =3D object_new(TYPE_OR_IRQ);
>> +        object_property_set_int(orgate, 6, "num-lines", &error_fatal);
>> +        object_property_set_bool(orgate, true, "realized", &error_fatal=
);
>> +        orgate_dev =3D DEVICE(orgate);
>> +        qdev_connect_gpio_out(orgate_dev, 0, qdev_get_gpio_in(armv7m, 1=
2));
>> +
>> +        for (i =3D 0; i < 5; i++) {
>> +            hwaddr uartbase[] =3D {0x40004000, 0x40005000, 0x40006000,
>> +                                 0x40007000, 0x40009000};
>
> I would expect these to be something like:
>
>   static hwaddr an385_uartbase[] =3D {0x40004000, 0x40005000, 0x40006000,
>                                     0x40007000, 0x40009000};
>   static hwaddr an511_uartbase[] =3D {0x40004000, 0x40005000, 0x4002c000,
>                                     0x4002d000, 0x4002e000};
>
> to save the compiler from filling in the table every loop. Not that it
> makes much different for an init routine.

I'm slightly surprised the compiler can't tell that these
are never written and emit the same code for all of them,
but yeah, let's just 'static const' all of them.

thanks
-- PMM
