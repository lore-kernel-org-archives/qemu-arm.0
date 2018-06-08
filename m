Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp383356wrq;
        Thu, 7 Jun 2018 20:45:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJGDo6231icyPlDg4VaxZZu8xKneSyXTmO3YflrCc8IUotjfnYLNAc/N+C4Ua9jUCyhttBz
X-Received: by 2002:ac8:1a94:: with SMTP id x20-v6mr4519626qtj.60.1528429510460;
        Thu, 07 Jun 2018 20:45:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528429510; cv=none;
        d=google.com; s=arc-20160816;
        b=v7yhXwAFtt7C3LViLoT5Zq9ttmsr70zmja376YWChYvhN87pGnRQO5to9iNhCorlSM
         fzpuwWi5k1ayzq2C/7nrkOpNdvxcarnlj77LFRyoyxka/tuMidRsV30jHfngnmkZKtiD
         uM2Po+KBiiUDq3WQ7B4zkGIPcWXTPNGrUOqzWk9OF6LUF5C93Wc9w4UGEA+2Pn9ZBcpp
         9T60gYYdwjw97mGQAtW+SC6Eb1LYfKv+yyU8Hsp+Xh9sKF6t1S78TkiSsJTx7fVYxgTH
         UB1GYnxWfpryPm1ERHaMijkysfOJ+lSINY0PEvOz5YxOqwSAcIN6rvnTLxYKbIw9IVoU
         wakQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=p5DuqgKm8Pao/en3sS7Y81zjVl9kVgLOUhuZ9XIqogc=;
        b=QbTMmeiwDNxrX1gC8/aVASZYV+3FicG6rxMpnv/ssCyVkvsx8bjuus+crY2FTrdaHN
         TXkmNteZ7RwyV61btQdwFT8rkDiD5uRMCV7xRMJLQOdvT3O2R9HBl/xuEFulFLyifeJO
         MoLVN7NkHTXFb2Ehy0/PpqZ8Pf3Zg57MPJLUkoUcDD7UAkucmKwYqCK8uQH9fICs0aci
         ieh1vKkSzfBV1yBwvaI7yyJRJvKWIrP82OJFyBXw6+y2yXjZZHBA4zhozdRFsGD4t4+m
         Go56onZoa43A8utf69Y7HYgJl7QygCR4D+Pvps5qc8mA0DCCD62gQzIKccCWhP0uLGrH
         Y0Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jcHxni32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r68-v6si12826835qki.213.2018.06.07.20.45.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 20:45:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jcHxni32;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32889 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fR8Kr-0000gY-W9
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 23:45:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fR8Ki-0000cH-Fi
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 23:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fR8Kg-0003p1-2C
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 23:45:00 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34338)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fR8Ka-0003nb-FZ; Thu, 07 Jun 2018 23:44:52 -0400
Received: by mail-qt0-x244.google.com with SMTP id d3-v6so12194857qto.1;
	Thu, 07 Jun 2018 20:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:openpgp:cc:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=p5DuqgKm8Pao/en3sS7Y81zjVl9kVgLOUhuZ9XIqogc=;
	b=jcHxni32l6I3ASZgF3rV6vXTRD+fmbhGYKJNVvxQS6e0Tv65WlXaeVM3qNyc0RqO6g
	wpppfFoLq6BVObwOHfDORjI+hoMhd/MdBndmqNs4m0sCu1WFmVj6PCZe/a59E3gsSgS4
	/obuv9IITiyArf13uJGadPFMxuGINk/hsOejmhYMtrVYSZw3CcLlg9cDQGPRgA5lAzQG
	kVYanlZNcd/VdsJ2nhC0uBw1wchsCt8RN2b0gC3n2ujOi02mbGXq4epnYRblqQNdKsv7
	XvAooIdOhdnDJyHFo3mQDSV0eiZNSfoJlSKPEkNtfNZ1D0CRVVVe1GxxxA+6HFHbPlU0
	EZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:openpgp:cc
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=p5DuqgKm8Pao/en3sS7Y81zjVl9kVgLOUhuZ9XIqogc=;
	b=f+Z1axXLKg0tgKSZjlY9S4JdwochJHr8+wg0fT2pbOc7g04ZhvThpZpVDO2EPK1NOh
	Zup4pOD+i4Oyqxqm0HjcMWk0hf2AsmZrrNkffm3dZkNqJr1PvG8zvN27KSsxpSja5Ojw
	XLpDUr9WWL0O9TD0ZlXLx4OchgP+Eo4znCnjQUogku8Q1cmGDJS2LNi+7IgYtBNg7dOa
	+CBBqiqFdxIPTqCTf+INv3Cn7YZZ3EyYwiMmTvBFmmrCrFETgkyvB64M+luWtr71cUqD
	Gs21EhDHG0K3ecCVFaUuQQu/ZOmfxs7Tg24+ujBsnMAFcgubZ2HGH1oUGjqxZhJAYbND
	dRWg==
