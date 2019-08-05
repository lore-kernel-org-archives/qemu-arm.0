Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4169587wrv;
        Mon, 5 Aug 2019 09:20:06 -0700 (PDT)
X-Received: by 2002:aa7:9531:: with SMTP id c17mr76494626pfp.130.1565022006098;
        Mon, 05 Aug 2019 09:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565022006; cv=none;
        d=google.com; s=arc-20160816;
        b=yIVIRHGNxmqn5vPPnvfYLvPjxw81O6g5D8Qe48SFgfidDlj6icrTGmJXIzveu7aFBS
         BI26oJSwfcz3kOMVAsfIaPhlV57o2hR5BB71oOKCDYcHRyJtS3XOQOsoLpA1kHDZ58BK
         X9zlEcxPD7RrpIGBpqOeJLjqsKncvctAgfGjh8hBg7Y76qPP2KCq8wStbepouuUCA8JT
         +qR4Knx3ziTI1jSI8ji11prvAmN3M/2cQQdaX+KHR1AdEiyohtHhXOV/kQPn3TBv9Zj6
         LsV8AH4Ix2T4AnV1motnfBESWXVqzXmk+P5g2L4eGPcLMFm4XHJeMC+d1WLAlTvon9tD
         VTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=ykrIaRRlUHnB3gqql23VpXkEawQrstQbXy+aW/44nx0=;
        b=E8JJ40MLuTqDJ3k15tgQ/r+/JIUGy+kXQe0zONyr+PHcpkbLYWj3qkP092MXoOC/tb
         B3ODubDFjinZo0vBlw/G9W5KKhU4F6DVDUaxlvrmOlf2FCaiDDXOHjDSv6bB5eemuScm
         whZpaWEhaa5tLOpXqrdAnqlb5d0cKSB7efmcLXRTz8BqziOJ77/oHnCq0kBZGCow+XWX
         Nht9uP3WrTNcVxjE1jA+xdgUHP4r/UOfu3KSTabk6jBqROpQtRhXA3TskiU7wUoe4mlE
         bWQFs6Gg4PQDjRrFk1go8SKMyZBZxwiKECIJ/NA6zSf7iN1HWRrLhUgLmCgSyS+aur51
         R0UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkFzf+Uf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n13sor21801849pjf.14.2019.08.05.09.20.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Aug 2019 09:20:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fkFzf+Uf;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ykrIaRRlUHnB3gqql23VpXkEawQrstQbXy+aW/44nx0=;
        b=fkFzf+UfD29kFQ90jG3Lu9pvSmzmfc+DYy7uSFFrAfTzPIccOjGbmpDLERjCn6g5U2
         PFkMhtXbKFxN517tF1X0UnBqEhOzN9T6s0wHwOXDcE9diMtv9gUReZMLBtzSlcUz5yeO
         NfOUYzKFBHPeZ6/EtUAkIFMYuIZX4OfseBL+weuZ3gGcNSgzgerLeZN6n1oD52vp7ed7
         W9sbMcfEKZbC7/YUDd9G6xynA3ECkOBlD9111LDpj3ms1SvcHq4M7BxD2gMvr5yx86o+
         FbZaD83icryONFoWvQslsg5I0uo0mXUDxPcIeNotb0Vs0x94rwK7RBZmmxaSOOWhFY5W
         af3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ykrIaRRlUHnB3gqql23VpXkEawQrstQbXy+aW/44nx0=;
        b=HUM5j2pvxbgieBlqOk6V5BoJDrNdF9t/aeVxqupo5ETABoIBsPM0TPsuUlGwQbOMuM
         Pv7dxjl3nMavcnL9gnxMgoXqs9lkthD4F0XWiGU5CN0MMoL83BGpahFMzMbqVGbt3kSS
         MU4ZpLZYq0Z00DfURdcRFzbANykDrwCU+ymf2E+qh/R9L8QbkGm0wRpF5tfpZH1IKP/E
         kZWjUxCMCLuNaDX84uZ4wPNtxjJmifLowSbP/PKskZj0mokbFPj5VRg07dMuWhcu7F96
         gkOUOqGLVK981UbXNYPmOe39w/XH2eDmNZCicVKE2wfATurfK2wgIiqjAqt5oDfqQz2o
         Zp5w==
