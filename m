Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4109180lft;
        Tue, 5 Jul 2022 10:16:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sJcPo7cBlw3kvE20lzHvrlkeOcXG7RsppH4vKCJH39sEqXcjA/JfG/274Rce8d7zCNxw00
X-Received: by 2002:a81:6cf:0:b0:31c:913c:144c with SMTP id 198-20020a8106cf000000b0031c913c144cmr14982197ywg.437.1657041409925;
        Tue, 05 Jul 2022 10:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657041409; cv=none;
        d=google.com; s=arc-20160816;
        b=TJPKzAvj3XSLSULkpSSbKZsP6huAmBlEtuMu6JEQ1ZIEt0I/t+Wk5QfOtaFByo1Vbg
         YngW1A/+lUQnGy7ZN+0UpI6pKhqkUVXWZtc/Omaw5uvldA2laqO/S0hnzvdLXwQfD/9d
         Wl2WHgXMmtXZUdmSDuWpXgAduW0V86Ny5eT2Mt5M2n8n21PAoq5XWTgoZ8fQz4cQ40mH
         0e8o9BpdNd4J+pwrnh/7vr96QRtaKE1VNQixZc8SUeB4IxV7JP8HsVznZ3yuWgIOGmKP
         sTsTJdpHKd82J2gznvZG54S8hkCBRi03jpBFCc78Uf4hmk6vSKe4MY2B8SvwqzDFJfPv
         ZeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RsheyObkH6nPm7s078ieDEVx4gIvhlxXzkit1L9GD0I=;
        b=WgCCq6e+rWKg8wnNFeOxapsUMiVRo7OWV5kQtvuOoHgQ7T72EyYm+LXNzrcl7QFu8E
         ICr80gkzuUrc0wZA8TOt3sbAs7Ow0uJ4kTRzZURl3nUNNgtkGG9WTVHQg2BXSrulJArR
         ajCRBtBb5nIJ9qSYbVJXVyLq77OKRI7zQdBEoLNbB0jGWjgWN/zEUAWdw+wufxtippRC
         ECwuzzkMN2NFhU/KHAUaKBsyyBHoV5EUt4b3zELzFI4+ab0Sf6AdlhWEAcKlkFL9/SyQ
         6AcJE5JnuwDxNU4dZ9JnRfqy/0xvta1pDe1OmNDABRxC1nnOjcRed4e7DFAgsJZEFKcE
         ofrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wGGFgSYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 127-20020a250185000000b0066e492c48adsi9359421ybb.379.2022.07.05.10.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 10:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wGGFgSYt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8mAL-0006Jj-5t
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 13:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8mA2-0006G3-59
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 13:16:31 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8mA0-00081J-Du
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 13:16:29 -0400
Received: by mail-pl1-x630.google.com with SMTP id d5so11479621plo.12
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RsheyObkH6nPm7s078ieDEVx4gIvhlxXzkit1L9GD0I=;
 b=wGGFgSYttLTQzYq45eAK66z6UTNPpXb1aFYYWjcOpJMXVJhMyLJfz995dLsuvRR71l
 Vfpau2bt6NpISGAtYliPdiS7WVuTplyaTOgh8K9pN0MN4Sd2IavreUt2IKKBqPW4SV33
 jWmjp9B3+Q/Jy8UrSB9lYfwxqpsB1ujlmjeWG3BuonpCINule4Moby0tkxYjwYO81YDW
 0we3ETGCSaPuHT+Sup0tzKcolxZH+W8uxUlC9q3WuuSy+h6qGBSMfKZDzAivFg+b1Zf6
 IcXYnNnc3mDCR9yATfQUF4cyotphhJr7PxqREWGTQZih8PgsZB4SCOR0pt/sd5a3zgcO
 0epA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RsheyObkH6nPm7s078ieDEVx4gIvhlxXzkit1L9GD0I=;
 b=tEV+6rk5VvZx2XBHxh3NsmcQtiEVmGFIDDa/we0sq63PVZ2Eo/tycROhfez3a8ApvO
 3VvZgZriP7bQhwLN2y6V58g26S/Nl6iy3FGT4yO+fI9hPmES2chBDMTRNZ647YlsOW3K
 FkZlHFD634N3BfFmXT332TMq4vnp9SUgzZ87UkTf4/c1KD4ujLqLn7A20lTbLLeD7LCC
 RRQ+haGf7ZzYlP4OufumLZqTa9R04AEiU/gWakS2I4foy/0iTa5eahZIzjWhtqviTOPW
 /9vrXLFxrnZDJGwcMj1OUVRQ3Vx8dTlAmJ9iQEvmBWH8OmY3fjUKKWer/YZoWa+EUsD3
 zmtQ==
