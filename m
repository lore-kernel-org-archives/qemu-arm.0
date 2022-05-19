Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1202581lfh;
        Thu, 19 May 2022 08:06:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSXec9xnhZ3+O4T/QNcY5+dPANIvVmGn+HiUU+uyZJgM3OrvFpuI6kRbF9WUV67uKy6iEO
X-Received: by 2002:a05:622a:40e:b0:2f3:db3b:7d4d with SMTP id n14-20020a05622a040e00b002f3db3b7d4dmr4171344qtx.655.1652972787152;
        Thu, 19 May 2022 08:06:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652972787; cv=none;
        d=google.com; s=arc-20160816;
        b=cDVd1IBo0OnZ8BEKs7xm65MbCzu1LVd/vOr6BGCMB6wTEAov4rWsBoiTvioRGi3lbq
         G6SgwCYS9C5FSAVBXkmrQbKVC2cJ8A6WGVT67r/aP9HU2USaEPitum/Ei4ZJQhES0ISv
         kKPMnrZ0vlXukJNOk4Xz6SMgS6OpXLyuYKWOSYihA0TWJMZ+wT1K9cHbO96gPHi2UJui
         gIcIBQXCyZsEXIilvvfeXZRQw1j6eohUFXCmB1EKxIdebHDgFZ4BA2X0OPxbSCF6Bvi0
         X68KaOEogvAuLBT2kzTnIMS+s+NLQjmlTa+w4+PXaemXWvNTp3h4qieMLMcfyrR05GIz
         f4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=VFnRLzhGRgOsqKCf1km/rcHk8BImVp8LD/M50YdThzQ=;
        b=LzuvoIXZjAvO87uNFHPPnpLYs7ZAv6+q+Z24fk7TEvVG7aDWxlG9bZP+Hf87Z1uOEJ
         gNNWq7EJ368yNzGU9o8Zu4v6LEiXPWC6sv59R9XC0B+qXJ2ST9PoVvCa7erW/ICz0oMX
         /+3BLlQct8SzBxmz62rX2JNuZfiPfq6icgXEcoVqcuFSBWBLENiE/vAJoUniK894jTVU
         fNigWn9J4ZrpVc4sb0QSaiplbyRtPPzQ1VC5A8zpKIeeew3kh3rmg2LtmIUgD5b+YyTY
         wbqv6Hu6ratdiMJj2CcE2PIJ7xjhRIv2Eg5VkbIT5JJ3Iuk/BEn5ymYk8dTWYrY/fw8D
         hRLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Frt8UFM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke8-20020a056214300800b00461e7c7cc42si1194256qvb.129.2022.05.19.08.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 08:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Frt8UFM8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrhjO-0002go-K9
	for alex.bennee@linaro.org; Thu, 19 May 2022 11:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrhej-0006x0-He
 for qemu-arm@nongnu.org; Thu, 19 May 2022 11:01:37 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nrheg-00030E-Br
 for qemu-arm@nongnu.org; Thu, 19 May 2022 11:01:37 -0400
Received: by mail-pl1-x62d.google.com with SMTP id i1so5045013plg.7
 for <qemu-arm@nongnu.org>; Thu, 19 May 2022 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VFnRLzhGRgOsqKCf1km/rcHk8BImVp8LD/M50YdThzQ=;
 b=Frt8UFM8xnu/TJH2AOpD/Yu1d7r9Jvw+tEI2aSCQ+ZWRZc8lZO5YJeW1UWYrsYMrqJ
 HnkJXBiAV4k6fpi/HwiHG3MdN8Izw/v67LBEhwtOmkiWDf6NCOhJbb9Ajc6gGACwZEvW
 OyQKpUnkM2sbUINoDIkYoRRkEUt2t4/1F7DoR9+MPwpUmf/CiOOIHdzJfj0YlqE7Cv97
 XjyBq7fXERHEUFd/gRbg7zp+9ggxWza3kVr6+wBWVUw9t9fZNaBL2QzMCTByHmHLaHfl
 d4/RZnu6FK78D5TSipzbBWuPl4FY+bZfETyHBGSUUJm8zX5odPzSubHNqaeZvObA9ehE
 DutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VFnRLzhGRgOsqKCf1km/rcHk8BImVp8LD/M50YdThzQ=;
 b=oDZGw75TtQ1IBZj9L9B/7qlrfubv7S4VArsjAgiPo7AaZQmwzwoxxf5mdFuGpEnrPQ
 lepj0cq0Mwl4nh8He+Lee1KDafknjqbkgpW6ctsKFFefwAAbSNxrf5+Y2RtUuiXQdYlB
 uiAXbh2Z+2f2VD8zVznahHnQOssGMb7O/3nyxS9WIigKVvLEbgF9gojPbuO9Zsw66YtC
 mNZ3V74ldMpm2XVXczLP5hiGwaXVSEyr6rrwPAnh4n7ic1qtDtIVIIkpxJUcavuU8uS4
 90azWSFoQkBf47pJGuhR23NYW4vF1aYduRRcqJPGrnyhuqqOYdwboZQxKX3FOvJeEN/C
 7yfg==
