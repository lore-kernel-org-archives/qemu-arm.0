Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2870069lfg;
        Mon, 10 May 2021 04:29:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2NPu77ljs5cZDeJO3Fzz4TNvdWqnZ6PfWNLY99PPkwmenxnbLXpwiC7skH0s7I+FCYPPW
X-Received: by 2002:a67:f60e:: with SMTP id k14mr19235463vso.48.1620646176204;
        Mon, 10 May 2021 04:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620646176; cv=none;
        d=google.com; s=arc-20160816;
        b=aHa34e3eTB5zVusRbW5AwPRXcf5Xr/oR19xjySQK4Ydwje3PgnrGixsI7wzr4ArjUU
         6MQQqnTeKmnKz90pGykpOO6FtsKCuqCmS4EY8lLHc3P7IB5wFOxjZDwk5qY6R0It3IVm
         F/sARatu3CAIR6cZPoxUUS/hnVFPRV3gr19JG4WaAOMGdpppAT6apWM+Buh3QtHvOF2R
         tnRWYUgeXcmFNwAojFNEMQc9f1vdoQtXfYS/8wxe2jxT2F4NZM9+iVL8v7t4GDRJL5aN
         Y/xtVIvGDhes7JWn6pfyu6tt4jMv5HSJFGZhQmSleGEWO5dWh4qJrXT7qjNbgZZ9iHPY
         NhLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VmX3Sy/J15+xG8+KHEQPLUJrduTufuVYZC9fYZEzTeQ=;
        b=Qto5MU+Lg7BwDG3IYJk7o3bKN19aeKN/dOhN2ZQHBEfSNaqB8VShySZec7uhGFEH6y
         Xhnn9a3P9lvumA5Es126n/CyVbDvRP+B7+G09iYe6zrpGeHj1wG2seyHcTyGtZa9L2tr
         9QP9UXspw5IJKcNzx+pSfSeSlbUBgoK2kCPwHDjw8Drpgo76h4+oGaY+cU9GWroD8KA/
         +H4+OhWGTrK6+C9YMeD84Rb3bIRcNtO3jI5EiXAYW6/j7Ax71HLuwolBoVwFjsKWRLBa
         wS68B8kKQTK2o7WiU++fHmYxj8SlXEbzuAXxC/+Vh/5WiXIEhk2ITW/sWzUtVBWJyAjn
         zO/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eaoNvTkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a13si5779325vsl.272.2021.05.10.04.29.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 04:29:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eaoNvTkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lg46R-0004VG-JA
	for alex.bennee@linaro.org; Mon, 10 May 2021 07:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg455-0002Of-3D
 for qemu-arm@nongnu.org; Mon, 10 May 2021 07:28:12 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lg453-0003PI-Cr
 for qemu-arm@nongnu.org; Mon, 10 May 2021 07:28:10 -0400
Received: by mail-ed1-x534.google.com with SMTP id bf4so18267419edb.11
 for <qemu-arm@nongnu.org>; Mon, 10 May 2021 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VmX3Sy/J15+xG8+KHEQPLUJrduTufuVYZC9fYZEzTeQ=;
 b=eaoNvTkr1AJZl6hfC1y+E7zDUXV4SsSU9RGaMvpVh/YmWgZ2DQ3STomhgB0oAQq79O
 nw2crWeNpjrOjKAC3l/8F+27ZKyBmbDQ9pQoMfKdw8mSBkNkKJOjWkt19liaADtpsN6a
 DFtc8+gm5jc4HuCk3t+qWo/BXE+vzmU517zO85WomqSDv5hLnSxn7o1HxcGZMbQ9PqaE
 gJkWsqTZwnjSsBLGx4v767f/XLTEIBZtVWgEfaIdPU4lX4K9EF2+i2Nt3FroAivLNsUQ
 WobKLg9KVkyBn59Fg+qjpjWblXKMSx+nWTagthKUQ2ZUinNEZ5RKjGUlmIHZg4v+yk2j
 uw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VmX3Sy/J15+xG8+KHEQPLUJrduTufuVYZC9fYZEzTeQ=;
 b=B/yeUMpzonaq64D43BOgbddX8bui8nGGRK/vcg6XU4lT2PWrqrE6sdrhDaOAdjZTjm
 tDQtbeHvQapcMPXuNU7RMmlu0nsotph5+qyZauGzaiux12h1sv6N5q7RhTUGWrGwrE/A
 TDNw5joqfj/spLaTPrfEfRxA4qHcogZ55E230SWs08X92cO8ORF+reMz80lVyzJnWSBt
 xlCdsjznSRtzoMfXPDPDRbFS4x1vkBtGP/b2jOlgYUO8rPJZqa5ltIA7jY8xhJRrC69S
 Kzn5Uu7iop5oyxWZKv8nL7GDlEX51GB/c64VHFc8NTaDKw8avu1Y0VlxetwlUkX7j+Do
 TT0A==
X-Gm-Message-State: AOAM530YZv1YZoQBhHOqtr0DkKCU2ZLZDMTRIDhUBJk5OzUkOtzdW1cX
 zNXEjPU6pgx/iDTBmJ4uDc4pt/lruEI/aFjGfJZyww==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr28541016edd.251.1620646087790; 
 Mon, 10 May 2021 04:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210504124140.1100346-1-linux@roeck-us.net>
In-Reply-To: <20210504124140.1100346-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 May 2021 12:26:56 +0100
Message-ID: <CAFEAcA-AVo4YNx1kj5YZct0M2kz4_P+fcdCMTbncV+DFwYYxsA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xlnx: Fix PHY address for xilinx-zynq-a9
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CMlq0+9F3mMB

On Tue, 4 May 2021 at 13:41, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit dfc388797cc4 ("hw/arm: xlnx: Set all boards' GEM 'phy-addr'
> property value to 23") configured the PHY address for xilinx-zynq-a9
> to 23. When trying to boot xilinx-zynq-a9 with zynq-zc702.dtb or
> zynq-zc706.dtb, this results in the following error message when
> trying to use the Ethernet interface.
>
> macb e000b000.ethernet eth0: Could not attach PHY (-19)
>
> The devicetree files for ZC702 and ZC706 configure PHY address 7. The
> documentation for the ZC702 and ZC706 evaluation boards suggest that the
> PHY address is 7, not 23. Other boards use PHY address 0, 1, 3, or 7.
> I was unable to find a documentation or a devicetree file suggesting
> or using PHY address 23. The Ethernet interface starts working with
> zynq-zc702.dtb and zynq-zc706.dtb when setting the PHY address to 7,
> so let's use it.
>
> Cc: Bin Meng <bin.meng@windriver.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/xilinx_zynq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 8db6cfd47f..5ac0294f9e 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -119,7 +119,7 @@ static void gem_init(NICInfo *nd, uint32_t base, qemu_irq irq)
>          qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
>          qdev_set_nic_properties(dev, nd);
>      }
> -    object_property_set_int(OBJECT(dev), "phy-addr", 23, &error_abort);
> +    object_property_set_int(OBJECT(dev), "phy-addr", 7, &error_abort);
>      s = SYS_BUS_DEVICE(dev);
>      sysbus_realize_and_unref(s, &error_fatal);
>      sysbus_mmio_map(s, 0, base);
> --
> 2.25.1



Applied to target-arm.next, thanks.

-- PMM
