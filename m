Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C73CA0EED
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 14:56:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upTBs-0005at-5O; Fri, 22 Aug 2025 10:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1upTBm-0005Vh-DX
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 10:56:24 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1upTBg-0004Bz-4E
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 10:56:22 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45a286135c8so16410035e9.0
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755874570; x=1756479370; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ov30FHMs6PkWv+UlIWtaqvO42FAoVs6p1rfOcSHlGVQ=;
 b=D4hlFtCBzUbTv96fcbMlcLr2su/yZeoKQ3R1dPjTs2T5ZrFcAlNP9s7jPgWq9AgGYf
 lABARVFcM9LSLjHMt859Qx0xnuKd7T0nEKyhMzsqJhTOPZG+9Bfex+y1LS6WQwEMmkNO
 LrYFH8FsajR/EqRFldJuKqP+TQM7JjvF9G9slpofvFv2HJ6HBVJ8RfSknjhhX7IGK/gw
 NILdlR4IRyWCQHYu3PMvT+pVfzbQJz15936z1czTyLHmxg9XhQ6HMD9Pml8iGXfoepjS
 n3oidF0of7ecs2U/0sxRBR0oB4k2vIOcKR+LK1hOXTCYC5JJp5oLT66YHGCndEGSFK0Y
 vWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755874570; x=1756479370;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ov30FHMs6PkWv+UlIWtaqvO42FAoVs6p1rfOcSHlGVQ=;
 b=g998NC68khDOaLhE1oKsMv5n5/M6bMvb/+EqHi9Aafi+Tfmk811IL6ZDQ/t94DfIbI
 r2FOw4l3Legm1Bj+NsvYKQdxgIx5sTee6zSy5K79iyngsRyEbwEU/XX6cBoO6roVZrQB
 0WAgaa06g4kGQdskPyU0OcGTcCcTm5pWIX68yjps+YVmogTL3HOPGuDFbjomZ118lint
 kc+9Yo2ZjTzyWu4EL9DjZrW39XVVkwoPbnmhBRjbvq5Pz0g1/4aAqcIVH5HmolCCXO7b
 EeIUTlivif6+1fUOhyW1R3FL4qK3/aaj7WmpJZirGoyAUc71n/+umRN03W9j6ZTyln9V
 Eu3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnX++ewrxe3AVA6w4EZC/ljILhB/4jjUc8lGR8s8bEqoH0kstWZBsUE4MAOZn56HfrdUTgP3dEnA==@nongnu.org
X-Gm-Message-State: AOJu0YyvLIJr/39TG9giVmrhAobCdkFyusGigX52L/KLXi6fQ5COIuNH
 Cak/aNLqQ/3F4CyEV6mfsxFoPVFqMiaSpUofazP6VFOXDS55RM8dinUutDUf0E/O6Xg=
X-Gm-Gg: ASbGncvBF9CNyNMf+2Ng7OGR1DrjFYQVXMaTQhmG8j6lacDDMQGTcGJdvoSM6lY7SSA
 FnJsY/YFr4lX5ChU6NkxnOiyUCfVeZ/286j87sg48wvvGy6HiJAOytQYECq3kItW9z/9eHsvfpA
 Nbu0NW7AixbwzTs/n+OCraoOM/qU4OS3Z3pDL7ADUCLYWkkD7hPrf80TomBB47RePt77g0r9lcp
 PfcyH9mHefTURxBs58djXwQ4EpjcSCDv74xTUQTP+QtLyEm7BFu8gcuWV/vvBfX/pxR0lYncEDK
 oVdcud44BzAkUGgWIZOoMQ6Vv4gRxIYMYmE0Ug2NQV5vsog9oD6edVN4gU7PoDZEvMhwdCR0yZ/
 7r+Y9CES9AWzY9s+45zPfxsbg+1t72MnD6KAIDvpMyNfg8vH7Wizuny8pn0TId2RJItQC3dw=