X-Gm-Message-State: AOAM531RYyk5Th5SCezwmOsfHRQ35SbfF2q3SA71iYXKtA6kK+r9w+Or
 5RFblfDYew0fZtYSlSjA07mlig==
X-Received: by 2002:a17:90a:f3c2:b0:1df:8d56:d8ce with SMTP id
 ha2-20020a17090af3c200b001df8d56d8cemr5506181pjb.86.1652972492276; 
 Thu, 19 May 2022 08:01:32 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a17090ade0300b001cd4989fecbsm5703617pjv.23.2022.05.19.08.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 08:01:31 -0700 (PDT)
Message-ID: <184a5c35-081c-9f85-a344-02c04766340a@linaro.org>
Date: Thu, 19 May 2022 08:01:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 6/7] target/arm: Remove fp checks from sve_exception_el
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-7-richard.henderson@linaro.org>
 <CAFEAcA_oX3RRc4mLtBZc8SH9pjAM_cDQzqgzoqxH+8+Rct68mA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_oX3RRc4mLtBZc8SH9pjAM_cDQzqgzoqxH+8+Rct68mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4qVvM2zALVQq

On 5/19/22 04:36, Peter Maydell wrote:
> On Tue, 17 May 2022 at 07:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Instead of checking these bits in fp_exception_el and
>> also in sve_exception_el, document that we must compare
>> the results.  The only place where we have not already
>> checked that FP EL is zero is in rebuild_hflags_a64.
> 
> aarch64_cpu_dump_state() calls sve_exception_el() and doesn't
> check against the FP exception EL.

Yes it does, just 6 lines above -- fp_exc == 0.

>> -/* Return the exception level to which exceptions should be taken
>> - * via SVEAccessTrap.  If an exception should be routed through
>> - * AArch64.AdvSIMDFPAccessTrap, return 0; fp_exception_el should
>> - * take care of raising that exception.
>> +/*
>> + * Return the exception level to which exceptions should be taken
>> + * via SVEAccessTrap.  This excludes the check for whether the exception
>> + * should be routed through AArch64.AdvSIMDFPAccessTrap.  That can easily
>> + * be found by testing 0 < fp_exception_el <= sve_exception_el.
>> + *
>>    * C.f. the ARM pseudocode function CheckSVEEnabled.
> 
> We should probably note that the pseudocode does *not* separate
> out the FP trap checks, but has them all in the same function.

Sure.

>>           /*
>> -         * If SVE is disabled, but FP is enabled,
>> -         * then the effective len is 0.
>> +         * If either FP or SVE are disabled, translator does not need len.
>> +         * If SVE EL >= FP EL, FP exception has precedence, and translator
>> +         * does not need SVE EL.  Save potential re-translations by forcing
>> +         * the unneeded data to zero.
>>            */
> 
> These comments say that if SVE EL == FP EL then the FP exception
> has precedence, but looking at the pseudocode CheckNormalSVEEnabled()
> it seems to be the other way around:  eg if CPACR_EL1 has
> "disabled at EL0" for both the .ZEN bits and the .FPEN bits
> then the SVEAccessTrap() is handled first.
Yep.


r~
