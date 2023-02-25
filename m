Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp3090980ejc;
        Sat, 25 Feb 2023 11:47:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+d9PC5tKFi0zPf5G+UpBmhGyAf1cmcQolxfVWXvHFWMPCvx21jRbiBi1DpJsfw7YIjdJFi
X-Received: by 2002:a05:6214:2424:b0:56e:a4d1:2b90 with SMTP id gy4-20020a056214242400b0056ea4d12b90mr38704469qvb.48.1677354462033;
        Sat, 25 Feb 2023 11:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677354462; cv=none;
        d=google.com; s=arc-20160816;
        b=TS7VdI1gtw1euvcMoJE+Ppg0wEpz1tf41EZqqEaWs4b2VDEBbgiM2gUT/JODCB9uNb
         1tXI90Hnvqn4awsSrdydRBQktS/ohCNt17Osp9hZpv1iIOL5ZPNwc8rRp7QiscNAcfXr
         M+5nyQNBE+TGXP/3svbrK1OTrQGy5hyiH4Rbqx/sq449PCOtTu5wca5aeCUx8ERX2tzG
         WZgD0WbD3bLqg2O4gZjF5VKyK88b1d2KwPuV1D0aZwaxwjqeK3crkBuUajZd86oRsb8M
         i+vDRIwpGvpYXLt8qYmeHevykDt0u8QXmzr1s4LWPk3KwBxSoq7GahGkPsRhZHpoLvHy
         ILTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p6+n4uxbbZd3nhwEvXFG/eQ2+KKeBSbg2mq4ipy89RI=;
        b=NZ8S2N4C8B8XuTfqyXgKGRs9oVTlIpm70eFJt+b3ZUE9s9jTlQSjTBZmjsnAm2E/X9
         0LNZrKmaeh85tPmOAdjZGnyi5MW5eb2KIsYUYkQXt/o7vo03Nfp5F3AkqOYpRGqE1goA
         jJy/jibpEyEoMZBau1ipZHCDWGOSpP6InuaPjXSZL5kxVz7s0wZBigyEJBEIdlRTU8+v
         jGa4rT6CCWqSOgCWwftfmTnX463oZkPoyGpV83mcHla6PffT3+noBsdBBvw4NKLOUvqr
         y4jQ2bq5D7NSCNwpfHKogEwV/6LF73kt4Ro68mKc95SiR1nmaoERLJD1dlfgxTAZMDTj
         PwyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYd050Up;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m13-20020a0c9d0d000000b0056bfad88101si2331303qvf.593.2023.02.25.11.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 11:47:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KYd050Up;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pW0Vr-0005w8-Qi; Sat, 25 Feb 2023 14:47:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0Vq-0005vU-B4
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:47:18 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pW0Vo-0002rX-MC
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 14:47:17 -0500
Received: by mail-wr1-x436.google.com with SMTP id q16so2449105wrw.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 11:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p6+n4uxbbZd3nhwEvXFG/eQ2+KKeBSbg2mq4ipy89RI=;
 b=KYd050Up1lNljMBMdEoJlwZHkQF45xDIT3Ol9BzOPuu+5pftSCwbJ10h3X9IPLY533
 01cEZiI+84e9SZ0AeSxLxUdjEbaj63aLieMk6W/5+ohxHHTE5g6/2QkLxEprd5D0Inrj
 hfafKaxCe9pB4vTrksieZ/jskndr7km4yRdD3CRXVOeh6p9bPQ5BxeRTOh14zqkyud4S
 VWHkTDP7J7VuIqnMU8xWLgCL2QhkrI1AplGs3DVFvB/J1FfK0e21W3+/Vgoq6Lw1MP80
 M2b5jTZAJ0OHeeyIZ6hpz2BGYFqEMPR0XRYWALJimSWrsRwufsV2R3joJQJEdVeNlBag
 zhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p6+n4uxbbZd3nhwEvXFG/eQ2+KKeBSbg2mq4ipy89RI=;
 b=Cj4ZZuxRZDXJ2wDOJUuZeF6/l+dXTVxSHJXVDTAd6p3LnGjte1DbqjvuEjTaoY2A/G
 Zonz3WPv0KXKM4zZatjWGIKo6xrfj5/hrAeZ6V6iHgNsrEuI2Mz3L8AX800o75/+Ui0k
 8RedidIjbpWdwoU2fEpafgPZhm82SrWrhggaepQBjbpC96pMkihyuCwsNYkhI1Frk4Sf
 nGMcMfPqSa8sGyrRzGXVCuEPGZufs7EBEuqsNTk4jM6pyN+w5Zemj/YFnLj+8glE00gX
 L1MGBjk/2NU3etpWWym995mbmO9E7RrWAT2OPBh79xGEPnBOF9O/DAFrTsv+Z3zh6vKY
 GRNQ==
X-Gm-Message-State: AO0yUKWnXFhzv3YsssdJ43fkZTO5XYEBX8urJgCphWiM/l8twNlbDgbi
 iFmbmN4EyjQiV2nINXFWmaWw2A==
X-Received: by 2002:a5d:4482:0:b0:2c7:1bee:6eca with SMTP id
 j2-20020a5d4482000000b002c71bee6ecamr5447041wrq.35.1677354435034; 
 Sat, 25 Feb 2023 11:47:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d4203000000b002c57384dfe0sm2470734wrq.113.2023.02.25.11.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Feb 2023 11:47:14 -0800 (PST)
Message-ID: <0bf1de13-5934-0f6a-79d0-a0a7862ed998@linaro.org>
Date: Sat, 25 Feb 2023 20:47:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 45/76] target/mips: Fix trans_mult_acc return
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
 <20230225091427.1817156-46-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230225091427.1817156-46-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: pAxY6WJZnNhi

On 25/2/23 10:13, Richard Henderson wrote:
> Success from trans_* subroutines should be true.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/mips/tcg/vr54xx_translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
> index 3e2c98f2c6..a7d241e4e7 100644
> --- a/target/mips/tcg/vr54xx_translate.c
> +++ b/target/mips/tcg/vr54xx_translate.c
> @@ -53,7 +53,7 @@ static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
>       tcg_temp_free(t0);
>       tcg_temp_free(t1);
>   
> -    return false;
> +    return true;

Oops...

Fixes: 5fa38eedbd ("target/mips: Convert Vr54xx MACC* opcodes to 
decodetree")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Queued to mips-next, thanks!
