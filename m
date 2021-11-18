Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp744366lfk;
        Thu, 18 Nov 2021 06:47:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8393bYOZo1VMpKwA2wVnjzn5S6tFmlpykzAIb6+jHW/p3fIdIatNkd2ltTRCQs7FSmh5Z
X-Received: by 2002:ab0:4911:: with SMTP id z17mr37040521uac.91.1637246829453;
        Thu, 18 Nov 2021 06:47:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637246829; cv=none;
        d=google.com; s=arc-20160816;
        b=L3/cgV853LlTOWfXlsZFdPmz9/6ULVFPRy7yba4y10DaFKafh5lXHFuzjPcUgZtV54
         Vmh7Qu7fxlqkpqFTKNFY1B/hlhJYq5af3Eak2HFYjIPSv/sn//6cd36RS3YU5jkKVK4h
         6G2HZdU9lVFGBMLk7yjjw18zb9phPODmMM5hu5E/sD1xgM/Zac4ESI17jtUklhMFAAgM
         v1shVSD7OJT1Pr4paQZOrpoovgwNrfQLlCM8ByNvoq/+O+5lmW+ap9cRML/s660ZrSGY
         4l0VpHuTjjp3fJvkpuLz6sbtmouCSrJAEDvM/HUGeKPJCJAYjEfe5UjOYczDhW+QtiaW
         l3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=UxG+bFOx6b8BiO1xXMvbeK8M/d4QJqt1mVZxDhjMHAE=;
        b=tntLYUFqfoyb0Lr/wDRwYQJWPvVaXg9fjj3CegHspfYGiOc7wkcxcLg3LXLvu5j0uv
         Dul9oNBPL6HVzsNqJUjDK0jKtUeGMK4G7cuxesH9dLFGHVp7edehbrXwoPzSPYOqijkC
         wEbgPAV3ZsCQjYJ74bBe+c3hanGP+G6YowbXbZyTkK//2wImTT04tKb2EQDEQJVGwVON
         le7U/vJC4q21pJFr1nfaQp5ZYrRpQJqJxk/xqdocrsb2WEJCVgnfdOWH86DWvp8vTL5b
         871Z0GEfq8DZI4UoyPKpDRDfTyN1UBrBLkjPgs38PbRDS4fwaqI15jy3ihzCTBvUUoCe
         rcyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=UJSj8ysB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si8393640vsi.165.2021.11.18.06.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Nov 2021 06:47:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=UJSj8ysB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnigu-0002om-8y
	for alex.bennee@linaro.org; Thu, 18 Nov 2021 09:47:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigV-0002jy-Mg; Thu, 18 Nov 2021 09:46:44 -0500
Received: from [2a00:1450:4864:20::134] (port=38818
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigT-0006Fz-5g; Thu, 18 Nov 2021 09:46:42 -0500
Received: by mail-lf1-x134.google.com with SMTP id bi37so27197040lfb.5;
 Thu, 18 Nov 2021 06:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UxG+bFOx6b8BiO1xXMvbeK8M/d4QJqt1mVZxDhjMHAE=;
 b=UJSj8ysByz+UKhlse4zpxxizbspnRp86bJZ4V7OyNPVJHDbN4s8WzWd6wl/4Xnk2f9
 Lh8ZehEZMM8cNDVXFswnfi6Y6UKNUqCJ7vE0Yt4v/8MyEeFHReEBq24+Yi/k9zugaECf
 bdWOJJYb6uzos8f4M1yAmuXFseOII3gdGqkP9VVI9Ci1p19QelK6usvRug4c0MNiMr0Y
 GJW7Y3PjtWS9VNp8GymqNeSlqOzvNiZXMRiinlhfMhoaB/zqSaRqDNv7Hn8cWFEyqhRW
 SWqUJTlUmcn1d22vZArtxKhp5jBBYJZsMMrZbR+QKTh3ieOvsXpEQjab9tLYZCYZxoMJ
 MWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UxG+bFOx6b8BiO1xXMvbeK8M/d4QJqt1mVZxDhjMHAE=;
 b=KFNEwe563faBlDp5bHEyvwywDf/5K9gh/7UIZgopZEz85cltcRw8aYk0QIGiedvRb6
 73swY0PWFFDSkRRHasMCSfWoUc8qvYLWQ+x12UuE+qEqcmjR4hqQmRJN+E69S0GF0L05
 JPqSDmL1yZfpCP4EA7dtAdHmK1lNpyxdd06N8sMU6caJIz/q0bZIKhEbzhWn0BRrGMc5
 MUKkzuy+w1fpYhz47U1vimgwGOWgOcLoGoMvmzNmlGboeJ2DDKPCc0aZI8l8katkqdrm
 q8b6i8d/C99EqQYw4BP3LzfoAoEp7Pxwp7T7X7kOscXsgAi8a1K1mBXnA6cim5gcPkNA
 xDsQ==
X-Gm-Message-State: AOAM533qolGeLK1h+1eyiyA/2G1K+2OqiwkcdXnxZY7WF19Haa1ydBC9
 SCt5hdVlmMJWkv2ivyUdSHW2ope/G154aQ==
X-Received: by 2002:a2e:95cb:: with SMTP id y11mr17434858ljh.461.1637246798711; 
 Thu, 18 Nov 2021 06:46:38 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id x27sm8857lfq.33.2021.11.18.06.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:46:38 -0800 (PST)
Date: Thu, 18 Nov 2021 15:46:37 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 11/13] hw/arm/xilinx_zynq: Replace drive_get_next() by
 drive_get()
