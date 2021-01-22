Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp844974lfb;
        Fri, 22 Jan 2021 05:36:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpjUAQ5H8F4PAC3WWBwGqtn0LJpbPcRiLZYEhMxgsoUekbySPK5DZJY0VuSfIgyY1R37Uq
X-Received: by 2002:a25:5382:: with SMTP id h124mr6083636ybb.171.1611322617323;
        Fri, 22 Jan 2021 05:36:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611322617; cv=none;
        d=google.com; s=arc-20160816;
        b=RIu/88cpcZGQLkaAsODAnMaFjYn3LEr6v3vWPYLeTKkk/o8vXHALWGq6GcxkCDK8ss
         k4rXPVfQ0YGulRPWrAY0+oLyS9una60XuGQamiQxkkqdvqyS3nhMFzgya52zRaaPhA/T
         tF/LOy2NyLbTfDDewFvgDR/NDUKt7Su0VKDmQBfy3SiDXQ9W6xFzKJvPqfjgG+iuY5aT
         jajAlX5F8XpyGnrLXOjDWbadjpkhZ4uTouTUR1oFUcngdvwvSQaYz+RIFDCepoiO16Po
         Q1D5kCq0Q57oMR7JxJ6uZnQtEJVWnpQ3lbaUcvy39HcAaJjpOfMFdttYS57iN6dOddk0
         YAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kI0NtIlZ5oSUvFWDLYPUuXZw6vEMZcUV+P597q2hBjU=;
        b=ud4QUNjqAi/LPvkoy4TRP2TOq/LgOGsCgppswg+9xRz9/lMpzd9uMVRopzQZTdF6Pc
         LDDhbU89dUwGZoAo5ZMDjieRG3Aq2FyxrqCvpTnBX0SmbrChwd+/G1UUppEw2d9O/07B
         YGnXnLyV/O+WmRFA8nfX3W0V6EMmylmEO6gBZKC+h1KVmZTK1Ihs756CUZSNX4iGjBu2
         DuvVcQnMDUc/4qGeMjFGFnQsZnIKGb71WHODsCiROYN7BPzUDhOorBdrUdU5TRrFLOLm
         jCkeCZzuzGkKHNTj/+c7/MGvUsDNsCH5f5imgcV8YSCQCXg6AvvLLoGxiebRAHklraJM
         Ekzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lVTTNZPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c204si8653335yba.290.2021.01.22.05.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 05:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lVTTNZPY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2wcS-0007m5-Ec
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 08:36:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2wcI-0007iu-NA; Fri, 22 Jan 2021 08:36:46 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:44753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l2wcG-0007jI-Sw; Fri, 22 Jan 2021 08:36:46 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id x78so5435615ybe.11;
 Fri, 22 Jan 2021 05:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kI0NtIlZ5oSUvFWDLYPUuXZw6vEMZcUV+P597q2hBjU=;
 b=lVTTNZPYZA7T99wzTmlzj/CkadQ7HebpEzogO7YJkMAR1iQlgegLAq8Gv5c0dcv4Ye
 gRxpS7vcvmoOkO8bUqEOArn0UsBKhr6Mzg4a77cnQCZ6ISYj0Wc2Mh3i1Daak5D2XlGJ
 PEWjiRi/HbJle9RXAdMBVmEr0wPLnr3kQjRWkQ8oEwMJsofTcSOCFu7FcGiXB/9RY0Hq
 60TZE6s/Bvv6Ev+spRak/wrzairBDcHm55/a4dU8V9ifihWYy5U901ZdyPSoYEYKRcGb
 ycjjSKT0kw4kKdC8ESyj4amurwZ6bpbbJYbjsjdiHp6rLIhLmAiwRPwWeBwu35nBNG8P
 dBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kI0NtIlZ5oSUvFWDLYPUuXZw6vEMZcUV+P597q2hBjU=;
 b=k8x0Vh7nAZNmc0ydctchkaZTWyRh//XY3SmGzfR51sHCUozW8EpsE/6OZamEmHpQ4a
 oPrB1aWfI/PlvXlIDszKLdtzJJ7+1XTWtjC1AmhCSbdaYkzIyg8g6bHOm064HwgmyFf/
 7UdXwwu8TFogx6hxNzy/SXl1szpSZ5RmuxzesBrah/Qr4QIYrlvZBU0RP8a0IpFZzfaZ
 CLFF4rhJrd31rM9sa1Z+8k7L34wIdwtSCnM18zUvoW5iqeIXMtPp7JCwy+BueUnvhsKi
 Elwt2VwR2CknrME+J4qH5EiA56n2TxziD72RXLdeD7nl2SnZFXuW5JLrEurGt7nUezI+
 b8gw==
X-Gm-Message-State: AOAM531GL3OwCCqJ1wkfEnE9EWCz/Gr5bBz9gfd0zJ2qbV2IDFHcrLuu
 jteO+B5HOBYZzLHUHt9C96zy5wgUQ/Wi4ujfXfw=
X-Received: by 2002:a5b:5ce:: with SMTP id w14mr6347499ybp.314.1611322603595; 
 Fri, 22 Jan 2021 05:36:43 -0800 (PST)
MIME-Version: 1.0
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 22 Jan 2021 21:36:28 +0800
Message-ID: <CAEUhbmWXTdL=DU0bRNJqx--2_=qa7kLpru7PE5jK4GxZRMWU3w@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] hw/ssi: imx_spi: Fix various bugs in the imx_spi
 model
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MZxkTZzndOpF

On Tue, Jan 19, 2021 at 9:40 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> This v8 series is based on the following 2 versions:
>
> - v5 series sent from Bin
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223919
> - v7 series sent from Philippe
>   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=224612
>
> This series fixes a bunch of bugs in current implementation of the imx
> spi controller, including the following issues:
>
> - remove imx_spi_update_irq() in imx_spi_reset()
> - chip select signal was not lower down when spi controller is disabled
> - round up the tx burst length to be multiple of 8
> - transfer incorrect data when the burst length is larger than 32 bit
> - spi controller tx and rx fifo endianness is incorrect
> - remove pointless variable (s->burst_length) initialization (Philippe)
> - rework imx_spi_reset() to keep CONREG register value (Philippe)
> - rework imx_spi_read() to handle block disabled (Philippe)
> - rework imx_spi_write() to handle block disabled (Philippe)
>
> Tested with upstream U-Boot v2020.10 (polling mode) and VxWorks 7
> (interrupt mode).
>
> Changes in v8:
> - keep the controller disable logic in the ECSPI_CONREG case
>   in imx_spi_write()

Ping?
