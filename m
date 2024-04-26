Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp396790ejb;
        Fri, 26 Apr 2024 06:41:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjVyddN3IBatd4IgasUNy4qAtnGTubFuMPZU3IHjn5X6W7J1ivCX1ANTvydoVXZ3OCR6FCA+O6ihULxSTLqZT/Y9Wgb9aI
X-Google-Smtp-Source: AGHT+IGkxhj2J+rRUWTvrtgLLqTE581sZQ15+csZqBA3yVsgxAO3R1j5ug89zaDprcqkhPYDHjQm
X-Received: by 2002:ac8:7e88:0:b0:43a:8278:259 with SMTP id w8-20020ac87e88000000b0043a82780259mr1116951qtj.20.1714138892183;
        Fri, 26 Apr 2024 06:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714138892; cv=none;
        d=google.com; s=arc-20160816;
        b=GeDc5+h80DsnhpL98UlT7yxkmJ0YWj67tw0Xs/1FePE/FFfEq6KHoYjbkyQwXuaurK
         kuaYbBa6syUr9qLC4WW0+0F3B6X2sfQhy5uoH5faVbWCTikfBl3bO5N5IyjavI5nPuNC
         E+xui8ughmfsAHmjUWQNO0IOpwnmRXJjV7OXNcfEgNBASy9MTVtWrDb2RkiEUkLsay6X
         EpGo/zxnwp0lSOuVJ6cOAP60W60EcRi98sidM/sgoPPyk3A/a+4uN+KlhfqV3WHGCNjQ
         V5p6DqByrzPXTinNtDWDYuP9DT5qzA41Pwupvoxq7h5TGrIyOMwB2CdOs3vvbHzF4UgO
         Wngg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=l/4AH35C5XtdQ3eRtyDUDGjjFvIonN4wg2bdDSTpV4M=;
        fh=Fn9JZ/6tK5ettaZMabWc8zMKmQzAq/YH6IlUxvhKRDE=;
        b=QYgSwBdvTsDsrmmn2PxZjpukgOaBUxvy+y9Pjxci0/PwgnpfSjKAk/y5rhbeANZXYE
         RgklkDHFgdzzYnk5ah0+d/D+CTqpFF48PBCNfHhTCBfukdtL7gSsJ1gGMgrY4we1kM8n
         yK6ogsefYOm6nHQtdfWr5J/HZa3RX5W8ufFRgFA5aEx/hIvYGRHUVY2ZkWRMBg8V8RoH
         AbhiAehswTk+g3ap53+DGLgMpIVMuReUxog26JKuUzSMjHq9HKYTj6aeBtYCV42tJkZz
         aD6HMjxrDKAMCjBU5oa4PJwidNSpOxEGrEyFAD8m4BsO03lcu3SNQ0UdhLRs87qsD6MM
         ykEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UMDZ3J92;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020a05622a14d200b0043982623150si14270049qtx.92.2024.04.26.06.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 06:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UMDZ3J92;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s0LpK-00089J-2J; Fri, 26 Apr 2024 09:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0LpH-00088Y-Lt
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:41:19 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0LpF-0008Pa-I5
 for qemu-arm@nongnu.org; Fri, 26 Apr 2024 09:41:18 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a5872b74c44so252398766b.3
 for <qemu-arm@nongnu.org>; Fri, 26 Apr 2024 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714138876; x=1714743676; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l/4AH35C5XtdQ3eRtyDUDGjjFvIonN4wg2bdDSTpV4M=;
 b=UMDZ3J921GvAk+cTuOFn/GJncOp6Q+4eaRuxoEYRpn+ci63Sgl9Fsq0mrW8UU5pwva
 GNYxTQWq5WatXrWU4BwitAeLZz/fuFcWBlsbMNBhylh+/PhnU3ln4wq5dCD6Jj9vVNO2
 dPRQSgm6jZGtOQP7OIqXzW5UWu3MptGzULQm5nVsFMetoO8J6lbGXDV71+vw+7Tf2qlS
 I9wXW3UGUG2XpeZ0NBvHqpgK93wP+HX3ZMlfM6GvW2zQixKuonJ3gyue8gPq+9dpFfwa
 DYIJrb1LQe8dusU7v8wKYZqol+G19LwwcWWPl7UvlD0H3YHybvheEtPWJXjHK8Uxa990
 ZIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714138876; x=1714743676;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l/4AH35C5XtdQ3eRtyDUDGjjFvIonN4wg2bdDSTpV4M=;
 b=wDECPB59f5HvJXnNLiSCL1EacZSx5Y9quDL4jsZbngCLxOjLN1wMDlzVr1mbHaGaau
 2aPsCyNPiMlbJ9q4KuYcpLGUOwAk54CN5qZIh5TY+l7ZuFV3wv3EDQZ0wIMuMr/L+i7w
 q5rsTSBbwCEOCvWDHwIxwIFxWVhL90BeKpQ91Woh3ze+npFGCimtWROkznSBQhBjDZwq
 00bAABw7w4awlLnCKkxOmN2h1TpQRkDOwq9boDsYhF76IZa5UsQ1Kk5mukcyjz4EOBTd
 W5RgyF+EhVxGCjEWMZYvpd1bx2yZZSccq3JhVSwm6KDWGyJot2xUeVNgyPw4bgCRr4zY
 1ypw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA2r4WFepy4XMwKyQam3a2YeUjPKX0ywo55xs4XiIei4+LiusmxVr1N33dEy43WR0OPYoOXnj7kx8KN6eDQQLTUHCH
