Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp284265njc;
        Thu, 5 Jun 2025 07:23:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXT//OrD3bvy3PKw0nzn7RNxHpt18xCMRsgRaDS3Ijg1Zt3tICjDBp0irIKFpSmS2CjjYlkvKEV84EnIg==@linaro.org
X-Google-Smtp-Source: AGHT+IFA7PNYOxJ/SQUv4kcGczE3Wz749Ky1bleAdYrJhRkI452iPPMo43Wz6BeMGqcj9NCjsTzq
X-Received: by 2002:a05:620a:198b:b0:7c9:23c7:a927 with SMTP id af79cd13be357-7d21a66ef57mr786519685a.12.1749133372882;
        Thu, 05 Jun 2025 07:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749133372; cv=none;
        d=google.com; s=arc-20240605;
        b=ihWYXuqP6KalPHiR3x1kn6q0sHZR5DbBIGe4YVhjQlFiUHPoMVr2IGWVEmIdlSPGiI
         CxpmfkTKfBPmimns5KRedK1UaXs4L6DEDiUw3x4dDrGs5QRTgCUBUP5lEb+rE3T1T2lo
         0/GpE4NtM59t50MY3Mpj8Sxg454qWUOCllAqwMHOuKJaH1QLtU+yQr8vWuJWLl1JpEzm
         FAr5tSIAp6XQH91GhbA35/pObz+ZUHV1JMvTgmqE8O21HUp2JvUSCDtYKt5rbahUyPOS
         VjkL+NXQxg0LEwl5BS5cFKNsoe88klyaah74ZoRpWkr6Qcc6F9CTyMMBKzkJ/e/eEA4U
         luKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=J7onJD3eHFuligvmevpPa9xDz4N+5TRlabCU7JCGjWU=;
        fh=2ljJL1lgX8cYiuiOSYusr4vj8d7SYztKp8wCaawyIAQ=;
        b=OsODc+FJ3twZBveSknUIwlBSUtqfH8oINBO+JpqDzxLvJ5z2rXlGt38Dyln6SfIIdK
         BKh6eDOLJcd7jxBdNrAWGRbuVL/tad0Zt7Dx33uq8KsRWR0QFgLLqHTqMSk2fsMNTtaG
         VpsHcdEQsoBHwq9flubh/mxyAHYuVvvzozVHhGahJ+iyx8WMNjIARGHxqCctRbqJDayY
         kvuwaQn5vCP1vGtQ22rn4B/dvkIoo+nKW4tTNnLhaFYGh1+8hkyFprUvCM5TMWle5Azn
         F1Va+i5ICLiWknMr1DVegfB0l1sIXRZsbmiymDonXGAl5WeNfuYuQ4nyr2nMZj4zNBxk
         caTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wTUrN/Na";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a304b15si1733785485a.480.2025.06.05.07.22.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 07:22:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="wTUrN/Na";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNBUX-00073o-Jz; Thu, 05 Jun 2025 10:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNBUS-0006z5-S3
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:22:45 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uNBUR-0001jX-0o
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:22:44 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-70e302191a3so8971027b3.2
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 07:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749133358; x=1749738158; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J7onJD3eHFuligvmevpPa9xDz4N+5TRlabCU7JCGjWU=;
 b=wTUrN/NacSdk6kxQDpfI0yn1htZSm9ZHq5SH1iI5C/QhEhS8WsWersrFUQGz+WFaDP
 KevBmKi0w229pTfqKzKPwShS/TBTe8RK9I6Qrbq0lIKeJvpG/EIa0FIysoYAb0o83YR/
 xq5ydLFgIjCkZWGV8Rs5nRR+qQ//zqJxGpWAlsuiA7LJOHMtUdMHoIZF6K7SVtVmJRfF
 PQoibJiJh24xwJJaECO0h08+gwi9lUKX8CvpTTA9FPgr7vdrKVPxjx3Kh3LFIyo513XS
 TX2zYTGOICVe1H40WpCQtNi4hZtyUWqIW6PKUM7fo9lYI4In9FVzrlGCaGj5d38CNSS/
 J8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749133358; x=1749738158;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J7onJD3eHFuligvmevpPa9xDz4N+5TRlabCU7JCGjWU=;
 b=Ng4YjeGGxcAa+Zt7a3ZlYgAJwT9Ue3fCPnR/FOVn7+Hfg7r9Ak09vYuTHrcXw2Wfjz
 Jii4rCuuSUfBGQXKwix6cAf/ckNs/Qnpbebt+iiFz9i7l0wrCXsFkBNp6cr4gptDhSYX
 jUl/yM9ch5kbvpZqBADkzH99z4MayfklS5T4RplXwsdcJQ17JZwuckBQ4Fgttmz4DwNE
 TQg8BPvn+80y3Fyq7IzLJhLy1MU8B21Q1JCR5YhCd8AmpE++J+rV1j+SVgHpdfpmoPAO
 4eIZsVsnuAm7U19JGbNOonXDG7yvxNHIdAQbjdFTyRandPh6K6/0JZ6GyqJNCvFJge0X
 w2DQ==
