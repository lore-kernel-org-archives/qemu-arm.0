Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp923831njb;
        Mon, 9 Sep 2024 06:41:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUABqYeT5gweDjoyNCpYgC4JfIVF98bzWwWS+ctWibzZx5M118xIlDd9Gau0D/hvubi4q/lunROdIN3tg==@linaro.org
X-Google-Smtp-Source: AGHT+IE0xqVY0uOos77A1psbsQA+2ubw7drKRBq8W/0FrIgnIjcIWs4hZK1JtAM9IhKWMwuTzuTT
X-Received: by 2002:a05:620a:31a9:b0:7a9:bd93:ac57 with SMTP id af79cd13be357-7a9bd93b011mr191263785a.3.1725889299626;
        Mon, 09 Sep 2024 06:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725889299; cv=none;
        d=google.com; s=arc-20240605;
        b=W9X1sxXgD53dSZebnaIy68cZweI3ehTr6cL48VgqVpGBtxTSXKxPrHIy3FnIX3Tt75
         9HN0xdzHkJzltU9t7uxfAr+8oF5GFiP88t0sUVvArrvuahNHV1p+V/qtpxzIt4AGdTR3
         H8C3FG7/kfgk5neA3UhLwDIJhzhYfslxkl6ycFHmbA1W8I2O7Vh7I/K9ERjxg2uYJqer
         8zfy3uJChLzzSomsnSWbopjkuPnHpld4KvonPKRMhnB9z6PIKABiCuMlEcqgr4mg3Tg9
         G93cdYU0h7/oRau3qDXqQ3O6lAhd72u9A7aknlVe0VEa6Vw1oRB53y45xMsMNLzjRpgT
         OItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dNaok0/389JuNyOt2LzZ4r2pSU2fDk+h6HXAOu16lR8=;
        fh=AxSZt//D1t/t682h2Gbd/4cfQdzSC/BCQbi411Eeg7k=;
        b=KEE66R5ssRMbcOmh5NxwVllhWFdDPjk7b7Cl48hXNGxKu2rZHJe95M+5FhSgo/4wdI
         BUYaKynMZbgcSJ7f1qhiD3HhXJw/lPrMfCbrgVh4Km3+jUkvxbpfmGupLXt5JU07JBqJ
         SwdtVGYiMzM0ZJJl9I/Mtao7l1J0NOZwfK1yAZjzNAaQkRgeqtFeB+ZqAk8FEOlrZDml
         n9fF6Kd2+nvebQhIAAE5DePf41hNNeA16uWAaVBQcLYmpWH+X9JD8njWuOaUTs04kpTV
         PrAVj0JkaSdPPqHXZveWm6+RYM7Hzr0MWK6IXlDIBJaRe7nvBTFP62zwl6pwKo+S+uAZ
         1x9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bq3J1HmQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a379aesi553831885a.307.2024.09.09.06.41.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 06:41:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bq3J1HmQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snedh-0002MX-6m; Mon, 09 Sep 2024 09:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snedf-0002E5-Ch
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 09:41:07 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snedb-0007wp-Fp
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 09:41:07 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a8d60e23b33so104617566b.0
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725889261; x=1726494061; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dNaok0/389JuNyOt2LzZ4r2pSU2fDk+h6HXAOu16lR8=;
 b=bq3J1HmQq3WPtVi32ivb8IhRD7+70hEC0AzXaaiNbIyVEmI+BrNh1JtSvqDRK0sn7S
 mwueP/+HRCqvlldSdfJ9uz/wrsdm08FXuZJoy0i/fHoRBqoMT+MzsDoEghY26zrKtg+l
 rReP+eM54rxc1IvaN/uhoS69TAhhN+7IEmn8u2g+OE4gM6NrMwoTpmR1M010g47ZAHFs
 bntIVlPmif7hOIvOfIwgB0WRtS0c3ct2gqHVIhEgft4NDxd8I1C98mjLTKDCH5hFLVVp
 wEVogPeEo9HhYWGCiJ48p5Oa8692u2e2Hrr/jIm5LMmMEJhWpg8G3Pu7bVHpXwSJf9dT
 +eaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725889261; x=1726494061;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dNaok0/389JuNyOt2LzZ4r2pSU2fDk+h6HXAOu16lR8=;
 b=R+9ip3E8SevILRcSuvEV/gIjz29mtODxA9RPMwZ2ndosMF1er8vgntRSJ8IuDf6aIO
 kIfhvj62t4lJJDzh8MpYczbwyBmULPcQ2LtqzM+6asJzvsv2zxYbRz5vkcpghJ6ntsIl
 AI7g2qXfmYLUZZQU/mwAPEY6Td3n6aa0EEpXxvj7g/GtJghO8u5E1474gS1Mph1TSzSb
 OHOcUk8dmav/bpvUTihixkj+nTfEXPA2yRp9O6ikpi6SFU0fnOO9Bi4es/NB8O9mfGRF
 uAe8rEvgEQRL6PkOLJLWlCPD/qv1WBOufgG9dydadhsYgGYROaL5hIBACiyhHEvaN2Mb
 cstA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVax9letxYjHMJi1AJqR4e/ZtDCnJKTbM6uw/+jM7oQk7wPCVtTEGMm4dVyGsBXMXnIkfKc2cByow==@nongnu.org
