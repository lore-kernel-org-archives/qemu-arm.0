Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1677704ejt;
        Mon, 27 Nov 2023 22:53:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj08ctL9/ESGK3I3SRmxcRk8mRuz4lKM0j/YL9+Ho3ZklTYP4q6PA9aKddNxbtba1P7JHS
X-Received: by 2002:ac8:7fd4:0:b0:423:78aa:fb87 with SMTP id b20-20020ac87fd4000000b0042378aafb87mr19294133qtk.46.1701154386182;
        Mon, 27 Nov 2023 22:53:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701154386; cv=none;
        d=google.com; s=arc-20160816;
        b=Znjmb+NvE3iCLhwLoAvQqkuhT+CdjlbKVN0GgtLCWF+wkahJ7g68UtOxBfmwmjUWRZ
         lz1XmuI3rpFWqoocQsrfMvnmTiYEDwRQjcdvNvovXmsDritTeh4GrXhFiMh+lwgPLU4J
         BDkYBUFnQQbvzwkhVEZTuB1/pcPbCDN8hnpiaPKxLDGj4CJ2eMHSE621LIlwrL7upJZ1
         pPQZC5bMkkarKMvI6TkysqV8Gf0KM5++8mXqF14fkbSQQIooqyCRs+l5aSCpxaT1TmFg
         uIuhiTuk6fE2hgteUY61/iE9jajeCnKfhLHH5XJSibzpbaExfwYYHNWI1wfa4cNLKNOC
         5Kug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=oUmo3C1pLShDouWu+ZeJVsUjFrpOVE+VE0tTre6Q9A4=;
        fh=bSdKczXfPAZsHL9O8g10+6BPGqINPfNwd1v+TDNL99c=;
        b=sdXRD2YHUM40sVZeXleP9/CWQMH+CKyPJpwdovtWx04GYiRYGa0XidIEtL0+YsZSdR
         sXqgtC2nz9Q9A7C+C/KeAI+W0FDEWPfuoI76PXYtTdyBmSSsQZb4JNcNpUiJlYuHwRhq
         7riOO6YKe4tvs1j0OS0tQWlms0WeX4aLVz09eocQuCvckQhJGS0mIeHdBz5wBpc6o0fR
         swNBGhu8aQGxSu0EZ/H2x00sGcUQ8wH9Jlbxktphpf3dt2F99cg8y6TJN/D8oBIf+L+l
         aZqMBns3m4LvD+syMGDTHvxo/X5CrCVKuRnP7xVlm6WslUR/zRReAlTNhTSztxD493ei
         G02g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/iR0u3l";
       spf=pass (google.com: domain of kvm+bounces-2560-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2560-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-2560-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 10-20020ac8574a000000b004237f8dec41si10799184qtx.230.2023.11.27.22.53.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 22:53:06 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-2560-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/iR0u3l";
       spf=pass (google.com: domain of kvm+bounces-2560-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-2560-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88301C20A6B
	for <alex.bennee@linaro.org>; Tue, 28 Nov 2023 06:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE867D311;
	Tue, 28 Nov 2023 06:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G/iR0u3l"
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFB67197
	for <kvm@vger.kernel.org>; Mon, 27 Nov 2023 22:52:58 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332d2b6a84cso3462276f8f.0
        for <kvm@vger.kernel.org>; Mon, 27 Nov 2023 22:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701154377; x=1701759177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oUmo3C1pLShDouWu+ZeJVsUjFrpOVE+VE0tTre6Q9A4=;
        b=G/iR0u3lPL43blC73yq0uRwhImhnNW6DUn+Yhho3vz7uauvhZbISXfqHN/SYVKETh6
         cyZi3gPj6hSqgEUncRuigmqcty4locE37y1EbSPsbgevSO4rqOnFr7NBJb617w2MF1kc
         4DkKRVqzH5968DuAV7yDOTppUbJ8cq9T7jG8xYe9QLUt3eshVszYwiAulnfRs1TJL9wb
         u/9b1/GaEYJIW+F8J9/IvPXPF8e+758V+PSzYXZynCI25mEijBfwlVmvEioCv8FLv2tj
         cMz2b/pM8aPpaA7L+oWc1RP+DJmKSf6wBVR1PWDkYTD/ekbULAPXy8dSYpFTb3AtTICs
         A7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701154377; x=1701759177;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUmo3C1pLShDouWu+ZeJVsUjFrpOVE+VE0tTre6Q9A4=;
        b=lfz6W9zQREFCFb8eaV+xp4PGhh67ZZA5ecwApGAyiy7qZdUc5ru00DN+ujiKT318yf
         GHDVFLs28SWQ1KpaVTyFuI2ywl7+DZ5XB6YoTDdVjgF8ljn7i5QIbJp1Zlz1wtIKzTkp
         XFYH3Pf62UHvBDUIfjyAaOCuH38fLGtuMdPaetfOkgdPGQkicr/ddD0ohU2zoXgQsN5P
         ViKXskoQOpO7VNUleV9qmlYeyDlAUD7CDjiMmodBCXm/r21sXz0Eu3arp6+TP6rwq/g5
         8osU+e1+goGyhEnsQLNrUpkZD2v3g+KXbeEIXvxTiwna6ARiqjotN0cTNxAlSON4kG08
         eKow==
X-Gm-Message-State: AOJu0Yz5khjEtgis3SM9PwD0BpttX9q7Fvp4gJmVa8ktVddvrsU5bljG
	o/3+RtW/n366e/bGY6ZNvqjrlA==
X-Received: by 2002:a5d:5273:0:b0:331:6ad3:857 with SMTP id l19-20020a5d5273000000b003316ad30857mr9979882wrc.16.1701154377150;
        Mon, 27 Nov 2023 22:52:57 -0800 (PST)
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr. [176.184.13.61])
        by smtp.gmail.com with ESMTPSA id w27-20020adf8bdb000000b00332e5624a31sm13406545wra.84.2023.11.27.22.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 22:52:56 -0800 (PST)
Message-ID: <4a04694e-f376-406f-84cb-f677ded08988@linaro.org>
Date: Tue, 28 Nov 2023 07:52:55 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 03/16] target/arm/kvm: Have
 kvm_arm_add_vcpu_properties take a ARMCPU argument
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20231123183518.64569-1-philmd@linaro.org>
 <20231123183518.64569-4-philmd@linaro.org>
 <52cf8040-b134-4dc6-b6ce-1d51a3dc13ef@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <52cf8040-b134-4dc6-b6ce-1d51a3dc13ef@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ScxyJgVqYvnE

On 27/11/23 05:05, Gavin Shan wrote:
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
>>   target/arm/cpu.c     | 2 +-
>>   target/arm/kvm.c     | 4 ++--
>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>
> 
> With the following comments resolved:
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> 
>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 50967f4ae9..6fb8a5f67e 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -153,7 +153,7 @@ void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>>    * Add all KVM specific CPU properties to the CPU object. These
>>    * are the CPU properties with "kvm-" prefixed names.
>>    */
>> -void kvm_arm_add_vcpu_properties(Object *obj);
>> +void kvm_arm_add_vcpu_properties(ARMCPU *cpu);
> 
> The function's description needs to be modified since @obj has been
> renamed to @cpu?
> 
>    /**
>     * kvm_arm_add_vcpu_properties:
>     * @obj: The CPU object to add the properties to
>     *
>     */

Oops thanks!
