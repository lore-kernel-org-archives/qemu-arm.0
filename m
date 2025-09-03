Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAD2CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:33:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmfo-0002v7-Qc; Wed, 03 Sep 2025 08:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmfn-0002pR-B1
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:33:11 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmfk-0002SI-JK
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:33:11 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b0454d63802so316908866b.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756902786; x=1757507586; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vKi1wo5buj4xFBtxxQuq3YgiXdf7blqtkt3ObkxtCko=;
 b=M5ywvyhxKopi7GsC5p4PsEnqVwBFI3vhn+X7qKtWG8CNzCvIlcUEm7lCLI86CvXbHb
 GnKFUP5WsoknJiKPrU3EnDAkt1lb8jIfOvEhSMqKQhcGQKFoQp54q//B/d1u1Cfq3sWj
 X4O1ppHEPwju8OI8VN8nHucr5qIOpRiEf3NAKLJ+c0gtRl0od14aJPnylYDHNce6M+2v
 W58F4/PTbgcOWjI7B8JI6qYzmfa9DGzrQRaX0cV8kTek5+o4YDn1YnP5GS3ybS+Wfry0
 0GHu9Pf7DWiAoaVtjMj2usszPd/BGCnOuAi+WBv+9M3sFbgmAEwwNKdEz+Y5THasigcm
 WMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756902786; x=1757507586;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vKi1wo5buj4xFBtxxQuq3YgiXdf7blqtkt3ObkxtCko=;
 b=Y/wEFX/PDjyqCFsw/NFrTvGjCkG0iGMbVmc58qAQRMKfpimYac8SfjRHTvOFKhLd/k
 We3SEUsQwjA64bhUrHdK+0hHGfjY3QY/mlBVQAHnDnZ3TTFqGpOXqS5vldBC/cjkLyav
 ZUqrIBoG+NwArgwPjATtUWb7Jd58e/+H0oV7enIf1rQm/AUrox0Y/+d+Yl/NW0N0ncY7
 pJf/SgK2m4H3RW0SkqG08fVOoMd0F2Fe8dLjSd7IQma9V7UljJd5ygGBS+n0EriL1AQv
 lpPH+08tZxSF8YydvjAhGNH3mzYbxzKnYIZNqHUKAc9x8WVSezWPqlYH6ivVkurTpCuJ
 Mcwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqu1oHWMnT7QajQxXEu+ndFpopY7j/Whg2eQ4UDMb53RQIftGj0Xx7LHH94LoPoeWclblwkq6Ndg==@nongnu.org
X-Gm-Message-State: AOJu0Yz0Jp3Q3XXT21DbC6U17fXx1SdDekwQnAq7UDdVjQ+MSgauAYxC
 FwzaY9jhlVyGCZajyVqoW2OgAN5eyYT7xDJr+nPFqiO3mL7bbk0U9jz3VLyvmLZDcbs=
X-Gm-Gg: ASbGnctLWvStmhoR3JSWHQrWvQv9DtwFGk9DxqpXbD7xV2+tg03Lgvadg+1SijJlL4r
 QYIPMgTjQfPanJVFaCFqSQ4dHAIgQ/uVey0exWdkLo12sXc2oQM6NQk+6tjiZUiuukJ7FVruSPe
 1fTorQJVvFfqXonJg/Yqc2TxlVwEuE5az6KrETmCgHSA0Io4yfe6fXqeVvbgOt71S2c5HJ7cuXN
 kqhrIHWvqarGCLOXFeeRzCmj0pM+tLXpoJil37wSHZ4ul4eI55R73ko95aBz1D91aNNpfSQqq3a
 EV60VPWkOQOn2VvlDTyYcFU+UUC2K16h+r2yEBkZQxdKiVynS2zd5gBkzQRhKJkLtoXZhAc99DM
 7eSdVe/jI92mUHO1kJdTdEPKNO1NZwXZrKSQa0C2o3ASJiQ5t5iEMUOcGQ6W655oGYqmxk4fYUr
 85YIG4ZQ==
X-Google-Smtp-Source: AGHT+IGMQ8RtHjFgncqJMgx8QCn9gi7OOCewGeMOb4mRr0w/vckxw4Een8xe0qMo3I0TBLKUkT/40A==
X-Received: by 2002:a17:906:694a:b0:b04:25ae:6c76 with SMTP id
 a640c23a62f3a-b0425ae7255mr862111666b.47.1756902785656; 
 Wed, 03 Sep 2025 05:33:05 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0416842ffasm903543666b.38.2025.09.03.05.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:33:05 -0700 (PDT)
Message-ID: <f736e11a-1d46-442d-9268-e28fa67848e1@linaro.org>
Date: Wed, 3 Sep 2025 14:33:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/24] accel/hvf: Mention hvf_arch_init_vcpu() must run on
 vCPU thread
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x634.google.com
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

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> hvf_arch_init_vcpu(), along with hvf_put_guest_debug_registers()
> and hvf_put_gdbstub_debug_registers(), calls hv_vcpu_set_sys_reg(),
> which must run on a vCPU. Mention they also must.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/hvf_int.h | 3 ++-
>   target/arm/hvf/hvf.c     | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

