Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp268679lfg;
        Fri, 30 Apr 2021 09:21:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxAz+lH0Xv9HavJeEnP1HnPjwJUnz3wTM28qlH2vtp6+gXAjttZgtDdPsDeA9MOy6Zew1c
X-Received: by 2002:a2e:a412:: with SMTP id p18mr4478610ljn.325.1619799660936;
        Fri, 30 Apr 2021 09:21:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619799660; cv=none;
        d=google.com; s=arc-20160816;
        b=lO0B8Ns+pgLOF2QLsgLrln+pnqjTDBk6RScZkhAe4A8YaPqBvCFLxhR/qzvxJIpMcI
         LbNyvanR9ID25yWtXjDupfJosQs36G2xxP4ukynj+thhdQE+rH4oTfPwcQm1tASaO0Z/
         hwmKeEhGz8AIFYaqNXYmIT9hLdqb0hOBPR/9hbPKCxA0UGeqk3zwY+JMUYMaDTgs0ctE
         WEN1eqYAFpOAfWESLgL15v83jksCjJxo8NehZOGPZtKH8l6s7Gxtwr6H1kH3tzziNZi3
         GJuWA+0yzqf1jnG7NJ8fa+bNg8Vhr4k8mWDk8Ag/WgMpOT9JFqdvTCV8Dne95yWeRhhV
         7KRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=9qLhgPzEKlLmZDvsfyoruIX0d0TYObEOLbIOtACJ4TY=;
        b=n0JqGXi8PmvdLPTesKHLcVjsrz77lUaA/4+8Ymmw1FDNSH/xyCjyYp/za/f8xqxnDq
         7taH8bfpnRHoQRrq+YUzsAkUfNZ6a8qMdQgW8+8QFR/bBVtV9lbAJySnLkpxlsM23IJu
         33AHsosZTFF5HhFt9hCPZLDYVxpNDWmfOfWRr6AuzMTq65sToJp/YnB9sOSAPEZRgluy
         8IryPDlKAPAjdm3oCBqoFr6L5gzJzFdZQOn29bj3RhFcCa4j+LBDr9yiGttn0tv9EDqt
         Kw6Do/IsUBs5oFN6hJkwldUpZb3NXjBCu6/rm1TaMlq7U0Wh+12lnXyt7sjG2JQAz01L
         KcoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si2959428lji.85.2021.04.30.09.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 09:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcVsx-0005F9-Fw
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 12:20:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVoN-0001Bm-70; Fri, 30 Apr 2021 12:16:17 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:39301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVoK-000197-HX; Fri, 30 Apr 2021 12:16:14 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MS1G7-1m1Yuu2vN5-00TXRR; Fri, 30 Apr 2021 18:16:03 +0200
Subject: Re: [PATCH 1/3] hw/arm: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210313171150.2122409-1-f4bug@amsat.org>
 <20210313171150.2122409-2-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <56b84f71-c916-ae47-96a5-16a0a4252122@vivier.eu>
Date: Fri, 30 Apr 2021 18:16:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210313171150.2122409-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mvNZMR3SmA6cveQYAAczFs0l3ftA7qRPirwbh8pfQxOHhmFQ9co
 MJo369Rmczaz8J+WQNp+ZI/qdtefw+t/lbDZS6oXKyMc6Ey/iaSEnlZO/ckeD8UAIASCX7N
 m7Dq4DkrhqsESn0qYaGrVBcdUU7YXVkwER54cNofkYzd6yJo5GFMZQWK0ui7uPTDL1Wjwic
 i26XT5yZRhsUFEPMlOcCg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:u/bG6jOU43M=:pij0rfiBIhbbGo8NQ9OV+o
 d9T1sHICWXPmKCYZXWKU5E1LFIKozyH8ncD4GiNwGD0iwjhBJAs0NbKBpcDapBU1A+9fdPtb8
 qlmrYq7I6fbWgr9gDck6IJh+i3ENbuoR8g+PNu0UQ9RiGnRD4czsfRlHLa4uElSn80IZw2vW6
 e+RNM7y0gfp12/lHg2IiR7U6lhImB5/7yEuSglYWoqE4TBIESIMUSOXeGo5OGt5UZhFQItt1E
 mH7eImKj9hNUoafk6NK0mb/qYXSB/6bKFVuJWoBi+Gc55sm71zWitr0cy6IMDDUHe2IFtZc6y
 SoTxe7EPWVJ+CQCWrRZOQcFIfmlk9QoIJ8wOYwy1Qz0EwcnVOr6WzYexQnev6fcszHYN0ct2y
 /N3Pg71P8ZlWk8qnDujO4Qas5cI1LNNxUcHkCzSKMBnXHWbUuxOCBjkLHmFrheNN9ot8R8gkJ
 PxwlXwK/CqnjqbdAGvUSteCXy+170FLUylGzCFlEQmSXVQKuL/Q4mHD7mW5KsI9XL34tPxxk/
 98Wj+EsgGRV9el8JLqwp4A=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fb2lJv6MzAmv

