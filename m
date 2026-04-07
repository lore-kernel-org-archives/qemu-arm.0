Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6566FF5135
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Apr 2026 19:19:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wABXb-0000HT-QC; Tue, 07 Apr 2026 14:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wABUC-0002am-0H
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 14:49:16 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wA0Hw-0000Vx-Rm
 for qemu-arm@nongnu.org; Tue, 07 Apr 2026 02:51:54 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-3567e2b4159so2830237a91.0
 for <qemu-arm@nongnu.org>; Mon, 06 Apr 2026 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775544711; x=1776149511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v5IKxRMmwb+dPwhRvE/+sjVr5tsWbHFNjl7SdiH7BuI=;
 b=ILFmGlGhwZCSrqy+Yn+DCnI7ZkFx9F8o32pOVD+zzCeVHdTCs7nrQG58G7MMU8TdSn
 fUgkLWincj1XnoJX4ajtkP3sEJ2AK/SlM1GTKcD5Jj0QA744Gsg48av0YxuwCocFpncP
 5NAAPct15o8tyN8c0YMzGDF5/UUAMTSMPAuQxA9uGDkGNdg6YGv3hqWUx7QUVBHljc3J
 9IvivGsl0AN+SJndvBk0mQCUIHkPm/dmI6XlR3IC+b1CPkcQe2VOyXp8fvIwhQw5cW8y
 oPz+Eyp8mT5ljNGryFMEmcuIZII5a46AqiX1RY8NsM6dgu/nyWZUNMXUjBTM4Qri01A5
 Zjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775544711; x=1776149511;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v5IKxRMmwb+dPwhRvE/+sjVr5tsWbHFNjl7SdiH7BuI=;
 b=kaWIfPM2dvSFubMxXnHXEPL3YbHKxUiof1SBeNgiYmPUMNmjtLFF5HhDGkJSLuMXJb
 ridGOp3TPcDv1CRqMoaieJwvXY9wyCT0HpyVvBwzBCdkOpWGFrtagsRtzjG5iHRRTxiL
 6XfGBSxA2XZVKw9qLLVmdktQ+zvbsWYZPPaZwA1vvYFrwYMjLprhEUzGMrLjRJ0fGvoM
 +3Tvmdi/cNN5MJp+J8vLkNbJocXMR5kGOtgmoZ9KGGX9VRh3mSsjOXgTGPfvXpbBBNh3
 JcNo3HXxrWh7M1bfbkEetV0uS00oU4QjKAkzfrFBK+n1Czv0fo34Bmi0zfPoyRrO8j5m
 evUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkOpPC18A3ua7XAcXHol08vsZLqfOraM7sY6SNF9Nya0Xa1kEq8AyLdhjjWbM0WHm+pmzWamK+7Q==@nongnu.org
X-Gm-Message-State: AOJu0Yw6V6fkyB0jONU3PuGKGdelVCE2Vm+pBwokNBu4sx3Bj0J8OafR
 ZMS4K/n4bymDvnFSd0/Pd/TVOhhrIoD3Gqifkaz42Kfd561d6XaRy6yffmYdcLtQk5U=
X-Gm-Gg: AeBDies6mYI1C/7GkGicj0Cxx3zvsVxj9kfza8CFhM+cWt3Cn/9YBQtS91RsH+JMxkU
 lLTkFUgzxLPRtLl3IEXsSA9T7VGHnXnMMTkS2xdk9BcUq3m9NQ3kS5UyrhEiJqpVgIUof86LB7G
 0glm+TtE54wDjBWmh/9r4K4dzdsebSeKjsXGveqXhBZUKbRkN2fDG6Xf2/E2BIA3F34drC8CMb9
 GZmTIPJhRL66VOpXj2jlLo3iLEfMw59yWD4SE9qqc9tIIuKZUPasAz4qJJHEJnOmH7WPUDxVl0a
 hXhQoBjdZgkzErEcwpg3Z+PZG8ONh51aIsgZTrdHzGSFAy1RI3GwziJXI1YZxaoxUOM2ggnZwtT
 uPdNTS+W50UjB17lNaBNHm9Av6GD7W164u6IFlAwS3NjXF0wMhQ/MVceOErcHAj74/Wkiq8DX+H
 heSaq2cfMX8oouSz0sDNhYan5M2m0I/b5tKkcZ3LXgloC3bdXCgSgW++D/c9gdiUyBzMo=
X-Received: by 2002:a05:6a20:7289:b0:39c:cf9:b8e4 with SMTP id
 adf61e73a8af0-39f2f0c9443mr15547594637.42.1775544710851; 
 Mon, 06 Apr 2026 23:51:50 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c76c647792bsm15553215a12.6.2026.04.06.23.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:51:50 -0700 (PDT)
Message-ID: <ba89301b-de27-436f-9f46-50be2467e13b@linaro.org>
Date: Tue, 7 Apr 2026 16:51:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/20] target/arm/tcg/translate.c: replace
 translator_ldl_swap with translator_ldl_end
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, philmd@linaro.org, qemu-arm@nongnu.org
References: <20260406182609.193886-1-pierrick.bouvier@linaro.org>
 <20260406182609.193886-18-pierrick.bouvier@linaro.org>
 <c73bee03-82f8-4529-9db1-7857a049f59d@linaro.org>
 <626fdf02-7114-47ad-997a-a7c64a83f9de@linaro.org>
 <7b15c854-64f7-4996-a831-d03480a40776@linaro.org>
 <46f488c8-1eff-40c0-a72e-231c81576812@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <46f488c8-1eff-40c0-a72e-231c81576812@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 4/7/26 09:00, Pierrick Bouvier wrote:
> On 4/6/26 3:44 PM, Richard Henderson wrote:
>> Delete bswap_code.
...
> There is still one usage for bswap_code in linux-user/arm/cpu_loop.c which I'm not sure 
> what to do with.

Essentially,

     x = load_little_endian(...);
     if (arm_sctlr_b(env)) {
        x = bswap32(x);
     }

This is slightly more complicated because there's not currently a get_user macro to force 
an endianness, only __get_user_e.  So it's a question of whether to introduce get_user_e 
or open-code all of the goop in get_user_code_u32.

Actually, there's currently a FIXME in cpu_loop concerning the failure of get_user, so I'd 
say most of the get_user goop belongs there.  Then using __get_user_e is trivial.


r~

