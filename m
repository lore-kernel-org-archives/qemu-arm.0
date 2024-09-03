Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1581326njf;
        Tue, 3 Sep 2024 13:33:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWk4GG5+AyzBevaDePsSFU4bwAc1kHrKdQMmdmf8v8tJ2Q9LY4BdCGCr4SQTFSawjK3jbEH3O+OBzgUcA==@linaro.org
X-Google-Smtp-Source: AGHT+IHBozTSyCdcDWXGxP5L2CEsV39bbiVCfkDFPdBKdYrBxV7d95BUm1qaXxGh55Xmigdx8ZRA
X-Received: by 2002:a05:6214:43c3:b0:6c3:67d5:aa3 with SMTP id 6a1803df08f44-6c367d50eabmr88561056d6.53.1725395628479;
        Tue, 03 Sep 2024 13:33:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725395628; cv=none;
        d=google.com; s=arc-20160816;
        b=uhIZF2y6ArsTcVJxyutfIsAVfbHoM5o1LWMqoivEf1+r6mM5k4+g2Dzh4wnM3z/yFJ
         yxr0e/9j7bxmLBeQ9E7PURQRtmnv2Hiwr91ybyR7A3zpbw/9TJGyfJpY0D/bOBJCb+HV
         mtit2WU5zk/xTM7uDpFubPy5IeRrfEdcKiVz2PEelp5T+TZbgI8DihnabVyCTLbnGuXg
         uwFeWqP0xv/ZFYl8hLUj/qrAtxXfppL0D8zij74qsXfhWPteXxCxm3RAy1vrM7G8bPI7
         oRDTEHckbGpe5f7/0YjKi/tfjuYriFYhq12V2pwE/ArRG4ofLMaXm7VOzhcYjCEjk7dx
         /Y5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Ca9lXDEfNJ38bmK48yAITPRV01n3jZp6CajOfc0GnMo=;
        fh=GnlcUb6wrtDJ7TACZOvxq/lJDt214Wz+TSWN+BpUrHU=;
        b=m8yYbNUuuhWpwjt/0zKvRZnMoM5qkGYnLruEMEl8LAMBYme304yiRNxnJ7hAipOT77
         mWymyZaKm5SanAMbVyv/1upuaoYi5sjAn6MGO3JPliEj8GqlgQu1bCNvnTrMSwK4gBTd
         Mi6z1lL8MMKXOgyNJK1xrbzgFCtoNyqKvkp9y+bzvqTAnGxI9QsqvqemcklJuvE2iVs9
         VLDrkaxxsuO7Fuy3/u7ZchlH3wu6dN1m5WFH2KrvN1kP79BgcX9RTAHCrtkR5sPbv5Q6
         ZONcI7fzZvObk61s2Lt4C6/wi52CsF5BlD+AOR/hEVj7qXLisY7/Yet4f76m9QtiJqur
         ItaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sXc3qPIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340c89fbcsi131644386d6.233.2024.09.03.13.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 13:33:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sXc3qPIW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slaDi-0003Ds-0J; Tue, 03 Sep 2024 16:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slaDY-0002aZ-UU
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 16:33:38 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slaDW-0006R8-Ny
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 16:33:36 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42bb7298bdeso64788255e9.1
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725395609; x=1726000409; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ca9lXDEfNJ38bmK48yAITPRV01n3jZp6CajOfc0GnMo=;
 b=sXc3qPIW48CB5EnoPoPFh2HLec3KNVygj+gscaBG1t4ZFFqB6w/erVoVPBNFYU4V3V
 uuTCWUcIBfGQ32E9Sf+QSCq5Tfw3pgqRPpIkO8EvH73sgVaPCaNQiJ3xq6cQfdeik18k
 XHXXCfn0dgGNOOwvEgcEqaVSuuU/FhrSTSm+J1L7fTlbGyhtSiMAkC/aeJudpJBg8hM8
 83MLnbzkhSSW2lGHuri2oFsaFpz+plXOUiKaqkkz6MtL0bUwkdKoKh7UmiPK6fbimHZK
 qaMdN5Ui8rv5xCHKJ+LaUVRH0hXGphwSFlu7+kZV5tyOGhzbG0+Wnkj0LSGb4P2sMcPa
 cjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725395609; x=1726000409;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ca9lXDEfNJ38bmK48yAITPRV01n3jZp6CajOfc0GnMo=;
 b=E8zAgIq6eb9kvtomBoLcZqZ7u1gHLkHhULp9cZ9Zh+I/PK5FF4pOD82DmFBxGK9Br5
 yQ0olkuCn8Pj2UJ/cTkTB+YaNYtThm1EK+suU1/fRqDW1AL0sBd/cGySplt52msKhhFd
 0oZ9E5D9QdQT0FMAaBrY/l61QQVO5+HNpsChPAdhwQfbx8+r1f+8JdC1O+H56k5zQmGY
 M6gta0ThEafA6YQlG0Y6Gi/nU/fYTFiqltnZ/hhdBubyITggxD7DMNqw8LixKIpkcwCl
 EB/AoYwiQKB+jEv7JPq0YaCAftm2vqongQiI+/sVsbnmr1FqNeijbqD4rJCycLsfAA8Y
 RRNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFknKrO7sHRuQvOmrvW8FqoGPQvXXUo75TYRImMKL+jK7bUpBdEXAusNgHshwPSaS90a/zlC/+FQ==@nongnu.org
