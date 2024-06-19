Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1082663dlb;
        Wed, 19 Jun 2024 09:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWnc9NHuBjjKDSuTrx9kdT5OvIOfyA5TD1yfXA+dQGfCfrcnowrLmmLV5ts5BdCI5+8LKewgI5pKX12fcyb559R/QycBBtu
X-Google-Smtp-Source: AGHT+IH/+0Uy51oC9L0Fm5kV75jxDPT8OcfG6dBf8aJRubxdPnQnrqMPSaoilX5jvEDY2r4XuA5Y
X-Received: by 2002:ac8:7c52:0:b0:441:5651:2008 with SMTP id d75a77b69052e-444a79bff2fmr36421591cf.16.1718814579087;
        Wed, 19 Jun 2024 09:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718814579; cv=none;
        d=google.com; s=arc-20160816;
        b=fJJ3CCdOt6yh+fwFZVcyk3HZ1XvAqymyL//QUPvCJdm3veT73RmPc+ybeP3V7I26Tu
         T9zoJRgmvyQnCeOW1zWPnJ5q/9UxsHv4tY6sL2xrfJZaJn5nrf9BJ80tCVg5cjGRBjeD
         SzOiwIo/r/4QmwkhLA7iE0uTO3SbP74XAOo5TT19j9Q8USpYE0hbQ8bxVoYxSHel4bnf
         XQM9v9ZXJf7uwypbdf3+Qyzf6j5n13GkH//1nrXlyOZ1eWanP/2SoUMIr43X1zzG/YNm
         e8V6X515DpnMjo18qSShiu2P3UuGEFbiyRtEuqt8W/CSORBKTSg9oWgj/qF9QbRallYF
         ln3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=6McMYb4tODsXiOnKF4xaY6QdMGubIuN3c32Tk0SrYzQ=;
        fh=q8qkPaMFXvdkKBZZ3wUw/R5cUibbpSb1cshVJUtYpJ0=;
        b=UsnayunAC/09zH9ap/gALJc15O4pnIWv+IgSUT+XXkwSRlLTpd7/5mhci/TnXd8Cb1
         i8k+8RM5YDcmeyusWNq6bhZeI/z0PjHKYjena/tkQFno/mzdoaoDdYnwQvECOhZ17UEm
         L6bOCIpFXxnYHYMiUORU7cNeHos7NAa4AUoLM9vqNr924e7aUsPEyv5lJQsFi8+j2Ca6
         T+6iSiq+VRI0eeEH+oCDWNfaXB1Ehxd+R7t3zMLrFyaIuFS59aQvvPcHSbeGco0n8Zc+
         M7SkkHiL7yJ1g2qswXGuu3U8uYE0NVEBvOEh0QxSljdG6oNa0Gr4+AQxdlBr+Y7Wwxnb
         vNrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUQScL4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441f2fbb9f7si146940361cf.421.2024.06.19.09.29.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2024 09:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUQScL4H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJyBN-0004sr-9b; Wed, 19 Jun 2024 12:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJyBM-0004s6-4d
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 12:29:12 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJyBK-0000fY-22
 for qemu-arm@nongnu.org; Wed, 19 Jun 2024 12:29:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42121d27861so213995e9.0
 for <qemu-arm@nongnu.org>; Wed, 19 Jun 2024 09:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718814548; x=1719419348; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6McMYb4tODsXiOnKF4xaY6QdMGubIuN3c32Tk0SrYzQ=;
 b=XUQScL4HTQONfMoUFGjHlPMyj0jydmBB8GwCvOWAqu91A/juVS2KTJeqj9/WfWhEph
 n1yO6DCD0mRaXLo5CVRkI0WYTxfJ5OIn7tb07Y+y9Sj6rBvymJmNt50S8hO6CD4iLf+y
 JjZHXejzrwwaXrBUmCnBBLzMjYlWxNtYNMhOk5PonkESLMZpUcbtPOfhnbVeGUqlUcsB
 lHMmnk9coWR5tNuuNfDh+QkjAHDlZYID8Btly7ko120oSqMHx25FWlggeOf8ddUzQtlv
 Ifui/T6GzKMyGzxLPH0K7yc3dZ9sov6wwtNH1+s2RsIkF9Dad06lkrIvl71JkNLVMwZp
 4HjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718814548; x=1719419348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6McMYb4tODsXiOnKF4xaY6QdMGubIuN3c32Tk0SrYzQ=;
 b=e3gaGz5BJoyhJYi/i5ewkM/4Vf1ljs+ysrK8Go2MCBslj5pV2dCaVRm1jwBvJUTp+P
 J2RH+D4Nma8ABVNzceJwxRvwk64k2HVZyNx57o+elzjYMHzdf/hmFpyOTXiZhmcfy/m6
 +4ntnD733VBgz3CyOI1fR4v+XQ9NLLhQbX9rdN7trRaJ8KyGT4QX0KE05/VoO2DQdfC0
 sINMe+37jgsgJlXhg8wNGSAoDRgP8AAotLchdpci0NE47SdM54qX7kxQDvDkFc24bipa
 mjau/JBPfJ3fOd9mpqH6qr9KOaL9snEr5swOBTWG9OIJ2Y04QURvDv5i3Joqfg2Wb3RU
 uSww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNKLLLglmSQBhhRcTNkV8b3/FBWqURvXeQct8l6z652PrifYrUkYUs4b+PglFg131VJYmdI9L9wejv0esEvw6/+M5m
X-Gm-Message-State: AOJu0Yz0DZ6rtMGvIUQxs7QO9jl9EKRyH6LbgZ284co8sDMMlcvCrY2I
 ntz+jKOJWV06dugjjFS4Www9TJw+//7u0oEwOZ00i7uAAIS7mN30zfI+O18hl/0SCxyRYuO/HUB
 1
