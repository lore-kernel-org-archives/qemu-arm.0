Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp555194njb;
        Thu, 5 Dec 2024 17:53:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXW7tBKSbWvlJkUV145aAgeqjzzyt+Ms2Z+Fl6ykANpKE8tFMOR7CsO0OYp5Stwr+yxw7gamIXHeH8hSg==@linaro.org
X-Google-Smtp-Source: AGHT+IF2AQFW+jwP52fZ5Oxyc1g6dOFYCeb5EJmJISPfablAYBwnfZ+qUeBH8Uyle1UxWR5NuLhu
X-Received: by 2002:a05:6214:2683:b0:6d8:88f2:b4d9 with SMTP id 6a1803df08f44-6d8e70f0136mr18808816d6.3.1733449995622;
        Thu, 05 Dec 2024 17:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733449995; cv=none;
        d=google.com; s=arc-20240605;
        b=FGIeJnYdeXpN2J05YMDXz+dyQs5Sk8oZwfpMjjvOhhPHoDBkvLf9AjUVGh9ElchpIi
         qiJ8JyvyP96/Ktu6lxbzl/hsqoj4+17qiffeqeJIMC+2iAyzEI470kYfxQPqgtJhubOa
         2bdS8OU5cWvV/B3mYXjTca66eIQVP2mUypFcocH0Kv1QscInjcigwsSnYGt76uLiLW3+
         Ei2WTpFYeO1vh86cb0L5VCuZyav82RoIalrPnlPgavohfU4y+Bb6r0ABkQ6dNaVPmS+o
         eTXmeSEbfUYBJWNquZxGzKx8Irm4idwYc3k0pFj4TjP7UG5VZWhpmGNZy3kLSRI2N97t
         rcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=he90M4HxytPAKb6TY3Fz4JHY3u2W6xSjiI4r5HbLeNQ=;
        fh=/R7ioIfKvm9TQ4nE3gvHxGvy/LrlnT6paPX2rzRmmLE=;
        b=aZPgi1Xyv8L4wqEi5SpOJbs2EtTl03JUjYgV6+eeg4XpZH42vKH3Lxl84Wk2qgJyRi
         3DiEb632GS+6iOTc0iX8Xnbo3Wlq5bV+7Ht24JsAyRT0GkHhJKhcmyUkLgM9G/frH89p
         /UA6q1PcBX7vyith5mP1NPj16hx5B8SizzwNpaeuN2TW/VydYrYSPa/YmzUDHvF3pTW3
         QZPp5Kx2qDcT7zyj3TT2mMMcVs+e+gc/wpQNZDYtaV24AvnzMMGz9vDKoIg2Tf8EDz2L
         ESO7fwl8+WvVdHKYBXFeQijVpVgZKSo9MPU9HLFjjaV62HTNp9qR9R8kdJMbs4w/po5b
         1R+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="StDe9/4q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e6da9ef3si10599656d6.38.2024.12.05.17.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 17:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="StDe9/4q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJNWK-0005US-JW; Thu, 05 Dec 2024 20:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJNWJ-0005U7-Ju
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 20:52:39 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tJNWH-0005Dd-Rt
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 20:52:39 -0500
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3ea3cc9a5ddso893043b6e.3
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 17:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733449956; x=1734054756; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=he90M4HxytPAKb6TY3Fz4JHY3u2W6xSjiI4r5HbLeNQ=;
 b=StDe9/4q30cfG1eRKxHdOKtHEK8LvhyV/DDm4gBpSuNUSPb7mM5bAronTAH/4OULOC
 jnkagWqkGwl3BDeY98uAUtGm9i4+B9BTun4i9gIpbfo93DKAOqydVHm/qRKv1yj7X0ov
 k/DF59LXXntGstNPc687TtP9ov2ncabxlm/HYkY/Rb9ZN8VqGEVwm63BGpuoBi/j/JlO
 jlnSEjCuld3MnsDGwHC/GUlGqZctDLczSxV8xQTfvyP8Z6ueEuN1p1SEcn8Z9JQ907wY
 NgOF8ozoKkke+onYFuXGaGc0OUWustjcQniEdNS8YTj633cfDECk4dY2xNACGkei+8FO
 6j/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733449956; x=1734054756;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=he90M4HxytPAKb6TY3Fz4JHY3u2W6xSjiI4r5HbLeNQ=;
 b=kXisALkW2CM8MIl0BqyPxaVa5VzfpnupOvfl4vVDJhWuOSTzOGZq+vPx6aq5O/2aJ3
 P/+KljwVvf7tnywGl/BxfT7N1RJx2ew4i/MEdB6KO5/6QeZAf08CRtC4IRL4TgKhCYr4
 Y2XhddnSXhm3pGv8xMylw8azxn9M6Q6Qi0tbawXGxycfZ5+iUtL0JlIVGPQ/NfnmcUsa
 BgqRqrX4nm6CYuEXViiik5K8MgmAYJcMLTiDIGvRDSnCnel4m7T5ycUwcoWugXkjLqhu
 NxPpLu4KQWgEUJkyGtX1Z8MLWXRm5v8PMth2V+yLXYN0ASZ895+xjo7jSoO+/mB6e+xg
 pmPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBozLypc5MIHI4aq+hQt9SfW6gcYCYM0ObefhoiGA9peOHefvLyhLEVmOSliHhymTWGnS9Fp/pTQ==@nongnu.org
