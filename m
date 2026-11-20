Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98581606A6C4
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xoc+oISo
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUUSm-0001Os-UZ; Fri, 20 Nov 2026 14:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xUUSk-0001Ne-Av
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 14:39:58 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xUUSi-0001Nb-RS
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 14:39:58 -0500
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2f00fc215f9so9001775ad.0
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 11:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795203595; x=1795808395; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sDqPnKYtJ7HoOWBh+GRdA7KI1/Yh+SOQRffdE50PFTw=;
 b=xoc+oISodLgFfoNQ2O6OeNGvmRl2Umlkk3jxyJ6b5ejKpplegC3fr39UifrYCQmJx1
 gsGgUyFy4U21Rk179sZJIt0HWxwCnLlJkAHVsFujkOK2+mD+IdvGJezgNRw6WM2IXghu
 v5m5IJNyHUjsGq9DOI3G9K7EkPLK6MlQnYEiCbmvdtX9yH4PF+tVW2I7uvSnlsMpcbG/
 DAo8B+ouEyPrRBBT1pn+anYcyBdT7RghA4eX0nNRy7jJ6MLaX4HK3ePKNcOzle+zLaix
 wD08Aqw7/tzfaj9e1iwo0FKdwnQiFHGYrVZZGy4PBjfMll30dK3/MNFM9IPmw5LRA+xY
 wVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795203595; x=1795808395;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sDqPnKYtJ7HoOWBh+GRdA7KI1/Yh+SOQRffdE50PFTw=;
 b=15GORlMqtnsGvFL5BlOBnVK8P1/1fDLnlkvln5PN5g+JQgf20Fkz3N0AItwgVaJ371
 Sxi5SjcF45lse2oB4mcuHHnoGx5/3aGXIp/ouDYxLu1rjHSnzk6207s8DeBTe0alZL2j
 DqI/0Wfzjq+aDhJVdgzoz5dzymqjO6c7lGJjVb77K6jAwCtvHjtftbVVOeYD3VI87FJ4
 XttDS7u+KlipqDvikWGjs1X4V5YcD8yAp7q8NQGftAP6tAGwoIY63LgUlwrEWdjfjnUy
 S4ERBwGzZ4hR55xyU5ovGVYjsLveSAoXmcSx5G9A1cn8kYwN533Iu9TqzTXC4xlEZaIW
 Ghxw==
X-Forwarded-Encrypted: i=1;
 AL+hErGBIjF67Yxp/Nh7sK8TaL4TCH9nwkytix/SfgIrrK0FGe3/JEeoWTvK8ib6dKWBiRIoBiZWkotT6g==@nongnu.org
X-Gm-Message-State: APuU4Z88nCZV4cFuHSziO5gsesnwE0p7lj7EY/WHJFctN4FhM9PU3hCG
 QG4n9OjbvvvnEHn6qxd2enh5ktGRLM5qiTm40YG+UIf3J6J+IxijW2dffwX2q2hFWQY=
X-Gm-Gg: AZFdTZdbGYN4zc2wDkOa1rQS0Sg5oyXtvrh3cYc9hLBcW7IXyH/ImykSD7tXM3w9zid
 qZGOUeOXJr6vr2myHqUwIQYHOvWfUiOGDLXgj/+diEmZVH12/p7Ipgz/emp/hSUtlc/5Cewewmq
 cuV3Ivc9+rM+3rn4btQ0soiveuySoELF6V4SurFEyElUuhYwhpmnHe5kkUlNNWXmtI+JHFYe9MG
 9tdocFHjsLz/sI5EtReKE1TIymm1OP59wzJ8sLlxWS/dTEwhWn5rBpgOa373l/7Ix0828qq5JhX
 ZOQzE3Cs/4+2ez8kwsukTBPOyUX8quRH+bPe/avfZou9PBUFUJ7Gh5De4jE51pvTSlVNWJDsBIO
 BBmiPx6KOuBDifwxXUtgHm/PYXiWHeaAQgJgDv/oQU7fBgKMWsOLHVIpxE3zoFwV9Wi11A5aFqs
 3VeQDimFE8rIWTWUjY2+twGKqNi87H9IT9jPb0fBzurbGMJCb52C/PBpPIAKS9gi93MOMEEQNBh
 8JcFfRcc9x1bbS5g2gLtK88PrAN/kjf2iRRqobd7J92j1GPdWbtitnahqgCjvCpB30naiQIaAat
 H7mwz/sByYCgUq6Lre9hOtyWCbClw6f9D1i2yjdgeuUzNJIWJsUII407uNnJQcL17y2I3dw=
X-Received: by 2002:a17:903:2b0f:b0:2ed:2475:e40e with SMTP id
 d9443c01a7336-2f03f211a24mr41492295ad.61.1795203594978; 
 Fri, 20 Nov 2026 11:39:54 -0800 (PST)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2f03f0c42b1sm18276355ad.17.2026.11.20.11.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 11:39:54 -0800 (PST)
Message-ID: <5ce7927f-1a9d-405b-b2e9-49cd0a30bf53@linaro.org>
Date: Fri, 20 Nov 2026 11:39:51 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] accel/tcg: Check current CPU in icount interrupt
 handler
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ashish Anand
 <ashish.a6@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20261119225514.4080-1-philmd@oss.qualcomm.com>
 <20261119225514.4080-3-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261119225514.4080-3-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

On 11/19/26 14:55, Philippe Mathieu-Daudé wrote:
> Under round-robin TCG, all vCPUs share one host thread,
> so qemu_cpu_is_self() is true for every vCPU. The icount
> interrupt sanity check can therefore abort when an interrupt
> targets a different vCPU sharing the current thread.
> Compare current_cpu with the target CPU instead.
> 
> Suggested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
> ---
>   accel/tcg/tcg-accel-ops-icount.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
> index d0f7b410fab3..0313a4d128c5 100644
> --- a/accel/tcg/tcg-accel-ops-icount.c
> +++ b/accel/tcg/tcg-accel-ops-icount.c
> @@ -152,7 +152,7 @@ void icount_handle_interrupt(CPUState *cpu, int mask)
>       int old_mask = cpu->interrupt_request;
>   
>       tcg_handle_interrupt(cpu, mask);
> -    if (qemu_cpu_is_self(cpu) &&
> +    if (current_cpu == cpu &&
>           !cpu->neg.can_do_io
>           && (mask & ~old_mask) != 0) {
>           cpu_abort(cpu, "Raised interrupt while not in I/O function");


