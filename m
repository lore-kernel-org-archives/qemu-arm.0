Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3581143ejb;
        Tue, 6 Jun 2023 08:50:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44MfxnOo0W0cN5vz4IXHVNHBVialGYS5b2Q+BwqjIDtZ+YeNsQ3s+vEEYnWo3w3y0G6ms0
X-Received: by 2002:a05:6214:2aa8:b0:625:aa49:19f3 with SMTP id js8-20020a0562142aa800b00625aa4919f3mr2037006qvb.64.1686066602318;
        Tue, 06 Jun 2023 08:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686066602; cv=none;
        d=google.com; s=arc-20160816;
        b=CIfpgRtqTw7y+ntrX0z1CfYgD1qBZNBxQ5DTTV77eKRckZCZJmIY8KR53Z5siIGaag
         lqKstidK1KUHnw6xOwLFM+HZzir+x0+Mpx9tfgyB7DLOLHvFoJE5plyGUq/4WU9T0SS+
         Kw0/Wrm2FR/Vmlcn7GqjMB1sFoXjSwSYejoODtZK7tgIlFYqdmKzjUkSSzH20oaHAZrK
         YB9xYdxPTuOXqVNK0Xjr4QJPHWi7SOIitMMINzqkfLuAgLGfR/maCaWdntRByViGR5rQ
         x5rlevuj1AjFU8VRDLt2xs8ODfCHRDagnoo8aHKGX0V5lP9CzoQpVeKWI9+WdaXEKjwQ
         lvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=flAQExrazbF5PEZnAPgAMS+V9HHW2JDhhuwpMF4zquM=;
        b=s+TyxMme2qjrO58voEhniyw3HHve5eFofDfEN25b3u2lPYz/018dK1W4AqIA8JDqfN
         I69EWzYEygSVwtSIHQJ0OCnN9a+axI4lrRTdrfKQ8CGLFxHjN9Q0da6JH1Sr4n3xXmJV
         Xe8jSStS+Xf29gBaX+xIgnzI96T4UjfhCQgjO4ffJz98k1s0hh84ZSX924bO3R5Ahs0i
         /5GTHbegqq07EcJdMEDKbv/NLYH6N1DRqJDPvULWY5lDAGgNtQskoxEA+/KqMJ6X90Be
         XsJqQG4fyCycNiuO6PjazmpZD8mKSuxnDAiAmMjCTDV9qWdSvWYtuZ6AOxvmyocz56MI
         y7SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IW9UK1JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ou38-20020a05620a622600b007485ed7d27fsi6054429qkn.453.2023.06.06.08.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 08:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IW9UK1JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6YwS-0006tJ-0Q; Tue, 06 Jun 2023 11:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6YwQ-0006sh-Ek
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 11:49:50 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6YwN-00035Q-2c
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 11:49:50 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6a6b9c079so52743655e9.1
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686066585; x=1688658585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=flAQExrazbF5PEZnAPgAMS+V9HHW2JDhhuwpMF4zquM=;
 b=IW9UK1JIIv+hZFOMjiNXRiLcBJn6OxgyWUbBEekzbc2/cps6LZdh+uhlz4mx720WHR
 BTkyVR3FqGE2SQ1gZy1qlpenhf0Jb+eTx4sHzT9sBXDFldeXBRNk3nkiJM405oAgLkn0
 F6RlXeGuQtfOeBq81iLfEba7Bwr/kgQlrqz08PU0ZdJqi2maN6ZtrQGoM0lEhqrAe7GE
 kSfuora4EejtgTJvz7sSmzG//bxRhb/SKnU/nqnWXM4waKDTcraPziEGOlUq33CCeyvo
 YIDCipBpknQA0wHfQM4BuW3WmRaJ2/aATwPSzWAb8jReM7SQxvAiOsur2E7BP6tcyMNp
 ZPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686066585; x=1688658585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=flAQExrazbF5PEZnAPgAMS+V9HHW2JDhhuwpMF4zquM=;
 b=ScGhAMY6/CnaD3KfPukYGDsRj3oF2DHblOiAhTSmN+1vQsq4S4pIYze7gL49/L8GlX
 m4l34/2AoRbwBT9t55ujcoibIuVcYV/b8K1eQTkO+Zfc/E9yJ191lWy7XKxB21cnRJDK
 PwbdnDoyiZaX6X6aP6WF/jx04OVBQq8XsJYYAeTLDd9Cw2rNlibmnV2Q4o4CtFcXnCob
 iBB27nszB5j0ZUX8cMrMTqkrK33wIfHil5ESJPC6dbxeEUQrbaQGwGQH0kl3/B/qXKgI
 JuqTEId+LlzzCxSymfwQ2bCEIdulmmQpmA87TRhDHWYAd3r1xIdrwEKtrpo1U6/Lv+5r
 ZeYg==
X-Gm-Message-State: AC+VfDwfaGyzOxiDVg4Tu+HwMdvdUi3Ceel4tWVNRqTkd/wtmEwLtlox
 UrZKV7tU3pCsDu1bl5OechyOhQ==
X-Received: by 2002:a05:600c:22d9:b0:3f4:23b9:eed2 with SMTP id
 25-20020a05600c22d900b003f423b9eed2mr2335574wmg.38.1686066585456; 
 Tue, 06 Jun 2023 08:49:45 -0700 (PDT)
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr.
 [176.184.50.104]) by smtp.gmail.com with ESMTPSA id
 y20-20020a05600c365400b003f60a446fe5sm14532041wmq.29.2023.06.06.08.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 08:49:44 -0700 (PDT)
Message-ID: <f991008b-015b-dcce-fe00-838a6ddefde5@linaro.org>
Date: Tue, 6 Jun 2023 17:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 2/5] target/arm: Rename helper template headers as '.h.inc'
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org
References: <20230606141252.95032-1-philmd@linaro.org>
 <20230606141252.95032-3-philmd@linaro.org>
 <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <9ff0f082-1b04-8bf2-6a97-1e9220aa4509@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: Ne5RagYPlbKV

On 6/6/23 16:37, Richard Henderson wrote:
> On 6/6/23 07:12, Philippe Mathieu-Daudé wrote:
>> Since commit 139c1837db ("meson: rename included C source files
>> to .c.inc"), QEMU standard procedure for included C files is to
>> use *.c.inc.
>>
>> Besides, since commit 6a0057aa22 ("docs/devel: make a statement
>> about includes") this is documented as the Coding Style:
>>
>>    If you do use template header files they should be named with
>>    the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
>>    being included for expansion.
>>
>> Therefore rename the included templates as '.h.inc'.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> FYI, after yesterday's tcg pr, we can do more than this.  These 
> fragments no longer have to be all included into one common helper.h. 
> Each translate-foo.c can include only the helper-foo.h.inc bits that 
> they need, and the bits need not be visible to the rest of the front end.

Don't we need foo fully converted to decodetree first? Otherwise
generic translate code can call foo helpers, so needs their prototype
declaration.

For example in translate-a64.c handle_msr_i(SVCR) calls
gen_helper_set_svcr() which is declared in helper-sme.h.

> It was something that I had in mind when splitting 
> include/exec/helper-gen.h, but the patch set was already large enough.
> 
> The renaming to .h.inc would have been the first step, anyway.
> 
> 
> r~

