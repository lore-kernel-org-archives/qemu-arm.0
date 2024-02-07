Received: by 2002:a17:906:e18:b0:a38:6d10:c5dd with SMTP id l24csp263744eji;
        Wed, 7 Feb 2024 01:03:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCViQ5CJF6lxryNLYL7Q+aeuwJYqdglHQiN0RvwnMFeusmSCVRn6hWpREkL0eCC809pwMrPdQumkvjv+UnlAt5FZN7lY7b9F
X-Google-Smtp-Source: AGHT+IFItEzMXmQnwykkAq7Sx2XwoKMbGKwo0+nIS7YOqywImmW6CSQIjOw2uIlqS8i75eg3eD2L
X-Received: by 2002:a05:6214:5186:b0:686:aa7a:784f with SMTP id kl6-20020a056214518600b00686aa7a784fmr5037468qvb.50.1707296590936;
        Wed, 07 Feb 2024 01:03:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707296590; cv=none;
        d=google.com; s=arc-20160816;
        b=oS19X4/g852KFfwgaFubLlV+gX5CsJZC2ennD9S0O4I8JW70ZX2uPHOjh7g8wKXmFz
         yd9iqI+H+W+R+BCFKn2yd430UP6ceNU4XBaPuOqEr3FEOoT70ilrSGCKF+Vh1QTMsnbF
         tvhfCST1fPZ+mpNl8I3RYXrQejaO3Bkjo0ibmdEw8P4xv7P87Ynx5nf8c4WrwORy/g+O
         gIhQBRD7XS1kNQriRBLfnOBEnjqT6w3yz2YG1WtYRz6mWoCDh6umr+KOHAOlR+20ss9E
         3zsYbyyZpH3kEG8AZhwc92omOYQOhxSkiSitw2tmFu1ks5IA76+yxNjsc/q6eTYAp066
         N8OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fHwGSjHVXVHNUiahUB2RJJ0LQ7CGSwuntWOhWSUPVbM=;
        fh=h3gRpty2WwWES401byNzoa5m6yDUQkO3z0dxQznBUEo=;
        b=s2x9IyP7K8whtwaJPxzdOS74lhZ6diT+gPdmCCavVw8Mhbf3u65QyuD4+7py2G8f1z
         sRwJZ4yEfWEcAJ3AoudUMCEiIDNYrypCdVx0Zr60L4pZ5qcm3ScLFg+kp3EXMp8w6t3x
         xzhBEdmWPB2qcniN9/9okRxTnFIBih35wa7IaH9RP1rqxKH/qKNm8vM3aKln6Rh6rLcI
         ehwp3kLAGimd9AJRcZQxNwqGQ+hdjMdDyRGcBeVcp7/0DW8epsPaMszUPxIC75O/pe4t
         rqYO45Oqr0j9JcGjXeWDCU/6eCYJATVM1tLxTUs44KM3LHxmNfKiOmR/4yQxBXj9g/X3
         +V0w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDbg4sLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCW3m7n/5bcRE+m3mAPU4V4dREtDhMggAAzhYlBqYIGmTWAaHSVAw8ovRkaa1zLhAyRXvO57cCIp3a5am0ZJS6jPtPVmyMEd
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a05621420c600b0068cbf72c8ecsi383398qve.486.2024.02.07.01.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Feb 2024 01:03:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WDbg4sLT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXdpa-0002tv-KK; Wed, 07 Feb 2024 04:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXdpV-0002tL-1e
 for qemu-arm@nongnu.org; Wed, 07 Feb 2024 04:02:53 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rXdpR-0005yw-D8
 for qemu-arm@nongnu.org; Wed, 07 Feb 2024 04:02:51 -0500
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a30e445602cso308158266b.0
 for <qemu-arm@nongnu.org>; Wed, 07 Feb 2024 01:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707296568; x=1707901368; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fHwGSjHVXVHNUiahUB2RJJ0LQ7CGSwuntWOhWSUPVbM=;
 b=WDbg4sLTFXMcZddxbgPfuqN5sMplGBTGc33dykKNduBvx5GNOEBI+p7Z4ifiqMU+xP
 Cu3omVNgbnh0TS6v1qNa5+hZ2qBP2kIL7Bh8OWo01vlgDo6SsBu+MAsmRkNtHoUuCwTY
 473vHgQnRD46tCrlIVOI6iQ6H/yTPtQtsLci4PF4CsiSrKwg6f/O8LA728PsJMZegByu
 //zuIS2/TmiP8mbFVkfYu90O3kOuV8uMvTsEQzA1/a5/kjefbONnI+hDHXVOyl4evSW1
 eBsPxCnYcAlDWfR2SaHIzqcdNPN10NhBbivhCCGqjIEfN22e+242mjPpABtWFTMhBA/j
 FNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707296568; x=1707901368;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fHwGSjHVXVHNUiahUB2RJJ0LQ7CGSwuntWOhWSUPVbM=;
 b=iadJwa1sYpV2mpouJWfyQNcNdDHuhU80wcB4T2F3wi75byqjS3XIMZNll0+e1nG8Hx
 zEKtBlxtSALqrmlp3vRlAfhgvi29MSApKGyMaAG9gDiSuHkQaFm9VbaQspZJc6b1p4++
 SgFyDk6n0c/Q7mZ31J8ByAahiTQTqkzxNkh+XYus2yXaTMu5L1qAly+YNamHCB6UGPXf
 9Ll5oMIpmpCOkk+M+ABaNwkLEsvuDlRoLgnGJD2xsk3/I4WRmhgWwlbNkvvbKR+RWIeC
 XwAMpCSYV+oVX9x/HUX/S8JxGBQ04Irbe5VHhviCcnbAh8xYqi3I4EuG5sWSOmkG/yQN
 YW7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWND0r35EFu+wlPk25I/aHq+gXOb+2hPhZkR+clS8hAQD6lAjuJJMSgXL3UI1G85KbGhMadCI5wISq4sKqSAX4kGUlM