X-Gm-Message-State: AOJu0Yxm1J3EdRnidIPcBWhePlFEXaqASd0xHMkLM27qU85l8zGHaFeA
 2XHw4Llkybx9VoxVki9OXS3d1nQQdda+zR8sahMQkZwJIvI36Zu7KuBLFxs9FBxp+c6nGfz4eAl
 e
X-Received: by 2002:a05:600c:4695:b0:426:6e9a:7a1e with SMTP id
 5b1f17b1804b1-42bb020d194mr163456165e9.35.1725395609173; 
 Tue, 03 Sep 2024 13:33:29 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df79b6sm180851965e9.22.2024.09.03.13.33.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 13:33:28 -0700 (PDT)
Message-ID: <f7690a1e-84ab-410f-953a-e719ffd0e4fb@linaro.org>
Date: Tue, 3 Sep 2024 22:33:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 41/53] hw/sd: Remove omap2_mmc device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-42-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-42-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SIkPxvL5DHBJ

On 3/9/24 18:07, Peter Maydell wrote:
> Remove the OMAP2 specific code from omap_mmc.c.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |  5 ----
>   hw/sd/omap_mmc.c      | 63 -------------------------------------------
>   2 files changed, 68 deletions(-)


> -struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
> -                BlockBackend *blk, qemu_irq irq, qemu_irq dma[],
> -                omap_clk fclk, omap_clk iclk)
> -{
> -    struct omap_mmc_s *s = g_new0(struct omap_mmc_s, 1);
> -
> -    s->irq = irq;
> -    s->dma = dma;
> -    s->clk = fclk;
> -    s->lines = 4;
> -    s->rev = 2;
> -
> -    memory_region_init_io(&s->iomem, NULL, &omap_mmc_ops, s, "omap.mmc",
> -                          omap_l4_region_size(ta, 0));
> -    omap_l4_attach(ta, 0, &s->iomem);
> -
> -    /* Instantiate the storage */
> -    s->card = sd_init(blk, false);
> -    if (s->card == NULL) {
> -        exit(1);
> -    }
> -
> -    s->cdet = qemu_allocate_irq(omap_mmc_cover_cb, s, 0);
> -    sd_set_cb(s->card, NULL, s->cdet);
> -
> -    omap_mmc_reset(s);
> -
> -    return s;
> -}
> -
> -void omap_mmc_handlers(struct omap_mmc_s *s, qemu_irq ro, qemu_irq cover)
> -{
> -    if (s->cdet) {
> -        sd_set_cb(s->card, ro, s->cdet);
> -        s->coverswitch = cover;
> -        qemu_set_irq(cover, s->cdet_state);
> -    } else
> -        sd_set_cb(s->card, ro, cover);
> -}
> -
> -void omap_mmc_enable(struct omap_mmc_s *s, int enable)
> -{
> -    sd_enable(s->card, enable);
> -}

Yeah, few less legacy users \o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

