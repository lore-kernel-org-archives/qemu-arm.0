Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3527772njb;
        Tue, 10 Dec 2024 10:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWnOV00gq+Yi2JcI4NQjVzP2Are5mQVrFTQAp9xFO/A5OpMJH18tHTa4nyl35WLDecc03cXn6VQo8XucQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEatOM5GLaj3N6VQPQsxAG0OWqtRXJedcae6vueWtPLjt5ZsW/OIixqhZX4ahzHnqCEQSZm
X-Received: by 2002:ac8:5849:0:b0:467:6bd8:accd with SMTP id d75a77b69052e-4676bd8b04dmr83384591cf.15.1733854541164;
        Tue, 10 Dec 2024 10:15:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854541; cv=none;
        d=google.com; s=arc-20240605;
        b=QbfGi92Vhp6//h+yiVharl02ofH33zhMJIMOt429uVGfuZ4M+ycmvDxUXXxBwhgWH+
         Zbm6bcEGXsfvgQ/d1cm17A5oLOh/zw1nfmvfevyCuajopvdiibsZvt6mGS4mC0Ec8cML
         UdNRSLZAjiTeJsP/GyTXfURdfkAhu6mwsNJJZBdP+f3YQ8kpn+Lh12G/nuI+fhBu7pQ1
         1sTSkLCYuT/KQb/oeq7L/lTy/5gt68v72+0zJOLuh+e+OXhHbWCoTNxvTClGrB1LQ2nS
         rmE/dCf+Msaqgayy+fsTheTxQ1huKg04Q+Gkox6a27wsw+M/gMGGx0FQvqVhNBJ57p82
         RqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=aRf26W4N+ma7tvR7BwyzRfBJ+xAJLWaV6F6HEdFyTqI=;
        fh=BphaxySVTjOZhh04/l7Ad+xOcNytrQcjhUbLaqvl3g0=;
        b=HQtckGdnn1uW0VIP/9RbXVQDkcfKpUaaI6GLa5a8QbeJU6hDq7sgzkIz6F3DbgJVAA
         xKavC4NReRcDC7vm5JJEHBsMRwRqR4Tl/M4QpnCbD37jdYN4UkDoNLHjPcKzZ/LoPQsn
         tomT5oYqpMWScagCxEh+cEJku2DMWFi/YNjBz5e3lBSDNbgS0WhqMfw0rG16t/TYwkQo
         ZYorMRNrap/RvEscRuNcuwI9Fpn5Iy8ehsfacfqMpjjSwODpeHtclc066Y73gcww/RW1
         OuP18deCGwWYhBFPLq5g+81WY1FnDoKH20cLUr+TArd6JhuOcjwtCFDxp46R3OGgeRrJ
         NwSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vb7rkJw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46784f243d5si10952141cf.720.2024.12.10.10.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:15:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vb7rkJw0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tL4lf-0008HN-NR; Tue, 10 Dec 2024 13:15:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4lX-00087Q-MS
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:15:25 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4lW-00033z-3g
 for qemu-arm@nongnu.org; Tue, 10 Dec 2024 13:15:23 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-71df3f57ce7so1050522a34.2
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2024 10:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854520; x=1734459320; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aRf26W4N+ma7tvR7BwyzRfBJ+xAJLWaV6F6HEdFyTqI=;
 b=Vb7rkJw0JTgHZC1VslOjKtPcGXC7Ng2g71/5Cc8IlThEsuBwCYWWf6c/5gjNQr+eB9
 ga14SNnLd6VeTHPJ4RFomES20lqKxve92SFKXpzCf73yt5/kteEv1iSYOTS5wGGgxKtJ
 LTb0zYJoG+0rlzGUtJuibL0aJd5EWhTdbwuzthkuBC+K8y3zntTGNTDYBcKFYkkg/22R
 6g3eFuHNi2VZ8+3n4ClOmK1FCUmhV1CYwx0Aoog3x7+JaoVoL/UHENJ1XMML0kb37HBi
 ui6uatT/I5OtEhS4GTr/xprpSgsP6Q8PTV3bRstCmFjpD5tju49xXu6y20DJ3YCa0Ws1
 poxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854520; x=1734459320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aRf26W4N+ma7tvR7BwyzRfBJ+xAJLWaV6F6HEdFyTqI=;
 b=ut+RsjxXYoHnBuzTqxn0sRL35r3FoosSW+LlVcqwD7LDqhzneL1B454bsXOJuWM+oF
 p4MHLZR82/RAD73kKqbHivoX79lqbNXpaRJagA90GOOaxGL47Qu1dOgKrmjzoSZcuvjS
 fB+mGSQN6pLQor0OArDSLlouUx0PAKzeI4YkBtLfERcSmJeT+zVENGn+ZH/zddYdy/Ly
 Gc1LG5r7xbqidOAhRtW61p2dPe0QcL64ehseNK5lQOWw/AmBH3jgj6YUHMnxyBGqUC53
 I1T9H+kQ+Dmoa4YPN5buy34YRphxAyjZbvnUSI2N2/0p2MXeAuERdl+tkpsOAGNfrTTm
 ZxDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR6yb/ya1+Rm6JaMxyfIp7okzmuJZY1x368GKyjO/rzXH/xMuUxd3lko24HW6m4LOAhEuk4ZR35w==@nongnu.org
X-Gm-Message-State: AOJu0YxJPtiVmheUh9V5+TV9XeVTeDC3z5JfpVRTV0FgmTaD6pJ+b2gg
 jMd/ESU+2mSFbp3IAXjjHbUlfC/jIspH5kpGGz2aspEN434As92WZbMwludAMFg=
X-Gm-Gg: ASbGnctzj/2wicHpgln3b+vGCiUn5IJRxT0aFfrxFGsDRYAfPsBXcG5RJB54Pz0pFon
 k+5uTxQXBiMdusbtCL5Otzm4R1w6fiaBD12Jd+C47k8aMXeCFtAlfQFt7ltxGqtzO7ecspzaUxt
 Vt7s+Y8HCsw9+TJTdK2DZluTtd4S0cLpQr1iBdA0JI8p+ktneEvefMlHJRb51jH1Uksk86eKMd6
 higr3jR3ZOfdO05pgwYaR6o1RTNvjX3IGb4DPFIsBV08OuUwLnbFmIDV9/qwnBJGlfqkrw=
X-Received: by 2002:a05:6830:2589:b0:71d:54cd:5289 with SMTP id
 46e09a7af769-71dcf546d94mr15612089a34.21.1733854520402; 
 Tue, 10 Dec 2024 10:15:20 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-5f2ac352bb0sm1534084eaf.11.2024.12.10.10.15.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:15:19 -0800 (PST)
Message-ID: <29f77cdc-4215-44e5-9196-5a60ce466b18@linaro.org>
Date: Tue, 10 Dec 2024 12:15:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] target/arm: Move the AArch64 EL2 TLBI insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-5-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32e.google.com
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
X-TUID: FFN/Gzbb4fnM

On 12/10/24 10:04, Peter Maydell wrote:
> Move the AArch64 EL2 TLBI insn definitions that were
> in el2_cp_reginfo[] across to tlb-insns.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        |  7 +++++
>   target/arm/helper.c        | 61 ++++----------------------------------
>   target/arm/tcg/tlb-insns.c | 49 ++++++++++++++++++++++++++++++
>   3 files changed, 62 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
