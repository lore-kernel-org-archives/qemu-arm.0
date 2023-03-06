Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4669348ejc;
        Mon, 6 Mar 2023 05:55:32 -0800 (PST)
X-Google-Smtp-Source: AK7set86O5iDshvpQwvymRCKQkINi6YhaBBv+3tlbyLHUM59ZLaShwzOqWJ7X6DdpSkmA5OdsVwx
X-Received: by 2002:a05:622a:1a99:b0:3bf:ca50:e82 with SMTP id s25-20020a05622a1a9900b003bfca500e82mr17079432qtc.15.1678110932704;
        Mon, 06 Mar 2023 05:55:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678110932; cv=none;
        d=google.com; s=arc-20160816;
        b=LU9YlKEectB9InwrZva5XvnwSTN/T93KSHIPbq7CFbwDCU+6BKGVNfAF+eaiWa/8gt
         JJ2Raxd7J8SA3DtvUEPfbcPw/MX54B5PjMQYAtc7ogU6ZQpTEtYffK5Xh91I6loStdz0
         qLg9D4urKrYwI41FP4y8fIYaJKFL63a4OGrSap5npGxrCZu64PM79pFglOjh1OZ1w7Bx
         zzFVsmZDJFzi1E2IiTAdGAhYH7emrOvgdE3utNoUW/3Gz1poD50tLC1F3NeGmAw7j01I
         TA8JtNznrnqBimUUvBr7r6C371gvOopIlhCQwby9RNjStAKWSHVsnyuJxfrXGuL6no6L
         2ucg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4EGe3rjG59cvND13hozZg6CRYWs6WJif705Xs+gVVZE=;
        b=myjzQ3yXJRn9QFB8ZG6nTEi9i/3Cj4i2OAAn+TSPecv8qZgNBOqb4TNO03VKlc4rSA
         6dA5isdNzEIuxTxDaF+kGvuucrqYxYL+7GtvV+1xyQKMWKq7xeN0CyZ8dUWtu3DbZfo/
         ChjmJe5nhUpKj7tOSRe9m0ZZrO57Y38KfXChv9whKFTF0+PvY3eSpTQNnqfrzQh+Eps5
         tujjYrqpt3i3JAUn0NyL9u7cRybziXg8ZL+/sjMPTeMWOs3VEB41841TjLItAa7Rn0ZX
         yLyk+fRTD0ftp9NKiA141ORJFz8EFF+07TRNdDkx/+NCW81Vgw9fF1Dw8jUCoIxSQGIh
         Abmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKp6bK5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020ac85b4d000000b003b68d1f3f7fsi7219491qtw.660.2023.03.06.05.55.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 05:55:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GKp6bK5r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZBIk-0002Qo-8Q; Mon, 06 Mar 2023 08:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBIi-0002Q6-BC
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:54:52 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBIf-0004nk-HW
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 08:54:52 -0500
Received: by mail-wr1-x431.google.com with SMTP id l1so8851827wry.12
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 05:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678110887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4EGe3rjG59cvND13hozZg6CRYWs6WJif705Xs+gVVZE=;
 b=GKp6bK5r8BuP+fiZou9RFbs3K9dHi4DSmZkYdY/f043ZWIuoiMTvX2Nc5hgYThj2jc
 9ev4F7z8Qb1dDjY238Dlb7Kovfp4VeV61GjNuX3vPLPm72/CuncwnNPZO6q0f54XC3Tm
 Z4auhVT/FzrEMcoinGeIOYI+JMJHO87VbQ36AV40vpAw13wCXqB1BkhfV3i6hjgLuK+r
 2BhIay6xIG8n1jyZ0KAtxcMBWmZXEqnsJ3LAeVv1UFROoHHq+NNpyTranrGbADEMSpwy
 rrFjNe4RUWHGoIxzcY9xejka3TnknoqJ9f3VSewTZmqEAloQSloX7CVjMTektrbkYJXx
 WUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678110887;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4EGe3rjG59cvND13hozZg6CRYWs6WJif705Xs+gVVZE=;
 b=TV7VQa7d20NHC1S7iO4JSNvcKpFwHA2K4YLyIrfSjoQqPOwaRatx/nbvupSCEYNYV5
 IxLlGM+ZqF7sWGkAZhH+QNsrfaV7Ifz8gv9m4srv23nnVlDrSnw82a+tCcV6BDxK/tc9
 Wy4gaTuPm0rqNN01+yi/ysUaqpDsl0upi/DZ4UwfuL5cwJ6devSpUfLfZKOjTHatWb1r
 DFCW4Er8pOAy8DvrSJR4iHq09qAjuuiT4Np9h5zUCF7PT+P11QQIIj5bC3dgY32bXCOP
 C+3K6Ijn8tAU6+OquN/dzVAb0sCvVeTz1HyR/VpkOz6WeV80Ltzg1bU+6FuLC0WjhXOw
 ShFg==
X-Gm-Message-State: AO0yUKXPbrnZ1kob5bkVKszEki3zbPkKbRztgaH8U52raJL3YsXRwpeR
 wET0rMH+pJsYK6NQfSeLI6ylWg==
X-Received: by 2002:adf:d089:0:b0:2c7:17a4:4ece with SMTP id
 y9-20020adfd089000000b002c717a44ecemr6695952wrh.26.1678110887003; 
 Mon, 06 Mar 2023 05:54:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d494b000000b002c54c9bd71fsm9626993wrs.93.2023.03.06.05.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:54:46 -0800 (PST)
Message-ID: <5935d68b-2b42-80f3-4c88-48c27727b24b@linaro.org>
Date: Mon, 6 Mar 2023 14:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 01/70] target/arm: Use rmode >= 0 for need_rmode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: A2Pcxqq/o1QX

On 27/2/23 06:41, Richard Henderson wrote:
> Initialize rmode to -1 instead of keeping two variables.
> This is already used elsewhere in translate-a64.c.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-a64.c | 34 ++++++----------------------------
>   1 file changed, 6 insertions(+), 28 deletions(-)
> 
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index b1fa210d64..1c575de3e0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -12133,7 +12133,6 @@ static void disas_simd_two_reg_misc(DisasContext *s, uint32_t insn)
>       int rn = extract32(insn, 5, 5);
>       int rd = extract32(insn, 0, 5);
>       bool need_fpstatus = false;
> -    bool need_rmode = false;
>       int rmode = -1;

Unrelated, but rmode could be an enum arm_fprounding.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

