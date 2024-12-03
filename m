Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3712667njk;
        Tue, 3 Dec 2024 06:09:51 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYNWpQhFge6WBnNKTfSjJH4jOa+1Sr6t2+T0YP9dCyU/n5RCTNsfCT8E1e/PmL7VAb7oc+yICxi0WoxA==@linaro.org
X-Google-Smtp-Source: AGHT+IFV/EoU7v6IoUviE3bKK40ekmHCCY0NB8HFKubBYQ8sOZRuNWIgh8WHmrA+WK9IyrKx0PTp
X-Received: by 2002:a19:e045:0:b0:53e:1ba2:ee1a with SMTP id 2adb3069b0e04-53e1ba2ef02mr165727e87.20.1733234990835;
        Tue, 03 Dec 2024 06:09:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733234990; cv=none;
        d=google.com; s=arc-20240605;
        b=B5NipjLpeLKym0uY9Ds8BF2SRFe/dRRwfIdRboVVpcEPypq1eudI6kgR5PRoyua+4T
         hmulSvR9AsX32rZnsDWsLDA8n2QzjPoUHqPmTNIlDuMHaz8mC5PMe4xGI3t0ghc2rDdV
         OBBnho1YP01l+N1TR0FDDGjMYL5WTF5CQ8fUaSTsieHRipwnRPWbDsfNPe+oTv6rJo2i
         9uUuoUK+GBHmgDDddYi0GDhyr49YqtI1wgf6RydWl+VFOsjACMT+EJ95Te/o/IA1yIMs
         GCVxlJvQCq7Nu8iygRqQwpuAeFGGzkPuzkNJM+HFqDvflOxaUxrxmwea/d2N4CCAaV6B
         CKcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4pt7pRc1nF+Cn4GnirVTuoBBpwLi4yWegrkLdcf7NhE=;
        fh=h+tH/QWdzYAnKAD4Y+ba5vYt4rneaoLy+1kdfsGkOXw=;
        b=dYI8xYSDnoTr3+PoaeCbSAbryBweG+AjJZVJKJu3YvLCwIM/vzzET6+cBgE/hv7rM5
         tD1k9HGg4FjyhyoHE0qz13NODb731xJSy63eP+4F3ULGb84ZxJz8be9dMwRw2H3FwLkP
         B6YtbG73Ik2iBfcwbHrcgG0W2kz5KXa614tYseJhWBtFUWJt56xn+Zb+Cs10tH2dsTQF
         +QbVWjuB8PYa2mfJ9QDiM8nJyf6wPdRq+z35G/czKvre2OnyJmpMAFuxOL2Pmh65uTZJ
         w0mtWOkee2MGvy6k4xNifmUoY7v1NilpGNaxLLLi8Mb5G0TH664WThiE6MpxFL8znyzM
         1Ddg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkUR9WjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385df4c3209si5779263f8f.6.2024.12.03.06.09.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 06:09:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IkUR9WjM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tITak-0001CK-7N; Tue, 03 Dec 2024 09:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tITab-0001BN-3e
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 09:09:21 -0500
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tITaZ-00054u-CV
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 09:09:20 -0500
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-29e8a0323c5so402712fac.0
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 06:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733234958; x=1733839758; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4pt7pRc1nF+Cn4GnirVTuoBBpwLi4yWegrkLdcf7NhE=;
 b=IkUR9WjMStI0B4RyHelLkuofwn8lPO9175vGyks+bpzVeaptKk6RXUfltybmnrd9BU
 Ff9nf58ZzVX1meuLnAs+nXvBGUXFpH37OKjcGK2EWOlqIVuT+F5FOxAh6RI+tCUO4cpm
 sPAtV3sYYez3R8k7C0ezSwI/z4Htky+/JVn+CBuzZDokdC45cvkVsxoPtMA9CTdoWz0J
 cZD/qphlbjMheFoFt1Ka6Mjt2KmCJLDIG/Y4b8Pi02g2NgomKf8XsmqL8EiVwtPPoM1y
 zGOti0cMFBgV7k+4F1Wnr2I3XEWJ1/8yL6+898436LTH6WT4KJTvregV3Wx1N0p5YIy0
 NU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733234958; x=1733839758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4pt7pRc1nF+Cn4GnirVTuoBBpwLi4yWegrkLdcf7NhE=;
 b=vBHzNCxgcc0zJbvtT4bHuaC14J4ncq+l4yLi8JoGxP3H/uc1SAtjO/xwZsx/v16WHE
 LZzUZ+YxO0CcE2bDBV48+TXrsBnHFCDQBFHtIt2ZmEFz0QnpUEjWA/RmJNU6z4PcJEwm
 J6ttcbzzWsMARzwgk3iHmqQIsnLII42DgPO/M57H43A0oIL16Kaz7Kbb2LlgbByBXqbl
 cbUomGuBGCuUA54V5yNwy5q2r3s4qvZRUNirO7HD3WvOsx6cFNl7HT2hFXjY4JKTudLE
 MjvDKvQv4yCnZnHposGfMqgYfL9LKFPkErrxEoD9STbbfVc/yuNru+9nf1c7E2PemGdR
 yrzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqSV9b5CT6UDOL37xOsTirer6VWh6a8sXgJ2n5fBnw47e2Me6qjtihPbpErvC4+ae/dYKKjN5mEQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNCRpN0P+amHm0HD18ltbooljZTg5bQBqADKOUsE7oLVczdsvb
 TwFH5WJve3onmpu0p4QgK4McOSEpcbHsrbBdIryGyc5i/o0aDjORspk0jHuhPJc=
