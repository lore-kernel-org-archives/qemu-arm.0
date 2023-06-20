Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp114418ejt;
        Tue, 20 Jun 2023 00:20:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ZLNRVI7zsB3fjvbavrx5lxY/V470fod3Iqy2cjgjTf8jspYwjAqZ0dr4m105mjE95TfP/
X-Received: by 2002:a05:6214:d8b:b0:619:a7e3:99e2 with SMTP id e11-20020a0562140d8b00b00619a7e399e2mr15868279qve.17.1687245613021;
        Tue, 20 Jun 2023 00:20:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687245613; cv=none;
        d=google.com; s=arc-20160816;
        b=mJTngIfxAqcmS8CVBOYLcsdEJ2gaHpCJ8HKSl4hC6+QyUUN+mdWo0OjA0eOqCh0THU
         9wZraZKCs+TsG9kjmtZ2p1vpxTPYAqhRrW5aJTZ8yOPFF/duxpKlKfMERBoVLPDF17Kq
         7P6xCtH3gYTwsCk/bJqEPFXNseMlI+cK7ABILDrK7AdS/gdzyokMcxxTLlE//lbMJPgu
         jrRIbGccsm1bbWVVgqGByxPnhBiwE+V71BiraESCyo0Oe6d5pb/Ylh2hEAusx2WzaPEu
         UbAoDkEDxOojnpRhcnNj1SCwh0oxUfLUiN+n5LqVgktUMX/tCnHjhtqwA2rmnCbY3mhB
         BJXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yhtF8z0ppmNV1niZXvzfL2WVmvMTDQ7j4oO0+pxYj2o=;
        b=fmd4dNJTVLfCOBzh5I5QXvRL3iBLBzWoW6JIZdxkMv860wa7fR/KcoE44jNbkdN2JE
         aXrchPtiu8ufH9F7WNgUO83vQRoPxNmCYPEmvfXKGDw3Y76VOhY3d9jX6fjIAI583KBa
         8F8GG2bIoJ0EGnyRZZbkWd2+GvfKFTxo8s+KjZ5sLQfcKP2ddmEeVR+LHdZTRWIsmCGK
         52ZFLVS8YztIC2Zg8yer3ZUQAHSh8HaHxDwVQnBYWk+G/pMrndY1MkJZMTBwd8e8Ju9K
         HugKLMzr0WzOhk/6evoTGfToygAmuZULwWYAUo/Y4wjKpaRr+KD+JHbP+rg4bfbkRr/w
         zeIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G3D6/8sC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020a05620a03c200b0075c9e048b18si569800qkm.679.2023.06.20.00.20.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 00:20:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G3D6/8sC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBVej-0005Or-FP; Tue, 20 Jun 2023 03:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBVeg-0005Le-LV
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 03:19:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBVec-0006OV-On
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 03:19:58 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso694620466b.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 00:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687245588; x=1689837588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yhtF8z0ppmNV1niZXvzfL2WVmvMTDQ7j4oO0+pxYj2o=;
 b=G3D6/8sCdpH5X6/65wwCvqF8KIdmcA8t+t7V0YCw4Ei/tCNIzWtVBWid11gEbUaV4e
 xkiuZQdzx9GTxTl6qKyq4qP8DIZek3zEmV8d0ax5LrrfyvoPta3MVf0BYm/G00XSLXl+
 NXLNQTBrSwSivKk+jo2vI9ciYhDBzhvBQYoaNhDd89qlzJjpRga5OqXVyKkrcIUJwt0Q
 2KVNNGBPARfkdDaCE5vNMU/KicUiuWs4rnGgdurTUM07uJf/cLcGJO7iU6Gy6Z2INhQA
 qofF4BaaERItmyvhkE9yfE+Rv0EVVd2rCmHogOr7EIeBt8W0WKUU/DLQudAogODK4Ozq
 6qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687245588; x=1689837588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yhtF8z0ppmNV1niZXvzfL2WVmvMTDQ7j4oO0+pxYj2o=;
 b=QaruscG3GCJ8nRMhGPnaqodf7gjvcDVa2Pj3X16R3lnw7sTacU4LNmzy1Z/NYh0OMf
 JsPeIz8XD6iMETdeT0Yk6SS+Cj02ecSI6XY9vA94D+vyCDXkikm0MA1T8HShSvzbBFkX
 OHZCoQE/6XXtEsD4ERuAmP/PaH1g5G0fCBs0vYqOP3H5E/BJnKYAqmeb1bFgEsCS8V+G
 dWgXvpxVqJQttBbnHgXi7JYxN80FKlPRMvYw0ZZBzpe1vziPCEm6lRFZNMg357hMo/fW
 9c0ECftkoGGaqA7yJEvP1YsXb0f0sqEtW/GNDnEte1tam6ECbckDZeMZNbbICtpAW5Ay
 DsWg==