X-Gm-Message-State: APjAAAVhBcDU69JVqdlU3ZC3EVZoDIlVuaVqyJ8AU4EhL70w+ryHGouo
	7OHLDqZ45xIr3nE/B4/twMseQDrxazobWg==
X-Google-Smtp-Source: APXvYqwxnAP/wIdWlrPGtCX906vb/S6JU6OE9TqI9tn3ncNdhdBNscM88yXdolM/DUxwPlnt+v3qOw==
X-Received: by 2002:a17:90a:e397:: with SMTP id b23mr19075732pjz.117.1565022004990;
        Mon, 05 Aug 2019 09:20:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id p23sm89749515pfn.10.2019.08.05.09.20.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 09:20:04 -0700 (PDT)
Subject: Re: [PATCH 14/67] target/arm: Convert multiply and multiply
 accumulate
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-15-richard.henderson@linaro.org>
 <CAFEAcA8OC+Rru_qHU+1gQqmzmTY_8F+gtqZ5TyWoQAf60gUD1g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <51c91e79-5302-3eb6-60ce-e9a620026c54@linaro.org>
Date: Mon, 5 Aug 2019 09:20:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8OC+Rru_qHU+1gQqmzmTY_8F+gtqZ5TyWoQAf60gUD1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: ez/GP3Co6VpR

On 8/5/19 8:32 AM, Peter Maydell wrote:
>> -/* load a 32-bit value from a register and perform a 64-bit accumulate.  */
>> -static void gen_addq_lo(DisasContext *s, TCGv_i64 val, int rlow)
>> -{
>> -    TCGv_i64 tmp;
>> -    TCGv_i32 tmp2;
>> -
>> -    /* Load value and extend to 64 bits.  */
>> -    tmp = tcg_temp_new_i64();
>> -    tmp2 = load_reg(s, rlow);
>> -    tcg_gen_extu_i32_i64(tmp, tmp2);
>> -    tcg_temp_free_i32(tmp2);
>> -    tcg_gen_add_i64(val, val, tmp);
>> -    tcg_temp_free_i64(tmp);
>> -}
>> -
> 
>> +static bool trans_UMAAL(DisasContext *s, arg_UMAAL *a)
>> +{
>> +    TCGv_i32 t0, t1, t2, zero;
>> +
>> +    if (s->thumb
>> +        ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
>> +        : !ENABLE_ARCH_6) {
>> +        return false;
>> +    }
>> +
>> +    t0 = load_reg(s, a->rm);
>> +    t1 = load_reg(s, a->rn);
>> +    tcg_gen_mulu2_i32(t0, t1, t0, t1);
>> +    zero = tcg_const_i32(0);
>> +    t2 = load_reg(s, a->ra);
>> +    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
>> +    tcg_temp_free_i32(t2);
>> +    t2 = load_reg(s, a->rd);
>> +    tcg_gen_add2_i32(t0, t1, t0, t1, t2, zero);
>> +    tcg_temp_free_i32(t2);
>> +    tcg_temp_free_i32(zero);
>> +    store_reg(s, a->ra, t0);
>> +    store_reg(s, a->rd, t1);
>> +    return true;
>> +
> 
> Is using mulu2/add2/add2 like this really generating better
> code than the mulu_i64_i32 and 2 64-bit adds that we had before?
> If we're going to change how we're generating code it would be
> nice to at least mention it in the commit message...

I didn't really think about the code generation difference, merely that it
seemed more obvious, given that all of the inputs are i32, and we need i32
outputs.  I assumed it wasn't written like this in the first place because
tcg_gen_mulu2_i32 is relatively new.


r~
