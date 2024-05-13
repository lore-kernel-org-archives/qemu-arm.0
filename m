Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2187280ejb;
        Mon, 13 May 2024 06:30:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqIlkZDpj6MEzI8W+gs1bHenD2OsWyIZai5Q+a9FRUCBUj6x2Q6wN2p7IELqCAN8rnBlWBnRW56FoQ1pFUPe/WP8OwKSx/
X-Google-Smtp-Source: AGHT+IEFAISWd7QxBXgttLg0CL5EtKstHrpzJIrUWAI8zRwB0+RQ3C7FTCiqQEJ6jkFxMBrnwfat
X-Received: by 2002:a05:6102:14aa:b0:47f:2c10:24e2 with SMTP id ada2fe7eead31-48077e5bfaemr8716716137.28.1715607028801;
        Mon, 13 May 2024 06:30:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715607028; cv=none;
        d=google.com; s=arc-20160816;
        b=hygV2ddmn2IyiK7EOUnqxhX3FPVRPYvhU7qwscbTtXaR8XfwsT05oM8iZlh094xUi5
         R2NztlOLv+9q1PXDUfFHNYeKn/TkGrr/aPEz9q230THhcBOpQOE2S1x3tae6XARIQUSr
         g3mkJfe35mOfQCpVhaNcCq56e6+FiLvPQz7VPPm5M/5fcHZX2fZ9BcvO2RPoO1tinrnH
         9GuIlxpBpI6ka3MTVh5DdR5vWYrirM5PAM7qGTLsd2vPOMksnqqutRr8t8A41nI3ZFww
         RElE2S3m+NKn1div/cTtbIVHabnyNOlJP3CJsYW1DB41duYSdCDfsom7FZ5u6UX5suOC
         BCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JIXZ57XSBqv04yqVQhcI1lAtcTMOxTYPB/N8kZSEFag=;
        fh=OixVEOS7d0EhguKGnqG4mjPiRpryWjnvzoiPC1Ni458=;
        b=qux26UU0oMd9BfSbo2+Z5HuK+fqYuGVD+yfclKOzwNmVI1QImUmk8jaM5sdJ0zbjYV
         SxBfcwiCffwTcuk20g2sCg9S+KAwuXnnlG5cTOAZDj4tmP4b6WdfLNIrOa6igVA5Sf3+
         BzgpGn5fPjoDAWR6tokq/xhBmJYeC5mCJzQNuM/11LQeBlU1uWx3BWMaJbKrfwzaxc9S
         f+bCMq4DlcoUUj0+c7GhCsoLV7AbT5/D1ssab5339E9EQ2ok8SFf5k7znQG1HAwdcU2u
         PmEphuVWU/7FOgnDQjzhvuhh9+B3zgsEyPM2T1xzLe5x+bAAI5n7/e34iMrE73XuozYE
         rg5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WaULQTZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-481fa91d06fsi91509137.373.2024.05.13.06.30.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2024 06:30:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WaULQTZm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6Vkz-00060o-PG; Mon, 13 May 2024 09:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Vky-0005zT-G4
 for qemu-arm@nongnu.org; Mon, 13 May 2024 09:30:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s6Vkw-00068T-HF
 for qemu-arm@nongnu.org; Mon, 13 May 2024 09:30:20 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34e040ed031so3337704f8f.0
 for <qemu-arm@nongnu.org>; Mon, 13 May 2024 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715607016; x=1716211816; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JIXZ57XSBqv04yqVQhcI1lAtcTMOxTYPB/N8kZSEFag=;
 b=WaULQTZm+XUzvK6+j8JdBhNlPPrSBKtl9IkV5Bj8tsgFcr7bJdOrwr/ToN7BH2wTLR
 56U4ZIPD/G3VqRhll82ImUdRuX6R4C7a7Ws3ObZZ5x31vhRsQY1Nhh6Ar178OimbEDiF
 jTpnKYIpB3qCX2aXNqVcGc+utKflViw9Z55S61FOJcw/95dR7DfHM0vLH8bowWkYWrQb
 xwByqsU+t3D6lOBv0KiQfC/uB/0Dkxj09Z5uVSCrDjijaekJNkKfvX/PwLi9j4KHxC+5
 TDRlpw2ZPgeKjWjYih1P3k+hFV9uQj68YtHt5TGecua78CNwHGajmWKMXBb2DaAG8yeK
 tNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715607016; x=1716211816;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JIXZ57XSBqv04yqVQhcI1lAtcTMOxTYPB/N8kZSEFag=;
 b=sghDvaKNVaz4VM3+GX65HbGl8t4eXlYHx4jRomkckE9JWedzbY/8IrrdBAMZvyOgQi
 o/Q0ejPkgQuZHhEXKj1NeNHhmNf2q0x3emF7fy5zLJq39RA6RqmDYEpyT7jiYzBvywOF
 OUEf8AJ8F8ODQQ3F7gw324LS0crEof/4kYVB70Cm/9ElTgZCAvSFFIgJzSTEsGfMPuzE
 hfHdu8EyItVsLN0YCOEL/jajAogciFA9VTB0cHRK9brYoExAPsWNVKuEbqjMIZE76De5
 uWKiBhR9McbRVY4BPGfP6FjWShtZqH+K92pK0gw+u0FxbLrZVVItHbtH6/loI/ogzp+F
 mcfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDMhCooqI9FBTXqY/sSJjk05DERMZPYavMvjtoQvK917Vu2ftx7FsnFL6YfwHDvw+7sLKNHiJg+1VPb75ofksJMwD6
