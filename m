Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12877435lfq;
        Thu, 31 Dec 2020 08:43:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxso8XPNIu5r/PLAlLLV8JD0m7JK7gfR4YDvrYPZLbqPLcvg5RWOfIycXsQ+1rjWMcS6Lx9
X-Received: by 2002:a25:cc92:: with SMTP id l140mr88334727ybf.252.1609433022146;
        Thu, 31 Dec 2020 08:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609433022; cv=none;
        d=google.com; s=arc-20160816;
        b=Ixyd7T0c4ksOwMtEQAMc6jICokg6yCEb9DJ+MYCjbMS6LoqvnQU/GgUc04HNqB70HN
         bb+t6q/ALX3aCOrtWKFOLEK2jtM32vPo9Rpgmo1LKGK21qJBouiZ2REny5UWXcKgVmbH
         VJHK4npt+HsGie1TzemNeLP8yjPkv28zyHBbCHpoL+EB3+1Cb0f97ncyPvYh7xDrYscU
         jU8YdLKSFgVOXrhTLYRsmroCqRpJvVE0LCKA7gGdQUbUByKz9qZlf+q+CXwKlxLKB5G0
         DeuSGLm2aqwp96Wqf3fpNUhOmQthWqHmpZ+TAB/2LKNnjB8IeZcmJb5H6VC3uR/5TWDc
         MMfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=noNozVlsgUjFIH/AoiOJjQdqf5k9zh54/Sw++eiy3iU=;
        b=zrpfh6PS9RGukaryIVZGlwUDbIuTba9iNlI2ckWDbCPiX1mdpV4NXOKjf5oGF/6pU9
         t7V0iPLdYJ+tRYO17sdO08khS4fcwOddHtd4NaNSrR98HD0r9iHOCamMlHVajdwPBikB
         ABu9rIHMC1lD1PeoJPupj6MWbxUMAuOicKkRyQNuGEcSQ1zmfyAoUqXmNVHAlJyXAfNx
         VdZmBHni4mB82mmkYTeSPpMJOuo80qXKnH/Qo+tk24W5ZB8zKgQuOhF+kxPY1tUonXsp
         IR/24BT4WNmywvJ1mOfYUWRUS/BffnQB52X1B/mOq0IJZk3qbf+48KUsHcawLhVLNQJg
         kxGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bfZ7ZWsp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si48553183ybt.221.2020.12.31.08.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Dec 2020 08:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bfZ7ZWsp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kv137-0007xq-Hk
	for alex.bennee@linaro.org; Thu, 31 Dec 2020 11:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kv12q-0007wM-T6
 for qemu-arm@nongnu.org; Thu, 31 Dec 2020 11:43:25 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:44563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kv12m-0002iN-0L
 for qemu-arm@nongnu.org; Thu, 31 Dec 2020 11:43:22 -0500
Received: by mail-pg1-x52b.google.com with SMTP id p18so13302205pgm.11
 for <qemu-arm@nongnu.org>; Thu, 31 Dec 2020 08:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=noNozVlsgUjFIH/AoiOJjQdqf5k9zh54/Sw++eiy3iU=;
 b=bfZ7ZWspBav902MsSSp8D9s3S05B75h6RwpqLQwx4EsINQZbhCrDNBTQFvMF2ptKi2
 JXbjmjMHOLwkO9ZBgS7Km4ZKh0lkQdVv/AtA9cSeaex/MBKj1JSrDMSidblBge/WLnT6
 bKqz7nNNfITblr08snBysI7ecEfLu5nlaR+PitRZGKu4bV47IED1BmTIfHApGRAxmFmU
 BoeBDilt0/CV4LMu107yHUBB9QpR4c+WoYiDY+8SZTW6KeJV/eD9h50jRBBpFlnpKzkP
 FoTEdjyTdVLc59zS1wxrOp+u7DoYXGjpwINRWt0hRYUA0TZKax7vj8YT7UfFNARdmv5A
 pUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=noNozVlsgUjFIH/AoiOJjQdqf5k9zh54/Sw++eiy3iU=;
 b=iuBGIf9tlyaqID45VSKmnQXZMFor5AAfPJgYCSlIQb3nKiAleu1Xq0gLmdRt4cphA6
 nuHi05tBWeh/ietiXDWIqmqULbKRR+WM2XqKjs+zkF0UYhznZ/PQw2WrqNyjHHnfPa47
 yfNlkgHbhk8jFIVbCs8/UYD2JxtdcH9ozbqf/yfluUjdLnJMzyucyUzKYQ/luo8Myu5T
 r10+DEb2zRw4hBZcg8qY9NnttNGlqfCR1Iyg5tS8R6vtN63oJKTC0SYWr3SFxQKyQJpR
 DAc6csGPhgPrwT26U0ONdVI19pZ/gRqRFhhglDPmj8grxMEcVyW2P16ZcYKGEYEd/ZQ7
 BQzA==
