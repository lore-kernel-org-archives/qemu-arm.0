Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5494C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:18:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhEBc-0006A0-PM; Wed, 30 Jul 2025 17:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE3z-000493-2K
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:10:15 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE3w-0006Z5-S0
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:10:14 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-23fc5aedaf0so2708585ad.2
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753909810; x=1754514610; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UGppI92iHV8vjys/mQ6Zs0MlEcFqJGFo85JuuOCHjL0=;
 b=sMx67uuRLP0sdmHSFldvAoIyK4epax/t2TpfACIBGM9cvbJd5fl4DmIGPXiTiEUC94
 RDE1H8WDEHWzcF5Hm8aBxA1JID5YeH7eK4fbMd+qDFIV2LzK3d/U1cEk44QszGDc66Tc
 dpWQmuGToCkja+ySMZMi5jHSPks8axj/LLj1/GyTt9fsAVOk9NyPGJtrPBjoGu5cIkjk
 ictNmy23vSrnpipYzB+Gys5aupxS5gZPRot88OSil6zwLOKzsPvtPxdlYsfqURA6wLRS
 rMWQV21o+HZNAyaALskxpLRjcLQuyAuxjE6XqnIZdHvHMqWfBXUznR5++J6XJAUACv/4
 qTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753909810; x=1754514610;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGppI92iHV8vjys/mQ6Zs0MlEcFqJGFo85JuuOCHjL0=;
 b=lPb+D8Jy9lWa/kl749UrxQRde4oHWU+XDfpX595jcqCPqKXIVWUXLDV1hX+f6NHkcy
 NhzxnTwJaEKfWxV91q2ROfU/zZdK9ulJJC+c04DDtGiHctFYOLxak/78iEYvomPwYkNe
 nfLhOWSFP1TSNIpMn4AUdo77WboX/xLK9MHv7/FNviSs9XPHk9gnpsyexi1rOARAmh2u
 Qf3rzThLeublaYMPWDuzyRPl5D4BC34lN3ZIvfUNRM4I5I9Hg8TWd1APJC5n8bki617q
 SLKC3o3HUGuLExEvk2XXZfiSU42JMMjG340RxyOJdLXxZfdro/upkec78YMszPaIElzL
 7ccw==
X-Gm-Message-State: AOJu0YwzGoO4l6RUt9VrCj/ApFq8wGlvvWEG3/cQc9PnKs3Vk/njqBKW
 SqiDSGJETDtpF5DAJEVwqwLSE6ZKZbXztb4EuDTyrRR/v7PBot6aGEJiftrAxqoizuQ=
X-Gm-Gg: ASbGncvrkR/Z/Gy7EBimkL84+SNlvXPtgGimiuWENPeGWgIi+hZXmAR3+EEjFwrBaDq
 QPcFUFuWeHEv28e79wJvBf0w7ddGiR779Zu779g9+Vzp/65h3O0KShdwiZbiwMacROsM5EDoINH
 YOek8/4uNv2oBFPs3Bazh872dUqz/7vX9Jod1H8LjmFPc8JzjbRTQL+JW7kHk/RuWFO7Ux8l6/W
 9e3vr3YxgP1e1DgWls8pw7l83emKkoj/IIcxTrrP3qvhs0OocAWA0fKI8/gB1VCGNCuU25x/xwD
 zq0+2kOWlJOw9yUTWDg6bdcd6WbVTlnliWJYxMGX9IB7A5kRJI8qQFoBREPSCtrGdM06vINy0pt
 h8avfvE6p2W2R3PSUsvjauLfDvG7JVpPuTfc=
X-Google-Smtp-Source: AGHT+IHq+oZLzGG/nNvzINB/nFM4w7y3skDNpUoPg81fOq+MRB/e4qcsVyOBp25byx49SEITrLH/RA==
X-Received: by 2002:a17:903:1b43:b0:23f:8d03:c4ac with SMTP id
 d9443c01a7336-24096a68567mr59562265ad.2.1753909810428; 
 Wed, 30 Jul 2025 14:10:10 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef67a3sm502015ad.15.2025.07.30.14.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:10:10 -0700 (PDT)
Message-ID: <6963c11f-ed15-42f5-9110-9516ceb64662@linaro.org>
Date: Wed, 30 Jul 2025 14:10:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/82] target/arm: Convert arm_mmu_idx_to_el from switch
 to table
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-31-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x636.google.com
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

On 7/27/25 1:02 AM, Richard Henderson wrote:
> In an effort to keep all ARMMMUIdx data in one place, begin construction
> of an info table describing all of the properties of the mmu_idx.  Begin
> with the access EL.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       |  3 +--
>   target/arm/mmuidx-internal.h | 27 ++++++++++++++++++++++++
>   target/arm/helper.c          | 27 ------------------------
>   target/arm/mmuidx.c          | 41 ++++++++++++++++++++++++++++++++++++
>   target/arm/meson.build       |  7 +++++-
>   5 files changed, 75 insertions(+), 30 deletions(-)
>   create mode 100644 target/arm/mmuidx-internal.h
>   create mode 100644 target/arm/mmuidx.c

What's the benefit to explicitely size arm_mmuidx_table on declaration 
and definition?

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


