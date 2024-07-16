Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp49012njk;
        Tue, 16 Jul 2024 02:22:18 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVJ/HUPaHLWRr9shu3NvSWM2FWUU+ImdQsvRF4u82vRchE1IvV6CiiICw2nbPf4bR+iS8ANSGJ6dp9gUWIQeGwK72A5ILKx
X-Google-Smtp-Source: AGHT+IGN8uEcOW3fFXiE18XXnG08VPQxW8Y6wazcOq+oJvNM9Mdz+kMN6Vi6NSt6yz8/VYRX8HGS
X-Received: by 2002:a05:622a:13cc:b0:447:e786:3f9b with SMTP id d75a77b69052e-44f7acf1f85mr20703741cf.49.1721121738464;
        Tue, 16 Jul 2024 02:22:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721121738; cv=pass;
        d=google.com; s=arc-20160816;
        b=UbeKJ1tLqRfsF/b/EfSXsrETHYu55DTfsDkx3ggK9bUPh2YFmdMvwu4pVnQyepnAQZ
         1t6vPfaF07NERsPWQdoxBGCrPYmTZXci3Ily7PZy1DJ50uEeVNu41f+/AlYmASHeZURE
         5ne6pX1P1Ly22ycTW+dTDpB/9/7FKPyJwpFJyaN09swrtyByOVKyoCRDxhn5Wls4bYWa
         mappyz8NOP7uUXUmtecmBDjRthPFS7MgMosMEwEtXK1pP2U2hNLZ9rqtzdZTMPoN7IKU
         VEZGIl8InuBrkpTSEnCtVM6GDrnKoIVYENHoNBkhOi72iS78dJgXuGK05MNluZPLfbpK
         CIMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=UqGtqsf1B4cToMHFdDFjCfP7fcLn3bLanhmec2hX5KY=;
        fh=fShv9nIQ1BPHAb9o3degkqzQOS1eJWOc4SsGimvoha8=;
        b=oTdWavKNX1lFzuVssgZRtbyMAoc0qMHAD99Dn+6cKszn7OyWG9pM0lyzCsB2CVCGWI
         F05J5Lo4g8jcFmpL5vL2UMLaACgiIsSsC1MLG4aYpKS8IhJIuDzNQjBsmru55O4qwtPr
         qIDyf9Vu0qElNq27CTFFJvaG+phBuzWN/il59m2sw/LoY3ue1X1MAkqI4utLD0YW7QJh
         S5P9gD/XS6ISeVBPRyLh960R9TkFpb5jucTlGA1g0AoqeQUJOArtuZDAEjmj30CCGMfy
         kSBF3jZkW2vPS1ohHdJR7f5X987/KwhqJcEGOXo+LfraZL1c3i+j4lv2e7sJ75vHVpJA
         KCbg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gY71H2Z2;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21695-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-21695-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-21695-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b814217si70304851cf.625.2024.07.16.02.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-21695-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gY71H2Z2;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-21695-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-21695-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05A001C21FB1
	for <alex.bennee@linaro.org>; Tue, 16 Jul 2024 09:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D29C195997;
	Tue, 16 Jul 2024 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gY71H2Z2"
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755735FEE6
	for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121734; cv=none; b=EdiHony8WGdns1IBV+3bZJm6/+ZSEkRqQ258raYbCvqnGnhKE0miIYia7TQXDVz+z3Jvr0AiENr6yjoNMyQ6Qich9FtSh6yVL2tJwl+h83ozA3RItGJLzbpUN/BHAUvQsJ3M7I+y/Df771EHUbF243m7iiTzNMsyuq4jSCG+pTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121734; c=relaxed/simple;
	bh=bAFKbzTZdFjRss7SIj2UgDutQ+r+T9amcayFbp0y4yA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8OpB1JbMtShpE7lPZOTv8cmCeieeX4k4HSwFB1I0V0s4T4HxT1LYlYOxxaWP3l6cSfSTusz3CAx28SC4KBfyaEzQtPUZF7QPoTWfXmObzBZUyvxiGzNmbs5wn3fpYKRi+PXaxBvq34yCyfyUttKx6sDRW8ySrh3QGvudUmFpl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gY71H2Z2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-427b9dcbb09so4259375e9.3
        for <kvm@vger.kernel.org>; Tue, 16 Jul 2024 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721121731; x=1721726531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UqGtqsf1B4cToMHFdDFjCfP7fcLn3bLanhmec2hX5KY=;
        b=gY71H2Z2f6TKF18i0t3fZigc9+n1Zo+T5PLmsQIq1jdc+wk1y3GiKXtvr1xv7J2a5V
         oZ+yIUH0lMSR6hPOxTUG7k5Ksx0GVSVvIUnY+LJj0+IIOltq/hy8iGnrqKgktp1DXRlN
         A7fA8puVziTu5VbUmsB7T6g60DafQgRfp56O8+kRveRRINDmjuvzmiE0228wSnAMxlDI
         Z6rWlN6FwbhknJaWNzAQv873qILiQgotqefIzUk6CtlEHUYYFr3obCFuiQ9nJ08LRbuf
         pE3Z9kLbMcVQjPC9qJYdxioxPcj70SaPL9GPrgu+SZry5Aonw6dBRXW7ENfN5xArHTRk
         QMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721121731; x=1721726531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UqGtqsf1B4cToMHFdDFjCfP7fcLn3bLanhmec2hX5KY=;
        b=mAL9hWx11KA0vwXxQvjTU7L2+75d4/OBjV/l+R/xVHIMbsKx62vEquyYyiWu466hET
         d9Jy9OKVC1yexrs0bifi4FpRu4KwHdCSSh8MpIj+RNwJIUNe3ws7iK0Z+vsdj3LCAKHG
         elHYwyvXspBNhXqereMnmMCYp/7HlS9JgZkMPI6LohEM+TFP9uXxdpAjUEJMqYzwHpTJ
         97wDzmQxhOiVk8666M4pzeHjpaEjY0mkixLckg4xAg/aG3DHWvH+5zTEmwpwSvOT8bm6
         /kxUY+kPhW3r0NLHT5kAKkkxpgK6DXQ6Kb0jaWmDoOwJtXfu6wLEwnPFBew6GeXvYbga
         kH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXE+BASIfMl7ZmbpiBzVNRsJzhUQ7GzVkhQpeHZoFiuRpi14IOButMHaxPHtE2h5gfnUlygHt96RMugxq83uocVCybs
