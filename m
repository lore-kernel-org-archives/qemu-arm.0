Received: by 10.25.0.6 with SMTP id 6csp824092lfa;
        Sat, 13 May 2017 15:37:56 -0700 (PDT)
X-Received: by 10.237.39.195 with SMTP id m3mr9768909qtg.164.1494715076796;
        Sat, 13 May 2017 15:37:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494715076; cv=none;
        d=google.com; s=arc-20160816;
        b=SUlwqKttNWio9NXo4y8Ni8WkiVp1BMzSFPLHHmPOjc+BAkRN2rUURqnYnKKIQRimUF
         SyVuU3ZDyurSVUKpeTcNDxECjQdOLdOlr8bZMeM71h+8PqnL8NJYs/D+m4hzrhpAWgCZ
         kEz/6LaoYfYAklFYX7VXYOwz55BzeLITd+uNfZdZNGQizgL27wr1JrWImOkMXZQ9a2ME
         AvuQ7U2AMq5+hK9FmXKmR+Kc+2I6a5flPFQUr493AKPgDiUGkLaOu/B/GWnJRfwtiO3A
         +OcJUoy7KfoIdiycssZEoqFKJ2Rk+cyAnME0kQweKLvGUCZR/1sKnv6KvxzFu6RjHaPz
         iZYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:sender:dkim-signature
         :arc-authentication-results;
        bh=/wwRknpPTl+M7yeyMSHWGJv5zR0AMVD4dJUoPBjjY0c=;
        b=grwoLQNIilk2jJALdGGoE6YcOD2TFIib5vO7q9L+cqBCJpa9DcewhNaHJGmq1rovvQ
         Ipfy0uecZoBj7DktVNE+8qhneHQrG2IaSpmz/dDq0BK55YdOstSdLGmKVIdfarzeXSqM
         scdjBX4fwIDR0DgpjpvrHIYsTN10QxWTDon71jo4dX6vTfh0P2NGcSNN6lABh1pJzP8T
         jReDeAlYDvTRdCEqdfZ9NWUQw/ARp+Ly88krp+9pNnN8D+ry97PC1BoXWl/mUAUACwBt
         Nd5snhZCF6x2qK9P/LZkcTywMnK0OguTm2ie9tjzD5emsY3PXJ8g5St85MleeoJ5s8Wy
         RkPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com. [2607:f8b0:400d:c0d::243])
        by mx.google.com with ESMTPS id o84si6848402qkl.198.2017.05.13.15.37.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 May 2017 15:37:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) client-ip=2607:f8b0:400d:c0d::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::243 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x243.google.com with SMTP id r58so11161103qtb.2;
        Sat, 13 May 2017 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=/wwRknpPTl+M7yeyMSHWGJv5zR0AMVD4dJUoPBjjY0c=;
        b=EE49v6mrrQwXtOyHRpLo9NsqNh7INtZWj4xDDWGQURgrecxLWe1eMxg+SNuVsut5oD
         fdutXSTgUa38OCekR6X73ZdA63RQqf22m4prw5Z75ntiMwbLHHpBQmyr/fB4XAlq/u3Y
         xW341/x0uxVY8veGbF1TK7KdVmI6g/shWeV0ENBPIgti8z3Bj4DSgZokgToT08Or+ddy
         aySt+xuTi8wxxac0OgZujl86aJbaly/GILh+z1tjT6JsdakNU17yE5f0BIzGmF8GyXv1
         hiSkKKtSD4wI97C8VU4PQ7aIbkSIX6j0Z7aYXvpfsvAjT4dk14iJHPnxAfZJdKAoULp5
         icQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=/wwRknpPTl+M7yeyMSHWGJv5zR0AMVD4dJUoPBjjY0c=;
        b=qTVRfFaF1zQHpNLPW1TuRfIfnsc37ZfONS/sYP4P+lRvumFuoDJtZqChal2b6uXp6h
         ydu/OucicNmMjSmoXHE6H8vTWNk5kVyyzA2eDiU4+VnUA+YXyKVC34io2dO/EriFu2eV
         psFqPI++vYiLBxw3sLPuqhl3t4WI2RVxegx/3dM1pQqPprMffMH54K2QMnc0hmtsmbtY
         QLLlTPpzerNc+M9pzefEvodfxenKt06b959P+PozPJGLuSnM1oihzbwY7zn7+rshAb4i
         x3fxQaNSKLGnh9xENihweJ12BrWm4zogUuJMV+zBjLyzrmW05Xy3dqqk+vq6ccrUrbN9
         tEQg==
X-Gm-Message-State: AODbwcA5BZnXGzzGXdSwqULpPje02IsuCx2n7t7KUHUk1LVHsfaOmn3u
	TNjsNAjwfLYE+cA9bnF+oQ==
X-Received: by 10.200.51.70 with SMTP id u6mr9804827qta.122.1494715076281;
        Sat, 13 May 2017 15:37:56 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id n17sm5261651qtb.6.2017.05.13.15.37.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 May 2017 15:37:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 05/13] arm: Don't clear ARM_FEATURE_PMSA for
 no-mpu configs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
 <1493122030-32191-6-git-send-email-peter.maydell@linaro.org>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <82878b52-ee9d-e427-f1f3-d112c693cc49@amsat.org>
Date: Sat, 13 May 2017 19:37:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493122030-32191-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2CRrwbcDn626

On 04/25/2017 09:07 AM, Peter Maydell wrote:
> Fix the handling of QOM properties for PMSA CPUs with no MPU:
>
> Allow no-MPU to be specified by either:
>  * has-mpu = false
>  * pmsav7_dregion = 0
> and make setting one imply the other. Don't clear the PMSA
> feature bit in this situation.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f17e279..8e57498 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -757,8 +757,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          cpu->id_pfr1 &= ~0xf000;
>      }
>
> +    /* MPU can be configured out of a PMSA CPU either by setting has-mpu
> +     * to false or by setting pmsav7-dregion to 0.
> +     */
>      if (!cpu->has_mpu) {
> -        unset_feature(ARM_FEATURE_PMSA);

Oh, fixed here.

> +        cpu->pmsav7_dregion = 0;
> +    }
> +    if (cpu->pmsav7_dregion == 0) {
> +        cpu->has_mpu = false;
>      }
>
>      if (arm_feature(env, ARM_FEATURE_PMSA) &&
>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
