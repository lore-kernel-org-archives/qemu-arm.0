Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC56D3EE77
	for <qemu-arm@archiver.kernel.org>; Thu, 22 Jan 2026 15:33:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1viwb7-00038Z-40; Thu, 22 Jan 2026 10:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viwaj-00032P-Vk
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 10:27:27 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1viwah-0000ZM-U2
 for qemu-arm@nongnu.org; Thu, 22 Jan 2026 10:27:25 -0500
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b8838339fc6so160849466b.0
 for <qemu-arm@nongnu.org>; Thu, 22 Jan 2026 07:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769095642; x=1769700442; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uW1V+s7u+HNdPobCVun1IWQC93ofS9yzbEBz7pnkFw4=;
 b=c7CMXPqyLasKAABHIh2xZONZpWH4uNDswHYIP4VfXbV9+fAl0k5pttjJ3aIDKLSNJ4
 7291mb7pBdwNOQDT1oMIXNcYdhAYX7+sXnet27ye9baiq6E+CX9AhY8eyB5bxpvD4IBX
 aHw1bLxmiBSDLH32r7YyD/9i+ndYpjP2QSl/G1p7nYUYnPOdLGeNL2A5C6UL7bua1fxg
 vT3Wi5JmLHQVLAQAGVNRC6+YSjHojpGlqXnVmEnc7gJyq8ZMA6lSAXdakJitldz+zMV4
 dpfPtu+Z5TXMO0H0t12c8AqGmtMwAbl/YRsO87fYFGLVQEv8gRZr8sReKdICu6uMFeq9
 3DDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769095642; x=1769700442;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uW1V+s7u+HNdPobCVun1IWQC93ofS9yzbEBz7pnkFw4=;
 b=AhCfnJ6s8VkF8KnsDQ/NvlFPf/XqzUhqLT6fHc17bpGpTOlQOtK7pxQDu+NUMFvqJs
 XqE2MvJ5IvJhUkJMHqv5h/Ezc5WL4jO1GPfw52TaqRJZHU4lsjRL7VZ82mhfDyBgmHjS
 hoT0lJaJDS8inL+47BHVlkOYG2ygMMTmofSQ/mu4S5+VWoWOMXUb8gvx5GH6wQ5vl3AH
 wM2MgKEKLiF9nosujXPf9ntX5MnQrxR6aIA3QbClVcEEye+i5KhRiIm0hrOlXLRRbZcy
 Bawl6XxNKHcWTs6d3exW/A0Xwoy1GMpI5IUPx4PGDImePMq9JzQv1/tfaVdIbPOlmCdt
 RJhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMUKWuvJO0TS1ky2WJ5z+5EOpD7BwIVOckqDqXnG2A4O1zw3iLL67COXI6x7pqglhuFXNT88tjg==@nongnu.org
X-Gm-Message-State: AOJu0YwovpsWikRSoZLKTzK/0DU8qQN2JLSAx/E0cx9CMEfCMv9x9b2g
 H+pBTNcGe/IOWEu3wJ8kX7s9NwDlbFhbYPnMtH9no+jAnjJZ8b9iA0lyF/9GaG9sxYIwMGhMBID
 qy6SbB5U=
X-Gm-Gg: AZuq6aKxR9ESiQZ7SN8PtUNT9lUscwD9sHL+Xos57s9Sf0ozV7wH9+r442jsuwn/wIv
 cmLiuSREXEvr9pXJpAjsEggNxDHRtjfddVGjwYtOdRSynveNz4n77y1zDwBG7on7XLD6wt31tjA
 jRo3jZ7MaJrTwMizmw/WVR2yAIszeHOuLCbI/rPRIddqNvxWsGqFdcaK+kJO4Ks2L1dT8n3zth3
 Sw78KlbKrPTa65vbPxFaTeDodB02S3ul6K8xwIoOGxjZ2GEkks9YLghSjsFYgOusxXsM70qiYPa
 lJFgk0kAXSXwjTSZ1hCFA4tkBvEYZYXDnl8mTw0az3JJvMDzZjvLbx9U4Kp/RbNIb328cQaRWMF
 7H7NMnXbn8QPdDSFkfkMGSnIRALO38iNj5SmFOFHqT5TUaQMmeT6XAvDZrp/kKHsoI1TQQFzXDG
 Xjwbw3/IcEmfRHbqTL4YRSXHAw7k8kHu1qjRjjU3Ck6HC5tkG8fV1QIVYEVPVuHFRP
X-Received: by 2002:a17:906:9fca:b0:b87:8c1:1ea8 with SMTP id
 a640c23a62f3a-b8831b1663cmr277509066b.7.1769095642275; 
 Thu, 22 Jan 2026 07:27:22 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b879513e735sm1732809866b.13.2026.01.22.07.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 07:27:21 -0800 (PST)
Message-ID: <873bf43c-0559-495c-99d3-6bc0ee39ac6e@linaro.org>
Date: Thu, 22 Jan 2026 16:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] hw/arm/virt: Don't use vms->tcg_its in
 create_gic()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20260120180339.1416328-1-peter.maydell@linaro.org>
 <20260120180339.1416328-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260120180339.1416328-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
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

On 20/1/26 19:03, Peter Maydell wrote:
> The create_gic() function needs to know whether the GIC
> has a TCG ITS attached, as it should set the "sysmem" and
> "has-lpi" properties of the GICv3 only in that case.
> Currently it does this with
>   (!kvm_irqchip_in_kernel() && vms->tcg_its)
> which implicitly relies on knowing that the only case
> where we aren't using a KVM GIC and we don't have an ITS
> is where we suppressed the TCG ITS because of the
> board-version-compatibility no_tcg_its setting.
> 
> We can avoid direct use of vms->tcg_its now that we
> can identify what MSI controller we are using from the
> vms->msi_controller field.
> 
> This means that the only use of vms->tcg_its is in
> the logic in finalize_msi_controller().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