X-Gm-Message-State: AOJu0YxfBMzPbtvnpQzlOTGgJRHp87syr6oMcQXMxOT97Upf8R+zBPAx
 nHLqvbLcHWzxEI5kmL1HTtBjOASp8QdiSoZ38ZW0E6dmSmxrmWK2IfEiJiwYgqFn3JWbYOO+23x
 E
X-Received: by 2002:a17:906:eb07:b0:a35:e5bf:b585 with SMTP id
 mb7-20020a170906eb0700b00a35e5bfb585mr5424550ejb.35.1707296567862; 
 Wed, 07 Feb 2024 01:02:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUI4Y1gynNcQwOPQ09t+oZ1RUDWJUh3tzfWrA5Efy6jOpoRS+2mqrHfMfuapl9Y2HiBxPdS5ib3OtIZ0+QBgVR53HxejwXR565bWeEDVnsEEL64wrZU27ckiqjs45fQxKF3BWX+/hDRJFJC6He4PxEYE2DU5BbrREj3bnaS//Y=
Received: from [192.168.69.100] ([176.176.170.22])
 by smtp.gmail.com with ESMTPSA id
 vh10-20020a170907d38a00b00a3875804883sm459014ejc.124.2024.02.07.01.02.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 01:02:47 -0800 (PST)
Message-ID: <b8fbf313-1b24-4cf3-b5c1-f9289b413a75@linaro.org>
Date: Wed, 7 Feb 2024 10:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/arm/mps3r: Initial skeleton for mps3-an536 board
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240206132931.38376-1-peter.maydell@linaro.org>
 <20240206132931.38376-9-peter.maydell@linaro.org>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240206132931.38376-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: p7B9xyNk3R3b

On 6/2/24 14:29, Peter Maydell wrote:
> The AN536 is another FPGA image for the MPS3 development board. Unlike
> the existing FPGA images we already model, this board uses a Cortex-R
> family CPU, and it does not use any equivalent to the M-profile
> "Subsystem for Embedded" SoC-equivalent that we model in hw/arm/armsse.c.
> It's therefore more convenient for us to model it as a completely
> separate C file.
> 
> This commit adds the basic skeleton of the board model, and the
> code to create all the RAM and ROM. We assume that we're probably
> going to want to add more images in future, so use the same
> base class/subclass setup that mps2-tz.c uses, even though at
> the moment there's only a single subclass.
> 
> Following commits will add the CPUs and the peripherals.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |   3 +-
>   configs/devices/arm-softmmu/default.mak |   1 +
>   hw/arm/mps3r.c                          | 239 ++++++++++++++++++++++++
>   hw/arm/Kconfig                          |   5 +
>   hw/arm/meson.build                      |   1 +
>   5 files changed, 248 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/mps3r.c


> +/*
> + * The MPS3 DDR is 3GiB, but on a 32-bit host QEMU doesn't permit
> + * emulation of that much guest RAM, so artificially make it smaller.
> + */
> +#if HOST_LONG_BITS == 32
> +#define MPS3_DDR_SIZE (1 * GiB)
> +#else
> +#define MPS3_DDR_SIZE (3 * GiB)
> +#endif

Generically, can we migrate a VM started on a 32-bit host to a 64-bit
one?

> +static void mps3r_set_default_ram_info(MPS3RMachineClass *mmc)
> +{
> +    /*
> +     * Set mc->default_ram_size and default_ram_id from the
> +     * information in mmc->raminfo.
> +     */
> +    MachineClass *mc = MACHINE_CLASS(mmc);
> +    const RAMInfo *p;
> +
> +    for (p = mmc->raminfo; p->name; p++) {
> +        if (p->mrindex < 0) {
> +            /* Found the entry for "system memory" */
> +            mc->default_ram_size = p->size;
> +            mc->default_ram_id = p->name;

Nice.

> +            return;
> +        }
> +    }
> +    g_assert_not_reached();
> +}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