X-Received: by 2002:a05:600c:3b8d:b0:421:7ac9:460c with SMTP id
 5b1f17b1804b1-4247529a970mr20910195e9.39.1718814548438; 
 Wed, 19 Jun 2024 09:29:08 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.133.105])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6127d6dsm236265685e9.26.2024.06.19.09.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 09:29:07 -0700 (PDT)
Message-ID: <49028fcf-40a9-446c-9606-da4471a4456f@linaro.org>
Date: Wed, 19 Jun 2024 18:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/gpio/aspeed: Add bounds checking for register table
 access
To: Zheyu Ma <zheyuma97@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240618130928.3075494-1-zheyuma97@gmail.com>
 <bd15ab0597caad4564ca8f9498dfd3bbbe67df89.camel@codeconstruct.com.au>
 <CAMhUBjm6vBO8RWx9OqCvFqGBNVRy3j2FyhZM4tTp0dZwh3L2aA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAMhUBjm6vBO8RWx9OqCvFqGBNVRy3j2FyhZM4tTp0dZwh3L2aA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: lCHXcErOn2Mc

On 19/6/24 08:49, Zheyu Ma wrote:
> Hi Andrew,
> 
> On Wed, Jun 19, 2024 at 1:58 AM Andrew Jeffery 
> <andrew@codeconstruct.com.au <mailto:andrew@codeconstruct.com.au>> wrote:
> 
>     Hello Zheyu Ma,
> 
>     On Tue, 2024-06-18 at 15:09 +0200, Zheyu Ma wrote:
>      > Added bounds checking in the aspeed_gpio_read() and
>     aspeed_gpio_write()
>      > functions to ensure the index idx is within the valid range of the
>      > reg_table array.
>      >
>      > The correct size of reg_table is determined dynamically based on
>     whether
>      > it is aspeed_3_3v_gpios or aspeed_1_8v_gpios. If idx exceeds the
>      > size of reg_table, an error is logged, and the function returns.
>      >
>      > AddressSanitizer log indicating the issue:
>      >
>      > ==2602930==ERROR: AddressSanitizer: global-buffer-overflow on
>     address 0x55a5da29e128 at pc 0x55a5d700dc62 bp 0x7fff096c4e90 sp
>     0x7fff096c4e88
>      > READ of size 2 at 0x55a5da29e128 thread T0
>      >     #0 0x55a5d700dc61 in aspeed_gpio_read
>     hw/gpio/aspeed_gpio.c:564:14
>      >     #1 0x55a5d933f3ab in memory_region_read_accessor
>     system/memory.c:445:11
>      >     #2 0x55a5d92fba40 in access_with_adjusted_size
>     system/memory.c:573:18
>      >     #3 0x55a5d92f842c in memory_region_dispatch_read1
>     system/memory.c:1426:16
>      >     #4 0x55a5d92f7b68 in memory_region_dispatch_read
>     system/memory.c:1459:9
>      >     #5 0x55a5d9376ad1 in flatview_read_continue_step
>     system/physmem.c:2836:18
>      >     #6 0x55a5d9376399 in flatview_read_continue
>     system/physmem.c:2877:19
>      >     #7 0x55a5d93775b8 in flatview_read system/physmem.c:2907:12
> 
>     I'm mildly interested in what you were doing to trigger this. Certainly
>     we could do with a guard in the model to prevent it, but I'm curious
>     all the same.
> 
> 
> Actually, I'm doing the virtual device fuzzing test and trying to 
> discover bugs.

Could you share the reproducer? (As you did in your other patches,
it is very useful to reproduce).

> 
>      >
>      > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com
>     <mailto:zheyuma97@gmail.com>>
>      > ---
>      >  hw/gpio/aspeed_gpio.c | 26 ++++++++++++++++++++++++++
>      >  1 file changed, 26 insertions(+)
>      >
>      > diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
>      > index c1781e2ba3..1441046f6c 100644
>      > --- a/hw/gpio/aspeed_gpio.c
>      > +++ b/hw/gpio/aspeed_gpio.c
>      > @@ -550,6 +550,7 @@ static uint64_t aspeed_gpio_read(void
>     *opaque, hwaddr offset, uint32_t size)
>      >      GPIOSets *set;
>      >      uint32_t value = 0;
>      >      uint64_t debounce_value;
>      > +    uint32_t reg_table_size;
>      >
>      >      idx = offset >> 2;
>      >      if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <=
>     GPIO_DEBOUNCE_TIME_3) {
>      > @@ -559,6 +560,18 @@ static uint64_t aspeed_gpio_read(void
>     *opaque, hwaddr offset, uint32_t size)
>      >          return debounce_value;
>      >      }
>      >
>      > +    if (agc->reg_table == aspeed_3_3v_gpios) {
>      > +        reg_table_size = GPIO_3_3V_REG_ARRAY_SIZE;
>      > +    } else {
>      > +        reg_table_size = GPIO_1_8V_REG_ARRAY_SIZE;
>      > +    }
> 
>     I think I'd prefer we add reg_table_size as a member of AspeedGPIOClass
>     and initialise it at the same time as we initialise reg_table. I feel
>     it would help maintain safety in the face of future changes (i.e. if
>     another reg table were introduced). With that approach the hunk above
>     can be dropped.
> 
>      > +
>      > +    if (idx >= reg_table_size) {
> 
>     This condition would then become:
> 
>     ```
>     if (idx >= agc->reg_table_size) {
>     ```
> 
>     Thoughts?
> 
> 
> I agree with you, adding a new member is a more maintainable way, I'll 
> send a v2 patch, thanks!
> 
> Zheyu

