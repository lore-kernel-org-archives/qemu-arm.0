Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp590593ejc;
        Thu, 23 Feb 2023 02:44:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8ISY+vl1z0u0TgfKcCni0ah3ObPpdeNsq57mr93usSpdASy4LDcgjQlA+2UCQabdgikYkv
X-Received: by 2002:ad4:5d65:0:b0:537:4b09:670f with SMTP id fn5-20020ad45d65000000b005374b09670fmr22831784qvb.25.1677149087099;
        Thu, 23 Feb 2023 02:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677149087; cv=none;
        d=google.com; s=arc-20160816;
        b=DWtmG4i9qUJ/mj1522oEvwdWeZsdlH2GImJtXgYqwQJdhwTBQB187T/6PUD7Xrn5nN
         Oy0r0hBObEZRZppLVjtRRTr5YS30/qdFBvvowqWo5VLA1rzWIF75dUqF3sfRpUzadzO9
         1cf4MR/7J44yiWh5eik+BLNhThY1zWaBQyXcbJM5VSuxfA3WMoE+spopU2YsVk7Hp6Se
         3xdXMVWXFXKtO29xGRztJNDa2zkgi5/ckE6r7eqSpg0ReQnRxAVTcX81A1hpNoNHeUG1
         hui/l+h9Zck/IcFWkO94WqY5McOW1tZpuHMDFmrha5+2LZeAIyWThv4p+jZTQTDD8VGW
         dI/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SImOkEqmDdEkwhMjhXOR0F510uW6Vxv8G6En62JaJkI=;
        b=SKERDDeioKSC3Iat1g5uzoliwmLemi3+kvvEZK2BDrs/aAIkm8fVTEbIFBCnyZZcvh
         YllNJgGk/Yx9S107Vzm5HdZ68k4/ri2Xua2Kpo8KLwxPWExoyyq5QJoa8rzGD5DPQ+/r
         m05K2sMt50ZGJfPNjqAyhSmTzutm4sVpbYA8lcK1ESQSfz+1QGNwVCxfo54+OXCluDEB
         TBvNkOtrF2T8hgygjEuprzPOau8ZO8gRcbOMyF/D60z9tpNIJ3R9E1W6BvlGeVFTEt0m
         +sNagw0AgRJykrmr5u4GHnj38XrSIObFkupX4v5I4SR9Yy3AFThJEd8MUnl3QjEjbEGJ
         XENw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wx4x7yu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a0cf5cb000000b0056c23bb1597si7933406qvm.88.2023.02.23.02.44.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 02:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wx4x7yu/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pV95W-0002ny-0k; Thu, 23 Feb 2023 05:44:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV95P-0002mH-9j
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 05:44:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pV95N-000887-0z
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 05:44:27 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso9869307wmq.4
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 02:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SImOkEqmDdEkwhMjhXOR0F510uW6Vxv8G6En62JaJkI=;
 b=wx4x7yu/A1lmheTqE1uuvt/BGNAx0w3nBgIlgO8lz6gT/4AdGbqTL2I4iQV5xIipQ1
 tcEQv65DEFVQRqdjeL90ynscsL7IlnAagbQMliQfj0BHcNnlhqpnC15DZ0QF1m1Yp9Hr
 dpJHy8CgBNBg1gfKFzZ+1rPBXlTND50VbbQvRGcaUVYJTG3CuOYPaIJzjX6d5ZXnIzZP
 nDOL4YHvNQHJgGOTF5Kq8x5aSwbXuPeILDiEEYEEybb5sAZyTKuixanTQ4TH34sK0YmR
 dGwam3yGRdkk3+KIyqfGE4SdYYgFyuFO15fDOixADUm1DRW168/TOo/WvKec8rdJgrQV
 ebbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SImOkEqmDdEkwhMjhXOR0F510uW6Vxv8G6En62JaJkI=;
 b=XafycS4sxP2wY5vBx7DtdnccDS56oXlO/W7GS7aLBOBe8RKOVyPa9MsxyBkqQ9VyPt
 TPjDX9Bub+SU3R8jpV7EHUYgaFE1U6izkcW/+2QSyeCj18KgkXUFkfgr4ceehBwxH1Nb
 E0Ecq7ovZwoHa0hiCvUsnO0w/hBRLKfKQaSK8Su9v+dUon3BL2Hgopz2CrTjWKITlxaL
 zNluFnhwjlLYaLFcS2by/GYlF467Dc51nxyvY88jS8NjK0BOZh/LfrEv7sXIUzEQTLRl
 ZU4VLnoK0R+vmb6D5bfHbh+yWmzJSSB7wPWpvTMYy15ttJqOwr5/eAPu7reObuznnwVN
 XR/w==
