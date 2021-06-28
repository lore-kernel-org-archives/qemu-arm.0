Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4169523lfg;
        Mon, 28 Jun 2021 09:54:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6lbQ/uXwozpSNB9QtZmy2PIUXzmBdQ6/ZNuKVeJzkTWwOi/y+EEwQn2eGab8DDic24Czc
X-Received: by 2002:a5b:4c6:: with SMTP id u6mr33730189ybp.31.1624899278616;
        Mon, 28 Jun 2021 09:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624899278; cv=none;
        d=google.com; s=arc-20160816;
        b=xXJqNEA1lKJ+8ol4BYSod+u4bZYzTNcyOjkejcAjqFaNYgvVYA5rRU3hppHSvP1APj
         S6CreKeZYYlgpwQj9M2yqhIwDaOay6tjJKia5h/nOEmRT5Ul+BkLP8jLPs+j55xw9qan
         +8bdL/EQG0QxK9NRIfpKuytLvrv9ySm42IayasGA+9AhBD2DQ8ZuQeFwpvdgRfKqeBJL
         lnX7fr48HQkxRhNk7ZqmA+aTYmaOjrbPEXkqCO/irivSTEVDRr0gFuXoB0EeUGQZxnPV
         1ecNg0Tf8cTe8PYAJuLaVGxnLCDAJjy6LlayAHhmQVkGIVLfcGjAgwYkMG4qEdCda1GV
         SEbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PmscNVFaRvsQGd7iPIC+tEfvjAlvthGNjNXCdf5iAqI=;
        b=ISo1Ts5m3texIviEfOMl3QiY+tvgUJFQtin/J9ku7UTFs6fK2aFpUdMPBA9YHa18Wp
         nxZHZlbGyXFdyP2FSV/KbgPhTqFrQFbNzCaqWOG1Udogx11NQBKobYYkgoVykKQ7b5/x
         lBB9dfpGzNI94WnN+ZqRVtzYsiT3Pvs2vsXDgpTD1tTmHvNWsweXAZwQSDhWzRULkibX
         yEtj4JStdRqPB+XP1rimJM4YJhYA48lDYWkH0+Mz0xS9oN4Tc/pQ3Ltaw1NJMfsf6h70
         1a+HNpq/QQOIjgM1ffajoFQOzdyPE5qhsCH12Xvfxtdug4ieXeo+CfC3KVjre6IcrZ0W
         KRHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHSD0f4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si17247545ybu.329.2021.06.28.09.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vHSD0f4u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxuWs-0005Ov-1O
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:54:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuWk-0005OX-JD
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:54:30 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:37780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuWi-0005Uo-UY
 for qemu-arm@nongnu.org; Mon, 28 Jun 2021 12:54:30 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so13330414pjs.2
 for <qemu-arm@nongnu.org>; Mon, 28 Jun 2021 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PmscNVFaRvsQGd7iPIC+tEfvjAlvthGNjNXCdf5iAqI=;
 b=vHSD0f4urOiuaz6kps6JOx6aVydiBZS25Dz9DmWh1KFvO3khMYAI/fMKHH69YR1BLN
 oKghUazGRAmSrNOWXnGgm7BzDdBqmjkpj1oyZc4GU9OVxbuye+xwWuyzSX7qp23ybKNu
 8tZWFkgmt+6NVoLN51YM7TGXykzjnoJR1dqohdzCvhKTclOaHcxIxC/Gbo3Hev0uBMYk
 /uVSG34X28dWV1gsd7pEdRmR6J9wK4jfLTR/Azp1Gav6bI+FXIAJH/LWtBRmW2mV/t7T
 GeR75UBPiV/sQnuUDe3oa8ySrxPhanCKzR02/i844whfHd7tVqLQ+54da4ClszD+rHUF
 R5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PmscNVFaRvsQGd7iPIC+tEfvjAlvthGNjNXCdf5iAqI=;
 b=IsI14ntNffeTd4R1QzUiXAp9c1Y7tJ2laQcsOt77PP1emv3VJFbN565cBBZo/zO3QT
 N3yqQT5VZQ7py+UFe0cXnQUCxJAnFVDGzCr8u8j8yXOIBqzAAUV9IoptnGeKLuPZgDab
 fsxwInreKMSp7ap3mff2HqJUbVJiihR/IsYXKiZIibTGaMEEjtI8BUESZRTRH0sK63cC
 rpRolo2xEQplidK5Mf4g72/CWsrzGhFlXsu4Cbf2WFG9l0TA53VGDWnvPili56Mk/NeS
 YWFrH4yTjvqOWki77U/DT+0EocUmMCR3oQXataXcjycg9hbLRyCqt5w0+Mv4gJHLurUX
 ODCg==
X-Gm-Message-State: AOAM531LteKEIlKRUpX5NTeW4J1mAGbUeBIE9e92Rzn8u7brMkPol5ZY
 ulD7zszx1t25qBS73Jwtydj8Jg==
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr29250866pjb.38.1624899267411; 
 Mon, 28 Jun 2021 09:54:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id pj4sm44583pjb.18.2021.06.28.09.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:54:27 -0700 (PDT)
Subject: Re: [PATCH 15/18] target/arm: Implement MVE long shifts by immediate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b12b3fb9-8919-8e87-1aa9-e54807bf82af@linaro.org>
Date: Mon, 28 Jun 2021 09:54:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: ekUNf9g1l6iB

On 6/28/21 6:58 AM, Peter Maydell wrote:
>   {
> +  # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
> +  # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
> +  # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
> +  # they explicitly call unallocated_encoding() for cases that must UNDEF
> +  # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
> +  # the rest fall through (where ORR_rrri and MOV_rxri will end up
> +  # handling them as r13 and r15 accesses with the same semantics as A32).
> +  LSLL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
> +  LSRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
> +  ASRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
> +
> +  UQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
> +  URSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
> +  SRSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
> +  SQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
> +

Could perhaps usefully be nested under [ ].

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
