Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp324355ejb;
        Thu, 1 Jun 2023 03:34:23 -0700 (PDT)
X-Received: by 2002:a1c:7712:0:b0:3f6:479:3983 with SMTP id t18-20020a1c7712000000b003f604793983mr1527958wmi.25.1685615663638;
        Thu, 01 Jun 2023 03:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685615663; cv=none;
        d=google.com; s=arc-20160816;
        b=KS4suLeV07CRAfS5noda2qQDpjGozyyUUiEnQGTbkzTLdYTe9KbV9xgeDAtJHwNu6g
         JzQXvKCeRuqxAjkZDZ1+ALSRShQoa1qmvHCFRalnU6WW7sYxcO2316VZyNn0NwSAgjkB
         Waj1+J7kGLjAGCyxg2CIjEqylSwWYNxqVGA7caNTAJPlS+V9FyeQM7j60Ypi33eWBAS0
         Qdti551Ptr8ZDsUGs/eWoqvn5j3/D1bcddvjMcQl8Gmt2ktWxpG11nbHpeeUNZxTwWQl
         zSMF9NmIzYxKpfEk4cCr3/RBOfmGuuR1RjCgQhceWHcKrLXLkgVhfXG8TuVZ8ODM4vu5
         GfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IzSdooUfPpfNOZEPCgWdZLTS54PXAKR1AaFq3KhI2/A=;
        b=Cj+s6/9W+FViEo/TKFsZ/JlFj/lxv9rtz1MZqKEhGLxDMykydDAe5cHBkeG31gLUI4
         ZK+2tsnJ7MCTbxQHxrVYD0kC89vPp2sTm3DgEHNe8k/yIo0RbPRET9L3AMbIwetz59bk
         +YZwFTjFLhijanIY2XyyyxEOFf5ObrN6TJBLB5j6dZ4dj9KWFY5AFOY/ViAsX23CTbvh
         J+D1crRm4dNiXaizg/zJL+ZvRzqfx5d1r8lEZpzPCqm79CWW9JNh/MNWuIXzmJb/O4lG
         zaimyZ1Uaf+bBoUUD5oM/H14cBGvr+jpmWtK/F/SDOEPjdY5SBEyybcFefuNfuAACM9z
         J55A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0MgPJbx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z11-20020a05600c220b00b003f6ff0298b1sor3119969wml.0.2023.06.01.03.34.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Jun 2023 03:34:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c0MgPJbx;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685615663; x=1688207663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzSdooUfPpfNOZEPCgWdZLTS54PXAKR1AaFq3KhI2/A=;
        b=c0MgPJbxwqbpDAcwgFTUsvr8VRX2vyiw2yZi3A/Qd1YJ2SQ3mr2gEXIhuHWOsHy3/m
         ukD/3HOpc0DJZAGMOneGawc6rGvQRkv6FnO8RjiOLYEsxCNpbGhdO88o9qV62bkYDdso
         IrAoA/SME2nk89wvDZu3hyjLud2nDTk9vmzjuokvBH229wds5fGREoKkVVD/ZDfsBt7w
         Gt6daoJhAnNkZXGRymPgJRZKoJ+aRQzzTDndh5i2M1sC3VRDNd++o5vLOoRoyzMDQHRf
         OAXP6wz7HNh+KBf3UiCdjdnmNgzjifALHpqlpS1Yp0e3+ZoIyne1f1/UzaNzVPElHsVZ
         XnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685615663; x=1688207663;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzSdooUfPpfNOZEPCgWdZLTS54PXAKR1AaFq3KhI2/A=;
        b=AFsF4fwzpqffUxu33pVgplsrj1tXaNMwh/gtXcgTGhiMcZF+/qIoNU38e5iwwP0B1n
         yRKE7SvNnyS+xg83lQagEHXlq38cNCvpqeTNyiI3wKlkuoHH7DI5BoYyw5z62RhgTRrq
         yaazQFWu0b8rv8rYpX9wHeNKsSIQLL1pAvrA7HPxnkwZBxo1Ae9n8cZG06mbVxhHxw3t
         N/rFpCATut/8G9+6Bv4dnT1kmsOQExqJWZG0Ix7cQYvvM1nSLNg1mLTi6aXCOCDJwXSi
         1VG2PAAdvsSiHHSY2l2Gvcgt5Yx2SJfmX1xbYNq7EN/Du2mgsHTLQiptKHgCqPPcf1kH
         5Uvw==
