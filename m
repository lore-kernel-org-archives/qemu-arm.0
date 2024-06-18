Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp857471ejb;
        Tue, 18 Jun 2024 07:52:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrKeLQ+xoWpsF4rbeyYHE1UFc/QwZzrTZ1amnDO18Neurh1rk36PKHw2pwOq612+DXLSBecM9S++Ewk6VBlYJdO323AF6o
X-Google-Smtp-Source: AGHT+IFH8YFAL95zFKwKH41y1uT+K+A3SwYN5GQjwdKZrdOh75OjmRJ3NAeAIf+ULVkj+AI3eTzU
X-Received: by 2002:a05:6214:2b09:b0:6b0:82ba:b503 with SMTP id 6a1803df08f44-6b2e22ddec0mr40779646d6.7.1718722333676;
        Tue, 18 Jun 2024 07:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718722333; cv=none;
        d=google.com; s=arc-20160816;
        b=WXu4xxQZjyR+xVKp7TZwKs/+gMNuj9wwF3vtCFma+8dAcAYzR/AUP7Djp42H+K8htc
         7RvO83ef6xcOv5UbDZ8GiI5SpBkLqYLAV1ncllym7fKGGw8oM9/5FhrmsYRoxzx+Dbvn
         ZKtcoZdr657brleOFhUyS12rJefK9/g+h7J5uv/1Dri+G0hJCgU1k0c0LO8Y89XgaRVc
         +pZ/+nRfh+RdWkboZ6ASeHdNQQNKvbxG7rAtb3XyZE5AxdIs9B6JlV1JnzFw+lu7+LaP
         TYp3yNxhD95myT0Z4nowvYOGL4bTYM5OEsn3zLQGDIFYbymARKh8JeEA/7Q/RgJKQgA+
         kqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MxgvLOx7YJKBqNY7kF1pTfUqHbVy758/LU10hQiT3oY=;
        fh=MN8JJ6o3P2EkNkhJGTFrOwcSUc4LKrTZERfEzQs4vzY=;
        b=JZGKv/8lnLx5l3FreVtJ/OYq4HSeauBixfSP/J15TmDVxp9/ioLXFeMwTPvKLdslmQ
         SOEqo7Ouc01d07+8TiTDFvwLVxi1viev21k8hciTlBMUMi/vK/RPtQpVWxzuwVRMWwxJ
         hAAp7K6J5tVnWPv7lCrWZSZK3kaHIfnG7t/rY6XzZzpyM1GBKqqCndbDoEJUMFAJR0kR
         brStZucJ5+XY0rw9R6K0mWzbMO302bKo3hbZnCBFduWqRCrEjsxslnx+tZBtIHDZqxmd
         zo77idq+C3ZxQOCohAAqNX1PQN0Qinnc8/OZscpYNSBokFpbhaXiRMQzn9GXUGAGOpPu
         0YoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Htot8V/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5afe21fsi128058726d6.276.2024.06.18.07.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 07:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Htot8V/d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJaBj-00047f-TI; Tue, 18 Jun 2024 10:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJaBi-000478-VH
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 10:51:58 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sJaBh-0003HW-6y
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 10:51:58 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-421eab59723so40112645e9.3
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718722316; x=1719327116; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MxgvLOx7YJKBqNY7kF1pTfUqHbVy758/LU10hQiT3oY=;
 b=Htot8V/dv1T4Yw2H+9ymDLJtCywXmb10BgVEJnIKAgBIBb53/1Ka5g1itAMlwdGX7k
 F/aSGIAwQkAeC63j4Vca58MRV941FXj5XQw4aOcpqiNSIL0g5WcQliMHyAvPfZLaiJXI
 MC+4gfAco3zo73LhZ+QMPPdvXpPLiEkOfiCRKcDRFduOkeedOqCBIjSujn3YUqdXWYQ0
 tKnJZiHNf44c5PeFK1MI6UWnh03XB+ElLXvteb5I4GTF7+UO+T2BNdkALkJat88c1rdp
 x4MeuLt0uHxvYjaKKKl3d/nImNizEMvqSSYiQ5F6Sfi/gh2h9ducI+vp7jb24uR/j4oZ
 BfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718722316; x=1719327116;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MxgvLOx7YJKBqNY7kF1pTfUqHbVy758/LU10hQiT3oY=;
 b=W+b7ASlOqtRvjeqxfJf2VTX3G9dJcsBNg1fnyl3dEcyvRZ639b4HiQGxD8/0sb7Ggk
 uFCnrVcEueTjDRcQTSv4vblEM1lqZFIsVWBYdDSGY66tUsraddS0aBzwsTGj4anvjNbQ
 WAe/yXhJFlvVDN16tUGL8mv5xV5zoxdQ4qzBC2LjpNln9Q/KkOEnJ6K3683KYFF/agBY
 Oe8I2ukxUU6by6774Ec3iljxvQG20pQDw9XbdD2ukh1gOXvDbvrWHT9ahC/OVJ+XRJl/
 4EO4o/4UKlD0DMEV4OmqGHCfQ4cmN34HOWX4wzaiav/dYaH4OH+zwHaVqE94HhbWD5L+
 BEkg==
