Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1060062ejc;
        Mon, 15 Apr 2024 00:36:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKDTzTXEoiphRgld1hj+YW5uSemZG3+378IAduo2jIa1KyyPlKPageoY9dAlJ1M4XIIGLTQdZcSfIjrtm50KpKs55bj79l
X-Google-Smtp-Source: AGHT+IHfmw4oy9CK245gbZFTt7IlWXWa9x0e4pMau2KAonLCT0jB41b1DPIgYq1CqqZcvhhRrSae
X-Received: by 2002:a05:6102:cd2:b0:47a:4221:5511 with SMTP id g18-20020a0561020cd200b0047a42215511mr6843157vst.3.1713166574383;
        Mon, 15 Apr 2024 00:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713166574; cv=none;
        d=google.com; s=arc-20160816;
        b=L9lmVYdFL2jDoXBWyWoWPMigDLSVh0+GVHNw+syaWeEXau3H8OEOCZs07TVRtmxVhh
         t28giYa0TY4iiGVt1V3UBchsobGa+I2hx+z1afN6CstNe/nYXOyMrhu0ywhbxs6cfSUq
         iAUm3lT2qRPkCo9HvpMuFl/v96568dwTzAUV5tZ154c3MnFiMUGWM6F+mDc0zXUXMiK1
         7A1SE+/U3FosNCJJbJPeps72qjJ1l1cPoJ7FBZkVvjyT9pxPC6t0p6ZWboRz/VZYbdOS
         wpnXexrvTIDGaEjir1/RuRsaiNvihjHEmcGIe4xYkU0DdW3XNyDTfCtRGJHoC4e5OYLQ
         XY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=XRUAnlKiaRRwzf0wfbwa43E1iCK7RwwFAsvsJo8rp3Y=;
        fh=0fZt6Ry0fBWHIb1fMFK0m+/cEawH3+D5k10Y9KV+G4E=;
        b=ysA0Am6Z8xpQMAAP8olVB23u51g/SiTFHOacc1g7K2Hbuh16rfhcPR+HPzfe+yXfg3
         rt7mxGhA4cRvMGArKJImWdLSHJsuHvNfJiEYZc+E/nH/isMJEWfzyAEi/nTaVO/NB9Fv
         QNWR5+OV1ESOHkn+4yrCXoWuMuT5XjbfSapeAVhOQPpdJuYROk2qOdxGoPeDXB/jk0oZ
         JwNYK5f2oSAhF13ZCo9L9YImbYC0F51J3V9Cv/RQ0NOGNx6k92HswXgvMfmbN9UzN7Zu
         RZvU5N/2WNwze0cBuzgjQTtdKeyWz3sbYCjspPDfinaqmmM6OmGLXA44nt9ff+dO3C4/
         A+VA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/9hWh98";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85f8f000000b004368714b214si7776292qta.211.2024.04.15.00.36.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 00:36:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n/9hWh98";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwGsc-0004LD-7i; Mon, 15 Apr 2024 03:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwGsa-0004Kc-DL
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 03:35:52 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwGsX-0003bd-K5
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 03:35:52 -0400
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d895e2c6efso36372911fa.0
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 00:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713166547; x=1713771347; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XRUAnlKiaRRwzf0wfbwa43E1iCK7RwwFAsvsJo8rp3Y=;
 b=n/9hWh981wUWsp90QOd2Qb3rDyhHoLeKV8pEvKUtm1iyaW0eF52b+efbUBhxkK1ilX
 qwjyk/1Ay8Kbo3P6AbdHnpnGNvos277l866LRcJTmd8AW3RnI59fuAP/CHRX23mbkJry
 rt+xustBH5AijunQSFWiVSe3Q2VCTSBj0r+A92FzYtGmyLoPLLWF6TgEVnC0uDgGOgde
 xC3CZMe6EfgtH0cavz5JagubQVn3fmguTwwyxsbDv0Ui/8XWXjNzpsJBsEn/gWMq4nqU
 HH96fWAV38wcPZG9RBxypuitdfoRGc6vFq14bqGLDFzmMTjc6ojmQB5Mo8DpWLPX0Y7O
 E+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713166547; x=1713771347;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XRUAnlKiaRRwzf0wfbwa43E1iCK7RwwFAsvsJo8rp3Y=;
 b=wp4vN+y7P3RoAFBKr+YXirbI4zfucGxIHW+2tp75A1m2gn4f6IOVWx+44AYskJBIpD
 hmFy16sv8xtyMpE2c6YsMsW/bVwi2YBmyHMvkQTqJJiMeiqvmPUwNvtbZGmRBB7yLE0q
 5WjwNVjFwMIpoaoRLw6DhqMa47VSNE+eJYiapx3VWfmQzV4zGGwVLreJ0oi+wxb8f6zM
 9FJp1DilmcLDAh4XAWDL4gh09uCWnmkcILt9crFUqMXXSDReshPGk1kVLkD5TJ7QmUcd
 tS9Kq85QZymnQiG56f+C2w1BjSBXS4olWq/KX59melG5dwjMCQ/7ccy0qbThhZetxHzd
 zoqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA0yXEDn9nAF3jozpk6QPBNgp+K6Try5QvXORCDBAQtroI2VDm9n4ZJWgYVOV4llNvhGIAImccMmecbpSDnyH6wurM
X-Gm-Message-State: AOJu0YyOo9n8U/knOIQJNu6MjoazPLHiPznd4ri3p7lUOtr8DLsG37Wo
 Q09JZcZXmyENqvxjVetHFzWMTK2ws+1JnYshgezD5pJ/SPqzuU0hPLhT8e1xywE=
X-Received: by 2002:a2e:99c6:0:b0:2d8:74c6:c44c with SMTP id
 l6-20020a2e99c6000000b002d874c6c44cmr5044349ljj.46.1713166547395; 
 Mon, 15 Apr 2024 00:35:47 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.132.126])
 by smtp.gmail.com with ESMTPSA id
 w13-20020a5d680d000000b003433bf6651dsm11310911wru.75.2024.04.15.00.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 00:35:46 -0700 (PDT)
Message-ID: <af647bac-d0b7-4382-b762-5ba055411872@linaro.org>
Date: Mon, 15 Apr 2024 09:35:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/qtest : Use `g_assert_cmphex` instead of
 `g_assert_cmpuint`
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-block@nongnu.org,
 Ninad Palsule <ninad@linux.ibm.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20240414173349.31194-1-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240414173349.31194-1-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x236.google.com
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
X-TUID: SXbqrPLsw3iE

On 14/4/24 19:28, Inès Varhol wrote:
> The messages for assertions using hexadecimal numbers will be
> easier to understand with `g_assert_cmphex`.
> 
> Cases changed : "cmpuint.*0x", "cmpuint.*<<"
> 
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   tests/qtest/aspeed_fsi-test.c          |  20 ++--
>   tests/qtest/cmsdk-apb-dualtimer-test.c |   2 +-
>   tests/qtest/cmsdk-apb-watchdog-test.c  |   2 +-
>   tests/qtest/erst-test.c                |   2 +-
>   tests/qtest/ivshmem-test.c             |  10 +-
>   tests/qtest/libqos/ahci.c              |   4 +-
>   tests/qtest/microbit-test.c            |  46 ++++-----
>   tests/qtest/sse-timer-test.c           |   4 +-
>   tests/qtest/stm32l4x5_exti-test.c      | 138 ++++++++++++-------------
>   tests/qtest/stm32l4x5_syscfg-test.c    |  74 ++++++-------
>   10 files changed, 151 insertions(+), 151 deletions(-)

Thanks for the generic cleanup!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

