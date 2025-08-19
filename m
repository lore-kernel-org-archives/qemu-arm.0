Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B683CA0EE6
	for <qemu-arm@archiver.kernel.org>; Tue, 19 Aug 2025 20:57:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uoTOT-0000sf-Fd; Tue, 19 Aug 2025 16:57:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoTOR-0000rk-08
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 16:57:19 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uoTOP-0001ls-2K
 for qemu-arm@nongnu.org; Tue, 19 Aug 2025 16:57:18 -0400
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-4b0fa7ed37dso3159261cf.0
 for <qemu-arm@nongnu.org>; Tue, 19 Aug 2025 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755637035; x=1756241835; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IRHqFtuAaiwQtsxeI4JfWKl4QUfmjBlgFn2CP+SXme8=;
 b=OK0VGlmGM2VXY6m7cHHOKMngNYNYEBBj8x9HY/geKCZa7ydtZIcyq61eSJUsj/dcf6
 L3k071oF6X42biUa9WVmCpc+h983gsjMBYvspoKHs/N3Pl+1ocUPUSjQTsMO2faGgPMn
 EF4Ck/0V8N8QjRXPwpxoo/Uo+bbIJz+oIDIHd3FkjZ2FZtur12+0RchduNpOZV/e4RdN
 ykI3zZ9uLHI95ix/qsCghXVu2m3Of2zb5KibnjdLMyxQBJONki0rD5Zhs+v32QAWV1cj
 6/gey6K7tPG1Z6nQv+CHAXtAGZb/JfNBsn1mNrpO0ldx5oyPP+pCGE1QzmFoncn4QNZW
 LhHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755637035; x=1756241835;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IRHqFtuAaiwQtsxeI4JfWKl4QUfmjBlgFn2CP+SXme8=;
 b=EVtCsfUgagbv2SES9E5AlsVam9idFFayR/cGMUf03a+FC6gs/JItwUDPN7H6hnfj50
 +4zYZdv2rZhILV95SIIgfP1NNqMBvQmGF+n2p37YZCovFhL4d1jaaoOvMPEtuzhf0rbL
 oYsLeEEnnZydiTNCga5NheT9nxxeLyq/LwjpX/LXt3ROh4CdEZku6WExBtqg1SzxQNtc
 COI7HK+iDua3/gnuB/J0sMR2/aj+aVeBF1jkGMPVgAGhSj9ZbJ99I6sR0GlND1r3mSOM
 10TJ+MECVYKhsg16J1vte8nm3qAcar3zCIQDvXktOIm69Zr9qgc8exDO5h18owohkpmc
 J/yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8XevrozHNN+kzc43C5D8wj7fx3rj1qO40mTlMGaIokaEMXxpucnLoVQGrTOKVeCyIvivDjGvStA==@nongnu.org
X-Gm-Message-State: AOJu0Yw+j8ukLe0SiDDp+u3FGzqzDudxFCz08TVp/69HNYjEArR1xVtl
 YEP1+UiNYo6+NYFqgzoc2lUnPlzT2DB7+nCPboa5BiopVQCFwvbYkZh24bvDLbhSR/o=
X-Gm-Gg: ASbGncuuQMH2yrHz4K3O5W1oPQDKHMjNCVnRnLmRniOOSTazBCCkpBVcgOwAIsNvJwK
 sU0VBeIiI8ouTn1crRbWfjWK+grl/gAPj2f0jKGVnDWD4vRVSDRnP/E/+Obfdc+mwzE7PAuE6Md
 iFj6ulLo16HZwRWDOyDPEqHc2j4X++NUazLuCf/Sm6f2e4C9pCt2sTIacBwTO28B1SgPcBavMEZ
 +tGjCeSUM8p06nyGOcTBnqcWUBDYzEiJdzlddEVXeq+zXSNUH81s3gK6EFX/EMeR2cOGWMAm4oQ
 7PW77X4GBQHTRqpBqCkgOY2UJ63GKun4OYjIfYxvy3uCTsLjqrd8rZpHyoW4QwofedxiYFR5y7N
 PCFOllP7r49SVgXE4zLrwG7XGZk4Kx2KUVhOP7JwWq9G3esuB
X-Google-Smtp-Source: AGHT+IHmvnuQsyppVq+Deo6XAftxNII5VX+pozDEg9VhVgdL2AfwrhzQF1nd5WjwEbpWbFCKvdJfPw==
X-Received: by 2002:ac8:7f53:0:b0:4b0:ca36:90 with SMTP id
 d75a77b69052e-4b29119eaa7mr10495291cf.8.1755637035044; 
 Tue, 19 Aug 2025 13:57:15 -0700 (PDT)
Received: from [10.225.235.227] ([172.56.183.187])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b155b5baf4sm47202391cf.0.2025.08.19.13.57.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 13:57:14 -0700 (PDT)
Message-ID: <119375c1-fd2b-440a-9f9a-73ecda93f3c1@linaro.org>
Date: Wed, 20 Aug 2025 06:57:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Correct condition of aa64_atomics feature
 function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250819145659.2165160-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819145659.2165160-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x834.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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

On 8/20/25 00:56, Peter Maydell wrote:
> The ARMv8.1-Atomics feature (renamed FEAT_LSE in more modern versions
> of the Arm ARM) has always ben indicated by ID_AA64ISAR0.ATOMIC being
> 0b0010 or greater; 0b0001 is a reserved unused value.
> 
> We were incorrectly checking for != 0; this had no harmful effects
> because all the CPUs set their value for this field to either 0
> (for not having the feature) or 2 (if they do have it), but it's
> better to match what the architecture specifies here.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I think it makes more sense to fix the condition first and rename
> the feature second, though there's not much difference in it.
> I'm happy to fix up the trivial conflict in target-arm.next.
> 
>   target/arm/cpu-features.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 5876162428a..a4d00a001d3 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -408,7 +408,7 @@ static inline bool isar_feature_aa64_crc32(const ARMISARegisters *id)
>   
>   static inline bool isar_feature_aa64_atomics(const ARMISARegisters *id)
>   {
> -    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, ATOMIC) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, ATOMIC) >= 2;
>   }
>   
>   static inline bool isar_feature_aa64_rdm(const ARMISARegisters *id)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

