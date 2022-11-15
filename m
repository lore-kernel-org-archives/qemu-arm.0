Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3762102ejx;
        Tue, 15 Nov 2022 08:29:13 -0800 (PST)
X-Received: by 2002:a05:6402:284:b0:467:481f:df2a with SMTP id l4-20020a056402028400b00467481fdf2amr15104834edv.324.1668529752941;
        Tue, 15 Nov 2022 08:29:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668529752; cv=none;
        d=google.com; s=arc-20160816;
        b=hnT5dP47S+8V3Mm0FjklS8HSjIdnm4mTrmQKEeloPYdfIXGLmtyAlmhwjgHtLTUAw1
         q1Rj/CyqfgLEKKiZVq32DBzQQK3sDAFvlm2tiwIomGaOTLKN2zUQ3NdhdnCWHZ/Uqypu
         XDY/XX3JorM8I74/JRDRSOXzbMQ0HApr3ZOEZ7rr4c9ZmDdvl9pz2TgVgzkwUs58g2b4
         uZIIezdasGoqJZK7YIbgpKdZMkjGDxsM7CWEo0fcbaJIqT9pWz+x3AAerZVIfTSVq/08
         BXthrvxBD/RKtcxmIwkx8YX+sCnUF5cnuFKCRJo5DA79i9Uo4j/aKT5DOoIAvlOGOE/q
         fniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MKL3A5WWwBVEhqir2rijShdxdWvx2zhjv421ik5RtUM=;
        b=aSmUvg1rSrkub8iHIobALwgCVZwAEXBsKmVl5QsCDQLsMxBZm8Eo5yiOKiwadm96M3
         BKEk0n5OwCu9+/GtQQTFSljLx0HCD5OAaMYRljFWbKzdiH4ctANDsngtRCFltma5PL/J
         hGuZklkrovQM31XamrlgkzfsKOKJUkAYwcpPUP9AjkvcUGxclMOhI8G+rfeAfU0TmMJg
         FtDkbNX8fh2mY5Y+OMGbrjWRhjdBxn62DJgWLSss5d4HTlO0S3tEOeRd1wMp6RaTUFLA
         OxlUzouLw+Qvl9L0IFFElFq2FRdlbLq/PhhI0OutbI0IU5o3YocfZ2TpOVxUeqrJgcAm
         JRPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Hxq2xX/M";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i15-20020a50d74f000000b0046185b07831sor3095213edj.58.2022.11.15.08.29.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Nov 2022 08:29:12 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Hxq2xX/M";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKL3A5WWwBVEhqir2rijShdxdWvx2zhjv421ik5RtUM=;
        b=Hxq2xX/MlLrNE4iMwA2StkrnsVLuThl+Z7oqIdnMm9yGVygynvqAIu0aaqWI2bWCyP
         IfCl8GSJmPgGdW2tcI8jJr2g+IZa6LYFwZWxASVExhuaoMVp6NptewKbWpUnvzJqBZ6t
         LQzVuuF0nOR1q7Cc2g2yUcRTzQZBgjfiiVHCHNFWAqw+Kat6g+MUBGsKaG8DUfLBd3Jd
         Plxv8B1ODbu/ovv67qeAst8sEXJv4erB5QzR0qxYxVnsUSUAO/rQzTEctJkrsjQ+fR7t
         r5W2PVkqCwXpFZNBBTyJooA/0fzifW/AyCZWIH4dK69B45vCtAFhh1qdMdq3vKCWCH/j
         4Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKL3A5WWwBVEhqir2rijShdxdWvx2zhjv421ik5RtUM=;
        b=aPQAbelo/EOSLKHMFOjN4r7bhpakQkw6EBlyfRAFZVHrMRHBu4sRZn18kg/53q0vih
         O40lEo2cA41zORs+cLy//MkFLUTspd3pWid+/uVKovF2/tBd0Ln7svaGfMSsowsfnvBB
         9J1xFBG8S2pCrxR5KeP326zv84gGD+WdIEDOEve3Yi8Vj10gl+K1nWY/v15b4NmhvncX
         w0GKJceqeFayY8oeEJ/H3L+4p0CRdgj7WdWzoG8SyJiWLirPXTHwmnBP0RXeif1CCns1
         Wr11z/OunEzD0Bn8agLVsWdSduXvBhcSmecN8jyNeGPl9oi0QShqqxkaBBtmp1t511kl
         VjDg==
X-Gm-Message-State: ANoB5pmk8KggSW5v/C5ESpRbD/LxDLR8YRIhGPuIWpbu34N0MxpbNpNg
	YgDC+Wyp+lzjFJn6WmkrJyvAQEmFhYjBtpVo
X-Google-Smtp-Source: AA0mqf5l3PgmU/vgOwiOvYtESKDlz9hoD9KPPSAQllImcSXWob0zhVuyKmGOIkHWTbJM0FFs4kfm+A==
X-Received: by 2002:aa7:d798:0:b0:458:ed79:ed5 with SMTP id s24-20020aa7d798000000b00458ed790ed5mr15708209edq.374.1668529752508;
        Tue, 15 Nov 2022 08:29:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b0079800b81709sm5655788ejo.219.2022.11.15.08.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 08:29:11 -0800 (PST)
Message-ID: <8900f3f8-0993-b479-8080-0276d20b0c4b@linaro.org>
Date: Tue, 15 Nov 2022 17:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/2] hw/intc: add implementation of GICD_IIDR to Arm
 GIC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20221115161736.2425584-1-alex.bennee@linaro.org>
 <20221115161736.2425584-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221115161736.2425584-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IIWcPswKENKT

On 15/11/22 17:17, Alex Bennée wrote:
> a66a24585f (hw/intc/arm_gic: Implement read of GICC_IIDR) implemented
> this for the CPU interface register. The fact we don't implement it
> shows up when running Xen with -d guest_error which is definitely
> wrong because the guest is perfectly entitled to read it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - checkpatch fixes.
> v3
>    - re-base on re-flow with if
> v4
>    - fix the commit message
> ---
>   hw/intc/arm_gic.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 1a04144c38..7a34bc0998 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -973,8 +973,18 @@ static uint8_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>               /* GICD_TYPER byte 1 */
>               return (s->security_extn << 2);
>           }
> -        if (offset < 0x08)
> +        if (offset == 8) {
> +            /* GICD_IIDR byte 0 */
> +            return 0x3b; /* Arm JEP106 identity */
> +        }
> +        if (offset == 9) {
> +            /* GICD_IIDR byte 1 */
> +            return 0x04; /* Arm JEP106 identity */

Possible future cleanup, define JEP106_ID_ARM:

$ git grep 0x43b
hw/intc/arm_gic.c:1671:            *data = (s->revision << 16) | 0x43b;
hw/intc/gicv3_internal.h:743:    return 0x43b;
hw/misc/armv7m_ras.c:26:        *data = 0x43b;

> +        }
> +        if (offset < 0x0c) {
> +            /* All other bytes in this range are RAZ */
>               return 0;
> +        }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
