Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C83C87FDB
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 12:57:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulS4y-0007CO-He; Mon, 11 Aug 2025 08:56:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulS4t-00079Y-5c
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 08:56:39 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulS4p-0004nk-Lh
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 08:56:37 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-459e1338565so40516965e9.2
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754916993; x=1755521793; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3IzeKSsDvwcVuxZCnwzdmJmsEOeOgsCi4NHxCboYXTI=;
 b=vYEt6HhOW6AA44kTiIxZJ02YZhiqAx60kWg/OCgJr+6ie+4bVdrBQd1CkVJWxmtlsH
 4jFtwrN3Lz8mBAAvNla5yiotxDLHjZ9MWhJE5CfR8b/tcuHaUq+SGpBNbVZEsGqJzity
 Gyaai0nu/NCCVQMhUkjLVOF04toZlrASoFtFex32Y5Q3eR2jCWK/A1jkTzO0Xktq5Jpq
 E1Bf4ZPpe3mq6rMKt3VkE0XD3/OMb4NN3y3YLdgB+EqryHEThQyGjOS8vq5DejUxTt4H
 tha2J1ko+x6ye8JPHFniCGsWn/rC9rTY7u8SLsQNQ/HQF2jOWcRUWXI740eUT9Ym4F3X
 pvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754916993; x=1755521793;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3IzeKSsDvwcVuxZCnwzdmJmsEOeOgsCi4NHxCboYXTI=;
 b=JsmmVZEkHY276ON1CRIzsffDdxEzrgIALjhUoezvSxeassm8OKMhT8gKsKe4DBlT3w
 GY7EjElNsRlX5nRFFPcrfwvlOTyYNgraVhKJoSAcEYPNk6iyx0jEAdjXd7jT1CGNbdHn
 fFNkUyr6VH5t3fFtS9irhW23RP+lOnpMwppEUKyqd+rlRBQKOMR0qWYG3RS7LY3miLRF
 j5jDWIpKF2iDUnDrP7Blj9B26Ewu1FGJonDr12qmL0LWDUczP06QYdJ/+pPnU1m3BQH1
 fNbU3BjuK/NYBNaOgj7eTHfrts00rIEDWJL+IA+bTTJqN8KdapmPvdenrzOODl0G2TP/
 Wf6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDA1aEBPORAYmciCBBXxYchjiQ/j54Z2zzfisS/tq9hfI5praBZC8lg9YmWOJmQbGw+5MwMjj4bg==@nongnu.org
X-Gm-Message-State: AOJu0YyLyb97I4hXi1RlT/U8upBhrwhSHKsyMFbI7WmWqmze3hYZNC8p
 u1R7tlOw8X7EcZzvm+M/IfbE3TrNcftfCvwPrnUkOiGUrW6Di3lonuz3gLvjD3IPYOI=
X-Gm-Gg: ASbGncvJDgdeH2u67NZ11I2vYThDwSkhAA2Jp9IFY97pWHQP3GzNL3I1haAvAz9eZat
 Sd85B5v51911F72iNFDdyl2tb7plh18ZVr2ezJUlQqBBSJ71ehN+XvuT/DwVpEonQhYSix5nxX5
 Eiju7C+a+DyGgXWYQw/4GHvdWvTHOJIEZOeMKgtuwxgbkUzZjQSeGzl9clOew0C3KB7OLYt46qT
 fbyuaxZSuxy5yXIr29wXtkeBim4faSYSiiMNbreCQfTkq02R8HnmbihzjXfc5QR/gk8Vfe/aCee
 EddE3YIFmy+xw/vqRQIuH38qJTzqTEC2QtiuPd5mEtwZ4snR0D+zNh/yqedeZdrv1D91vSxXgBE
 2kUmVond4PQZtrGEMzMQMmbjPMmWA+TcEM2XvLufDBo5bzlt5FfJl2Q4xtur2aSBV3Q==
X-Google-Smtp-Source: AGHT+IG9SlNOIjwY5cZoGOORhIC8hUXNVwhDy0Iax/YEo4FVFTRoD+RWxltwR5Zly112FaSmm/lgrw==
X-Received: by 2002:a05:600c:1d09:b0:456:1bca:7faf with SMTP id
 5b1f17b1804b1-459f4f04237mr118065015e9.16.1754916992889; 
 Mon, 11 Aug 2025 05:56:32 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58553f8sm269774835e9.14.2025.08.11.05.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 05:56:32 -0700 (PDT)
Message-ID: <caeafe09-4c2c-48bf-9f46-f6e739931b26@linaro.org>
Date: Mon, 11 Aug 2025 14:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] hw/arm, target/arm: nested virtualisation on HVF
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Igor Mammedov <imammedo@redhat.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>,
 Mads Ynddal <mads@ynddal.dk>, Cameron Esfahani <dirty@apple.com>
References: <20250808070137.48716-1-mohamed@unpredictable.fr>
 <20250808070137.48716-6-mohamed@unpredictable.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250808070137.48716-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 8/8/25 09:01, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/arm/virt.c         |  9 ++++++---
>   target/arm/hvf-stub.c | 15 +++++++++++++++
>   target/arm/hvf/hvf.c  | 41 +++++++++++++++++++++++++++++++++++++++--
>   target/arm/hvf_arm.h  |  3 +++
>   4 files changed, 63 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 59e6c2b9df..91d8cd9363 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -817,8 +817,7 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>           g_assert_not_reached();
>       }
>   
> -    if (kvm_enabled() && vms->virt &&
> -        (revision != 3 || !kvm_irqchip_in_kernel())) {
> +    if (kvm_enabled() && vms->virt && (revision != 3 || !kvm_irqchip_in_kernel())) {
>           error_report("KVM EL2 is only supported with in-kernel GICv3");
>           exit(1);
>       }
> @@ -2281,7 +2280,8 @@ static void machvirt_init(MachineState *machine)
>           exit(1);
>       }
>   
> -    if (vms->virt && !kvm_enabled() && !tcg_enabled() && !qtest_enabled()) {
> +    if (vms->virt && !kvm_enabled() && !tcg_enabled()
> +       && !hvf_enabled() && !qtest_enabled()) {
>           error_report("mach-virt: %s does not support providing "
>                        "Virtualization extensions to the guest CPU",
>                        current_accel_name());
> @@ -2553,6 +2553,9 @@ static void virt_set_virt(Object *obj, bool value, Error **errp)
>       VirtMachineState *vms = VIRT_MACHINE(obj);
>   
>       vms->virt = value;
> +#if defined(CONFIG_HVF) && defined(__aarch64__)
> +    hvf_arm_el2_enable(value);
> +#endif
>   }
We don't have hvf_arm_el1_enable(). I think we just want to always
provide the most performant configuration to users.
IOW, we don't need hvf_arm_el2_enable(). I'd just always enable EL2
(if supported) in hvf_arm_get_host_cpu_features().

