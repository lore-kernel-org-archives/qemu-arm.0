Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE3DCAC5B8
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 05:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4BpC-0002lI-2Q; Thu, 02 Oct 2025 01:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Bp8-0002ka-GQ
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 01:25:50 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v4Box-0002TX-I5
 for qemu-arm@nongnu.org; Thu, 02 Oct 2025 01:25:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso3979215e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 22:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759382732; x=1759987532; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4YcCpeSxPngmWuRDPueu8LcloTnvBiLhel8FuC1rE4s=;
 b=NzuYuJwxdksgOcgHcfQBaGYsFVec52beY5oV58593mVf476f9bks0iHFUMokos1VuY
 b9d0M6wy4E9pwvjxDlfSxCWkypuVmfpORa2Bz17yeMPCJHLd2h4pk0KXI3pC8EHG/3cC
 OtOFEWV/6srnXLEr2FkXzYhjnfdWaBZPfJH+5OPm7EXPkXrt8QlantcvRkZRzxmnKaNn
 6RhQOisZ4YCDhkWlbwpNN6XblgoOVAZCyl18lYZF7QxdD5M4+AOw3jotixm6Z148KWQf
 WZgte2L4X2hjYhIKynPFVHoKhz0jXt/R8CMlwi88Cuq07/KtNmu9X6NT/vnhB1NMzKj8
 qttA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759382732; x=1759987532;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4YcCpeSxPngmWuRDPueu8LcloTnvBiLhel8FuC1rE4s=;
 b=ILdjIvfscz98NBYYwvSq2Z2tIA3Om4As6erBnmgdfVCJggKE0vjgX24Sac/DYC3T0s
 ObvlRulHptvoVEP3QVLEPm3KrgDr+/47TjMkISVzBWwvpK5nlfY/Zz8lUcQsWbPGG4RU
 uVjfb8ta/AtuqKK/NqD7HpaAZg/5Gi4DjO0sZKm9+1QB+/5eW5nRsydKRKGaihHer+oK
 /L0tK1xXnDq8gpykaFdFS6xpEHcrv3hXZf9v5ymQU9e5xvdX7CTavrBrj3BM/p6cz0ti
 AxvMtBTvP0BY8YnzFdLEUg6xjwA9UybgwxMSBUZ1UyMbR4VTRmXWRt1waQFx83NZNsIK
 N30g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0R3d7rZbNaqj7/DTo15qvif55spyV3hFO89orfmb/MRv7oZ9MfdlKaLfRKRp+CGLXhbTPo8fEjw==@nongnu.org
X-Gm-Message-State: AOJu0Yyo1AumlAE7ZjUOJT7zAHWbpUxpbJXTtrwvBx/A1zzlHmvm+XZM
 kGJzBIylflltBds72UzBxjPoyrYJcH75o3F/2CUl5FfaD8xLFkQWu3G6GLkANtZmo7A=
X-Gm-Gg: ASbGncuXhW/y5NfuWPl4Bm+XCb1KCFnsxD7Im+fk4tscMf/Y4EjMqXZiyxHr1G0vpwN
 6MZpRV0TNTE/QXvW13BmGl70lkY1J7s47V+KW04uXUr2FJL7ByV/SWdGPUDFnMMB0XcFKTriuWj
 iw1Iv737GrCPWmYsP9CdAQurbyQZOUHuIzyiNWxpZUTKnhPzrD7taQo5TU12+wx8dA9ipMoITp/
 O6HSVo7qoIyWvWDiN1lOUBS/Jm8NWchSNwAnlv1gemCUQtFtyB96hEj5QpBdqisrx9Rwr935nK3
 0lgNpP/N80NOS9QaOQZhi2cMKP6NAyyj1ihm3M5fSDWtiduFtPqF3gBj9HNlvc2BKWibwJeHNU0
 xzYwgpe1cBJzeisDRbfvGh0SA3QbzRIZI9Ltyyrs7Nzgme3cjnWXDzCk54kh1wOuthhSRYHV3LU
 HVAjHQ1NSZAx1W2rxZAQ==
X-Google-Smtp-Source: AGHT+IFY7sBNXpw5Xbdmx5QdjN1TEJdy0J6Q5DQagPJ44AfrwDnFu5XPpuSAlPEwctiBUZUO0u6J5A==
X-Received: by 2002:a5d:64c5:0:b0:3ed:e1d8:bd73 with SMTP id
 ffacd0b85a97d-4255781ec17mr3879849f8f.57.1759382731959; 
 Wed, 01 Oct 2025 22:25:31 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8abe90sm1997967f8f.23.2025.10.01.22.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Oct 2025 22:25:31 -0700 (PDT)
Message-ID: <5a254c7d-043d-4795-8570-35edfe8bb286@linaro.org>
Date: Thu, 2 Oct 2025 07:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] gitlab: move custom runners to Ubuntu 24.04
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-arm@nongnu.org
References: <20251001170947.2769296-1-alex.bennee@linaro.org>
 <20251001170947.2769296-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251001170947.2769296-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 1/10/25 19:09, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/custom-runners.yml               |  6 ++--
>   ...4-aarch32.yml => ubuntu-24.04-aarch32.yml} |  8 ++---
>   ...4-aarch64.yml => ubuntu-24.04-aarch64.yml} | 32 +++++++++----------
>   ...22.04-s390x.yml => ubuntu-24.04-s390x.yml} | 28 ++++++++--------
>   4 files changed, 37 insertions(+), 37 deletions(-)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch32.yml => ubuntu-24.04-aarch32.yml} (78%)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-aarch64.yml => ubuntu-24.04-aarch64.yml} (89%)
>   rename .gitlab-ci.d/custom-runners/{ubuntu-22.04-s390x.yml => ubuntu-24.04-s390x.yml} (88%)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


