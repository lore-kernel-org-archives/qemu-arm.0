Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A382410F9975
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Apr 2026 19:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wAYbx-0004Ip-KA; Wed, 08 Apr 2026 15:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAY9N-0000S5-0H
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:01:17 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wAY9L-0004MO-Dv
 for qemu-arm@nongnu.org; Wed, 08 Apr 2026 15:01:16 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-43b87970468so44308f8f.3
 for <qemu-arm@nongnu.org>; Wed, 08 Apr 2026 12:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775674873; x=1776279673; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cOVeol76/J0qiEZ1bohMeyS5E9C/WQO5Se6X+02jaGQ=;
 b=fT0flxkZDqZYj5yd5BTha23BxNajwoteB4k6zoklTVuID6PJT3LPbW5VD7ib/azSet
 Lbf6BdlAHh/RE/mEDVscETCqeJGYkCUqBoTOlX8ZS3fzU54l0VgEFNVoYj0vofwOdncY
 qIMPd4C9M0P83e05u0lTpcdnkPaFdBR71t3PWNMKNzCHYCFp/if6T2MsVXni0FJMxc1g
 N/KP7YdfrVm+TzthX1HC2JrCYI1ITlQk738BvE8RhfCOhB9emK6Xs9mBlXblNFIoJxlw
 HLEoYLkRJXzN5eWdMdTKYEOl28yR2DC6tH773fxODKX3eGG0Uxrk9qHPQZCeJ/9c1QN8
 18CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775674873; x=1776279673;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cOVeol76/J0qiEZ1bohMeyS5E9C/WQO5Se6X+02jaGQ=;
 b=jBRF6gXlPV5f5zw0A5C2VlgCTi/mpeggtEsGom05dmwRbu3RAqK7zozSrTekeqicPr
 2qolEOXOBqpD9YKGfqP83rg+YeL7bsKGLzcpubrsJVvnRpf22zMp4IpC5Ml0Kkp6XwA4
 WOCBIX+/kbnPjUqEQNTFVn6NUenbKSeNjvB8cezd2ASRNRN7drvUoValKOGQom9q8Ywd
 p1sU0ga9WSLtioxtXxVwkJZSj2aJDjiThoDvQB/qGTMrjowPIABIM/AM/W3bp1uJbcrh
 +wm1DVTaMP1L1hqowgx5jn2Sim0s/01CL13XaIECzU6Lx5yMbWvt1RZNnbiAZYs3Zv83
 KCIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0uTPXIEPnMb3S45uC6iFqyhubKp+uScQTnTHyBOJkK4J+ZvKR8IHk8UQ9Ope8K8ekFKgyaxOrow==@nongnu.org
X-Gm-Message-State: AOJu0YwV+2NCq7fPdsBqgmSN63O4r8ymKXNmnBJ7JiRag7GrgKH5MKSG
 rmcOb8gT7vNbrjxp3qE29EhfO/fScVh6OmuzuS0Kk0xBcvSXWeGxY/zqtWvRkqCoYlo=
X-Gm-Gg: AeBDiesO9PtxOi2zyW96oBDCHmm4oeXU7VUKT0BpaBq/UjbmyMwyzY8eeUikXlI4MNd
 U2Bx+m69IxQoiiAA6IP3W1sXgJo78noriyBqEvku3RdW0PPtGX4wBNEY1U75PQT7D5EnZMR9cyk
 Yyu65hBNse7NuI96SzoMLo+aUk2oIFyeCBazctZUpwvk8UM4H4WpRxVEyuNIzMUFjgD1k7aVbWq
 YL22XTSBQ1RQwNDnUoTa73OdraUCfhwsWsGVobnOJttK26Az11geW9Ieno3w+ZyJ4A/s8U8s9xy
 PgGysYK7EA6go8MoWCLyx7ut/QiHXeaJV+paJl87aOdBMQ2f0ggj0azWV0G0+++nA1ihtTGEIK5
 ZJVmdQzRlWjAJRIoJlKRiOLMcKJEqEl0dYx8xHOoiFYBkJ1tr7wjSJBvfB8a69/d9MKPVLhiCiM
 nLFOIxKne5TL/W5OC52VGzjXz010P+MhuhrwMQTYnoNWUTcuU0t0uf8TdsZFyID5qBBg==
X-Received: by 2002:a05:6000:18a9:b0:43c:fe0e:5bbd with SMTP id
 ffacd0b85a97d-43d292eca64mr30774096f8f.45.1775674873439; 
 Wed, 08 Apr 2026 12:01:13 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a71f7sm62317867f8f.1.2026.04.08.12.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 12:01:12 -0700 (PDT)
Message-ID: <04dcf4fa-c596-45df-aae9-bd9879b8abc3@linaro.org>
Date: Wed, 8 Apr 2026 21:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 14/21] tcg/translator: add parameter to
 translator_loop for current addr type
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: jim.macarthur@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260407222208.271838-1-pierrick.bouvier@linaro.org>
 <20260407222208.271838-15-pierrick.bouvier@linaro.org>
 <41713965-dc77-483d-a026-41bb234b6289@linaro.org>
 <1c026eee-8758-45c9-82df-2563c203dcbf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1c026eee-8758-45c9-82df-2563c203dcbf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 8/4/26 17:18, Pierrick Bouvier wrote:
> On 4/8/26 1:33 AM, Philippe Mathieu-Daudé wrote:
>> On 8/4/26 00:22, Pierrick Bouvier wrote:
>>> With TCG_ADDRESS_BITS mechanism, it's now possible to specify which
>>> variant every source file is written for. Compared to before, it means
>>> that addr_type will now vary per tb translation, where it was constant
>>> for a given target previously.
>>>
>>> Thus, we add new a parameter to translator_loop().
>>> This will allow us to convert targets one by one.
>>>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>>> ---
>>>    include/exec/translator.h        | 4 +++-
>>>    accel/tcg/translate-all.c        | 1 -
>>>    accel/tcg/translator.c           | 4 +++-
>>>    target/alpha/translate.c         | 3 ++-
>>>    target/arm/tcg/translate-a64.c   | 3 ++-
>>>    target/arm/tcg/translate.c       | 2 +-
>>>    target/avr/translate.c           | 3 ++-
>>>    target/hexagon/translate.c       | 3 ++-
>>>    target/hppa/translate.c          | 3 ++-
>>>    target/i386/tcg/translate.c      | 3 ++-
>>>    target/loongarch/tcg/translate.c | 3 ++-
>>>    target/m68k/translate.c          | 3 ++-
>>>    target/microblaze/translate.c    | 3 ++-
>>>    target/mips/tcg/translate.c      | 3 ++-
>>>    target/or1k/translate.c          | 3 ++-
>>>    target/ppc/translate.c           | 3 ++-
>>>    target/riscv/translate.c         | 3 ++-
>>>    target/rx/translate.c            | 3 ++-
>>>    target/s390x/tcg/translate.c     | 3 ++-
>>>    target/sh4/translate.c           | 3 ++-
>>>    target/sparc/translate.c         | 3 ++-
>>>    target/tricore/translate.c       | 3 ++-
>>>    target/xtensa/translate.c        | 3 ++-
>>>    23 files changed, 45 insertions(+), 23 deletions(-)
>>
>> As per v10:
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> I'm surprised it didn't apply, I ran a b4 trailer before sending v11.

b4 fetches from lore.kernel.org which seems to be having issues.

> 
> Regards,
> Pierrick


