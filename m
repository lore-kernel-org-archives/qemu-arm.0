Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3816776dye;
        Wed, 2 Jul 2025 06:34:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcPtpyAPdTqFSaYOdp4lQpY+WWCyim0UMF5vmUcm5ZFyCeUYhoRrruPecwjKjHuYLkRAHjjoGVBgj+FQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHbEZ1Swd8RNF4Z6ciD+nCd1FVcis6+PT5xa25eEuo2PK9LwT4s88WYlQIk6FszI22IwdSL
X-Received: by 2002:ac8:5fc3:0:b0:4a8:5a:9e39 with SMTP id d75a77b69052e-4a9769c82eemr39792581cf.45.1751463296756;
        Wed, 02 Jul 2025 06:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751463296; cv=none;
        d=google.com; s=arc-20240605;
        b=i+6VwoKrCMSdER/VauugYJswLzn9PNuJV8yXb04MrZc3mIIbaBiM9yS8p3QT/SCG/B
         63NEkvE4q+QE6+xCPiHUsl0K3VfFXe6d0E9IqYAvoC3Y5jRSNX57URjSGA7p0R+i5mW4
         5oEhw6KC5EzJYVZNTdP4bfhr9agnOR0EhDOfB0AML0DbDZfcZuvgWzVjaBeK5Z2E5aDA
         ntg+Kcxiu1u5fgLAHP5g9XDB+e0ZXC2CGm+HdELW0l3L1br67/XI1vWSPxBDcoB/Phqs
         KqnU8Na+DT63mkfXnSIfIxvQO1TtEnbWeMjWUOWvvKquTtDSFy1t3ctmF5AQJl0tCyZl
         1Jnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=170406iYqLKyQnT54NoiQhocvfVa4R5G1KtXLrLTqtg=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=AGhfimHZgbiD/8+K29+gfFJHEx4b0J5MDurfhy12fO0LqQ0y6CfLB5OZw2y0iDFngX
         7VfAHi3fitUX7gTvB2ijQuCS6UN08aZzGmqEAnEkOrrB8BxIsIoTyvV1Q47GOEKMLH0L
         o9HBg2urpH5b36pUvvPJ6Of4uJfQ0vgSLDUO1KWQwYRT1YJLCmetJmL+osFo/9Eyq33E
         P9jKDiq9vOjm90lUI71/P52SzNzO8Rfnmh55+42WyBwP/NP+ZNC2DLY+dmQLZ3z1KTzO
         zBi2gdXZg7hupXp1QKBFkSesKzj00CySE6Wt7A2Xdm3Mq5k9arb5Wu6YVB9hbmIm5AfO
         NviQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ue98W5iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e73b4si131832301cf.206.2025.07.02.06.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 06:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ue98W5iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWxbl-0008RO-Ac; Wed, 02 Jul 2025 09:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWxbY-0008QW-Dn
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 09:34:28 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWxbU-0001nh-TE
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 09:34:27 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2ef60dbaefbso3081671fac.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 06:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751463262; x=1752068062; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=170406iYqLKyQnT54NoiQhocvfVa4R5G1KtXLrLTqtg=;
 b=Ue98W5iNLQ1veTvQa9usRaqQiDNYesr7jL0X3BlxbOQXi/maFBul3RShi5bcOUinDq
 BNSgGhtAnZtwLMCY/t+aRjQKSpY9u+fIMcBELSa6tT5KhRnhOX8qz5qeDn4g/CyT8Yfr
 Pzk/Y2tcLBnN1WRHCsDfhzlsocet/WrBus07xFWplH8TGCkJGiYvWfTk49pbJOO0Osfp
 rjmdawCXES2QF3MNVqlDK+7BP8ouY3rkzRBDOkVCKmMgQSIq/5RYq6VBDfy7gEcXWewa
 Q0PXqjIh1Lr/BdSpOGWwgTFpsylv9C73Qs/U4ptdn5t+QbPjW79L6jVx8a2CHx5A3k2C
 7uBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751463262; x=1752068062;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=170406iYqLKyQnT54NoiQhocvfVa4R5G1KtXLrLTqtg=;
 b=Y+4gAuQW0qxD3h3TjHzbg2YXsRnriB0kC8lGVUR8D6Md+orTakqpKmIJjVOyEzbCc7
 5j+b+HJPVVV90xuBBz0RnxaOXny9CUrgW/YsBYTsSnes+Hcn8lSoCxesIf1fhiAOKMGu
 ceSln9zZl4RT69zT17JqRiecXK86AvjdfP5lj5s6pUXcdI7bhazVoEyEme11SeUJMBYS
 FTpeeY8V07F0qrIKTY7ChkCcsNKvwFhVs3ql9GywhO/xm5UVC3jRoTHRujnk2gORfni5
 1+Wb3xnQmINO4kkZE0MW7wbDwTIi+FlPtO6sBdLkqxS+HGdlemSXrQ6LTwFOH7kYv7yq
 fuBg==
