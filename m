Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp16094359lfq;
        Mon, 4 Jan 2021 19:51:46 -0800 (PST)
X-Received: by 2002:a25:4905:: with SMTP id w5mr61564043yba.498.1609818706136;
        Mon, 04 Jan 2021 19:51:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609818706; cv=none;
        d=google.com; s=arc-20160816;
        b=cY+2XRA0Dc1ivt7VE4B8ruBFOUqKGcu5LrtudKiam8OiPKmedD1yYVrlM0NDv9LQ6N
         kZLbgQpAwDNbwtcIZrEZnWRPE4j9zWUg7fwQn/em8kW5BtBN0EUGVYQwimK/oGyi81Bm
         ERX01bFuS8nTobRtZOEccrrX3m+EIh8qtuvX7+KP/2CRoXVLJx6digegcMXm74Lxs6Z9
         t86MaoXWBpWyqsgHc+IijyYYxzFPsyigxyeQxBfwzT5wFau7aQWuuzkIoItscvGw/q3r
         srAkUXElSlkR0u6RkKKHkC+rvE06qkqLUwaHtYQMUrRQDImJcL3zmEluFT673UpebQpb
         gYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7nz4pSBdnZxedE+I2ZOXRhBAJyTs41Fb/2bnB3jz19g=;
        b=k1fVh9Ta3/o6s3AfW3U36h0AO27GA61ejhLs+PEMhHBTEECA/DWbmYpYHy06zXbnmQ
         hge5l2C5F+7o3UP0e86reli841UmY6yG41mHOq3iwaDPjh9v5qvUnkbqQe468NU+M1k5
         1OEzy0FuS+NLHNGXXCmgNF5iHQRmGwiwmrIFNw1PBE7VI8hCT0brZti9nOqLF4B7JQSC
         /sftl/OuosD77tFN88+w7fWO1CLR0AbtCxkd7cDp1Z4MPK9l/ajO+E4oCz2rMaSDRa3U
         9F7m3sNPvHYotTmOVGd+qbFkbL29HlsnCVIdh8TLmqEXZjcIVPvM0Qlv3sWGcbdu30M8
         CKKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZhtwQ9g7;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s23sor15866005ybc.81.2021.01.04.19.51.45
        (Google Transport Security);
        Mon, 04 Jan 2021 19:51:46 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZhtwQ9g7;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7nz4pSBdnZxedE+I2ZOXRhBAJyTs41Fb/2bnB3jz19g=;
        b=ZhtwQ9g7QbRdkDk6VfKb37KDATaSLgEYaRC/CayKmTh6XuEEqoL6871jFUe9tFsHCL
         p3ZNFCSuFrTKeJe2/ovxW8Zkeq9fMsoybgKiQhh9p5xyOByFcCMqxsZujU7h9Yq4nK9x
         rCPkQ/W0XEnZ1BMpRAZ52iRH8yyGECQniQz7Yzs8T5ij6hWR2BT6qG+lvUeyga+ymKkc
         Bgj4pu/pFo6KCz2RkVUVnofzsKpgavYwiEFkJYaPAQp8Sbr1MOFFbXMthByVQnGvll7F
         LeMhFn6XOwxOOveVxD+NZVBs1U+72zmIzHPqJswsaJr/rEW+TD+SYpBywSFpFEI+tbEH
         dd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7nz4pSBdnZxedE+I2ZOXRhBAJyTs41Fb/2bnB3jz19g=;
        b=lORGqKnUisKSyZ7oaVUfQRgc54385rEj7XFRYL4YOWHmZ8UvPuqPrwH3bDu9AXzz8V
         lvNyY1INI7Msa09fAnUSX6fHEts6k/cNVUnrHKRFajkNp3O5iEcrlhcg+p152YONgDKm
         fsZIbaUsvN2eeyF/m9RP+6AEbds2S2BY6dP7/Z87Ei3SBV5BCKBg+5kcMwtsJAZwxbdh
         eIbC63m4qR6Id3RTAnOgDJbSirGVRnU36DSlm8gwymdzoHl5RZb1DfcNr0ePAm+0aGi/
         wBPURAnSpWQU4pjr4FE1AQa7ryjKY+VD1xtgs2YhG3VbkI/S+9gc1MNV0USrrolfJZ7a
         jOqw==
X-Gm-Message-State: AOAM532bA9kNrgWIemtJi0NVRdqi/o3IZiJTMHmiCntkEJxNyt1ba+NQ
	rNzBYUliRikOHii7pSocaA17YpQtH1wY8CqjI6Y=
X-Google-Smtp-Source: ABdhPJypV0rDKMFF0gmp3BqnsdrUG6nE31YBHZNckMvZXavpLChwHUA45Z4r3SY84KD9cfKGNUfQXsoOIZWffAEvzu8=
X-Received: by 2002:a25:e70e:: with SMTP id e14mr50592011ybh.332.1609818705824;
 Mon, 04 Jan 2021 19:51:45 -0800 (PST)
MIME-Version: 1.0
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com> <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 11:51:34 +0800
Message-ID: <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
To: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Cc: Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: pNwO3QAViELy

On Wed, Dec 23, 2020 at 2:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> U-Boot expects PMU_MISC0 register bit 7 is set (see init_bandgap()
> in arch/arm/mach-imx/mx6/soc.c) during boot. This bit indicates the
> bandgap has stabilized.
>
> With this change, the latest upstream U-Boot (v2021.01-rc3) for imx6
> sabrelite board (mx6qsabrelite_defconfig), with a slight change made
> by switching CONFIG_OF_SEPARATE to CONFIG_OF_EMBED, boots to U-Boot
> shell on QEMU with the following command:
>
> $ qemu-system-arm -M sabrelite -smp 4 -m 1G -kernel u-boot \
>     -display none -serial null -serial stdio
>
> Boot log below:
>
>   U-Boot 2021.01-rc3 (Dec 12 2020 - 17:40:02 +0800)
>
>   CPU:   Freescale i.MX?? rev1.0 at 792 MHz
>   Reset cause: POR
>   Model: Freescale i.MX6 Quad SABRE Lite Board
>   Board: SABRE Lite
>   I2C:   ready
>   DRAM:  1 GiB
>   force_idle_bus: sda=0 scl=0 sda.gp=0x5c scl.gp=0x55
>   force_idle_bus: failed to clear bus, sda=0 scl=0
>   force_idle_bus: sda=0 scl=0 sda.gp=0x6d scl.gp=0x6c
>   force_idle_bus: failed to clear bus, sda=0 scl=0
>   force_idle_bus: sda=0 scl=0 sda.gp=0xcb scl.gp=0x5
>   force_idle_bus: failed to clear bus, sda=0 scl=0
>   MMC:   FSL_SDHC: 0, FSL_SDHC: 1
>   Loading Environment from MMC... *** Warning - No block device, using default environment
>
>   In:    serial
>   Out:   serial
>   Err:   serial
>   Net:   Board Net Initialization Failed
>   No ethernet found.
>   starting USB...
>   Bus usb@2184000: usb dr_mode not found
>   USB EHCI 1.00
>   Bus usb@2184200: USB EHCI 1.00
>   scanning bus usb@2184000 for devices... 1 USB Device(s) found
>   scanning bus usb@2184200 for devices... 1 USB Device(s) found
>          scanning usb for storage devices... 0 Storage Device(s) found
>          scanning usb for ethernet devices... 0 Ethernet Device(s) found
>   Hit any key to stop autoboot:  0
>   =>
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
> (no changes since v1)
>
>  hw/misc/imx6_ccm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Ping?
