Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8FCC87FD2
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 21:11:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhx2C-00082V-AZ; Fri, 01 Aug 2025 17:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhwH3-00008Z-Gy
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 16:22:43 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhwH0-0002ik-M2
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 16:22:40 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b3aa2a0022cso2258044a12.1
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754079757; x=1754684557; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+Xg1GiL2IgqUufNbfll9L1NhemReaq4SAsPynjLQxc=;
 b=TMiO+G7gmuHX+MD+ZJ8K0Dm/bT92joJAIqHprfJ4Ngfj3PXI8BHVaISLlB8kLVuJW8
 smRzur7Iu7FkkJfL1LS2yCiN+wffAr2coI4Pf5SI1jctEYGuyre5zbjugXrORxbl3K5B
 N/hPRq3EyrnaW0gvOyYZAdFp9YOTrCvQwBaVByLTbmBqF30MuXAaQCEh/bzfAatbcg3q
 kg2jP01dXkHKVZvpdiSYcuYeu8XnPE/NpJLsbhLxLVCoVTJONi+2xHmg7B3dq7lEChZb
 NDNLaj/bb13sL3+RyRBOzszErShKMR/MUL2r9A5AUtVWupfaxUrC+iY0tfxsq8wYzNhQ
 Hubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754079757; x=1754684557;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+Xg1GiL2IgqUufNbfll9L1NhemReaq4SAsPynjLQxc=;
 b=sJpEpe0tzcTcK0B+QAaqfrB2aIzz2ZpYlVQBuWcQWkC5UjqFWO8RCXjqrFHKLXogkM
 2o0PjkzbG7YqLNV90pML1ZHiW+I8rOc6ENNIUulbfspVDbLA+IP5lelNdAZipv6lEpT9
 xpZC2GAR/LCAwsjGeinWEfJGN7+sJKNNvJfwJi2TXAAA5J5ggKknQphEsTYj0vc+H1zc
 97RoH+drcjwqriEFSWvClBBs1x/DIGjKKTTBuzc2218fFyGh105FQYPblVThhvJDdrTK
 kechHCNupFpiDFFjY1EwkN0H48Fx5DbL02WMuSOwJYa6yF3lk2jnnBCDmskvjkJ/LlMp
 CTiQ==
X-Gm-Message-State: AOJu0YxUOvtAI8PX4p6oENFYp/XFIQyJ0Af75yP4hBzeqFEKko7rMb0I
 yYsLUyxzsfmD1d1cYUB/5tYGJ2B/JT4bc7rNYtYW+HugIbt+aGqPgABusdCuUtYoK1uHt6BLWm3
 59yAsthg=
X-Gm-Gg: ASbGncuvwtkG7tZ7oQUOC/qqih9BpFHXJMe8HcCyv31OG7dAY4hSkJSPui8BYFtBSBy
 KeNLFssAI+9VnMKJjbIVmHFJgxcc3OTB3zm/6c/HybW7t4QmnMYCffKv8aSYtBVuqgtpbo//pOW
 OkcXUAbNfAO1qYP+XPLX0du3agTOM+VntqbkaGWt1bBNCuJVFnwWoYCXC3mcNa29z1SqIdyG/YE
 e/4AlzP9+E121aTA8NlNJ7zB/a5Z6iivXC7hozOWAvN2fV0FHXa/iYzyCaKyF6omPobZHHFdnlt
 F/lPSGVVfH9+h/Ziq/tCYYrZiom/tp92MwhA4rY7A7O1Lkb4IeyzW1CGaxqSv9otLMQg2ZYWG+4
 Js6eytVRDaHJoCMGQKIi3uU4sBRZBmSM7Rmw=
X-Google-Smtp-Source: AGHT+IGzkLPHYPxF9WKZTAu/+OgIHbFJDQUpBuMHeafp5gjM5wpl6PCxu4NvT7ZtNy6sK0Tz4hxKuw==
X-Received: by 2002:a17:902:ecce:b0:240:8262:1a46 with SMTP id
 d9443c01a7336-24246ff3902mr11031375ad.25.1754079756671; 
 Fri, 01 Aug 2025 13:22:36 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f0f6b2sm50887545ad.54.2025.08.01.13.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 13:22:36 -0700 (PDT)
Message-ID: <ba19d78b-ddeb-4ed0-a724-e20b01fded8f@linaro.org>
Date: Fri, 1 Aug 2025 13:22:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 47/82] target/arm: Expand pstate to 64 bits
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-48-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-48-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x52a.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> The ARM now defines 36 bits in SPSR_ELx in aarch64 mode, so
> it's time to bite the bullet and extend PSTATE to match.
> 
> Most changes are straightforward, adjusting printf formats,
> changing local variable types.  More complex is migration,
> where to maintain backward compatibility a new pstate64
> record is introduced, and only when one of the extensions
> that sets bits 32-35 are active.
> 
> The fate of gdbstub is left undecided for the moment.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h            |  8 +++---
>   target/arm/tcg/translate.h  | 20 ++++++-------
>   target/arm/cpu.c            |  6 ++--
>   target/arm/gdbstub64.c      |  1 +
>   target/arm/helper.c         | 11 ++++----
>   target/arm/machine.c        | 56 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper-a64.c |  2 +-
>   7 files changed, 81 insertions(+), 23 deletions(-)  

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


