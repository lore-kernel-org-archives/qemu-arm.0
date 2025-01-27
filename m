Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2452302njk;
        Mon, 27 Jan 2025 05:57:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVElcu1EuRfe4sC6oF++V75FOrjyo5SjVDiHlQWJS+jZpbVoBwLpETzi1cQMsB7vik4ATA9repCT4sXFw==@linaro.org
X-Google-Smtp-Source: AGHT+IFCEY6dhkK+wwpDTlI1wfAHo+XI55CsrPuzxMSvLinilvZigDUkGHzs6RqjNbqGto/3hT3P
X-Received: by 2002:a05:620a:14e:b0:7be:6eb1:f4dc with SMTP id af79cd13be357-7be6eb1f594mr4191354485a.51.1737986269809;
        Mon, 27 Jan 2025 05:57:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737986269; cv=none;
        d=google.com; s=arc-20240605;
        b=K7YTaUsvGwSsZyYvnKo5BEoNcItlzes3r9pRxtI+32FgPC5/dOmvbXCYtwAoo/ppri
         thcPemZhNiZ3ILdp5AZjUMZAukNNRkoXwEi8w38BBQ2vJOwdsm4HY4QhEJ00btQkqz8C
         bAraotPnKN6DJHuBubdSGGVqExwsy/0i2ENuVwSxM0oERj6MmRRW9LdLq5kPgnP9t8HD
         12ozy0u5sAmHYqADuEeCPXrWVPbCnmLbOgKER5kLbo7UNlflVfe65DZUsM7uGjkl0Ld2
         0XDxlI6uVBPaTVrkccRq9dqrf3KcmtPGhJEe5jgptvooF49o1XwQKnuLR+inlj94GK3R
         8pmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=Z+2qpu+pzyZMtIosZMr8wzknKrRPJP2BuWInY845pQE=;
        fh=rOnkePo1cBxysbC66fOtZxnqWiZLjlbt+9S0ROmSCwo=;
        b=j0o2oSuevUt+3J2HTncVzsFZh1U1cSHs4w213wuYMf9KJF+2AZjOLFWxI2T3HpbKy9
         Jrz6CUnTD8Mo+wA0fTdsmTKUrUWvNm80Aj3oVoKLKyDRBea8OlNcO81TqjKCWTQYr85G
         b5xSIVVBKl3dpi5fPsFA6Tq/AVU5MRGv/eEyAv4FzcUn48fv+vdDptISmy8V/kY1cf6L
         Vs6x9blwRmaDpLtm4vgA0XMl8kqrhcwqPl1ntQi0Z4tRK8rmy+TPy7FHrx7PNyhvVKi9
         5eHbCRjbtyIR5qcrYE584B5uj7pZCXx3a5WeYNSUXlXg+C8pxjfticQrSWbafGEn1agY
         KVOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LPHay8wh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aef054bsi967130285a.438.2025.01.27.05.57.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:57:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LPHay8wh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPcY-0002Uz-7D; Mon, 27 Jan 2025 08:57:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPcU-0002RO-J5
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:57:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tcPcS-0007jl-Rf
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737986260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Z+2qpu+pzyZMtIosZMr8wzknKrRPJP2BuWInY845pQE=;
 b=LPHay8whaGdvXA+S3gHdDF5WC63tZEBQU960amBPfLxgAhU5TvTpamlDyioOkOJK9LUR0K
 F0BVbc6Zo0/I5Rfe/zE6EesSkxQ5odvhUvejEysyoUgh9Bt0zYTlXFQtdpE8qbKmmX7Beq
 +W92NFTNmUiH0/JW4QsZSXvXp03jdjI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-VYaWqsBDPWmtqP00BF9nOg-1; Mon, 27 Jan 2025 08:57:37 -0500
