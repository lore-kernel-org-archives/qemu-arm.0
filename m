Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp377917ocs;
        Wed, 28 Sep 2022 08:35:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40uqbZ2diFyix+/kbb2PjCFF9k9l3qgx8spj1dnVED/afCB9oAV3vjUic8Fu2e99rNzs01
X-Received: by 2002:a05:620a:1a17:b0:6ce:7c1b:c27f with SMTP id bk23-20020a05620a1a1700b006ce7c1bc27fmr22045396qkb.42.1664379343174;
        Wed, 28 Sep 2022 08:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664379343; cv=none;
        d=google.com; s=arc-20160816;
        b=eLRV1oJV9s/QYXueyKJj0UJTK26u22XML5sDJfvSc2X5LRGcAsr4tXDyk7b/9x0k6Q
         anzJY0rwt6f0sQgFNAdQLjUGHlPf2c+BZKE/6gWbH++fM5Gd+xjfvRdUN3TBBxpQ1rZ+
         ozJCr4XIqo82l1CMh3PueixbZ63pRTqofRdZ5lXc3A68+nT0kg+ZdhWryj1MGgFUdEET
         hl+qL+8E6EIQXvZR1CLPie22IhM7gBic14+hfDfC5drSXQRWl1aO9tMzbjHLdmXtEO1U
         zA5hInGT+oXID6plz240RC3RA4xh7oActols3NornChML/Rxy391nxB6qAhgp5jiPIGW
         Ghkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=CaR9fjjX2uzJJ1k7U7k6BvuYj2+1SK16n57ftUTSKSc=;
        b=KMihrjab5El5I1Bac7u7N61fanWwrAFxPuNJCmRn/J1C9gQeph4P7gFcXX0awUbSSo
         LwROCSZePb2vuDwgjnISgtKIK7xF1KZcX8sWTk19Bu9NmL4U6OOvAqdlCi+GEJEuYTXI
         7ZJKCOj077VOQajzrksiIsnIFB0XLVrZjw58MNKkmkpxnL8nH9WRHMe9HmiDmdm+QYHo
         NWarqFZW4uiYyYY8LYCom74s61pM4B18jR10kstpeyX8V654tFTm8CiR4r9FqLhquc5e
         WPhkA+ll/nC0C7WquyoTwNKfT/BHdpbQPDNuJnAj1PELPpe28g8FhBAIbrD49s16F/Ef
         szWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNBRzNtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u21-20020ac858d5000000b0034047091ad4si3262999qta.721.2022.09.28.08.35.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Sep 2022 08:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xNBRzNtv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odZ66-0002zf-Kl
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 11:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYUA-0006px-9T
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 10:56:31 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:33399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1odYU6-0001fo-GF
 for qemu-arm@nongnu.org; Wed, 28 Sep 2022 10:56:29 -0400
Received: by mail-pf1-x435.google.com with SMTP id w2so12797475pfb.0
 for <qemu-arm@nongnu.org>; Wed, 28 Sep 2022 07:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CaR9fjjX2uzJJ1k7U7k6BvuYj2+1SK16n57ftUTSKSc=;
 b=xNBRzNtv6KEajKns4Jegal+1PGNhP9kLtbRIRQfgqLchYZZ8G5qEFQzT4oGrByPdA9
 8cz1duGEK+Q8TIzGLLau3haBiq1y/DrQntqRCVrLcCl45SPsqG/AhEPLa02d/ubnBICC
 AVnKYuDjHbls+VsGC7aNLCZPcmdtgKyDLVwCMnfz+LUvdfR/EOWXWDvBZggKIHVLw3CP
 6eozOVDjOVTFJErBUhcsd/EmgRLcGkM80Oss/a2QutLZNxjWmIAK0vRsTYysoIAs9eyE
 01mpXN2/MpMzuRcnPR2yK3QACUU4VYTInUSo4jElFXfhyadGAL57GO/3qt+B92Pa3+bF
 sVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CaR9fjjX2uzJJ1k7U7k6BvuYj2+1SK16n57ftUTSKSc=;
 b=TCIfZTB+Qsf0ypqUQYGThbZkmp8pkXPPk0uSsI9NfZEjYmyfkJb6u6SQ3ucjl7Ne4D
 +Vf1Vv+fx+UvsUxKD8bgpzZvk3fHOjpyjGAAxkzRlwptsAOsVAU/DAYg7f5LbNUPm9WN
 N1eSx788SkaRDyilX846m7ZlU6k+WQwh8eJcNtSeaaiqLLT4w4Qz7ASvqgGmocJjeO53
 EMGg5zIcAikkuGhhTuqHPwPbU8q+GACS1FsuGpdMudKPx2v0iy1fRtw7UDs9unB6aGHz
 GHi6UvxRqiSx7xYJf1Rs34Q3iR61+4BzQAKUyZr84xLzEdsixjOiGmk2IS4WpQmf8myK
 ldjQ==
X-Gm-Message-State: ACrzQf1K30ei4XIfqgy0VuxF8Ps2nNx4NJRv5RmL0uQr6lfmQCjQyLRb
 ofy1PaRFjDDvT/MZMpAYfXr27Q==
X-Received: by 2002:a63:4143:0:b0:43a:20d4:a438 with SMTP id
 o64-20020a634143000000b0043a20d4a438mr30029896pga.452.1664376984864; 
 Wed, 28 Sep 2022 07:56:24 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057?
 ([2602:47:d49d:ec01:986f:cb56:6709:4057])
 by smtp.gmail.com with ESMTPSA id
 k12-20020a170902ce0c00b00176e8f85147sm3823274plg.83.2022.09.28.07.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Sep 2022 07:56:24 -0700 (PDT)
Message-ID: <e2fa6d88-2457-983d-43da-dd341eeae693@linaro.org>
Date: Wed, 28 Sep 2022 07:56:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] target/arm: mark SP_EL1 with ARM_CP_EL3_NO_EL2_KEEP
Content-Language: en-US
To: Jerome Forissier <jerome.forissier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220927120058.670901-1-jerome.forissier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927120058.670901-1-jerome.forissier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9i4HIqUONR5y

On 9/27/22 05:00, Jerome Forissier wrote:
> SP_EL1 must be kept when EL3 is present but EL2 is not. Therefore mark
> it with ARM_CP_EL3_NO_EL2_KEEP.
> 
> Fixes: 696ba3771894 ("target/arm: Handle cpreg registration for missing EL")
> Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

This certainly looks right, as how else would EL3 set up EL1 as desired. I suppose this 
error comes from a slight mis-read of R_RJFFP, in that SP_EL1 may be considered 
"associated" with EL1 and not EL[23].

r~

> ---
>   target/arm/helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d7bc467a2a..328d252a84 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4971,7 +4971,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>         .fieldoffset = offsetof(CPUARMState, sp_el[0]) },
>       { .name = "SP_EL1", .state = ARM_CP_STATE_AA64,
>         .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 1, .opc2 = 0,
> -      .access = PL2_RW, .type = ARM_CP_ALIAS,
> +      .access = PL2_RW, .type = ARM_CP_ALIAS | ARM_CP_EL3_NO_EL2_KEEP,
>         .fieldoffset = offsetof(CPUARMState, sp_el[1]) },
>       { .name = "SPSel", .state = ARM_CP_STATE_AA64,
>         .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,

