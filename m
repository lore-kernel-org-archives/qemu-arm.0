Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F334FCD484C
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 21:55:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJImw-00037y-C1; Wed, 12 Nov 2025 16:54:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJI3v-0000m4-Bc
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 16:07:31 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vJI3p-0001rK-Tx
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 16:07:31 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42b38693c4dso49194f8f.3
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 13:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762981644; x=1763586444; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ndvKFCJtXmZXWNjsWlnfM9pmpLT2hMmXPRvFvrdoK9k=;
 b=YlHkoj+gqamG+NyS4lEHQbC72PVQR2ADAIFIHBHYyYondHN3ccREX/kAXO0aWpxZ2Y
 8s8a93v7GUj8WoG1x8nUUArH72P5zm81buKoRXP2GFOtrc8OKroSj2cR2G5JfiYw6cHO
 vASWLw4DROlZ/FgainN5lIgeiDXztbxuP/surhy6uGBoppFt/wlCW7GvqycZ1XmQ1cFa
 eWpK29XqrFz4RJHTCPT4KBfpVENG7YOyCWRLIB5RKfhKmPSdyNtr8U9VurhLPsHmFOep
 ULeTYjCJZ0DwYN4rh47Xz65JMqGCaibGnR+vfUW5KKe0b48JML/rcCMQtpZ3YRWEki9U
 c4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762981644; x=1763586444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ndvKFCJtXmZXWNjsWlnfM9pmpLT2hMmXPRvFvrdoK9k=;
 b=NC4cFp5VZM4VnXhitZCKGjMVs0qrZMY2jSoiopDHJHbjCKA4ts5wAySBdrU7e5ZeLu
 rbkvveNMk/FvCazR0G66EuaqCYDXJ1M+brxJFQmftHKfDLwdzmbcm+iv25vmE39Iv3Bc
 hJHuqfV69YWBIXgB7f+iNGZjqkwx/5xb2TDZyRMSEMvuWK6sS+99pLSaIU6SKG21Hfo5
 /4aV89MTIr8t8cKlE2eXXxQZ3ST8a9cXtaJAeThjIEMRfoDZny4+Vak0DFTBocxfzway
 M1tiKYS0WK3zPyPIGBy7fallVrlF1QaQYFCzJpdSYwOaXivFnk0OAF785pPgdVQrM+yr
 v5AA==
X-Gm-Message-State: AOJu0YzPxLxOIJODqf6d0l8ke3I6gu6G5961tYKvj3U7MMkxUeOimNRt
 2G4awfAbYRDds5wenDA3kVee+jdJ+whsBqr307WG33li/zRZFethC5UmlwSq6j65Yio=
X-Gm-Gg: ASbGncs8+mG5P0Z10y+t6xyzrGgTQFhsK6NKzWRuaAv+o6qtkbM75aF2Jmn6BNuSV7H
 dDYCBE5qsHuaaxmaflnRaHCip+cA5IMNzPJTRibfD5ogWkgucFe+Doah7HB0cYFLljClk17VTVr
 OvgDtwMwBCM2mHVyFqMVdbU5MEWyK2YTswEZH46xMEl9Puptiq9ZyOV/xpD0cIwFviI0jhcZt2/
 Aa+Nm4ydzADSmD9hA6opJotcoaG+n5VsqC5/s91vR8pENwf5qG7onmrDZhlUskO0oc0c07XaMlS
 73k5QQC0WumJlmwukNbUt4zc2IvUK/pNZS8zvKrctV+6El2V51gQIdvjJiGBqWGwpnjYScntiSD
 dQ+ZVu7Na20oN1h+gJVSu4qntMQI7JQGPFtMmTL3niblbnSOYyxEtQQjIYc7HXb4EoFwUF+8AHL
 VN/uqlSArJhC8spg+ZQMIsrlYgkEVv9BSJWYTL/77H408=
X-Google-Smtp-Source: AGHT+IGtaSx6QtlDHy/EycHh0/ZhW1Mmm/5WCyQeOiw9mC05LvLWss/kOLCaCs1PZ52vi6bPz95ITQ==
X-Received: by 2002:a05:6000:310b:b0:42b:3b4c:f411 with SMTP id
 ffacd0b85a97d-42b4bdb06f1mr4248875f8f.36.1762981643683; 
 Wed, 12 Nov 2025 13:07:23 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b2e96441dsm28506596f8f.23.2025.11.12.13.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 13:07:23 -0800 (PST)
Message-ID: <d4f17034-94d9-4fdb-9d9d-c027dbc1e9b3@linaro.org>
Date: Wed, 12 Nov 2025 22:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] target/arm/kvm: add kvm-psci-version vcpu property
Content-Language: en-US
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20251112181357.38999-1-sebott@redhat.com>
 <20251112181357.38999-3-sebott@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251112181357.38999-3-sebott@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Hi Sebastian,

On 12/11/25 19:13, Sebastian Ott wrote:
> Provide a kvm specific vcpu property to override the default
> (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
> by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
> 
> Note: in order to support PSCI v0.1 we need to drop vcpu
> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
> 
> Signed-off-by: Sebastian Ott <sebott@redhat.com>
> ---
>   docs/system/arm/cpu-features.rst |  5 +++
>   target/arm/cpu.h                 |  6 +++
>   target/arm/kvm.c                 | 64 +++++++++++++++++++++++++++++++-
>   3 files changed, 74 insertions(+), 1 deletion(-)


> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 0d57081e69..e91b1abfb8 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -484,6 +484,49 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
>       ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>   }
>   
> +struct psci_version {
> +    uint32_t number;
> +    const char *str;
> +};
> +
> +static const struct psci_version psci_versions[] = {
> +    { QEMU_PSCI_VERSION_0_1, "0.1" },
> +    { QEMU_PSCI_VERSION_0_2, "0.2" },
> +    { QEMU_PSCI_VERSION_1_0, "1.0" },
> +    { QEMU_PSCI_VERSION_1_1, "1.1" },
> +    { QEMU_PSCI_VERSION_1_2, "1.2" },
> +    { QEMU_PSCI_VERSION_1_3, "1.3" },
> +    { -1, NULL },
> +};


> @@ -505,6 +548,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>                                kvm_steal_time_set);
>       object_property_set_description(obj, "kvm-steal-time",
>                                       "Set off to disable KVM steal time.");
> +
> +    object_property_add_str(obj, "kvm-psci-version", kvm_get_psci_version,
> +                            kvm_set_psci_version);
> +    object_property_set_description(obj, "kvm-psci-version",
> +                                    "Set PSCI version. "
> +                                    "Valid values are 0.1, 0.2, 1.0, 1.1, 1.2, 1.3");

Could we enumerate from psci_versions[] here?

>   }
Thanks,

Phil.

