Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1054877lfo;
        Thu, 3 Mar 2022 13:41:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyefxAcXu0CdxumCsskpUuqF7NkXhk7Qny8yj2UfgPpJpPQbih/P2eZW27rsdzcU/oBHbOx
X-Received: by 2002:a5b:491:0:b0:61a:5ff0:5d4b with SMTP id n17-20020a5b0491000000b0061a5ff05d4bmr35042065ybp.159.1646343683191;
        Thu, 03 Mar 2022 13:41:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646343683; cv=none;
        d=google.com; s=arc-20160816;
        b=Lt9pa3/XA4m5Sz/mRD+HD8Ek5aklZRViBKSwRccELcl7Kc9kf+C4DhCqoxTRF1vO0f
         dlkdRVvSoXBqRLuL9VdKgbq4kndZft709TDvzCg39tSLqeF62/YNzUmBU3w0TXnoqxJF
         mZJSxnHr3Zh/4jPtkKugLHf5so5w+eFfSGx7CAheUm0JnnyBVP/oT4LS266LrALIuqHT
         rwvE5Dixx8VXZfFCEE9ZJXxju+qHkEIvZXA19D4gFDtl2uUyLOVLeiVzbJyA8nEJu5l/
         4gDZJJA3WtNXQWL28Eo3zaGPVdqK2vP18SIGAbUpbCwBFJbNTZfyUXXl0DvVFuSSrp5D
         shdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=BQIoEJ7S5dzCm9BAbt8oLQtDQ5JsSUQBoXNNlip4qK8=;
        b=w52khsm6I4zzBpM+KLtwr13FleXi7Bx+IUi5ckjFUH019Ofo2RwSpJg/CXcov3WagS
         tjqKA/r8rqhGnaopq8t3R23mW9qLHOrulE0OcUJmf3GXwHh/apcfR5DfoHk3Gc5a27Kj
         cy9mbF04zYFbhDSRN1S8JgP5ycWEsOYtYjUDbLLwCPmgxc1j8NqMQhYHM+UH/VkxJSGx
         dUP72571j1QM0/zSFt4QovorJdkUHAkZzn/kpyZPAq2/sJNNZAdgZJoK1zoVZZIvzM71
         l8U40GJrVdQWYGzz1lJeR/L5KuJ49bIGwYbSRBG6JedDIo4FsQ3uyGu9wRbGxwhuh+EB
         iQ1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbJSgQOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i145-20020a0ddf97000000b002dc47cc3942si2186205ywe.405.2022.03.03.13.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 13:41:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbJSgQOm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPtCM-0006nM-ID
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 16:41:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtCD-0006l8-Ht
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:41:13 -0500
Received: from [2607:f8b0:4864:20::430] (port=46781
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPtCC-0004N7-45
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 16:41:13 -0500
Received: by mail-pf1-x430.google.com with SMTP id s11so5844090pfu.13
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 13:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=BQIoEJ7S5dzCm9BAbt8oLQtDQ5JsSUQBoXNNlip4qK8=;
 b=lbJSgQOmh9KVXcPDgGPyT58CHwLQQVwS8X35WHQ0SkSDaBSNCgL/JbCoqU6N68oENA
 Q5LU1/0ymZSCCmTQyxIJlmbO1widqq6PL9Hxaxt2gYbhuqoNqrTPtXid7zxdBkvhL3C/
 VmhTV5OiL58ikMM0TwiJMc6ureVOClILjFJIxtqMbi3ImCIE0qzU+BMuGyvCZcWEf2fm
 dyW6JipgLcnkb/bBo6ZGWfISDFiVDaua5fOitoZdPz8jySlKZ/3ZJkiaRfwSyRy3JWNd
 jByx/Dxggqb9a6elEDYpIgjOKbnQfUWvq9XSyWO9P8aXC9Zra8hqaUfC/KrwIQgNfvpk
 FpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BQIoEJ7S5dzCm9BAbt8oLQtDQ5JsSUQBoXNNlip4qK8=;
 b=zu4xxgAkonyOcXyIZPZmLX03BQYRN9WVXDehqw0lBg7F6dALWWQ3yP3D9OgA0XUIL4
 ENzR31orj4kLhNFSXQgysYteZmzIsfX9jhtfnVywVNlx6pMM3y6XyPPddeB6R1j2qSHI
 aj82mSwt6Jd1WQJkaMy4A7ELCLQkCmg4NOo9Mt3alYAx9KafagDPFW3UZJvd7ndAp7re
 1k9s9XLRwYmma9L/D2ChLAjBmV8k2NnFAypr8+1PTXmtkdFCK1fJpQO0HIAlX0Q2q8S2
 tse6YUqoWPGyRlGW38UvcdE5FeGMyi2K0OTT9WHehwL4WuDJsb4au6DyW2sGSLgc5fRb
 RqzQ==
X-Gm-Message-State: AOAM533bacTefJZDXT0bVj/iMX1iJoT4DDvCo/iQP8JPEyA4dLvMdW0a
 EKRm9yc811Mn5QzEK/gPCZG6+mOOvRJrKA==
X-Received: by 2002:a05:6a00:1da3:b0:4e1:68a4:3f1f with SMTP id
 z35-20020a056a001da300b004e168a43f1fmr40255694pfw.64.1646343670764; 
 Thu, 03 Mar 2022 13:41:10 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:119c:490c:a4ee:8e8?
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d17-20020a056a00245100b004c283dcbbccsm3644231pfj.176.2022.03.03.13.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 13:41:10 -0800 (PST)
Message-ID: <0a02de8d-218c-0064-8b63-873762a7a717@linaro.org>
Date: Thu, 3 Mar 2022 11:41:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/5] hw/intc/arm_gicv3_its: Add trace events for table
 reads and writes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
 <20220303202341.2232284-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220303202341.2232284-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ATrT8icOJza3

On 3/3/22 10:23, Peter Maydell wrote:
> For debugging guest use of the ITS, it can be helpful to trace
> when the ITS reads and writes the in-memory tables.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 37 +++++++++++++++++++++++++++++++------
>   hw/intc/trace-events    |  9 +++++++++
>   2 files changed, 40 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
