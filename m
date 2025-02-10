Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2226960njb;
        Mon, 10 Feb 2025 13:24:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUr4Cw8ytj+asgcRi85RBfIWFTjNNO1+7Tu2g/+uz4YeRM+0IPTH0dLAroyMIpy9Z5z9MCG+sZ+7/ghZw==@linaro.org
X-Google-Smtp-Source: AGHT+IHsJMahtD8To6jWaKLWvwPzNTW83PymQv903rYDPTco2XEXYmwDtrAGYMAsMu0DiMSOYzTW
X-Received: by 2002:a05:6214:4004:b0:6e2:383f:4acd with SMTP id 6a1803df08f44-6e468044c2fmr15089056d6.7.1739222687635;
        Mon, 10 Feb 2025 13:24:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739222687; cv=none;
        d=google.com; s=arc-20240605;
        b=H3Yg8AymtFtv9ibbURAP8nA2wJaqFCsfJLj3vX4Ffc5rxvj052yDZDpggu5DPRMeiC
         54gPRJDdFqML9G0i4ipiACB8xudrnuUVqtfiQJAVA8k0I/xx359McKxGDQ5i1T55WeGJ
         kZej030jqz8OZvZt41jR85y/sm+llT4kIixD40ZjKdexFIjqdYLnlVmghQVI094zYnzh
         il/mY24v8zakZa34o0cSSyBLZfcYSJyHH3oLMyFit9A0agbfcino2QYBAS07TiV4D7yG
         yJBF60Rmj+mPNZoaQpTdmk5fxnpmi0fweAAA+mKED5toRdQ9nHjFBjS7fbCF8JZx6/nm
         W3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RX2Ba4AEmWE/ZbSo9lVv2ayt1T6p6DSyJXpJ16zRnN4=;
        fh=bSVRPDnokW3MOTYhv8xMTcXtWUmorbLT4i87+r7o+SA=;
        b=V4Sperz7sZIG3zrvauOt5m+0kOH96zJONF7pUC1Jwh0FrWQqi2NvXpV0LPXXVswPob
         Jwmlra12SrQzB6w4IXdb+8WOzlSeEkbQWUowfJhquiRR2P3l7EkZ5TTxeCvZHyTZZQEj
         VUy5UG96Lys7E084utogHm+Q3GS+SF8CXOk1AAuSsXBp1yT0HaktA80sUq9P5xg6kdYd
         UWnYQEYG+0oIr1tjRrnvu10dkTLXvhVeoHgX0gNG8a706kbli1yUVC8SxCz8s7g7V7Wx
         LtIEYjA6218fK2ZHJfk85+CiWncyyTIbcSmkYMcsAp01tvPv16oMJ8YLNAVKx/5kD5Ja
         BCQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epB1jlpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e44f5f5fa4si69210716d6.188.2025.02.10.13.24.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 13:24:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=epB1jlpg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thbGb-0001gF-Id; Mon, 10 Feb 2025 16:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbGa-0001fR-6h
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:24:32 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thbGX-0001VS-Tf
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 16:24:31 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso54174375e9.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 13:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739222668; x=1739827468; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RX2Ba4AEmWE/ZbSo9lVv2ayt1T6p6DSyJXpJ16zRnN4=;
 b=epB1jlpgZC0OjNy+484kTlELBnLW/ySQRFM6tLnZAbj1ve6tGAbwsM97u0iKNPJ3i+
 /p4fwRb/0pO3brsztRZ7i+e+xEIKQQshOdtySVCeACmVF9D21soXFS9FrbldkCXHL1FW
 7ShmDamuNHJ4nxsG/dW501VFC/b8PSUwJ+BG4OIFr4fowIcTG33wvNtkDx6ORrPGLclS
 DYc4Mou+ivDOu3o7sz7o15DYJiWsA9JvEUtRVxGO8j5gCVh8a2lyHU+SBIuVpkew1pEC
 IS4v9UMv9zAiIqGOJCBSIvu5i3Uqtf0/YpoX/aVCjM5W+1ZNwlbBvOMFgNYmDUQEWNf0
 XV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739222668; x=1739827468;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RX2Ba4AEmWE/ZbSo9lVv2ayt1T6p6DSyJXpJ16zRnN4=;
 b=biPr6mKnseZcMuGyflanPRYG4rY803Ho+M4XnRJsf5J5q2SglMYvfQcF4Gipi8FCbs
 0jGLa1mtlBz9YHGFOuQTPpCC38qJzEz0yApn4rkQKTnSTztZKPxSMMK50Aak5bZOBuST
 1owobfiHoYiY+WBGQZRoDlYeDMHr2t4Q7k/uFmsy8DeRILA2sSQV7PLIwbUDLILyKjq+
 an7Ee6koNmCTBzKXTZxnB2vCynCUjdel4r7RT/MqT01Kq4lRxbEgQWuqPWTUu7Y1P9P3
 Hz6SPVchVcjc9sf33DoJLSdzndK99qAkvDZyfmzVOkZ2l2aeGNf8Nb2wXzBgGTl7AJMV
 2A8A==
