Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3602701ejb;
        Sun, 5 Feb 2023 15:30:04 -0800 (PST)
X-Google-Smtp-Source: AK7set/KOR1ZB+xjFfWKfqmtwaVrgXr74uotRUG3Et45wO+XHQ45wHQl6MyxGdQhmxQM/9WfGe0N
X-Received: by 2002:ac8:7f08:0:b0:3b9:a441:37ed with SMTP id f8-20020ac87f08000000b003b9a44137edmr35028775qtk.32.1675639804285;
        Sun, 05 Feb 2023 15:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675639804; cv=none;
        d=google.com; s=arc-20160816;
        b=kOdYA4vXagc5RwWxe2I+juDYdlsrXt+GQNBCDj1JZViBhy2er8wRfvnDEjke7jfRun
         68VkIGMYoNEE5Rhir73dqfcSZ4VTQFelI2UR09sYhpyIaDK5Z58SMQe0bGhevORECXT1
         rwdEhoSYwSMYXTTAPvDoDDmFUp6epzkr+j3ev8fdJ5xJgNAHChYkM4nPOahNCYkIXiAS
         B7up2yAzpKAYQLQxXJcDYtJa+zwsdkKtjjV/dlWc7wFBBofNKMPFMOG3FqAVsIOLl3OF
         lw5Yr8/hsqQMF5QCDtmcqt1C75muH1UqRFq+K0bmGjlCi27Mpc6UiPwdM8CLYSfb4z+i
         VxVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VUqys9UYPPWxtl1cpIfY4yhOylVM6jUfs0guQ2i/9FY=;
        b=DbTWdcCWOOoz/RMpGjewqmiQA6+D5WU1LFTZvJZ9ICIwlHAjz/3BPGjzO8Ujn1YpyR
         frksg9I1hoCsWERX6YK3mNdkskHEr6CJgmEp5U2c3gHFhtB2d1fsOEdmkIwsVjGDP0Jw
         TETwgmdEcFOpibrtYEBxzXfrivBHKJJXKK81fC6CeSZ7O5LBM3JAUbdd4KMwt6I4ToiQ
         eGl5pjR7wkmj2bVCto2guEQCnjQ6ZXmLiNlVxsZiCjLR/qnZDEa0bvry2jAxVdlop9lX
         TmoPDIvKHhL6OTW25HsoM6qQfioMVc5f4elsrwP0xlqeSlTeMuDCLcijgGWIo7bgdgc/
         bp4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=OiRA0KeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j64-20020a378743000000b0071c266d6dedsi6233689qkd.698.2023.02.05.15.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Feb 2023 15:30:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=OiRA0KeE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pOoSG-0005Ev-W0; Sun, 05 Feb 2023 18:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoSF-0005EX-H7; Sun, 05 Feb 2023 18:29:51 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoSD-00087j-Ti; Sun, 05 Feb 2023 18:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VUqys9UYPPWxtl1cpIfY4yhOylVM6jUfs0guQ2i/9FY=; b=OiRA0KeEVzDOSCigZnleNXiQDm
 Rz1C2Pm6w1Y9OOhp7W5O2hjYf+c576CNXbv6sHkOEhiiTa6cBj4dSkMKaevveg14rOw+pLKcv0JGD
 HDGnf/xK3ILnFudvcg1h8pgGQv022LkIn/xzvFmwzNSEoWYBM8XqXOqG6Az1vL488OhizmcrdLUZv
 I/oQKI9q3Sajozp2dNL7KZHjOV0A77Fpkwh0zK0MfQbNg9sHygp71w+YtFDpBxkQTINJc84wWNMy2
 Qai6lr7HbI0XNzGXn3bnjDovWU9j1mhIiiqCVGJOzYDAbXxI1H6Nabm8daGKaSYlkrsxLAYQ7s7he
 ISVdtiEEqHBe5zmDX3uGGsBF8iyiExSPu7E85VcEI1PgtuuQKVJWol9qzSXdmlAacBw2Zh8D+e3lh
 lb1n/sbCyNm0klHcRu5Y9Okxw5s4OamABuuC/Gz2Kq8kt5Oxl+bJ4PrGhSAcv6Nfd87k5vTtbggO7
 NC1iGIGKHTBdoNGElUXKqqqsgJqRh04wFXDghz6f8smV0Bv0U/rMc2t5ZUVPJzn6L2HJpHWl0s9q0
 jE7L4A3oOZgOtRlKnn5kWpfNlceHzR6E3TzyrxOEofOLL7O5a7LMIAEz810W1ryarwru/cEWQ/LML
 JF0wVkQtRYlG/zmJeA04n3yQWmA3Zy7wh0J0glgJw=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOoRi-0008Qw-FQ; Sun, 05 Feb 2023 23:29:18 +0000
