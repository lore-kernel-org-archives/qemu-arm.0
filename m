Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A63EC88E72
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 18:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6BAf-0004iN-1M; Mon, 14 Sep 2026 14:12:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6BAd-0004hq-Go
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 14:12:47 -0400
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x6BAb-0004DU-BN
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 14:12:46 -0400
Received: by mail-pj2-x11.google.com with SMTP id
 98e67ed59e1d1-398b3b189e0so1793961a91.2
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 11:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789409564; x=1790014364; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=QuUBr9zdM4htmzHHhtIWkMLhsZadnXhHa5dce6S/0a4=;
 b=T54gGVfwhcVO2bNnKbamuNjjypkwgc3LtAkaeVEWaOMkEVT1VVsGVQWsl1KgWxM5ia
 kiJsbKsqZwAzbVIY8a/VvohmMcFDPSJwsvXmBVaA+wL1f8LUgJL3l8ZEDuI+8G2fd+B9
 R646yd8id9Nx9S239DFeJRJwJXVMR4gmP1hYoHSg6O0pZlgzxfJqZqBlxEQGnAKlTnUj
 tqX/spyPb0QFGfFwFcWrBq2Sq0Ji8Qaiy8KcKxt6W+s7choIVa9JcdDW+4pvNFQDVpLQ
 3UqAmfO3+Bca7lwhlfw/Cm5pGZwST8rzO3rty+p7tGXCuVNBy6NBFV+PBRXvQhRSrZpV
 Fc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789409564; x=1790014364;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QuUBr9zdM4htmzHHhtIWkMLhsZadnXhHa5dce6S/0a4=;
 b=kJbNNhf+SEdVss41CynSDQdALjJj4LEW6gnWsKCPCRoDcEHurq5gvSkP/Vb+5SojKv
 0QgylPhUXl2su9xGDTFZUtJiJknkiltvhLqdRKbcvwxdhA1H+Q0KYRmIDF5rw5CHx+XB
 O3bQ+K60VYzDj1g+EoGIPmvP6SVgcJFDTFNRzKMYt7sj7oJV+q3JyqOxhvtlF8kTC4ny
 Syth7OmLYlrzvtqL+FLiHt7bt2TDgyk6/9A43itVlWk4yFZwYwqde5+lUm9M0g9Zgd/t
 Y8VMUgaaUHq97zYU/RoQxlCAwLmXEY46ndHEPsjdD4KBnzzOtYo/sY34R7xMTKzWuoTU
 kzeg==
X-Forwarded-Encrypted: i=1;
 AKwUvBw1AlestS7WBebhhn0U3mf4DMxbVd+FcEGA+6Lw7peWE9K02FFkBN8V8JyP/s/gRK3rjxpMmU0fEw==@nongnu.org
X-Gm-Message-State: AFuF++kH22S9tyZXYR4dL1UAAwKHJKSI7ryILozgvu6RDExC8v2hgR83
 q9OmCoN62arQCnpFnwg1VllnoEobxqkmunmNmU+FB764Av4o/isKf/+BG3e3gItyNfzCZRfcFqR
 J8y+Z
X-Gm-Gg: AYBFou3fxKo9c+69bDzXlFauU3PHp//HFlUJOYFW/1od1ppxm121+8UgMaVonXMd26n
 aOf2tWsy3cfTW6FJzh69db6kzIvDnH9ifShx1koiHdK62tK8HQz4j8kyai0vAhv+nS0ODCEuyEt
 LGgDa3kPha4MZFkOxAi4Ba8vuKeqe3CwCSF3Z/vW9gkra7BDx+spR81qvZ78+VVj8zRjbh+9L78
 5/zeXIZKSPK5qoF1F74hjahhm+nbmE0BKSpTakp8z3lsdb8nYdgSfyTQhAX6iAwBRo9DB2qkS7l
 4ysboThl5tydfsbeHAGx2ZlcCYlKgOfzCgRYkXKXscypnYUlmQAjZapWOdR5SmW1RUV4W6YhZY8
 q8uFbOZwaXAtqKOhaI1+PkTiqHwLup75/3pMtwrVa1JDBd/lNEKPNNw2hm+gvkIJLj6H+uLMe9i
 H/DLwlyIB9RyJrLGK+dbzp6X9i99Is9+o8vrTRpdRql17YsFoyn6onArKRkmbX0inghmLbYFHgO
 fbgXPxqqPbeUn0ZbEcghKx+IRokH6262RdJopd1Z4qNUP6swr18nYq4GmDjww==
