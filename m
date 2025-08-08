Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80F7C87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  8 Aug 2025 17:15:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ukQg7-0007Nf-Ss; Fri, 08 Aug 2025 13:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ukQg5-0007Am-IR
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 13:14:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ukQg3-0002Sk-TP
 for qemu-arm@nongnu.org; Fri, 08 Aug 2025 13:14:49 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-747e41d5469so2735278b3a.3
 for <qemu-arm@nongnu.org>; Fri, 08 Aug 2025 10:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754673286; x=1755278086; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PC7pyqqca3zOKfWHTrtPy17QNkLEZYu1x4vHEZfjDzU=;
 b=UJqmV/mMrj78ZNcQ6a6l+QoXMTRqNGDzdmKZhnOFpYMr7tTArnld/D9sCSZKv6KvCG
 xg7B402Y2ULwtLrMr2RTiT5FQPAcFSPdiUEKeR4MFcIfbSW01N38aoqQK4In9YJkUDQw
 fJS4EoNQgBZsFLJUFpPZhDfKULwHWb4jBlCV5Lfy46BSjx+IxIAfVkU6df1lfwFE+mRb
 U/hSmeNbAfSqFEE07s9SFEmjMiifoRktpOmw94zrSkwIPkClNBdYt7AzEKx/vk6VZ1kz
 Jk+wMPNJHMMEU3WvYfw0810O9G2dUg4SGuA0peWMVMw5ThRrkb+EmOvsloAa/vor/Hic
 iEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754673286; x=1755278086;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PC7pyqqca3zOKfWHTrtPy17QNkLEZYu1x4vHEZfjDzU=;
 b=dC+gXgrfsrwUyYiMkjvlDjlBfn3gFJDWapFgPwazf0QTR+M0RG5REYlF3b0HQVlDmQ
 04Ki67xk4lN49QjrTQNyLirJWALgrRxKg7NSRXzMurnk9zpuBrzanniwB8lltAfays3U
 MkstAKwHIK4WhzMyi6hYk+uLUu3CnYjp+9MlUHEmCosYG6xhtQlmOr8EqEq05WaMJ5Av
 Ltx5keSVc+drWqtn+abSD7jKWfX2mUWLLGNBge32FqhiqlxfvmGtvq0FKIL9zh847+7N
 Ac9xGTjfSXFFNbRUn4ZTuNu5yb1oHl/DW/g4vqrY5Z6PtWF2mnc1MSj+Ebpq+HZIJMb8
 tg6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWToNMdgP7FBIB5r08GmZsEHuXIK6JzznR9+PcrVDs2uSRmRi6dUgGH9SEkSzOniF5LALkG9D0aTQ==@nongnu.org
X-Gm-Message-State: AOJu0YyhO7K69BE7meWsyf7GK+ZbJkfY3JHmQQ3lNFn8Psfx9WDl8MEP
 zGOLv5ICBUh8gmMVYCJvXMRyZs+8SngqUj5O7ADGtak45nA+9InkHMmwHMLisST965o=
X-Gm-Gg: ASbGncvpHFr0ungAAv9x5X5N7rA0s6Kd+gAFSreYDdLg9jBpdTFbKEtWSLcLgb3MHnA
 uMHB4Wk+l0wSUCFsH4+Cx2iv12IIUh6tLtzcYUcv2fjKpR3aPRhFVrJ8j4T+QK8hGaE7yYfFIHw
 +VxDcG41rNAWfJsLEflYFKoM7n8xk2xWBnT6ohLekq/lInUZ63EKX+k2TBWhvVWedX7Fl+bkBxd
 qNHA4fFymetmBXIsndT8rwexY2V9xKnSEQDDKaPf1aP+/hVLwWMhhsuriyFdtYtUBP1MFX9I5K2
 QjeV5CCEdW6HGEXsunfi490c4qWin860hona59HPvWKiZQ7CUNSC44EzjNNKx3P40wjraYZWJnd
 hdeTuXRfkwCsyn4p4B0H+4tWnCtaMZiOMmWA=
X-Google-Smtp-Source: AGHT+IF5E6Q38WsetPX4vGjTIp7+4v4tQn9kBod1/eK/qLw8gXZApqPEHPs5n/x6eUB0m0t0AU9H6g==
X-Received: by 2002:a17:902:dacd:b0:240:5549:7094 with SMTP id
 d9443c01a7336-242c200e82emr56046905ad.18.1754673286061; 
 Fri, 08 Aug 2025 10:14:46 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8ab3da8sm213752765ad.175.2025.08.08.10.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Aug 2025 10:14:45 -0700 (PDT)
Message-ID: <96a27883-e02e-4d76-9dde-41ae1a19e0c3@linaro.org>
Date: Fri, 8 Aug 2025 10:14:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] gdbstub/aarch64: add CurrentEL register
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20250808-gdbstub-aarch64-pstate-regs-v1-0-14ba70be1b3d@linaro.org>
 <20250808-gdbstub-aarch64-pstate-regs-v1-1-14ba70be1b3d@linaro.org>
 <CAFEAcA-2Zt7HTDX_bdBHjJyQS7o=csE1x6eDymyEPkV3K+pXrg@mail.gmail.com>
 <CAAjaMXbZK=n_HJGrmuGv1DZZ3AeaX7-fK-soFto4J=w-9=vdmQ@mail.gmail.com>
 <6190716c-09da-4abe-94e5-2b713855f0e9@linaro.org>
 <CAFEAcA-QcjtkAUUUGVvaUVrJBqP3NvSX0DuXQ==MGcPrjNtGQw@mail.gmail.com>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA-QcjtkAUUUGVvaUVrJBqP3NvSX0DuXQ==MGcPrjNtGQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x429.google.com
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

On 8/8/25 9:14 AM, Peter Maydell wrote:
> On Fri, 8 Aug 2025 at 17:11, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> On 8/8/25 5:26 AM, Manos Pitsidianakis wrote:
>>> On Fri, Aug 8, 2025 at 3:21 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>
>>>> On Fri, 8 Aug 2025 at 12:30, Manos Pitsidianakis
>>>> <manos.pitsidianakis@linaro.org> wrote:
>>>> The debugger already has this information in the 'cpsr'
>>>> register, so it could implement convenience views of
>>>> the subfields itself if it liked.
>>>
>>> Yep, but consider: it is a register, architecturally, so it's nice to
>>> include it for consistency. It's redundant only because gdb has cpsr
>>> which is not a register. So this is about more about being technically
>>> correct than correcting an actual problem.
>>>
>>
>> I agree with Manos on this.
>> As mentioned on a previous thread, cpsr is not even supposed to exist
>> for aarch64. So adding architecturally defined registers, even if data
>> is redundant with cpsr, should not be a problem.
>> I'm sure gdb folks can understand this too.
> 
> I'm not saying this is the wrong way to represent this.
> I'm just saying we're not the only gdbstub in the world,
> and it would be nice to have a wider discussion than just
> QEMU folks so we are consistent about how we represent
> PSTATE (including what we want to do about the new
> bits that appear in the high 32 bits of an SPSR), before
> we commit to any particular direction.
>

Considering we have our own set of gdb xml, is that really important to 
agree on pstate layout before we simply make those registers visible on 
our side?
The new registers added in this series on gdb/kgdb side at the moment, 
so we don't really break anything.

I agree it would be good to see this on gdb side, but my point is that 
we are not necessarily stuck and we can make this visible without 
waiting two releases. As well, it would be a good motivation to add this 
on gdb showing QEMU already exposes this.

> -- PMM


