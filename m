Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49A2C83F09
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:24:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFKM-0003cd-Qf; Tue, 08 Jul 2025 16:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZEPx-0004dZ-5Y
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:55:58 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uZEPt-0001Q3-TK
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:55:51 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-ae0d758c3a2so798993966b.2
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752004548; x=1752609348; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hI8sAmJ13x4dAhHqQ5KRW0VbwKRcg/Fsqe6mUGhQqN4=;
 b=n0uSbJYi3NqKQi2SS3tuGRnHKARtm/zcSuy/XetuPH+zjgos9AcsKGRbUM3hNwcgMu
 c44e3fT7xAls658uFFctf9FiY8vaZ0NeqfFOW/OJkYu3E9saQil0a/8mC49mCZQ63WUe
 rXEwB7R0yj/3XQdJpzmghjPpmo1yl+N14QXGpJUD4MyKHJKUoKbbj7FYN0ruFBZcXFOS
 1RekI4knypJ29E4kDOFLaG7aGJNEDUeus9Yb99YTHZKhILN5ZUG0w2d93JHF2tcG0Vr2
 trdEYCPCtVzx/6lJs+2UZ+CZav0eQcqK0oOOLvYzlk3Gu3Ww4UI5xoyh9ekcJ8Lrue3R
 mGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752004548; x=1752609348;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hI8sAmJ13x4dAhHqQ5KRW0VbwKRcg/Fsqe6mUGhQqN4=;
 b=ZPAVKp427SOsJa7jA2XcXNLk5pW+ija0g7CdQ5CCCzlI+boLfDGWYpe8pYINC8H88j
 5NjL8xERdh6k1FZXkrviWsnIAKdgozKCxC9+r/e8JZ3pr7doJGz7rJcr0/90SDLlAr18
 evM2+rPqRuXvhcetQtsV8Y4Uquk4lHwco++8Urzm7zW/vtF/kdNcyQqOUxaKz4UL1Eh4
 GntgCPSCmpafIMOvb3AQLtcNpaxB7esi487aCa5d0ph1/VFF/vIYG8xWspu3NojH/iEd
 USv/DrQAIlp2Kz7H2WOXj2KNJbRjZm8EPKwjpZnzx/Cx6cV3HyKWCZm19xKRxO0zrKrg
 DwoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKTxJm0i8vjI2SwH7R0M33FKXs+QP3/2FBluilYJugYOYuPkUhgwz5ZM3J9ZwEOLIFqHqq2jgQpA==@nongnu.org
X-Gm-Message-State: AOJu0YzpKpL+PQZucIImLLKyJq4AK+NLbqyBJXuZyp5P8Ry70lhOEHaJ
 L9puLwLmZ8jXQflKL8q49ysJn+PqzlyfKHYTDfS1VHq6yWARbuBbnT+KE1rV+Qw7G3psshYYwNe
 6OHA+igI=
X-Gm-Gg: ASbGncvwftimQLPYx1I5cRT//0l/ai9aD1b7zvkhL+BL6RspCWnb9mpGNYzDyTdWR+y
 FxdvwI37WG3phua+LbaXpZ7lhov5I12/KwfKDdnuEg8u3BUhp9anp0pDm2v2l/sE0WOSBhjSwpy
 IK3rdj/VWL+FHt6IxjQ5MVCRZtrdVvDk0lDwk1W0quqofaem4ZBDJ+bFTGOVauPwXgHuyiehRCr
 c77K/U3VXUB0XEhAeLuH7Ocr19+CixMaHxudLlDoU54uwr8lOrDcXrFY6JVgUs7OIMe+7pJy+s9
 QdsTGxwF0kEuGqGXldUsUTQDqLCDOiJyEnEhTc4dFSzZ+MZVm1MLPOYrIWXDB4L/MQ+QzWN+yQf
 nM0tq4uape6M9UbA3ZZIvSCwRvshH/pendto8Wr5T
X-Google-Smtp-Source: AGHT+IEBF8Dg32b2zfK2LEUCiBIqsCkszQ/RmitWt476HpBfkMyJozJs4eVA6oF9QsJ7q9Ox3RaC1w==
X-Received: by 2002:a05:600c:4e05:b0:43d:2313:7b49 with SMTP id
 5b1f17b1804b1-454cd4cbd79mr24423785e9.12.1751970430502; 
 Tue, 08 Jul 2025 03:27:10 -0700 (PDT)
Received: from [192.168.69.242] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd39d0f6sm18081605e9.16.2025.07.08.03.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jul 2025 03:27:09 -0700 (PDT)
Message-ID: <21692283-9767-4109-b14b-ef0ff787d856@linaro.org>
Date: Tue, 8 Jul 2025 12:27:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-10.1 v6 00/14] target-info: Add more API for
 VirtIO cleanups & introduce ARM macros
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org
References: <20250707172009.3884-1-philmd@linaro.org>
 <20250707135403-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250707135403-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
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

On 7/7/25 19:55, Michael S. Tsirkin wrote:
> On Mon, Jul 07, 2025 at 07:19:54PM +0200, Philippe Mathieu-Daudé wrote:
>> Rather than re-spinning the whole "single-binary: Make hw/arm/
>> common" series, restrict to the API additions, but include
>> examples of their usefulness (hundreds of virtio objects
>> removed from default Linux build).
>> Time passed since I context-switched out of this work so I'm
>> not sure the DEFINE_MACHINE_WITH_INTERFACES() implementation
>> is in the form Zoltan asked.
> 
> 
> I think I'd prefer to defer cleanups to post 10.1 - already
> too much on my plate as I was out sick. Unless there's a reason
> I'm missing to rush this in? Is there a feature we want in
> 10.1 that depends on it?

Fair enough for the virtio patch.

Hopefully the previous ones (TargetInfo related, not touching
virtio) could get in (you don't have to look a them ;P).

> 
>> Philippe Mathieu-Daudé (14):
>>    target/qmp: Use target_cpu_type()
>>    qemu/target-info: Factor target_arch() out
>>    qemu/target-info: Add %target_arch field to TargetInfo
>>    qemu/target-info: Introduce target_base_arch()
>>    qemu/target-info: Add target_endian_mode()
>>    qemu: Convert target_words_bigendian() to TargetInfo API
>>    gdbstub/helpers: Replace TARGET_BIG_ENDIAN -> target_big_endian()
>>    qemu: Declare all load/store helpert in 'qemu/bswap.h'

