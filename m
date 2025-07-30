Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC75C87FCB
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Jul 2025 21:19:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhED1-0000wP-7C; Wed, 30 Jul 2025 17:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE9Q-0001Qh-Gq
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:15:54 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhE9M-00086x-VW
 for qemu-arm@nongnu.org; Wed, 30 Jul 2025 17:15:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-76b8d289f73so227150b3a.1
 for <qemu-arm@nongnu.org>; Wed, 30 Jul 2025 14:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753910147; x=1754514947; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2cZUQEzD/FCbTSYQZTjRoOYVviR5yiQ+TIdbHRiU0yM=;
 b=tKPLCeZxsJ/pC+DssKKVDB8oixk5Pz0JG96nrW/wgGf+KFLvhcdsINXL/SPjvyLADr
 twf/uWx4SXbr1T6oMwFXp/QbTZptSIkU3NXLn3KcmXSyj6XOyL/V6cxs+GukHbbqmftD
 4BAYXIUivS//AsfMS3dWWCrXHaAvT8OqKiED46TmOgJP81W00H1DSQe0bUv79nsCIRU7
 9qCZ/vYV0Y/4F+8FvCIEWB50z5OI+VWFDV5Me02DdWlh8wtoKIqLjaew7gXVVY5ivB8I
 RpCKCs/RnbkdmsK/dZrXROnTI2FwBJHAy5T3DXBzwfMnHg1aQzSgqwhapk52FP6xM+Hw
 iq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753910147; x=1754514947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2cZUQEzD/FCbTSYQZTjRoOYVviR5yiQ+TIdbHRiU0yM=;
 b=GN2n1JWyGzPJWHQCckwfY0rV19l246jUO7W/ETU7UWYIoOHAoszDQPTLrKh9zKH5Ba
 ovwFEvMJjjgaobt5An/qLPVjrV3WR1U7+AJuDhP9Gz2+aaPjOGLRPrJXy8MUeDHvUJJ8
 yWfhH078+pI51iWRagKRWbHC65lGq38GFFFzmY+4UQhrtBtytc4megStQKYu0yVcuu88
 PgovaaC+8CL7oy10+hng6h7QoI+cEF5+ejpVrdPG7ERPavQ9fFR7yWRspJEcWk692ClA
 pAAxLX87DL71nDcsE4WUKDQswF/db3pePj9yx1AKx2bDHKBOz1EDcKbSd5vSGbmU5pN3
 +BCw==
X-Gm-Message-State: AOJu0Yx/EQoS3d9aTQFwQZdEOl7jw3kYxaHTvMAIsUjjShr5k8Wkum7T
 wDiqMzsLkS1Tu9WNI6KVv6IfaIIa53pm0NE8Gzy11BNm27mdFlXoMT3tba7yB64jxZc=
X-Gm-Gg: ASbGncsKRHQr8//w+463cxf4kmXmQ3bkRxrymC5SH+J3LLoNkEh+LHDJUf+BZi0Iadz
 laJ7OgM0oNRCmwJFlA0An2oKauZ9PJMi2rKKQx5Yb/XDVR0AEilGOVHObqRNmgBR3QxrzTqPVwN
 Mgft77t4d0y3MR7SMQjpyXYUV+ycITOuwESbsiR70R+pxvDsro/mm+hlNzRRq6ZSd0CKRohlN/6
 7EN4dqCrxEW7uqOV9gfFWnyL8285N9Cg9dNTguiC7VMSGweNDa+SfUWoAaei3x3Vkz/keOvIZBh
 XelXet9/CM1VGpARfgrQOIhq3PNcPygwffH9NGrzq3AVUKSWZPgk2o+Mv8kvuJf0ur1J2BWWsLc
 EWLFadw4966GjYAO324ryvR3H7trOjlIRodk=
X-Google-Smtp-Source: AGHT+IFHxJCKWBlXtmEKxVnnydv3o2K8ldHe20h31QT9Lbwn2WmJajA56JIH7fJdEeXS4Wzcmn6GnA==
X-Received: by 2002:a05:6a20:3ca7:b0:21f:5aa1:3102 with SMTP id
 adf61e73a8af0-23dc0f13ed1mr7869068637.37.1753910147208; 
 Wed, 30 Jul 2025 14:15:47 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6c8940sm9869747a12.59.2025.07.30.14.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 14:15:46 -0700 (PDT)
Message-ID: <aa25e3f4-931b-4cfe-b2a7-8e91c10c9860@linaro.org>
Date: Wed, 30 Jul 2025 14:15:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 32/82] target/arm: Convert regime_el from switch to table
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-33-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42d.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h       | 35 ----------------------------
>   target/arm/mmuidx-internal.h | 13 +++++++++++
>   target/arm/mmuidx.c          | 44 +++++++++++++++++++++---------------
>   3 files changed, 39 insertions(+), 53 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


