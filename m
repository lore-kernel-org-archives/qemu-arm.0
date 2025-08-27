Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995DFCA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 02:36:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur61K-0007BZ-4u; Tue, 26 Aug 2025 22:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur61I-0007A7-39
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 22:36:16 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur61E-0004iN-A2
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 22:36:15 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-32597b88f0dso2611968a91.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 19:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756262168; x=1756866968; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=78+kLvkuIIKpTyQsSDXNftsAeHo+F+DRkn7XFFPHJ7Q=;
 b=UjHlmQ3cWIvN/rVpi+pSd5gG6lTWKMpe6OqwydxjgyPx+raU9RxrZi9EUjGX5vLpCT
 lOelpPK4v9h3BRlScoHeGoNMNaP5Gp/qRdr4YWRUCN5RbMcq7jvzU1SEq9Yfw4S1PMu3
 zVjM5UwZWzhV989EJnapfUJkgmHWq3vWtoVzcLp/Z3ymdltzyOI4XzObcmCmAo9GFlt2
 BhDq6sqx/r4s2iLc464UQibJS4/IQvmj+qc79ahX+QzSsRo8ui0f2O20ljf4Qdg2pRCA
 YBm/YLExSFGlCr8sfdnrfEOvC5UTElC5rBLnZwGhHBB5L/5xMBBcwN7c5IADX+SMvXKj
 aN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756262168; x=1756866968;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=78+kLvkuIIKpTyQsSDXNftsAeHo+F+DRkn7XFFPHJ7Q=;
 b=hd4t88CeZtQAR0txUHKMIVbUyQYkg44REtvH0miceQ52+snQ5KOXcOAQcSPb5BY03r
 r9/OUhCYrRvVfwFIZ74ISWwzU/9M0J+8fKqMyhpr1W7sqrr28jphWYYR/dmnplWqO1Zc
 iipgwitMAmJieMoKf4GLcnkAJNtopMo0R2yoh6lEFv4HyiWzQXpEhiK7+i5fDL7/kf8M
 GMAjNYPjWGasIcBMMkvRduCQ1EmBVjdr99rLfng6rkRQdaGTn9l5LuvA+1nthnXKie0k
 7ZjWMZiVAJ5O/K9mZbbOvokiPWMyG/O2ZkZUb68+THGrZdaeh8MVQduNuR84kmhZMdJp
 hotA==
X-Gm-Message-State: AOJu0YxaVYQXkPm88DBujVQP/c/LFxKolUhiUvLCYl5iOuhPud5PBDyQ
 wJozvQNDXMcUjAOk8nHFa/2vr7ILmquua6wtbZehMXb5+jRJps/SXL3TWCzxVeCLB+Y=
X-Gm-Gg: ASbGncv8h1787P8DMom+YLKqMFWLOsnVJxOAIqepuusfhTK9BK+9atS2mD+2ZPvQk++
 M7mzS17FWBzODLp+YR8voogU5jvPRYfqWAethZwQysX+rNvjUdLsitkzhVTCStCIe48Sk48cYpc
 daknD86zpRpfwFwePoEAYsvUisquqv+wku5LjCdvG1C7lf9bf4TDKKFF1Fq+8hht2wqZgCJwM3t
 BMeNdX5InSdYeVNsuC5V90N8m4ReFwSj/X1W48TlXsH+VG+nnWEeabqFOCUEbjtkPu6QiRhP+p8
 JiM6Ry2WJWnOCZmKeLX4C+E4ffd1/n8OZf+F8twyUiF/fouVbyjjAS48SnHrpUCg+7VHeqs8Cri
 LAolIkwT3K1Thbv8nvcXZdE0ydmUm2IDf/WGV7B3QCc96tJU=
X-Google-Smtp-Source: AGHT+IEMH/6k9iUkQUJjPhFTo5HTTYHkTDuuh40+cUuzEqNePBeDm/g/uSjbXDaqN+X6LoGEfKQVCQ==
X-Received: by 2002:a17:90b:2f87:b0:321:b953:85ad with SMTP id
 98e67ed59e1d1-325177447c5mr22388273a91.30.1756262167429; 
 Tue, 26 Aug 2025 19:36:07 -0700 (PDT)
Received: from [192.168.0.195] ([144.6.121.55])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b4c2fc5f9ccsm3024279a12.45.2025.08.26.19.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Aug 2025 19:36:06 -0700 (PDT)
Message-ID: <6b8e94c6-f651-474d-a12d-ae9a1033fe9e@linaro.org>
Date: Wed, 27 Aug 2025 12:36:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/61] target/arm: Implement FEAT_SYSREG128
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 8/27/25 11:03, Richard Henderson wrote:
> Requesting feedback on the implementation of 128-bit registers.

... and of course I also failed to empty out my temp directory,
so there's 4 stale patches that got included.  At least they're
obvious in being N/M instead of NN/MM.


r~

