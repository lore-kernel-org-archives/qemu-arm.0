Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2549042ejf;
        Tue, 27 Feb 2024 00:59:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBuPVnRxO2UfuN0qTGJcUGmu546QUqQ/RoTj9qUDaSctqabgzBUREIRkUGAcVCtypcU8TDPDlzsTVmI4ohPLvbPc8QPZoS
X-Google-Smtp-Source: AGHT+IHzsc63R6MKl3WuB5THwXhXdOa/mpHn+fYo7OOjC3U9yLEUO851F33klGNgEZRvNgtdglFC
X-Received: by 2002:a05:600c:1992:b0:412:9c2a:7622 with SMTP id t18-20020a05600c199200b004129c2a7622mr8085318wmq.8.1709024364702;
        Tue, 27 Feb 2024 00:59:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709024364; cv=none;
        d=google.com; s=arc-20160816;
        b=ptqbdYhl7XwziAM4idm5gJHlFeXXba3bGTRmeDVxcG2k7oneqnXB3Fg76qstM6Hv1b
         AfjfBxteUVEasaoNvHeA7HabYrnKCxSJstsz662CX1lPlQ6ViirJktIg/13JXKUEmQaG
         26lcNns+TtP6gUCgm5QrnNbQ+/43xfM8SpbXKuVDkKjKL1TYIEKHRS+sDqMDz8L2p9pv
         cNColVYOzluqp4E7ZDr/X/ZwuM3CubxC8MpcPiyO1T8oVASW6rSAQFYRa2CVQH7rPh88
         4AQHibfBJhmYKEOUsvIeZEOVnGfy/vY4qdj8xBil6zGxL14y5NgOhzIglDhirjI27SS1
         FbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DUw2MMJWHD6lnJyIJR8e3zviNgIR3r95MSDekrWFcJc=;
        fh=1yC8E0anI9vWQbE8wZHyKWP7pzGYFySjR7i+eHwgxsg=;
        b=xyqo1OMZDKkGauD+YRQ0JGsQ3VnzqFahviFRXBmzfxt4H8ybb4jX51dQsdIoES2JHx
         roMGnvRAjP2mS2vgFCZhDu0Ni10a8RKF9YvhJfoD4ijwGqMwqAI73TQcDZMvRmxNxCDF
         IyI+jrwIiOl7/e2YpVyuz1cY8019Ve8x07fDgGI1YAYv3+mHKmiY0dWsk3Pg7qAhz87F
         jMM6NizZkC2z/S1y9wnF6vA70BWVek2VwtLn4asoCoSdJHubL49lWUXCVAyPtbNKMn85
         nEDKLjSqBX395KpjFV9oNi2U6pC2kPM4UXO4Gy81Yqm/BdtsssaZcDGNruvkcfS9hTzj
         LNkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LUuwrOSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c23-20020a05600c4a1700b004128fffdb7esi4832234wmp.64.2024.02.27.00.59.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:59:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LUuwrOSS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1retIk-0003XN-4I; Tue, 27 Feb 2024 03:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1retIi-0003W7-MP
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:59:00 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1retIf-0005Ar-VQ
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:58:59 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so753017666b.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709024334; x=1709629134; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DUw2MMJWHD6lnJyIJR8e3zviNgIR3r95MSDekrWFcJc=;
 b=LUuwrOSSFKv4UPql6yHVvW0oj7bz7mh6s/YPgWkS4u3pu5ngT52BkvK69SH0YdvaVg
 xwqq65GasdSMKqEjvmkeUura4+xYMXt1kEv80GWIfBf9SjlcLHqHlNPQyCBbZD58vbtO
 U55ijdz8nZV4T1CIRykD43EDlvnUhTD+f89sWo1Bu91MGjGJC8p9Rj4/n61wMOs4O15X
 hB1vU/Rd0rrzwWObuuk+Ew0kb0bSxEFewXfe3+fYzRj8W6DaIG4xg7cyerj5UKZT9nrT
 +/paMMmnT8mEBW/KEWyPYdDi86oTYvbQxda4nL+nkPgTju0KkFUUMmroKqGrYeF7bTPW
 8+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709024334; x=1709629134;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DUw2MMJWHD6lnJyIJR8e3zviNgIR3r95MSDekrWFcJc=;
 b=eUj3k+zwUMALXsrNyIi+mR5WlrsrUtjcYjyOSvT1hikrtqU3TxeYkolJTMbn2ExeAf
 jv6a1YCQVatqDRYFT9Fp8IOLcXa0gkSI78QcrVybhV4L/+h8CnIhNtVDl2KmkPtKcvDQ
 qIvToFjL/Q67xWT4w5vlmpyBLZaXPvQ5m59qNBybS8GqBIP8G9y5AdN0StzrjWqb0eHS
 3TN/Fi8liazrM8IczKzTSTVlz3bYRQoL/9FsXYzeuL+AnEZoKvCufHsE1RILpkFfO7pq
 FAbJqgK05lvc4EjZZMv2/RskxiVwNNdIeoiDo8SAbytktQPJHQFaYgy/NJiyX7uFfZNs
 4bxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtoR1ilH0CIC5SRziS5icE4aNWqR40wIyZRClYBFmUADK5cnZWXWxMSmeFfIGE5mCLjeC1k12is2hcbOvvMtV26bkr