X-Gm-Message-State: AC+VfDyUxvctLBxdWcs6FmABRqi9C6hLNuy8xkSl2N+zRP88i4fdYMWF
	fdpwFFeWKSu2d4AkeAw5sk/mh9gPokMit/IUYE7Bfw==
X-Google-Smtp-Source: ACHHUZ5pmxVPQNDRaFzyGnwwIGFU3WUGvZfq2SDdpjV4YwIgujWivHTOGoMFHbfrpFfNOit9rqw+Xw==
X-Received: by 2002:a05:600c:22d4:b0:3f6:552:8722 with SMTP id 20-20020a05600c22d400b003f605528722mr1621956wmg.18.1685615663265;
        Thu, 01 Jun 2023 03:34:23 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.141.224])
        by smtp.gmail.com with ESMTPSA id s16-20020adfeb10000000b0030630120e56sm9825231wrn.57.2023.06.01.03.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 03:34:22 -0700 (PDT)
Message-ID: <de455326-5fee-db23-07c5-40941c1ccc8a@linaro.org>
Date: Thu, 1 Jun 2023 12:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/7] hw: Simplify using sysbus_init_irqs() [manual]
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20230601094625.39569-1-philmd@linaro.org>
 <20230601094625.39569-8-philmd@linaro.org>
 <CAFEAcA8wgaEJd03G8gNtFOUFT0jpm=KLfaZSjeYcOgvTYdvhJQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8wgaEJd03G8gNtFOUFT0jpm=KLfaZSjeYcOgvTYdvhJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tgDF8m21MKQY

On 1/6/23 12:19, Peter Maydell wrote:
> On Thu, 1 Jun 2023 at 10:48, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Audit the sysbus_init_irq() calls and manually convert
>> to sysbus_init_irqs() when a loop is involved.
>>
>> In omap2_intc_init(), the parent_intr[] array contains
>> 2 elements: use ARRAY_SIZE() to iterate over.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
>> diff --git a/hw/timer/renesas_tmr.c b/hw/timer/renesas_tmr.c
>> index c15f654738..dd2929d6e7 100644
>> --- a/hw/timer/renesas_tmr.c
>> +++ b/hw/timer/renesas_tmr.c
>> @@ -428,17 +428,14 @@ static void rtmr_init(Object *obj)
>>   {
>>       SysBusDevice *d = SYS_BUS_DEVICE(obj);
>>       RTMRState *tmr = RTMR(obj);
>> -    int i;
>>
>>       memory_region_init_io(&tmr->memory, OBJECT(tmr), &tmr_ops,
>>                             tmr, "renesas-tmr", 0x10);
>>       sysbus_init_mmio(d, &tmr->memory);
>>
>> -    for (i = 0; i < ARRAY_SIZE(tmr->ovi); i++) {
>> -        sysbus_init_irq(d, &tmr->cmia[i]);
>> -        sysbus_init_irq(d, &tmr->cmib[i]);
>> -        sysbus_init_irq(d, &tmr->ovi[i]);
>> -    }
>> +    sysbus_init_irqs(d, tmr->cmia, ARRAY_SIZE(tmr->cmia));
>> +    sysbus_init_irqs(d, tmr->cmib, ARRAY_SIZE(tmr->cmib));
>> +    sysbus_init_irqs(d, tmr->ovi, ARRAY_SIZE(tmr->ovi));
> 
> Doesn't this change the order of the IRQs? Previously
> we had channel 0 CMIA, channel 0 CMIA, channel 0 OVI,
> channel 1 CMIA, channel 1 CMIB, channel 1 OVI. Now
> we have channel 0 CMIA, channel 1 CMIA, channel 0 CMIB,
> channel 1 CMIB, channel 0 OVI, channel 1 OVI. So they'll
> get miswired in the board code now...

Oops, good catch. Good case to show the sysbus_init_irq() is
fragile. At least named_gpio are clearer.

I'm surprised because v1 series passed CI, but looking closer
the RX tests isn't run. And now I see commit e5d402b28f
("tests/acceptance: disable machine_rx_gdbsim on GitLab").

"Hopefully we can re-enable both
     once the serial timing patches have been added."

Alex, are these patches in the tree now?