Message-ID: <e30899d3-06b5-645e-3f42-c99631b5a53a@ilande.co.uk>
Date: Sun, 5 Feb 2023 23:29:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230203113650.78146-1-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/9] hw: Use QOM alias properties and few QOM/QDev cleanups
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dj+XYThe3w9I

On 03/02/2023 11:36, Philippe Mathieu-Daudé wrote:

> These patches are extracted from a QOM/QDev refactor series,
> so they are preliminary cleanups noticed while working on it:
> 
> - Use correct type when calling qdev_prop_set_xxx()
> - Unify some qdev properties in MIPS models
> - Replace intermediate properties by link properties
> - Remove DEFINE_PROP_DMAADDR() macro which is used one time
> - Use qdev_realize_and_unref() instead of open-coding it
> 
> Philippe Mathieu-Daudé (9):
>    hw/i386/sgx: Do not open-code qdev_realize_and_unref()
>    hw/ppc/sam460ex: Correctly set MAL properties
>    hw/arm/nrf51: QOM-alias 'flash-size' property in SoC object
>    hw/arm/fsl-imx: QOM-alias 'phy-num' property in SoC object
>    hw/usb/hcd-ohci: Include missing 'sysbus.h' header
>    hw/display/sm501: QOM-alias 'dma-offset' property in chipset object
>    hw/qdev: Remove DEFINE_PROP_DMAADDR() and 'hw/qdev-dma.h'
>    hw/mips: Declare all length properties as unsigned
>    hw/mips/itu: Pass SAAR using QOM link property
> 
>   hw/arm/fsl-imx25.c           |  3 +--
>   hw/arm/fsl-imx6.c            |  3 +--
>   hw/arm/fsl-imx6ul.c          |  8 ++++----
>   hw/arm/fsl-imx7.c            | 12 ++++++------
>   hw/arm/microbit.c            |  5 ++++-
>   hw/arm/nrf51_soc.c           | 10 +---------
>   hw/display/sm501.c           | 22 +++++++++++-----------
>   hw/i386/sgx.c                |  5 ++---
>   hw/intc/mips_gic.c           |  4 ++--
>   hw/mips/boston.c             |  2 +-
>   hw/mips/cps.c                | 35 ++++++++++++-----------------------
>   hw/mips/malta.c              |  2 +-
>   hw/misc/mips_cmgcr.c         |  2 +-
>   hw/misc/mips_itu.c           | 30 ++++++++++++++++++++----------
>   hw/nvram/nrf51_nvm.c         |  6 +++++-
>   hw/ppc/sam460ex.c            |  4 ++--
>   hw/sh4/r2d.c                 |  2 +-
>   hw/usb/hcd-ohci-pci.c        |  1 -
>   hw/usb/hcd-ohci.c            |  3 +--
>   hw/usb/hcd-ohci.h            |  1 +
>   include/hw/arm/fsl-imx25.h   |  1 -
>   include/hw/arm/fsl-imx6.h    |  1 -
>   include/hw/arm/fsl-imx6ul.h  |  2 --
>   include/hw/arm/fsl-imx7.h    |  1 -
>   include/hw/arm/nrf51_soc.h   |  1 -
>   include/hw/intc/mips_gic.h   |  4 ++--
>   include/hw/misc/mips_cmgcr.h |  2 +-
>   include/hw/misc/mips_itu.h   |  9 ++++-----
>   include/hw/qdev-dma.h        | 16 ----------------
>   29 files changed, 84 insertions(+), 113 deletions(-)
>   delete mode 100644 include/hw/qdev-dma.h

I must admit to being slightly nervous about using QOM alias properties in this way, 
simply because you start creating implicit dependencies between QOM objects. How 
would this work when trying to build machines from configuration files and/or the 
monitor? Or are the changes restricted to container devices i.e. those which consist 
of in-built child devices?


ATB,

Mark.
