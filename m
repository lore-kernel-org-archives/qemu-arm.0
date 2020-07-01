Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp202345lfm;
        Wed, 1 Jul 2020 00:24:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHgI81jQcZepfFQEqQbfZBJqcW0DWPcMmPGO3SolC53JFjjwzCabpCd00zyG0ekSs83F3e
X-Received: by 2002:a25:af93:: with SMTP id g19mr43987368ybh.109.1593588282575;
        Wed, 01 Jul 2020 00:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593588282; cv=none;
        d=google.com; s=arc-20160816;
        b=NBb/asOHwGJjsk6Io2a0gX8u2Nb6C5Q179zR04g5egO6Trx9grAx0TnL5ZgT4WJJR4
         H01C1wmDUNnvhTTZy0OAvFiSAREy7wA0xqecoA4SHDQ1xp49W4b6CwdgVNKxmg2dQBcw
         PGos6o01Jy5ejtJ7X2rKw13du3dweywNjdS6xmmn+QJlAhgfPMmwg7hoBDVaAue/R/Ep
         h1gD0u9N5YcCYbFF+0rKD2ZD0I9d06rRD25SO9Hcmde6darzsx6Dd7rTqiCzOzNHkZLm
         ad1lxhxvaZFxOueKiA3P4JCxX5+MrYpuZUUldxdvXMgBb571tbkkSCumBnjKAptubGAH
         N5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Fc27ecj4wFvNWGxNWTtSOqkPM1LpRGm0EPEbU+wgQCQ=;
        b=f84XLzgq5IjYjtpQhhCME9ChRlWVQBH8ZhWRBiFCwZ4k4nna/Gy6HRhJjDKVQTpFAX
         4VgNeBdaD+NQYNi20J08RH4HFLq2YBfYQHarTJhOpvjWwgjO7D78mga/lWs65x3cGC9R
         ho4SJVtQNgGNllbgbtp3qv3cxTLfr+ImVB82DCNBD5itrX3yE/NfYWvfsETXzsFufhu2
         4CKp1HR+H6imEoa4rxQFwTnhEvFGNefQoMxuM6IFRDBfyNybja/eiK420QpdRX5+rb/R
         XFwdfO1jWUyjrHyLqF6Vb7129wKY1kGTcyoY/r5y+U5lcbB98RF/8NTA+BRolIAShZCG
         xtbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jTw+4OZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 132si5173123yba.45.2020.07.01.00.24.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jul 2020 00:24:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jTw+4OZt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jqX6n-00047X-VN
	for alex.bennee@linaro.org; Wed, 01 Jul 2020 03:24:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqX6d-00047H-C1; Wed, 01 Jul 2020 03:24:31 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jqX6b-0001iC-Q5; Wed, 01 Jul 2020 03:24:31 -0400
Received: by mail-wm1-x342.google.com with SMTP id f139so22085539wmf.5;
 Wed, 01 Jul 2020 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fc27ecj4wFvNWGxNWTtSOqkPM1LpRGm0EPEbU+wgQCQ=;
 b=jTw+4OZtzI6euG0iEVRH94bvZJp8IHt+1vz8QUO+0ZnVU/mPafJTwSiv8HAVr4be19
 2xCc7o8yW6It95T3PicGMitSsNyjDAPBWktVFRUKqKNWOyrVqSn9De/jDNh6G0q/yT0A
 TZk9XoHRyDBfOL7ehEDfgVGegcYrwk4+7+l1UwIL0YZgkMJQzof/GeZAc5WircBLH9wO
 sAZxVX/PVL5349i2Q7Kbspby3FJmU9+mSBqlw2jjsbb5Kn80u3YNF7MnfU94DZnbj0sf
 pdxfdcsfiEaqcD/KCq1KcZA8pi3sEnXDGW9wTy9Hhjw60md+uUQbooWbXePE4a6uR3YB
 rjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fc27ecj4wFvNWGxNWTtSOqkPM1LpRGm0EPEbU+wgQCQ=;
 b=CYv1e5+zXYD+45FQUNIBiuyLOkGgvhuc/Vk9xV9872KkOkE+UDlySJMTjAC+XN9p25
 R79jW9TFHNEyc71eMNtFrZdyr/PNjsYeCb/GZIY4pvEVQJBuTCoeA4NslzDm+SfQGdlG
 ZfcSf3DPkGEc1aVnny/cE+D3ILCafhVd+NlC1KVXawdG+gMzayIhBpYvPBxLsG7rFP31
 MtP3NN/FoQcxwkFqSKWYHYvE6XRmHMnL9md+BbuES5/XMMXkgMZkYWu0qkZ7SognQ3SC
 CcxS4pLR6qPYCn5bsclwFEaRPZ3p2kJQ0hXViBsgI8RbzWTO1bRqzZnZXkuiQnhVZH2i
 +TkA==
X-Gm-Message-State: AOAM532IqMnsmOE3JvpgDCRKEaGwgERrvjTvmv0UoNNC+eHi9IFqtArs
 Lq381B1D4sl7VUx9jOf1bjOxKX2t4uQ=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr26453139wmj.39.1593588267758; 
 Wed, 01 Jul 2020 00:24:27 -0700 (PDT)