X-Gm-Message-State: AOJu0YyMOCQD0uG/qpFIeksYrj6WUZ2xSnA5AEmKaT69iqSb76cvV84W
 ntocPAoDhslp7HjXFOaqVftWfRs4oBBqjj0Cu+vkTsA4QE/QgITV/2ySAJwdYaudOtoK6uArP8C
 7g7Y=
X-Received: by 2002:a17:906:3655:b0:a58:be32:b454 with SMTP id
 r21-20020a170906365500b00a58be32b454mr2039327ejb.27.1714138875741; 
 Fri, 26 Apr 2024 06:41:15 -0700 (PDT)
Received: from [192.168.69.100] (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 bk5-20020a170907360500b00a58a67afd2fsm2220272ejc.53.2024.04.26.06.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 06:41:15 -0700 (PDT)
Message-ID: <69fb04e9-c4af-4d71-a60c-b21a94896fed@linaro.org>
Date: Fri, 26 Apr 2024 15:41:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hw/arm/sbsa-ref: Force CPU generic timer to 62.5MHz
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240426122913.3427983-1-peter.maydell@linaro.org>
 <20240426122913.3427983-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240426122913.3427983-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: hFlQ0LrVURnw

On 26/4/24 14:29, Peter Maydell wrote:
> Currently QEMU CPUs always run with a generic timer counter frequency
> of 62.5MHz, but ARMv8.6 CPUs will run at 1GHz.  For older versions of
> the TF-A firmware that sbsa-ref runs, the frequency of the generic
> timer is hardcoded into the firmware, and so if the CPU actually has
> a different frequency then timers in the guest will be set
> incorrectly.
> 
> The default frequency used by the 'max' CPU is about to change, so
> make the sbsa-ref board force the CPU frequency to the value which
> the firmware expects.
> 
> Newer versions of TF-A will read the frequency from the CPU's
> CNTFRQ_EL0 register:
>   https://github.com/ARM-software/arm-trusted-firmware/commit/4c77fac98dac0bebc63798aae9101ac865b87148
> so in the longer term we could make this board use the 1GHz
> frequency. We will need to make sure we update the binaries used
> by our avocado test
>   Aarch64SbsarefMachine.test_sbsaref_alpine_linux_max_pauth_impdef
> before we can do that.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I leave it up to the sbsa-ref maintainers exactly when they
> want to shift to 1GHz (probably after a TF-A release with the fix?)
> ---
>   hw/arm/sbsa-ref.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

