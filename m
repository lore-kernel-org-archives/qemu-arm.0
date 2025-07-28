Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1DAC83F17
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Jul 2025 10:54:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ugLU2-0007hc-90; Mon, 28 Jul 2025 06:53:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugKwN-0006Dk-JX
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:18:47 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ugKwD-000217-2S
 for qemu-arm@nongnu.org; Mon, 28 Jul 2025 06:18:42 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45618ddd62fso43156535e9.3
 for <qemu-arm@nongnu.org>; Mon, 28 Jul 2025 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753697911; x=1754302711; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DbHXTiiurlqHHXoNzK1HLQQcM4G2zIdrQoITCniBuPo=;
 b=ewxewxJ32YvOaE61UmZI2M/DPqPyVlwvWJzaXy2bijnYt4v/VMFTPJBsI4afP7T+ts
 n3OEY2Gx0YGO8RzrceZbqgC6JVycSXu4wmXNtymOu5KAtNkCORIxobiH87+fjt8Xc69c
 8+LHXA/+cF2VmP7Z4TcxWaTt++z7vVMoFLQpRYQWuUzL/hSFvWv09i+KWS6e1ovzYri/
 t9MknMxh62vMvluHep9a9/Q0MCGFkyzSvTJQYEC5DFHolhhmepwzUp8ToSabUQgL7Fdn
 8t/fkcwh3eZ40IjF9tRmI9EvcN1YZKPR4G3ZQpa8j2VXgSR0ucak08d6TFjASwORIYGd
 6dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753697911; x=1754302711;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DbHXTiiurlqHHXoNzK1HLQQcM4G2zIdrQoITCniBuPo=;
 b=tYBPzLivwtJpGnMie8bt+9HDuNgBg7yp6AjkoQCSHVpqQJ25G4Pa7/Aix5mzw4QQ9l
 f5z11gABOjaX07aOCIseu5A/sGHdJdgeoQPW4r4PE0YPyl0hzomAlKPZBHIQrItFb0yc
 NTW5btcezgGU1/IO9QWckZ2OYGgnOrdhX/PHJOYXdv6SVMOSv6xcKYo4cGJ32w3x1AVi
 ILfzGWA9wt3ULzAl60RhK45e7fv+wOIhdFgF6Eif6hGwMfoJAUeT9Wf4r6BIkdWflgnt
 EadHu5Jqc6hKIN5IwDuG/lhsjWkDsmNnkQlOQRZs8DNFmBBGMqksSPbaADcBs08Cdveh
 tOPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvD52BX7ssB2miN1k9JFGPNXF3jez93yvRveGRv8wvDRWndOp8N/56D9rshvsfMGN+btOSkUj1Ag==@nongnu.org
X-Gm-Message-State: AOJu0Yzmtz+0tR58Pk/dsSTqp3kTI7prfdoGv0uQM7/pvLW2hRQx0uIp
 CadeXKFW63XzbtFShsSdKyaLEnxsge4e4n7UQAvIxUzYSoCc+LaBUxeD0+xCJryGPWk=
X-Gm-Gg: ASbGncswYzJSRPb31GHTtYdzhoaXehhQTfWONfbgWgETAfPRbOKBjyCw6iOLKW7kytU
 NIBKjF/BHksnuelYVtn8YmV7YAqCc51FWP38khwI4pLyRcYI9Z0hysFNhi+Qvhz7q/wsla031/q
 c1EvGmMm4VNbnItEjW7gQRNE+smhyvB5kQIarLT9kIJ+CzCxs2oqJXl6cHveeJFjdjz9UK9d+Y0
 GdgjUFdGzAWI+5qtMjp0f2A8Qj+jo952b7bcWRVWjfiqqdHSysK14IAa4BtTwHG/oDupRIxZzT/
 Fpi6n7sjfcpmOqnSpFzbT5F++o7YYuQi/WmwEpfiWXAzR/zboX+SaAtSnQCMwwpeIiQRLV3vPuM
 uIM3yR02X/siYvW5f/w9Z/OxgxCcYT1Bl2ZIK93HIhT3PmFvP1AhRnNFbSYBUETR0Kg==
X-Google-Smtp-Source: AGHT+IF5JOoz/Xn9nawAktnwJI1Z51zXLbvRu4zlUNWpIWMJUKMzc4m0nQJB25/CJX2xToRdLDQRhg==
X-Received: by 2002:a05:600c:3f15:b0:456:58:1114 with SMTP id
 5b1f17b1804b1-458785288ccmr92315405e9.9.1753697910758; 
 Mon, 28 Jul 2025 03:18:30 -0700 (PDT)
Received: from [192.168.69.209] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587ac660b6sm96033975e9.24.2025.07.28.03.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 03:18:30 -0700 (PDT)
Message-ID: <e9afdf9e-b357-43a5-acc6-f4839c539585@linaro.org>
Date: Mon, 28 Jul 2025 12:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] target/arm: add asserts for code paths not
 leveraged when using the vGIC
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250725223035.52284-1-mohamed@unpredictable.fr>
 <20250725223035.52284-4-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250725223035.52284-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

Hi Mohamed,

On 26/7/25 00:30, Mohamed Mediouni wrote:
> When using the vGIC, timers are directly handled by the platform, so no vmexits ought to happen in that case.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/hvf/hvf.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)


> @@ -1965,6 +1971,10 @@ int hvf_vcpu_exec(CPUState *cpu)
>           /* This is the main one, handle below. */
>           break;
>       case HV_EXIT_REASON_VTIMER_ACTIVATED:
> +        /* This is only for when a user-mode irqchip is used. */
> +        if (hvf_irqchip_in_kernel()) {
> +            assert("vtimer activated vmexit when using platform GIC");

This line does nothing (not firing), is that what you intended to?

> +        }
>           qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
>           cpu->accel->vtimer_masked = true;
>           return 0;