X-Gm-Message-State: AOJu0YxQBAVtz7fcF8TwYr8qAZA8UCOaD+IDyNkC8yR/pnmnhAyfmn7u
 qJ7YosDyB3PqHDwZuZwEi0CnArAX6eVmDj0WEPuy6gZBEFDp6faVqzh3wJqMwOY=
X-Received: by 2002:a17:906:5a8b:b0:a43:6146:a905 with SMTP id
 l11-20020a1709065a8b00b00a436146a905mr3691269ejq.24.1709024333793; 
 Tue, 27 Feb 2024 00:58:53 -0800 (PST)
Received: from [192.168.1.102] ([176.176.160.23])
 by smtp.gmail.com with ESMTPSA id
 a5-20020a170906468500b00a3fb4d11809sm546749ejr.204.2024.02.27.00.58.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 00:58:53 -0800 (PST)
Message-ID: <646ec455-6f54-470c-8c77-5e7997b8ce29@linaro.org>
Date: Tue, 27 Feb 2024 09:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/41] Split out common part of peripherals
Content-Language: en-US
To: Sergey Kambalin <serg.oker@gmail.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-3-sergey.kambalin@auriga.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226000259.2752893-3-sergey.kambalin@auriga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: q5IKaqzza5sj

On 26/2/24 01:02, Sergey Kambalin wrote:
> Pre-setup for BCM2838 introduction
> 
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/bcm2835_peripherals.c         | 198 +++++++++++++++------------
>   hw/arm/bcm2836.c                     |  24 ++--
>   include/hw/arm/bcm2835_peripherals.h |  29 +++-
>   include/hw/arm/bcm2836.h             |   3 +-
>   4 files changed, 154 insertions(+), 100 deletions(-)
> 
> diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
> index d5573fd954..ed38a08a57 100644
> --- a/hw/arm/bcm2835_peripherals.c
> +++ b/hw/arm/bcm2835_peripherals.c
> @@ -30,9 +30,9 @@
>   #define SEPARATE_DMA_IRQ_MAX 10
>   #define ORGATED_DMA_IRQ_COUNT 4
>   
> -static void create_unimp(BCM2835PeripheralState *ps,
> -                         UnimplementedDeviceState *uds,
> -                         const char *name, hwaddr ofs, hwaddr size)
> +void create_unimp(BCMSocPeripheralBaseState *ps,
> +                  UnimplementedDeviceState *uds,
> +                  const char *name, hwaddr ofs, hwaddr size)
>   {
>       object_initialize_child(OBJECT(ps), name, uds, TYPE_UNIMPLEMENTED_DEVICE);
>       qdev_prop_set_string(DEVICE(uds), "name", name);


> diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
> index 0203bb79d8..1fc96218f8 100644
> --- a/include/hw/arm/bcm2835_peripherals.h
> +++ b/include/hw/arm/bcm2835_peripherals.h
> @@ -35,10 +35,13 @@
>   #include "hw/misc/unimp.h"


> +void create_unimp(BCMSocPeripheralBaseState *ps,
> +                  UnimplementedDeviceState *uds,
> +                  const char *name, hwaddr ofs, hwaddr size);

Note for Peter, we should officialize this create_unimp() in "unimp.h",
all we need is the parent object and MR pointer.

> +void bcm_soc_peripherals_common_realize(DeviceState *dev, Error **errp);
> +
>   #endif /* BCM2835_PERIPHERALS_H */
