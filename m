Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CFECA1011
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 14:32:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utoWQ-0008Nu-8P; Wed, 03 Sep 2025 10:31:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utoVs-0007jH-04
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 10:31:09 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utoVh-0001ZB-Eg
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 10:30:55 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45cb659e858so4845725e9.2
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756909850; x=1757514650; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1XoGe4aaz9rb+xLAS6kfHjbLb/wggs1Zgk8P8S2Fmdo=;
 b=st6UIHHrmji2vZFDjEzPbRkB27AtTMwHY9TJr2sEzroX2uywYQjUYnbAbsEDN7Lk6G
 Ku9acCckm0VJqp5ufKO44Nl+PXSqwX4ESdLIbV59GwmovhMNfCRhRxDBnPwN0NL0ZAm5
 kB+9rz0rscdIjndmcvBBnuxVL6chmXnxRVWKnA7n++XZgRIsvQRUKoVQ043Kq/fvbwWY
 gjmRyBmY11joQfX2GjGEXbCcKTEw1JIg+p1jntrkoOCqUbOPeY8J9ndlIjKVnzaKUxcL
 Cu4JfXdxT5SXVhplL4CLH+vFwpXP3okD/dfErdUnR8orT40dRSFylbx1rn8rrTZXa+1t
 q50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756909850; x=1757514650;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1XoGe4aaz9rb+xLAS6kfHjbLb/wggs1Zgk8P8S2Fmdo=;
 b=LISZDhiaQGo+yWq7ieU1ygpX0lcMizqi+1DU1BUza9Gf9EzMR2QULlWIdmWQJVMH4X
 kZuLJDiggssA4gUm4sN/YqxgyiFN0Uknu5L8Jz/KursGfu6cz9MV9eNUkZwTFMcuAfDY
 FujrBD8MVztUDkEA08+vQxro900J3AeIGh4xEs1y++LugISTPOTNSpTEPZW5NucWTmQi
 2xNVynYfXkC+DRjYtBsduAE942gD1C0EWjGeGwo6qjppAxyZSoOKcmNMiQ8RBCMP9Rop
 ApXMA1rN1m0ekG05j3ZT8DMw5SUa4nHEwmGzMzDgNiZ/uZUSBy0j0JKgiKcwbPpHD7hK
 g6KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS8QyAyM3gwyWWxDhfj/5nErmC3HHh6M5HZ8hVAdGPLJ/YMKG/yuEz5hiNWLQwtezbPJ+C4zefMw==@nongnu.org
X-Gm-Message-State: AOJu0YwwSt/U8i3L0v5b0BjmTDMS3UJNAl4kaxwtL1xnwvIJQf64I5rb
 5vT++eAUp+taeHaf6Oyy3nB2sVbENULMCntu5d+EH5+kZNViRNVz/a88FQ2amQWqRbU=
X-Gm-Gg: ASbGncu2YHWSLD8ThLCJuSXjL1e5DFWS2uY1d5UtFm3lxgwTKZt6DbUbxQnmDbIk/S9
 HeMwOHpcLE0j1AFLfaG1PYLUM/OqcOq9RXXKLFEMulKM/yURxe24BzKflDObMpsyA26UHMPzXYl
 edMYODxoLbxZ3ZWfq+Mz/UwA8TKprUIEyK4yrC0UDpY7vkHvCixMSw3PdDC9LRBQ4cuGlDMcOTJ
 yYpYjgO1hTAtjkwqtGMbHhCEPIlBLxzu6hd5M95nMOb6ZkcXciXGJXBeIm4Rdc0yEn9NyeZToDJ
 3rFAq9SxskmXMIh4rYQsLYpApD3Ln0IeKYJ8cSyiP+fRhV0SwcR3vvI7l9xPwjkQSYVmsILu4cY
 WotlCKf+oZr88hJ+CIMADY7Y429UC5LnAUMUiQy9qnarXR5NiaWiBGQq0Brt4RS49m0BmsnD/Kq
 7TsFJ+/Uls
X-Google-Smtp-Source: AGHT+IFvGVlTwU56m33A8VCym3rpRq0sY7z4SqtGT5Mk7VrLZhou93q98Id/IiT8f/MhUIoz/lTbVQ==
X-Received: by 2002:a05:600c:35c7:b0:45b:8996:9955 with SMTP id
 5b1f17b1804b1-45b89969befmr123584975e9.37.1756909850273; 
 Wed, 03 Sep 2025 07:30:50 -0700 (PDT)
Received: from [10.223.47.213] (27.red-95-127-94.dynamicip.rima-tde.net.
 [95.127.94.27]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6db6sm348300915e9.2.2025.09.03.07.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 07:30:49 -0700 (PDT)
Message-ID: <e0ff6b75-aa19-40be-b54d-cfc79d5ed08c@linaro.org>
Date: Wed, 3 Sep 2025 16:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] accel/hvf: Guard hv_vcpu_run() between
 cpu_exec_start/end() calls
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-21-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250903100702.16726-21-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Missing description:

   Similarly to 1d78a3c3ab8 for KVM, wrap hv_vcpu_run() with
   cpu_exec_start/end(), so that the accelerator can perform
   pending operations while all vCPUs are quiescent. See also
   explanation in commit c265e976f46 ("cpus-common: lock-free
   fast path for cpu_exec_start/end").

On 3/9/25 12:06, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/hvf/hvf.c  | 2 ++
>   target/i386/hvf/hvf.c | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index b60efdc1769..40ec930d244 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -2154,7 +2154,9 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
>           flush_cpu_state(cpu);
>   
>           bql_unlock();
> +        cpu_exec_start(cpu);
>           r = hv_vcpu_run(cpu->accel->fd);
> +        cpu_exec_end(cpu);
>           bql_lock();
>           switch (r) {
>           case HV_SUCCESS:
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 73c50175048..cb4af70e91d 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -749,9 +749,13 @@ int hvf_arch_vcpu_exec(CPUState *cpu)
>               return EXCP_HLT;
>           }
>   
> +        cpu_exec_start(cpu);
> +
>           hv_return_t r = hv_vcpu_run_until(cpu->accel->fd, HV_DEADLINE_FOREVER);
>           assert_hvf_ok(r);
>   
> +        cpu_exec_end(cpu);
> +
>           /* handle VMEXIT */
>           uint64_t exit_reason = rvmcs(cpu->accel->fd, VMCS_EXIT_REASON);
>           uint64_t exit_qual = rvmcs(cpu->accel->fd, VMCS_EXIT_QUALIFICATION);