X-Gm-Message-State: AJIora+QuOeaNQ8IWnqHT0TqNuGAslz9m7YmqWDzboZm6y4P/k8nV3Jb
 4D2ksWZO+2rbCAQ9FQmroNV2Xg==
X-Received: by 2002:a17:90b:3b81:b0:1ed:3655:d0c8 with SMTP id
 pc1-20020a17090b3b8100b001ed3655d0c8mr45454183pjb.56.1657041386857; 
 Tue, 05 Jul 2022 10:16:26 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a6567c9000000b003fd7e217686sm22741703pgs.57.2022.07.05.10.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 10:16:25 -0700 (PDT)
Message-ID: <af9aa8da-d76d-9da9-6f82-bb0341d01acb@linaro.org>
Date: Tue, 5 Jul 2022 22:46:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 5/5] target/arm: Correctly implement Feat_DoubleLock
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20220630194116.3438513-1-peter.maydell@linaro.org>
 <20220630194116.3438513-6-peter.maydell@linaro.org>
 <d717bccb-09d1-99e5-f15b-fdecb2b224f6@linaro.org>
 <CAFEAcA_5QBpjRH_VGFDG8bYFDduRJ9eew98WpeXXpceuhK6s4Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_5QBpjRH_VGFDG8bYFDduRJ9eew98WpeXXpceuhK6s4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6eTH189myADE

On 7/5/22 21:06, Peter Maydell wrote:
> On Sat, 2 Jul 2022 at 15:19, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 7/1/22 01:11, Peter Maydell wrote:
>>> +static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
>>> +{
>>> +    /*
>>> +     * We can't just OR together the aa32 and aa64 checks, because
>>> +     * if there is no AArch64 support the aa64 function will default
>>> +     * to returning true for a zero id_aa64dfr0.
>>> +     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
>>> +     * the AArch64 ID register values in id", because it's always the
>>> +     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
>>> +     */
>>> +    if (id->id_aa64pfr0) {
>>> +        return isar_feature_aa64_doublelock(id);
>>> +    }
>>> +    return isar_feature_aa32_doublelock(id);
>>> +}
>>
>> If you're going to rely on this, you need to clear this register for -cpu aarch64=off.
>> It's probably easier to drop this function...
>>
>>> +static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>>> +                        uint64_t value)
>>> +{
>>> +    /*
>>> +     * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
>>> +     * implemented this is RAZ/WI.
>>> +     */
>>> +    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
>>
>> ... and use
>>
>>       if (arm_feature(env, ARM_FEATURE_AARCH64)
>>           ? cpu_isar_feature(aa64_doublelock, cpu)
>>           : cpu_isar_feature(aa32_doublelock, cpu)) {
>>
>> since it's just used once.
> 
> If I squash in this change:
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 069dfe1d308..1f4f3e0485c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -4218,22 +4218,6 @@ static inline bool isar_feature_any_ras(const
> ARMISARegisters *id)
>       return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
>   }
> 
> -static inline bool isar_feature_any_doublelock(const ARMISARegisters *id)
> -{
> -    /*
> -     * We can't just OR together the aa32 and aa64 checks, because
> -     * if there is no AArch64 support the aa64 function will default
> -     * to returning true for a zero id_aa64dfr0.
> -     * We use "is id_aa64pfr0 non-zero" as a proxy for "do we have
> -     * the AArch64 ID register values in id", because it's always the
> -     * case that ID_AA64PFR0_EL1.EL0 at least will be non-zero.
> -     */
> -    if (id->id_aa64pfr0) {
> -        return isar_feature_aa64_doublelock(id);
> -    }
> -    return isar_feature_aa32_doublelock(id);
> -}
> -
>   /*
>    * Forward to the above feature tests given an ARMCPU pointer.
>    */
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index 62bd8f85383..d09fccb0a4f 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -617,11 +617,14 @@ static void oslar_write(CPUARMState *env, const
> ARMCPRegInfo *ri,
>   static void osdlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                           uint64_t value)
>   {
> +    ARMCPU *cpu = env_archcpu(env);
>       /*
>        * Only defined bit is bit 0 (DLK); if Feat_DoubleLock is not
>        * implemented this is RAZ/WI.
>        */
> -    if (cpu_isar_feature(any_doublelock, env_archcpu(env))) {
> +    if(arm_feature(env, ARM_FEATURE_AARCH64)
> +       ? cpu_isar_feature(aa64_doublelock, cpu)
> +       : cpu_isar_feature(aa32_doublelock, cpu)) {
>           env->cp15.osdlr_el1 = value & 1;
>       }
>   }
> 
> 
> 
> 
> can I have a reviewed-by? Would save me doing a respin.

You may.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
