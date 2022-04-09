Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp600374lfq;
        Sat, 9 Apr 2022 11:33:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMko4U3LYiZq/0A9Jh9dNIVs5KTk0kCys/2NVgHVRgmtMYVv442XL0AbSLWeKNiMBOWecA
X-Received: by 2002:ad4:5f0f:0:b0:441:1e3a:dbf with SMTP id fo15-20020ad45f0f000000b004411e3a0dbfmr21273248qvb.79.1649529188243;
        Sat, 09 Apr 2022 11:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649529188; cv=none;
        d=google.com; s=arc-20160816;
        b=MVlEIvr8qchIYcgp+WoefBPJRylwtfDBspwJ2QiujzctCdlCTlDcJaB17hgjQX++xo
         +wMezCxCibHE2ELaUcEzODyEIn3+DPdCvIRj3NI4QS2Uh4ljZD7+UuyPUDx2eJ4Yz+aD
         Gk9OZFb3FjCIlEqnf+6U3S/H8mTa4tkBqPfS7XSiMtKZdnmv/ph+02sAFFV88oT/yct0
         mIXUWrhD6vf/wDhvx1pdUSeEIKJO76B3eNFaks91bR41UGLTdAQCH7hfCcJxe//w2NRV
         liO8g16A1TiZXX0MBboipolRuxmrG/1PI1g8mbNT0UHFcgPAdln7Sjpx5TxmPf+U3pVl
         30ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=H3suunJE8tcHW09MCkmwcOH3KSLo6hnP/ifEIDcKV+Q=;
        b=Qnosgdh0hvOe20i/qpc837vbq+tvyY0NWbi91CBEn9PDxNTOftqEFThT2pmsu0x9ix
         MkAgq2Ebdnlchmq7gVrcwEyKRBRXb2PQF/sMzwzlUflGsmxKLYbfgkXjb+CHjV8lJRh1
         ooOv5f/uCQKttZnwpdBTPd3oFPQj4WNkZfb7XFA/cj4/vAGXVkKgf34ABWeazSFvC2Do
         d82fvDGsMKlYJ4BVxTeT/a9yB4IImLU5gP0URYO6kkLMA97kvYCk5ZZmv0k8qngqJ3+x
         ZEdc3yvD73l60ecJxgOziHDCL6Bh1U75wXFz9vofTzyVApN8rxx8hlMJsG0jDIjDqWWh
         94OA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUu5XmCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18-20020a05620a249200b0069c0eed80edsi281537qkn.359.2022.04.09.11.33.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 11:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zUu5XmCv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndFtT-0004vF-P3
	for alex.bennee@linaro.org; Sat, 09 Apr 2022 14:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFtL-0004uz-R0
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:32:59 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:52189)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFtK-0002PL-9F
 for qemu-arm@nongnu.org; Sat, 09 Apr 2022 14:32:59 -0400
Received: by mail-pj1-x102a.google.com with SMTP id fu5so11516145pjb.1
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 11:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H3suunJE8tcHW09MCkmwcOH3KSLo6hnP/ifEIDcKV+Q=;
 b=zUu5XmCvD46oFj8PdIl8iLL7BlhY0kqySVSn8s8akLKKtqIaJvsazRl1+ovD8bnsmx
 AUazDkpDRJsqbfy003rFZfZSpDl2e08e/p7X9yO4E/3OpRoBa7+/RxxZwiewXPdo+j6t
 rC7A+Uj5ye+HE3Bnd3ibrpC/2zNgaOr523jW1UkojPi/+wfeA/snJ6IPGkCykVQGnkR5
 lV1LWWGp/7MpshohJOxoPrIfIFPDEy+Kj2mYnovbawK++cLg940JBSJK3vX0FjWYLGIg
 E/sOCM4WMyuXwoWVgjwl37rFbHuxngZ5YHhpVocG0cT7q4wkyrK6FToDkb0mwG/uuTO+
 PnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H3suunJE8tcHW09MCkmwcOH3KSLo6hnP/ifEIDcKV+Q=;
 b=Q5XKo18H08UxPYinRVanFYsIK/Sl9IBLV+AmyL/L6Ugw6CnfKu9xVruOWKk4+YB85L
 +Vk2Z6XSIpcdyVnE0cdjUPiyzXPpVJFgQCqafRsFLk1yN9d7167Erg0HpCJchUx/FWdM
 q0At4agQMNxnsIcGKm2/AqndfBa67m2jwtryWNRVRZG5UDDF9od2QDaJe73XdOKqRD3Y
 0p3QfMVvJ7o5f4GnWs6451T+nksnAb705Kqn0/wwUjH8nYVDjRpooL3rVb5YLi9/npSO
 OGZvx5XzSqEKyPF9Tg8r/AWE404FCkKQBZbvPvXOHUE6iM49jmPsIVAs6G7IZGkE8hfT
 IKcg==
X-Gm-Message-State: AOAM532LQmpKLXXT7S7a2HsWp52rrUPxUmq9SAIdRUz4wesU/xp/UQ84
 2VvX4MX5uE6a9rvDjkdKkmt4rA==
X-Received: by 2002:a17:902:7d86:b0:156:434a:a901 with SMTP id
 a6-20020a1709027d8600b00156434aa901mr25604113plm.77.1649529176427; 
 Sat, 09 Apr 2022 11:32:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm30309741pfh.83.2022.04.09.11.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:32:56 -0700 (PDT)
Message-ID: <05bad303-e4d7-c776-5105-6b74a559fc38@linaro.org>
Date: Sat, 9 Apr 2022 11:32:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 22/41] hw/intc/arm_gicv3: Implement GICv4's new
 redistributor frame
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nle/g9TZGRKz

On 4/8/22 07:15, Peter Maydell wrote:
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 7c75dd6f072..9f1fe09a78e 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -442,8 +442,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
>        * in the memory map); if so then the GIC has multiple MemoryRegions
>        * for the redistributors.
>        */
> -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> -    offset %= GICV3_REDIST_SIZE;
> +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> +    offset %= gicv3_redist_size(s);
>   
>       cs = &s->cpu[cpuidx];
>   
> @@ -501,8 +501,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>        * in the memory map); if so then the GIC has multiple MemoryRegions
>        * for the redistributors.
>        */
> -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> -    offset %= GICV3_REDIST_SIZE;
> +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> +    offset %= gicv3_redist_size(s);

In these two cases, it would be better to call the function only once.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

