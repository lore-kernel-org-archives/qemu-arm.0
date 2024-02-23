Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp389204ejf;
        Thu, 22 Feb 2024 22:29:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXbcJqN+RQuPS9NkP79V/h7AxF6H/3/KBUw0tHO1oK3lOgrHlMbJ3VM09Adjwlaw38lg1AX8oNz4kyn66vQ7N6IXsPl1P+p
X-Google-Smtp-Source: AGHT+IHdDM0odlhvEuc7v9PysO02jGxv3WBkoBMqpGnmTMqrJBM1KlKnsQV8FPlnXJKtjAk2Pkjf
X-Received: by 2002:a0c:da14:0:b0:68f:401c:2c92 with SMTP id x20-20020a0cda14000000b0068f401c2c92mr1364670qvj.47.1708669796820;
        Thu, 22 Feb 2024 22:29:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708669796; cv=none;
        d=google.com; s=arc-20160816;
        b=RLLSV1rtunYExb77P9rkpNClhwJPNTLohDXrm03eT5XzaZebHKblqz84Z+6WKdlLcA
         Ai3aeDz6ZTOR4JPgJWTR4MIS6uCaR4UhGTzeKVVKPOSUOoemcOqTd+jFWpvXMy1jitT6
         2XXwmfJtgpuz1pcdUczMnJYV0lZtbaj6gzCUwO0KJLS4SS9DjIbkT5rD/YH+xErEH7yz
         trMryt+nO5el/kghk65iZgRVrfk+CokWx5gncxmLjpfgt+OAt3qxpsaWp+8qG7CnHFO2
         JuRYFcgequr28/lKueyxbDaKwFQSesQ5BGMX46Otc3kWbcf8mr460xFlpaBlNpjncRYV
         MjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=cw/A/P1yk9clR7XU1zO45ALsyOeTZOKcg37yUmDe984=;
        fh=3SdEcHFXCt8+XQ7QUpepAr8ItjOsQ70vaVdQ/TsVbaM=;
        b=q+zQnbEaG/WWuUUaSUX6fcdQ57eKlaAJWAYER0Sn4xWqfMR6lLJGRPf11p4jn3ua5t
         Rv1h+fguBnONm4fOO1VWoJhmIV+g6RM5hiXErr0iPZiy5Jcz5SfpxUw5H+8GAXmopLBc
         Z+W6xOt0NL8u7wqe21M7kZ3hmbiUxql6Nnkyvp4FS/e+XZC1eTZKamsXtBraHu3RWKXx
         T2VT7xjb0ObqG5psSeuBMtGHKK7DYFSRi/qN6sq0H5HM0S04tW8bt0y+6Z9PEjb8XcgB
         jWPDjJTXIl7D3NdlwBgkPQ1ELw5Yrdx1SpAUvtv1YKrFXHxIfxq3Q8EPSD6YM0/+huKM
         adsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDSnPQGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jq11-20020ad45fcb000000b0068f52b36b81si12659652qvb.55.2024.02.22.22.29.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 22:29:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GDSnPQGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdP3h-0005yF-85; Fri, 23 Feb 2024 01:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdP3f-0005xn-Qu
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:29:19 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rdP3R-0001Bd-JR
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 01:29:17 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so98424466b.1
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 22:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708669743; x=1709274543; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cw/A/P1yk9clR7XU1zO45ALsyOeTZOKcg37yUmDe984=;
 b=GDSnPQGeyruDt+VoPq30YsH3FkKgsP8F/Vi6vAvPdeKeicLXJfdhPxJCmuEiPCS9rA
 o9xADI7TqT/Gb0jvyoPL9qoMwFc5oi24kBJYlRwQL46xMXK16Df21SW8QtyAyMRZwyqq
 js/UpZGrYgTUYdPxoo5Go397fIRT+wDw+M2uK9u5n7c96vI2PWe7atmsZwF9INxN9qJG
 N12nu070G8VB0wzp8EZ2TZWt/2OcRB/LUxhqnGR8KSn5rJQaLgdEAJm2OiSf7n/8R8kL
 p5En96VKdP6vdCikfF7ZwHoSsORqAJVpqbZWCkZ7r084et5Hzg0jNnvjabRaaISYnx4S
 wBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708669743; x=1709274543;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cw/A/P1yk9clR7XU1zO45ALsyOeTZOKcg37yUmDe984=;
 b=E3Zqgzy20RLQtp48lI9mLbjsmH/sxArIIgpSblBCppbnt504UKgSBn+c2V2dEqzgJJ
 RZW4J42xyRS7kQmLlgxtNqLlqkGilbwZLX6Aq5rC1udnvlrwYhsdjMc+SLsYG363GXuG
 WnuZsSPftp01O0/m+KKzHGAs8BwOq2MRxcPLq1LIYd9Fm6vxCcRmHFrgey4CCUmmiN37
 XJVdQf/9bnfRfN+jqunfvmBgiZQxyyvqu6uwafvdQp+rGVPAMx+Z5A9G85I9liSUJxsl
 ZNL1ILDe1ZSMiTKoaFneU+KLgwKV+0YxRh9faNp0UZF6+BEGNkbml7Tq8Fk42DJx/kAd
 XmEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/SegZcvdBzykrH8NwJVmnBjdV+0dfsIt0BwG7naXalZsiP8JZ3qDnhrYS+JMWkrx0A1aP7+CzcCbZz6EfPi2LDEZ2
X-Gm-Message-State: AOJu0YycT4GbBQIObxIhs6w2ZVC40OYCxQqlez408dF75p7cm9F1vm6p
 3zdZHcfIG8Duq4JrEbCJxOVMKQT6SENrWfiYZ5wGC/1IgdtQqItq8ry3KHW820P8nTIXsA4rlup
 KJV8=
X-Received: by 2002:a17:906:f14d:b0:a3f:421:26a5 with SMTP id
 gw13-20020a170906f14d00b00a3f042126a5mr939237ejb.12.1708669743519; 
 Thu, 22 Feb 2024 22:29:03 -0800 (PST)
Received: from [192.168.69.100] (sto95-h01-176-184-18-96.dsl.sta.abo.bbox.fr.
 [176.184.18.96]) by smtp.gmail.com with ESMTPSA id
 x19-20020a1709064bd300b00a3cf168d084sm6600978ejv.165.2024.02.22.22.29.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 22:29:03 -0800 (PST)
Message-ID: <685d336b-2366-46c0-8d0d-088ef47a952c@linaro.org>
Date: Fri, 23 Feb 2024 07:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] hw/arm: Use TYPE_OR_IRQ when connecting STM32L4x5
 EXTI fan-in IRQs
Content-Language: en-US
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20240220184145.106107-1-ines.varhol@telecom-paris.fr>
 <20240220184145.106107-2-ines.varhol@telecom-paris.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240220184145.106107-2-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vK9LeCVuAIVr

On 20/2/24 19:34, Inès Varhol wrote:
> Fixes: 52671f69f7a4 ("[PATCH v8 0/3] Add device STM32L4x5 EXTI")
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   include/hw/arm/stm32l4x5_soc.h |  4 ++
>   hw/arm/stm32l4x5_soc.c         | 80 +++++++++++++++++++++++++++++-----
>   2 files changed, 74 insertions(+), 10 deletions(-)

Thanks for cleaning that!
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