X-Gm-Message-State: AOJu0YxlqDlIAfvSx0G9m3ThjaXoqofG8GS9CssQ1h03uDQSmr5eO0GQ
 6Lxy7S9QextD4BYrFmMBzh10y/02x3iRAWRRj7jBgzIk8xN0KDW8TlE811Okj4A=
X-Gm-Gg: ASbGnctADqnrDUeXaom1HwzbNXAjKp5pfJ98KGSy9Oq0BrE5EgiOxl0MGZJePy1RsY2
 E8Zhivn6g1iYdFEfHsVmIiinRpPG5BSGIpLgr5pDwVNhwyBpSTFbinv9gUEMXb5K2icTiWf/bQX
 OUKnNCem8vckQx/qyhWRSNFkWvng6JTl+mvMPgo/r5Otoqn6dfUdvkHIArPcPPN0kTEHxkdfL4b
 i61Wfc2ycCB+oQmwrZn1PkNH1kGGH1nWJQPQ6Zv44/a8GK7uNM6Rl8TfC+7xMk5YP5We7EIpf8T
 uakJoiZKY/75pu/Rud2obS5XhYRJ
X-Received: by 2002:a05:6808:f8c:b0:3ea:aa8a:c115 with SMTP id
 5614622812f47-3eb19ccf0ffmr629722b6e.21.1733449956315; 
 Thu, 05 Dec 2024 17:52:36 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb078695basm562111b6e.53.2024.12.05.17.52.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 17:52:35 -0800 (PST)
Message-ID: <4b1b91c2-80c2-4ed1-b313-a2e9ebba4049@linaro.org>
Date: Thu, 5 Dec 2024 19:52:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/67] target/arm: Convert FMOV, FABS, FNEG (scalar) to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-24-richard.henderson@linaro.org>
 <CAFEAcA9ECxgGvsSuw+GGsj4h2reKs9bVRSG=TD0oHPh519m7yA@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9ECxgGvsSuw+GGsj4h2reKs9bVRSG=TD0oHPh519m7yA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5W7m5YlrU9qg

On 12/5/24 15:12, Peter Maydell wrote:
>> @@ -8295,15 +8356,6 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
>>       TCGv_i32 tcg_res = tcg_temp_new_i32();
>>
>>       switch (opcode) {
>> -    case 0x0: /* FMOV */
>> -        tcg_gen_mov_i32(tcg_res, tcg_op);
>> -        break;
>> -    case 0x1: /* FABS */
>> -        gen_vfp_absh(tcg_res, tcg_op);
>> -        break;
>> -    case 0x2: /* FNEG */
>> -        gen_vfp_negh(tcg_res, tcg_op);
>> -        break;
>>       case 0x3: /* FSQRT */
>>           fpst = fpstatus_ptr(FPST_FPCR_F16);
>>           gen_helper_sqrt_f16(tcg_res, tcg_op, fpst);
>> @@ -8331,6 +8383,9 @@ static void handle_fp_1src_half(DisasContext *s, int opcode, int rd, int rn)
>>           gen_helper_advsimd_rinth(tcg_res, tcg_op, fpst);
>>           break;
>>       default:
>> +    case 0x0: /* FMOV */
>> +    case 0x1: /* FABS */
>> +    case 0x2: /* FNEG */
>>           g_assert_not_reached();
>>       }
>>
> 
> In these changes to the "handle this op" functions we make the
> function assert if it's passed an op we've converted. But shouldn't
> there also be a change which makes the calling function disas_fp_1src()
> call unallocated_encoding() for the ops ?

Yes.  I missed that because the line is

     case 0x0 ... 0x3:

without the usual set of comments.

>> @@ -10881,13 +10921,11 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
>>           case 0x7b: /* FCVTZU */
>>               gen_helper_advsimd_f16touinth(tcg_res, tcg_op, tcg_fpstatus);
>>               break;
>> -        case 0x6f: /* FNEG */
>> -            tcg_gen_xori_i32(tcg_res, tcg_op, 0x8000);
>> -            break;
>>           case 0x7d: /* FRSQRTE */
>>               gen_helper_rsqrte_f16(tcg_res, tcg_op, tcg_fpstatus);
>>               break;
>>           default:
>> +        case 0x6f: /* FNEG */
>>               g_assert_not_reached();
>>           }
> 
> What's this change about? This bit of decode is not in the area that
> corresponds to the new patterns you add to a64.decode.
> 
> Is this a bug in our existing decode where we decode something that
> should be undef? I think that 0x6f here corresponds to the decode
> table in section C4.1.96.6 ("Advanced SIMD scalar two-register
> miscellaneous FP16"), where it is U:a:opcode == 1 1 01111. But
> in that table that encoding is marked unallocated. A similar
> thing is true for case 0x2f FABS and case 07f FSQRT. All three
> of these should have set only_in_vector to true and not had the
> code handling in the is_scalar branch of the function.
> 
> We should fix that bug in a separate patch before we do the
> decodetree conversion, I think.

You're right.  I had thought there was something weird here, in that FNEG was present but 
not FABS.  The only scalar FNEG is in fp data-processing 1-src.


r~