X-Gm-Message-State: AOJu0YwY7c3Ylh10IoTiuvnOW30lbeF0RtD+2O9sMSFP6QdbdJ/dlsUL
 tgQUmfD8kd24pbwPR0o6lzXDxwCzJWdwj2rZYpXxKALWcQ0p/SqjoTswTiYMvgc=
X-Received: by 2002:a17:907:9628:b0:a8b:6ee7:ba25 with SMTP id
 a640c23a62f3a-a8b70ee944emr940646666b.47.1725889261042; 
 Mon, 09 Sep 2024 06:41:01 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ced1bfsm343371466b.154.2024.09.09.06.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 06:41:00 -0700 (PDT)
Message-ID: <fabedae0-d748-4a9d-b802-14d15f3cd44a@linaro.org>
Date: Mon, 9 Sep 2024 15:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 00/53] arm: Drop deprecated boards
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
Content-Language: en-US
Cc: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Guenter Roeck <linux@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: umzyVdfEeM8X

Hi,

On 3/9/24 18:06, Peter Maydell wrote:
> This patchset removes the various Arm machines which we deprecated
> for the 9.0 release and are therefore allowed to remove for the 9.2
> release:
>   akita, borzoi, cheetah, connex, mainstone, n800, n810,
>   spitz, terrier, tosa, verdex, z2

> The series includes removal of some code which while not strictly
> specific to these machines was in practice used only by them:
>   * the OneNAND flash memory device
>   * the PCMCIA subsystem
>   * the MUSB USB2.0 OTG USB controller chip (hcd-musb)

> thanks
> -- PMM
> 
> Peter Maydell (53):
>    hw/input: Drop ADS7846 device
>    hw/adc: Remove MAX111X device
>    hw/gpio: Remove MAX7310 device
>    hw/input: Remove tsc2005 touchscreen controller
>    hw/input: Remove tsc210x device
>    hw/rtc: Remove twl92230 device
>    hw/input: Remove lm832x device
>    hw/usb: Remove tusb6010 USB controller
>    hw/usb: Remove MUSB USB host controller

Some of these devices are user-creatable and only rely on a bus
(not a particular removed machine), so could potentially be used
on other maintained machines which expose a similar bus.
We don't have in-tree (tests/) examples, but I wonder if it is OK
to remove them without first explicitly deprecating them in
docs/about/deprecated.rst. I wouldn't surprise users when 9.2 is
release. Maybe this isn't an issue, but I prefer to mention it
now to be sure.

Regards,

Phil.
