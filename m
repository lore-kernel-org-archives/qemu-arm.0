Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3163069njc;
        Tue, 5 Nov 2024 15:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVrRYmY8qp1m97WUWmuQ/ueGiDSmqgbu1KWNyXs4aSnx5dsTzZ18PPoYt6KaCXedwQ5hs/JCLqRxy9dQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFykIr60LTIqk/jSKRyd/1u9eMs/93VKRZeHIyaUnz7rGSuxkaWF67wXDv/J2+ogMYJA+4Q
X-Received: by 2002:a05:6808:1b07:b0:3e6:147:8bd9 with SMTP id 5614622812f47-3e758c698femr16495532b6e.18.1730847716735;
        Tue, 05 Nov 2024 15:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730847716; cv=none;
        d=google.com; s=arc-20240605;
        b=HDclnE8rvtWR/hBsGUUz177u267740VAdr1LBTh7q2CZEFcYnBZoEJAOUv9/13IK5d
         WpfhNAZXmYNJ80tK6ohvPtdRaz/beW3j/EbAaaQ6Nbxg7X8ggofn/lo7k85DC7WZmK/I
         lXwkyH3u7+44AvtHodZ7Di+RsaiIrDJaUvt87+xuw7+rXtOZvBIxxUm8JhEhbPIyKLnl
         Mca25Wl4Edw3rY2lsfyjED4E4cWEhrhfvLHGVNBZUdlSle/GBH3QubHjsupxmZaRoI3E
         34vcvVb8/GVBoYInI35NZ0CQ4YyE+XlMG6E6jC4grwIxEjb0T9ukrAO27CSIcFuJJ62L
         f1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EfOtEP1B9ME/jsHOqIbM51aqo6s6BqnmSrMtp7A5WuM=;
        fh=DdslWaB6BhiF5aq4PX1OCZgN2Zxay9tZWjSq3z/wZJ8=;
        b=VJQ8rSl+WuWCrodd53aTCB2T5FIkpRjuPnipY11Tq9cSQpzFwKdjLk3jpwV5mAlPhN
         n3enh1XuZjCktoY61Q6PbBgJbzE4GeuodaGt56eQutwhFIHcTdoTD9S1lDZLibLGONyZ
         Z7A1pOl7pl+aTeq2ilNHYQLuFnUd5LTLgTyR4tlNbKM8aXSJNjQvEcjF0oWtpDpXImpI
         zMdlmjSs9U3LIyWP3fA5VF+Ex6VwJuhJsSJwSwywIx4DYKYHt5ATvggYyOkQrg8MyAPh
         JC0R6oIxe4SwIFgigXL6w3niT5qzwGtCWar5yLqDXiCYieByAsz7Dp1BsA6YXMe5yqN7
         0iAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eL9Ngs7N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d353fa8646si142467706d6.64.2024.11.05.15.01.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 15:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eL9Ngs7N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8SYB-0005FX-Jv; Tue, 05 Nov 2024 18:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8SY9-0005AT-4x
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 18:01:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8SY6-0007Fo-FQ
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 18:01:24 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d5aedd177so3821447f8f.1
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 15:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730847680; x=1731452480; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EfOtEP1B9ME/jsHOqIbM51aqo6s6BqnmSrMtp7A5WuM=;
 b=eL9Ngs7NBcypXm5czZjBdtwBDOIAzcdLcNOalFkOKzqCl0Tq7jUhFZTJ4VOE5n4t61
 tsL/rKLOfNix5M/i7htcFLGirXwprnYPzjxLTsFHn9ohuZm+G4iYFioFHr7BI61Fb1Oq
 9raJP3ydxYEK2i4HMwvZnNFmwn/LRHRF2hFhm2ZMR/7Zea/nUlB+FUwQ1ZChivEUmP9w
 VajS3yL5u47s6CYtH49o7rcuHMQrkaRsKWDJHbDCqfcVzm9tFCpm2vJQCDF0Ba8cJ4NP
 BYnsyeDK/h/PIR0YvMvxI51elriqh/EHQ2LGqy1AU4axW1YzHiO4LgXqg0BA5u0FKcVl
 7ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730847680; x=1731452480;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EfOtEP1B9ME/jsHOqIbM51aqo6s6BqnmSrMtp7A5WuM=;
 b=Vr4x70AC5aNI9tToF+p8xFodKO33RA+3qRibroyxdMO6OUbJqhrxT2kMYN2nQEyYPS
 YbbZPBi0rGh5o6EVBlNqCNXHFJaDTbRPlsMfpuiCh0yOMnaV88b6YvmBj1Ze5PQPWMGn
 Y+O07apOk617QvJBNjMbhLdVCthNQ3gLvubFjtfcpDjo1/wFTSnXKialEGAsUCpyQL6H
 s8PliivzEauCVW3u44wB5rAptma/RX4222C3wtCLSw/6N8fpwUnoYAQCIkHkY8x6rcF5
 5aQLInbrTV4BEO9WEQiiMM4rJ8aJ3uArm76S9lFzbaB/F5FcCGvt8jRSG7q/GDybCrzE
 aMeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwhWrUzl9NwjfOCQBbVaPAEM9MM3HlNitk6Xu9yAFZ9jDI3w8Tzs7MRDsnP570LM+F3RcfX+GPbQ==@nongnu.org
