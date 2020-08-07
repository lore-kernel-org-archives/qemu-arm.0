Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2432738lfy;
        Fri, 7 Aug 2020 01:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX6Jmu5cYwUTkM84Csx5F6AXAFWD8LvucdMSkOgurEo+8H8tjsRJMn1HciniLuqPF98Xeo
X-Received: by 2002:a25:d702:: with SMTP id o2mr18399521ybg.379.1596788566946;
        Fri, 07 Aug 2020 01:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596788566; cv=none;
        d=google.com; s=arc-20160816;
        b=w6uwCeoviY97JXBAKjBqtopIBL9ezeJWUHC6xuJbB6a3BOpymL+1ddjujs8V/UUcGm
         TqZJFoQ5zVf0I1H1dQOOI8iKGbFo7tIyhRFbdeAQq6mxouNyvE+jttAMoO0TxSjC8stl
         +XBgkFBY9PIIqhbsafm8DDBYkdpsV4eZ4deSU1LbW/cptcPHiQHLdJLLKzRfLAf0VC2l
         GiLqN3A4IIlYInSUm0936aM2Nlj5Av3/BRgQ/2ao6Tm+EzAI/YfvW/M2mGDEtoXyu3xM
         Vw8g7QMMIir8atUjblNoCUF2lyWmUBxDizDklZnL2Evw9BhsZ5XFprkoGHrZsu24oou/
         ynSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=261yakEzIsjQYGiJSqJdvqKWXSx+Gt1B3PJAmEaQsJA=;
        b=H7VJ6SKtd9dC6g9alDc2SsWVlOIai+6nIetCXUpmXI5TPGapyp1sNbNShJmI99DzaH
         k87UMOQqgaxw7FHoKONjFaV7noctRBJhPCGAJ/hY30FIttjvp6NyR/gYYEi9lpCUiMdV
         6oqlV6zn6CCw2xdU5qUNFpSVkkHa9yqqmNpO0Y2/A9il7Bacqu+tzpy25ryhlkfwZ6N4
         PzTyuOoZcUQzr9r7JAXIxQQxbUO2ia5QhZR9RwjrQMdy9BVleUGLI8yFhn1a+sgJDfOw
         tc2gaLZ+woq0ngFmim5450SX92xqe8aIK6FCPGP8mzXeJD5eDG3SrzTXm8wHFZ1k2yOD
         eMFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X7Yt7qOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5si4137059ybh.332.2020.08.07.01.22.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Aug 2020 01:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=X7Yt7qOL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:50586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3xeI-0007nk-CY
	for alex.bennee@linaro.org; Fri, 07 Aug 2020 04:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3xbb-0004OQ-RT; Fri, 07 Aug 2020 04:19:59 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k3xba-0002eq-9q; Fri, 07 Aug 2020 04:19:59 -0400
Received: by mail-wm1-x343.google.com with SMTP id d190so956356wmd.4;
 Fri, 07 Aug 2020 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=261yakEzIsjQYGiJSqJdvqKWXSx+Gt1B3PJAmEaQsJA=;
 b=X7Yt7qOLFoi+2E8OVpsiLF2U5GZyQht1+zoFnULv2OkQ+i6AazYjNP7ZiiFQcxcKNL
 qTJbPyjHfvLlsEJm6lEFgf6f/ySnqpPrUw9/5C2rc0GtTwFyP0zGmuhKfZxL4G+aiJ6F
 yawXy14DBa6ufFCdjrdcVSg6jZgFPaLK6BBovSHhX5gKcworQTQdw+V63S15r2UfniU7
 78V2297UeNcDq0eyPwAgyoY+6+ZUZJDjR1V/BlTnOx8JtC9lQ7GiBayvQskYsL/xerkE
 ERwgjZo9GuwAcUX9AqpJFu91jivGuAreTNGxMtlUvWv6kkCtQsJNk6QGw/MzppFQHS6S
 vvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=261yakEzIsjQYGiJSqJdvqKWXSx+Gt1B3PJAmEaQsJA=;
 b=chBA7ocHx3oH79ebHGIgQin5G7Og07DuBcJXaqQ3v5ahqNOezMuaS6ODnSGAVW92Ax
 MT4mXaRV+35HNfcK04MrMimLD9YkSDGdsO5jn1TLl8AYjerPYlcNQA4yfGrqXe9cwdUV
 E8QFqJdL57CxZI8zxUuCrPaus615mrso6uPqizd9rE2rXfjOgM+QI+WByCKz6YMIjE43
 tZG8Al5RSpGBVwblsoRzRB11yzdexQXuDzhf6F45OKO3Iv7KqFgDvIOJm3G/gTUPkgpA
 rOMTcKG6zhUOx9yWFs9ty+Fj4SJO/PGunlNTSF5fgPK+0EQXA+T2DclEyjOrAMYZX/+5
 IuPA==
X-Gm-Message-State: AOAM531gh6cSMYB+lGEVNjeftFzrOsb15BW2f6FSDHT+FzsN1T087Hao
 aORlbPBbV0apv9+LvoRoaD8=
X-Received: by 2002:a7b:cf2f:: with SMTP id m15mr11441089wmg.69.1596788395435; 
 Fri, 07 Aug 2020 01:19:55 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id b139sm9952910wmd.19.2020.08.07.01.19.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 01:19:54 -0700 (PDT)
Subject: Re: [PATCH 4/7] target/arm/kvm: spe: Unify device attr operatioin
 helper
To: Haibo Xu <haibo.xu@linaro.org>, peter.maydell@linaro.org
References: <cover.1596768588.git.haibo.xu@linaro.org>
 <3cc31df5191ae6b03e060ccd8e82df74416a3ef5.1596768588.git.haibo.xu@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b4790af9-38b7-f74a-4ebc-a7e9d3684ae0@amsat.org>
Date: Fri, 7 Aug 2020 10:19:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3cc31df5191ae6b03e060ccd8e82df74416a3ef5.1596768588.git.haibo.xu@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5avLEKw5zTtM

On 8/7/20 10:10 AM, Haibo Xu wrote:
> Rename kvm_arm_pmu_set_attr() to kvm_arm_dev_set_attr(),

Maybe rename kvm_arm_device_set_attr() to match the structure
name?

> So both the vPMU and vSPE device can share the same API.
> 
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>

Regardless, with the typo "operation" in patch subject fixed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/kvm64.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 1169237905..75a417d65c 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -398,7 +398,7 @@ static CPUWatchpoint *find_hw_watchpoint(CPUState *cpu, target_ulong addr)
>      return NULL;
>  }
>  
> -static bool kvm_arm_pmu_set_attr(CPUState *cs, struct kvm_device_attr *attr)
> +static bool kvm_arm_dev_set_attr(CPUState *cs, struct kvm_device_attr *attr)
>  {
>      int err;
>  
> @@ -427,7 +427,7 @@ void kvm_arm_pmu_init(CPUState *cs)
>      if (!ARM_CPU(cs)->has_pmu) {
>          return;
>      }
> -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
>          error_report("failed to init PMU");
>          abort();
>      }
> @@ -444,7 +444,7 @@ void kvm_arm_pmu_set_irq(CPUState *cs, int irq)
>      if (!ARM_CPU(cs)->has_pmu) {
>          return;
>      }
> -    if (!kvm_arm_pmu_set_attr(cs, &attr)) {
> +    if (!kvm_arm_dev_set_attr(cs, &attr)) {
>          error_report("failed to set irq for PMU");
>          abort();
>      }
> 