X-Gm-Message-State: AOJu0YwSjvxPsNPZFk+pA+W+G1MMqBLAWxVv2Q6fEfy7KUn1O2N4e+Ya
 tqsUYWE74A+l4dzntUq9i5j1hzANPPOWIs7Dqv5BcOMK1mJW8gnfxuXyI422kKE=
X-Gm-Gg: ASbGnctJaAXtUaY3gMbALg58xJdDrcWTHEj9fZVo0iw/C66osziqXXon1L8DkTSr/U5
 jQBsliHN1rKYYG6DRYQSntWmdsE8Fm5HI47+I/Rsi3eAKiJmsS0YSQFqwJhB+QEjY3f+8mnpXnU
 oo3We01QvE+cz76qnSatU24sj3Q+wGG3iAzMOaLdolfLoeekvg1JwzUGXXm6rHRHSZ+ULtLltmu
 fE8wboms1troCKOlEjVzuddUYvVTwtK5AArqZZJFwtqkikj+mGRdxkHETq5L2KR1H4ykmHOfN8j
 phV6VBNXyzxNMb2Kkz1rb1BG1ecOUvoVL7SJWe3o0g/E2uTkdq/zHUXElGU=
X-Received: by 2002:a05:600c:4e89:b0:439:45ce:15c0 with SMTP id
 5b1f17b1804b1-43945ce18d2mr34098865e9.25.1739222668139; 
 Mon, 10 Feb 2025 13:24:28 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcf35b15bsm9659767f8f.64.2025.02.10.13.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 13:24:27 -0800 (PST)
Message-ID: <ad266394-bf8c-4030-831c-b7e16aefd803@linaro.org>
Date: Mon, 10 Feb 2025 22:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] target/arm: Set disassemble_info::endian value in
 disas_set_info()
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-4-philmd@linaro.org>
 <c364ee71-7f0c-43d2-8ded-a7b8156c0839@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c364ee71-7f0c-43d2-8ded-a7b8156c0839@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: VQxWWXTiTiYN

On 27/1/25 14:57, Thomas Huth wrote:
> On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
>> Have the CPUClass::disas_set_info() callback set the
>> disassemble_info::endian field.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   target/arm/cpu.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index f9fdf708653..9de8c799c77 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1220,6 +1220,8 @@ static void arm_disas_set_info(CPUState *cpu, 
>> disassemble_info *info)
>>   #else
>>           info->endian = BFD_ENDIAN_BIG;
>>   #endif
>> +    } else {
>> +        info->endian = BFD_ENDIAN_LITTLE;
>>       }
> 
> I'd maybe rather go with something like this:
> 
>      info->endian = BFD_ENDIAN_LITTLE;
> #if TARGET_BIG_ENDIAN
>      if (bswap_code(sctlr_b)) {
>          info->endian = BFD_ENDIAN_LITTLE;
>      }

This misses:

        else {
            info->endian = BFD_ENDIAN_BIG;
        }

> #endif
> 
> What do you think?

I'll go with Richard's ternary suggestion for v2 and see :)