Received: from [192.168.1.40] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id g16sm6877629wrh.91.2020.07.01.00.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 00:24:26 -0700 (PDT)
Subject: Re: [PATCH 1/2] hw/arm/tosa.c: Detabify
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200628203748.14250-1-peter.maydell@linaro.org>
 <20200628203748.14250-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <85f66e82-8d71-1070-2a54-6567c394ed94@amsat.org>
Date: Wed, 1 Jul 2020 09:24:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200628203748.14250-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gZLk+XvE87dg

On 6/28/20 10:37 PM, Peter Maydell wrote:
> Remove the hardcoded tabs from hw/arm/tosa.c. There aren't
> many, but since they're all in constant #defines they're not
> going to go away with our usual "only when we touch a function"
> policy on reformatting.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

No change using 'git-diff -w'.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/tosa.c | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index 5dee2d76c61..06ecf1e7824 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -26,32 +26,32 @@
>  #include "hw/sysbus.h"
>  #include "exec/address-spaces.h"
>  
> -#define TOSA_RAM    0x04000000
> -#define TOSA_ROM	0x00800000
> +#define TOSA_RAM 0x04000000
> +#define TOSA_ROM 0x00800000
>  
> -#define TOSA_GPIO_USB_IN		(5)
> -#define TOSA_GPIO_nSD_DETECT	(9)
> -#define TOSA_GPIO_ON_RESET		(19)
> -#define TOSA_GPIO_CF_IRQ		(21)	/* CF slot0 Ready */
> -#define TOSA_GPIO_CF_CD			(13)
> -#define TOSA_GPIO_TC6393XB_INT  (15)
> -#define TOSA_GPIO_JC_CF_IRQ		(36)	/* CF slot1 Ready */
> +#define TOSA_GPIO_USB_IN                (5)
> +#define TOSA_GPIO_nSD_DETECT            (9)
> +#define TOSA_GPIO_ON_RESET              (19)
> +#define TOSA_GPIO_CF_IRQ                (21)    /* CF slot0 Ready */
> +#define TOSA_GPIO_CF_CD                 (13)
> +#define TOSA_GPIO_TC6393XB_INT          (15)
> +#define TOSA_GPIO_JC_CF_IRQ             (36)    /* CF slot1 Ready */
>  
> -#define TOSA_SCOOP_GPIO_BASE	1
> -#define TOSA_GPIO_IR_POWERDWN	(TOSA_SCOOP_GPIO_BASE + 2)
> -#define TOSA_GPIO_SD_WP			(TOSA_SCOOP_GPIO_BASE + 3)
> -#define TOSA_GPIO_PWR_ON		(TOSA_SCOOP_GPIO_BASE + 4)
> +#define TOSA_SCOOP_GPIO_BASE            1
> +#define TOSA_GPIO_IR_POWERDWN           (TOSA_SCOOP_GPIO_BASE + 2)
> +#define TOSA_GPIO_SD_WP                 (TOSA_SCOOP_GPIO_BASE + 3)
> +#define TOSA_GPIO_PWR_ON                (TOSA_SCOOP_GPIO_BASE + 4)
>  
> -#define TOSA_SCOOP_JC_GPIO_BASE		1
> -#define TOSA_GPIO_BT_LED		(TOSA_SCOOP_JC_GPIO_BASE + 0)
> -#define TOSA_GPIO_NOTE_LED		(TOSA_SCOOP_JC_GPIO_BASE + 1)
> -#define TOSA_GPIO_CHRG_ERR_LED		(TOSA_SCOOP_JC_GPIO_BASE + 2)
> -#define TOSA_GPIO_TC6393XB_L3V_ON	(TOSA_SCOOP_JC_GPIO_BASE + 5)
> -#define TOSA_GPIO_WLAN_LED		(TOSA_SCOOP_JC_GPIO_BASE + 7)
> +#define TOSA_SCOOP_JC_GPIO_BASE         1
> +#define TOSA_GPIO_BT_LED                (TOSA_SCOOP_JC_GPIO_BASE + 0)
> +#define TOSA_GPIO_NOTE_LED              (TOSA_SCOOP_JC_GPIO_BASE + 1)
> +#define TOSA_GPIO_CHRG_ERR_LED          (TOSA_SCOOP_JC_GPIO_BASE + 2)
> +#define TOSA_GPIO_TC6393XB_L3V_ON       (TOSA_SCOOP_JC_GPIO_BASE + 5)
> +#define TOSA_GPIO_WLAN_LED              (TOSA_SCOOP_JC_GPIO_BASE + 7)
>  
> -#define	DAC_BASE	0x4e
> -#define DAC_CH1		0
> -#define DAC_CH2		1
> +#define DAC_BASE 0x4e
> +#define DAC_CH1 0
> +#define DAC_CH2 1
>  
>  static void tosa_microdrive_attach(PXA2xxState *cpu)
>  {
> 

