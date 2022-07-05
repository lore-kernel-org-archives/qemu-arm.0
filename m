Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3570816lft;
        Mon, 4 Jul 2022 17:36:01 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u68HJjfTI8ikgzPNuvWMyTniGjE+hn2HdfiA5NEdGu6wJSMEjfP3Cmdh6pziR9yC1JGlXf
X-Received: by 2002:a81:112:0:b0:317:8cc9:ccde with SMTP id 18-20020a810112000000b003178cc9ccdemr35598431ywb.273.1656981361157;
        Mon, 04 Jul 2022 17:36:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656981361; cv=none;
        d=google.com; s=arc-20160816;
        b=otJOi47noYKZtSVlyYcry2TZz75Bc6l/JkGeMOIyP87eIwNY9IAzVtAOy5JLg/ftvv
         nEIjwC4QJ4PwBoTBvX8iEqP3BkELg/EnOR/t6mwQL5VjWhJm/9CBA0W5zcF32iPyfRKX
         sfncagu3mc0h0RDQmaE5qW/w2tMtsSxsz5kZel9v4NSB1uIcO8+z9oEVn0gCRNrUi7UA
         V61HEOl4ptXSg7qq06dScM2gdoaAGQj20OKs2q13u47pQHMCXDQ0t7PkmEGO6K2NQ24f
         1KO4YE1/4NrZKQT6I7/JtqpJpHYfp9jkslSiJm1Z8yLWmjnF5JjJtfLwkoOLBQ/uEPvm
         DgRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8MWoba3t3SZd0/Yjzn/MOztMcmXoumB/4ZjpvOS6BK0=;
        b=h1bwVRgl6ADs8shax0YYXeFn2Ks4UenoOUC/VDDE9w+3DMjd7QZBUvfVP58va0fG46
         teOvyFIOt6KY0XQfoXzK/tSS6iza0YGoid48RraGs9ZKFDFS7rYK/1LhA88d8B2+DpGQ
         Pfg2ZO2P5Y8ndTN+mxc2oylG2uDV8nxzqLEcV7tn4iHfR7GjizZJN+cQWoVnuhmOM752
         yVakhJMOhQMhXi5dXM11u1xGutID89z9e8CO0CGKVyQGLh3kB0PveyrKdRjWdG/Wta+Q
         f0T9VVOsBB7VfsNPGZqweFE24F9iHEsDnp0C0r4wNVmPUsjrvx5IJfOtuBe1Ph5GuO02
         e2UA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vl+gtpsp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v191-20020a25dec8000000b0066e48969341si5278311ybg.300.2022.07.04.17.36.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 17:36:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vl+gtpsp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8WXn-0007KN-2H
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 20:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WXa-0007J1-IY
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 20:35:46 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:40895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8WXZ-0004WT-3v
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 20:35:46 -0400
Received: by mail-pf1-x429.google.com with SMTP id y141so10112116pfb.7
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 17:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8MWoba3t3SZd0/Yjzn/MOztMcmXoumB/4ZjpvOS6BK0=;
 b=vl+gtpspKcEWW8SbEbuzfv/Kt+3GPbDI9arZUO3AF99yma8mbzgn8SvqTea9GA7tdx
 urnnfwq24ejkiqDnDNeEJqTGP/lk9GXZzJekmfVba0Xiz4d+4PwivGUn4X1BRFRhtrv8
 FEyXdfMxU14mPAlkZ+egBjwiCavRDLmgTL7TllsI1jTmqrKgvqn1289HKzlGTfvC1m8M
 RLP+AB1siob+qLj/ENuAp67MMAzx5KTCD/gchfqVNkGnqvUByW/Tq+dSt8Ua4ZpGO9w+
 Y3FGYPlg1psZxXTWg+7yo6uZLFAjP1bPCtZq2dW9AQXW+fOH2RlNYKRcKsH+UpYs44uP
 9cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8MWoba3t3SZd0/Yjzn/MOztMcmXoumB/4ZjpvOS6BK0=;
 b=lnXTR4d3oqYppMtaRYgJXwMPjhhY2Jau3MrQVtxIkNaj04hDfCxq69cjJhbJ+/ZqDH
 RlwZS3XpLuQ1jIcj2zNY+NzT71VApTAChRKnJ7FzYVisXro8j91iYwHt64IrXWBQEMm6
 3UxLZEWEt3ncBVm65fE9YAzPh73JcdYueK/z1VVqKu0VgUFJYwiDPGJZt7l4UqmuXTNk
 +JFjO80zSS9CwuRDU212UKMkzXiqdmdO6xkSsKZZHl61nmHLcMUkVOvjz4xVDf+u0fQQ
 5bATrxuEs27Jodz3mae+VP3/r6hnPntGLQnsZeqIcDOhXJcmHpAMEgL8x7cEeM8CcjMS
 WmvA==
X-Gm-Message-State: AJIora9vzb0SHtHvn6rMf/enQi451DAgRluGEqqxQ/khfKbSTRSc8Imq
 WWorPNTG9bz1IQDElhdiaARRzQ==
X-Received: by 2002:a63:4710:0:b0:410:ac39:831b with SMTP id
 u16-20020a634710000000b00410ac39831bmr27424129pga.395.1656981343468; 
 Mon, 04 Jul 2022 17:35:43 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a170903110400b0016bef4a9dadsm615287plh.77.2022.07.04.17.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 17:35:43 -0700 (PDT)
Message-ID: <72df2c61-c8ab-8075-2c2f-4a52e9fecec8@linaro.org>
Date: Tue, 5 Jul 2022 06:05:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/62] accel/tcg: Introduce PageEntryExtra
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-2-richard.henderson@linaro.org>
 <CAFEAcA-2fsJoHkaq1a_k+_D2V1J2oPkDZ+7Ua=tge--ay5HG7Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-2fsJoHkaq1a_k+_D2V1J2oPkDZ+7Ua=tge--ay5HG7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a6HLxUqsf7bO

On 7/4/22 20:58, Peter Maydell wrote:
>> + * Returns a pointer to the iotlb entry, with env_tlb(env)->c.lock
>> + * still locked, for final additions to the iotlb entry.  The caller
>> + * must unlock the lock.
>>    */
>> -void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
>> -                             hwaddr paddr, MemTxAttrs attrs, int prot,
>> -                             int mmu_idx, target_ulong size)
>> +void tlb_set_page_with_extra(CPUState *cpu, target_ulong vaddr, hwaddr paddr,
>> +                             MemTxAttrs attrs, PageEntryExtra extra,
>> +                             int prot, int mmu_idx, target_ulong size)
> 
> The comment claims it returns a pointer to the iotlb entry, but
> the code says it returns void... leftover from a previous design?

Whoops, yes.  In the end I thought that was a bit too much internals exposed.


r~