X-Gm-Message-State: AOAM531DtkO8Xc+utmttCmx5THSiamsvt2+A7CRuB565u2gJlOK7Wk2k
 lkmZBH0KdzyL88K2zGnwUZ3R1A==
X-Received: by 2002:a63:2352:: with SMTP id u18mr17739099pgm.385.1609432998532; 
 Thu, 31 Dec 2020 08:43:18 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 t5sm10938200pjr.22.2020.12.31.08.43.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Dec 2020 08:43:17 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: keep translation start level unsigned
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <7884934.NyiUUSuA9g@basile.remlab.net>
 <c2af03a8-9f56-fb43-485c-91ec0fbdef31@linaro.org>
 <002743e6-10d3-88b3-961a-8571efb4d1ed@linaro.org>
 <9468010.vzF1F9XyNR@philogene>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b14279c-f620-5c03-b25c-a52fa370cc8e@linaro.org>
Date: Thu, 31 Dec 2020 08:43:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9468010.vzF1F9XyNR@philogene>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.399,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, remi.denis.courmont@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u5iCKOgCKVoR

On 12/31/20 1:59 AM, Rémi Denis-Courmont wrote:
> Le jeudi 31 décembre 2020, 00:38:14 EET Richard Henderson a écrit :
>> On 12/30/20 2:10 PM, Richard Henderson wrote:
>>> On 12/18/20 6:33 AM, remi.denis.courmont@huawei.com wrote:
>>>> From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>>>
>>>> Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
>>>> ---
>>>>
>>>>  target/arm/helper.c | 14 ++++++--------
>>>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>>
>>> The patch does more than what is described above.
>>>
>>>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>>>> index df195c314c..b927e53ab0 100644
>>>> --- a/target/arm/helper.c
>>>> +++ b/target/arm/helper.c
>>>>
>>>> @@ -10821,17 +10821,12 @@ do_fault:
>>>>   * Returns true if the suggested S2 translation parameters are OK and
>>>>   * false otherwise.
>>>>   */
>>>>
>>>> -static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
>>>> +static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint32_t
>>>> level,
>>>>
>>>>                                 int inputsize, int stride)
>>>>  
>>>>  {
>>>>  
>>>>      const int grainsize = stride + 3;
>>>>      int startsizecheck;
>>>>
>>>> -    /* Negative levels are never allowed.  */
>>>> -    if (level < 0) {
>>>> -        return false;
>>>> -    }
>>>> -
>>>
>>> I would expect this to be the only hunk from the patch description. 
>>> Probably changing this negative check to a >= 3 check.
>>
>> Having read the next patch, I think you should drop this type change.
>>
>>>> @@ -11203,7 +11201,7 @@ static bool get_phys_addr_lpae(CPUARMState *env,
>>>> uint64_t address,>> 
>>>>          if (!aarch64 || stride == 9) {
>>>>          
>>>>              /* AArch32 or 4KB pages */
>>>>
>>>> -            startlevel = 2 - sl0;
>>>> +            startlevel = (2 - sl0) & 3;
>>
>> This hunk belongs with the next patch, implementing TTST, and should be
>> conditional.  I.e.
>>
>>     if (stride == 9) {
>>         startlevel = 2 - sl0;
>>         if (aarch64 &&
>>             cpu_isar_feature(aa64_st, env_archcpu(env)) {
>>             startlevel &= 3;
>>         }
> 
> You can do that but:
> 1) Nothing in the spec says that SL0 == b11 without ST means start level -1. 
> It's undefined, and I don't see any reasons to treat it differently than with 
> ST.

By that logic there's no reason to treat it differently at all; you could drop
the feature check entirely.  In lieu, -1 makes a decent error indicator.

> 2) Functionally, checking for ST seems to belong naturally within 
> check_s2_mmu_setup() in this particular case.

I guess.  I'll leave it to Peter's preference.


r~