X-Gm-Message-State: AOJu0YyVEAa4Iks5CnWRFZ/kL+sQGSiDjThiDNh7pTarqtcuGo1/Fxzv
	ADjPZ3xctbI/SMp0mEv9V5MBfcsaoMr47ELFwsfkVhT+dwcgnpxIzxT4+ikNmHA=
X-Received: by 2002:a05:600c:4e91:b0:426:6ad8:3e3c with SMTP id 5b1f17b1804b1-427ba69694fmr10792965e9.17.1721121730865;
        Tue, 16 Jul 2024 02:22:10 -0700 (PDT)
Received: from [192.168.86.175] (233.red-95-127-43.staticip.rima-tde.net. [95.127.43.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db0481fsm8416913f8f.106.2024.07.16.02.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:22:10 -0700 (PDT)
Message-ID: <3ef05b2b-06da-40ca-9344-2d5a8cdd6dba@linaro.org>
Date: Tue, 16 Jul 2024 11:22:06 +0200
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] target/arm/kvm: Report PMU unavailability
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Wei Huang <wei@redhat.com>, Andrew Jones <ajones@ventanamicro.com>
References: <20240716-pmu-v2-0-f3e3e4b2d3d5@daynix.com>
 <20240716-pmu-v2-5-f3e3e4b2d3d5@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240716-pmu-v2-5-f3e3e4b2d3d5@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: tV19g6phEN/M

On 16/7/24 10:28, Akihiko Odaki wrote:
> target/arm/kvm.c checked PMU availability but claimed PMU is
> available even if it is not. In fact, Asahi Linux supports KVM but lacks
> PMU support. Only advertise PMU availability only when it is really
> available.
> 
> Fixes: dc40d45ebd8e ("target/arm/kvm: Move kvm_arm_get_host_cpu_features and unexport")

Commit dc40d45ebd8e only moves the code around. I suppose you meant:

Fixes: 929e754d5a ("arm: Add an option to turn on/off vPMU support")

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   target/arm/kvm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 70f79eda33cd..b20a35052f41 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -280,6 +280,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       if (kvm_arm_pmu_supported()) {
>           init.features[0] |= 1 << KVM_ARM_VCPU_PMU_V3;
>           pmu_supported = true;
> +        features |= 1ULL << ARM_FEATURE_PMU;
>       }
>   
>       if (!kvm_arm_create_scratch_host_vcpu(cpus_to_try, fdarray, &init)) {
> @@ -448,7 +449,6 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>       features |= 1ULL << ARM_FEATURE_V8;
>       features |= 1ULL << ARM_FEATURE_NEON;
>       features |= 1ULL << ARM_FEATURE_AARCH64;
> -    features |= 1ULL << ARM_FEATURE_PMU;
>       features |= 1ULL << ARM_FEATURE_GENERIC_TIMER;
>   
>       ahcf->features = features;
> 

