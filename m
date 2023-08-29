Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3807974ejc;
        Tue, 29 Aug 2023 10:08:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw1k1TVYuVTaBoxLIKcbiCQGi9UyOvhtOvfGCX/D/dyhPHq0IorecLCo9Yf39Y1rdGlQM5
X-Received: by 2002:a05:620a:414e:b0:765:a7d9:7085 with SMTP id k14-20020a05620a414e00b00765a7d97085mr34192089qko.51.1693328905294;
        Tue, 29 Aug 2023 10:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693328905; cv=none;
        d=google.com; s=arc-20160816;
        b=ECVeaF6xEHWwichvW1fsZTAPaMYeX39O1l6JhneaF2CUU0FnQ+jCUvKUIHTIpm1CPX
         MRuhjr17NrB2KyCjXzLrPg3c/EPwmG9VPb9iLHr8tUYiHSFQ6ltsWx8umBGeTGWj+TI8
         wdenCxZAfNzLufhNRBPNo4EywMyjDC+JnoPgPJ5/Xvoc0C4Y0rtMPsKelT3ICSkCimhv
         3TCECAiUE5L4IacIpsPCSSfSNbBv7okwrq6Ov+SOPg3vdmVAZY0zAg+2JgwNyiB5e/kS
         PoadBYQ5546wvmMXgiIwgC7BtbJXzT3YcqC8cM+wOBUcdvHH/8icFOLZ9cIhS4ORNdfy
         Mj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2DWe8xrxrAKaRgYVZbkCNn+0qtKDPiuD67ILvhzs1Ec=;
        fh=m6ro60Caf406s+3x8XRYfXkytlG/CXnsTlMqP0udiBw=;
        b=uaTIb/JSWVDd+NvG655oaCwewNYTWmf5Qk21fyLwdt77EsJLaW3Eci28WSM3O5LaV6
         aWoTtioL8ABFbKnFIZ21mUCoIMs5PQPuqMEFM1jRgqjZ7ot+gFbjLX9VOtOWodCctigz
         3e1j8Hxgm0AGao/CwbIjEvWbt3wQlNKXAkZz7BIICBxWuKGGziBQ79Eb+XvRr735hFV8
         K0wXcImjJMLt1wHYbhI0qmbf3lOJ0PhfAfA0cI4DlWT96Gbasz2X+xyJZzCmRA1wrna6
         a5fSpNE7nd9LlYtQu+l8oezk/PZivb/p74xf/0ZLmb8jFhQeUJb8VsP8auIKMmeeo7Fu
         TNBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTBuiAiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05620a0c5400b0076f089fa69asi4065483qki.588.2023.08.29.10.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 10:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTBuiAiq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb2CG-0002Cz-Mr; Tue, 29 Aug 2023 13:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2C6-0001xg-HB
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:07:59 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2Bs-0006YO-P9
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:07:51 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso3011876a12.3
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328860; x=1693933660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2DWe8xrxrAKaRgYVZbkCNn+0qtKDPiuD67ILvhzs1Ec=;
 b=ZTBuiAiqhnIB1R5HcOUJtPkDTg87CA9Gh+jMHyWbuV5x6hHzeSX0DjwI3z8V0A5/lw
 Hg7aOAcK1AnNKBQyASRq3MI3k+pBiIxyyGlKHzv/Z40oKD66zcL3KOGyAWjbnP4gSTR/
 EkkuMCx+iya6HJfem9tLmQlOu/mGLJNPI/EHWsmRFVW5omd5FB1zD9ZPX9gka2Rwv1Bg
 2JMm6E9MQrrp7+vClKhTjngOGhsZ/7zy6xmp0MbPjzn7YonBjnM/ShcdFpoodUS78mF/
 T0bhwR/ikROigDTCoUaCzVatHigDNOgKMkUIW0e1DMxJ4eQNSfNoGf3xRHhGjL+fsrQ/
 yr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328860; x=1693933660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2DWe8xrxrAKaRgYVZbkCNn+0qtKDPiuD67ILvhzs1Ec=;
 b=OQUB+HkeKOFcTuYaQYdlgh/8DG4CrKNroJWOtUbTVXGHwnKjK6t5a2ox4eV7IQjRur
 WF1lzUQJMRgrXzBap7ZK+a2RwdGWWrfNYCnNjiTTaBj756SKyCCgjSeZnCeiH6CspDn3
 KSlzZWdjXsKjmGIyRvll5GTQiSg1d+7kFZx+uk4LOUiMhzU+3T4/GPyA7UaSUhR+1Vis
 yKCMylmj2OgO+rBuCfNDdbpnkIvwavYc8c8SDhiXMNpiP4ws0UTGxRUAOc55tIGKdaoT
 EpT2TxD2iYl4DY0HhFIKA6jJbUBvrx2qz7sALXAKea0XDiH+6Y7bfaFclvKx2lcQW3sU
 lWhw==
X-Gm-Message-State: AOJu0YxJ/GJq2W1AJmOsuKPnC1c1Uun5JtyqU6jBLNXkGrNFcVIRSRUb
 muMB+z4isUFt9OSaMRxPXRHM9w==
X-Received: by 2002:a17:90a:318c:b0:26d:416a:b027 with SMTP id
 j12-20020a17090a318c00b0026d416ab027mr27954413pjb.31.1693328859987; 
 Tue, 29 Aug 2023 10:07:39 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 rj14-20020a17090b3e8e00b0026b30377c14sm9047231pjb.6.2023.08.29.10.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:07:39 -0700 (PDT)
Message-ID: <fe32a49d-f898-4347-9844-679eaab3f07c@linaro.org>
Date: Tue, 29 Aug 2023 10:07:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 11/11] exec/translation-block: Clean up includes
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-12-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-12-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: JJW9ys6bZfas

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> 'qemu/atomic.h' and 'exec/target_page.h' are not used.
> 'qemu/interval-tree.h' is only required for user emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/exec/translation-block.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
