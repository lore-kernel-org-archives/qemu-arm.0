Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E56606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=CtyDhZmb
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMo60-0006f1-Ef; Fri, 30 Oct 2026 11:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMo5T-0006bz-O6
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:00:13 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMo5R-0006o0-6f
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 11:00:11 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-8b0a921ee46so7513327b3.2
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 08:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793372408; x=1793977208; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/+tTrIgrtxN415DMh5KxKz8Us7I3BOTCk0RNfhPQ04g=;
 b=CtyDhZmb+Btq8ZSU+cp50QHTBvg087MQIYYgIjJY60P1zPcI98xJ3REF1KqZeYw8ZI
 m8CbY7ShR8Gc+xcaxz51jkkKKPcpSdUtqnmFZZDBLaEqAR0k2ThwN6io/J9SiMbGbDJ3
 ziyLXEyqUhxMRA8CGttuYcxVamUtNKtrVR3eB632V2d4EdayLkE2m5U1CPYNcAcOMAvJ
 LV5V61TTs48Qnk4qkixXTDXFko9Jd1agjhvSsee3V8A0zxxjki2ZX7WY30PCd+SqR8G/
 zBkBNDAMU8U6tsd7eGufavPUY1XGcnaidzowrnan83onXfZoftG152tpIoho2hivqpEz
 hJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793372408; x=1793977208;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=/+tTrIgrtxN415DMh5KxKz8Us7I3BOTCk0RNfhPQ04g=;
 b=niCQ4BWSHELeEFn5pxxQtUW5q+1WQ1yUD8OdCcA7J89vK35p738RpVKGO4gPsECBol
 CyEIFA8ZGgOAmLYVJn/v+wwCzvXgCZv3f0pehnbbL0Uu14TmFjZB5fjY22KEcHyKFdks
 ba3PAe1aUdZfxgVd90c8FzYx8a5DJuSgm9qZJC1VqHpJbwiv+GE2Q4ncOimky4nEuIX4
 xhonb8gBJvsUKHN7Z8/DrpsPRgbRSTi9zeYcx+OlmiaID79lgNuEIaP9sPsRcwZ5T92N
 D8Orh4cJScQMZiTBK9Idxmf8jOsaN70z07SWl2HNBNHPUFBR3bqmivbVrM1wr0pzmylc
 Ww5w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzy1gqmBN8SVXau4OsWS6BTFgJrHih+yC8+2U5oKO9UUXg0pThMLRbumkhf+ROoBnS2kvL49w1q9Q==@nongnu.org
X-Gm-Message-State: AFq9FYKEOHaKokxgfJ9NWQghw5xsdCZCz/6fLNweLrRnYV/UiAghr/dL
 eSvlnqzuY1D+eHF82UR72iemI9LuUoyqk2y+E8l1dRp7wRpWv+0ra/Ts7+4QP2S7m8nxWQmqaa2
 N6OCu
X-Gm-Gg: AYBFou0oL/y2ffOk88kUNbnRsp2inHwcVeXc/yK/6No+ttoRay7zoH49MAs5wLLn2t4
 WTlyZ36RoxXWmUjq5wZ1uh0bSWSDuCd2kZ7y+nmLeh6hMS6YhKD9YaI7LYSQ/5uwNTJh5/Y/oPb
 d3ksjvseiKR7Vz2JddmKqpk63geHmHAm5Nw2caqM84PNAFrkmsQY8OwCQOV95PWMDa8b/6yZHna
 OvbaHja0eu7PSk1Y1KAYnSqV3t8FEEOVL4SimcmFM3CWgplLQ+eF3Zx/M6WjSCoSzheRucLn9j4
 picl237+q4TCSP5UWeQ4kDKlGDe+N1Q1kmlIGnqJZ6a0XuLz8K15mrmf9LKph6B/xzkUTVkiKrf
 Bdqx2omMjm7c4BHH0s7oIarvJqVfeerLwbJ/V5SMikdNJeF1+qZZJbuTyOQVEh4kHFcRkJxTOYF
 W58lnrGp3lz8jEL+ZjJE2NaXZaiJ/8fqpRx49WhTIrllWRJ7oxw96J7F/duCCNtL2G/Es8L9Vwc
 uWO3XAzlc8zXdRZYdl60GwyzvwE4N9Nv1rOSbMw4wvNoHrICiDeX2QkCY0zzlHEjHucclxZKaH1
 dyz6aI1dzTC32V/wHL2K5mmG2bPYVU0R0a75kJsfggtnFJOPwEsECv0iNxRdviUHyQ==
X-Received: by 2002:a05:690c:fce:b0:8b0:e479:602b with SMTP id
 00721157ae682-8b2b66c77e2mr13008077b3.34.1793372407277; 
 Fri, 30 Oct 2026 08:00:07 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b2b7165abesm9666857b3.32.2026.10.30.08.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2026 08:00:06 -0700 (PDT)
Message-ID: <4336a459-d67a-4ab6-abe7-7ef709c86485@linaro.org>
Date: Fri, 30 Oct 2026 10:00:04 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Get HVC UNDEF cases for Secure mode right
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20261030092815.573973-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261030092815.573973-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x1136.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/26 04:28, Peter Maydell wrote:
> In the pre_hvc helper, we have a "bool secure = false" and a FIXME
> comment that we should use the actual Secure state. This is a
> signpost to the fact that we're not getting the UNDEF cases right.
> Specifically, we get most of them correct but are missing the ones
> related to Secure state:
> 
>   * For A64: HVC must UNDEF at EL1 if EL2 is not enabled in the
>     current Security state
> 
>   * For v8 A32/T32, HVC must UNDEF in Secure state, if EL2 is not
>     enabled in the current Security state
> 
>   * For v7, HVC must UNDEF in Secure state
> 
> The v7 requirement is identical to the v8 A32/T32 one, since
> there is no Secure EL2 in v7.
> 
> This fixes a bug where HVC should have UNDEFed but instead trapped
> when in Secure state with Secure EL2 disabled.  The bug is unlikely
> to affect real-world code, because only test code puts itself in a
> situation where HVC should UNDEF and then executes HVC and requires
> it to UNDEF.
> 
> This was noticed by Coverity, because the "if (secure && ...)"
> check was dead code.
> 
> CID: 1689834
> Cc:qemu-stable@nongnu.org
> Fixes: 35979d71c401 ("target-arm: A64: Emulate the HVC insn")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/op_helper.c | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

