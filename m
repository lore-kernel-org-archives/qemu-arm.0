Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A74C43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 15:33:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd8Yb-0005Bi-2x; Fri, 26 Jun 2026 11:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wd8YZ-0005BN-MX
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 11:33:27 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wd8YY-0002c6-C0
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 11:33:27 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-37e00ef16ccso912370a91.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782488005; x=1783092805; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TY4VJnVWbgwM9PZOPKlVWdkQ9UB0qMHBSCt7DLzJlVA=;
 b=sHFih14lRrV3WT3TG7ORAd41R0eFtNebzriB/HOCI8WGoW0gGReLtfRogkDdX+orsJ
 +8EzEb48cGNTbcQaYzut/xfdCDhAYIFrIqhWhdoSHFFkiHNd1UG1v2M6wCBcjPrf0j8q
 J8qeVs99jrV5nAgNZko1hrawB1oYQ22LqxKyD3h5dV/NECqX76442jlmtu+DSgPzBs1H
 z7/+wv8i1iAL2B0jUlH9p/KAgQh3bjylsw4xG3GxeVNECPGB2DLhw/qH2TpJn0m2xrgK
 w/A/XvvdkBxFnV0nuQPRCHYox8i4pQqZfHyGAPRMlECXSfWr2siICK2mPbotXqXZf8TM
 ++0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782488005; x=1783092805;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TY4VJnVWbgwM9PZOPKlVWdkQ9UB0qMHBSCt7DLzJlVA=;
 b=Anth+MaYvD+OcXBqgo6xn7eWyqkPIiRUhhqvV6FHlNLS+f7HNMJnntpYDYXmx01zNh
 1zzz/x2+oROq+Y908538YtJpIpHhAN4nugijPoG2Hp6pda0JBv2xyOQ1HgoJcd2KZkPF
 LnI+IvvciPgl+ojbfA3E8COkpQ6pK3kdNl+KZcWzyuLIHr/nUfoJSKLA5ad0aKykrNhi
 R41DGOimfWcCmrSjJ6VzTLzIAX53u4eYB+nKky8/ggjZVMSilFUbl8SNJBpKaT+D06HK
 DavSBy4fHqT1f87lyvJHsUBu552zjTQ32usq5KNp9Jk/hMPDbZJIaAOEZhBZoDtlXQ2p
 +mMQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqBvKdoPBjglopcFun3VUs4kgnVoPop7m167Xj9vwzzVjG+ztzwUG56DbBWSFePaADhoHtPW6p3XQ==@nongnu.org
X-Gm-Message-State: AOJu0YyQNYsyIl5g3hgbfHDtK2Uzgo1cikD2JQIPvM/lCNNlVBukqKqT
 7RgArxwSY1TwEMEVuumXFknnW26bXd7/E5ejCSNwKMrj3gL6X/UiU+3E5tl32L9/tx8=
X-Gm-Gg: AfdE7ckuOGKLQtiUPKQwCpvVIYABw6lsDP/yEIIH+ZRQdbzm6jIVJAbVRTlqCS/yh0I
 emskXjgImHkeQc51Fs0OeIJh1iy5jWTL7aXRbrjT4ja6L5+jt5VFvWdY2jzIiFnYj5kpGnRuNCb
 PhH81WmOd21PrtzTuiPS3oDV+dZtlhs/fGHvNXrWQIB4LanuAmru75HbPY7n9luuBC48hpuQKUv
 M5OS8VWt+jQOndiuGKXR2Gk/cAP1dSGTsb3ZjiCutptZREwaHVANmKByouiObKJEbfjc2IsYssQ
 yJ6W0f009505LMhgo9ZkxVWCsJKWEITnuRQP0T232PFD4iTKIY5b82LahVaSFmNin/hncXEIQda
 yuBwLAkC3LFiPsoPdmMchBV1YrblMkJgUQAY0HqHgb6FPU3/VW46qqfidSPZ6mg6C7sqkVkHjl5
 GTuNU33hBQp5N1gT73/Dqb3IWfafnw48RsD6OKEaCal5ej6dT9ExTUO2Xyyg==
X-Received: by 2002:a17:90b:134c:b0:37c:e729:27ce with SMTP id
 98e67ed59e1d1-37dfa1bca8amr6903400a91.10.1782488004532; 
 Fri, 26 Jun 2026 08:33:24 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37e12c9229dsm772117a91.1.2026.06.26.08.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jun 2026 08:33:24 -0700 (PDT)
Message-ID: <ba12bbcc-5801-40ad-b710-f834128816c7@linaro.org>
Date: Fri, 26 Jun 2026 08:33:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] target/arm: Implement FVDOT (FP8 to FP16)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-10-richard.henderson@linaro.org>
 <CAFEAcA9fCEyLoDvYA2JR30+7ZGaN_t_taRK01gb9y4k4NNe8HA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA9fCEyLoDvYA2JR30+7ZGaN_t_taRK01gb9y4k4NNe8HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 6/26/26 02:27, Peter Maydell wrote:
> On Thu, 25 Jun 2026 at 02:52, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
> 
>> +void HELPER(sme_fvdot_idx_hb)(void *vd, void *vn, void *vm,
>> +                              CPUARMState *env, uint32_t desc)
>> +{
>> +    FP8MulContext ctx = fp8_mul_start(env, 0xf);
>> +    intptr_t oprsz = simd_maxsz(desc);
>> +    intptr_t elements = oprsz / sizeof(float32);
> 
> Shouldn't this be sizeof(float16) since the output elements
> are halfprec ?

Oops, yes.  Thanks.


r~