X-Gm-Message-State: APt69E23e2GdZVsX8fOfSdYw+W6mtmk6SmgsMFSctFsLV9dqhqbKFaOm
	eS7m7/5IzaopEWxNJFkARjQ=
X-Received: by 2002:ac8:7391:: with SMTP id
	t17-v6mr4466389qtp.329.1528429491576; 
	Thu, 07 Jun 2018 20:44:51 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	y128-v6sm10822785qkc.1.2018.06.07.20.44.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 20:44:51 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1515506513-31961-1-git-send-email-peter.maydell@linaro.org>
	<1515506513-31961-5-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <92c12802-3cd5-48ef-ac9e-555946cb1d5c@amsat.org>
Date: Fri, 8 Jun 2018 00:44:47 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1515506513-31961-5-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 4/4] hw/sd/omap_mmc: Reset SD card on
 controller reset
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MRz2Y/03PsLn

Hi Peter,

On 01/09/2018 11:01 AM, Peter Maydell wrote:
> Since omap_mmc is still using the legacy SD card API, the SD
> card created by sd_init() is not plugged into any bus. This
> means that the controller has to reset it manually.
> 
> Failing to do this mostly didn't affect the guest since the
> guest typically does a programmed SD card reset as part of
> its SD controller driver initialization, but would mean that
> migration fails because it's only in sd_reset() that we
> set up the wpgrps_size field.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This one isn't cc-stable because the OMAP boards don't
> support migration at all anyway, being un-QOMified.
> ---
>  hw/sd/omap_mmc.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index e934cd3..5b47cad 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -305,6 +305,12 @@ void omap_mmc_reset(struct omap_mmc_s *host)
>      host->cdet_enable = 0;
>      qemu_set_irq(host->coverswitch, host->cdet_state);
>      host->clkdiv = 0;
> +
> +    /* Since we're still using the legacy SD API the card is not plugged
> +     * into any bus, and we must reset it manually. When omap_mmc is
> +     * QOMified this must move into the QOM reset function.
> +     */
> +    device_reset(DEVICE(host->card));
>  }
>  
>  static uint64_t omap_mmc_read(void *opaque, hwaddr offset,
> @@ -587,8 +593,6 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
>      s->lines = 1;	/* TODO: needs to be settable per-board */
>      s->rev = 1;
>  
> -    omap_mmc_reset(s);
> -
>      memory_region_init_io(&s->iomem, NULL, &omap_mmc_ops, s, "omap.mmc", 0x800);
>      memory_region_add_subregion(sysmem, base, &s->iomem);
>  
> @@ -598,6 +602,8 @@ struct omap_mmc_s *omap_mmc_init(hwaddr base,
>          exit(1);
>      }
>  
> +    omap_mmc_reset(s);
> +
>      return s;
>  }
>  
> @@ -613,8 +619,6 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
>      s->lines = 4;
>      s->rev = 2;
>  
> -    omap_mmc_reset(s);
> -
>      memory_region_init_io(&s->iomem, NULL, &omap_mmc_ops, s, "omap.mmc",
>                            omap_l4_region_size(ta, 0));
>      omap_l4_attach(ta, 0, &s->iomem);
> @@ -628,6 +632,8 @@ struct omap_mmc_s *omap2_mmc_init(struct omap_target_agent_s *ta,
>      s->cdet = qemu_allocate_irq(omap_mmc_cover_cb, s, 0);
>      sd_set_cb(s->card, NULL, s->cdet);
>  
> +    omap_mmc_reset(s);
> +
>      return s;
>  }

This patch broke something in the Nokia N810 tablet.

I used your image:

