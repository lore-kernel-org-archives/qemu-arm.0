Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2053809ejq;
        Mon, 8 May 2023 06:42:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71i+sxk2LAL2yTCA6aZasCr7roKP47NBQFNt7Og84HxtABwCOCXFMZiCSrm0eM07P7besd
X-Received: by 2002:a05:6214:c63:b0:5cc:e059:efa3 with SMTP id t3-20020a0562140c6300b005cce059efa3mr14333374qvj.23.1683553341331;
        Mon, 08 May 2023 06:42:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683553341; cv=none;
        d=google.com; s=arc-20160816;
        b=EgAtwYJEZuhq1Vjc+mcZt+Fjqg0sRj3UhDfo+QhRwm8/b5IusBYtPm8Azo4eiYQVa1
         gUBBpNN0otMA/veFf8MwWfsygsMr7ouXEzqtgos0G1aAMaR+xdoozryRBok2Wn/OWL8B
         G/SpJNxvDqlzClLcaj6gxw1A/KXaEyTiCz5hs3Kxf2X1acMTlL8bjVC1hbCV2Jpfq8oT
         vgTKglESbM/BfKSZuWuEoynV6wFathslG6dvKqCNoDsSDTOa8OeKEzK1gY/rB7kn8Zpj
         7ND3SVBCj0L/K+Gxsrx4x17sDpBDmCRrNgKsnfl8m/VZCgQVS/ezT3kc5QCW4R2ibp+c
         CLMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UorbWTZIhuQX90C316Wni8w3Fb/Ts8kozFybUATuNkA=;
        b=GoY1iuX/o9Ptml+dBACL+s4D5bIP6SYT/wOY9OIhSpii3NF38qh7Njom+5R/3tS1nG
         gDgatbgzJ5wCoKDonnVnPttvGBwXtdsbNEIpOj5nRUsWYtm0Xy94/i2Zvx9AFMVV9oos
         PYnBn2yxYGxiIOCA2IyESHs0+TFQfJUS433lP4iIT2o40JH3NltF25JLigIG68Z4Vg6n
         ddsHY5Mn4PtMGfopFX9V40pBc4qj+N1fx+NmoDCJ3uesPt1e+HY+xye3kKrAETfi/QOg
         MWMU74Js3q4cSw4fJElVPnV4OQDMiaTp8ONMx46wplPtx5x/mZl1C4kZGc6StlOSO1e/
         zmzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmxMC68a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9-20020a0562140c2900b005e98b8f9459si2991144qvd.549.2023.05.08.06.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 06:42:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mmxMC68a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pw181-00014X-MY; Mon, 08 May 2023 09:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw180-00013i-Fv
 for qemu-arm@nongnu.org; Mon, 08 May 2023 09:42:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pw17u-00017J-Jd
 for qemu-arm@nongnu.org; Mon, 08 May 2023 09:42:09 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso5180475e9.0
 for <qemu-arm@nongnu.org>; Mon, 08 May 2023 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683553325; x=1686145325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UorbWTZIhuQX90C316Wni8w3Fb/Ts8kozFybUATuNkA=;
 b=mmxMC68a9oBYxfP+1RVjcrh+1+juDqGyvjGWDbifbAxak5MDd294oc4B+9KqDLGhoj
 l9/2Ke8msj8+RiWAmtY1jLxJoPE99oB4CrXA0PhLZPdSHxdVpr1G4zCVX5TqLTpSC65O
 QucUUtbkkJQ2B5LtqZMQ+1H4c26tloDhs3FogDKDWpgfy3zzgBYspnfANgJTN+X5evKr
 7O/ticLeScuYnOsWD/SZUv/4jAh4cZ+Uvw2iWfDQvfuN+O1FLWxS1Fi/OOP98ACuXT2I
 DmFJXLeaJah9BRFeRxzxaB4Dsjv50QpRVKIES7LDiDfF98p8cpy72JVWjOh7/wcoKPur
 toJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683553325; x=1686145325;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UorbWTZIhuQX90C316Wni8w3Fb/Ts8kozFybUATuNkA=;
 b=jeGaph+HSuXe0OQsI/RtcBDFGjCLyY2Mg3sViQwf+glPiCv6Fb1aHuYKXP5S3UEMTw
 Uhak/hBk2ljWGJmKwXVfUxJE7/1W3DqyuyFHHW8TFV41+/sbOpPqa6L2b0i790oei3+L
 3RJwA0kr9IB/emgwSJI4LoOPECVGM88cWaVECeH3JmuItjQRcLvoEfeMEQ6VqhItIl6P
 wSDRC+/rakjL6JIdpaWCzd0iy1CAFwTlUS7tFSNEjS+/roOGngFLhRlYdgtakWUWdSix
 Vu31miJGyCOq+qVe4TRNt37iwiolZ9YMvr7QLmNzgnenh2wKLtnXr982QWQ9MLfTPS/K
 LPKA==
