Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C1EC54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 14:37:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woiuk-0007Kc-PT; Tue, 28 Jul 2026 10:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woiui-0007FT-Ae
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:36:12 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1woiuf-0000Mh-NY
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 10:36:12 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cab973140bso52707415ad.3
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785249368; x=1785854168; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/TvV2ZYJxZd8YpGuQK1TH+25tGjcP9zyMSOMw0LuEO0=;
 b=YyburfbskDaAsrpsXX5Tle5PvxcU0vddbsnFnn+Ih8eUiEmW43ydBP+LJ0b15z05XJ
 MiHih8k0kCFNN4YJxZVBgDb4q9zA5q3qYEO5XfZB+h/R6ZiYpwjx4l9uZYJEuPMZ7o2M
 bTF0xsRL3P7xnsIN7FD0ADJ0czLgeDo2aGfN9HBHD1tkqiYYcfLe4TAvP8gITJu+CoMD
 32VpuzB1FC4QYJXTGHnoyE8br4E1rp6CzTEbbWpGIpaL6adZ60qxNxGbbDryo2Ntb6e3
 +iz/2MKn9jtTDUMYHK/1vfQDYL4IhpOIoVUuiC6Qc8rx4krcNaZoi6u2h/6ra6SY2MQO
 dNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785249368; x=1785854168;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/TvV2ZYJxZd8YpGuQK1TH+25tGjcP9zyMSOMw0LuEO0=;
 b=JbM7ElWyGd1mYzwUYFSwdAG27M5yhyqMURvA3TY/OXgrHz6swWXoMeo0ep1nqlxYwI
 RQ8QchOUxQT6tA68IDZokZNWcRUQh5XhoqiG+JtHp1kdCXgMZJD/JPDLlUPD6PiUNxJu
 ApjyGuk83pE4OYh5gKy59rsYo1pJa5YU1yh7UJfmANveUQab4VixBMxOO8s2PeQz1qiK
 8u9gUKTSwXKuQjmlfrtJoNU4NXU3HWdPjC4Eh/zlbzRHejEghgRyIcVKJ09IRfrW1ovk
 G/YQXf8vDFOd0SOtvk6rLTT4CuMpean2lj1ZDOlwS/DoiRAk5FPl5JvnjfneSkCzBVFw
 NbQA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqTvj2M/a6cQ/PBS7NXvvS3cJFybVSn4p1iGt4bfgovYcgGKhd8/Y3+NgFOLLi0OQ2pkGPq1hdMtA==@nongnu.org
X-Gm-Message-State: AOJu0Ywcm1LX/mtDVByaUbhEMRc5LDmyNNKQLKReod9cKU+tNeBltDBV
 X3vSukZ6FddZ0htMfvWGhafMKUTUqdtgv5MAh90oBcvDYfcFkIMOcJ8YysO2Cd+Us70=
X-Gm-Gg: AR+sD12JWWS3nY9F75uSIlaS9LEjx4jgt/EVhvPI78C6ACNjtbLFTav+/AKwKf4sM0s
 a0uvVGFxYIbFnPvOFHZPZOdmHip/KfRceBJosTt5DEwWd7VhGPgdkyJxVdv0fF9O2XceqjaHj2/
 Rduia7bHReJDQDzO43BbF+wEq/Oc9fQN5xO1bfiamleSf9/1clpLJt/hWK7p9ZgROzo+PWKTP6s
 qS2lz6vyS5T+DmFNzN2fKzEf97rmyj221IIPek8ImSCU52QyvTB90pjDYsKiYy4Co7QYUv9vRFX
 MLz8WPC0J30hyFo1LD/uVuUCvBjL31b8XyqUNu5O8lV//kU1W23cFdplNumkeP5rR8vle3/NBn5
 TvL/Z+AEIGfnmvmvYZ3nOXF4P0BOn48ixZgpuPw0i75VBFpWHCoKIRzVBsPum8r5YZhgPUTI086
 GCOOfj9U8NOgjF4UWU/91bt7l2uTHVz7EUitPqUDs+JjxP7pML1VDt
X-Received: by 2002:a17:902:fda5:b0:2ce:faa6:7cbb with SMTP id
 d9443c01a7336-2d015c9241amr35316355ad.4.1785249367711; 
 Tue, 28 Jul 2026 07:36:07 -0700 (PDT)
Received: from [192.168.0.4] (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cfde7fdfb0sm53540005ad.74.2026.07.28.07.36.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:36:07 -0700 (PDT)
Message-ID: <5a4bf3ac-0720-4afa-87a5-1410782ff7dd@linaro.org>
Date: Tue, 28 Jul 2026 07:36:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.1 2/3] target/arm: Make YIELD, WFI and WFE be NOPs
 on pre-v6K
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260728111629.1705308-1-peter.maydell@linaro.org>
 <20260728111629.1705308-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260728111629.1705308-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 7/28/26 04:16, Peter Maydell wrote:
> The YIELD, WFI and WFE instructions are in the NOP hint space, and
> were only defined to actual non-NOP instructions starting in the v6K
> architecture; they are also present for all M-profile architecture
> versions.
> 
> We never did check the architecture version before making these
> instructions have their special behaviour.  Mostly this has not been
> a problem because a guest won't execute one of these insns unless it
> is prepared for it to have its usual effect, and because we
> implemented SEV and WFE as NOPs anyway.
> 
> Now we have implemented SEV and WFE to be more than just NOPs, it's
> important that we have the same condition on the SEV as the WFE, so
> that we either NOP both or else implement both.  A guest probably
> won't try to use SEV/WFE on CPUs that don't implement them, but it is
> valid for it to do that and rely on them both being NOPs (and so a
> WFE-loop falls back to a pure busy-wait loop).
> 
> Add the "only if M profile or v6K or better" check to YIELD, WFE and
> WFI.  This means that all the insns in the NOP-hint space for A32,
> T32 and T16 have a correct feature check.
> 
> Fixes: 60e7ee5bb7cd ("target/arm: implements SEV/SEVL for all modes")
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate.c | 35 ++++++++++++++++++++++++++---------
>   1 file changed, 26 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