X-Google-Smtp-Source: AGHT+IFoGVe00a7eRzl2dD6cLJN4Ir3KojLgBPg8Y/K4Rofzr70kLNO773kFbfSigcbGEjFrrmqI4Q==
X-Received: by 2002:a5d:5850:0:b0:3c2:d7f0:9c4e with SMTP id
 ffacd0b85a97d-3c4aee0f22amr5025948f8f.8.1755874570164; 
 Fri, 22 Aug 2025 07:56:10 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c61843c8fcsm2587063f8f.22.2025.08.22.07.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 07:56:09 -0700 (PDT)
Message-ID: <e7ea76f9-b66c-4656-b8b6-4d0ff0dfee35@linaro.org>
Date: Fri, 22 Aug 2025 16:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] single-binary: compile once semihosting
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, richard.henderson@linaro.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
References: <20250804183950.3147154-1-pierrick.bouvier@linaro.org>
 <7c026d43-04b4-4615-8478-639393b640c2@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <7c026d43-04b4-4615-8478-639393b640c2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 22/8/25 16:31, Pierrick Bouvier wrote:
> On 2025-08-04 11:39, Pierrick Bouvier wrote:
>> This series compiles once semihosting files in system mode.
>> The most complicated file was semihosting/arm-compat-semi.c, which was 
>> carefully
>> cleaned in easy to understand steps.
>>
>> v2
>> -- 
>>
>> - use vaddr for syscalls.c/.h
>> - static qualifier for console_{in,out}_gf
>> - use vaddr for arm-compat-semi.c
>> - semihosting/arm-compat-semi: fix cast for common_semi_set_ret
>>
>> v3
>> -- 
>>
>> - keep common_semi_sys_exit_extended (Peter)
>>
>> Pierrick Bouvier (12):
>>    semihosting/syscalls: compile once in system and per target for user
>>      mode
>>    semihosting/syscalls: replace uint64_t with vaddr where appropriate
>>    semihosting/guestfd: compile once for system/user
>>    semihosting/arm-compat-semi: change common_semi_sys_exit_extended
>>    target/riscv/common-semi-target: remove sizeof(target_ulong)
>>    target/{arm,riscv}/common-semi-target: eradicate target_ulong
>>    include/semihosting/common-semi: extract common_semi API
>>    semihosting/arm-compat-semi: eradicate sizeof(target_ulong)
>>    semihosting/arm-compat-semi: replace target_ulong with uint64_t
>>    semihosting/arm-compat-semi: eradicate target_long
>>    semihosting/arm-compat-semi: remove dependency on cpu.h
>>    semihosting/arm-compat-semi: compile once in system and per target for
>>      user mode
>>
>>   include/semihosting/common-semi.h             |   6 +
>>   include/semihosting/guestfd.h                 |   7 --
>>   include/semihosting/semihost.h                |   2 +
>>   include/semihosting/syscalls.h                |  30 ++---
>>   semihosting/arm-compat-semi-stub.c            |  19 +++
>>   semihosting/arm-compat-semi.c                 |  65 ++++++++---
>>   semihosting/guestfd.c                         |  26 +----
>>   semihosting/syscalls.c                        | 109 +++++++++---------
>>   ...mon-semi-target.h => common-semi-target.c} |  22 ++--
>>   ...mon-semi-target.h => common-semi-target.c} |  27 +++--
>>   semihosting/meson.build                       |  18 +--
>>   target/arm/meson.build                        |   4 +
>>   target/riscv/meson.build                      |   4 +
>>   13 files changed, 190 insertions(+), 149 deletions(-)
>>   create mode 100644 semihosting/arm-compat-semi-stub.c
>>   rename target/arm/{common-semi-target.h => common-semi-target.c} (59%)
>>   rename target/riscv/{common-semi-target.h => common-semi-target.c} 
>> (53%)
>>
> 
> Ping on this series.
> I'll be out next week, but it should be ready to be pulled once the 
> trunk reopens.

Modulo the comment on patch #9, the series is fully reviewed.


