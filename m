Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2446880ejb;
        Tue, 30 May 2023 14:15:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6iaEPWS3mCjMuUfN7Vn5iTfrNQglCthxR40YbH78X7F5p/R8tLGUdhtpfPDYUe4gYldOnU
X-Received: by 2002:a05:6214:767:b0:624:3af6:21d2 with SMTP id f7-20020a056214076700b006243af621d2mr3698244qvz.13.1685481324758;
        Tue, 30 May 2023 14:15:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685481324; cv=none;
        d=google.com; s=arc-20160816;
        b=RS/ivCTA9rfGn6UDJU+o9tLSOT14luLgqHV3RT+w+AmWaE2UX2iEV3kjFVcIzOPzn2
         DyqQvmxts6Gj0h0Y74I3ByNmVPVLts2f3C6kHrNY+Aa0nsZaZyidhY7K0kJgb9vQVfjc
         plLkStQPxQkzljITZTUBmpLlG6TKvjN0OZjAXzyFRtVIvMldL/RI8Mc2S6cqqRaXkSeH
         XT/8PG7C7HUEnXHSSoUeDIJJ+gcvbk57OMUP00dynfIRYpqM3a5jPo/U+f5YdnGpIX8+
         RtrSJ1YFgs2uTxsZZcj63RwIQKc9mUMomnmtMJ2tzrL1Ouy5Ntzf572tXzjMSii/o/j5
         YG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gtRVJyUXzFxG1pACXeD3+Nrg2XKdLcVr2u1f15JHk4Y=;
        b=jtbfdS01r2kvlnWtQkZt6zOyrqt2rzekHruwoRlheSgO1+uAtvhtFGrgBkOvE7Xo8x
         e/ObVVOZJ62c04zbLsmW1LtM0ptjo12VXsfihKx17OH/eVDzkibHFTF9nQGS8cxPb9p/
         88E4FsqjsKPW7gcutx/zW7PAIRtm7t1bRXUvtNdJ/W1Fci5AT27517XdnjGREaSuyxPo
         Vgbq8xgN/kOTBOQZD9JODFVqapzOaUOntuhJ+Pyb8DOcZ8rLTmKR1Wygmc2t1j+2Ccqy
         ClNlC16UuSlrU+9fYLDK3yhMrcwGT+leb3wvS0eERX7TlBNVL4uH+xOZFeBVduFEOmFb
         VBYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dv5N46gt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw5-20020a0562140f0500b0062106dae71esi6881848qvb.339.2023.05.30.14.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 14:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dv5N46gt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q46gQ-0005H0-7s; Tue, 30 May 2023 17:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46gN-0005GY-TW
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:15:08 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q46gB-0004HR-3t
 for qemu-arm@nongnu.org; Tue, 30 May 2023 17:15:07 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-30ae967ef74so2173692f8f.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 14:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685481293; x=1688073293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gtRVJyUXzFxG1pACXeD3+Nrg2XKdLcVr2u1f15JHk4Y=;
 b=dv5N46gtqMU3slWQFLK9hu9J2bhufFdvnuCEM6LxyLHKL8N1rJIvbd6MMfWV/Jv6PS
 sqbeMjSOtKmxGi72lYWlDvisHn8KjKzRcF1KaasNMM+RRKaHfilpRuacUhcUigySeFeU
 +kyoBpudTc61tYdz2GwuU4PocMrpoglOlU9JCDtgR2GgcPgCMZIuLsd2/ZKhwZQGjmW2
 AgCtGqcjMHK6jYvZWq0CcUzB+qAtRp+bnwdxfHSvLTNVOc17015mHpwKQjptI0LMBijk
 DGAg45nchhPEOVQwiqGdJ/xhxStABSXLzARerjfnx4YDSFfJkvg7pVzrnVBr0yUhu5dP
 1tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685481293; x=1688073293;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gtRVJyUXzFxG1pACXeD3+Nrg2XKdLcVr2u1f15JHk4Y=;
 b=NTp9pnMEgnC2dWrBNBN7E/hwrI3meHuZQUh3EHg5f+o2qiQEcOSqAAYK3I5EYGizKF
 ndj4vhmBdJmv/Qk9nUGmjmx9uFnIIsBb2YWPgWz+s6+dZmMGfYUaMJPxop2XE1HLzJsz
 cLNwSKSJuSgz7Xs/Y9b1TVb2vnM+JozAlAj233cIQBVZ1we4SNvsBicLu2CDOeDAAIUL
 mN7Qu/AXcHKqlM6ub8j78gi034cLquPhMPW80xIh0vSQQvv1JJFOUIhRj0fNN1xPX4fx
 hZk8ay+pibd26IkvfoS/LN2T/CM3xvyvAoxE3f1taBkQdZBrRJlZmwo0ewvXXnTqYMpc
 XHRw==
X-Gm-Message-State: AC+VfDz+1glb+bib/9xW5gi4OerzANlmgSucBeUmzuHsQRUTS9/MscoF
 GlP4jh3+HT8PiNPAdWNm9+7gyZIGcKQJcFXF1zhKTQ==
X-Received: by 2002:adf:f292:0:b0:306:3b39:9a3d with SMTP id
 k18-20020adff292000000b003063b399a3dmr2825475wro.15.1685481293174; 
 Tue, 30 May 2023 14:14:53 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adffb11000000b0030633152664sm4382421wrr.87.2023.05.30.14.14.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 14:14:52 -0700 (PDT)
Message-ID: <5587a39e-1c17-2997-f679-d43a023149c6@linaro.org>
Date: Tue, 30 May 2023 23:14:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 09/12] m25p80: Introduce an helper to retrieve the
 BlockBackend of a device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-10-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508075859.3326566-10-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: NAoorLkQ3ip3

On 8/5/23 09:58, Cédric Le Goater wrote:
> It will help in getting rid of some drive_get(IF_MTD) calls by
> retrieving the BlockBackend directly from the m25p80 device.
> 
> Cc: Alistair Francis <alistair@alistair23.me>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/block/flash.h | 4 ++++
>   hw/block/m25p80.c        | 6 ++++++
>   2 files changed, 10 insertions(+)
> 
> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
> index 7198953702..de93756cbe 100644
> --- a/include/hw/block/flash.h
> +++ b/include/hw/block/flash.h
> @@ -76,4 +76,8 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
>   void ecc_reset(ECCState *s);
>   extern const VMStateDescription vmstate_ecc_state;
>   
> +/* m25p80.c */
> +
> +BlockBackend *m25p80_get_blk(DeviceState *dev);

- Option 1, declare QOM typedef and use proper type:

   #define TYPE_M25P80 "m25p80-generic"
   OBJECT_DECLARE_TYPE(Flash, M25P80Class, M25P80)

   BlockBackend *m25p80_get_blk(Flash *dev);

- Option 2, preliminary patch renaming 'Flash' type to
'M25P80' then option 1 again

- Option 3: no change.

With the QOM style we try to enforce, I'd go for #2.

Still,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   #endif
> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> index dc5ffbc4ff..afc3fdf4d6 100644
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -25,6 +25,7 @@
>   #include "qemu/units.h"
>   #include "sysemu/block-backend.h"
>   #include "hw/block/block.h"
> +#include "hw/block/flash.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/qdev-properties-system.h"
>   #include "hw/ssi/ssi.h"
> @@ -1830,3 +1831,8 @@ static void m25p80_register_types(void)
>   }
>   
>   type_init(m25p80_register_types)
> +
> +BlockBackend *m25p80_get_blk(DeviceState *dev)
> +{
> +    return M25P80(dev)->blk;
> +}