http://people.linaro.org/~peter.maydell/n8x0-images.tgz

    ecd219f7abbc17b9d9170206410355bba287831f is the first bad commit
    commit ecd219f7abbc17b9d9170206410355bba287831f
    Author: Peter Maydell <peter.maydell@linaro.org>
    Date:   Tue Jan 16 13:28:13 2018 +0000

        hw/sd/omap_mmc: Reset SD card on controller reset

        Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
        Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
        Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Using: -append "console=ttyS1"

Before:

[    1.239471] mmci-omap mmci-omap.0: command timeout (CMD52)
[    1.240356] mmci-omap mmci-omap.0: command timeout (CMD52)
[    1.253967] mmci-omap mmci-omap.0: command timeout (CMD5)
[    1.254364] mmci-omap mmci-omap.0: command timeout (CMD5)
[    1.254730] mmci-omap mmci-omap.0: command timeout (CMD5)
[    1.255096] mmci-omap mmci-omap.0: command timeout (CMD5)
omap_dma4_write: Read-only register 0x000034
omap_dma4_write: Read-only register 0x000038
omap_dma4_write: Read-only register 0x00003c
omap_dma4_write: Read-only register 0x000040
omap_dma4_write: Read-only register 0x000038
[    1.263275] mmc0: host does not support reading read-only switch.
assuming write-enable.
[    1.264038] mmc0: new SDHC card at address 4567
omap_uart_read: Bad register 0x000034
omap_uart_write: Bad register 0x000034
omap_uart_read: Bad register 0x000034
omap_uart_write: Bad register 0x000034
[    1.327514] Waiting for root device /dev/mmcblk0p1...
[    1.329925] mmcblk0: mmc0:4567 QEMU! 1.81 GiB
[    1.333831]  mmcblk0:omap_dma4_write: Read-only register 0x000038
 p1 p2
[    1.425537] mmci-omap mmci-omap.0: command timeout (CMD52)
[    1.426727] mmci-omap mmci-omap.0: command timeout (CMD52)
omap_dma4_write: Read-only register 0x000038
[    1.478668] mmci-omap mmci-omap.0: command timeout (CMD8)
omap_dma4_write: Read-only register 0x000038
omap_dma4_write: Read-only register 0x000038
[    1.484436] mmci-omap mmci-omap.0: command timeout (CMD5)
[    1.485015] mmci-omap mmci-omap.0: command timeout (CMD5)
[    1.485595] mmci-omap mmci-omap.0: command timeout (CMD5)
[    1.486022] mmci-omap mmci-omap.0: command timeout (CMD5)
[    1.486480] mmci-omap mmci-omap.0: command timeout (CMD55)
[    1.487030] mmci-omap mmci-omap.0: command timeout (CMD55)
omap_dma4_write: Read-only register 0x000038
[    1.490600] EXT3-fs (mmcblk0p1): recovery required on readonly filesystem
[    1.491149] EXT3-fs (mmcblk0p1): write access will be enabled during
recovery
omap_dma4_write: Read-only register 0x000038
[    1.498779] mmci-omap mmci-omap.0: command timeout (CMD55)
[    1.499359] mmci-omap mmci-omap.0: command timeout (CMD55)
[    1.499908] mmci-omap mmci-omap.0: command timeout (CMD1)
[    1.502319] EXT3-fs: barriers not enabled
omap_dma4_write: Read-only register 0x000038
[    1.633636] EXT3-fs (mmcblk0p1): recovery complete
omap_dma4_write: Read-only register 0x000034
omap_dma4_write: Read-only register 0x000038
omap_dma4_write: Read-only register 0x00003c
omap_dma4_write: Read-only register 0x000040
omap_dma4_write: Read-only register 0x000034
omap_dma4_write: Read-only register 0x000038
omap_dma4_write: Read-only register 0x00003c
omap_dma4_write: Read-only register 0x000040
omap_dma4_write: Read-only register 0x000038
[    1.639495] kjournald starting.  Commit interval 5 seconds
[    1.641113] EXT3-fs (mmcblk0p1): mounted filesystem with writeback
data mode
[    1.645233] VFS: Mounted root (ext3 filesystem) readonly on device 179:1.

After:

