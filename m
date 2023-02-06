Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4493502ejb;
        Mon, 6 Feb 2023 11:18:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9Pm42WccLa7cPdw7dqCDSXlJxq1gqVGFqp2KSQqztZr7CYl7nO0FS18AxOUUaFm81A+4o2
X-Received: by 2002:a05:622a:118d:b0:3b8:6b0c:9fd with SMTP id m13-20020a05622a118d00b003b86b0c09fdmr623152qtk.44.1675711091942;
        Mon, 06 Feb 2023 11:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675711091; cv=none;
        d=google.com; s=arc-20160816;
        b=CN4D7No+geC7Iz8oJuHBt8w5KnLFSdKovGQlO9AVDwZ33b2wv9Jtet0/+Aww0chhCV
         iV8TonPpgSKGkH1Q5wiYGUG4ZRKmu/fT1ODxuFkseigDUGFyQKWu/Hq9h4J/OuJ/ETp2
         bIWjwLT17zfetHIp5gXBUMGhQvkfeajuVGjOLGxN5ylhFiyaxirDGQoyf/aLcYkQY1Gx
         +a9ExOWb8vnDD2c3R8Frs2p+6BV8LLC4XI88iZzKSQssAKxer10Bcae9SlROHkVLX1Ef
         VzVv2CLrFdX8yIOPJ9kJEMnOpqR7JapStucvFL9HzO1LLgw8cJsc9bbYgcmeWOTbk4GR
         94Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=M77PmTTuHS2VyDvgrVyimi5pdY4ZRAlDugEZHT2trqQ=;
        b=VzTp/rlWZQpPSaJV/Vw3vMQhfotrIgDN9MeQWMlQh7qYj1EBqtqM/+K33auoSn3tAF
         89z/oU9pTmvXg1VAOu+J2BgY+mUTgha+aBPL/dfRYXZWtox5E6cILMBQ+lTQJTe4+Kvp
         btvjaICds+yzCLf/neATmKXlE63cBONhw1ELfueiM3I8dRaX/107TjW8eUTOqahwJ2UY
         MYyvU6L4wzMKIBCHG0GlB9upVruV3g6SYWJT+s798+u3/iqJ1vNDDKUeaozZrwA+AMFc
         SOflINj0Uy79uk+Iov6ql7zYmOzNIG7Ltixx8/YuSvCjcy3Zcb0DG2xGTMyKLiomiM1S
         GoNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPqQdXcG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j29-20020ac8405d000000b003ba205e06dfsi3473862qtl.67.2023.02.06.11.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 11:18:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OPqQdXcG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6zc-0006oN-4k; Mon, 06 Feb 2023 14:17:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6zG-0006n0-4u
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:17:30 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6zE-00017M-4W
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 14:17:09 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n2so9149906pfo.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 11:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M77PmTTuHS2VyDvgrVyimi5pdY4ZRAlDugEZHT2trqQ=;
 b=OPqQdXcGsJBxLVnbp/t4cFE4rfFG0qx8GqYyXd+vi9mxj3sk+v/+oP80Y1rT3b/j7A
 0s68JlGPCpo/+/sKkOHWvj/oTcTy8nBDCu8SYGA4uKgWYrcqvWz6/CRItV+VqaLhiy0C
 9WbRRvwbYGkAZvQF5Rc4nnzqHuCgrzntk1LEFOuj65LEbMU1bXYiGPWOjwEh3P0wHB8X
 NSYphI+E2C91nbFd6PheBSt3iX3SJk3myO3W7q85iPe4HXCBaCTz2Bu9WCp7F3mupl+A
 upWZD6EaATQ9/5u34e1W+QqhfXa4hXShK6f0/Tv1B7dGOxm/A/EbRyVvDDjI8RYRS3hq
 fO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M77PmTTuHS2VyDvgrVyimi5pdY4ZRAlDugEZHT2trqQ=;
 b=D5erTAHp19EzKgtWVRcjn1BffqgNi8dV5noxpW0nuhHODSB+/ne9XjlFUvDNMy1C5r
 2i+m5CqdaZrmIsVf4FzJYbqv7HAL2SZhlsXxmJvhhim7ooivkdjCOpwPvWxHS1gbimBG
 EplpbHxnkVzJrW+jd62rQzgABxSGRQbo6EAXXuFx/8r+BcWu6ZE1iXGFXHAmIFOtbaW6
 zNuKi/1nD3EyBNX92FqzILbGVIy+BfILsRvjy5NrBOmDZSp4K1oLGrPPblLY9F6Spckn
 JpCZb4zZ2tAfPn6ypG95NCRRSBvU929ok6pnkHyBptDra/jss0lVpXFdkgehuEK+l0+N
 sQRw==
X-Gm-Message-State: AO0yUKXySldnjajCsBPVVESFzSVQwKuomnGmWznHZf43x2f5E7PT3+Ci
 Pj3UPaPeBu4kYny2shXzeez7MA==
X-Received: by 2002:a62:1792:0:b0:592:705a:5a5e with SMTP id
 140-20020a621792000000b00592705a5a5emr449132pfx.9.1675711026451; 
 Mon, 06 Feb 2023 11:17:06 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 i22-20020aa787d6000000b005998a75dbc5sm5177239pfo.2.2023.02.06.11.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:17:05 -0800 (PST)
Message-ID: <e01a966f-b8b6-177c-6f92-6accfce2f27f@linaro.org>
Date: Mon, 6 Feb 2023 09:17:02 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] target/arm: Restrict CPUARMState::nvic to sysemu and
 store as NVICState*
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-7-philmd@linaro.org>
 <888efe85-b495-41c6-742e-70e9a0a5dfe1@linaro.org>
 <55a05bd4-5dd9-6880-2d61-22c31298d1bf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <55a05bd4-5dd9-6880-2d61-22c31298d1bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: otPWfqWiEyKn

On 2/6/23 09:00, Philippe Mathieu-Daudé wrote:
> On 6/2/23 19:57, Richard Henderson wrote:
>> On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
>>> There is no point in using a void pointer to access the NVIC.
>>> Use the real type to avoid casting it while debugging.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>
>> This is doing several things at once.  The nvic interface change needn't be done 
>> simultaneously.
> 
> You mean this change?
> 
> -typedef struct NVICState NVICState;
> -DECLARE_INSTANCE_CHECKER(NVICState, NVIC,
> -                         TYPE_NVIC)
> +OBJECT_DECLARE_SIMPLE_TYPE(NVICState, NVIC)
> 
> This is a No-OP, converting from the older DECLARE_INSTANCE_CHECKER
> style to the newer OBJECT_DECLARE_SIMPLE_TYPE. But OK, unrelated, I'll
> remove it from the patch.

That and the movement of cpu->nvic into the ifdef.


r~
