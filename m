Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D5AE7DF11
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 17:58:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmyBV-0007r4-Eo; Mon, 02 Feb 2026 12:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vmyBS-0007qP-3R
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 12:57:58 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vmyBP-0008KL-NB
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 12:57:56 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2a0d52768ccso32022475ad.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 09:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770055074; x=1770659874; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JAuTrxn4gQGmEPvqo+iM+qmIJ0RYyWcQiCHd6otGo3U=;
 b=Torc3i1ncbxpY/YY1O6VqE9MYZWcFE7SzNUhjHQxDKp76TgP9fb/yd/iHgbwgorkUp
 lGqlm5kE2jBVJrboqVfEYHwEXs4dPxANxJl3y3mfhyIU7X6JVT1o9YFyrpcJjNttWmzT
 9sFb9OcETZxMOb+3yDLiu6zf7nDLHLZVHEjrsyc6rwQuuMe46e34efjr8AmfYKLe0v47
 S1i76uSXYsHSd0A3MLH1YmH+cjM7rvU9L52gsVgF+qCJ/HoFvBzQOBCD4JAZN9NSaIHQ
 1Nwx7cYvse8bO9hk42RWd4f0BXLK5qkBcrH1qXxVAiVqV/yCfOkdo7TM9nKSJbMA1eSc
 HGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770055074; x=1770659874;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JAuTrxn4gQGmEPvqo+iM+qmIJ0RYyWcQiCHd6otGo3U=;
 b=l2cE8kebCitIlWIgPukRcM8x1xEpf17i7avSz5J5Kd7e6MwM6L06ArOod5vVC0nMRm
 ymjQsQlJ7SkT8bVfoEYZMErX6p7P1Cvd+ogyc2C9xCK/afpxIj40oNxq3Ig23pkvvva0
 kc0TDBN42eRyAyQt2Gy4TBrv/1tmzuJS2MpydJKRpj7pHkbaKf/xDN3+nZCFsI1YWMUM
 hVBaz2HANczjT6R8yOgGaBBZLe4e+GCw3TqbEfuSyncMxwQeZvdDrW0rjXniOtpm30Pm
 Sf1mHuj6n9ZbgZwejtOFXAk+Cd94eZWLLG705g3NYUDw22M+jyuj+oMcTYD2oZiDCy0Z
 e0zg==
X-Gm-Message-State: AOJu0YyFkgU9HdhL0NcDWTEjZpQjlH+bhDAu4LduIJ9eDFDiYPVquiC+
 U7EkGLXfU1pfRWrS4TrLCL8tX/hY5aH1xDV5AuuHoN1vseflyxRfDVFNpMK81wgwP8mtdrmCfsA
 vkqV4
X-Gm-Gg: AZuq6aIJOKKfZKujnIrIViWIUM0Jdo1js2TC2EDydUfm/b8xhU4SfHFT/rN8oMWOnLc
 zq5AcmVjQr3w7oTLodA3VG16rqkAK2Z9stG7afxI35Lopf3BFn7kAODH4nHAjdE+MlX32Wx6fNQ
 eXUr8MeYZ3G6FFf1XKxzSFH8aqapzpXnO+TXoVtb3SyrEuG+5a2Uh1ug4LsgC2T5iuYK/V+jw7i
 7OcJqEQNz1ZYJGmLlV4ccOMvkKJgMPQWgEfBw832dibt2d2Da/812I5EXk4HPT6WEoCdgHNd6t2
 yNZt38+JscMwJs9YVC8LuJvzYKGyiU4NEarU22CxmYA4Ut17V5Luh3MWwnXnwI49dq93pzsXyx6
 YOide7i0c6Kn4/UN4SxTEwJ7oBQOYN9pXw0JVCuXVHkcJGb9FEw8osves5t7M9h1++tm50aEMJF
 YklK0cmxR/LJoMw0pqoh2AszN4OLuxbu7Eg3xCyz6P3HAs4uu2YYymqkVB
X-Received: by 2002:a17:903:46c6:b0:2a9:4c2:e53 with SMTP id
 d9443c01a7336-2a904c242c9mr60520465ad.48.1770055074180; 
 Mon, 02 Feb 2026 09:57:54 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b6e5fb0sm159459165ad.91.2026.02.02.09.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 09:57:53 -0800 (PST)
Message-ID: <681e7b2c-73c1-4861-88dc-23dcecec9c99@linaro.org>
Date: Mon, 2 Feb 2026 09:57:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] target/arm: Remove dead code
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 devel@lists.libvirt.org, Richard Henderson <richard.henderson@linaro.org>
References: <20260202153618.78675-1-philmd@linaro.org>
 <20260202153618.78675-2-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260202153618.78675-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x629.google.com
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

On 2/2/26 7:36 AM, Philippe Mathieu-Daudé wrote:
> Since commit a0032cc5427 ("target/arm: Make 'any' CPU just
> an alias for 'max'") the 'any' entry is never used (we use
> 'max' instead): remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/cpu32.c | 3 ---
>   1 file changed, 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