X-Gm-Message-State: AO0yUKVk+LICYbEU2V0hvSZHvo8WO4PczVeYFN4NnzuAyulRvYlHneJy
 0ApbcMS3ClL7lENAzxlL3uloXQ==
X-Received: by 2002:a05:600c:3b20:b0:3df:db20:b0ae with SMTP id
 m32-20020a05600c3b2000b003dfdb20b0aemr9844135wms.17.1677149061140; 
 Thu, 23 Feb 2023 02:44:21 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 15-20020a05600c22cf00b003e11f280b8bsm11597260wmg.44.2023.02.23.02.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:44:20 -0800 (PST)
Message-ID: <a7bc04e9-a3e8-1210-976e-f166b25cbc8e@linaro.org>
Date: Thu, 23 Feb 2023 11:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, Alexander Bulekov <alxndr@bu.edu>,
 Shengtan Mao <stmao@google.com>, Hao Wu <wuhaotsh@google.com>,
 Chris Rauer <crauer@google.com>
References: <20200911052101.2602693-1-hskinnemoen@google.com>
 <20200911052101.2602693-9-hskinnemoen@google.com>
 <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
In-Reply-To: <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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
X-TUID: EUtVTwx8zSKC

Tyrone, Hao, ping?

On 22/12/22 16:03, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> (old patch)
> 
> On 11/9/20 07:20, Havard Skinnemoen wrote:
>> This supports reading and writing OTP fuses and keys. Only fuse reading
>> has been tested. Protection is not implemented.
>>
>> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Tested-by: Alexander Bulekov <alxndr@bu.edu>
>> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
>> ---
>>   include/hw/arm/npcm7xx.h       |   3 +
>>   include/hw/nvram/npcm7xx_otp.h |  79 ++++++
>>   hw/arm/npcm7xx.c               |  29 +++
>>   hw/nvram/npcm7xx_otp.c         | 440 +++++++++++++++++++++++++++++++++
>>   hw/nvram/meson.build           |   1 +
>>   5 files changed, 552 insertions(+)
>>   create mode 100644 include/hw/nvram/npcm7xx_otp.h
>>   create mode 100644 hw/nvram/npcm7xx_otp.c
> 
>> +/**
>> + * npcm7xx_otp_array_write - ECC encode and write data to OTP array.
>> + * @s: OTP module.
>> + * @data: Data to be encoded and written.
>> + * @offset: Offset of first byte to be written in the OTP array.
>> + * @len: Number of bytes before ECC encoding.
>> + *
>> + * Each nibble of data is encoded into a byte, so the number of bytes 
>> written
>> + * to the array will be @len * 2.
>> + */
>> +extern void npcm7xx_otp_array_write(NPCM7xxOTPState *s, const void 
>> *data,
>> +                                    unsigned int offset, unsigned int 
>> len);
> 
>> +static void npcm7xx_init_fuses(NPCM7xxState *s)
>> +{
>> +    NPCM7xxClass *nc = NPCM7XX_GET_CLASS(s);
>> +    uint32_t value;
>> +
>> +    /*
>> +     * The initial mask of disabled modules indicates the chip 
>> derivative (e.g.
>> +     * NPCM750 or NPCM730).
>> +     */
>> +    value = tswap32(nc->disabled_modules);
> 
> In which endianness do you want this 32-bit fuse value to be written?
> 
> I suppose you used a little-endian host, so we want it big-endian in
> the OTP? In that case it would be better to use cpu_to_be32(), to
> be able to use the OTP on a big-endian host such s390x.
> 
>> +    npcm7xx_otp_array_write(&s->fuse_array, &value, 
>> NPCM7XX_FUSE_DERIVATIVE,
>> +                            sizeof(value));
>> +}
> 
> For completeness:
> 
>  > +static void npcm730_class_init(ObjectClass *oc, void *data)
>  > +{
>  > +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
>  > +
>  > +    /* NPCM730 is optimized for data center use, so no graphics, 
> etc. */
>  > +    nc->disabled_modules = 0x00300395;
>  > +    nc->num_cpus = 2;
>  > +}
>  > +
>  > +static void npcm750_class_init(ObjectClass *oc, void *data)
>  > +{
>  > +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
>  > +
>  > +    /* NPCM750 has 2 cores and a full set of peripherals */
>  > +    nc->disabled_modules = 0x00000000;
>  > +    nc->num_cpus = 2;
>  > +}
> 
> Thanks,
> 
> Phil.

