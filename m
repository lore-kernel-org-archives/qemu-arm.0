Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4539FCA0EED
	for <qemu-arm@archiver.kernel.org>; Fri, 22 Aug 2025 07:16:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1upM0M-0002kg-4r; Fri, 22 Aug 2025 03:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1upM0J-0002k2-RE
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 03:16:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1upM0H-00052C-4l
 for qemu-arm@nongnu.org; Fri, 22 Aug 2025 03:16:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b9dc55d84bso1629004f8f.1
 for <qemu-arm@nongnu.org>; Fri, 22 Aug 2025 00:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755846958; x=1756451758; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d0zjTXNvMKZa3PrypLWbSgRjtAvE5yRX+kTuX5XJuVQ=;
 b=YiH+L6nND9Fn1UN5RaDr8Qz4cW8Bewnp5cqVgqjjRnaS5DDFYdkSI/XezDj3mTtfpk
 0Se+bfBj2esSwiGQrh5aJry5VUAiyn2Cd8g7ZQqTs/XErqNMA89cImAGuADDUtGvdYx/
 BJX3LYW8mRp2ieJT6h95b1Kz22SFYCncXEVE/R3sGHdrshqosYHJspIGWR3DMjFRRb8q
 KpCRtxWTWJRrg9D8n3fA6b4Wq1Nk2EGX40aTrIUG2G8RVj0/HuWpwZAdXG9d8TaaUXSp
 r1n8yu/C2/gLMHxwWQIxh2nQtL9hIelMCj/FHqFcqjGBpubDRdPnG6g0BMsDXbuq9dR3
 Vruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755846958; x=1756451758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d0zjTXNvMKZa3PrypLWbSgRjtAvE5yRX+kTuX5XJuVQ=;
 b=RzdrCWC2DGvS+ox/zN4mTqBpOdp4qZ3CYWJTs+xg9a6R8oC3Afafep7Nt0L06XjmYt
 yjTgdHj0xYGR0iKOn/plMd865gbuEGtB2xEuBfH9QOF+NhmS2nQT6hEB0W/aSXwK6DF0
 7BLT/EHxTu3nQ3d5bSZeyTeegA5BxxsJhdaobCJ1ai0hTSZbH1EdKl6YDanVq3Ze1xoy
 OZ33LN1k3g6RdgWiDZ8kwEoHHIoBVPDe6ZaTDqer4FJJ9PHSJolB/M7mIDC0D0bIRE6p
 WJG0uS0LXSP+58ak3VLFh2ctG5GmYt62jwXHmzPQDofC6/WADmDJkvA2Osaa6OAvrXWO
 9oXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhTZMbgA8xOUSPT1dWgDh+W0mnCPg1eD9e1tSdi/DLS5aMyOwdtmCT2DUOsGykbdas/GKH4b9LHw==@nongnu.org
X-Gm-Message-State: AOJu0YxCttGT2tAJWyjaQJrQ79VqGoj6hQEjtyn1QWQZ7E6Zu7u6YiJW
 FTIs7cbY8BDIvA3rDYACjTbQubF8Y9arEyLDTvLU8FftKeEwX0eLT1kG74Z7LtwRRkE=
X-Gm-Gg: ASbGncsXDXMdT8LqS1nG6axy9nvm537F8iOAtjYuZxrlZQAuxJCh9yOD4fLoY/YdT6j
 8Crpli7nQk6IvlHoWqjZbsZc6LZ+kuFu+xTqWwkylYrB4qBJbMSP4cpyrzT82Rnsc91G43AvrOs
 1cUpHPMxVqzSvXdjA4AFAiXSDfWrRggoloIL24D0ba6jkHwsHq5+rSSRD6ryStEHx8wP525pjTY
 nd1Ki0y7PdBrv0JZup1QnJB/+aqFHe0QVzrTInyv8Xg5kq9h9unLOpZC/bHIblU5u0ujeJQvvr7
 qJv7BbfwCYV+AiTgHTkJT8GysfG6AlAEIYkUF5cDmusxbVOfeYvNCASv9qE7jzPdGlfPB7pNBBb
 7AkAC0V9P9toJ4XlqmXR2Tn9mfRme7kNr7buGdDlzq902+tctUkj7IzD+X/eztw6CaytAUt8bB1
 oDfkqe5A==
X-Google-Smtp-Source: AGHT+IFIOP3otK7owgq13qLvGMs4XwNpEe6T3NRgGNeHqeuHZPVXY6zwVczUzXfFCKKbVkFrXyetpg==
X-Received: by 2002:a05:6000:24c3:b0:3b2:fe46:9812 with SMTP id
 ffacd0b85a97d-3c5db0ef2c5mr1153045f8f.19.1755846957712; 
 Fri, 22 Aug 2025 00:15:57 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b50dde038sm25338875e9.10.2025.08.22.00.15.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 00:15:57 -0700 (PDT)
Message-ID: <01997d1f-178a-4113-873e-bf9ab7977e2f@linaro.org>
Date: Fri, 22 Aug 2025 09:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/11] kvm/arm: implement a basic hypercall handler
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Alexander Graf <graf@amazon.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250617163351.2640572-1-alex.bennee@linaro.org>
 <20250617163351.2640572-11-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250617163351.2640572-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 17/6/25 18:33, Alex Bennée wrote:
> For now just deal with the basic version probe we see during startup.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/kvm.c        | 44 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/trace-events |  1 +
>   2 files changed, 45 insertions(+)


> +/*
> + * The guest is making a hypercall or firmware call. We can handle a
> + * limited number of them (e.g. PSCI) but we can't emulate a true
> + * firmware. This is an abbreviated version of
> + * kvm_smccc_call_handler() in the kernel and the TCG only arm_handle_psci_call().
> + *
> + * In the SplitAccel case we would be transitioning to execute EL2+
> + * under TCG.
> + */
> +static int kvm_arm_handle_hypercall(ARMCPU *cpu,
> +                                    int esr_ec)
> +{
> +    CPUARMState *env = &cpu->env;
> +    int32_t ret = 0;
> +
> +    trace_kvm_hypercall(esr_ec, env->xregs[0]);
> +

Should we make arm_is_psci_call() generic to be able to use it here?

> +    switch (env->xregs[0]) {
> +    case QEMU_PSCI_0_2_FN_PSCI_VERSION:
> +        ret = QEMU_PSCI_VERSION_1_1;
> +        break;
> +    case QEMU_PSCI_0_2_FN_MIGRATE_INFO_TYPE:
> +        ret = QEMU_PSCI_0_2_RET_TOS_MIGRATION_NOT_REQUIRED; /* No trusted OS */
> +        break;
> +    case QEMU_PSCI_1_0_FN_PSCI_FEATURES:
> +        ret = QEMU_PSCI_RET_NOT_SUPPORTED;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP, "%s: unhandled hypercall %"PRIx64"\n",
> +                      __func__, env->xregs[0]);
> +        return -1;
> +    }
> +
> +    env->xregs[0] = ret;
> +    return 0;
> +}