Message-ID: <20211118144637.GP3586016@toto>
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-12-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117163409.3587705-12-armbru@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x134.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CO4gbHmolO2x

On Wed, Nov 17, 2021 at 05:34:07PM +0100, Markus Armbruster wrote:
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
> 
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
> 
> Machine "xlnx-zcu102" connects backends with drive_get_next() in two
> counting loops, one of them in a helper function.  Change it to use
> drive_get() directly.  This makes the unit numbers explicit in the
> code.


Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/xilinx_zynq.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 69c333e91b..50e7268396 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -125,9 +125,10 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
>      sysbus_connect_irq(s, 0, irq);
>  }
>  
> -static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
> -                                         bool is_qspi)
> +static inline int zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
> +                                        bool is_qspi, int unit0)
>  {
> +    int unit = unit0;
>      DeviceState *dev;
>      SysBusDevice *busdev;
>      SSIBus *spi;
> @@ -156,7 +157,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>          spi = (SSIBus *)qdev_get_child_bus(dev, bus_name);
>  
>          for (j = 0; j < num_ss; ++j) {
> -            DriveInfo *dinfo = drive_get_next(IF_MTD);
> +            DriveInfo *dinfo = drive_get(IF_MTD, 0, unit++);
>              flash_dev = qdev_new("n25q128");
>              if (dinfo) {
>                  qdev_prop_set_drive_err(flash_dev, "drive",
> @@ -170,6 +171,7 @@ static inline void zynq_init_spi_flashes(uint32_t base_addr, qemu_irq irq,
>          }
>      }
>  
> +    return unit;
>  }
>  
>  static void zynq_init(MachineState *machine)
> @@ -247,9 +249,9 @@ static void zynq_init(MachineState *machine)
>          pic[n] = qdev_get_gpio_in(dev, n);
>      }
>  
> -    zynq_init_spi_flashes(0xE0006000, pic[58-IRQ_OFFSET], false);
> -    zynq_init_spi_flashes(0xE0007000, pic[81-IRQ_OFFSET], false);
> -    zynq_init_spi_flashes(0xE000D000, pic[51-IRQ_OFFSET], true);
> +    n = zynq_init_spi_flashes(0xE0006000, pic[58 - IRQ_OFFSET], false, 0);
> +    n = zynq_init_spi_flashes(0xE0007000, pic[81 - IRQ_OFFSET], false, n);
> +    n = zynq_init_spi_flashes(0xE000D000, pic[51 - IRQ_OFFSET], true, n);
>  
>      sysbus_create_simple(TYPE_CHIPIDEA, 0xE0002000, pic[53 - IRQ_OFFSET]);
>      sysbus_create_simple(TYPE_CHIPIDEA, 0xE0003000, pic[76 - IRQ_OFFSET]);
> @@ -298,7 +300,7 @@ static void zynq_init(MachineState *machine)
>          sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, hci_addr);
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, pic[hci_irq - IRQ_OFFSET]);
>  
> -        di = drive_get_next(IF_SD);
> +        di = drive_get(IF_SD, 0, n);
>          blk = di ? blk_by_legacy_dinfo(di) : NULL;
>          carddev = qdev_new(TYPE_SD_CARD);
>          qdev_prop_set_drive_err(carddev, "drive", blk, &error_fatal);
> -- 
> 2.31.1
> 
