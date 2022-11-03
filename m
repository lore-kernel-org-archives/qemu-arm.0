Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp627329ejx;
        Thu, 3 Nov 2022 06:21:43 -0700 (PDT)
X-Received: by 2002:a05:6402:27cf:b0:462:75b3:a277 with SMTP id c15-20020a05640227cf00b0046275b3a277mr31394642ede.175.1667481703768;
        Thu, 03 Nov 2022 06:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667481703; cv=none;
        d=google.com; s=arc-20160816;
        b=s0gVu5KV/51mkcQFCJLoQHK2mbWp8Z30FpBjecGo/00fJZQUh1ddfZ692KOQ9lzWOZ
         PNpp3sMGgQmpYoY+xdwHpk2dDGfEJ1k9OBpHhJE28Mhwu35XuG73ChwbNdk/KUAEv1Nw
         KvMBcR4KJLH259piv1umAGY+mARBMrm02Aa5M1YdCLPicA4l3A1ooCLRt/WBd8wFnaWR
         9ftenO0tJjtRQXk2XUHQI43OrRW+pGVjBWufYaF236/+1wQ86Siflm1vBIG1nE5vbwH1
         JtFkpJx9SBFMnZlU2tWDublMJwuR5u7G6uoObBLVUMMyQ6yZbZ8qNwkwEy6SrENBeh08
         B+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Fqt6IrIoEvQFvLK2iedyMD5n8Lm8LtznkuxjPwfVgAE=;
        b=MAECWHrpBxDyh8jZkX7R9kyGH9EOnTLiltOkGPJWDEkNDQyix8+gvuaudzQ7I1kVab
         5P+yhDocUWEQucltO4ZC13ln4MTQ7RF2L6I8EwAP2ROGrrGqhnp/fPcBYBhmRGOp7yJo
         DBIwMaj3LRn+WoNI+SUWVw+EJ3Pqrz8IMkzyrqYN2QUnKpxinuYXoExmGpHmVc4NeiP7
         E7+nq4HDZJaESMx5poyYOfi8uwnIvN5pG6uh+U+S21MkPT8M38TRbCJc1wF6fWyxVuRu
         MP3+JTrk+pusISzUiz20zEV7cH9+clx4EnsCkeCV7BiTID6jtCSnveJfmdZwIb68fVpM
         RL+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DpLV5/9U";
       spf=pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jerome.forissier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <jerome.forissier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b12-20020a170906660c00b0073dbab55edasor620637ejp.111.2022.11.03.06.21.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Nov 2022 06:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="DpLV5/9U";
       spf=pass (google.com: domain of jerome.forissier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jerome.forissier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fqt6IrIoEvQFvLK2iedyMD5n8Lm8LtznkuxjPwfVgAE=;
        b=DpLV5/9UKju2XvCQUJVXZW07Z5uEqOjjXOI1bXmo0Tce0u0+mMCkPYzAP/YHnj98pg
         fVN0YEE3Scwmrh1Gsx8lrNod5bIx8QYiGlwDCH625cNPCXiwo/Q+0JVpIogo4816cG3X
         JISQJaEPRU+be6iSfCWPoCnPr5OYTK6GmYNtqhNpjNGll8klCXjImZDIkyy72N+45R1p
         2nbQJ3NnU9t6kY07LKfYbXidatWq0uQvsZ2+8I6BTh+q8vhlg1jILmXpVkR0QODCDDxV
         bQ+qxB1tpHZSe+CO+sWC+7azCfCbQbViRwWe78Te9y9LARyHaEXHpekIpwuyw91R8x5e
         vrbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqt6IrIoEvQFvLK2iedyMD5n8Lm8LtznkuxjPwfVgAE=;
        b=Q/AoPJ5cGwDtwI6lVCmnFshdqjl9Q4JIhWe1eHB24VRO30kGdpmD3c7uQKcGBPyFpG
         mksM73Km6UbuN4mIG9g72BdZ9K/Cac+Yian4+ZlHwjqf7uLYsKSmrTMDbFaiAsE3SO7E
         jwjJtYYD2MrxPpsloiY1Eakebb5GVPc2YWbi9xaNanKveJnRJ+m2tctgHChfAU/eYM3W
         HScpLetzZDZ5O+VsO2jO5TF4ZgHRerL2aAFAkT6DOULJmdOWDUgFJYg3os5SFOkDh06S
         P6gEyclIQvptBzntJio1c7z3QhioaRXKr/K9Va860uicJkMC6jlbF/Hr0+kf7LPUw3jU
         8QTQ==
X-Gm-Message-State: ACrzQf1v0op6CUqcx1qMs75i7UugWLQ6AXIipAh1Ebs9bU1WWhqVTSgk
	5R32tOsF0k17YFQvclsPgTQ7tnL5
X-Google-Smtp-Source: AMsMyM7nuDpR61aYNEOkrZn8qWx9LmLpR2g10U0NIDGjcpWavBqxDG4pYsEkeP/70R+52VEmXnslkA==
X-Received: by 2002:a17:907:d89:b0:7a8:d67d:87d3 with SMTP id go9-20020a1709070d8900b007a8d67d87d3mr28438207ejc.364.1667481703485;
        Thu, 03 Nov 2022 06:21:43 -0700 (PDT)
Return-Path: <jerome.forissier@linaro.org>
Received: from ?IPV6:2a01:e0a:3cb:7bb0:9acd:f850:f866:6c14? ([2a01:e0a:3cb:7bb0:9acd:f850:f866:6c14])
        by smtp.gmail.com with ESMTPSA id c7-20020a0564021f8700b0045c010d0584sm518562edc.47.2022.11.03.06.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 06:21:43 -0700 (PDT)
Message-ID: <bf87f3f0-daa6-b4ec-5510-5e9e802024ec@linaro.org>
Date: Thu, 3 Nov 2022 14:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Possible regression caused by "target/arm: Add ptw_idx to
 S1Translate"
From: Jerome Forissier <jerome.forissier@linaro.org>
To: qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <c6494e10-eab6-039d-7c83-5ba6262c4841@linaro.org>
 <c2b702d4-5db5-a58b-1746-2ffa29ffb2b6@linaro.org>
Content-Language: en-US
In-Reply-To: <c2b702d4-5db5-a58b-1746-2ffa29ffb2b6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: RXlLvA6eCN5H

On 11/3/22 14:15, Jerome Forissier wrote:
> On 11/3/22 14:04, Jerome Forissier wrote:
>> Hi,
>>
>> I am troubleshooting a regression that seems related to commit
>> 48da29e485af ("target/arm: Add ptw_idx to S1Translate"), at least that's
>> what git bisect says.
>>
>> The following hunk looks weird to me:
>>
>> @@ -1263,7 +1260,18 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>>          descaddr |= (address >> (stride * (4 - level))) & indexmask;
>>          descaddr &= ~7ULL;
>>          nstable = extract32(tableattrs, 4, 1);
>> -        ptw->in_secure = !nstable;
>> +        if (!nstable) {
>> +            /*
>> +             * Stage2_S -> Stage2 or Phys_S -> Phys_NS
>> +             * Assert that the non-secure idx are even, and relative order.
>> +             */
>> +            QEMU_BUILD_BUG_ON((ARMMMUIdx_Phys_NS & 1) != 0);
>> +            QEMU_BUILD_BUG_ON((ARMMMUIdx_Stage2 & 1) != 0);
>> +            QEMU_BUILD_BUG_ON(ARMMMUIdx_Phys_NS + 1 != ARMMMUIdx_Phys_S);
>> +            QEMU_BUILD_BUG_ON(ARMMMUIdx_Stage2 + 1 != ARMMMUIdx_Stage2_S);
>> +            ptw->in_ptw_idx &= ~1;
>> +            ptw->in_secure = false;
>> +        }
>>          descriptor = arm_ldq_ptw(env, ptw, descaddr, fi);
>>          if (fi->type != ARMFault_None) {
>>              goto do_fault;
>>
> 
> Nevermind, I just noticed that a fix for this was sent yesterday...
> https://lists.nongnu.org/archive/html/qemu-arm/2022-11/msg00047.html
> 
> master still doesn't work for me though.

Well, scratch that too. With the fix properly applied, all is good.

-- 
Jerome