X-Gm-Gg: ASbGncvCl9NSfJPwvjrJbimKz3HaF0rhQBjvDOEdq588RhZ4ONyHBhCCha7B5N9dmQf
 VUFRD0HkJZ8p9011Vf2DdyrvKyym7B7njC9sW1w8rb5vrxOdv2Q4gmpvNDilYjq3T9wRDYSZAe6
 4EBN8S5K/rJUHiV2apYCWUrm91eieFo/JnT7i4T/b55UpJnllVuZYu6X8l/mnY4HwN5jqXncF18
 AHKEHbiT1PN+Dk8O3mi+P8ZlaJ8x/8bSz2cBYkZR6pAWuw2N8Xj9GHKhIa4Z4hG7bndjkIOWscy
 1UPE7sSH6muv6jS/GK6Z5Zr1hMVU
X-Received: by 2002:a05:6870:5d94:b0:29e:62a6:de9 with SMTP id
 586e51a60fabf-29e8868bd80mr2631445fac.17.1733234957916; 
 Tue, 03 Dec 2024 06:09:17 -0800 (PST)
Received: from [192.168.4.112] (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71d725476fesm2844656a34.28.2024.12.03.06.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 06:09:17 -0800 (PST)
Message-ID: <54d6068b-49f6-42c5-aff6-dd4fa61579ff@linaro.org>
Date: Tue, 3 Dec 2024 08:09:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 42/67] target/arm: Convert handle_rev to decodetree
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-43-richard.henderson@linaro.org>
 <CAFEAcA8CbQXg7D22SCyqT0oJAPZ1g7_yWJENZX3wKBOmp4r58Q@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8CbQXg7D22SCyqT0oJAPZ1g7_yWJENZX3wKBOmp4r58Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2c.google.com
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
X-TUID: 7uiKWGoU6tfL

On 12/3/24 05:49, Peter Maydell wrote:
> On Sun, 1 Dec 2024 at 15:16, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This includes REV16, REV32, REV64.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> @@ -10070,10 +10003,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>>       TCGv_ptr tcg_fpstatus;
>>
>>       switch (opcode) {
>> -    case 0x0: /* REV64, REV32 */
>> -    case 0x1: /* REV16 */
>> -        handle_rev(s, opcode, u, is_q, size, rn, rd);
>> -        return;
>>       case 0x12: /* XTN, XTN2, SQXTUN, SQXTUN2 */
>>       case 0x14: /* SQXTN, SQXTN2, UQXTN, UQXTN2 */
>>           if (size == 3) {
>> @@ -10276,6 +10205,8 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>>           break;
>>       }
>>       default:
>> +    case 0x0: /* REV64 */
>> +    case 0x1: /* REV16, REV32 */
> 
> REV32 is case 0x0, not 0x1, per the comments deleted above.
> 
>>       case 0x3: /* SUQADD, USQADD */
>>       case 0x4: /* CLS, CLZ */
>>       case 0x5: /* CNT, NOT, RBIT */
>> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
>> index 4f8231d07a..2531809096 100644
>> --- a/target/arm/tcg/a64.decode
>> +++ b/target/arm/tcg/a64.decode
>> @@ -73,6 +73,7 @@
>>
>>   @qrr_b          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=0
>>   @qrr_h          . q:1 ...... .. ...... ...... rn:5 rd:5  &qrr_e esz=1
>> +@qrr_bh         . q:1 ...... . esz:1 ...... ...... rn:5 rd:5  &qrr_e
>>   @qrr_e          . q:1 ...... esz:2 ...... ...... rn:5 rd:5  &qrr_e
>>
>>   @qrrr_b         . q:1 ...... ... rm:5 ...... rn:5 rd:5  &qrrr_e esz=0
>> @@ -1657,3 +1658,7 @@ CMGE0_v         0.10 1110 ..1 00000 10001 0 ..... .....     @qrr_e
>>   CMEQ0_v         0.00 1110 ..1 00000 10011 0 ..... .....     @qrr_e
>>   CMLE0_v         0.10 1110 ..1 00000 10011 0 ..... .....     @qrr_e
>>   CMLT0_v         0.00 1110 ..1 00000 10101 0 ..... .....     @qrr_e
>> +
>> +REV16_v         0.00 1110 001 00000 00011 0 ..... .....     @qrr_b
>> +REV32_v         0.10 1110 0.1 00000 00011 0 ..... .....     @qrr_bh
>> +REV64_v         0.00 1110 ..1 00000 00001 0 ..... .....     @qrr_e
> 
> This doesn't look quite right -- in the decode table in C4.1.96.21,
> 2-reg misc REV32 is opcode 00000, like REV64, not 00001 like REV16.
> 
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -1660,5 +1660,5 @@ CMLE0_v         0.10 1110 ..1 00000 10011 0
> ..... .....     @qrr_e
>   CMLT0_v         0.00 1110 ..1 00000 10101 0 ..... .....     @qrr_e
> 
>   REV16_v         0.00 1110 001 00000 00011 0 ..... .....     @qrr_b
> -REV32_v         0.10 1110 0.1 00000 00011 0 ..... .....     @qrr_bh
> +REV32_v         0.10 1110 0.1 00000 00001 0 ..... .....     @qrr_bh
>   REV64_v         0.00 1110 ..1 00000 00001 0 ..... .....     @qrr_e
> 
> should I think be the right fixup.

Yep, my bad.  I remember "fixing" the comment, because I thought it was off.  I must have 
been tired, or something.  Odd that this passes risu... maybe we're missing a pattern.


r~
