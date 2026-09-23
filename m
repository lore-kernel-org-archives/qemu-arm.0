Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EA0C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 20:55:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Tzb-00019V-D7; Wed, 23 Sep 2026 16:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Tza-000198-Jm
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:55:02 -0400
Received: from mail-pz2-x15.google.com ([2607:f8b0:4864:3b::15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9TzY-0006zN-13
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 16:55:02 -0400
Received: by mail-pz2-x15.google.com with SMTP id
 41be03b00d2f7-cc4c3304784so774178a12.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 13:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790196898; x=1790801698; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=A2tONaDbtQL8PQbtIrLcxJSOEl2pUo5nWlMZcQy3bTs=;
 b=x8IjF2xnqBt6i7Ux2P0T1U73/rihdpIXMuyTGXe7RZJyH4NKLhFKo365qsc/Gix97Z
 V8zYELj/M7qxSCdLQJ+YQZgExUtxwDKFnN5n7muLOzn1Uo0I+jXu/4WClYN5jhnK63ag
 aNTJSasQ0vVYFlZWx+k5JbLrApoeqdrrgi5wGG/yUWXIhzfgKuZA4510AkcJfExnEos5
 dmSnk0a77ZmE22+rO0PE8r3GF0M74h5+CRS5iD6YeAfPtV3Nh4x9mjG3/BnsS3MUca3d
 SzoHSQyZ1V5MWNBJuY0I7DFHO66YZRqj8V7DDSM0iFKk0wuQ3vcTCqs+SjILhP5yJUWq
 ylhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790196898; x=1790801698;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=A2tONaDbtQL8PQbtIrLcxJSOEl2pUo5nWlMZcQy3bTs=;
 b=wZn3zwwYpmc1HjH/HfzXS2IAHaEqS4M0xYyUHYq4+aUfgVuFbjsXIAOo1isrrtIt7h
 tBYoQgfP+hJdLL5mzfXZMqCmDrZBmppwxs9L5B6ITbvTJdrafCSGHZG4hXZtwveO5mBU
 tL4TwM8BRndbzRU23N75VV9SETZpE1T6xc1oXYY63dUpuUWDMHcCa6U5Km9R4KDMTRv6
 3Ze0sDeAFJiSPL2aHDlaaW0LSJmoLYvgY4bThIRbR+goFcXLRi2zI/4TqlgXWgRpUKzN
 YS0AL9pVlNRv0Dm/5qgYD7yLzpoVtw/zThgJMjFaFhPB9U3YtcHr6p/C8amojN0eEwhI
 jskQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBywzoyVai1cl4FFH99p+QuIBCYchHtie3eNGp+xcPAlrNtWdgfW5F+yqMvxl9gj2MNiNg2CLnjhhA==@nongnu.org
X-Gm-Message-State: AFuF++lNd71yvNadAZwtPxV+cuVgkXxmrhjHmKlYnhDpuWOn9CD7Topi
 j0139fSIBx7OaZLi5t6BgSyFTc+qVUkU+AupGYGQMRaHaTiqVWykul+KYY3xz/qBAyjeqCR4qF6
 MWqX8
X-Gm-Gg: AYBFou0WkMQJh4+He6mnxamNrnH0d4fXQJ0toFcLEMhbT84OzFyA56KG2Mb6cp4MMD3
 saaD+A2qlxKTyIvDjbTN/ETHrFcPN2O7aPnVeND5oUsMq4j/7Ai9nQhLbT3qA7eeN3Q/W2J6V5b
 OKDHJZySLY1hFYqIRr+fjuhNkLIgM9TrXsHhfU66b2TVK4+PoS7RDtfzKBf/XBnf21PPIRH4TrK
 DWkMBhIYTQWL70bQdWI4RMmztcOSmXHQ6spQITLeXtIUIFp/pwVHcMlFrpm1kMavqGXM3HyeAZE
 g8qZEllXC8F1e0DagTiFLcPeh5PKY/k/hVtwfXcC9PKHCBBsYpcVgKG26TYzN38n7ybiLf2izvv
 Q21dSDpLBMSg+RZ8lNubZlBpiVsv2qe05UhEUvPUvJdgXEwgGx93WNOaVld4dGzpUfuc4QM8Fg0
 4Qlh+i/NaRi85YHlUBIQulZAG3t7cXeMrYiPVXupAAWVBQxfnpt0UzmHLjn9u0911jw3EwqWpx1
 UFdTBv0j4WkaigGEL+IIJoyCWmJa5G0M17cDjTlszWX7pM442U=
X-Received: by 2002:a05:6a20:394c:b0:3dd:85a8:4c57 with SMTP id
 adf61e73a8af0-3de0e73a234mr308434637.30.1790196898443; 
 Wed, 23 Sep 2026 13:54:58 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc75f3ba829sm1630494a12.11.2026.09.23.13.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 13:54:58 -0700 (PDT)
Message-ID: <5807b5b6-2860-4675-9f0b-5790f3bfd37b@linaro.org>
Date: Wed, 23 Sep 2026 13:54:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] target/arm: Don't set ARM_FEATURE_VAPA for v7 PMSA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Tao Ding <dingtao0430@163.com>
References: <20260907130223.3148989-1-peter.maydell@linaro.org>
 <20260907130223.3148989-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260907130223.3148989-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::15;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x15.google.com
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

On 9/7/26 06:02, Peter Maydell wrote:
> The features VAPA (which gets you the ATS instructions and the PAR
> register) and LPAE (which gets you a 64-bit PAR and the long-format
> page table descriptors).  were originally defined in v7 as being
> A-profile only.  For v8, the ATS insns and PAR are added to
> R-profile; although there are no page table descriptors to be long or
> short, the v8R PAR format is always long-descriptor style, so it
> makes more sense to set ARM_FEATURE_LPAE than not (and matches how we
> already return true from regime_using_lpae_format() for v8R PMSA).
> 
> Our "feature X implies feature Y" code was only taking account of
> A-profile; adjust it so that for PMSA:
>   * V8 implies V7VE, LPAE, V7, and VAPA (no change from currently)
>   * V7 does not imply VAPA (new)
> 
> (v8R wants V7VE because this implies things like the existence of
> ERET and the PMOVSSET insns.)
> 
> This will stop us incorrectly exposing the PAR and ATS insns for v7R
> CPUs (and it will be a migration break on those CPUs, which is fine
> as none of them are usable with versioned machine types).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

