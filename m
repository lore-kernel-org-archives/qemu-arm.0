Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BE3C87FCA
	for <qemu-arm@archiver.kernel.org>; Thu, 31 Jul 2025 22:04:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhbOF-0004nK-UM; Thu, 31 Jul 2025 18:04:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbIK-0002zA-4n
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:58:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhbIF-00041f-4m
 for qemu-arm@nongnu.org; Thu, 31 Jul 2025 17:58:35 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-236377f00a1so12986605ad.3
 for <qemu-arm@nongnu.org>; Thu, 31 Jul 2025 14:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753999104; x=1754603904; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EEfNB9rkJDmKIjXsLS317fO1mbJkxKYEn9an3dTtzwA=;
 b=wxt8fCVILx2EAMyReWtWBR4kmIA4zctPvgP/I+JAIrat9Q4va7h3052gCx5a+R02Yd
 2e1JxCslAZ+RxeP2v9kmGsme6jzZqphJ+wBHMj+JE2MbjKQqhLUc1vac9fS0UmXjPgVF
 xC5Tgh1sqMFFdVDPZpE8Dj4Yw2LwMtHTNyNgj0ImNY1eJDl/9Zmwn8WGqaTGyzQj/1Mr
 nCRIgQXxKNyeoIpwtwGhG974UijLXs+SqneiWZvSxrV+V6kCizZcDt3CXgEUIuep5Rhd
 pwPJkmlUztD8awTlj+xiXwOozEzo2t7Q5vHjQvp/nGXOJN9AuVKwmQv8dBzCTAcmaG86
 f7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753999104; x=1754603904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EEfNB9rkJDmKIjXsLS317fO1mbJkxKYEn9an3dTtzwA=;
 b=UEhAjqvlv64sgQaRiWb7ToxKX0QQREWNd6QG7Ovxc0N19xbJBuh8rhIzYo8Q8IvsLm
 Q+Ykm9WD0PsdiFKTUeVYBaI0SEhVMFzFpd3gd/xfFAdlkuAXDzFR5fMeIJRa4gc0qU8X
 0L+9zSiztP4g24cqCljk13bo3+wqqTVw4MG4KZbsHp4MKsfwjGTNnfNkT0AiD44Syxa6
 QBouJXhyPzFTlVL17pMVUJ13P8xaH6nGD8xne4PeFmbCKU7QciVCgRjOQHHyZ+R0x/WQ
 USt+4hmumYSO6JWW2vVTAVZ82c9GPI7yVSediSagBH4iDhUcTcHJcOfgd+KrIuFxNCwd
 6lSg==
X-Gm-Message-State: AOJu0YyI/mjM4Oed6fAg2LNM2lJ11CHF4eNMO113QenvQRVAk+3jM7+f
 qlVVHWM5aYwN4un2L/N8C1Bzvl6VnF8okB5zhOFDpOsyJJBGhJIwHqmDH7x4jKj6dSA=
X-Gm-Gg: ASbGncs4zop60posieE1e0bPpde956YQ3nI4V9k7T8LRCXek6auPioWwCIaZBDZ6vQp
 yoSLvGQUB2R2Y3GwC/0mcxqc4tHMZWw69B5Qb/V5TRJWelOoLpwarIm0X+5DhfD0rsbVZ0pCi+f
 CaRLT5373q9hx/Bk1EmwJJdeF2fb9tpdb58n11DxZ/n495ZAJepj/2dlTpAc6dL7VBjrpHAtrc6
 NvkyjN2uH9D2w1QrX0/TGBIghkfC14rU9jZk2FOmhoLyoe4T3KBfbtZO11I8QXh7uEo/0UtpdUx
 tH2HVcjocA+oXxriIOruvWeY/76WjM2J2IZ4Ie3q8U+N+raA/sdkhJ7gOw/yqS7GQVpdq50e+Y6
 XopPqAH6sNC2ASpxWegUa0jkNdxcoEfdCnao=
X-Google-Smtp-Source: AGHT+IHatI8XIrGbkTbn93A1P5O/QxrzfKetwVwJMZ5MMd38yAbqjr/sl1iz1SsorrKFM+YbMBmX4Q==
X-Received: by 2002:a17:902:dac8:b0:240:bf59:26bb with SMTP id
 d9443c01a7336-240bf59292dmr77809235ad.19.1753999103728; 
 Thu, 31 Jul 2025 14:58:23 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc1688sm5695629a91.9.2025.07.31.14.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 14:58:23 -0700 (PDT)
Message-ID: <eeaaabaa-1d58-4404-a0bd-70ac92b079b2@linaro.org>
Date: Thu, 31 Jul 2025 14:58:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 79/82] linux-user/aarch64: Enable GCS in HWCAP
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20250727080254.83840-1-richard.henderson@linaro.org>
 <20250727080254.83840-80-richard.henderson@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250727080254.83840-80-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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
>   linux-user/elfload.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


