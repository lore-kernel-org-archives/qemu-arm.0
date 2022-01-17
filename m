Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2016355lfj;
        Mon, 17 Jan 2022 04:23:04 -0800 (PST)
X-Received: by 2002:a05:600c:4111:: with SMTP id j17mr26804499wmi.7.1642422184814;
        Mon, 17 Jan 2022 04:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642422184; cv=none;
        d=google.com; s=arc-20160816;
        b=mxtIyLQs4m2+YcPGUyWVTwqyPaaqDoRmtozTNibEJmMqmvcx5dEfufANjKJ+AQTz0/
         DGgEG1i2TkI10HhQgOfL302WVlta61sDalm/i4aSZCdMi1qzzW6AkaydoeiW5XMdr4nH
         rZaphuMtRgmF+1/Ajf5rwkXyQVdoSTcNdK2GbldLbAIpZvLNV7SUr14dP01YyXsGFG4I
         9iwB+9o80sff5FZ4F2oYgsT0g8f7mHSMcr3DN3b6/lbqslQU2WAFiJyum65rC4AfIk4/
         TRaguNidF0m8ocJ88VqIhZYOcvNppTej8lJko6u1FpO7/lcxWJRMBx3oJznzSM5ofJWr
         /PJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=JFdvW4otUdg0xUvm3ogcAdT0tMIF0RC8N4ygEvMZplA=;
        b=BcT7DHZydXJwmTjhrjYVyDuHfzrGdGMe2aZvv1Igt37OMBW8AfE/sRN47wFQIfKYWf
         xjAcd65yQif/Qh+pnE/EJO7KAXtiNh/ls5Yo8KkO43blpJeW1OXBvkel+tZXw4pre8Y9
         xbZ5P7kRNNgVAJnZpxhyhuzB7BPVqrhyxQ9OQim/G15/yqL0argtj2L2RZKzvdotA1S8
         UQjX3o5kdBJRTfiBrBRDbEiwmgN7IfX1rygZEIWpjcvimriIMoc/tzRC284uv3+FGSCB
         GrmkTOTcADtLJajQplSj3d8LhYfYurmt2nEVwQRh5mdcW3ZepffhYqxmDrJuYqEaQ0cr
         Cdtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AyP5FY6u;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j4sor4629431wms.19.2022.01.17.04.23.04
        (Google Transport Security);
        Mon, 17 Jan 2022 04:23:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=AyP5FY6u;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JFdvW4otUdg0xUvm3ogcAdT0tMIF0RC8N4ygEvMZplA=;
        b=AyP5FY6uentnrVZO7HaUo/kZC9bCnQlVFtJa+RlxPeW6pnH1RvRgk6Cgtcru+thL2f
         f6DlTH6SFNpRPvVlHq+g+AQv/VVtSfkxa0XOpbuvTNOE5iZE7/a2sONFDUoPlS6V82V1
         y1Gm10CAoJjSSgJ3Y0Y1wYUACDPRlfEU6DCvLVsIE1vfFa6N/xLNCuINIzLelcUpSqAr
         HqbkNAyTzSanKC6K7c+gsh5hhBykTr2BuFJPIcuFNOGlsynOqiK6rleOI3z9yu8RUciB
         hZMH228ZkBy6/ZwmTuopH6793D5snzHl2Kbx/xS6qj2cwf86hP/7oNNh5iVpr6UUETfZ
         Yshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JFdvW4otUdg0xUvm3ogcAdT0tMIF0RC8N4ygEvMZplA=;
        b=63Zkx38/w8SOelQnscfFwYVGGR6Rkm9tVlKJeb8QXeFekGrLjEW5OTrAINbdHvvsEk
         revBSxN7SQgOzVlq2ncDBMx4sSFYq5Ulzn4/iJPlE4S/xEjlIb8dKsHa3pCN2tdaznCe
         DX5xVO6F3mbDRKlhzod/Nj3AnMsNHOEUre98C8mV7F+dxY9CzWSrBybfg2rj+PAGlJye
         G/l8WlYoX+P0LjHWzR4zHigxzKoZkSqQNN3ItLavGY1seS02HXQultc+HmiZj+8uSI4w
         XIEO+YwH5KbXf+vfojlozoLIWFxsg35X/d/c6x2UHX1M+1RKpkzgChF7XkC1sesTIFNY
         A38A==
X-Gm-Message-State: AOAM533BqpPjJoIHJztz3EcKbqpCvcbttRyU1ABgMr1RSrCkOqldhCXr
	QuzCkEzLRivUlqZSU3Dr1BxoHAmZta/LTP9n
X-Google-Smtp-Source: ABdhPJzVS4UG5XQPUG8S2ygvYHsNy1eoqxQnDIKhjlU2JsxsBQ+WTFnopX5bX58GO0eAGs9kWT3cTQ==
X-Received: by 2002:a05:600c:4e09:: with SMTP id b9mr19076889wmq.194.1642422184346;
        Mon, 17 Jan 2022 04:23:04 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id b13sm15583886wrm.72.2022.01.17.04.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 04:23:03 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <34425525-2c74-5fee-bc5a-c789ef64d0b6@amsat.org>
Date: Mon, 17 Jan 2022 13:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 2/6] hw/arm: add boilerplate for machines based on the
 RP2040
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110175104.2908956-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rVeCD09MqbLq

On 1/10/22 18:51, Alex Bennée wrote:
> Currently we are only targeting the official RaspberryPi Pico although
> I suspect most RP2040 based boards will look broadly the same.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configs/devices/arm-softmmu/default.mak |  1 +
>  hw/arm/raspi_pico.c                     | 77 +++++++++++++++++++++++++
>  hw/arm/Kconfig                          |  3 +
>  hw/arm/meson.build                      |  1 +
>  4 files changed, 82 insertions(+)
>  create mode 100644 hw/arm/raspi_pico.c

> +static void pipico_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    mc->desc = g_strdup_printf("Raspberry Pi Pico");
> +    mc->init = pipico_machine_init;
> +    mc->block_default_type = IF_PFLASH;
> +    mc->no_parallel = 1;
> +    mc->no_floppy = 1;
> +    mc->no_cdrom = 1;

:)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    mc->no_sdcard = 1;
> +    mc->min_cpus = 2;
> +    mc->default_cpus = 2;
> +    mc->max_cpus = 2;
> +};
