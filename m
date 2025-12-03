Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEF9D12D59
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 12:36:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQm5U-0007dl-5j; Wed, 03 Dec 2025 07:36:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQm5Q-0007dF-Dt
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 07:36:02 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQm5O-0006bt-LS
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 07:36:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so65642905e9.3
 for <qemu-arm@nongnu.org>; Wed, 03 Dec 2025 04:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764765357; x=1765370157; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zh5iV/E10i9DbHpIxVQxYETjkHiOrRCUk0cvdQdfiEg=;
 b=bnXikbbrktynsK4jwrPO70VENWw0vlhvQI7XaEGV4/2XIDEDljRVqYQYalLm2ueEmn
 sPz0hxZi7ShMztQzQ72/Jr9wTX1zrjD2mM/4N6dyzDG9NYKVacn89vDtPi5/b0PdN5sa
 NWEE1OYi1kbV0MNP9KwSqkWKEsyiQZWiUqWt2kHvLGj2J41/Pb5lZNxBngGvVmPqkP+b
 vueKDFZ+xMvSSpS1WQmfp4GOH6sPBZ6hH3Uct/ZcN8J6vBYJOyzzwgI4XMEMTOJhPs/9
 OA7L4oLhS73dqUodW26kkuMYnpC+HTjA0bbton0o3Qs+lOPO98IpSxoAgxk8m7VFDpJC
 alXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764765357; x=1765370157;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zh5iV/E10i9DbHpIxVQxYETjkHiOrRCUk0cvdQdfiEg=;
 b=eWJD+Xf5iHHPZr93P0HxnFMNP6/DcZtr39a/md94moX/zH6XwTPZNg7NY3nFvEoS25
 0StsLXAaFMwavHDxAilkgzmNJqyxYstyX4xtH7/5IMPWjoKHLi/FUThXSsjdAQUXU4I4
 Yalqic/zEijO7EPsvUedLZ5P/4Si1pistvdXokmZv2Td88oYHDeexqWVI4TBsa73eTaJ
 TWnqvrzi3otVS6ywhYPdhi/18yJD3mb15VgT46OMEZEKEAXwvFV9qF9m5UUKs7XgEqXE
 Wo+4opwz+aVhQjRAcWKzpuwDXuDsFk5uRidRSvraRT2qvdsDK2+JZ1TzCdjCRRAp6xuk
 d74A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1a6dAExUuTp95Pn2902NwKnvP0XPMFjHxBPjfkL2KGMi1RQobKGCTFrGgKtoHniLLlFLMBQE9/g==@nongnu.org
X-Gm-Message-State: AOJu0YyL9QFkf4XoOF3B3F4P9BQdqXguRgEustczh/oJj6nhcw4zRlLG
 AMp0iz2kcPCXlQr7MVCYFJQhx6nwHfAJvd63LQn6BZAdyR7VhCxw8CX+YrhsfGfdVuw=
X-Gm-Gg: ASbGnct/Qs0NWHGH8qPD6qzwQfmxvgf09BN0Sixb403Wx7SqtPFSGR8m4oK1kkulh2g
 jgSqN4v66Ln/hT3a4gzvo60YYVG44mnH2EUtEoN5M3284j3sSXt8hspmAkXUsGXU1tNyFHpGwcS
 eb22IfwX5a8u9/2Rfp+B3mmOmc2qUbm/oYOJipBxlbBcc06FkvZJHjdibDjbin5qGumoMI+dVAe
 5WqZnCKJ5s3Js2J7TI3h5tyiXYLCGhj/6zBlMvGpoiLuHefmtlh2gbZIPVWyLTQ5GjpecrqIo4Y
 fd08QdJ+UsQB1jW7+fOOKWheHtfpzl6kkxl7wbWxGcCInxyR8ebqQs+ViAXDKToCHM+CoIspN/R
 PKK5/erbAWmDTlyqreDlBiN3hJlKIHjCBwhjf+cluQoY2W3aOObObG53C3jPJ3MKCzE1z5lvihp
 xb4pp9rrYh6JyC99Kf+OsBQ+sGr78XDvG7ZCCBHg39SYnh5ED+fjKP8A==
X-Google-Smtp-Source: AGHT+IGSLs78NnfLrEWQ0Wq6xQ7UE1BKZ8sxwC0n6htmfLdjV2jU0nyJSWJh+Kkhsm0VIqSY1ScvLw==
X-Received: by 2002:a05:600c:4504:b0:477:73cc:82c2 with SMTP id
 5b1f17b1804b1-4792aef0368mr18716865e9.9.1764765357095; 
 Wed, 03 Dec 2025 04:35:57 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a310sm41449359f8f.26.2025.12.03.04.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Dec 2025 04:35:56 -0800 (PST)
Message-ID: <6e38b976-6dbf-43eb-ba41-ab12ce3556fb@linaro.org>
Date: Wed, 3 Dec 2025 13:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.2] target/arm/hvf: Break loop if guest halted vCPU
 during hv_vcpu_run()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Christian Stussak <christian.stussak@imaginary.org>, qemu-arm@nongnu.org
References: <20251202175146.20331-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251202175146.20331-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

On 2/12/25 18:51, Philippe Mathieu-Daudé wrote:
> Since commit 93ac765076a we try to call hv_vcpu_run() many times
> in a row, but we missed the guest could have halted a vCPU; if so
> we need to return to outer loop.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3228
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3230
> Fixes: 93ac765076a ("target/arm/hvf: Keep calling hv_vcpu_run() in loop")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Per https://gitlab.com/qemu-project/qemu/-/issues/3228#note_2928617511,
this doesn't work; so self-NAck.

