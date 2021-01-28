Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp224405lfo;
        Thu, 28 Jan 2021 05:32:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwejLAeN239/+qXaDe3hCbupEzyhxaA445J8WTXIs9Tj5Z8OCySAqdhGDffxkbgTFFtGykx
X-Received: by 2002:a05:6902:6b0:: with SMTP id j16mr21947350ybt.169.1611840761651;
        Thu, 28 Jan 2021 05:32:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611840761; cv=none;
        d=google.com; s=arc-20160816;
        b=c8DutLwtrAfKGqOeQsey8ZFUs+yp5haTTfKQpgY+eJG63cS7TWfO+gAE7BlimuiWy8
         ahaJsOx/IWh5elGYlNWgDv64NTcg3F0evYuZE73+Ze886IbpLGSHXcf0C0sGpHDN0s8K
         ++hMMzRJwbZ+CPJbVLdjzwZL333z2s9yaj57ZjecgQ6vMrllwwximOt/ZPk3Lrhj0nhw
         1LUjG4ZUfZ8fNPt3U95znNu4R1H8S24W6P3ufYdAjSGU6WFRA4khpS5OGOga/xah/BYg
         M6RgU13SEDNdIsja4LwnRr+9tGuHkVbfH15yKoys62Tt2Zej5vBJvV7rKDjlfyd4aY4o
         WfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VCbuhUgseEdIad8g+kRBzhDOBtgRomK/CWVMXG9z46I=;
        b=I/EC0jIK3W/qsETvJDsjiQ2frSfRWf+xhLpwuJNZOQFpw6TrgLUaBoOQYHQh1h5d9B
         9cZNN/O6vMxBnM28CYcz23l0Na/e4jDOA7vLB8I8RnMo1UCrcHlKZ1iZoLC3o8qy7kKb
         ZhMzCSyLlqsB30LOpm5gBqO8hE9EhJZJ54W4jQyMpk1zNjQWVslWochhzARBmaq+d4AJ
         ArMzjJW+NuoI0d7coRH/511fbrW23Prh0uykNra3ePzZldElxTou/mg3gqfVhyq6CyJu
         rBu0Jf19ZF0JjpPWr8lyNgDe5MpKkNBA3yThuUwnEB35LWCy5tR7SPU8ADhlGiGcgniR
         oZLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZHCuhA1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e128si934735ybc.362.2021.01.28.05.32.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 05:32:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ZHCuhA1p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l57Pd-0008Uw-24
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 08:32:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57PK-0008TT-7h
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:32:26 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l57PH-000139-Cn
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 08:32:22 -0500
Received: by mail-ed1-x52d.google.com with SMTP id n6so6592661edt.10
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 05:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VCbuhUgseEdIad8g+kRBzhDOBtgRomK/CWVMXG9z46I=;
 b=ZHCuhA1pfHPUhmCrOZ8pZbPZJA4a31dvwGvdo+Vp3bXo04SyWV0SW1fIhzkqoICYNN
 Tk0C7E0nt+dTnzkLLhWUSV0k8yQsIVkDjCc6VgAPT4jBeRyJQVoH+Dppih+s+tN2D+XI
 FHTifIVbtS6HzEfQZ/iqV7gjfCkDQMvY7ep4TZOzsmOudq6oH3wwpVljRIL7ZKimdLE5
 2XsbW9Sr0RVBQL98sVsy0HPHR0iM6Z0Gp6S6e7/n7fxRT1sLaAruBW2RCOmvPbbeo6RI
 VrJCFjtvPD6GQIsvh7JGoqPV1QRJfrv0aZu3elqFOKLredqLsgmgmfKq6NrlWe6mRjPa
 w96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VCbuhUgseEdIad8g+kRBzhDOBtgRomK/CWVMXG9z46I=;
 b=Zb35uxKsZDiSq9P5PDUqkmQEC6aR6haXEtcltLbuJwK/9n0LUgbopH4Pem/UY8KoMm
 WzvNTj9PJ1hLYtLnb44Ms5zy5+skjKI5tV6+33rKIDDHODrNrTE8avkGSBC/wpVAgGTf
 eWWE0SplkGMkSLhCDFBBBZ1Gm/QQReWMmWg2VIeyXKJXJFeH3j2ZKeJsNIDwuwtKxTHa
 Fnq/ELyNF2pR0xF6ME9337XaroMH+bM7CLsPfxHXQOMPnDjBPS81UcKzLUb6cRQ1Oac5
 gTQBlhbvO1eRdHlS2eH8J3gPSXMhbAwkLtgLUYvIgy22XUiRbZguboeFVz8rfKsz5sfO
 tc8g==
X-Gm-Message-State: AOAM530k6q5JonD2JwvmBXg7uM6VJzYEhX8hixyokO0EWOHzDOsBihAO
 BoXZxl3PLpN7Y6hjlxy57lUgrRcrhDCDD7DBbV48Jw==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr13117066edd.100.1611840737400; 
 Thu, 28 Jan 2021 05:32:17 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
 <1611063546-20278-11-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-11-git-send-email-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 13:32:06 +0000
Message-ID: <CAFEAcA9Dr5Wkd0KSvieX+smcGg51DNvt+DhBxibnNDGNHSsCtg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] hw/ssi: imx_spi: Correct tx and rx fifo
 endianness
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b0PG1Abzuv8p

On Tue, 19 Jan 2021 at 13:40, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> The endianness of data exchange between tx and rx fifo is incorrect.
> Earlier bytes are supposed to show up on MSB and later bytes on LSB,
> ie: in big endian. The manual does not explicitly say this, but the
> U-Boot and Linux driver codes have a swap on the data transferred
> to tx fifo and from rx fifo.
>
> With this change, U-Boot read from / write to SPI flash tests pass.
>
>   => sf test 1ff000 1000
>   SPI flash test:
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
>   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
>   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
>   Test passed
>   0 erase: 0 ticks, 4096000 KiB/s 32768.000 Mbps
>   1 check: 3 ticks, 1333 KiB/s 10.664 Mbps
>   2 write: 235 ticks, 17 KiB/s 0.136 Mbps
>   3 read: 2 ticks, 2000 KiB/s 16.000 Mbps
>
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
