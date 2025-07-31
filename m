Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F243C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 20:26:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhZql-0004yu-Ei; Thu, 31 Jul 2025 16:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYDO-0001cT-LK
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:41:23 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhYDM-00061j-Kj
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 14:41:18 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-24063eac495so956615ad.0
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 11:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753987275; x=1754592075; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=doMUWIgRUCZHu0ghlXWubeQ3uFyDpsT9R6VbfkdNNYw=;
 b=YxlmUSp+Caynb06i35vHo1il0YLpgX3pU5auDSQUgRsSVpnf8nLQn0GcgKnCd1GMdC
 IifYNp8KMivlBDwI/OIfq5EDPKlVemgafgZjTQKsF36cUodR2l/F351my7It5pXZMzDj
 Jk2Dq5aW9TP8wlpGp3DBDBzD9TJuIoox1m3/Bj4AI/8wnKC9lPucy0PgbvQhYCZkp4Ol
 pCE7r73ONlVsoGu+1TEx7R039cPm6e+gjq3k8ihd+MqBsnWwQ2lp9jucK06OHV/NB/UG
 G8wdU3/va0mzAKMGsgd1BiSX87cJ2jSCzJ79dKfY8VYtUHXpygZdLNgpil5anDtwcETS
 ghhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753987275; x=1754592075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=doMUWIgRUCZHu0ghlXWubeQ3uFyDpsT9R6VbfkdNNYw=;
 b=DYqDpXgTbTXwWOdqYausL+vt1JKH3xSYfEV5v0IDVteoyeUBwaS02K8nYnzUxFfwUU
 fk2ViVeKuPhqQ4v93kwK6t+QM9cs4zaAE92ku0oxARjSzgvhFQk85BSUCvOwtT0rJ7nX
 6Jul3WW8yCZrJ9BWz8y6zoJQ7oaqlXM09T34RfK9jTKiAuAnz3MWr94KSSRxm9z6ebf1
 2MLeB19NUi7pOqcXoM4HqEkHNWh0eWm1d3CyRGeAs7dokF4xdFefmRZdh0xOER/qz90s
 JqNCPnKshQVpqN5XltHWMzl8GlgyukiYzdWb6NlX4pbtRBfpPTIcVaizS2a+IE40bIY+
 gfVg==
X-Gm-Message-State: AOJu0YwPGqnS+juAhls0TCTTQWnVdcuhW5mwAgfpP6XT4H2eyMhUqHy8
 oSeD07vzcgjCNHZ36MHkuriHPrD8w94krZ4sLsGchJw+adtXodVjpSPYvXZgjZZIU/8=
X-Gm-Gg: ASbGnctSuqovWySzE8B9ImEkw82XsUej788OXWB03cb5Knagh/nPdQ/6DMnVJC8VQuz
 oKYXG8ppPy/muAaZstbAVyErm0XtDJqVPydhO5fC6ZXvICYe6UKjcB0qYCNSV8w4xe51w/zVIMC
 x5uRGQ+KNBar0a0lXoU0oVB6ATBSn5me5fe1Mvg4C9rbhmDiSW8uQ4LeDDiy2sEFbQPSg4l/fkN
 I6Sbaoz5MIlvZIoFco6Ke5JQClv7ugrMuKCp/GSW3c8/aAOo50fXpmoag2qCikj2Oymx6w5sl6q
 Yp002iMpTELotGfUvemfwk6EIQtQ1mretZT3TRwxNX2yVwncSdElvSfS/z8zc2m6BzfcWcvWqfE
 8M69s0zX3RNkFo9XXU59X2tigvU0UWV4z1y4=
X-Google-Smtp-Source: AGHT+IGIe1JF9t+qwn6YNTd2ykkMeSeEAL0V+RpvprdX/1+HVeKkDNpYVCwPHMForeUeJgTquEtn9g==
X-Received: by 2002:a17:902:ef46:b0:23f:c945:6067 with SMTP id
 d9443c01a7336-24096bcd286mr124177685ad.41.1753987275032; 
 Thu, 31 Jul 2025 11:41:15 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8977345sm23710695ad.108.2025.07.31.11.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 11:41:14 -0700 (PDT)
Message-ID: <e72bfc26-ec05-4cb3-a8c8-de5731ec8483@linaro.org>
Date: Thu, 31 Jul 2025 11:41:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 43/82] target/arm: Implement gcs bit for data abort
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-44-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-44-richard.henderson@linaro.org>
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
>   target/arm/internals.h      | 1 +
>   target/arm/ptw.c            | 1 +
>   target/arm/tcg/tlb_helper.c | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


