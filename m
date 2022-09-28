Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp525354ocs;
        Wed, 28 Sep 2022 12:39:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6xd+WkTnpCU8mNRWFkqFNVmG74HJW0lc4LfxqOb+z0Ba+/scpABWCqKmccXoSGSHrYpJNo
X-Received: by 2002:ad4:5b83:0:b0:4ad:71b9:aede with SMTP id 3-20020ad45b83000000b004ad71b9aedemr27314357qvp.13.1664393943863;
        Wed, 28 Sep 2022 12:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664393943; cv=none;
        d=google.com; s=arc-20160816;
        b=0nv2rkQvcPNk/gLGOct4qZcqlVp0zPmJi7dYDlUKVE54t11gkvo0M1w6lByHVoRDSA
         9HV41CTlCft3BjLWU/CfiOXhjNzcrhbNc796bb8Icq+U2eX9v3XoIRvYbPTtxzCJVKBb
         MFDvZa1l5rRmZfdGTDjd4i7IcdwSjWFcO6n+VUKETfndvf5do0flGEMzn/AoxnJhKNMv
         1gr2vfBAtwPC7ENhT0r3ZXd1pLQJsVmo1vuqMxJ1V2++4DYH7izDmnELB7fgFNvJTOeZ
         mkcAYzBCkDz7FQwsiHuu7+4HlMo4yBBMAthp59rVq7fSq+r1As/GVtLXV4/+Ds69W6bp
         JEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4KmVhAv1vwqLP/mFMqRIB4OKdeSosWFaXlj8w5aaUiI=;
        b=Beo7WXBYWmIRIC92Ig6pvM0jgodmvIbfoKNlHb/PlYTznN1v6Jrxfk8hMqoBcaMUZ5
         HtESo9C2x2rY6bb0EeClgHrIAyg2eafzwcQA6xKBuqHJGSjQFoPnZHDVwsW4shWY+iAU
         HkQjEm3pyBdE2HdcSxIsBlzMtx7uOdKZHzhFwfYS86/kG1fXQ/BAelmtKCRVEzQJYvog
         83WsQhyvGkazv4SzErzib/HYgsRhrpu+TCN5gcyk7E2R2TBT8Izq8NaGiMwoMpxW7DXA
         G/NQ39mW+FukXzuQDuCXsQZa9Bo0kranGDDnwgtotdlTVwbJDPC4JlhEy4Kkf8R6x7X7
         lZMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lr4t+PpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq8-20020a056214258800b004992ea03eebsi3607545qvb.198.2022.09.28.12.39.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 12:39:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lr4t+PpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odctb-0008V1-DH
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 15:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odct8-0008Ul-JJ
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 15:38:34 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odct6-000765-P4
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 15:38:34 -0400
Received: by mail-pl1-x62e.google.com with SMTP id z20so5701814plb.10
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=4KmVhAv1vwqLP/mFMqRIB4OKdeSosWFaXlj8w5aaUiI=;
 b=lr4t+PpEPfJyJPJcSqiH/YlWBUWthO53H9AElKqcHFGGBJ1PB6W8leK+VE6+kBTFQF
 qwKqhf0l3eqfEaO0BCUwqBGdziHhDX9y/Z3u/C0BmrRuYlU8rdPtc8PW1UYw/Me8XL6o
 tQlam0c+Bn10N5wEGS5tJidutvOmoMcRv30wAPLJUg8Ymmfx1ItbzGMibHOcBDia/LUU
 BsPkq92vciL4LkPvAf6GOPZcAnJmNttm0sInVdNZC8teWr/wsVMw3cK2nd9vVEBlCNgX
 ACpXcHglSujfw5nd2X8bDC4imgyW9pNoQmk405CkqDSbWuRagcyAJ7YcSokVFQeJ7XFX
 AmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=4KmVhAv1vwqLP/mFMqRIB4OKdeSosWFaXlj8w5aaUiI=;
 b=Q86dYTfLtfR/EacMZCOGf28rcItw6e1pXc5nrX0/M+mtJwx75A5zpQZToJbcG3yaaF
 DLVt3PiC47N9JUqBe2W53InLvHbK+thtpHlwV9G97DTweN0E0v5z4pai5Libu0IPZ7Fk
 S8jl0UY6lErWWGtW5ibWHYR0/fV/jzbpvWa+tnkoOGpLfXEKAFNTDGtQO6sCPB4dF7SC
 BA8qMfGQv3OgTci4em0BdRuN1lTMGuXAhTccqRau8gi472bRUKkgkjev/2/sfVB2ZyVh
 ErYnJPgVWDMHHMcqzcPWDzVDkgCTkC/ev7hd6ZVAbWs/F1gi26DJZUmm9yOYFNPatDPt
 vKzA==
X-Gm-Message-State: ACrzQf3LLunybZSFliKW5KRV+dHScvtAMl9IizTGJOnAjDGsZYOZbkgf
 PjDpFxRHOkL6EwOL6aXS+Vz8NA==
X-Received: by 2002:a17:902:ecc6:b0:178:3c7c:18ad with SMTP id
 a6-20020a170902ecc600b001783c7c18admr1316616plh.112.1664393911012; 
 Wed, 28 Sep 2022 12:38:31 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 204-20020a6217d5000000b005289a50e4c2sm4354871pfx.23.2022.09.28.12.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 12:38:30 -0700 (PDT)
Message-ID: <4b6d984d-e63b-6904-c232-f1e562a3f331@linaro.org>
Date: Wed, 28 Sep 2022 12:38:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 29/66] target/arm: Introduce arm_hcr_el2_eff_secstate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-30-richard.henderson@linaro.org>
 <CAFEAcA_ZTxY7vW+9kG3LYjPJKOsk+hzeysg1n6E-PWy-zNtg8w@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_ZTxY7vW+9kG3LYjPJKOsk+hzeysg1n6E-PWy-zNtg8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qFopl8u+6Sse

On 9/20/22 08:52, Peter Maydell wrote:
> On Mon, 22 Aug 2022 at 17:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> For page walking, we may require HCR for a security state
>> that is not "current".
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.h    | 20 +++++++++++++-------
>>   target/arm/helper.c | 11 ++++++++---
>>   2 files changed, 21 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index cea2121f67..a08e546de4 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -2401,15 +2401,15 @@ static inline bool arm_is_secure(CPUARMState *env)
>>    * Return true if the current security state has AArch64 EL2 or AArch32 Hyp.
>>    * This corresponds to the pseudocode EL2Enabled()
>>    */
>> +static inline bool arm_is_el2_enabled_secstate(CPUARMState *env, bool secure)
>> +{
>> +    return (arm_feature(env, ARM_FEATURE_EL2)
>> +            && (!secure || (env->cp15.scr_el3 & SCR_EEL2)));
> 
> This doesn't need the outermost set of ().

Oh, that's an emacs alignment thing.

r~

> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM

