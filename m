Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086C3C5DF7D
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 21:08:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxWSV-0007y4-Ub; Fri, 21 Aug 2026 17:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxWSU-0007xU-G1
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 17:07:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxWSR-0001eq-U3
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 17:07:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-38ea87caafeso1059595a91.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 14:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787346442; x=1787951242; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZUiSq8PsvavJBFzHfD6KJmOqkADBjSEXe9SnRzZnEAk=;
 b=GjURinTsNm9XjZTxYOGy9+HIk+rKAZsqLmMk1xJ9cLJx2rrFoH9dK4khmMTnj5bXSU
 X1heyxJseRBSD/ehfzZKOHpA7dCmoFYnx3tlLUALnIcyNxPWAvym31NwOvcSQmvQiegR
 FgCm2fYX9dLnRnOWo3Mb2JWCasfouGxKxSd/Zp5XcYMW3uTvihCfYmlK7GEGTY9Q5pNz
 jTBwoQUM2fbGN7JiOJMbNUjjExt1FJpdQ8Z9Qj0kjmzAWqGApr7ZvT7HFu7T+N+XYUg3
 yfIBWHifDIvNvgGELI+KWg+pkVXFyv6ydYcyjC4vkgJ0fAuhgHzFM9SUPKJUO9G5ZN+9
 oemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787346442; x=1787951242;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZUiSq8PsvavJBFzHfD6KJmOqkADBjSEXe9SnRzZnEAk=;
 b=ei/qGs9bcs8a3taxXljG8BmE3xDklgiYhjPvY3xwXvU5Sd1EO/YuBUWEzl1qdDpjLF
 Rlo09/v9zsirfACFU36ooyXA0SG3qcVjSWKSl5qWxaCIcTzhaLZlg+oVdC7DQPYlUMAA
 W2NLX7rYjyn4t0jC8iDTfjKejPCsqQ44jRMVZCNSJeDGgxkuYB84fC1d1WJY1ateNMC4
 DWPAqWA59t5C0iSz77LGv+Tb74X85pSqet69ao9bMfgVWt2ReT/q8rT26esRfiVWhO8Q
 InSZ+sLQWyucn5Cz6zcoBDUoeM8rhGVNQFVLiwfKS2I4L/1olHRqjP2mQZESwC/h6uYf
 xXhQ==
X-Gm-Message-State: AFuF++ne4o79F1gBwTZhiaFADgAApSsT8U582k9vTwu9PUMcF6qq8Mox
 v0fNdW37SizbJa5AhkP802xozf6qc1lzlIgcae9Vc35CmxwdH1H0Xbk2daZLKQNqPDc=
X-Gm-Gg: AR+sD12YAbN28ymv53D+W+IpMiYp8YB4AWYaKu/x5Vt75IoMN03dqGGmOQmhBaxDa9N
 PAlMNiIp5+QOTfkmxNgxfyRwNjAgf8IBm8NYRrUDwUfNARnWdd7OPKmgA+rDA3ySfhV+RKtAMXX
 TfySsGtgQYsdZxFr8MIxJ9MSORAqOAHAnVWI5lzZgNChqkRwsfRQBpgydRus/SQqwSN2hDtjFHO
 Dx42pbhzyYTIq/9zpb707lrBLU64fzYkdjv5X7p4C5+w9eZrCCeANcHHNzFA2DKHii2N2DZ7iGx
 e+nHxUFFJFIOVdgxDv3X9d61zGcVe4sLkByzM1IHtAOOj+dt8z8EXwdKuAhJKmG3NIbX1STQ+CR
 medAZVWp5wZ+56jhjm8PR2flEUu0d/APPhQ5vmAXS6yhSPt7fv0pjFcCORDdaISOzBSo7roLhdS
 x5hiEJmc5B666a3kDfLBieFD5LL384uO5K443ufIgNCkPi93dRd4TbnuWKiCzoq9FU8HkwBgHl8
 2gOHY1eyyeaEDWBiIvPXxj7+emUzx6YQv9Kiqb3LAFOxO7wOg==
X-Received: by 2002:a17:90b:54d0:b0:381:25ce:bcc2 with SMTP id
 98e67ed59e1d1-395c353ee4amr18153913a91.6.1787346442074; 
 Fri, 21 Aug 2026 14:07:22 -0700 (PDT)
Received: from ?IPV6:2607:fb90:339b:bfd7:dac5:d94a:debc:5ef7?
 ([2607:fb90:339b:bfd7:dac5:d94a:debc:5ef7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-395e494fa73sm199595a91.4.2026.08.21.14.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 14:07:21 -0700 (PDT)
Message-ID: <180ce662-a0e8-4b03-9a7b-1b6d4feab0b2@linaro.org>
Date: Fri, 21 Aug 2026 14:07:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/18] accel/tcg: Replace size with first/last in
 TCGCPUOps.tlb_fill*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
 <20260815203730.1468365-13-richard.henderson@linaro.org>
 <26a073f0-9e8e-40c1-97dc-6b420740e20a@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <26a073f0-9e8e-40c1-97dc-6b420740e20a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

On 8/16/26 08:17, Philippe Mathieu-Daudé wrote:
>> diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
>> index 0ddd898e6e..bfcd9b6159 100644
>> --- a/target/hexagon/cpu.c
>> +++ b/target/hexagon/cpu.c
>> @@ -666,11 +666,13 @@ static const char *access_type_names[] = { "MMU_DATA_LOAD ", 
>> "MMU_DATA_STORE",
>>   static const char *mmu_idx_names[] = { "MMU_USER_IDX", "MMU_GUEST_IDX",
>>                                          "MMU_KERNEL_IDX" };
>> -static bool hexagon_tlb_fill(CPUState *cs, vaddr address, int size,
>> -                             MMUAccessType access_type, int mmu_idx, bool probe,
>> -                             uintptr_t retaddr)
>> +static bool hexagon_tlb_fill(CPUState *cs, vaddr address,
>> +                             vaddr first, vaddr last,
>> +                             MMUAccessType access_type, int mmu_idx,
>> +                             bool probe, uintptr_t retaddr)
>>   {
>>       CPUHexagonState *env = cpu_env(cs);
>> +    int size = last - address + 1;
> 
> Nitpicking, since we know last >= first, could we use size_t instead?
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Certainly I won't change the type in this patch.

It's only used by logging/tracing, so I don't really care, but you may, after the fact.


r~