X-Gm-Message-State: AOJu0YzbJflHrydj5OjSp9PC/tWCqm8tBYDUqgNfDYMbc18NaeiCnWVv
 gaiUNoimqS5Gn63kreShC+lZaKSSD5kWozFuY4IqUQMJbVGC51koRwmUkNVQGI4=
X-Received: by 2002:a05:600c:2d8c:b0:422:140:f440 with SMTP id
 5b1f17b1804b1-4230484adc9mr103961615e9.36.1718722315768; 
 Tue, 18 Jun 2024 07:51:55 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.212.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f5f33c2dsm191327735e9.10.2024.06.18.07.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 07:51:55 -0700 (PDT)
Message-ID: <47a6e9d2-27f6-4e45-9de3-c4766bdf2566@linaro.org>
Date: Tue, 18 Jun 2024 16:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/timer/a9gtimer: Handle QTest mode in
 a9_gtimer_get_current_cpu
To: Zheyu Ma <zheyuma97@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@amd.com>
References: <20240618144009.3137806-1-zheyuma97@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240618144009.3137806-1-zheyuma97@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: 2+zx9kVfuY9w

On 18/6/24 16:40, Zheyu Ma wrote:
> This commit updates the a9_gtimer_get_current_cpu() function to handle
> cases where QTest is enabled. When QTest is used, it returns 0 instead
> of dereferencing the current_cpu, which can be NULL. This prevents the
> program from crashing during QTest runs.
> 
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display \
> none -machine accel=qtest, -m 512M -machine npcm750-evb -qtest stdio
> writel 0xf03fe20c 0x26d7468c
> EOF
> 
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>   hw/timer/a9gtimer.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> index a2ac5bdfb9..64d80cdf6a 100644
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -32,6 +32,7 @@
>   #include "qemu/log.h"
>   #include "qemu/module.h"
>   #include "hw/core/cpu.h"
> +#include "sysemu/qtest.h"
>   
>   #ifndef A9_GTIMER_ERR_DEBUG
>   #define A9_GTIMER_ERR_DEBUG 0
> @@ -48,6 +49,10 @@
>   
>   static inline int a9_gtimer_get_current_cpu(A9GTimerState *s)
>   {
> +    if (qtest_enabled()) {
> +        return 0;

Indeed this is how we fixed hw/intc/arm_gic in commit 09bbdb89bc,
so:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    }
> +
>       if (current_cpu->cpu_index >= s->num_cpu) {

That said, such accesses of @current_cpu from hw/ are dubious.

>           hw_error("a9gtimer: num-cpu %d but this cpu is %d!\n",
>                    s->num_cpu, current_cpu->cpu_index);