X-Gm-Message-State: AOJu0YydvorzZC8baZYr1i40e0HnW+iFoh/XXfkYP9QY31XHu7G7mviF
 dOaAQEFrbN9ZeUjdXUaZOhHdMGm2jUEz3k6NkNfukTBZmLIo7iJM+DrxebjVLl93/zg=
X-Gm-Gg: ASbGncuN8XxhITv/K7reujBAC2jyeJQ7bncNF3Pp97hqvlUQUnPa8oJVMkxXgoLEFjB
 8XP4gguQZIHYnUnN8FgfErvlrcC8i8GxEG4cBFkvgqjlwGnI4yqYzYIWPeR6AhI0X+eTVb9/t7k
 RwTNDiAcBpzdJ65iVBuTlSNkpkM3j6Nuese1faPO1XA8rDDDzKoXPaR1DvdlHVjoBX7XG38GwGR
 5l+/NH/hVqxmymJTndUKxODiQC5AxfH+ZjO2risbKRWvVVADLewbRArd9QBRgN2JUa164aUvhHy
 r7YRtlplOU8wQAj0q40YKPk3iuH8rJ1bn0jWAFMjktcGA6EEqmvFjClFf0dYMJQDhdbF61kZ++Q
 A
X-Received: by 2002:a05:6871:54d:b0:29e:74a0:e03f with SMTP id
 586e51a60fabf-2f5b98ccfc8mr2140900fac.24.1751463261675; 
 Wed, 02 Jul 2025 06:34:21 -0700 (PDT)
Received: from [10.25.7.74] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1b2fsm3885402fac.32.2025.07.02.06.34.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 06:34:21 -0700 (PDT)
Message-ID: <7ac9e272-c0b2-49be-aae1-720ce4dc313a@linaro.org>
Date: Wed, 2 Jul 2025 07:34:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 60/97] target/arm: Introduce pred_count_test
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-61-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250702123410.761208-61-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
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
X-TUID: b/6u7Va9FsfJ

On 7/2/25 06:33, Richard Henderson wrote:
> For WHILE, we have the count of enabled predicates, so we don't
> need to search to compute the PredTest result.  Reuse the logic
> that will shortly be required for counted predicates.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/sve_helper.c | 47 ++++++++++++++++++++++---------------
>   1 file changed, 28 insertions(+), 19 deletions(-)

Hmm.

> @@ -4134,16 +4149,15 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
>       intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
>       uint64_t esz_mask = pred_esz_masks[esz];
>       ARMPredicateReg *d = vd;
> -    intptr_t i, invcount, oprbits;
> +    intptr_t i, invcount, oprbits = oprsz * 8;
>       uint64_t bits;
>   
> -    if (count == 0) {
> -        return do_zero(d, oprsz);
> -    }

It's possible this breaks sve_whileg until it's fixed by patch 63.


r~