X-Gm-Message-State: AOJu0YysNFIVPwA8XK9aFOSKDC3YfayY/8CnwJCUOA3/IaMV/K6jK3ks
 xnkrTth2OXOxaMTlRaW7f+z8HJOaS8TvIwwWhw+sTbIzGYC1AiFlfUrc1i4YdDc=
X-Received: by 2002:a05:6000:1a8c:b0:37d:4ebe:1650 with SMTP id
 ffacd0b85a97d-381be907958mr17696292f8f.46.1730847680422; 
 Tue, 05 Nov 2024 15:01:20 -0800 (PST)
Received: from [172.20.143.32] ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116ad3fsm17231228f8f.95.2024.11.05.15.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 15:01:19 -0800 (PST)
Message-ID: <accdb8b5-a73e-45d0-8086-82d69c97b569@linaro.org>
Date: Tue, 5 Nov 2024 23:01:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/19] target/microblaze: Rename CPU endianness property
 as 'little-endian'
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-2-philmd@linaro.org> <ZyqiPrf2wjP1yAPz@zapote>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ZyqiPrf2wjP1yAPz@zapote>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ShYM4XSKjp7i

Hi Edgar,

On 5/11/24 23:54, Edgar E. Iglesias wrote:
> On Tue, Nov 05, 2024 at 02:04:13PM +0100, Philippe Mathieu-Daudé wrote:
>> Rename the 'endian' property as 'little-endian' because the 'ENDI'
>> bit is set when the endianness is in little order, and unset in
>> big order.
> 
> Hi Phil,
> 
> Unfortunately, these properties are not only QEMU internal these got named
> from the bindings Xilinx choose way back in time.
> 
> This will likely break many of the Xilinx flows with automatic dts to
> qemu property conversions so I don't think it's a good idea to rename it.
> If you like to clarify things perhaps we could keep an alias for the old
> one?

Adding an alias is the safest way, I'll respin this patch.

Note however I'm worried about this fragile disconnect between Xilinx
dts conversion which isn't exercised on mainstream (in particular if
you get busy and can't review).

> 
> For example:
> https://github.com/torvalds/linux/blob/master/arch/microblaze/boot/dts/system.dts#L73
> 
> Cheers,
> Edgar
> 
> 
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/microblaze/petalogix_ml605_mmu.c | 2 +-
>>   hw/microblaze/xlnx-zynqmp-pmu.c     | 2 +-
>>   target/microblaze/cpu.c             | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
>> index b4183c5267d..df808ac323e 100644
>> --- a/hw/microblaze/petalogix_ml605_mmu.c
>> +++ b/hw/microblaze/petalogix_ml605_mmu.c
>> @@ -90,7 +90,7 @@ petalogix_ml605_init(MachineState *machine)
>>       object_property_set_int(OBJECT(cpu), "use-fpu", 1, &error_abort);
>>       object_property_set_bool(OBJECT(cpu), "dcache-writeback", true,
>>                                &error_abort);
>> -    object_property_set_bool(OBJECT(cpu), "endianness", true, &error_abort);
>> +    object_property_set_bool(OBJECT(cpu), "little-endian", true, &error_abort);
>>       qdev_realize(DEVICE(cpu), NULL, &error_abort);
>>   
>>       /* Attach emulated BRAM through the LMB.  */
>> diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
>> index 1bfc9641d29..43608c2dca4 100644
>> --- a/hw/microblaze/xlnx-zynqmp-pmu.c
>> +++ b/hw/microblaze/xlnx-zynqmp-pmu.c
>> @@ -90,7 +90,7 @@ static void xlnx_zynqmp_pmu_soc_realize(DeviceState *dev, Error **errp)
>>       object_property_set_bool(OBJECT(&s->cpu), "use-pcmp-instr", true,
>>                                &error_abort);
>>       object_property_set_bool(OBJECT(&s->cpu), "use-mmu", false, &error_abort);
>> -    object_property_set_bool(OBJECT(&s->cpu), "endianness", true,
>> +    object_property_set_bool(OBJECT(&s->cpu), "little-endian", true,
>>                                &error_abort);
>>       object_property_set_str(OBJECT(&s->cpu), "version", "8.40.b",
>>                               &error_abort);
>> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
>> index 135947ee800..e9f98806274 100644
>> --- a/target/microblaze/cpu.c
>> +++ b/target/microblaze/cpu.c
>> @@ -368,7 +368,7 @@ static Property mb_properties[] = {
>>       DEFINE_PROP_UINT8("use-non-secure", MicroBlazeCPU, cfg.use_non_secure, 0),
>>       DEFINE_PROP_BOOL("dcache-writeback", MicroBlazeCPU, cfg.dcache_writeback,
>>                        false),
>> -    DEFINE_PROP_BOOL("endianness", MicroBlazeCPU, cfg.endi, false),
>> +    DEFINE_PROP_BOOL("little-endian", MicroBlazeCPU, cfg.endi, false),
>>       /* Enables bus exceptions on failed data accesses (load/stores).  */
>>       DEFINE_PROP_BOOL("dopb-bus-exception", MicroBlazeCPU,
>>                        cfg.dopb_bus_exception, false),
>> -- 
>> 2.45.2
>>