X-Gm-Message-State: AOJu0Yy39T4vsrWJWCAoXghZ4F+isBIO103FMb4Hc3n1PvWkekDMoiPh
 zBgtm+pBpTrud5C+F2GoJnoIL8TxIYvdlGS6nlPgMKrnq+hSBetyxPIZD9K1aCk=
X-Received: by 2002:adf:fa4d:0:b0:34f:fd71:9af with SMTP id
 ffacd0b85a97d-3504a73edbfmr7026811f8f.39.1715607015860; 
 Mon, 13 May 2024 06:30:15 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b896a89sm10992838f8f.31.2024.05.13.06.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 06:30:15 -0700 (PDT)
Message-ID: <6bb04e15-5bfd-4ac6-98a1-33c65a6f1663@linaro.org>
Date: Mon, 13 May 2024 15:30:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hw/nvram: Add BCM2835 OTP device
To: Rayhan Faizel <rayhan.faizel@gmail.com>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20240510141010.656561-1-rayhan.faizel@gmail.com>
 <20240510141010.656561-2-rayhan.faizel@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240510141010.656561-2-rayhan.faizel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: dFVG9FKIIJ8N

Hi Rayhan,

On 10/5/24 16:10, Rayhan Faizel wrote:
> The OTP device registers are currently stubbed. For now, the device
> houses the OTP rows which will be accessed directly by other peripherals.
> 
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
> ---
>   hw/nvram/bcm2835_otp.c         | 187 +++++++++++++++++++++++++++++++++
>   hw/nvram/meson.build           |   1 +
>   include/hw/nvram/bcm2835_otp.h |  43 ++++++++
>   3 files changed, 231 insertions(+)
>   create mode 100644 hw/nvram/bcm2835_otp.c
>   create mode 100644 include/hw/nvram/bcm2835_otp.h


> +static void bcm2835_otp_write(void *opaque, hwaddr addr,
> +                              uint64_t value, unsigned int size)
> +{
> +    switch (addr) {
> +    case BCM2835_OTP_BOOTMODE_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_BOOTMODE_REG\n");
> +        break;
> +    case BCM2835_OTP_CONFIG_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_CONFIG_REG\n");
> +        break;
> +    case BCM2835_OTP_CTRL_LO_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_CTRL_LO_REG\n");
> +        break;
> +    case BCM2835_OTP_CTRL_HI_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_CTRL_HI_REG\n");
> +        break;
> +    case BCM2835_OTP_STATUS_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_STATUS_REG\n");
> +        break;
> +    case BCM2835_OTP_BITSEL_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_BITSEL_REG\n");
> +        break;
> +    case BCM2835_OTP_DATA_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_DATA_REG\n");
> +        break;
> +    case BCM2835_OTP_ADDR_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_ADDR_REG\n");
> +        break;
> +    case BCM2835_OTP_WRITE_DATA_READ_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_WRITE_DATA_READ_REG\n");
> +        break;
> +    case BCM2835_OTP_INIT_STATUS_REG:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "bcm2835_otp: BCM2835_OTP_INIT_STATUS_REG\n");
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: Bad offset 0x%" HWADDR_PRIx "\n", __func__, addr);
> +    }
> +}
> +
> +static const MemoryRegionOps bcm2835_otp_ops = {
> +    .read = bcm2835_otp_read,
> +    .write = bcm2835_otp_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .valid = {

s/valid/impl/ here, this is your implementation. It isn't illegal to
access these registers with a non 32-bit size.

> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};


> +/* https://elinux.org/BCM2835_registers#OTP */
> +#define BCM2835_OTP_BOOTMODE_REG            0x00
> +#define BCM2835_OTP_CONFIG_REG              0x04
> +#define BCM2835_OTP_CTRL_LO_REG             0x08
> +#define BCM2835_OTP_CTRL_HI_REG             0x0c
> +#define BCM2835_OTP_STATUS_REG              0x10
> +#define BCM2835_OTP_BITSEL_REG              0x14
> +#define BCM2835_OTP_DATA_REG                0x18
> +#define BCM2835_OTP_ADDR_REG                0x1c
> +#define BCM2835_OTP_WRITE_DATA_READ_REG     0x20
> +#define BCM2835_OTP_INIT_STATUS_REG         0x24
