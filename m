Received: by 2002:a17:906:bfc6:b0:9a1:fa4e:495e with SMTP id us6csp455151ejb;
        Fri, 8 Sep 2023 07:12:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2NUXLPLfWyqeOtHVaVtuo4A9oWa/l7OR1m4HwNL45LxdarowWL/GCaDG4wejwkMkmkwaR
X-Received: by 2002:a05:6358:8a8:b0:13f:411:c1a5 with SMTP id m40-20020a05635808a800b0013f0411c1a5mr3154540rwj.17.1694182379622;
        Fri, 08 Sep 2023 07:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694182379; cv=none;
        d=google.com; s=arc-20160816;
        b=L3SlVFp7HrO8pDejZ4HVWj4YPSQ83GS5ffTiLcMUGRfc6lfGIUf6gRuxzxWqhY/ZfT
         OvmfqEiUq6/pJYsHER4ZRzxacCguMQYgLW8C0unY4bJGzcFrjv9s10N9qsOEVyLeW445
         oUlQmonqyVjIpA9UisQNFyRAxDNkYc3+EATrrxwbn3vco2g5VJQEsmdAojZOC8UokzC3
         NHA42lw9X1t52MtT8UhJeykpUSgfgo9AQJzfA0T5EzweK41dop3JscMpMIyS2X2MD+rT
         2d+Uy0Y3DX8K2387rYLOHiqk0jmgpiVauTEhsKlSPezfTwVL5xmpBuFNZ6Adg5bHCvfE
         k2Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=EMjX/kHSnXNVNg5zStG4WLei+MWKXLmtPNdlEm4tYzo=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=HLq+6jepV5cG8n9SpZgo/YQKEYkSjVqeG3j+gOmZK5az+tGWnOSOQXWzhzxUCh1YI/
         9gJefhsaZ7mwXq0MqyxsqH+O0Dmkpqcx13D8U0Yqt5wYYrAwlQRr7ND+IRJ5zUuzEkzR
         S+z9jSZpMOHgVoaPkSfpHRLIKsj0lTJohwaRDYV8tfPiC2ms0wsGOkruBz61wqdIr5Cc
         d49BRGIPPaELJtsACeB8azeiJ8lD7Ct6MmKjFX6Ih4orsgjvewFUX2Gx9mKrRuke4uu4
         N2+tfjrx/r78hMaDcID4j/l3gdbutBQblCuu5D20fbwocmMrFKbIJUJNfvZ4CBd3gz/D
         Ro0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JbEh57zJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a0ce243000000b0062391476344si1104114qvl.383.2023.09.08.07.12.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Sep 2023 07:12:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JbEh57zJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qecE4-0003C1-3O; Fri, 08 Sep 2023 10:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qecE2-0003BH-7H
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 10:12:46 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qecDw-0007sK-PX
 for qemu-arm@nongnu.org; Fri, 08 Sep 2023 10:12:44 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5280ef23593so2677893a12.3
 for <qemu-arm@nongnu.org>; Fri, 08 Sep 2023 07:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694182359; x=1694787159; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EMjX/kHSnXNVNg5zStG4WLei+MWKXLmtPNdlEm4tYzo=;
 b=JbEh57zJhTfdXlo2ZpnsIcgqEJc6dp+YvY3QPP+qdjUhauBXOuVFlf+RAYqeTSDinZ
 iCNcZfmHfQDw40+wpMM+dvIw/1Z9j/pnQIX7prTMV+YbKrLE8/twwibVTvYdOjNGO/yR
 YseEvBTxC0e4E2alBwgOEa9gushnxRZRTAMV0zlENZxsOFb7bihr3M5eGsTDDBpq7Y1G
 ElwIZ/u6yiwgv02bE8LUmKDavu0PPA/IgsyW8TwjGUCjww6NuTbLzBpUi6Tw+boDEoun
 rK8aKC3gaW0B0ujjahLURZbV+lMI5rs4YpvG6HBoo4uGjfM+WwUOtdd3sMm5Foi5BvIY
 6N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694182359; x=1694787159;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EMjX/kHSnXNVNg5zStG4WLei+MWKXLmtPNdlEm4tYzo=;
 b=v0eAgLXPrrALhZYskNl+z3FtX00VnVM7gcfnod71wjgwtidiH81xF4FMGkXNIESZs2
 S2usweqqHJoJf7T5bdjSvSgbA4quagarbobr0+wts6ZPV7XsX1+YhWsJaTL200Jo3k+1
 LaOI8348R0i/kQ4OXhVs2evwb8n6UUEbzWyOX9Ckcu2Mn1KnHZPeoE9csGNDdENGs9ha
 zmCV3Aack8J5dtIcEyLnM9YCSAbeJphCZ18lAhvS1rpKrqV7tAbDPyAPJuJenn4wI6lN
 abbpzXDrbbmQQxVaRJd5/cr3DRdKZvDBV1uPhDKCZmO6T5ffLoZNRyubBSIfkv/ksj+Z
 fH5A==
X-Gm-Message-State: AOJu0YwYZyzVaqdbmKh4HZa12a0aWokE1XHfQ/cJRp2sL1P7hzzWz3NE
 5KneXZSrAFsrgf6XBV7Tuzu5uQ==
X-Received: by 2002:aa7:c615:0:b0:52a:46a7:4592 with SMTP id
 h21-20020aa7c615000000b0052a46a74592mr2014603edq.3.1694182359079; 
 Fri, 08 Sep 2023 07:12:39 -0700 (PDT)
Received: from [192.168.69.115]
 (lfb24-h01-176-173-167-175.dsl.sta.abo.bbox.fr. [176.173.167.175])
 by smtp.gmail.com with ESMTPSA id
 r18-20020aa7cfd2000000b00527e7087d5dsm1070105edy.15.2023.09.08.07.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Sep 2023 07:12:38 -0700 (PDT)
Message-ID: <03ab3e29-9c5a-8121-44ac-4c1cc7e9b205@linaro.org>
Date: Fri, 8 Sep 2023 16:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 01/14] target/arm: Remove unused allocation_tag_mem()
 argument
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230907160340.260094-1-peter.maydell@linaro.org>
 <20230907160340.260094-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230907160340.260094-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: 6aJer4ePZHVw

On 7/9/23 18:03, Peter Maydell wrote:
> The allocation_tag_mem() function takes an argument tag_size,
> but it never uses it. Remove the argument. In mte_probe_int()
> in particular this also lets us delete the code computing
> the value we were passing in.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/mte_helper.c | 42 +++++++++++++------------------------
>   1 file changed, 14 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

