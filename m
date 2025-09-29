Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3589CAC5B9
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Sep 2025 23:05:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3Mvh-0003Yk-K7; Mon, 29 Sep 2025 19:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mvg-0003Tg-1s
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:05:12 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v3Mvc-0007fV-Sy
 for qemu-arm@nongnu.org; Mon, 29 Sep 2025 19:05:11 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-78127433a32so2300602b3a.1
 for <qemu-arm@nongnu.org>; Mon, 29 Sep 2025 16:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759187105; x=1759791905; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wuIbkj+ZyBCKGkCcEJQ8VZHPLPPgjfUw5c2woubcLGw=;
 b=dY3nAzhn1q738fPOBcYjg/NSPXUgovHEEOwH3hOPj6OJorbKSXnQzxegOLfCbuWxfB
 fEYSryh+2EWF+NXBpnpThKI6pbopcoTggR4emyqWehMqjKT7tJh1hOSaVnloWI/y7pqY
 DRloXli95h4MJC+U8h5W/IUiFdNLnSvCGqUAjxkpg+z6WpO0nXnz3NeQsbF/YS1QeL9w
 qXosjhAuVd/cIivaopmIRV/YlDXboUxGsvokPTHk5Pohi30sr7ZaLBep0Q8SZI4RkKeI
 PG0ibICZk76OI+Yo3ABOpOzoBJxDXgzNPP1js1nsnzXzzVXphj67PThL0uLTcQk9ob+Z
 CdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759187105; x=1759791905;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wuIbkj+ZyBCKGkCcEJQ8VZHPLPPgjfUw5c2woubcLGw=;
 b=ZNN/Jnij8ynsn/mK3ukshiZjX7waCPq1ZmSulCrQjoLHdM/Vz6ZEJqntHCGw5eeYN0
 ZzHVzCjhColrdfDiSPg/GSbkBlpE4W5l0qCpFSGjAi79d1DQlDrBBGROaZ0MU1FzqJGC
 I2AhALOUb0RYx3RXYkb5emVZLevY/LiyK7vO024cqT+MsjXQ/3X2fgAG4pgFOLaeNoOi
 4///N9L14E8ewsJx8mXgjkXFV3T3hmupDDDydL0bDa3SaEH/2Sj95m7oR0UR0IYlW9OU
 RmX+soAlCnzOQMNkZVSac3L1OX3vsNdQ+xqs6o3nzcuSt/TTYR7XDqN/VuD0z9KWteag
 Jl6A==
X-Gm-Message-State: AOJu0Ywk0Nd9RgQWOoahHg/wlY1kQwVIILTEBqXwoVQgxjFIm0brbyeZ
 ylqtDN0FgQL9ShLB0ECvFqNN/MiQZS7vHDqVwqtqvZo0heIts5CqYeEiTuIEryy2yDc=
X-Gm-Gg: ASbGncsVNSm4/50KL3fq03LVVHph6ti+LUv2vIbj1470G3zj5A66PBKi8dSYRvqyRKm
 EzkNYyYNFC99Niymf/qp90pO6664uaFodtdqYDot9hGM2miLXMTvl4zZ+mqge8axnevQWrmpc2n
 siHoORksoyAlHYY9BmpZ2M1Z+bmJG0D8vvl/hvozUlBavfwJUDE/RLj8noGBEYKVE/fBZ2eNo2i
 rOmcgrcRBV8DfJl8AhGUFDRiGdbPvW2+Xc2N6CefrohRjKNfhHlSr3BbsYgxDRL67km6D/uuHSD
 9lhbfSDfWPhrRkmityF8t7fYZEQE89c0bHj3CuBP+4+V2E9UKWQUrvbwKfhwY/Jx9St6tO3x7TF
 /d78qNCYpWq0nb5Xbfqg98xdtnEHRZy1kH6uH+CLRYY0rPB+fse2+1IA0V3I=
X-Google-Smtp-Source: AGHT+IGzuRaFymrc7g+Kt4xgX+N6NQNehPHlkm0WhyYDqrgCqPCh6fz7Zo2RZFTxjclodmZ0qWCiYA==
X-Received: by 2002:a05:6a00:2186:b0:77f:2899:d443 with SMTP id
 d2e1a72fcca58-780fce1d14fmr17385349b3a.10.1759187105561; 
 Mon, 29 Sep 2025 16:05:05 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78102b23736sm12216303b3a.51.2025.09.29.16.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 16:05:05 -0700 (PDT)
Message-ID: <84dd6956-1bf2-481e-9a0d-da2b45224900@linaro.org>
Date: Mon, 29 Sep 2025 16:05:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] target/arm: Implement APPSAA
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250926001134.295547-1-richard.henderson@linaro.org>
 <20250926001134.295547-10-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250926001134.295547-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42c.google.com
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

On 9/25/25 5:11 PM, Richard Henderson wrote:
> This bit allows all spaces to access memory above PPS.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