omap_dma4_write: Read-only register 0x000034
omap_dma4_write: Read-only register 0x000038
omap_dma4_write: Read-only register 0x00003c
omap_dma4_write: Read-only register 0x000040
omap_dma4_write: Read-only register 0x000038
[    1.733459] mmc0: host does not support reading read-only switch.
assuming write-enable.
[    1.736083] mmc0: new SDHC card at address 4567
[    1.738494] Power Management for OMAP2 initializing
[    1.740753] PRCM revision 1.0
omap_prcm_write: Read-only register 0x0002c8
omap_prcm_write: Read-only register 0x0002c8
omap_prcm_write: Read-only register 0x0002c8
omap_prcm_read: Bad register 0x000048
omap_prcm_write: Bad register 0x000048
omap_prcm_read: Bad register 0x000048
omap_prcm_write: Bad register 0x000048
omap_prcm_read: Bad register 0x0004c8
omap_prcm_write: Bad register 0x0004c8
omap_prcm_write: Read-only register 0x0002c8
omap_prcm_read: Bad register 0x0004c8
omap_prcm_write: Bad register 0x0004c8
omap_prcm_write: Bad register 0x000030
[    1.744873] VFP support v0.3: implementor 41 architecture 1 part 20
variant b rev 4
[    1.795288] mmcblk0: mmc0:4567 QEMU! 1.81 GiB
[    1.802581]  mmcblk0:omap_dma4_write: Read-only register 0x000038
 p1 p2
omap_uart_read: Bad register 0x000034
omap_uart_write: Bad register 0x000034
omap_uart_read: Bad register 0x000034
omap_uart_write: Bad register 0x000034
[    1.867645] VFS: Cannot open root device "(null)" or unknown-block(0,0)
[    1.870056] Please append a correct "root=" boot option; here are the
available partitions:
[    1.874938] 1f00             128 mtdblock0 (driver?)
[    1.877746] 1f01             384 mtdblock1 (driver?)
[    1.880340] 1f02            2048 mtdblock2 (driver?)
[    1.882629] 1f03            4096 mtdblock3 (driver?)
[    1.884887] 1f04          255488 mtdblock4 (driver?)
[    1.887207] b300         1900544 mmcblk0 driver: mmcblk
[    1.889526]   b301         1562480 mmcblk0p1
[    1.891723]   b302          249984 mmcblk0p2
[    1.894165] Kernel panic - not syncing: VFS: Unable to mount root fs
on unknown-block(0,0)
[    1.897583] [<c002fa1c>] (unwind_backtrace+0x0/0xf0) from
[<c02b7938>] (panic+0x5c/0xe0)
[    1.900177] [<c02b7938>] (panic+0x5c/0xe0) from [<c0009054>]
(mount_block_root+0x258/0x2a8)
[    1.903137] [<c0009054>] (mount_block_root+0x258/0x2a8) from
[<c0009268>] (prepare_namespace+0x160/0x1c4)
[    1.909240] [<c0009268>] (prepare_namespace+0x160/0x1c4) from
[<c0008600>] (kernel_init+0x120/0x168)
[    1.914886] [<c0008600>] (kernel_init+0x120/0x168) from [<c002af04>]
(kernel_thread_exit+0x0/0x8)
omap_dma4_write: Read-only register 0x000034
omap_dma4_write: Read-only register 0x000038
omap_dma4_write: Read-only register 0x00003c
omap_dma4_write: Read-only register 0x000040

Diff using -append "console=ttyS1 printk.time=0":

 mmci-omap mmci-omap.0: command timeout (CMD5)
 mmc0: host does not support reading read-only switch. assuming
write-enable.
 mmc0: new SDHC card at address 4567
-Waiting for root device /dev/mmcblk0p1...
 mmcblk0: mmc0:4567 QEMU! 1.81 GiB
  mmcblk0: p1 p2
