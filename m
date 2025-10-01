Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB71CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 16:43:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3zuc-0002hV-Bp; Wed, 01 Oct 2025 12:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3zuZ-0002f3-3L
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:42:41 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3zuS-0007rq-7g
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 12:42:38 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so234785e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759336944; x=1759941744; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v+uabRtDuzJ/m4e+L6lhktLwA2GFXiRSn7Uix0Zvk/U=;
 b=uXl2HiadkNC9zR/qCyLswfhOSC9cmHN9fbymMLd5ikbM/BKExMXH8FESZSbmxbbKFK
 TS+GH9U5dYirRzz3QKQsja7WJe0R3/W+IRRylSc/qriXSw3BWiU2fmxEcDbSJQSYjuZw
 si2NaQubr0IhxhpYDxcc3Bhh7S+UHmRMOMg8OiZFwLPDbYQ7B9dkZMuHtIbQpLb0YIon
 gbLQZtqXtGnfdDR9uFutabWw0Ooi2rSBOc67gX0obi33Z5BOdjTmGT51Awm8xJ1fXBOo
 VCqCHbiEMVgMR53blVY5yGEiAZejbyrN3iZ+ngujmwNdfCgVEjqJyCPvHZsUg8om+jBr
 ts0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759336944; x=1759941744;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v+uabRtDuzJ/m4e+L6lhktLwA2GFXiRSn7Uix0Zvk/U=;
 b=SHcvxUZN7HvDMv5lWASRw1pK47Fju2TNuiYxZsucjhvE86arIkXaG0lT4JaFRHT1LF
 h5IBKGmRsMZIqEQCKvdV41deU1qub4DJ+asWfiUs0GQUtFFF87jk8VVwGBufQXL5440/
 +rpQgVDqHZXQku2S+XQpEFg9yiz7p/fDwv1yC4NkYIHrQIuwuyt1Esvmo8TUPdFzQ1ym
 GLgqYYt4MFahY94REuG6sDXTNUXwnsALX0zgrTgPqcv4pGH4lFjgBcNuTzAyF0OCrtyd
 qI3FaslJDcUMIlsAWlPBj/vnstncmaKO4IfxpM21+5Rou90k1Velujtif7p7VRilGf7j
 B2kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG9iwH25b19dQwo7vc9sQfjIJ7oZHR0ntkHv2JMG8d0M42gOSxPEYWITEP2T+eB3EXKFfRy8u+jQ==@nongnu.org
X-Gm-Message-State: AOJu0YyQPUFYo76IZ62fEmMC/P4151UBYPMz8EtipAd6NIB6ZX7FWeS7
 LrYt9xLGBdXzpgA8pucz72zkwQCXZIC+kJrPltkElh/hdY7mliSLYpGnU6TZ/GM6+hiOZguy9YW
 6qoCUWXpTrA==
X-Gm-Gg: ASbGnctIDXeAhNWZ4h9UAEELgaoSe4zsAhPgcVJI4y3rIlJVvZO7VmXXn+tJX/F3UDM
 e3j7lKyetWxIXQZMbWj52L87lWYERiRrfFFQacEiNIVK8SM7ZhPQEQeY03Uw/J/fj6ukXUlHmMz
 H2zC3BMatM3g+D0huzblKAon53jM9QDQy4YMkXPkeC2uJg/QNC7rT+RsLjP2ukSnlqCJgrIbeFM
 djguVBqodutd9kEj3oGlvtIu8erzjEKqPw9aSYP7yNp/cd5FT/5fQCny3DsU6V4stJusdAhXZ9E
 frkekQAqlATJzvzXUZ5USQ0R343d7tzt3yj7UAcdsi3SvqqyIj6in7Axj6CrYy+sICChc5J3Iyt
 Xo9BFNwgHrWULPnVbh4iKAPe46/AtICOE5PKgKy8ZssQHV8awe1Ja3adtMghe+Pcz/l/PaaRAZg
 7+IHy9Yre7FS6g7iViSKsMnmo8
X-Google-Smtp-Source: AGHT+IH4jKSsUHp9Yqoi1XvxjhdrciWHucaXnu76L7493jt6wfeUpweQHhewh9H3oV9qQHugx5YIXA==
X-Received: by 2002:a05:600c:a304:b0:46e:652e:168f with SMTP id
 5b1f17b1804b1-46e652e1d0fmr19150305e9.6.1759336944205; 
 Wed, 01 Oct 2025 09:42:24 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5c3cad50sm39100755e9.3.2025.10.01.09.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 09:42:23 -0700 (PDT)
Message-ID: <2a53049c-01e2-4f0e-ac51-f55d50173b22@linaro.org>
Date: Wed, 1 Oct 2025 18:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/22] hw/core/cpu: Remove @CPUState::as field
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu <peterx@redhat.com>
References: <20251001150529.14122-1-philmd@linaro.org>
 <CAFEAcA-daogqBPxt72qTM6BuMuD1wuw+vXZwxLUQftwY2FZk=w@mail.gmail.com>
 <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <b5280074-e87c-4838-b816-eb9e42dd090c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 1/10/25 18:35, Richard Henderson wrote:
> On 10/1/25 09:08, Peter Maydell wrote:
>> On Wed, 1 Oct 2025 at 16:05, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> Instead of using the convenient @CPUState::as shortcut, use
>>> cpu_get_address_space(asidx=0) to get the vCPU first address
>>> space.
>>>
>>> The goal is to reduce the risk of AS mis-use for targets
>>> that uses multiple ASes per vCPU.
>>
>> I'm not sure I agree with this. The cpu->as is handy for
>> the large number of targets which only use one AddressSpace:
>> which is everything except arm and x86 right now.
>>
>> Targets that use multiple address spaces need to be careful
>> about which AS they use by definition. Unless we have a
>> track record of code in those targets carelessly using
>> cpu->as when it should do something else, I'm not sure
>> that there's a benefit that makes it worth making the
>> "use the one and only AS this CPU will ever have" more awkward.
> 
> I agree.
> 
> Moreover, '0' as a default is just as bad as cpu->as, because you're 
> giving no thought to the selection.  Similarly using 
> MEMATTRS_UNSPECIFIED.  When such things matter, we need the real 
> attributes and/or as piped down from the proper memory reference.

OK.