X-Received: by 2002:a17:90b:4f45:b0:381:1c96:829b with SMTP id
 98e67ed59e1d1-39debf6f167mr6970370a91.3.1789409563549; 
 Mon, 14 Sep 2026 11:12:43 -0700 (PDT)
Received: from ?IPV6:2603:800c:7900:ed00:7164:7976:4c53:31bc?
 ([2603:800c:7900:ed00:7164:7976:4c53:31bc])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-33be20c67b7sm1000162eec.15.2026.09.14.11.12.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 11:12:42 -0700 (PDT)
Message-ID: <72dd2ada-3b4d-4563-860a-86bf6c6a8a90@linaro.org>
Date: Mon, 14 Sep 2026 08:12:40 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] target/arm: Implement HCR_EL2.TID3 trap on
 undefined TID3 registers
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260806173123.333423-1-richard.henderson@linaro.org>
 <20260806173123.333423-4-richard.henderson@linaro.org>
 <CAFEAcA-NoW=39G_m21zQO6CzH5UU3MnsKuFNjkjX-55gzXqD2g@mail.gmail.com>
 <a930c1b6-dd93-46ad-9e61-eafda9dcaac9@linaro.org>
 <CAFEAcA_-UwXB9svLsFwJRfe37+CkwkRHnNVoWDScTEL=L4uOpw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_-UwXB9svLsFwJRfe37+CkwkRHnNVoWDScTEL=L4uOpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:39::11;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 9/14/26 07:51, Peter Maydell wrote:
> On Mon, 14 Sept 2026 at 18:21, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 9/13/26 23:16, Peter Maydell wrote:
>>> On Thu, 6 Aug 2026 at 18:32, Richard Henderson
>>> <richard.henderson@linaro.org> wrote:
>>>>
>>>> It is IMPLEMENTATION DEFINED whether HCR_EL2.TID3 traps on registers
>>>> within the range which are not explicitly listed.  Previously we chose
>>>> not to honor the TID3 bit.
>>>>
>>>> However, with FEAT_IDTE3 it becomes mandatory to honor SCR_EL3.TID3
>>>> on these registers, so we might as well honor HCR_EL2.TID3 too.
>>>
>>> I thought we agreed not to change the behaviour here? Is this
>>> just a "forgot to update commit message" thing?
>> Oh, yes.  Because I did update the code to test for v8 in translate.c.
> 
> So what does this patch do? Is it just a no-behaviour-change
> refactor so we have a place to add the SCR_EL3.TID3 check
> in the following patch ?
It does what it says on the tin -- it honors HCR_EL2.TID3 for undefined 
registers.  We currently only do this via access_tid3 for defined registers.

The comment from v1 was about changing the behaviour of Armv7, which is 
addressed in v2 by testing for Armv8:

> +        /*
> +         * With v8, we have the possibility of FEAT_FGT which requires
> +         * trapping with HCR/HCR_EL2.TID3.  Without FEAT_FGT, it is
> +         * IMPLEMENTATION DEFINED whether TID3 affects IDs in the range
> +         * that weren't explcitly listed.  We choose to trap.
> +         *
> +         * With v7, there is vague language about "not required" to trap:
> +         * see access_v7a_tid3.  We choose to not trap.
> +         */
> +        if (arm_dc_feature(s, ARM_FEATURE_V8)

etc.


r~

