Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp1040585dlb;
        Thu, 3 Nov 2022 13:30:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM78Hn1QxeB0iXmYKTfbs5lL+6IYBYxYw55KE532T+VUBknP6SmSQi19+txEu5rphCuML3vI
X-Received: by 2002:a05:6214:20a7:b0:4bb:9359:8368 with SMTP id 7-20020a05621420a700b004bb93598368mr28105671qvd.122.1667507456963;
        Thu, 03 Nov 2022 13:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667507456; cv=none;
        d=google.com; s=arc-20160816;
        b=QaBOB3q05k1HWirTBeeewmU3df6m3z97u5EBNSWAZsiRlQ6j7exRbJEfH38YJzJ/el
         rPuIEvqFyiTpXtK41x6/v7YkUYdF9BzjXCcFCFm19zP8D2jrdYGmSax8FbKt2uYx7mPc
         m/vLDmyC7JBUIrkIb9a+AVsG77ldwBGCSrEwjsRnBJYtDoeE3EYV/WTpxSLb3mlLuDjK
         1NNBe68hTBqCFwpm+E0/pvMxItQjQPjgcOgEfBSZHHRnyW74i07UHE5IlA6MvwYPFvTn
         AT7BtpvRBciL2z9YQbqmTSHM3BndPrsEJyulYdon5nSwim3/IqeyayZDXu65UuN7OZNW
         EMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UReJkJBVE8LD0OMyFNkePe9lhdkteLLGtyK8WAPes3I=;
        b=eIji2NOc4pjF9jZkIcWpu4ZsIgPuXfQNG/XYTHLZTPJVOrPD6E/vGCbJJQLR5XZyeP
         bkVcKStE8Ypi95zgxSV4iEGDSZXQ7mLyrOT14GyQbRVWEzuvad8W4jm3a3sgY8qHg25g
         DSvdv2rSWk4VtIX6L5Z8E++nC6HZqGoNGv5iRlbZn9KmtkMDW3vAT2OWbndkOdJ886gu
         FU02MSY0ab92K9W8df2AfLjjX7hAYDk5ICsYtjZ2RKNjZq7G/B1CB9MkDEY4qH2CrjMD
         9q8evBOsiMRKeuWRrK1szLsPKf9TtGodYJY+2GheRURmt2W/Q+w/9WJ9RGK/5P892dbr
         b3GA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvAPK9Ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020ac84f4f000000b00399fb3a4d13si1218977qtw.175.2022.11.03.13.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Nov 2022 13:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QvAPK9Ub;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oqgrF-0006Bt-9g; Thu, 03 Nov 2022 16:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqgrC-0006AH-Jp
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 16:30:34 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqgr9-0006Hh-W6
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 16:30:34 -0400
Received: by mail-pg1-x52d.google.com with SMTP id b5so2662466pgb.6
 for <qemu-arm@nongnu.org>; Thu, 03 Nov 2022 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UReJkJBVE8LD0OMyFNkePe9lhdkteLLGtyK8WAPes3I=;
 b=QvAPK9UbY/bNPKWbkfoI7cNGv2tpn4dDm88pdrJpxp5Oo0M2Nhou+WNZueugkeQ1qr
 bgzJL34DCkpZI57uFQjler3Xa9PNa+AYl96gUNmzcs41pp3bTPjCbtO5wCT0WhSlZt2q
 7LNVlFYLMYGQYcUU1SHe2x7/6dysS6+9vo4A0fuGVAhQUMa9GeCBaXjOdqIRSdr7Du60
 UuW1iln2lctTY1ULnWIbDoWSRi3b0ocWazM+tH4rGY0halBZykTMrMR/ihwsy8qy6lVc
 qggAyKwh5mhoSPBKIjn/576qBFnhuU80FrmTVxXdgK03PyPHexOrE+7Z5wTGecUODCga
 VL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UReJkJBVE8LD0OMyFNkePe9lhdkteLLGtyK8WAPes3I=;
 b=0y6P8M3jJrpoGrrerj6M5m4SaVrD/Y10kR5TRbdfc5VJFC1aaYdVi7z4KfnxINSncI
 dd0D86Ke3XwSRxkvuBqyAqlQaDP4g/p7vpj8rwAAlTB8GciMJEkY4RBHNbEvErcCS6br
 Lh4dWG9z03+61mfaFA6ibuBnGBZcbeJGWVEmC+PgDkg0oJEsjFPbyGjf7Fx60pcGWUBr
 vJ70vig0STfTrvLItcCQfy99toOd6SevmaDBmYXiKcZ/HUpnmRblsFuGcMQVQepIQuOu
 /b6qGOkIjnpqeMesO7n0fEsCvUipYj6A1o5muJ66YEnJMqlAMxk8AxLYl8eFkyxTpA33
 UWhQ==
X-Gm-Message-State: ACrzQf0VjGdjDnKnMVGKeAYPV+fjJ9386mhN4bTmq/tLRQA+HMlPjlQK
 Znxo6pcEwFRfbt7u/2iolk/EPw==
X-Received: by 2002:a65:6a0f:0:b0:46e:f67c:bcee with SMTP id
 m15-20020a656a0f000000b0046ef67cbceemr27841162pgu.38.1667507420986; 
 Thu, 03 Nov 2022 13:30:20 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 79-20020a621452000000b005632f6490aasm1168064pfu.77.2022.11.03.13.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 13:30:20 -0700 (PDT)
Message-ID: <2d9a7f5e-0ec0-89da-53f0-b5624f540ae8@linaro.org>
Date: Fri, 4 Nov 2022 07:30:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
 <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wxC9klACOFQI

On 11/4/22 00:19, Peter Maydell wrote:
>> @@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>>       bool is_secure = ptw->in_secure;
>>       ARMMMUIdx s1_mmu_idx;
>>
>> +    /*
>> +     * The page table entries may downgrade secure to non-secure, but
>> +     * cannot upgrade an non-secure translation regime's attributes
>> +     * to secure.
>> +     */
>> +    result->f.attrs.secure = is_secure;
>> +
>>       switch (mmu_idx) {
>>       case ARMMMUIdx_Phys_S:
>>       case ARMMMUIdx_Phys_NS:
>> @@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>>           break;
>>       }
>>
>> -    /*
>> -     * The page table entries may downgrade secure to non-secure, but
>> -     * cannot upgrade an non-secure translation regime's attributes
>> -     * to secure.
>> -     */
>> -    result->f.attrs.secure = is_secure;
>>       result->f.attrs.user = regime_is_user(env, mmu_idx);
> 
> Do we also need to move this setting of attrs.user ?
> get_phys_addr_disabled() doesn't set that either.

I don't think so.  The only cases which don't pass through the setting of attrs.user are 
the two Phys mmu_idx.  Which was by design per the comment up there about artificially 
deciding which EL regime they belong to.


r~
