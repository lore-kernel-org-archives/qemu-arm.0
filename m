Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCB3FDEE4D
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 22:30:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG2Yi-0007q3-Cz; Thu, 23 Apr 2026 18:30:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG2Yg-0007nr-GS
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 18:30:06 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG2Ye-0002lv-BV
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 18:30:05 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2b24fede2acso47598525ad.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 15:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776983402; x=1777588202; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a9yf2bdZlrlEqK426BBr4P79p8ux3CYHJhDpa7YxTZA=;
 b=hNaP5KqY0wK/XT1OdSR3f0heZqHt3uaqBSe1gUEOArYggL06gCW+obRihX57ZCEePf
 fhWksnX2HLGSumwwEXjM5HPih+YvM7MSvzVQV0QRdeyx0ltCAUDZ5prxLFIen2lqEWwx
 3r1oQlQMtZIuTVeYtyqFct7ImmROD2Rw5NDWZcQjvyw0CYWVKXFNPQMIXAmiB1pa5ysS
 eOk7/tczri6aWCbAa6UCf4icjVnvK31hvwelXYWoV2+I9bZysDQZTHhAiQMHAnqgFg0D
 O4dW2CmdKwmPu3oRs+gDWWwsp1ZsxYy7KulylDhPlUS23fy5i2v9j04mFMIUWvtCY5Pq
 1h+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776983402; x=1777588202;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a9yf2bdZlrlEqK426BBr4P79p8ux3CYHJhDpa7YxTZA=;
 b=G0TPf2FKZ7GYzVmN6GueTSYzNKMHjkBkfY0vWgToMVQjujv7X0BCwKsFUw7VbMgxDA
 kjLN/Owb9tzLav+a7WbDksC7BUX1t8/xGwUlwr7Q/PVQ2DeRZIbS1JCz2liB4menWMlQ
 2bFQoFvfGu+SfRSKNGOPnqvPPlrzbluvmo6AwbIxxXqGMIgdXOqzx3ySrYJces0MuTEN
 qudFpZD9h2I53Ng/FWPFlY6zGLJyzTASLFeTEZfEmPRH54yu4JGecrx2GPQs3tkpXdaD
 z6HDpFVr50Hk9D2CmPlWwEf6G4/XD/ZAXFpcHXGPQcbXfmWXxW5bw44xJOQYGSQHpZOg
 D++w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/ZerPNiBAjb0oyM9dZ2mIhISvrfDR4EfvdDfV+ktKokD2/wPT1ueeayJePr0ms7tCwZTOX82ugVQ==@nongnu.org
X-Gm-Message-State: AOJu0YyeDXtfSNg1D2x8vTkSItEYdRCBvXO6gHI25sxmQvEzp5r5Lxt4
 lmTJZlEKW0m+Ur13nsKNaCWogMSdN+Haoo/1XYrWZJJBoWK8l0sRtAWxffpaW5p49HY=
X-Gm-Gg: AeBDietOsyB9R/DL0erfuveOsNlLfDbE8jTI+TYTnVYl6+FjpBwtV2kEiqPcfWtP2Iw
 r3hZn0LU6uCmlmuOt9lG82nPRpd2f6dDbDd4BtF2Qv3nOGcWFPuiEDoGvBO5j8p1YhEG+P6m7iS
 GE15iXhkchx815YLI6yAu1kPRQNlZgp6aQpHRLdReIy/GAQnvgKSF72NUfiPxjB8p7NTtp+Lc6c
 tVWlnUAOXXWzvtSQiz2Tl2ZhkDEtg9ilrTGz3qXXNdUEC7WMDOXPtKQWCAd73D7KAlZ+uilnUBG
 +y91rcQa/+jtUkOF/ia+w8VAictiEXPrDJR6oS/U8cyRaB3Hf5OIaxR3AnfoWYNQNfqKGstDkJV
 k0Wge03nb7e/4COD0/epskUiZ8sK8homsR1dnLucYEUUzEfk/XW3YCsNGk3R+lIleBTzt4iBmzp
 LBUoBPQOjWF6kmbJZjSQftcHCpdoUIT6NMkolgStmdjzdZxGK1GA==
X-Received: by 2002:a17:903:2ac4:b0:2b0:41bf:ca83 with SMTP id
 d9443c01a7336-2b5f9f3c616mr298137805ad.23.1776983402197; 
 Thu, 23 Apr 2026 15:30:02 -0700 (PDT)
Received: from [192.168.1.134] ([110.239.0.232])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa3073asm195590255ad.27.2026.04.23.15.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2026 15:30:01 -0700 (PDT)
Message-ID: <be4bb8ad-9cc8-4c8f-b228-70344c1a1435@linaro.org>
Date: Fri, 24 Apr 2026 08:29:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/16] hw/core/cpu: Expose CPUState::start_powered_off
 docstring
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Mads Ynddal
 <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
References: <20260423170229.64655-1-philmd@linaro.org>
 <20260423170229.64655-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260423170229.64655-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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

On 4/24/26 03:02, Philippe Mathieu-Daudé wrote:
> The comment about @start_powered_off is buried within the
> CPUState structure. Hoist it to the structure docstring
> comment.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/core/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 04e1f970caf..bc719d51b3a 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -419,6 +419,7 @@ struct qemu_work_item;
>    *   QOM parent.
>    *   Under TCG this value is propagated to @tcg_cflags.
>    *   See TranslationBlock::TCG CF_CLUSTER_MASK.
> + * @start_powered_off: Indicates whether the CPU starts in powered-off state.
>    * @tcg_cflags: Pre-computed cflags for this cpu.
>    * @nr_threads: Number of threads within this CPU core.
>    * @thread: Host thread details, only live once @created is #true
> @@ -502,7 +503,6 @@ struct CPUState {
>       bool stop;
>       bool stopped;
>   
> -    /* Should CPU start in powered-off state? */
>       bool start_powered_off;
>   
>       bool unplug;

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

