Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1431761ejm;
        Fri, 21 Apr 2023 14:53:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350YiqJUDUHpC/M1A3ioYmITNZKwfIsC35xRNPyhSZzBBu1e/uzTS9SrChKpS+uCByKJ+Y9CK
X-Received: by 2002:ac8:5884:0:b0:3e4:ce24:99b3 with SMTP id t4-20020ac85884000000b003e4ce2499b3mr10258232qta.15.1682114030263;
        Fri, 21 Apr 2023 14:53:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682114030; cv=none;
        d=google.com; s=arc-20160816;
        b=fRGhV7NWDmerEbnymA1biO+PTFCGArafdTXTTWzmQUYKzxGXVuqmhII3oqwrCDRX6F
         Imig5OHgDKp64xrT//lvWa0tfAeLXrEp4JUtHzAiQ6tneu/9CQluoENIu93w7yrjZL2V
         1hKqU1vWrIU+iV68qD5q//2CHn3nxO2eHn8fqfV4zYXgL8o/GNk6RTXK/OUP7vnV5UF4
         IynObJi+GRl561PkX3CKTngmM1OogbJEdube7iuNVmjE0I1KfE01u4lNAs0/8p8cMX0W
         yTByLbKXGsiBoycwz6D0rsP7WYxJNEtpjievpcabqVN/e41P93t1HbX8w95q2dFEM/iE
         FS1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RmbHQN5yrjMZfZaZ+mqZZy0mWnwUmWYK29MXvrZx2G0=;
        b=UUYHEp8FCzZS4dN8xa6ZPiD5y6kL/axvY8sHpNeUeAFj6Cqow2+61buM/CU+An7fM8
         W/LaFPvD7fD8JkESHhcMxcBVDdWlk6KFzOiRVLmF68n5ncQwDY6c3JYZ+6X+3JntdSAy
         gcuSa3zoFGedImEBw6N5kQzJpf1+pw56EiGiL0iofQPI+2Kd3Cooltn1iSmXDsFn8UmK
         Y7hgU2X2qTWi9U3Ho4JkiQu2G9Y02nuV6BQoAgNa8PW0Mi7mVhiLwtztctVF+AQ10R6Y
         wsOQlmJ2McEFjQMR+nlIUyfir2V+Pn/lQaYppk+IEM3cCCR1hulB9ePFUCaQ/4SJMCzn
         Ltmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UyzbopYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05622a04cb00b003e6980379f5si3799790qtx.352.2023.04.21.14.53.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 14:53:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UyzbopYX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppyhL-0006Tb-Sq; Fri, 21 Apr 2023 17:53:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyhK-0006RS-M9
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 17:53:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyhI-0006Cz-06
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 17:53:42 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e2f7so1397034f8f.0
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 14:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114018; x=1684706018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RmbHQN5yrjMZfZaZ+mqZZy0mWnwUmWYK29MXvrZx2G0=;
 b=UyzbopYXcMrpVYO7KEYpo1v8OtTD9T3aUSe0CwzQ7Q/daCIxkzrWCv+mH3DFwa9R+x
 76hJiSL0ndOOy5N320nbfYtWCnK1VbtWdFo9y0JdrshpOW1wGVXSO6evckg83+TpP7nl
 HH5PA1OaYuQfSXWO4O9jx8jPD5urCpRoyDjodfK3d/OM4bSqjEo4uMVV0Ei8zg0v2Txc
 Hc6fe76JQsP78wd2FqPGLwEFbzADc7Wo02lSH7M/ay3bgYdExqPV0xwlojZwUnOKi5tO
 8J5bkyfQTSBir6xIeA9K/oZYnXNy9W0nusn4lyIP76eePO5cCM8lWVkpa7i0q2ZLDj69
 H1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114018; x=1684706018;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RmbHQN5yrjMZfZaZ+mqZZy0mWnwUmWYK29MXvrZx2G0=;
 b=XzZnCCHwElMjRGPPcr65MNiAIqbNXpVdXSGw2ehTXHtw/KRhy0DQLxmBeo9iXvGuIH
 Vg/G+A191n/fZJfAHoQaV5JqMeqCi9dOgVGuuSOINXGLClZ+XlRJbRMEa+jNqYopu7ko
 yq8tBVCLh/JhX3gOa/QZNEoJu96Dw2P4mnFf3pAVzWTZ5iyQGSwu6HWSgH2ia5UCJxbC
 B1C65H/FPRVi1BmZv4nLtCRySbDpZ+27r8d9EnQ9YfbpW95sMqN1fNrxtwkKF7ZPSHMt
 ljEHoDGb+DjZi6Ggl6ZWghD164twfAdhY7Nf/4CHzza6KT7DrlcNoPUHaLvzt69Yt74x
 pZ+Q==
X-Gm-Message-State: AAQBX9eltUUPsCHpP+GEpGisJmGV1BVdxf0VHPGcyDLbC0HvWUKEGVRm
 NJ1v7rr8/DfjtMhy9LMgk8WwYA==
X-Received: by 2002:adf:f5cc:0:b0:2ff:89d6:3561 with SMTP id
 k12-20020adff5cc000000b002ff89d63561mr4706939wrp.64.1682114018116; 
 Fri, 21 Apr 2023 14:53:38 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 x2-20020a5d60c2000000b002de9a0b0a20sm5198394wrt.113.2023.04.21.14.53.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:53:37 -0700 (PDT)
Message-ID: <43fe915c-9c0f-2ac2-57fc-3206d0920ce5@linaro.org>
Date: Fri, 21 Apr 2023 23:53:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 05/42] tcg: Split out tcg_out_ext16s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-7-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-TUID: mS3nUOTo8qA4

On 8/4/23 04:42, Richard Henderson wrote:
> We will need a backend interface for performing 16-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        |  7 +++++++
>   tcg/aarch64/tcg-target.c.inc     | 13 ++++++++-----
>   tcg/arm/tcg-target.c.inc         | 10 ++++------
>   tcg/i386/tcg-target.c.inc        | 16 ++++++++--------
>   tcg/loongarch64/tcg-target.c.inc | 13 +++++--------
>   tcg/mips/tcg-target.c.inc        | 11 ++++++++---
>   tcg/ppc/tcg-target.c.inc         | 12 +++++-------
>   tcg/riscv/tcg-target.c.inc       |  9 +++------
>   tcg/s390x/tcg-target.c.inc       | 12 ++++--------
>   tcg/sparc64/tcg-target.c.inc     |  7 +++++++
>   tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
>   11 files changed, 79 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

