Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6549392ejq;
        Mon, 15 May 2023 07:23:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6J56rzr+72xxVsUTyNojWy3P4clScPDOKjveaf8bl20c7FsP0vo9gCEhTOtMwEWYRXBBFw
X-Received: by 2002:a05:622a:389:b0:3ef:3ca6:c77d with SMTP id j9-20020a05622a038900b003ef3ca6c77dmr51579348qtx.47.1684160603251;
        Mon, 15 May 2023 07:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684160603; cv=none;
        d=google.com; s=arc-20160816;
        b=ASr+iNQSaBo35pvVgmqT2MWFkM9poIy8jZwzKKxCk5sXa9rFeE/M6Kc3BVJ/QbD0Pw
         AjiFYnq6N9dBy2tdst8l9sjCbOe02Ltm3JCFTioX/Hexk1XZrhRT6XQTyhunr+pQ2g6M
         H3HjZhylF048OgnKljvoAB3NjUTx+e3pZjp5dWVhgY9PIkwdAWJETeNCSNTf75c9JSrA
         4mtLOxPLu7m878JV9/DJSR3m+ppzsifhKV02ORMBYI+KaiiOzI+5m7HPRkTH535QrUKA
         XjugLuwZbopjJq4vbG+16wywjp/h/BCuDqSSDkfbKEND5/FqJAXibVy32OADSAMxEBig
         frZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=63IxXn6lknAnNNZ26iWEa7K0sTIgIQrk26ctUlUYqMA=;
        b=rHxzIJmUZjuCOf+j0CcPElm6DESvZNPXVWCeKrW7e7HYl37j9nece/CK0wwla+AYx8
         T9Y8zEv5VjLYDS3SDz7c7x80asTw16CYeE6FwLrtaOzpvNE2aghQq6BRevIaNQcT1cJ/
         ZerNh6KGvvgcP7OVhuKDzUG+Y9SP4y2EX0jRGR5AeHgrayV0xkjQr/k0x3fXH8TXKIkl
         /z0Xj26FQmTBC3UqWwV8oCIm1fHrg7K+BBgfQE/shlxiKiDE28ezxWADHijXiT45ewnX
         EAsyqIhf59qWlrbwp6fk6suKI6lKzWdC7lYFL3J1wkNu+xtaa/cHNzprbneQnmzfNFmU
         OQHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JNwRkxKk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15-20020ac85ccf000000b003e8b3fd4ceasi5967599qta.126.2023.05.15.07.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JNwRkxKk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZ68-00025g-IY; Mon, 15 May 2023 10:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZ66-00022d-Uh
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:22:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZ65-00035I-5I
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:22:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1ab267e3528so91495015ad.0
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684160563; x=1686752563;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=63IxXn6lknAnNNZ26iWEa7K0sTIgIQrk26ctUlUYqMA=;
 b=JNwRkxKkOt3jmQ0K3tmg/plp3Lngfa5GWZoE+V7KY78Pb7yHJK6fcERQp1/kapZy6W
 BGWai5kOqKpm86eABCneeS2gk05EofOONIiRVMXcw9y17Z7aF9rbx8PiAJzODcHzMUbi
 RC3PgFFjLls4KGWcNgBmT4OeTUK9sta4ZvSfPnwJM+e9Ygf0ApdKxwdkyrx4MUFYdZoN
 J4gJ0IW+uCi6Uo4YEVv3rTQ7aG8CWWtjxnyM8qP4StlX2AU5yrN7fQjyPdne40ySZ0nY
 O8WsWwMD3G81yoKwVFn3dF7i1sP3n2b3SobDNOK4Ml2gu7G/z+G18F5Hu7xEiuzlwOgL
 A1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684160563; x=1686752563;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=63IxXn6lknAnNNZ26iWEa7K0sTIgIQrk26ctUlUYqMA=;
 b=DDBliK73JG1BBMMlqleXttQOhVl+4kGhs/vSOgQmQuaSvNrQyOo+P7U8/cRnkeY6rh
 yxXiBCHeTie6jTQ3cL7NnfTZhBmEKMflRLuypzC7hbPIwZlmFeIznJaRlzw2i7fqG0CS
 DQXi+BQbaYPbcYOHPmJD9qhshMiz1cVKxb9rBCc/VuIYBK2tx8U6GMY9DFzQwFt8re5s
 Im/g6XWtWTILDW+pFiG06aE6HWdCfTtp8+7iWXsrsl0KKvo/YCD4Sfk1WX1Rm1C4lehU
 aRarPCaTbUJ6ef0dbsAdvB791tvd41+/bk1lB7vC0iJm/LY8UWuhXEO6H6WCXrRTfvXY
 HmnA==
X-Gm-Message-State: AC+VfDw5VYWnCnHFkaBD0OcDpk2KV6rIijEoxAh4it0xttQxIzUyPaoW
 LlDBUR8DC3QycbRmx0UPMU7VFaFshPQZqcwAPSw=
X-Received: by 2002:a17:902:d2c4:b0:1ac:71a7:a1fb with SMTP id
 n4-20020a170902d2c400b001ac71a7a1fbmr37024344plc.18.1684160563373; 
 Mon, 15 May 2023 07:22:43 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9902:96ac:8d8c:4366?
 ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170902ced200b0019ee045a2b3sm13605090plg.308.2023.05.15.07.22.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 07:22:42 -0700 (PDT)
Message-ID: <06acb8a0-f929-da28-9af4-6dcbcb4787bd@linaro.org>
Date: Mon, 15 May 2023 07:22:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] target/arm: Fix vd == vm overlap in sve_ldff1_z
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20230504104232.1877774-1-richard.henderson@linaro.org>
In-Reply-To: <20230504104232.1877774-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.811,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RSM1HnA6sb0R

Ping.

r~

On 5/4/23 03:42, Richard Henderson wrote:
> If vd == vm, copy vm to scratch, so that we can pre-zero
> the output and still access the gather indicies.
> 
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1612
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/sve_helper.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
> index ccf5e5beca..0097522470 100644
> --- a/target/arm/tcg/sve_helper.c
> +++ b/target/arm/tcg/sve_helper.c
> @@ -6727,6 +6727,7 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
>       intptr_t reg_off;
>       SVEHostPage info;
>       target_ulong addr, in_page;
> +    ARMVectorReg scratch;
>   
>       /* Skip to the first true predicate.  */
>       reg_off = find_next_active(vg, 0, reg_max, esz);
> @@ -6736,6 +6737,11 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
>           return;
>       }
>   
> +    /* Protect against overlap between vd and vm. */
> +    if (unlikely(vd == vm)) {
> +        vm = memcpy(&scratch, vm, reg_max);
> +    }
> +
>       /*
>        * Probe the first element, allowing faults.
>        */

