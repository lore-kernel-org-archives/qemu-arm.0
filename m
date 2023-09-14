Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp478006ejb;
        Thu, 14 Sep 2023 05:26:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE03OQ3bzIoB5ldzG6a6g7JFjc0aa03VYq8e8hWZ7wZ9L6sw5tHgXYLhtaSDkru8E9vwxbk
X-Received: by 2002:a0c:cb8a:0:b0:64b:997f:5a73 with SMTP id p10-20020a0ccb8a000000b0064b997f5a73mr5129941qvk.0.1694694404825;
        Thu, 14 Sep 2023 05:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694694404; cv=none;
        d=google.com; s=arc-20160816;
        b=ppwpDox7zjOs7lh0m7BqjMCXavi15SQKwdWgn8jcQXT1sLZMAgynuI43B7i9rFmze1
         8/qlO6bLAurvIe1D/Shmk/91eqGLx0B5+vS8Sd7xd7tuYpXeDq6SGNHySoY7Nni30fyx
         PFZLFV0qhPL/WPu7JOLqGG3P8cAHLpIMzwgpgfLSQgkX2bOScQIj+OZtgaF+9AK2ZaE6
         FOIybv/Xdt/KaNuiTQFjqCacAj0bkuxJo83/SE9AXfUbnyLIRuCpUfGpKzjeO2aD5tu7
         rJO/kROUtx1woc/RZxwbplW6VQ7yMYf11JY+BB6nmunSp5DxcEXnYh8/vgl+38HwHrpy
         kxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AJFEHBLkPZAZgUlNe2cLzWBIOLdTGvDgJjEkdDMQrRs=;
        fh=2w5/DxcMtQ8eO0DkxfZY7SlIKNr/zKAkC5EjTb1R1+c=;
        b=xlEd3u+VQqdt/vipnq93JMl8f2xt19h5CGyIc8GBp3KxqVE5ITyxbdo5ZVth7u/cHU
         nMCHFXfSMfMYNS0/aXHuOl1tudqiH/fAJWvWHBI/iGENVi3Ue13/qjE436iaAm1aCJ4B
         JcWh1DNbJO9almiX2QOnZp++uQczvbVJpK51WFHIFmihhjUVZ9ckMP3+2N01iMP7a7TF
         DKtGPjrHCTxm7byecTRbUKcDvYMsgFONsVepcY7VatGkSzggy0V/dwb4k8Crsr+BY64F
         gpDXOv6c7T3s7zTGEy26DDEoYhzLgwkkkmJOR5aNBpgGgNegbMrCLEaZbVqvv73UTSip
         DVyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwlNzojF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020a05622a111600b004030d8b3d81si856819qty.483.2023.09.14.05.26.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 05:26:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GwlNzojF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qglQK-0007kZ-9b; Thu, 14 Sep 2023 08:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qglQH-0007jw-Pl
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 08:26:17 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qglQF-0006RW-Sl
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 08:26:17 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9a9cd066db5so129521166b.0
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 05:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694694374; x=1695299174; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AJFEHBLkPZAZgUlNe2cLzWBIOLdTGvDgJjEkdDMQrRs=;
 b=GwlNzojFe7nFAufjhxqks77rMeF3dEdmmorarrPvuaPwN8wb6OJAYlmIaEnUUiyG4X
 6Dr39p3yZ1ZR1/dzmWcXu9vA0N1QRNVNmHwSMKUBZHC4WjBJAzly3FbRewoCFR6ZkMf/
 h0p8Z+4u9vghVUse13PkxYTffCM9ewjrLxVvMfCUGlRKOk5vxxJnYneGTYSOVezVwvSr
 YjaXzTEZZDhX4FIuDZOvoRptyjVb2Osi6JovigGTvblViGoF7BQ3eRD/1FUDe6owmfWy
 FO3aUbjZWl3tz/vrD/WbXUclPEvpkUMkRU5e4yfSF4lEcJdAP0/Vndjx0xSk1/0pAD1w
 F5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694694374; x=1695299174;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AJFEHBLkPZAZgUlNe2cLzWBIOLdTGvDgJjEkdDMQrRs=;
 b=UVuQYdfZ3T24xhYVC+kYg94w7NMK8D1urCO0eahTm6/yyqilnlgwmMK7QCnH0WYBY7
 nzKRG4tXs15O3ldJEmFEUUprFAwzQL5YEnTPiMxEwHhC0ugqjs7Shxl064YMUnHPzt27
 guYPop/cVe97iY/dBGLWDCQd7QzO3nagEwH/tgM7yVuXV9NjA0ExgG6yuaUQ39vY+q+a
 Haops7DRCaFgEvlfRV8Ajl0+Q+LD7qZjeiM3c/tddThTKKHV5xc5gWQ0vUI6NlYw3YA3
 6Ks/Tlb1JjMziZMWMHhhwSNcPAqY/uzctpPIR64tUOYpy0IJsSwOx5szoCsS813KvaiO
 M9WA==
X-Gm-Message-State: AOJu0Yy8KfDLuZetC6tt9bhRdXe79QyUHWQBNIp/ekcHlUasK4gA5/a7
 6kOaSgY1RX4arjq9zqJ/ugVNyA==
X-Received: by 2002:a17:907:7816:b0:9a6:572f:597f with SMTP id
 la22-20020a170907781600b009a6572f597fmr4715210ejc.38.1694694373907; 
 Thu, 14 Sep 2023 05:26:13 -0700 (PDT)
Received: from [192.168.69.115] (176-131-223-129.abo.bbox.fr.
 [176.131.223.129]) by smtp.gmail.com with ESMTPSA id
 j19-20020a170906411300b009930308425csm932765ejk.31.2023.09.14.05.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 05:26:13 -0700 (PDT)
Message-ID: <1c07cd98-5381-28fd-58bb-d42d3de85a22@linaro.org>
Date: Thu, 14 Sep 2023 14:26:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [RFC PATCH 3/3] hw/arm/sbsa-ref: use bsa.h for PPI definitions
Content-Language: en-US
To: Leif Lindholm <quic_llindhol@quicinc.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20230914120124.55410-1-quic_llindhol@quicinc.com>
 <20230914120124.55410-4-quic_llindhol@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230914120124.55410-4-quic_llindhol@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
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
X-TUID: HAPbotV6pJjo

On 14/9/23 14:01, Leif Lindholm wrote:
> Use the private peripheral interrupt definitions from bsa.h instead of
> defining them locally. Refactor to use PPI() to convert from INTID macro
> where necessary.
> 
> Signed-off-by: Leif Lindholm <quic_llindhol@quicinc.com>
> ---
>   hw/arm/sbsa-ref.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

