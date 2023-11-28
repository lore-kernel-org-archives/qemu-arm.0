Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1675840ejt;
        Mon, 27 Nov 2023 22:47:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjZ25CuR8OPQ675yFvBENMh4iXfrePx1lVEMunp5cNEHdNgHksf4DCRI7bwLUf+v4X7z2s
X-Received: by 2002:a05:6a00:22d2:b0:6cb:a434:b58f with SMTP id f18-20020a056a0022d200b006cba434b58fmr17459643pfj.33.1701154024390;
        Mon, 27 Nov 2023 22:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701154024; cv=none;
        d=google.com; s=arc-20160816;
        b=kW/Hfp8HoNVDb1AxTy26lztQs9pVnsFJ7xy/ysiV6V0Td70kZkmGtlcYm0c/CtQYvD
         LonANO2dItX2PLh7U2tlvF/C35tElJVo0uVZMElmiiUEN0Eh8SCwk0+SuQH1Y8ktX97B
         pKrehTserkiwonkOZE5nfhQlWOOfWW5uaWl8W+CcYvOmkZXa9YuNE7JNxDRyf3RD2zDC
         Qt6Wqym2BTFxDf+D3+75FKuYBzAV0Lv1ec3gn1dlGeoSGXk82YY1R3+LdX8cD48VdYSw
         pkHZyTLVQHf7PkkXj+u19ttJ3MT0inV+lKnmBqDqX+qu6yrD8GOZ1bPpwE4/gWB/efNW
         pOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=h0PjY0WHoOlgCesy1ZAomc2Q7r4AO6iN2dgUweHV9zw=;
        fh=bSdKczXfPAZsHL9O8g10+6BPGqINPfNwd1v+TDNL99c=;
        b=CcK6daZveCYshsXQy5Yq5Tz9j0jje7QSOsILSQgDPk+Axx//Q3anq6+/rU3xEeiTPt
         FxhkxKrDsD3Fb32DIjWVRULwrvPiIkRCGPj7CBuxTorI3cyHXn3spHtyVar5lzms68ZJ
         sV0tQIzc42J829vT6ZPcqe2GdLKbcY4I/fTO1//CJF64smRGBVONiL3ZxRCJHuoDWUyg
         dEWI/ypV8kd73bc+GIKylqnuXr7+cAY65MNk8wtaPh4kD18tI06zi0QhoFdYlNz2r2Da
         KCWqNN2nesEehIkoCyJmCaSX8zOWQO/IjaEyVxfAeYU5CEX76B4MZHptPoJtYq4yep8Z
         vV9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERmBQKHB;
       spf=pass (google.com: domain of kvm+bounces-2558-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2558-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2558-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id m21-20020a056a00081500b006cc0219fc85si7983703pfk.252.2023.11.27.22.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 22:47:04 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2558-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ERmBQKHB;
       spf=pass (google.com: domain of kvm+bounces-2558-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-2558-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34BAEB20FB5
	for <alex.bennee@linaro.org>; Tue, 28 Nov 2023 06:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464C9CA73;
	Tue, 28 Nov 2023 06:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERmBQKHB"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A901BB
	for <kvm@vger.kernel.org>; Mon, 27 Nov 2023 22:46:53 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b397793aaso22581245e9.0
        for <kvm@vger.kernel.org>; Mon, 27 Nov 2023 22:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701154012; x=1701758812; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0PjY0WHoOlgCesy1ZAomc2Q7r4AO6iN2dgUweHV9zw=;
        b=ERmBQKHBkt1Ub5RqNPlAoCDwtF/2PFH89G1XrDH71bDht4EeZGm11mzMaRyVvGgCie
         sbYHwgVHoPKishgnCaTvC8dYEjukva8kPxS5LRNgf6J7NlRyDQdCxQd1xRCBNefkiePf
         9KVzD6vbp+K1sPybRRKVmdOiZjfY1a6xbB4BEGtdnuF+Zx4Q9WzAcymVrpwVTcNbQZxg
         474CGK7JIwUIXDaCtGEFMa4ZZ9KhxLhNELbUL2sNziffs0p4J+p1bqiEiPlwVKul0VYS
         YSoYjiw7mD0BT7Cn0OzSFamiUJpMQv/E8YzVnUmkmZrqTE7SDWH447DYvskVJ7FRhmCq
         bL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701154012; x=1701758812;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0PjY0WHoOlgCesy1ZAomc2Q7r4AO6iN2dgUweHV9zw=;
        b=hudIMMut+kEaScYCLHFeHPQ9C+JaEzioe7zBBeD+6yLesLZqJMaSdelcX7NpyIPIZS
         BV3cs7s7tGCaGZ/oXAvAeAk+63FcbaIH7i23/t+5UyX6tJYdgPq3UejBVzP5FV6hbZod
         OZPIfweT+/5eldl2Rc6IkQ+eMxa+hrzYgGhT+dR+eXeoAi5HnVU04ANhDMENLHvi2Z3a
         orvhoeRyAMIlZYETqk6H1o0xa/UG//hrMo3PptFyJqIrY3wbRwEYYMAHDg9Jk+NoHIv2
         z+pAiDf/eSgSFbhjq9Fj54x4PKZ5KcynHtIQLVzEAt/dwq83xx60J8LcY+npLBxjM6/N
         a54w==
X-Gm-Message-State: AOJu0YyV8eYfrlt4DcbVlQohu6ZeYdpw3BL28L0A3VYF0LD/VU4IFmYe
	rvdlXBLZuMqHUZbtVsJN2iEuWhVBizxca9IahsQ=
X-Received: by 2002:a05:600c:4f86:b0:40b:305c:9c84 with SMTP id n6-20020a05600c4f8600b0040b305c9c84mr12036325wmq.12.1701154012110;
        Mon, 27 Nov 2023 22:46:52 -0800 (PST)
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr. [176.184.13.61])
        by smtp.gmail.com with ESMTPSA id j8-20020adfe508000000b00318147fd2d3sm14027125wrm.41.2023.11.27.22.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 22:46:51 -0800 (PST)
Message-ID: <f9b24c09-547d-4590-9b73-9c5918ee022c@linaro.org>
Date: Tue, 28 Nov 2023 07:46:49 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 08/16] target/arm/kvm: Have kvm_arm_pmu_init take
 a ARMCPU argument
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-9-philmd@linaro.org>
 <802e9dcd-68d2-4c38-95e8-fe99d46b911f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <802e9dcd-68d2-4c38-95e8-fe99d46b911f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TyQS33CeBOY8

