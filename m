Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D641DCD3442
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 09:59:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKvWD-0004gq-4q; Thu, 07 May 2026 05:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKvVn-0004Yu-BU
 for qemu-arm@nongnu.org; Thu, 07 May 2026 05:59:25 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKvVj-0007Bg-7p
 for qemu-arm@nongnu.org; Thu, 07 May 2026 05:59:19 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso6478845e9.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778147949; x=1778752749; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MdQydxO2YKzO5jhQF+2UXizLtBc96AYezVbtCwrV7Wk=;
 b=qVbcssUKyY0S4WhDC3cx79gR0bw06pKBqTqi4FYAjRq6uOdZClPI8R5PFAleffNvgs
 r+MbbHOCnACdGNcuypD1hGqn5UVrsEQ54n1oQszgKQxXbv4sboFFYSsipbEq6B/Z3uO6
 SGs5apDZeZqI/RJ6Wm2bfXduZ+jBBT8VEp1NL0CmEUcj4pUdGWzFyG3FhPu2Q9ebE2Kl
 1Oz8v4vPNf0ipxKBIMDM2w+ONkcgemwu2RbzbpxxC4FQHLvb9z33ea0LNEko16sHYAe3
 z5leXep7wSjPe007wQ2sKaR5nmfi1tcaz6Vjr9AuRWNk5QtHa2e25OUdhjWNz2fz41DG
 X2IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778147949; x=1778752749;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MdQydxO2YKzO5jhQF+2UXizLtBc96AYezVbtCwrV7Wk=;
 b=NAqSZU8oEMsHvsIhT57HtLIVJc7vIza8oHpNOHD1lLrTrhbcp1PjKgPbx50sE0XKxm
 QdpnL8Z85pID+iv4UkLch8hqg7v03S9p5Yuii+Z8krmjS7wuteueKObssPu9kp4y4tco
 hu33mKV5CYpr2TTkA22NNKMxXayzeoJXjzLIZybPcVW5f/B+BcFUjU46yVTODRuRn4Du
 +VCE8AetK2qHqf8gwcqOf6Qz7kJwcu8xlzaEkSODdEu3jOAvFOlj09uD2iRoysXuVla0
 9OAtmXhbLIkB4KKTSpGB+YJnXAVpwe6agdjQhn4+birNGsT635Bc5NmhiREAVPx5KlBK
 D2/w==
X-Gm-Message-State: AOJu0YwfIA8oQkxRCCgXDnGCFxlJ+SdA9aCEr74ULufMEZB9T2I/MVYJ
 epC6iWjoH5mvymFuHZlrpWO7LpF7zuue4zFSE6G/+pwjJyCWQPbq8LbjTQmZQhOgUok=
X-Gm-Gg: AeBDieuC/f+eIa33kcOEM1QjZNQSz+tg9rB/diTfVj3f5IwJmvEqTZa2D0SywRNMed9
 gYrF/TWPftFcK0bH4iQ3RXpaRr/fiiJyf0mxUN7P6/XVDwsJxrNwzhUI2IMlV27/MWP1SOiYM80
 K+zskCQShCv32l6n5AQYD0vrQ3WQbW1/aibt8bF5gkudNiBCoB9WRFwz73CInGtxudAMw6Gwc3M
 XA3yBRuupRCqB080NPV8rPbuLMkZ3de3JCTwybFijfwf2N6nFFMvMe1qgXJqFAZJFJhc/CAoK2T
 7hO8UcYGim7bEty/2bKo4BFq3PVTA6Us6SDpe73E5Dn5gMOdbm2rM0h2TwnAPKPvx3GdvW70lRU
 zPp2Bwu1TvFatIMslOq4sVEcSQTMY/dbqA9WQ61ed0OruG4eApmNwBrxUg9Ob9BoCkFLSj1qkcJ
 rywErw6k9Oefu+BP22hHQMRVqslx9hc7wQPgLTOO4BdagXOrixSFTntYq6dddcMbMHXxAifL3zZ
 F+k
X-Received: by 2002:a05:600c:1d11:b0:48a:7f90:2231 with SMTP id
 5b1f17b1804b1-48e51f364f3mr123442355e9.19.1778147948573; 
 Thu, 07 May 2026 02:59:08 -0700 (PDT)
Received: from [192.168.69.200] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53895f0asm124450255e9.2.2026.05.07.02.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 02:59:07 -0700 (PDT)
Message-ID: <6d92e855-9f84-4248-ae82-39f9031b0bf4@linaro.org>
Date: Thu, 7 May 2026 11:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/25] target/s390x: Make get_phys_page_debug handle
 non-page-aligned addrs
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Peter Xu <peterx@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chinmay Rath <rathc@linux.ibm.com>, Glenn Miles <milesg@linux.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 David Hildenbrand <david@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>
References: <20260430093810.2762539-1-peter.maydell@linaro.org>
 <20260430093810.2762539-8-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260430093810.2762539-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 30/4/26 11:37, Peter Maydell wrote:
> Currently our implementations of SysemuCPUOps::get_phys_page_debug
> and SysemuCPUOps::get_phys_page_attrs_debug are a mix of "accepts a
> non-page-aligned virtual address and returns the corresponding
> non-page-aligned physical address" and "only returns a page-aligned
> physical address".  This is awkward for callsites, which in practice
> all want the physical address for an arbitrary virtual address and
> have to work around the possibility of getting a page-aligned
> address, and it doesn't account for protection being possibly on a
> sub-page-sized granularity.  We want to standardize on the
> implementation having to handle non-page-aligned addresses.
> 
> s390x already has an implementation of "give me the actual physical
> address, not rounded down", in s390_get_phys_addr_debug(), so we can
> use this for the SysemuCPUOps::get_phys_page_debug method, and merge
> the s390_cpu_get_phys_page_debug() function into
> s390_get_phys_addr_debug() which is now its only caller.
> 
> This leaves the function implementing the method with a name
> that doesn't match the method name, but we will fix that shortly
> by renaming the method to *_addr_* for all targets.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-id: 20260417173105.1648172-7-peter.maydell@linaro.org
> ---
>   target/s390x/cpu-system.c     |  2 +-
>   target/s390x/helper.c         | 20 +++++---------------
>   target/s390x/s390x-internal.h |  1 -
>   3 files changed, 6 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