X-MC-Unique: VYaWqsBDPWmtqP00BF9nOg-1
X-Mimecast-MFC-AGG-ID: VYaWqsBDPWmtqP00BF9nOg
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4361b090d23so22719115e9.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986256; x=1738591056;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+2qpu+pzyZMtIosZMr8wzknKrRPJP2BuWInY845pQE=;
 b=CiSx6yHTIwatccGfG6TzHzTbkj7z9lAR4oY9rVy7pl3oduefr+uupEi9Amh7E9zUSH
 OOXzxPwTj91p4IZdop3z0XFeSIoN6NhYQwmvk6UoX/zfssZ+Qrb/soHd0vKd1JBjG7Rm
 oFgPYGGnpQg3V+FtdVTkDsV88UKCjOk552ZJ9r99ftBogeSUUUxvcMgU7qXQWACT2KvJ
 EB09uAdudYifBtN5CeIxrBXa61Y3UsDSzJyLFDEmh5oZ0aqRzebjc2yzStMOrQg74P2u
 WQFPlyJ+8+xEpbC3PLM9GBnzRTfLDQK1K///jL8jPPv8SA0ENAPRZaaaZXax3kae7fQ9
 wU/Q==
X-Gm-Message-State: AOJu0YwvQAie0BOeDNqYjj9Tx5vwNJ8z03wed6cL0VVfTGgVjVyuQb/Q
 v2sPY7FWln9MBsFIRqxuimev3Y5PqmOs11CjvRVaUmrqITjkbmXn9O9xdJwUoZ2oOfQXPyIlruK
 MNaROmSpMPMShfIi+oNR0DiqfHBdl3ESHYKiZOgFvTbwJSsXfRA==
X-Gm-Gg: ASbGncsOzQdpqn9stvRZs2eE31TlpctQX7VnILuHnTpiSCDYaD+fYbizszo5ZJNkxol
 rexJ0hGxlkOFP+iS6H0DU+rcYi2qai/QrQnn0rh883f8OA0BnKKfpf7RBxhzUDA8WitbVQsA/fJ
 cULMM9nGe/hC/ii+d+pM/TCIfmcldmlJh43F0NKnZSN9n6xk+0xNozmI/1oSoU12loo1JH4Mlmp
 tDqdbrLTxLHeE9nh5H6yKUrpit3JJGRjBwyevZojpCNAj4CIBDmE/w8ePbcYZlSwORLLTtwnPxm
 VMNQVQyDKTe8ub+dc1ulk/+kT5CjMA==
X-Received: by 2002:a05:600c:5012:b0:434:9e46:5bc with SMTP id
 5b1f17b1804b1-438913ca718mr409945565e9.10.1737986255890; 
 Mon, 27 Jan 2025 05:57:35 -0800 (PST)
X-Received: by 2002:a05:600c:5012:b0:434:9e46:5bc with SMTP id
 5b1f17b1804b1-438913ca718mr409945285e9.10.1737986255532; 
 Mon, 27 Jan 2025 05:57:35 -0800 (PST)
Received: from [10.33.192.228] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0ecsm134745655e9.30.2025.01.27.05.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 05:57:35 -0800 (PST)
Message-ID: <c364ee71-7f0c-43d2-8ded-a7b8156c0839@redhat.com>
Date: Mon, 27 Jan 2025 14:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] target/arm: Set disassemble_info::endian value in
 disas_set_info()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250127115426.51355-1-philmd@linaro.org>
 <20250127115426.51355-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250127115426.51355-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -rqLtKAWxVE6d463HDLf6MdUuzK4b2aqs5haPxVZEUU_1737986256
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: J1gmFQL99Ims

On 27/01/2025 12.54, Philippe Mathieu-Daudé wrote:
> Have the CPUClass::disas_set_info() callback set the
> disassemble_info::endian field.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f9fdf708653..9de8c799c77 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1220,6 +1220,8 @@ static void arm_disas_set_info(CPUState *cpu, disassemble_info *info)
>   #else
>           info->endian = BFD_ENDIAN_BIG;
>   #endif
> +    } else {
> +        info->endian = BFD_ENDIAN_LITTLE;
>       }

I'd maybe rather go with something like this:

     info->endian = BFD_ENDIAN_LITTLE;
#if TARGET_BIG_ENDIAN
     if (bswap_code(sctlr_b)) {
         info->endian = BFD_ENDIAN_LITTLE;
     }
#endif

What do you think?

  Thomas

