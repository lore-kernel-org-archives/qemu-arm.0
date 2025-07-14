Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F593C83F1A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 12:55:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubIgs-000193-24; Mon, 14 Jul 2025 08:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubI0m-0005Hd-E6
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 08:10:30 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ubI0j-00053L-GS
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 08:10:24 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so3106165f8f.0
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 05:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752495018; x=1753099818; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oE2uMXUiiFM8FhKSo+jh6RjiKCSwwiGNwTTlcD7T1I0=;
 b=DucnWweWIqfGvHOlub7fHivITgeHxTIL+sm16OAtV2epb8m2IBfcgWLXy8zfYAwP8U
 hFzxbrfX9BRAxpKnHz8uxtZqNRbLbsXdV8+IzlDySaq7lwI+z1pqLcClxPb2w+P6m3gy
 4roYUH56A3b86obRqQ+wVTdNmspaNPoiuW/PhSAoobuse7q2OCn1W1g4lg1XNYCFi+fh
 57esyGCCNw7bQqWAZlozhYGJsRU0h1J/7+LMo0hQaOvY5xm//W5YAhRNjmNb+zdL/kM2
 NrjcKjfSwkqXhxRUtn8rgm3dGo7bxNiBAvMeVL/skgGSDal34IMTBvXf3G8SeizUeyvh
 aTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752495018; x=1753099818;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oE2uMXUiiFM8FhKSo+jh6RjiKCSwwiGNwTTlcD7T1I0=;
 b=e1aPENP419q7gEU+96kNUeSHF6sQcApEP9gLLiE3pHoq12YaDWq1K9lWWpKzgMVSDq
 fek+U/dN9yeM984hmdd+RX1S1Dy/J2Kmxyc3llK0qEi6cMcMIWiUJVPAZ3by+xkx/8LU
 kjLndzsBT8z6ATXNlzY7WHimcrt7QMWOfnI5SUB5PNitBTA5ZToYvNF3UxqzW7Znydj0
 I4XpgTlFqB3H85uh07BH4yoymMHhpK1PzVHCcxSdB7vE0PpPIsmEFpYxtuWowxIUP8b8
 T1K8mkXdLxKTTpcYz2kByBblGT903Cb3i+5LggAOhySacheFaJ+lTwF2ziigT80KfWcd
 33vA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMreZJhHiLKDdU1T7a+vdGiERnhxqjK+iDAH5O4E/BawCJKeo7t6yEWavmyRQLQ/pY8CQuTPYDLQ==@nongnu.org
X-Gm-Message-State: AOJu0YxgpMLcy/4J8EJoKO3XO8+Op1Zi3Am0zgglP4xD4BW+jGG5b9dk
 LegH91JiXxlW3VBOup8Q3P6PSCYcROHWxM/UUWvv53tPb/mFL1QZhutixDjASUej6Ww=
X-Gm-Gg: ASbGnctGgAFUkp0rHEmijWS0NUUwhsKaIzznverIfa6tSlAwL5FV458CpsfJv3oVF6F
 nLysyhah++2UfUF6UP9mgjRKHpAYpuMdmvg2bJrUxYbPWTD11f1Q9toD3AR7wJh12kUOySYut4S
 cZ45+KH3u5CkITZ92hjhlGikJbFj/TdXPHdPTYtAPS5dP4kfLDcQ6MdQVGSKHTSVGUctCDEXi+B
 wGp8rKIamr008InoJkYZPOCVFBCrTZkQcLn7wHZsJma+7R8J5jGnwXiCIA7flVtQx4c1cZ1IBZm
 04MvNJo6YSgpxIwpBRi0fcTKavGmS2Rk9FqdBnpAEb7RMjzZb9ItAJm3EOysqPyzFgeLe9vLIFA
 yVLIgg2f8JuyG9yD7Ob3vpebV9wY0AohLYs/eHk1lpLAZ5evrOTqPW6Z6//NIyYwlbflSNR5h3k
 nX0o9FMw==
X-Google-Smtp-Source: AGHT+IFIYsP07DdzOj7Ie3YTuqvV07XMsAxlqbss5qIjLr1jveCIYmIGNTtPfYQPATfF0/zV9QtjsA==
X-Received: by 2002:a5d:6f1d:0:b0:3a3:64b9:773 with SMTP id
 ffacd0b85a97d-3b5f1c726admr10208205f8f.10.1752495017940; 
 Mon, 14 Jul 2025 05:10:17 -0700 (PDT)
Received: from [192.168.69.239] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91d8sm12047584f8f.42.2025.07.14.05.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 05:10:17 -0700 (PDT)
Message-ID: <d338428e-ae84-47f4-8f60-b72b3cbe8dcd@linaro.org>
Date: Mon, 14 Jul 2025 14:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hvf: arm: Remove $pc from trace_hvf_data_abort()
To: Zenghui Yu <zenghui.yu@linux.dev>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: agraf@csgraf.de, mads@ynddal.dk, peter.maydell@linaro.org
References: <20250713154719.4248-1-zenghui.yu@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250713154719.4248-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 13/7/25 17:47, Zenghui Yu wrote:
> We don't synchronize vcpu registers from the hardware accelerator (e.g., by
> cpu_synchronize_state()) in the Dabort handler, so env->pc points to the
> instruction which has nothing to do with the Dabort at all.
> 
> And it doesn't seem to make much sense to log PC in every Dabort handler,
> let's just remove it from this trace event.
> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>   target/arm/hvf/hvf.c        | 2 +-
>   target/arm/hvf/trace-events | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


