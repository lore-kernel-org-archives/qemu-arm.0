Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1543278ejc;
        Fri, 27 Jan 2023 17:02:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/wA8NXo+AQR8kwW+ZJq17N67net1z679HEEJv/n9tahzwrOzHk8wCDzwTfnJo4SxHosrrQ
X-Received: by 2002:a81:728b:0:b0:506:5e0a:236e with SMTP id n133-20020a81728b000000b005065e0a236emr13535617ywc.14.1674867752790;
        Fri, 27 Jan 2023 17:02:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674867752; cv=none;
        d=google.com; s=arc-20160816;
        b=nMCjBY6xyIltBCmTiEgRbPVKuX2M91+AMh/63hntYDgZT2knodAiSoP0k2jNhYWeSt
         GGblu7zzTpTP7JajfVyovZRlEEewXY3i/pJa2k+5CDoMwJkXi5ejbHN3LuyB4B5E9Cor
         shBbRbq67rpwQiO1uaOHvnIyby4AMezkF1drAFr9mjp9DjEIAxcDBa7zKGC+HgeYSx8W
         /aFR34gP+sVW823vchcr/NH1O/gkH289eGDs1Box9/H9LP4h4ALRnAhAFGhimW3bhq7J
         SKmLr9OXA3iV/rTPIYTovCvBHQFciefE5dxrK9/gpOkaG0hhceRjKelTuw8DMhpUaaaM
         zvDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=3YNopm1l4APvtM09FY3Pp8OxzDKGyDTRdUzeB6kxjvg=;
        b=eFclO0p3zUFPv9OIweK0Und2aregLefGuXp2Q6Xnx09UpGcOYR3uqrk1kiHzk+/hYt
         zDIflLhttbjk4i2V8nLYHTO3IzTJceSK9/rWE0CuH+LqZJsErxDGLimQn0BBXALYS3u1
         9ju96FNiahEszumdDj5hoOqcdsAWiHuiRdZQOw7GHMcGbhq7ynEcATDiaHgET8kLgRBo
         TvRFSgxIAy2r3o5rqn3w5uu3WKZYCHoXX13Q1dSJpojIgAao6AU/kKLM1uLa4ugOD5KW
         Omw68rRs8SdsjWt6sr8Hr8yfqewp9QkPUgQdeWSrb2pM5GkkobWt8QyLHGoSrcFTgUIT
         vqvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nl1KYUrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj8-20020a05620a1d8800b006feb1f7121csi3640400qkn.475.2023.01.27.17.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Jan 2023 17:02:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nl1KYUrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLZbW-0001SL-7y; Fri, 27 Jan 2023 20:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZbU-0001Rd-P1
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:02:00 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLZbT-0005s6-0u
 for qemu-arm@nongnu.org; Fri, 27 Jan 2023 20:02:00 -0500
Received: by mail-pj1-x1036.google.com with SMTP id m11so6241963pji.0
 for <qemu-arm@nongnu.org>; Fri, 27 Jan 2023 17:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3YNopm1l4APvtM09FY3Pp8OxzDKGyDTRdUzeB6kxjvg=;
 b=Nl1KYUrXHe4rFdz5aQxkC+B6eZxx9V9gpatdQ9WuCHMLrrk3udwLVdjCHT7WcihGUg
 HJKkIOTHq72xRDikSNbeAOXx/8Elta8XKKl8NpG0l72qN1PtNA+XmuyDnoXwBtximcnm
 AnUSORZ9h5k+znaq4mV/wKclqDMzBeTKT0gsMEpVbEqq6JD5x1IvZjMgt7zY2uAcq+Vk
 a/+yxx04YvUtTxursOfN4ElZtol3YX2iZauTJ7rc1mv+BvkRBF/9S0Q6vA+7cMkA7dDo
 0CZlTON8Xl2mvniQJHflIMMkGnVb5OT+DGHMCb7b5Z2wqaTSC2xj3D4eOEFu36H4PJOy
 57NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YNopm1l4APvtM09FY3Pp8OxzDKGyDTRdUzeB6kxjvg=;
 b=Sw/Mz/M0r+yEYTLAsVFVqbbghfLvrGxR6wbzkY8i0iznY0nmsci6t6usePl/eahxCK
 0Q17p2X0LO7Hqg2Oln+agBM/AyRKBUo4ucjSLKByPxLbDSdt73VlsrEG0XBSZoAAeIAD
 3rc5p7m93jvJkq0gdF7CFlw89UBY+0cXE8HhQEnkiBYz4y8FXPAAk6YYNQPt5MRWxriv
 tLFwD0O4s2ZljGzTMvi//czZjQBEgZryA4xvhIVFncZGTckkOBguP41HmteQGUPwapZ7
 lqn3KM0fE/Wgy3kBHcyw4/FwT6/LoKBRtiae8+HTDQo4Xk/H4rMvOz2Nag1CaYHvh6Sm
 uhRg==
X-Gm-Message-State: AFqh2kp7bAdoo19w977ealAFuDiXx1tspvlRsYPn/0UNkjyCr2VgPv97
 GDRv8xe8d54+JPbmhq5uHOVaKw==
X-Received: by 2002:a05:6a20:3ca7:b0:9d:efbf:48e3 with SMTP id
 b39-20020a056a203ca700b0009defbf48e3mr56933644pzj.39.1674867717089; 
 Fri, 27 Jan 2023 17:01:57 -0800 (PST)
Received: from [192.168.50.174] ([173.197.98.118])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a656908000000b0047063eb4098sm2967341pgq.37.2023.01.27.17.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 17:01:56 -0800 (PST)
Message-ID: <818674a6-da16-77c0-2a2c-aad1d72f04d0@linaro.org>
Date: Fri, 27 Jan 2023 15:01:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 01/23] target/arm: Name AT_S1E1RP and AT_S1E1WP cpregs
 correctly
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
X-TUID: ofiyUBlP6fHK

On 1/27/23 07:54, Peter Maydell wrote:
> The encodings 0,0,C7,C9,0 and 0,0,C7,C9,1 are AT SP1E1RP and AT
> S1E1WP, but our ARMCPRegInfo definitions for them incorrectly name
> them AT S1E1R and AT S1E1W (which are entirely different
> instructions).  Fix the names.
> 
> (This has no guest-visible effect as the names are for debug purposes
> only.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 72b37b7cf17..ccb7d1e1712 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7734,11 +7734,11 @@ static const ARMCPRegInfo vhe_reginfo[] = {
>   
>   #ifndef CONFIG_USER_ONLY
>   static const ARMCPRegInfo ats1e1_reginfo[] = {
> -    { .name = "AT_S1E1R", .state = ARM_CP_STATE_AA64,
> +    { .name = "AT_S1E1RP", .state = ARM_CP_STATE_AA64,
>         .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 0,
>         .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
>         .writefn = ats_write64 },
> -    { .name = "AT_S1E1W", .state = ARM_CP_STATE_AA64,
> +    { .name = "AT_S1E1WP", .state = ARM_CP_STATE_AA64,
>         .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 1,
>         .access = PL1_W, .type = ARM_CP_NO_RAW | ARM_CP_RAISES_EXC,
>         .writefn = ats_write64 },

