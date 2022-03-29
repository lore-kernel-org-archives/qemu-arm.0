Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp224039lfb;
        Tue, 29 Mar 2022 09:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDoxonZaudfcfNf5bBOx1D6d2v/QNTSqXB6GmeGYeW/gvaQPq6rRyBTvEv0hfE94AxRbZa
X-Received: by 2002:a25:34c3:0:b0:634:37e:2315 with SMTP id b186-20020a2534c3000000b00634037e2315mr28240216yba.247.1648571800263;
        Tue, 29 Mar 2022 09:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648571800; cv=none;
        d=google.com; s=arc-20160816;
        b=Rbn4FXj+Kym8xkF0XV2ATZsQEHNBSIVwe4vF5MB5J/icoHizDgaKyHQI+2+MAfrsBq
         tYv0OIHCCyqWqnMSKXUK5S22qcsEUTPCt+/41kYqjM00wfGTFmjRmhBrqH5sJGv3sWaU
         nC/poWn+FsdT3tXme0l6DuqJTKZ1JjQ01F4d5R5fiRYVHfQr3q9LUxlUjMbP/TinTOrU
         ziwbwToI5Q2DGYtrpVzmsTVIPGOEzKbtOv/n/fBryM44qPmJ9nV91flgVO9RCdeqitCY
         LUkoaHGeZzcEsELpTHtOKim/vRwOvCtBb/+YQwjgLyPPxZPlexStRy68FKXEttp91iVi
         03pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6zVpmriY5dDrVuOO7onmcANUS9mBNGnqbLDXP4dMXeU=;
        b=DneX+/fW0KUvh1Ke+gPioLpB+2lyGQUCdbBbzxyqItV+9YHXSrlHINp0t8smCzk9pd
         zptWjpZ6gg031BwADUbKeqxROeCxjG2r0BghMn2gg0FcnAPDq8ccsRCVvYIAHG+hVoRJ
         og2XoO8K+mqRujDBtgdscTgv3abRnA3G3Hf+p9h5nldcL/FnRfBX0aaDiOJBVw+06mzl
         RcunUG5wGv/ITscG+7v9FKWsDEsP4bCH7DqCBhNSRDXBOCsATV7gxcNK4AS94N3Sah/a
         eQaGMK5lmyts7eOgymMsT0/B78VNVnXhMka/aeBv6HE33xasbMZ/5lK6XQy7qxYbHpNi
         seYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pf32RcsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64-20020a812d43000000b002e5e6f10534si18642051ywt.60.2022.03.29.09.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Mar 2022 09:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pf32RcsT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZEpj-0008By-LW
	for alex.bennee@linaro.org; Tue, 29 Mar 2022 12:36:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZEpY-0008Ab-3y
 for qemu-arm@nongnu.org; Tue, 29 Mar 2022 12:36:28 -0400
Received: from [2607:f8b0:4864:20::22e] (port=46762
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nZEpW-0003HF-EC
 for qemu-arm@nongnu.org; Tue, 29 Mar 2022 12:36:27 -0400
Received: by mail-oi1-x22e.google.com with SMTP id b188so19551240oia.13
 for <qemu-arm@nongnu.org>; Tue, 29 Mar 2022 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6zVpmriY5dDrVuOO7onmcANUS9mBNGnqbLDXP4dMXeU=;
 b=pf32RcsTJDx/HPAxgNVzYFc6LVWbYTbxPPKQxIY0W614prkSZz4CLQJse+sDH7AN7V
 fzm883xm/UG7p1T2xh3E8AjPMuSbAH3jdcAwCedihgly9yDUtevOsaMrH6nQj0IKJYCH
 2xiM8nr8athuuV9KKCqAfpmtwWijWWdtkDCmoTf2lz7aw7+9jmGT51KjErTOKvsuQZSL
 ZiXP4JD9dpE5He4uEYIdYrbUVWau0BS9Ozx0Nq/gb13vWihRVfoX6a4WmDyu9EYK7Ic/
 VvpiQXYUVbiel/7gKV6y+N9V2JbfH1V0wXX3QAZvLXRqusNIbySreW/g+fFz5Nh45Fn1
 6bJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6zVpmriY5dDrVuOO7onmcANUS9mBNGnqbLDXP4dMXeU=;
 b=shzNryDSxBmWkwOruv0/yV+yRaTUGXCHORrZGP9yHkEpRKjHFTZzu4uoL0OvHZ6KSV
 urJ6IiMY1fJcOsqAQeZuHK9gRo86x9nClj8ZxYKBLqm5j+kVaCht5LimUhSuqIrkEozv
 jJ5WsZuPLRpjcaS4tBxkAjpQmFwXpGOjX1Sn33vqFk1xLk6BwgaHPpsUghZ4Xt0u7uvl
 pbVfV3qcpu7B1Ubr/Zr6ZFI7Fdh3+mCyg+nZq9qxmVxkeMa76ThSC2CBaUaOUybpag3f
 LnA4C1ZII+ntVYcmClfS8Yc4RcQFPYBoPJjhmhmeG3ODfQBQB6i6IkcUnI5E9SlG5/xV
 w1Jg==
X-Gm-Message-State: AOAM533cSuczGbcy1Y4Y2lKjmvWJCeR9FJ9pTyukl9NCUkUZq4k2GJLn
 JQJ3652sDj5rr4G9PhP6NW8Mhw==
X-Received: by 2002:a05:6808:180a:b0:2da:600a:8c1d with SMTP id
 bh10-20020a056808180a00b002da600a8c1dmr259991oib.101.1648571785128; 
 Tue, 29 Mar 2022 09:36:25 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 c26-20020a4ae25a000000b0031c268c5436sm8704608oot.16.2022.03.29.09.36.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 09:36:24 -0700 (PDT)
Message-ID: <5a395ab9-a7a4-6305-13f0-9808572a9b56@linaro.org>
Date: Tue, 29 Mar 2022 10:36:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] target/arm: Take VSTCR.SW, VTCR.NSW into account in
 final stage 2 walk
Content-Language: en-US
To: Idan Horowitz <idan.horowitz@gmail.com>, qemu-arm@nongnu.org
References: <20220327093427.1548629-1-idan.horowitz@gmail.com>
 <20220327093427.1548629-3-idan.horowitz@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220327093427.1548629-3-idan.horowitz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gSoghmlMm1Uh

On 3/27/22 03:34, Idan Horowitz wrote:
> As per the AArch64.SS2InitialTTWState() psuedo-code in the ARMv8 ARM the
> initial PA space used for stage 2 table walks is assigned based on the SW
> and NSW bits of the VSTCR and VTCR registers.
> This was already implemented for the recursive stage 2 page table walks
> in S1_ptw_translate(), but was missing for the final stage 2 walk.
> 
> Signed-off-by: Idan Horowitz<idan.horowitz@gmail.com>
> ---
>   target/arm/helper.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