-EXT3-fs: barriers not enabled
-EXT3-fs (mmcblk0p1): mounted filesystem with writeback data mode
-VFS: Mounted root (ext3 filesystem) readonly on device 179:1.
-kjournald starting.  Commit interval 5 seconds
-devtmpfs: mounted
-Freeing init memory: 132K
-mmci-omap mmci-omap.0: command timeout (CMD52)
-mmci-omap mmci-omap.0: command timeout (CMD52)
-mmci-omap mmci-omap.0: command timeout (CMD8)
-mmci-omap mmci-omap.0: command timeout (CMD5)
-mmci-omap mmci-omap.0: command timeout (CMD5)
-mmci-omap mmci-omap.0: command timeout (CMD5)
-mmci-omap mmci-omap.0: command timeout (CMD5)
-mmci-omap mmci-omap.0: command timeout (CMD55)
-mmci-omap mmci-omap.0: command timeout (CMD55)
-mmci-omap mmci-omap.0: command timeout (CMD55)
-mmci-omap mmci-omap.0: command timeout (CMD55)
-mmci-omap mmci-omap.0: command timeout (CMD1)
-lcd_mipid spi1.1: performing LCD ESD recovery
-lcd_mipid spi1.1: performing LCD ESD recovery
+mmci-omap mmci-omap.0: command timeout (CMD18)
+mmcblk0: retrying using single block read
+mmci-omap mmci-omap.0: command timeout (CMD17)
+Unable to handle kernel NULL pointer dereference at virtual address
00000018
+pgd = c0004000
+[00000018] *pgd=00000000
+Internal error: Oops: 5 [#1] PREEMPT
+last sysfs file:
+Modules linked in:
+CPU: 0    Tainted: G        W    (2.6.35~rc4-129.1-n8x0 #1)
+PC is at mmc_omap_dma_cb+0xb8/0x174
+LR is at omap2_dma_irq_handler+0x240/0x294
+pc : [<c0219504>]    lr : [<c003c3ac>]    psr: 20000193
+sp : c7d49db8  ip : c7c4c800  fp : 00000001
+r10: 00000060  r9 : c7c4c950  r8 : 00000001
+r7 : 0000032c  r6 : 00000007  r5 : 00000150  r4 : c7d4ba00
+r3 : 00000000  r2 : 00000007  r1 : 00000060  r0 : 00000007
+Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
+Control: 00c5387d  Table: 80004008  DAC: 00000017
+Process mmcqd (pid: 462, stack limit = 0xc7d48268)
+Stack: (0xc7d49db8 to 0xc7d4a000)
+9da0:                                                       c03baed4
00000150
+9dc0: 00000007 0000032c 00000001 c003c3ac 0000000c 00000000 c7d49e18
c0399a20
+9de0: 00000000 00000000 0000000c 00000000 c7d48000 00000001 00000001
c0081318
+9e00: c039ccc8 0000000c c0399a20 00000001 00000000 c00834c8 0000000c
00000000
+9e20: 00000001 c002906c ffffffff fa0fe000 00000001 c0029ac8 c7d5ed24
c7d5ed24
+9e40: c7d49e68 00000001 c7d57320 c7d64400 00000001 c7d5ed24 c7d49e90
c7d48000
+9e60: 00000001 00000001 00000ffe c7d49e80 c0215fa8 c0215ffc 60000013
ffffffff
+9e80: 00000001 29e8d608 c7d57320 c7d49ea4 c7d49ea4 c7d49efc 00000000
c7d49e64
+9ea0: c0210128 00000011 00000022 00000000 00000000 00000000 00000000
000000b5
+9ec0: 00000000 ffffff92 c7d49efc c7d49e90 0000000c 00000000 00000000
00000000
+9ee0: 00000000 00000000 0000049d 00000000 00000000 00000000 00000000
05f5e100
+9f00: 00000000 00000200 00000001 00000000 00000200 00000000 00000000
c7d49e90
+9f20: 00000001 c7d64800 c7eca800 c7d60980 c7d57320 c0171dc4 c7eca800
c7d60980
+9f40: c7d57320 00000000 000001b1 c01729a0 c7ec4e40 00000000 00000000
c7d48000
+9f60: c7ec4e40 00000000 c7d48000 c7ec4e40 00000000 c7d49f84 c7d57320
c0167680
+9f80: c7ec4e40 c7d48000 c7d5ed24 c7d5ed2c c7ec4e40 00000000 c7ec4fb0
00000001
+9fa0: c7d57320 c02169b8 00000000 c7c6be28 c7d49fd4 c02168c0 c7d5ed24
00000000
+9fc0: 00000000 00000000 00000000 c00692dc 00000000 00000000 c7d49fd8
c7d49fd8
+9fe0: 00000000 00000000 00000000 00000000 00000000 c002af04 00000000
00000000
+[<c0219504>] (mmc_omap_dma_cb+0xb8/0x174) from [<c003c3ac>]
(omap2_dma_irq_handler+0x240/0x294)
+[<c003c3ac>] (omap2_dma_irq_handler+0x240/0x294) from [<c0081318>]
(handle_IRQ_event+0x24/0xe4)
+[<c0081318>] (handle_IRQ_event+0x24/0xe4) from [<c00834c8>]
(handle_level_irq+0xd4/0x16c)
+[<c00834c8>] (handle_level_irq+0xd4/0x16c) from [<c002906c>]
(asm_do_IRQ+0x6c/0x8c)
+[<c002906c>] (asm_do_IRQ+0x6c/0x8c) from [<c0029ac8>] (__irq_svc+0x48/0xac)
+Exception stack(0xc7d49e38 to 0xc7d49e80)
+9e20:                                                       c7d5ed24
c7d5ed24
+9e40: c7d49e68 00000001 c7d57320 c7d64400 00000001 c7d5ed24 c7d49e90
c7d48000
+9e60: 00000001 00000001 00000ffe c7d49e80 c0215fa8 c0215ffc 60000013
ffffffff
+[<c0029ac8>] (__irq_svc+0x48/0xac) from [<c0215ffc>]
(mmc_blk_issue_rq+0x240/0x590)
+[<c0215ffc>] (mmc_blk_issue_rq+0x240/0x590) from [<c02169b8>]
(mmc_queue_thread+0xf8/0xfc)
+[<c02169b8>] (mmc_queue_thread+0xf8/0xfc) from [<c00692dc>]
(kthread+0x78/0x80)
+[<c00692dc>] (kthread+0x78/0x80) from [<c002af04>]
(kernel_thread_exit+0x0/0x8)
+Code: e59f00c0 eafffff0 e3110020 08bd81f0 (e5931018)
+---[ end trace 1b75b31a2719ed20 ]---
+Kernel panic - not syncing: Fatal exception in interrupt

Trace diff:

@@ -245,6 +247,7 @@
  16-bit register 0x000004
  16-bit register 0x000003
  16-bit register 0x000004
+sdcard_reset
  Read-only register 0x0002c8
  Read-only register 0x0002c8
  Read-only register 0x0002c8
@@ -308,10 +311,6 @@
 sdcard_response RESP#1 (normal cmd) (sz:4)
 sdcard_app_command SD           SET_BUS_WIDTH/ACMD06 arg 0x00000002
(state transfer)
 sdcard_response RESP#1 (normal cmd) (sz:4)
- Bad register 0x000034
- Bad register 0x000034
- Bad register 0x000034
- Bad register 0x000034
 sdcard_normal_command SD  READ_MULTIPLE_BLOCK/ CMD18 arg 0x00000000
(state transfer)
 sdcard_response RESP#1 (normal cmd) (sz:4)
 sdcard_read_block addr 0x0 size 0x200
@@ -325,532 +324,17 @@
 sdcard_read_block addr 0xe00 size 0x200
 sdcard_normal_command SD    STOP_TRANSMISSION/ CMD12 arg 0x00000000
(state sendingdata)
 sdcard_response RESP#1 (normal cmd) (sz:4)
+ Bad register 0x000034
+ Bad register 0x000034
+ Bad register 0x000034
+ Bad register 0x000034
 sdcard_normal_command SD          SEND_STATUS/ CMD13 arg 0x45670000
(state transfer)
 sdcard_response RESP#1 (normal cmd) (sz:4)
-sdcard_normal_command SD  READ_MULTIPLE_BLOCK/ CMD18 arg 0x00000022
(state transfer)
-sdcard_response RESP#1 (normal cmd) (sz:4)
-sdcard_read_block addr 0x4400 size 0x200
- Read-only register 0x000038
-sdcard_read_block addr 0x4600 size 0x200
-sdcard_normal_command SD    STOP_TRANSMISSION/ CMD12 arg 0x00000000
(state sendingdata)
-sdcard_response RESP#1 (normal cmd) (sz:4)
-sdcard_normal_command SD  READ_MULTIPLE_BLOCK/ CMD18 arg 0x00000020
(state transfer)
-sdcard_response RESP#1 (normal cmd) (sz:4)
-sdcard_read_block addr 0x4000 size 0x200
...

Regards,

Phil.
