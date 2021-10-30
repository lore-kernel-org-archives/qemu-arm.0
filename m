Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp450276lfv;
        Sat, 30 Oct 2021 16:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg17fQV7ZAcwGIZhCfqviegui/VEhfpKkvlSALd5ezs85AH+PL8ZIlkIea5RSRFsxegZh2
X-Received: by 2002:aca:de8a:: with SMTP id v132mr19595080oig.61.1635637625285;
        Sat, 30 Oct 2021 16:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635637625; cv=none;
        d=google.com; s=arc-20160816;
        b=v7VL16C+T7bgkkkKOBOCJ91JI0Vsu56j6LEAW7yc1akqdK+pnGK8B/eBPARYc5W88j
         P1N1WKXHuWA5Uoj8MOnvV2ZVprrICSqtbGkhhzoJi9Di0bXJy0PMxhZOxrGOf/UKYdUM
         lrXSoIDHGTP6oov5LNtWlXr39GrVee87g9V0IDE5grSUVaqONslBGSnzWYYhOJTtFxJe
         TuOtqLJtFrlSTx4rNtad0DV1b3b/9Qy/BcLNr5cT0xB5dR00tMrRKXIjJ8ROglRVmHu6
         cD0TEGNOJ08DG4O9i5VL6KWVDnXw4jjez5bXNy233o3JKRGeAlVrT6uxWEpxXWcsMn54
         fQUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=87JqwG2Fiy2GPUx732R+tmA6/cg9AclRHYISrMS9vDM=;
        b=Ro3sJeLFi+4Zq807BYMpehtmWY4EHOG47vBJsKNi5+EVm8ufJF+5G8gYE9+58t+GDG
         8wivy1X5XZTEQW8+bzLVzZxvsaE2C4mDxIJJEG4kh5ktBvAcLCLmH3QTNoryJ3tcrvkT
         sDFuBaNdi+rlbkNfLH49v97wSu9fA7ePMR6cBka/VOSKVsV+HyllRlh0EmNS4CNYzDwx
         I8i+HUjoRgL8xBGKgs5hrurRVfsmANh0Ctj/ZkGHm8CssX/SRUN3aMNF3FYakFoDAuo/
         QJXhlCLFCMIInduOJ6LCWT8703iu+W/QoqMg6bO2/rAbUV0VGvqi8cRNgKgkEjOz0NnG
         kqMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2tLZU1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si544619oiw.248.2021.10.30.16.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Oct 2021 16:47:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k2tLZU1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mgy40-0006eP-Hi
	for alex.bennee@linaro.org; Sat, 30 Oct 2021 19:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy3Q-0006bV-3w
 for qemu-arm@nongnu.org; Sat, 30 Oct 2021 19:46:28 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:46593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgy3N-0006yE-Mt
 for qemu-arm@nongnu.org; Sat, 30 Oct 2021 19:46:27 -0400
Received: by mail-pg1-x52d.google.com with SMTP id m21so13544977pgu.13
 for <qemu-arm@nongnu.org>; Sat, 30 Oct 2021 16:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=87JqwG2Fiy2GPUx732R+tmA6/cg9AclRHYISrMS9vDM=;
 b=k2tLZU1B37z7YOFo1A9HymNr5GiOJsBZH7JNGlv2bac4eo5tAiFOtnIX2brkVFK2rS
 RtETjP5xdXXbSLhcTaecMsPOWgp0jtLs7ASr4zz/xC5i6F7tq2ufjDId77RkbikjwVjh
 dg5Vnt0ceYxizUvDayeTAca3CDt2yUKc1htqzxNJ/ucOfoLWezntHWFOyxgeUwjatKON
 wWJgJI26fKfDumnS34KG203HvMFx+UzFoEpOY/J3xqRKdChT8WBGuktn70qkvtqjAAid
 /WQViPYQtYZiGLY0JpdQtdpkLfRwORpOUR4rRjd3tJy6hdC97aW1Kv0Ra5iotlSyQ7Y/
 s+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=87JqwG2Fiy2GPUx732R+tmA6/cg9AclRHYISrMS9vDM=;
 b=g7GqQhSoDu0P9JgOap9qSh7PM2mXS0v+HztnseNj3w18Sc+7kr8MFXSXxhczc9cnC/
 Nh6yU/VfFEZR1wyPGtKPgQO61o1l/oxr8NoIguuRwDwe2SWTZiDC23B111aRfoSp7Z4P
 NRz3Rdgauqs2abV85xtXvu97LnrQF7/goXFOsXoOu9fp+iTW7DLdbkGBcdnDH+JfMBqP
 cQrMsC6nNkV/WB/n82PY3eNUge1b7skFE4dXu4IFnsG8Y1oZi9s/Jkmt/dzg8Osns+rA
 GnYYW5LEEfY2ioDfwLBJ5exezCs7dCvaEVjLrNrPucQOkw6D82DEh27bWaVjH05KxXgh
 V/4Q==
X-Gm-Message-State: AOAM532JDmd7EqdIbzHF4jEB5bkVIVx8uOx1YluLBug5w/dCTQP9jqBs
 6mDpp+Vwa2tFUZ+XwTwe51LHMGtQN9fk7A==
X-Received: by 2002:a05:6a00:1503:b0:47c:2928:328f with SMTP id
 q3-20020a056a00150300b0047c2928328fmr19118465pfu.14.1635637583334; 
 Sat, 30 Oct 2021 16:46:23 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id a20sm10535068pfn.136.2021.10.30.16.46.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Oct 2021 16:46:22 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] target/arm: Use tcg_constant_i32() in gen_rev16()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211029231834.2476117-1-f4bug@amsat.org>
 <20211029231834.2476117-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa87da95-cef8-2e6c-7351-c6339673fe57@linaro.org>
Date: Sat, 30 Oct 2021 16:46:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029231834.2476117-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.426,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aiw1ugGoYHoh

On 10/29/21 4:18 PM, Philippe Mathieu-Daudé wrote:
> Since the mask is a constant value, use tcg_constant_i32()
> instead of a TCG temporary.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/translate.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
