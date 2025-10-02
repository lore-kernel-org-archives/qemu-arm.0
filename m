Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5913FCAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 15:42:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4LR3-000595-Nk; Thu, 02 Oct 2025 11:41:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4LR1-00058D-Nc
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 11:41:35 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4LQp-0006sl-7W
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 11:41:34 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-7841da939deso1178325b3a.2
 for <qemu-arm@nongnu.org>; Thu, 02 Oct 2025 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759419675; x=1760024475; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Px2emP6ROhkv4xGAfiqCflc4uecgiLeSHdwUtniKE24=;
 b=Q3VcZC9SXw4Z0XPDA0FxE2IhdXUn3nM6VQmhTlhNTpl9lj1SMP1cRCQZUejraKjgwo
 fz5dBSA43ZVZBqgIops/ff8b9vq/iO7YC2/xlSOZZ7i3rYgheqz3WyWHw2gIVpDzZNZY
 AEs+JxXm41Fq5CHypB7B0HdKowhhJHGdug1JINJ2RhpWdm+wDYHqQhGNmyYhuOIZvTxu
 Z/i7BcK+ctIktGDOB0027Y+Ge5IHtSHX9CbDr3bOTi2wrDDQba3RVNwQnPCXAMvSWnQp
 PQZ9fkXgQeE+yViJZ7LWm6a8YLVI7sZVE6SI/2CVhbQVvUzzW9vCWTe/Q/n0GZh1HGOb
 bCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759419675; x=1760024475;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Px2emP6ROhkv4xGAfiqCflc4uecgiLeSHdwUtniKE24=;
 b=GVsbeVogLng8tBHKtM17bvEXggoRIAIsFqE9aII2zV8/3dIF62R/RXcdSjq3nEE0Zd
 k0WMWMn6VXq2kx9vxHRNdJrRLRxTOmPza5bR3oummbzW+g41so+xzHUl7o05y8RhhhPq
 +NPujcsgtEva/v2PPIvZNQFI2/0iAfJ/bid37aiLWTvcWColdNjaYIWWoJFL0I2WqrFT
 XctS+zw7GFO98WP9rg8NsjpVDYM65/U5mqJZi3dUy36DxS/n1kRPKJGbzNTYkhQQVapD
 nGyEmcdrLNf3qzKp12Jgfs9bxrJotSTiVsnqTYzUgZaYrQBK90YCPOarM0ZGhshfvfr2
 ZUMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4/4hp+F54G+mH3rTH6S25fQ/NAXtaBG22I2m36PiKWpc/XzfjgVM9mrxcvEQWzVg5Uve5QKgPew==@nongnu.org
X-Gm-Message-State: AOJu0YyCWx6Uy7x/dvTe7AX3t3gmtSTPsf1jPPkTYtAG9Gi4TqEkLQ8k
 7Z/NBRm55K+hNcaNotTJPxls59Xt9uRe2qKtrf2nHTlO2R6n4B0FnAyqyK/7jPdhuhOENL/aDq/
 5v2nJ0ck=
X-Gm-Gg: ASbGncv1ngRpm8QToOBuun+blJQj/rMyX8PonXiD6CSE3dC+HOINQxSu0c83nuxdnzj
 CNh4kyZZ54pvS0cKVrXyNtxK6zBM0ld/XUW1BPWL5qHMUZuOBCAn2CCKvpw7dLYDuxsDpHwLm9w
 EhWWtqgK9W8ZTAsF7IT++7idIGEbQLXHnpJFeE4UjT7kNmpUUsgta/jxfeIvKTdQvJzVzvHKlo8
 JWciG6pPqW/wwlcBnXWB81KqQgJniDiyrPhIBWuMpDi9EnQmoD/zjlK0sgr/6WIUogA+pw7jOwO
 f4ytY73ghKKt+poxSDYKXZh1/rZaE9fUl/gucDP+aSpMTQWVOSWCdTv1uhmV4dI3D5d01qHYVDp
 pRS5niP3NVAAuZXoZk3okEF5ci5Owio+ucAFTlbCEL+lH0P0J8wkf2/4eszreIxVb
X-Google-Smtp-Source: AGHT+IH7iz1L8xKKJ9weFkuet7A3+RStIapsBDfVili+8Hb3PVwY9tf/4h5U4hyAvTcqskYZ12oS0w==
X-Received: by 2002:a05:6a00:238d:b0:781:1cc0:d0ce with SMTP id
 d2e1a72fcca58-78c98cae836mr55041b3a.16.1759419674665; 
 Thu, 02 Oct 2025 08:41:14 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b01f9cda9sm2452099b3a.13.2025.10.02.08.41.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 08:41:14 -0700 (PDT)