X-Gm-Message-State: AC+VfDwZGBwaKqre7L5gXZR0skWrAqeI4eDGRqpdj6qzVixQZ0FuF/Jy
 OyB+9gcrhSAG9guEGhdehJY7jA==
X-Received: by 2002:a1c:f20a:0:b0:3f1:819d:d050 with SMTP id
 s10-20020a1cf20a000000b003f1819dd050mr7265462wmc.37.1683553324766; 
 Mon, 08 May 2023 06:42:04 -0700 (PDT)
Received: from [10.248.102.233] (5d600b65.skybroadband.com. [93.96.11.101])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a1c7213000000b003f4268f51f5sm2520982wmc.0.2023.05.08.06.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 06:42:04 -0700 (PDT)
Message-ID: <d42d16ec-f223-9f4f-1150-10fdf9fe9b3c@linaro.org>
Date: Mon, 8 May 2023 14:41:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 14/57] tcg/i386: Add have_atomic16
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn,
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-15-richard.henderson@linaro.org>
 <CAFEAcA_BMbNPYEoHacYk5ETJp6N9b8NKQvnZvfgrsDhH6yDOdw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_BMbNPYEoHacYk5ETJp6N9b8NKQvnZvfgrsDhH6yDOdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.802,
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
X-TUID: Tcq+FfKbFtzP

On 5/5/23 11:34, Peter Maydell wrote:
> On Wed, 3 May 2023 at 08:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Notice when Intel or AMD have guaranteed that vmovdqa is atomic.
>> The new variable will also be used in generated code.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/qemu/cpuid.h      | 18 ++++++++++++++++++
>>   tcg/i386/tcg-target.h     |  1 +
>>   tcg/i386/tcg-target.c.inc | 27 +++++++++++++++++++++++++++
>>   3 files changed, 46 insertions(+)
>>
>> diff --git a/include/qemu/cpuid.h b/include/qemu/cpuid.h
>> index 1451e8ef2f..35325f1995 100644
>> --- a/include/qemu/cpuid.h
>> +++ b/include/qemu/cpuid.h
>> @@ -71,6 +71,24 @@
>>   #define bit_LZCNT       (1 << 5)
>>   #endif
>>
>> +/*
>> + * Signatures for different CPU implementations as returned from Leaf 0.
>> + */
>> +
>> +#ifndef signature_INTEL_ecx
>> +/* "Genu" "ineI" "ntel" */
>> +#define signature_INTEL_ebx     0x756e6547
>> +#define signature_INTEL_edx     0x49656e69
>> +#define signature_INTEL_ecx     0x6c65746e
>> +#endif
>> +
>> +#ifndef signature_AMD_ecx
>> +/* "Auth" "enti" "cAMD" */
>> +#define signature_AMD_ebx       0x68747541
>> +#define signature_AMD_edx       0x69746e65
>> +#define signature_AMD_ecx       0x444d4163
>> +#endif
> 
>> @@ -4024,6 +4025,32 @@ static void tcg_target_init(TCGContext *s)
>>                       have_avx512dq = (b7 & bit_AVX512DQ) != 0;
>>                       have_avx512vbmi2 = (c7 & bit_AVX512VBMI2) != 0;
>>                   }
>> +
>> +                /*
>> +                 * The Intel SDM has added:
>> +                 *   Processors that enumerate support for Intel® AVX
>> +                 *   (by setting the feature flag CPUID.01H:ECX.AVX[bit 28])
>> +                 *   guarantee that the 16-byte memory operations performed
>> +                 *   by the following instructions will always be carried
>> +                 *   out atomically:
>> +                 *   - MOVAPD, MOVAPS, and MOVDQA.
>> +                 *   - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with VEX.128.
>> +                 *   - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when encoded
>> +                 *     with EVEX.128 and k0 (masking disabled).
>> +                 * Note that these instructions require the linear addresses
>> +                 * of their memory operands to be 16-byte aligned.
>> +                 *
>> +                 * AMD has provided an even stronger guarantee that processors
>> +                 * with AVX provide 16-byte atomicity for all cachable,
>> +                 * naturally aligned single loads and stores, e.g. MOVDQU.
>> +                 *
>> +                 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
>> +                 */
>> +                if (have_avx1) {
>> +                    __cpuid(0, a, b, c, d);
>> +                    have_atomic16 = (c == signature_INTEL_ecx ||
>> +                                     c == signature_AMD_ecx);
>> +                }
> 
> If the signature is 3 words why are we only checking one here ?

Because one is sufficient.  I don't know why the signature is 3 words and not 1.


r~
