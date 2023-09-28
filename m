Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2818693ejc;
        Thu, 28 Sep 2023 13:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1iMqE4LVQ3AAbxh7dryI59zraXYZEhryPi9C0tWT/+61E7ZFOL/J9c7yeSTKbTZvFgSzn
X-Received: by 2002:a0c:f083:0:b0:647:1fc5:1cc3 with SMTP id g3-20020a0cf083000000b006471fc51cc3mr2419345qvk.36.1695934217471;
        Thu, 28 Sep 2023 13:50:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695934217; cv=none;
        d=google.com; s=arc-20160816;
        b=uB2JXAo2R5TZCs+5P0F8dZCQLWDlN4HSAFsnvZ3DkC5ySzomR389ojM+WtsxAwCt7/
         gkERtPEw2ogyO5U17nfyIrsXUOPLzxy5RnFNhf5hnu/UlWwwLBbNA2ZYzhcOHORqy2xV
         c3LovI4qF9lb4D0mtEFUYHxxhhkpDtxY5P+dBZTJU9/Ob4Kj8tXcS3/Va3iLICM5fxz1
         69vQvrFtqNuhP/MHe63c1scZkzscSg/eeK06ICujYVgmfKJ8e3JIhpY8INO3mhUmz+Um
         HEAP53wpmNMiLkaT7fO6TLq/g8QE6qMPlknfjnDWa2ad8Bb05Ja2y8ZjV+I8Zh/ISPos
         25lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1JT1Kd6LjkSdgtv7ZyWTRCTt4F/HM7bhZ2sKLpnu9JY=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=mj2z0m83r0e2+svWGAZSSpWhEjQjkn5w0hWYhqRal/4N6DaiuKMfFR6DWsH/HdX8vw
         yyliOiRbx/GKaU9vwuPLt4U6qy1zTFX+ASB52UWiCKoZV87ee4XycOKE803kv+C3dwEi
         uy1ylDbs377Elx3haChF7CSDdhq275RAtbbaQAgoQRPZ2CWUtxISjaPu9/bBnUAbQ9Q/
         uPMZ1PqDtHSqZy8jdyZ1l/oHc/wCSSOB5Ywy70m/dtwDUVSyaGjdQlgQjlyTvgk7UNMO
         IWezXXtai1qtSp+RBHYqq79L6oMvOfIR8x6I92bYIfq8LKk+ddOg28hHaP5zSwMij06+
         BALA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBCbOhDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6-20020a05620a2a0600b0077439315fabsi3817905qkp.55.2023.09.28.13.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 13:50:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jBCbOhDq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qlxxM-0001TG-0X; Thu, 28 Sep 2023 16:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlxxF-0001SY-Mf
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 16:49:49 -0400
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qlxx9-0001QZ-Tw
 for qemu-arm@nongnu.org; Thu, 28 Sep 2023 16:49:47 -0400
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-496a2ff7780so5001800e0c.2
 for <qemu-arm@nongnu.org>; Thu, 28 Sep 2023 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695934179; x=1696538979; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1JT1Kd6LjkSdgtv7ZyWTRCTt4F/HM7bhZ2sKLpnu9JY=;
 b=jBCbOhDqd0ws8eYYhRM7k097HxEOB16R87jmwn2vs/jvKyBCm0txU8JZeS8G4w3nT+
 6V4rXImGqrI3AByPCkj2H91yEtO/WoERkDrv7HAPVFK1niAEPoTIUd8eqUxei75Yw7mW
 c3asGNDWCW7KroSfrsGAUNbsDmbgYJsLrupo1sHU7fABsa9XPFDTL3CS3QN8TjY8CaVx
 prkoX7HiuxkVEDc/Ljv6flZ0fivvkfSnYIfH/QEOOpEVDnyO04AboFMJm8H84Pp9im02
 TAXfAnINq6EaAgRXBn5EhSWOLKZFXSccMv6Sh03F27lRRwKkTPWC8OSejsjSdabVxEZF
 SfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695934179; x=1696538979;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1JT1Kd6LjkSdgtv7ZyWTRCTt4F/HM7bhZ2sKLpnu9JY=;
 b=wJSqRFhsmhc3hbfYot5J5Mm1ASVhigriv7JxhvoV52UYRHfY9gcEbCJG6nerF/WDzd
 yHrNHgY2FPlqmhS/rUoiRODU3774LWMS70t9L9Z457VBbj+z9sM3CfRD2ogDHLyQ+6BH
 8HSd7ZSSCpsbbv5A+R+qPcHYmIJYT6XeBH82Lc5KYRMnhQmXOYGo2exLv+bsftk/uLik
 KdYM8hKDMrIrzIsP7t9GuN6U7c9lpChgYYDwTFKcfg9eNEUDq9sj8K1lziv1yBczGqRk
 gL06pSh3mlH4eqP8IWVTzr2ZggLDJSbNJvxOyNAt/v1hWtS21pCFUBzs24SLYfjQ1inn
 4oKg==
X-Gm-Message-State: AOJu0YwjRtQ1SYgEka9ag4pRgQsSLQ8zKLUjfz38ZBWHdW0h0znl0MTV
 O4RtKS6l0a2agAVgJszWa6QdPQ==
X-Received: by 2002:a1f:4ac2:0:b0:496:295a:843 with SMTP id
 x185-20020a1f4ac2000000b00496295a0843mr2045121vka.13.1695934179420; 
 Thu, 28 Sep 2023 13:49:39 -0700 (PDT)
Received: from [192.168.0.4] (174-21-146-124.tukw.qwest.net. [174.21.146.124])
 by smtp.gmail.com with ESMTPSA id
 q19-20020a62e113000000b0068bc6a75848sm13752952pfh.156.2023.09.28.13.49.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 13:49:38 -0700 (PDT)
Message-ID: <347031f8-499d-f244-7497-11bb39a9e352@linaro.org>
Date: Thu, 28 Sep 2023 13:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] target/arm: Permit T32 LDM with single register
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230927101853.39288-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230927101853.39288-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: tI+Tc5TQOTpF

On 9/27/23 06:18, Peter Maydell wrote:
> For the Thumb T32 encoding of LDM, if only a single register is
> specified in the register list this instruction is UNPREDICTABLE,
> with the following choices:
>   * instruction UNDEFs
>   * instruction is a NOP
>   * instruction loads a single register
>   * instruction loads an unspecified set of registers
> 
> Currently we choose to UNDEF (a behaviour chosen in commit
> 4b222545dbf30 in 2019; previously we treated it as "load the
> specified single register").
> 
> Unfortunately there is real world code out there (which shipped in at
> least Android 11, 12 and 13) which incorrectly uses this
> UNPREDICTABLE insn on the assumption that it does a single register
> load, which is (presumably) what it happens to do on real hardware,
> and is also what it does on the equivalent A32 encoding.
> 
> Revert to the pre-4b222545dbf30 behaviour of not UNDEFing
> for this T32 encoding.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/1799
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate.c | 37 +++++++++++++++++++++++--------------
>   1 file changed, 23 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