Message-ID: <7605b216-8aa1-4897-a96e-6ed9953f4e91@linaro.org>
Date: Thu, 2 Oct 2025 08:41:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V6 24/24] tcg: Defer TB flush for 'lazy realized'
 vCPUs on first region alloc
To: Salil Mehta <salil.mehta@huawei.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>
References: <20251001010127.3092631-1-salil.mehta@opnsrc.net>
 <20251001010127.3092631-25-salil.mehta@opnsrc.net>
 <60631203-626f-4628-8a40-226bd45d1c8e@linaro.org>
 <bc780e0c68fa44da975d8f6fcdb38cd7@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <bc780e0c68fa44da975d8f6fcdb38cd7@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/2/25 05:27, Salil Mehta wrote:
> Hi Richard,
> 
> Thanks for the reply. Please find my response inline.
> 
> Cheers.
> 
>> From: qemu-devel-bounces+salil.mehta=huawei.com@nongnu.org <qemu-
>> devel-bounces+salil.mehta=huawei.com@nongnu.org> On Behalf Of Richard
>> Henderson
>> Sent: Wednesday, October 1, 2025 10:34 PM
>> To: salil.mehta@opnsrc.net; qemu-devel@nongnu.org; qemu-
>> arm@nongnu.org; mst@redhat.com
>> Subject: Re: [PATCH RFC V6 24/24] tcg: Defer TB flush for 'lazy realized' vCPUs
>> on first region alloc
>>
>> On 9/30/25 18:01, salil.mehta@opnsrc.net wrote:
>>> From: Salil Mehta <salil.mehta@huawei.com>
>>>
>>> The TCG code cache is split into regions shared by vCPUs under MTTCG.
>>> For cold-boot (early realized) vCPUs, regions are sized/allocated during
>> bring-up.
>>> However, when a vCPU is *lazy_realized* (administratively "disabled"
>>> at boot and realized later on demand), its TCGContext may fail the
>>> very first code region allocation if the shared TB cache is saturated
>>> by already-running vCPUs.
>>>
>>> Flushing the TB cache is the right remediation, but `tb_flush()` must
>>> be performed from the safe execution context
>> (cpu_exec_loop()/tb_gen_code()).
>>> This patch wires a deferred flush:
>>>
>>>     * In `tcg_region_initial_alloc__locked()`, treat an initial allocation
>>>       failure for a lazily realized vCPU as non-fatal: set `s->tbflush_pend`
>>>       and return.
>>>
>>>     * In `tcg_tb_alloc()`, if `s->tbflush_pend` is observed, clear it and
>>>       return NULL so the caller performs a synchronous `tb_flush()` and then
>>>       retries allocation.
>>>
>>> This avoids hangs observed when a newly realized vCPU cannot obtain
>>> its first region under TB-cache pressure, while keeping the flush at a safe
>> point.
>>>
>>> No change for cold-boot vCPUs and when accel ops is KVM.
>>>
>>> In earlier series, this patch was with below named,
>>> 'tcg: Update tcg_register_thread() leg to handle region alloc for hotplugged
>> vCPU'
>>
>>
>> I don't see why you need two different booleans for this.
> 
> 
> I can see your point. Maybe I can move `s->tbflush_pend`  to 'CPUState' instead?
> 
> 
>> It seems to me that you could create the cpu in a state for which the first call
>> to
>> tcg_tb_alloc() sees highwater state, and everything after that happens per
>> usual allocating a new region, and possibly flushing the full buffer.
> 
> 
> Correct. but with a distinction that highwater state is relevant to a TCGContext
> and the regions are allocated from a common pool 'Code Generation Buffer'.
> 'code_gen_highwater' is use to detect whether current context needs more
> region allocation for the dynamic translation to continue. This is a different
> condition than what we are encountering; which is the worst case condition
> that the entire code generation buffer is saturated and cannot even allocate
> a single free TCG region successfully.

I think you misunderstand "and everything after that happens per usual".

When allocating a tb, if a cpu finds that it's current region is full, then it tries to 
allocate another region.  If that is not successful, then we flush the entire 
code_gen_buffer and try again.

Thus tbflush_pend is exactly equivalent to setting

     s->code_gen_ptr > s->code_gen_highwater.

As far as lazy_realized...  The utility of the assert under these conditions may be called 
into question; we could just remove it.


r~

