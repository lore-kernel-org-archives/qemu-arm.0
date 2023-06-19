Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2806957ejt;
        Mon, 19 Jun 2023 06:20:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Hb/fTlC70/xe1JWO6ITOnCctOrLhnV31KLjTJ/Js0y983D5Eseew5IdjaWozsgkCAPVxJ
X-Received: by 2002:a1f:db87:0:b0:45e:892b:d436 with SMTP id s129-20020a1fdb87000000b0045e892bd436mr1209800vkg.12.1687180807395;
        Mon, 19 Jun 2023 06:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687180807; cv=none;
        d=google.com; s=arc-20160816;
        b=sejXwmZFcjZQ3cLMzsYtZ0xMZHanSH4sCsh7BW70TmT7WrfzkbDW+VVxA/k6fivK7I
         gXe/xeKYEuMKG6zG8VRDPSXe/8YnHx6tY2EKXtM+JV7aVbT+vb0dPKGNggIUjBTnyt1v
         DMIdg40fGFoby2OLjSf/xFOTW0jjJownaBWdfRlkZS0wKMZbxM5t2WtbQoOyb9ZrLHN/
         9lLtV8yySD5pdKjbv8uXyOYUMN0Dwaj7yXc0htOrTwePk1KMbCxOWsXjJ9oNDyL2fsCM
         d9h3gCxa96yoUtT+CZpTPTOJDIWN01Vw4IVu1i0jemyIazLu1uuooTEHzR3dSXSottMJ
         6IeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ssGzWqawQlgeXFiF6NNz5/NTa6EML9WoWRfq7SATZJw=;
        b=PGS20AZA0KOyd22p2CpSR+yzUwvHj2dIHFqD/vHz1dGU1Q+S81rcaezuMLYXADjvHF
         PlovwVqJDCEOFR31WU508OWtdJuKEJICIrYfr2inG7gpBJ3GRrCPxCyXDoBdos8tnFBI
         j/w9Pt/MCfsHl/ltRgKEkeTWNzeOjyfUX52j3KDGZsoVR4PupKM20uCHxpRoydHQ/miX
         b9zDvYOHkcBNWskhboQ7g4EpGGWtkBj/pAb4Uufb/L5CvJOa/5TP1awMkKP4QLD7zWae
         baD3nwOx3mfEVfIneJJt84OytMA7ZpqhAmDWi4XhxmFtort6LOHub3Ja7HWr+bSJcvND
         aE1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fNJXJS9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pt10-20020a056214048a00b006261c759939si10643033qvb.130.2023.06.19.06.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fNJXJS9G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEnO-0005he-Fz; Mon, 19 Jun 2023 09:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEn4-0005XT-Op
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:19:32 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBEn2-0005ln-2n
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:19:30 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f9b258f3d8so6410025e9.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687180766; x=1689772766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ssGzWqawQlgeXFiF6NNz5/NTa6EML9WoWRfq7SATZJw=;
 b=fNJXJS9G1XQrqUjzJ/i2oNHNyRQWgHVcj82nUFDYW6FqT3rm0c7/1RWe9KgZY2DgAN
 qT/mYC8ztTYOZJKgPMSfBwryhEqxDSiQ/x1/mORWOwexkPuhrZhoQ/8kfFfCCdSu/AA2
 Bet4HLvHBRwd3hUfgtZQhza+cVBs9UUB3gDzinNW1CtC0b1vvg5S9pK/qeLfo7qm/X8h
 +QSW1unM4XkQPi83zClCq6NeyfaCh4RGKasFS7gkYR8m9zJ45TWoO6m1n2ySm9FPEKI2
 M0aqdEb9vD3+XnqyJpRipilNVnvKMq/Rfg5i7VCJtxojNChi6fKNCs+JW9A7/1jkAYL2
 PtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687180766; x=1689772766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ssGzWqawQlgeXFiF6NNz5/NTa6EML9WoWRfq7SATZJw=;
 b=Oael70LDVv5Rv6gi4wfa5BascqyGID/6J6dC2Y8TUGCC1/cCFaQ9RACZ1uyEJdzn5r
 xQ+BglSEQaDSEcJpubpkE6IqMVXPOLRHj242B60qqGP88Ud36AoB5rvsR4G94y/nsa+m
 F7FIz/WOilnO2miPhTfurvVgTqBh6D86YCfUt+kogy9v/CX/E5E9ovVmljWLbQ5qDrOD
 6hQE0GaOD2xXlr7YO7tzuukkZQrlX6+DI0NqMynjtePdL+sxZqif/9I8wtDGE5ggNIHe
 qWJ5yM+rupAcLjpUwPA+PWJ5SViTZvav5/7+owZnDTvZ3qE2L4AN9/byEQh1bKl3ylya
 7r9w==
X-Gm-Message-State: AC+VfDw0jcrH69ueD1dZv9dc+TORhYD7J81xoOWn+KsI9eW7eE0X8CpV
 GnL1JJ2f7B7ZCTKEdMVfmdpilQ==
X-Received: by 2002:a05:600c:808a:b0:3f9:b93:ed5 with SMTP id
 ew10-20020a05600c808a00b003f90b930ed5mr3412332wmb.12.1687180766461; 
 Mon, 19 Jun 2023 06:19:26 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 t13-20020a1c770d000000b003f91e32b1ebsm4259668wmi.17.2023.06.19.06.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:19:26 -0700 (PDT)
Message-ID: <c51dbeec-d470-1f77-fa00-53e17032d213@linaro.org>
Date: Mon, 19 Jun 2023 15:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 34/38] crypto: Remove AES_imc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: kgbFOHf+n7MG

On 9/6/23 04:23, Richard Henderson wrote:
> This array is no longer used.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/crypto/aes.h |   7 --
>   crypto/aes.c         | 264 -------------------------------------------
>   2 files changed, 271 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