X-Gm-Message-State: AOJu0YyskjCcFmIe/Rco17ykSzX6MjpChub+xfha4zMDNaFQ2Q4njSfA
 DHTTq58ocIJtkG9GbiSG7z1TBCX9DUEPxKltLB6WuChtELukKs6J5ipWYXJDptqSs/DssZkegtR
 lWbEBwK85oHXSDYyk3DfGig1P6gDRDPl/r+tpa+IMl8kFvOMNaakB
X-Gm-Gg: ASbGncuOpCnQrsiBSdNYbBw1rrGRaWX7dBApYmuIOvcskjBizHEveAj3NXal7u/nw0g
 6cTn9OZAQCZQB0yGFR9wzKs321KaPfbcuNO/XY4h9OsZI7xrd1xauVeRVEmztwCm1RiRMuBRJK4
 hNheGXZnVO+u5aGEEbDxXcU7y5vHoOXVszMQ==
X-Received: by 2002:a05:690c:86:b0:70e:719e:754 with SMTP id
 00721157ae682-710da193a37mr86180847b3.12.1749133358469; Thu, 05 Jun 2025
 07:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250605141801.1083266-1-peter.maydell@linaro.org>
In-Reply-To: <20250605141801.1083266-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jun 2025 15:22:27 +0100
X-Gm-Features: AX0GCFu4nGAFW8d0SeBf1TqskuJ3tlCQGLS7_tK8dMBrr3Wk7wLhnd96jlO_K0Q
Message-ID: <CAFEAcA9++obh-vtp7P9MZ9GHBTjuWGY419Dmp+P8iFJhCJiYHQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/mps2: Configure the AN500 CPU with 16 MPU regions
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Corentin GENDRE <cocotroupe20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: hZG2xXcuexF/

On Thu, 5 Jun 2025 at 15:18, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The AN500 application note documents that it configures the Cortex-M7
> CPU to have 16 MPU regions. We weren't doing this in our emulation,
> so the CPU had only the default 8 MPU regions. Set the mpu-ns-regions
> property to 16 for this board.
>
> This bug doesn't affect any of the other board types we model in
> this source file, because they all use either the Cortex-M3 or
> Cortex-M4. Those CPUs do not have an RTL configurable number of
> MPU regions, and always provide 8 regions if the MPU is built in.
>
> Cc: qemu-stable@nongnu.org
> Reported-by: Corentin GENDRE <cocotroupe20@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/mps2.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 58efb41e6db..50e1a1c1c80 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machine)
>      switch (mmc->fpga_type) {
>      case FPGA_AN385:
>      case FPGA_AN386:
> +        qdev_prop_set_uint32(armv7m, "num-irq", 32);
> +        break;
>      case FPGA_AN500:
> +        /* The AN500 configures its Cortex-M7 with 16 MPU regions */
> +        qdev_prop_set_uint32(armv7m, "mpu-ns-dregions", 16);

Rats, I failed to actually refresh the git commit with a
fix for a bug that "make check" caught before I sent it out.
This should be "mpu-ns-regions", without the "d".

>          qdev_prop_set_uint32(armv7m, "num-irq", 32);
>          break;
>      case FPGA_AN511:

-- PMM
