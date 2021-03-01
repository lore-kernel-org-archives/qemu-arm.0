Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3253514lfg;
        Sun, 28 Feb 2021 20:44:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFy0QrwZDFKHQTJUBdcoRf3ClgRuTmu5pC62/ZyOvkiCVnxw+NZ2U5B8xpWHHsBdfqhG2Z
X-Received: by 2002:a05:6e02:1a82:: with SMTP id k2mr12010616ilv.155.1614573843950;
        Sun, 28 Feb 2021 20:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614573843; cv=none;
        d=google.com; s=arc-20160816;
        b=rCBOWVP3QsKPaSJr+x/HBP7GaFEz0irjQtjO042NqvzPs1KUHFc5mg7RQbSDmf+5OZ
         RkOH9LWg1F7I3rvDUxxyfDTOAwR19NxEB3Bg8s+FJ/jEPI8mPuG3NVLtB5cr4Z0hpYBW
         r18XO26983Lj56eS9oiOTGgfjEghSwKah7JdcDRojoAzbMQJsyqdTuYCGK+B2Kwd+q5p
         66LFUMQTAOAg27cLtjuDlXbZ4o5voLhy9XvDf5D2agGU1DBMKxmTNzmuxxoOUruXlNen
         YjCFRBuev+CtyKmY0sExOfW+hcI8EfWz39xWQb3EfewkJBtlZaPTTg8+hgHzS+6vjApl
         DnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8/9RCakIbl+yNJ21DTvlwy+kfMNkfUTsGCrPAc3Ix0k=;
        b=AhbBcmyYo9BMOGMkyUKT3cv53lWcfYqY3JMXh9EbusCqPh3PnGLj6lpw9AkmFgcYle
         1zx6IwIB8EnPmHg6wEfAJshDYkwvbgiIcwF5XY3kYm5fwhqAfTLuqrdZIRHSvZDsodj6
         85IPF7Iz3caAnuuPqWC/RU+PTD11CS3L6gMFi+U1DsFdaxgcB4JHgAk6BFwyEGb9u6QH
         e242IF8l/Ik1M3I2mR3pNGaeBpIZEMYWF53ndpE8Z873SG3HkG7lwSOEc5147ZBVRWOn
         f653VoHFzuK8lPaRdCpWXvvm3HPJJS3n9KcytU7k2TNixPPjMMEd401D1wWIemtmrTkz
         Jw5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sRgKsf+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a11si15377776ilb.95.2021.02.28.20.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 20:44:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sRgKsf+i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGaPa-0006tn-U2
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 23:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaPR-0006tb-Eh
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:43:53 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGaPP-0007vN-Pi
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 23:43:53 -0500
Received: by mail-pl1-x634.google.com with SMTP id s16so9088268plr.9
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 20:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8/9RCakIbl+yNJ21DTvlwy+kfMNkfUTsGCrPAc3Ix0k=;
 b=sRgKsf+iKSfmotgWHNl1PpLUxS/0SFseB1GQ6dtRLXMYvkWl/15e2Z7Fe6f4hwj9fD
 YKQR6JekFZ5pbM2wdGvLDQ/NPuawspB9NqMwGgOq/6ITV4wCuJNv9ctvrhK81C1sHvk9
 cpjQvUY2Pb4++OpulBAP74E8wno8M6+g9rUBkSAmtSvdRpnq7dhMGvZfmFd9y4JUkz+T
 0ISC6tKQWWh177OomOsUxgPK2XsXT7vbhutm9zyFYPwhGlV+ojivI+jijz1Qg1S2Dhhi
 +vK5BUd3uVQU4yHm3zyXTjkmwrBQLF2L5k1/meBckhIAQsbXyMGrMow36a2caitnRVo2
 1+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8/9RCakIbl+yNJ21DTvlwy+kfMNkfUTsGCrPAc3Ix0k=;
 b=SMMGsNIEE7zEhfsZqU8JHJJCdiTCNJzkfqKnFcGAGWs5TFA2Pg2O7aNA9ZuHww/EsR
 /zHCpVc72YPw3mk6b9a3w8Cqg7jsRafyW20vBj7JeiKavoobjLcpRFrkMPis8U/5ztag
 Rx75IKqS9q54CRSsUCcJ2AoSm8eWLRzxuh8SpUJTlWjZCOqSzc9T+S5Pq8g9KIeXzHrH
 vWMGGMIQwgpY0MvkATEA7CszRXRKUaKOTenyrzdrOME0LapG3Nt9EqcvjdzpL4ptqzs6
 HVJu1yETeAo8jfLH9QuSiTA8WEqXryIskYVyxCBxX0dkqAnPYGTQA/92vXmsAbjlvhdk
 tKxg==
X-Gm-Message-State: AOAM532CQfEKT7ff9iO3TDtnZjgmh+mIPu5vevFZYO/SS0fO4yxV+X8Y
 nl8w6vfAPzS4Z1/L+CpYjzLOpw==
X-Received: by 2002:a17:90a:c086:: with SMTP id
 o6mr14705953pjs.128.1614573830243; 
 Sun, 28 Feb 2021 20:43:50 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id ca1sm6265775pjb.55.2021.02.28.20.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 20:43:49 -0800 (PST)
Subject: Re: [PATCH v2 17/24] hw/arm/mps2-tz: Set MachineClass default_ram
 info from RAMInfo data
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5ca6b3f6-d1db-a86e-60dd-3761f4fde530@linaro.org>
Date: Sun, 28 Feb 2021 20:43:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: psljc36ONbb0

On 2/15/21 3:51 AM, Peter Maydell wrote:
> Instead of hardcoding the MachineClass default_ram_size and
> default_ram_id fields, set them on class creation by finding the
> entry in the RAMInfo array which is marked as being the QEMU system
> RAM.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 24 ++++++++++++++++++++++--
>   1 file changed, 22 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