X-Gm-Message-State: AC+VfDwMQ7G6DnBaPPlUDMAdZZ4LE1NFyvFXFYB6fUQAMXvHakA++jYT
 HvdgdGZc7i2fqiQAktD2JjKaAg==
X-Received: by 2002:a17:907:9621:b0:988:803d:24d9 with SMTP id
 gb33-20020a170907962100b00988803d24d9mr6884477ejc.22.1687245587764; 
 Tue, 20 Jun 2023 00:19:47 -0700 (PDT)
Received: from [192.168.69.129] ([176.176.183.29])
 by smtp.gmail.com with ESMTPSA id
 bv24-20020a170906b1d800b00987cd2db33fsm824031ejb.131.2023.06.20.00.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 00:19:47 -0700 (PDT)
Message-ID: <bd29541d-3458-821a-7c2d-baf3645ddcfd@linaro.org>
Date: Tue, 20 Jun 2023 09:19:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] target/arm: Restructure has_vfp_d32 test
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>
References: <20230619140216.402530-1-richard.henderson@linaro.org>
 <6222171f-13b6-cf5a-8431-eb68b4e8b764@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6222171f-13b6-cf5a-8431-eb68b4e8b764@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: a3onnQGsKuqg

On 6/20/23 07:29, Philippe Mathieu-Daudé wrote:
> On 19/6/23 16:02, Richard Henderson wrote:
>> One cannot test for feature aa32_simd_r32 without first
>> testing if AArch32 mode is supported at all.  This leads to
>>
>> qemu-system-aarch64: ARM CPUs must have both VFP-D32 and Neon or neither
>>
>> for Apple M1 cpus.
>>
>> We already have a check for ARMv8-A never setting vfp-d32 true,
>> so restructure the code so that AArch64 avoids the test entirely.
>>
>> Reported-by: Mads Ynddal <mads@ynddal.dk>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/cpu.c | 28 +++++++++++++++-------------
>>   1 file changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 353fc48567..706dbd37b1 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1402,25 +1402,27 @@ void arm_cpu_post_init(Object *obj)
>>        * KVM does not currently allow us to lie to the guest about its
>>        * ID/feature registers, so the guest always sees what the host has.
>>        */
>> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
>> -        ? cpu_isar_feature(aa64_fp_simd, cpu)
>> -        : cpu_isar_feature(aa32_vfp, cpu)) {
>> -        cpu->has_vfp = true;
>> -        if (!kvm_enabled()) {
>> -            qdev_property_add_static(DEVICE(obj), &arm_cpu_has_vfp_property);
>> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>> +        if (cpu_isar_feature(aa64_fp_simd, cpu)) {
>> +            cpu->has_vfp = true;
>> +            cpu->has_vfp_d32 = true;
>> +            if (tcg_enabled() || qtest_enabled()) {
>> +                qdev_property_add_static(DEVICE(obj),
>> +                                         &arm_cpu_has_vfp_property);
>> +            }
>>           }
>> -    }
>> -
>> -    if (cpu->has_vfp && cpu_isar_feature(aa32_simd_r32, cpu)) {
>> -        cpu->has_vfp_d32 = true;
>> -        if (!kvm_enabled()) {
>> +    } else if (cpu_isar_feature(aa32_vfp, cpu)) {
>> +        cpu->has_vfp = true;
>> +        if (cpu_isar_feature(aa32_simd_r32, cpu)) {
>> +            cpu->has_vfp_d32 = true;
>>               /*
>>                * The permitted values of the SIMDReg bits [3:0] on
>>                * Armv8-A are either 0b0000 and 0b0010. On such CPUs,
>>                * make sure that has_vfp_d32 can not be set to false.
>>                */
>> -            if (!(arm_feature(&cpu->env, ARM_FEATURE_V8) &&
>> -                  !arm_feature(&cpu->env, ARM_FEATURE_M))) {
>> +            if ((tcg_enabled() || qtest_enabled())
>> +                && !(arm_feature(&cpu->env, ARM_FEATURE_V8)
>> +                     && !arm_feature(&cpu->env, ARM_FEATURE_M))) {
>>                   qdev_property_add_static(DEVICE(obj),
>>                                            &arm_cpu_has_vfp_d32_property);
>>               }
> 
> Shouldn't we also change:
> 
> -- >8 --
> @@ -1431,7 +1431,7 @@ void arm_cpu_post_init(Object *obj)
> 
>       if (arm_feature(&cpu->env, ARM_FEATURE_NEON)) {
>           cpu->has_neon = true;
> -        if (!kvm_enabled()) {
> +        if (tcg_enabled() || qtest_enabled()) {
>               qdev_property_add_static(DEVICE(obj), &arm_cpu_has_neon_property);
>           }
>       }
> ---
> 
> ?

Yes, I missed that, being just out of view.  :-)

r~


