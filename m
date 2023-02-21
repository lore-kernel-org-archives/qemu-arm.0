Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3027574ejb;
        Mon, 20 Feb 2023 23:56:55 -0800 (PST)
X-Google-Smtp-Source: AK7set/sP/CegRNqD61UmKDjlpFqisvcXo92tjqqxAV4jtr+7ysZtdR3POu+h08LwsV+RxBiBoty
X-Received: by 2002:ad4:5d44:0:b0:56a:cf18:599b with SMTP id jk4-20020ad45d44000000b0056acf18599bmr7132642qvb.14.1676966215545;
        Mon, 20 Feb 2023 23:56:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676966215; cv=none;
        d=google.com; s=arc-20160816;
        b=OwLVRBzgxBqjTaZUSh6Qg/Uuvztly3mkmm1rNQwAf4RSgBBVp2MP9YXQEP239KIjww
         cRhQPXjPqdEUlxRHdLgC5lw6XHDmyaV/tN8eafIHhcUeHpdP5e13KKqCBFvV78G3LwJh
         uPjNXymiBRWzX9hUS8SNDqpG4SIISB+aWS6vFUKXwDZxPs9mlAAY77u1T86t/3pLnqKu
         GelGPWt5xtEMMZK2mM9BAoUAQdMgfezAIMod3NlZ3qWCr4izLrfNTUnGv9/ULjpamosa
         vaKA68Qburlwu+jO/MB2ZjrO0bBvbkqrt245ZQa1sK6vcmyEp3iIdp4uFM2OEh+vrSjs
         z9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sw6SJyGjDiG+hDVh2L5z58E7kxqeYqR3RCNI23/fJUQ=;
        b=EdV5+veUOBn7aFTx0Eg3W7qBz7qIGFzP20pzT9nRi5Ecwnsz69fMkPEpQsbViOq5Hf
         UmalkrtHLBFB2mdyc35IStQmda+wHVLpMxiRAeShhRZ2a6CPUR1xKYlNCsdcCkIhzz9q
         ah1CyfEzqgTUDe6tJ1GJ0AGKjRiY0L2esMKijgGhSgFDLlW9Q7StrvVUgW0zWN1AaETw
         rbW3UXYIMi5CRv77OUFfcuu8EVu/CUUfN+dbgFioshFcVxTXHkvGpDNsAYpnduby+vWK
         HdGaK2xxOnpHr1F+1dfs+igPUJDKUnu/7Mb3WprxY2B3iiOoHeLbbmXlreifKIQh2hEx
         ISUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYM4wAFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05620a44d500b006fcc90f374dsi3316248qkp.468.2023.02.20.23.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:56:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JYM4wAFk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUNVe-0003mR-CP; Tue, 21 Feb 2023 02:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNVc-0003m9-TH
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:56:20 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNVb-0001iU-75
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:56:20 -0500
Received: by mail-wm1-x333.google.com with SMTP id bg28so2564012wmb.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sw6SJyGjDiG+hDVh2L5z58E7kxqeYqR3RCNI23/fJUQ=;
 b=JYM4wAFk+UmaG5ZrP4LlC2x+Vj7lUcuyPH+isHH0QoB3J1xAlcs3X9+Ip7AT0Vexd5
 AnLmYDYEkHq/wAr1ihHQLwScKOpuspcbdA7AckykZBoL01Z9BFg0WEPuX5riAdWBKPs/
 jql+pdvzyEldHYO8aJgr36YZqprG8hl29/IfCazt2nYOqMOuWCnOkbNKyqNtSqvGLhWF
 Oe9b+RvaF4BXUtXgTms2A97CjvDBPci9Knr1wrgy9Ozm9KPeX8TzD0jJgnX7k/qeqlrA
 Ya17zc7XfqyNM74eSsX4RTrhxwpEbwKN+I20IYbfOifScZCTwxnWtXaZ6agx0kgYtkPj
 I1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sw6SJyGjDiG+hDVh2L5z58E7kxqeYqR3RCNI23/fJUQ=;
 b=sUb+WAJjxrXA4pHvD/iVVc+I8z5lTiB2/cTy6jltfMgszLjCQsw/xmRclAPjL5q2b1
 OZfXDQV4Z8rwQ/3a2g/XGDvgUFsMowBdS2MEzTqMgORJ8Lj+3hvkclB5s+h4J5aDu4rC
 osHzdtt5kzYluBJbzyuJCaAGEl2HfkzQ7FkH2Jlc8D+8/icD0Qp3NQVRTESm5WO7ROKf
 GNSGKSwiLlzdwgOWEGbPNaYlmVlYsngRhZ8bZb5ra/l+o3ukGvvWeIiVBh0QJIrkw2Vh
 7lhoIhFdloRxECqCJHp2ky+oOYxM6imXiJ2XaARqwdPtIqUznEJwgnZBSZvLI5GgIwyy
 NIPw==
X-Gm-Message-State: AO0yUKUz+SRY30TTs0Kgo0Whs2g2XBCIbdfDP6ksz2/xHSvu9tcjqtMN
 scM+RBV+cJUnHzk2UBRvIQAsXA==
X-Received: by 2002:a05:600c:22ce:b0:3e7:6a59:d9d3 with SMTP id
 14-20020a05600c22ce00b003e76a59d9d3mr1145644wmg.37.1676966176415; 
 Mon, 20 Feb 2023 23:56:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600c451000b003dc5b59ed7asm4219669wmo.11.2023.02.20.23.56.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:56:15 -0800 (PST)
Message-ID: <b1a5b38a-73ae-9610-676b-b27dd4c7195a@linaro.org>
Date: Tue, 21 Feb 2023 08:56:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
 <20230220232626.429947-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220232626.429947-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: yKzQKYZKut+4

On 21/2/23 00:26, Richard Henderson wrote:
> We will need 2 bits to represent ARMSecurityState.
> 
> Do not attempt to replace or widen secure, even though it
> logically overlaps the new field -- there are uses within
> e.g. hw/block/pflash_cfi01.c, which don't know anything
> specific about ARM.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/memattrs.h | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..d04170aa27 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
>        * "didn't specify" if necessary.
>        */
>       unsigned int unspecified:1;
> -    /* ARM/AMBA: TrustZone Secure access
> +    /*
> +     * ARM/AMBA: TrustZone Secure access
>        * x86: System Management Mode access
>        */
>       unsigned int secure:1;
> +    /*
> +     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
> +     * easier to have both fields to assist code that does not understand
> +     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
> +     */
> +    unsigned int space:2;
>       /* Memory access is usermode (unprivileged) */
>       unsigned int user:1;

'secure' & 'user' seem mutually exclusive. If we get short in bits,
they could be shared.
