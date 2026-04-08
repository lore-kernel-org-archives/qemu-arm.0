Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0300310F9975
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:47:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYRm-0000t4-GX; Wed, 08 Apr 2026 15:20:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAY2H-0005Zo-PC
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 14:53:57 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAOeD-00056j-30
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 04:52:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so18382415e9.1
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 01:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775638347; x=1776243147; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9uUUnxtFBhwO1Macg7o3jj5U/GPlkp6OmGByalmzxyA=;
 b=OHUlJ/2a4DlT0bTT8Un7QnZn1SR5Ja4qaLqnRlt+6nDGrgVkz14YoQMLsOZi0UjKIj
 DVxAdG0ZAPtcQMJ3O1vKvsCUSayfcV02b6bl738AWTuO6lBRqQgSkM8cUT7ugVTLvMFO
 swAqGFu9SqHQX+Kc6rAfQ+mDTQq7JL0Wu96PxeMScD/b6/w1f/2Em8GwFNj6O8xMlVmQ
 JSqSM8rdaaZN6Vjhw5MA9Eiq/teQFXHNwEa0/x0CsQ0Qdv+2oAM4iA6V4K3ImaaMTrde
 fXAtek0AQJifgYfwTc/cH+BvYOqPH6f+mfndxPN9FXBtEwq1cfSZ47qIviXsJz97SX6G
 DKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775638347; x=1776243147;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9uUUnxtFBhwO1Macg7o3jj5U/GPlkp6OmGByalmzxyA=;
 b=CBLdd6MglUS9EvugkMLDLIyTkhZ9BAHz9Gm4zmR24xLE9ezHMa3/bsrhmiU/QFhPVY
 ursGLMcZSrhSb0pTJ8Ox14yzXYWijJgTkLk7Lt5jE4UNzVHCf+EzjaqbVRGJxaoN+2eS
 ml4hMETiN5/heHRpwNhdyCUABfFmMR6Nbj6bDEBKZCxY9RvhUYfe4TRGd8QITJUO4GDv
 8e1qgA0cIrWTZUUYPsEDdu0xqaSRApDwqGxkCb3AMwntHa/WiVP+Mklf6rU1CJKR71BR
 m6AXjNH5y9oTY5LVuU5b/hxjkLKihLUk5j3QaUMwRkxeHzKw/qE9EmGFJlMO8acGOqKU
 3peA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwzR4aAdOons2gfC2WgaZr+ZoHy8GBu0EqWaMp33Hl2fW4zNclgBVZuD8t9PcerehTnVDb4RV6Xw==@nongnu.org
X-Gm-Message-State: AOJu0YyVzFaLi04/3OhYKOEYEpxswbJEz+pLrmL80GzuO/rOa0k8RZjp
 oxo8EQQeu/GGn5Gqa58YdnhsvI+BxyVLVfe6AQJ/2g0cSvifogNdq8JkwW6oM75maIQ=
X-Gm-Gg: AeBDievceQPh7vfQkLZSbrSUHjOZCc2Yt7/i2zTsKahmlgidCCI2cbe9q8L8yCZTVQG
 mRO9qQml/nX717dhwbcdCNZVlY9APMoEZh0s3gzxdYz4LdGOuJHT+lZp41F4x7CmcZP2Dn8rCeU
 12jmefMM7fUC6xq5NQPvEfP4mHJJwUf6mTslPiCM7FU8jt3Iek3MZTqEAlwci1ivVeNaRA7FYTl
 f3xORLLiyoBMdJHFj9fbGoBsPkbl8BAUWastwZihUmE0XND4IPfgNV9nPkMOKesfVhdAj6oDACz
 euU9kqtI1JK7RdXkBAIAdIFMkS1S1JAkSMfYZcM5rzJk3E91fwEvSxgVu3HFVAHifHl14a5JAfY
 l8DzWzQ/b3gmEn7Sv9wiZ1JRJJb/XDfICUkUhjzdMQWtFr7QlB7+AMn4JjH3vt9rNstewxr/qa9
 n8ANODwJFFcweYp4xsSrUJihIUk72SpcKoJCXIGVXqVvPjD7WzH2D506K9RDboH/oksw==
X-Received: by 2002:a05:600c:1d86:b0:488:8b52:f7de with SMTP id
 5b1f17b1804b1-48899715a69mr241607675e9.12.1775638346927; 
 Wed, 08 Apr 2026 01:52:26 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4f52easm58094329f8f.36.2026.04.08.01.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 01:52:26 -0700 (PDT)
Message-ID: <7cab0763-c744-44c6-9488-3191869cce6a@linaro.org>
Date: Wed, 8 Apr 2026 10:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 19/20] target/arm/tcg/translate.c: remove target_ulong
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org
References: <20260407022748.57629-1-pierrick.bouvier@linaro.org>
 <20260407022748.57629-20-pierrick.bouvier@linaro.org>
 <614088dd-edfa-4cef-aef1-b697c8b4aaa2@linaro.org>
 <ae93b673-7969-48be-818e-086ca39fa1e8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ae93b673-7969-48be-818e-086ca39fa1e8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/4/26 21:56, Pierrick Bouvier wrote:
> On 4/7/26 12:16 PM, Philippe Mathieu-Daudé wrote:
>> On 7/4/26 04:27, Pierrick Bouvier wrote:
>>> We can replace it with uint32_t, because we know it's limited to 32-bit
>>> target.
>>
>> That, or widen to vaddr for consistency and save a "why this uint32_t
>> type here?", anyway:
>>
> 
> It's really specifically uint32_t we want here.

Well, the caller pass a vaddr argument and the single callee also takes
a vaddr type, so sticking to vaddr is more meaningful but probably a
simple matter of taste at this point, I don't mind much.

> 
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    target/arm/tcg/translate.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 


