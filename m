Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03743D29C40
	for <qemu-arm@archiver.kernel.org>; Mon, 19 Jan 2026 16:39:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vhsGw-0001WA-Ts; Mon, 19 Jan 2026 11:38:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhsGs-0001Ok-AK
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 11:38:30 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vhsGp-0001Qs-LK
 for qemu-arm@nongnu.org; Mon, 19 Jan 2026 11:38:30 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-42fbad1fa90so3991683f8f.0
 for <qemu-arm@nongnu.org>; Mon, 19 Jan 2026 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768840696; x=1769445496; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/+Z9W6G1uqmydLeDZ4FsFYyx8YzXTBv6gNOdO21JL1U=;
 b=naNCwKDt4/FI/95Xis9+mlRy+LQ9gfTU2D/evdV+D2MkW2lUWcTWFneHdenaRrL8Or
 txba+BRwyeXca/LDDJ2+JL8Wt8IqQDtwwEK3YX6liOEmnzaOFrs6AIOdps0dpqzA/vQk
 EncNsl1KYXmG03WvQSdMoFWhjfA1JH+RMnWdfeaRIKxSFpnjtQcGrmc2/D7y1YBkgs8k
 jDf1DdWvseEBh+tZQ2e2JnQr/nlhvgIyqnG27PFW893MlOV+Lt0F5WQnFgSyADeEmPj7
 P55KxYmx/6wA5kT6WQ/GUjuBS2OArlO5mpzQwRxPFUYX45aKzpJ5dfs3iG3JD/zUF+8l
 2B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768840696; x=1769445496;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/+Z9W6G1uqmydLeDZ4FsFYyx8YzXTBv6gNOdO21JL1U=;
 b=vF8RqF6AD+1BIJTrK5h0l72efKjbOfXFhjKYV+xP2+tAa+dYTYJVD4oG9orLQ+fGEm
 ydcpvI2ynRJ7zcfi9ggu/Qw9e320X9W+wvXXFBuSuTB9+kJn/MS6u3CqzvxXqKK+npm8
 ur99fVAmo4Zf5tzFDkQCgBcs0/48YptxVmAPzrfCbxNQhVhQ8qisgbeupPvOaKANhKJ1
 BQmf0HXgR7oQJh1zH6TBXvn5FN/HEs36T+kEGXyE+xP9chRmSYj7QyDk67wUX5XVA7Rt
 LR/IqJsQ3jYd2Y/tVbfna1ibrhJbtFGaryHMn5yeYyi2vLarTltCfUIOkTBVtfLFGTQn
 /ByA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV7Pa3r07LJCZq3q5gcgpgF8WlxM1nN8XC8dPyfa/poteTbQcfnJCbV2F5Z4mOFNnpi9/TDYaQkA==@nongnu.org
X-Gm-Message-State: AOJu0YwWRMRM8ic5soA0HIGbRl5M8spw1bAHVt0TrA+sCBLmN2eHHImo
 dHDL38aj9kExUYYZKEJvBT/Lp+tlGKEp2q4/bHZonFSek3txn7xR1Wn0CgdBwLdSctY=
X-Gm-Gg: AZuq6aKn1kdVNPvhG49g5QW7e6fZxA6jvvgsIH56iG65xkNSr7NQ7QgKF0SOogNyRkW
 40dtrn2A/1vYp8OknQtUSSCQA6Cv2ghr01iW3hQHFexdO8BOgKqtJIHIPdQhr2Qpf/vlO969L6M
 a7hT0TsEXu/pZdoONLW9MAJZCeyCUSugGd9EqKeinL/46crxaGKn60nBbKw8SJONaMkLIcLU/y6
 GkN4DE/FTbbpQ52rBl5yMQl+6/hlNL1BcKtiTtMapoQJ4hbQJsSIQ1h6vbWBQ/h9zq1scaltiEz
 WmlPQE2wP5WfFRu3T9GgMF6rMn0/DBHiK530WEFrN9oVcPacQV0ae2SaeMoQU+/jsJDVwTHApYi
 0czU9LALB67FFhvY8PgHcmjoACzjG6j1TnQNP0DzS1WplelhhpCSaBoYjpNvEIe/JlX6d+yxD6N
 VLHh9UkNqDpmi5ljsN1W0lxc8lppnU5xahvqF9UKAOfJfGH9Sr/x8MrQ==
X-Received: by 2002:a05:6000:2dc9:b0:432:8504:f67a with SMTP id
 ffacd0b85a97d-43569998f9cmr15315383f8f.20.1768840696434; 
 Mon, 19 Jan 2026 08:38:16 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356992201csm24647657f8f.2.2026.01.19.08.38.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 08:38:15 -0800 (PST)
Message-ID: <fa73ef10-4a1e-486d-9d80-550c91eef11f@linaro.org>
Date: Mon, 19 Jan 2026 17:38:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v9 2/8] hw/arm/smmuv3-common: Define STE/CD fields via
 registerfields
Content-Language: en-US
To: Tao Tang <tangtao1634@phytium.com.cn>, Paolo Bonzini
 <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Chen Baozi <chenbaozi@phytium.com.cn>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mostafa Saleh <smostafa@google.com>,
 CLEMENT MATHIEU--DRIF <clement.mathieu--drif@eviden.com>
References: <20260119161112.3841386-1-tangtao1634@phytium.com.cn>
 <20260119161112.3841386-3-tangtao1634@phytium.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260119161112.3841386-3-tangtao1634@phytium.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

On 19/1/26 17:11, Tao Tang wrote:
> Switch STE/CD bitfield definitions and accessors to the
> 'registerfields.h' REG/FIELD API.
> 
> FOLLOW-UP: Fix CTXPTR_HI/S2TTB_HI/TTB0_HI/TTB1_HI high bits width
> (should be 24 bits, not 16).

Right, but ...

> Signed-off-by: Tao Tang <tangtao1634@phytium.com.cn>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/arm/smmuv3-common.h | 169 +++++++++++++++++++++++----------
>   1 file changed, 120 insertions(+), 49 deletions(-)


> -#define STE_VALID(x)   extract32((x)->word[0], 0, 1)
> +REG32(STE_0, 0)
> +    FIELD(STE_0, VALID, 0, 1)
> +    FIELD(STE_0, CONFIG, 1, 3)
> +    FIELD(STE_0, S1FMT, 4, 2)
> +    FIELD(STE_0, CTXPTR_LO, 6, 26)
> +REG32(STE_1, 4)
> +    FIELD(STE_1, CTXPTR_HI, 0, 16)

... not followed up?

