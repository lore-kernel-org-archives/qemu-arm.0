Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB983C87FD2
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 21:54:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbEk-0003Jd-Ml; Thu, 31 Jul 2025 17:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhawo-0004rq-It
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:36:22 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhawm-0000Zu-Vb
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:36:22 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-af51596da56so202839a12.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753997779; x=1754602579; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h0ZilKvKVhq0857pyhEypm1KW4DqhYhYQhWzilQTJ2c=;
 b=pdeQCsCTEKd0efs3MtJVCVz6c/h8vfPjw6nLfmysopYU8gQrlwHdWNWz+z9DBxzjPs
 +h8t1p5l5fOeFKEcnKNXZFWkZSL6RxX+p+rZgyeIs1fbOuAS6qMOFCoZTsndXeEaWFAB
 qFufqUTX67sNfSUMDas/6mBLyVMzettJ/J5X32FzQIAb+6ns+FBv7XSwEXHqKF8ZXcAF
 cA2ldt4zuwObXb10ySM64FCODuMrsWDDaKKOLpOHsYTkI9xXEobFRwv5H7QO+lSOMA4C
 3wsCSBM115yPgVEbUMMehhJRQyLBOA5LQi9U/Io+DN2UU4bB+s8lE9QOIO9cZC1pKM/U
 7AUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753997779; x=1754602579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h0ZilKvKVhq0857pyhEypm1KW4DqhYhYQhWzilQTJ2c=;
 b=lvesxLpuqM/c0Uer2cvtNPcYj6WLx8aRLqygWitfUFG1Q2jPemoiFtKu/+9uOCSjg3
 K21mleHJu0R0oQQ5d/MImeGkDh5OyYjCqnEnB5VPWOY8NRqhIPsdAV+A4x3UML1lfwPL
 XEKMWnWPwN5tye8oVx9yzlfhS/XQc6SVwJRyP5UpWP14S5XfkvTVXKoFOfnL9/yryUku
 2I00z0OcDPG/RCCoCBSKlOsr9161O3I+ZXFBeLDQZCVU8AXBRzc7icS2AN3MT4s6Xi/s
 kAbkSj+j8iK8k0iuAANQ2qZslhXovSv6P4SL2rBOgdhAFRAXFre6F3nXZ/KhmJ9v0EB6
 REBA==
X-Gm-Message-State: AOJu0YwlAds4XuCqDf5dqs0VYn8PlVUzL7iR+HRtnsqA8fswsPGDVKMd
 Sth59MGkuh1a0C6Vd0owAXSPh/Z8vDuWG0xRPQEY87G2r6LaakJzhkBVEXcGMxEVrOQ=
X-Gm-Gg: ASbGnctzxkortBAxk7ZxkifBfWJ4qECQFOD0+p6nGJ8hxBNR8330jYScFmcMf6INjta
 aJofVbXqcP9mrnRaZC4Iv83GEsg6G90/L5weaSKXCE5Fk1HBRKt11ehTzjvLm/gagaLinXfMvcj
 ub4rqtrntJ9VIVomnJgpL2ZHmTBcvjoq5UuKg3ojqPRgH89VCC5DyrNVVov2c1pYJ97eoa/pvDR
 TB+QtD89vAum1NEmVIZGQJDiSNO3aAptLO0Hv9/Qc6dbmjimgG5qdlq0WdkgeLTVwOVesyKw35Y
 uggoi/jPJeSLmrHlwG35UBQJ4Upii2MBVctoFz0Ic6CSSTWDRmDwNocpgZgawPaRQDzJGN8H1AO
 8Uzlj67cKX6tWrR1oDDBH3gSPDwdyKhWBEqU=
X-Google-Smtp-Source: AGHT+IEfVgXE40G/RJeHgYZmeoxDi9QZkMqCGd19fEWLDWqZ4Y9WxkfAmgp4lnT/9BMem3AsJ2s9Xw==
X-Received: by 2002:a17:902:f70a:b0:240:1f19:d35c with SMTP id
 d9443c01a7336-24096bc750amr111074605ad.39.1753997779261; 
 Thu, 31 Jul 2025 14:36:19 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8975ad9sm26222755ad.98.2025.07.31.14.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:36:18 -0700 (PDT)
Message-ID: <1b1e9694-a1b9-4689-ac8f-1772b16523d3@linaro.org>
Date: Thu, 31 Jul 2025 14:36:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 58/82] target/arm: Implement GCSPUSHX
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-59-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-59-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x531.google.com
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
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpregs.h            |  2 ++
>   target/arm/cpregs-gcs.c        | 17 +++++++++++++++
>   target/arm/tcg/translate-a64.c | 40 ++++++++++++++++++++++++++++++++++
>   3 files changed, 59 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