Le 13/03/2021 à 18:11, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/highbank.c   | 2 +-
>  hw/arm/pxa2xx_pic.c | 2 +-
>  hw/arm/spitz.c      | 4 ++--
>  hw/arm/strongarm.c  | 2 +-
>  hw/arm/z2.c         | 4 ++--
>  hw/dma/pxa2xx_dma.c | 4 ++--
>  hw/misc/mst_fpga.c  | 2 +-
>  7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index bf886268c57..5afdd28b35c 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -170,7 +170,7 @@ struct HighbankRegsState {
>      uint32_t regs[NUM_REGS];
>  };
>  
> -static VMStateDescription vmstate_highbank_regs = {
> +static const VMStateDescription vmstate_highbank_regs = {
>      .name = "highbank-regs",
>      .version_id = 0,
>      .minimum_version_id = 0,
> diff --git a/hw/arm/pxa2xx_pic.c b/hw/arm/pxa2xx_pic.c
> index cf6cb2a373a..ed032fed548 100644
> --- a/hw/arm/pxa2xx_pic.c
> +++ b/hw/arm/pxa2xx_pic.c
> @@ -301,7 +301,7 @@ DeviceState *pxa2xx_pic_init(hwaddr base, ARMCPU *cpu)
>      return dev;
>  }
>  
> -static VMStateDescription vmstate_pxa2xx_pic_regs = {
> +static const VMStateDescription vmstate_pxa2xx_pic_regs = {
>      .name = "pxa2xx_pic",
>      .version_id = 0,
>      .minimum_version_id = 0,
> diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
> index 6b3bf9828bc..b45a929cbd9 100644
> --- a/hw/arm/spitz.c
> +++ b/hw/arm/spitz.c
> @@ -1134,7 +1134,7 @@ static bool is_version_0(void *opaque, int version_id)
>      return version_id == 0;
>  }
>  
> -static VMStateDescription vmstate_sl_nand_info = {
> +static const VMStateDescription vmstate_sl_nand_info = {
>      .name = "sl-nand",
>      .version_id = 0,
>      .minimum_version_id = 0,
> @@ -1170,7 +1170,7 @@ static const TypeInfo sl_nand_info = {
>      .class_init    = sl_nand_class_init,
>  };
>  
> -static VMStateDescription vmstate_spitz_kbd = {
> +static const VMStateDescription vmstate_spitz_kbd = {
>      .name = "spitz-keyboard",
>      .version_id = 1,
>      .minimum_version_id = 0,
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index c7ca54bceaa..e3e3ea61634 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -207,7 +207,7 @@ static int strongarm_pic_post_load(void *opaque, int version_id)
>      return 0;
>  }
>  
> -static VMStateDescription vmstate_strongarm_pic_regs = {
> +static const VMStateDescription vmstate_strongarm_pic_regs = {
>      .name = "strongarm_pic",
>      .version_id = 0,
>      .minimum_version_id = 0,
> diff --git a/hw/arm/z2.c b/hw/arm/z2.c
> index 5099bd83802..9c1e876207b 100644
> --- a/hw/arm/z2.c
> +++ b/hw/arm/z2.c
> @@ -162,7 +162,7 @@ static void zipit_lcd_realize(SSIPeripheral *dev, Error **errp)
>      z->pos = 0;
>  }
>  
> -static VMStateDescription vmstate_zipit_lcd_state = {
> +static const VMStateDescription vmstate_zipit_lcd_state = {
>      .name = "zipit-lcd",
>      .version_id = 2,
>      .minimum_version_id = 2,
> @@ -268,7 +268,7 @@ static uint8_t aer915_recv(I2CSlave *slave)
>      return retval;
>  }
>  
> -static VMStateDescription vmstate_aer915_state = {
> +static const VMStateDescription vmstate_aer915_state = {
>      .name = "aer915",
>      .version_id = 1,
>      .minimum_version_id = 1,
> diff --git a/hw/dma/pxa2xx_dma.c b/hw/dma/pxa2xx_dma.c
> index b3707ff3de2..fa896f7edf7 100644
> --- a/hw/dma/pxa2xx_dma.c
> +++ b/hw/dma/pxa2xx_dma.c
> @@ -525,7 +525,7 @@ static bool is_version_0(void *opaque, int version_id)
>      return version_id == 0;
>  }
>  
> -static VMStateDescription vmstate_pxa2xx_dma_chan = {
> +static const VMStateDescription vmstate_pxa2xx_dma_chan = {
>      .name = "pxa2xx_dma_chan",
>      .version_id = 1,
>      .minimum_version_id = 1,
> @@ -540,7 +540,7 @@ static VMStateDescription vmstate_pxa2xx_dma_chan = {
>      },
>  };
>  
> -static VMStateDescription vmstate_pxa2xx_dma = {
> +static const VMStateDescription vmstate_pxa2xx_dma = {
>      .name = "pxa2xx_dma",
>      .version_id = 1,
>      .minimum_version_id = 0,
> diff --git a/hw/misc/mst_fpga.c b/hw/misc/mst_fpga.c
> index edfc35d5f0f..2aaadfa9668 100644
> --- a/hw/misc/mst_fpga.c
> +++ b/hw/misc/mst_fpga.c
> @@ -222,7 +222,7 @@ static void mst_fpga_init(Object *obj)
>      sysbus_init_mmio(sbd, &s->iomem);
>  }
>  
> -static VMStateDescription vmstate_mst_fpga_regs = {
> +static const VMStateDescription vmstate_mst_fpga_regs = {
>      .name = "mainstone_fpga",
>      .version_id = 0,
>      .minimum_version_id = 0,
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