On 27/11/23 05:20, Gavin Shan wrote:
> Hi Phil,
> 
> On 11/24/23 05:35, Philippe Mathieu-Daudé wrote:
>> Unify the "kvm_arm.h" API: All functions related to ARM vCPUs
>> take a ARMCPU* argument. Use the CPU() QOM cast macro When
>> calling the generic vCPU API from "sysemu/kvm.h".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/kvm_arm.h | 4 ++--
>>   hw/arm/virt.c        | 2 +-
>>   target/arm/kvm.c     | 6 +++---
>>   3 files changed, 6 insertions(+), 6 deletions(-)
>>
> 
> One nit below, but I guess it doesn't matter.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 0e12a008ab..fde1c45609 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -200,8 +200,8 @@ int kvm_arm_get_max_vm_ipa_size(MachineState *ms, 
>> bool *fixed_ipa);
>>   int kvm_arm_vgic_probe(void);
>> +void kvm_arm_pmu_init(ARMCPU *cpu);
>>   void kvm_arm_pmu_set_irq(CPUState *cs, int irq);
>> -void kvm_arm_pmu_init(CPUState *cs);
> 
> Why the order of the declaration is changed? I guess the reason would be
> kvm_arm_pmu_init() is called prior to kvm_arm_pmu_set_irq().

Yes, exactly. Not worth mentioning IMHO.

Thanks!

Phil.

