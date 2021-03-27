Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2488135lfg;
        Sat, 27 Mar 2021 14:46:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhpvL+NQokvhFB3TCiiy3QiNPF4Q481NZndPz4ANTZ48C8a6X/FaIF8qr1o7+zhPUBEDZ0
X-Received: by 2002:a25:bccb:: with SMTP id l11mr28854009ybm.306.1616881578872;
        Sat, 27 Mar 2021 14:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616881578; cv=none;
        d=google.com; s=arc-20160816;
        b=uYkpHVHfPAGdHYGAeIZ7bY8SlZG+yE8OKXs/kijPKFK3qxRTRtCwMJ7pyY8pkfO+zW
         lY+2Us2MawzmejN9kt1Q9RII8pIInp2kU4OwCAfDxCGn8s80l8DrqF7YbEkN3rI2xSRq
         5OX4T0JAuNryKOkLdF6ultWZD8e/ZRZoWUSh5rACyC2nmsj3BBB03UVA+KXkHdxcFpMc
         yOOVMHl6mOIyjRFsPWxdtTegE+wqPhly+J9P5LxZf8AVmI0T1gQ2ibXYBtFNXO/F5OX/
         Xvc4meMFi31XsmF6sB6pzM/M5ARzTA8aOFdnLTyuo/psgIAcRPtfS6rI+rMc0jrJewHW
         crHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=SunnLJfzhq7ocgXiAyvjPaf5kv6VgR9yT91rg7/hvqs=;
        b=mYaH8sqGMhY5ROW9SBf4G+rSOZvjdFiSdrfQqGcUbhBTAdC9EppuIC1lhQNyhZbypE
         vHTQYkROKnw5+oLFeFCykzgGzMsD6mJg47odeUXct1MCOafu/iFTb9wBmGzqTXZQ1ALK
         6zGeYjcQpBMW0uhesIpTCRS9CP/xKhON6/10A/w0LpPCX59y1xmAaMUpxWs6EQHytNIz
         Z38h31nIxEbxQlhRcFsI8/jTBnDSaFKC2Ge99WJP2i/gJic5v9nvOrGid45tzp30ZZ1p
         p0BHjkEU99RDdWmKL62skV30e3gbSya/oZEl9Icw/TvmUEoqQViiIrsO1zqMOefljjQo
         yRsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k80si12418798ybf.246.2021.03.27.14.46.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Mar 2021 14:46:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQGl8-0002Iy-8z
	for alex.bennee@linaro.org; Sat, 27 Mar 2021 17:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lQGkx-0002Ij-Vq; Sat, 27 Mar 2021 17:46:08 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:51734
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lQGkv-0001ic-Im; Sat, 27 Mar 2021 17:46:07 -0400
Received: from host81-157-25-196.range81-157.btcentralplus.com
 ([81.157.25.196] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1lQGkn-0007lN-R7; Sat, 27 Mar 2021 21:46:04 +0000
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210326002728.1069834-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <0d7cdd6a-a82e-5d98-f6ad-f5b4ccc84c6e@ilande.co.uk>
Date: Sat, 27 Mar 2021 21:45:44 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.157.25.196
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [RFC PATCH-for-6.1 00/10] hw/misc: Add
 memory_region_add_subregion_aliased() helper
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ucaSsaSiote

On 26/03/2021 00:27, Philippe Mathieu-Daudé wrote:

> Hi,
> 
> This series introduce the memory_region_add_subregion_aliased()
> helper which basically create a device which maps a subregion
> multiple times.
> 
> Examples are easier, so having a subregion aliased every @span_size
> then mapped onto a container at an offset, you get something like:
> 
>            ^-----------^
>            |           |
>            |           |
>            | +-------+ |                 +---------+          <--+
>            |           |                 +---------+             |
>            |           |                 |         |             |
>            |           |   +-----------> | alias#3 |             |
>            |           |   |             |         |             |
>            |           |   |             +---------+             |
>            |           |   |             +---------+             |
>            |           |   |             |         |             |
>            |           |   |   +-------> | alias#2 |             |
>            |           |   |   |         |         |             |region
>            | container |   |   |         +---------+             | size
>            |           |   |   |         +---------+             |
>            |           |   |   |         |         |             |
>            |           |   |   |  +----> | alias#1 |             |
>            |           |   |   |  |      |         |             |
>            |           |   |   |  |      +---------+  <--+       |
>            |           | +-+---+--+--+   +---------+     |       |
>            |           | |           |   |         |     |span   |
>            |           | | subregion +-> | alias#0 |     |size   |
>     offset |           | |           |   |         |     |       |
>     +----> | +-------+ | +-----------+   +---------+  <--+    <--+
>     |      |           |
>     |      |           |
>     |      |           |
>     |      |           |
>     |      |           |
>     |      ^-----------^
> 
> I know it need more documentation and tests, but I prefer to send
> as draft RFC for early review before spending more time on it.
> 
> Based-on: <20210325120921.858993-1-f4bug@amsat.org>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg795218.html
> 
> Philippe Mathieu-Daudé (10):
>    hw/misc: Add device to help managing aliased memory regions
>    hw/arm/musicpal: Open-code pflash_cfi02_register() call
>    hw/arm/musicpal: Map flash using memory_region_add_subregion_aliased()
>    hw/arm/digic: Open-code pflash_cfi02_register() call
>    hw/arm/digic: Map flash using memory_region_add_subregion_aliased()
>    hw/block/pflash_cfi02: Remove pflash_setup_mappings()
>    hw/block/pflash_cfi02: Simplify pflash_cfi02_register() prototype
>    hw/misc/aliased_region: Simplify aliased I/O regions
>    hw/m68k/q800: Add MacIO container
>    hw/m68k/q800: Map MacIO using memory_region_add_subregion_aliased()
> 
>   include/hw/block/flash.h         |   1 -
>   include/hw/misc/aliased_region.h |  91 +++++++++++++++
>   hw/arm/digic_boards.c            |  28 ++++-
>   hw/arm/musicpal.c                |  29 ++++-
>   hw/arm/xilinx_zynq.c             |   2 +-
>   hw/block/pflash_cfi02.c          |  36 +-----
>   hw/lm32/lm32_boards.c            |   4 +-
>   hw/m68k/q800.c                   |  61 +++++-----
>   hw/misc/aliased_region.c         | 185 +++++++++++++++++++++++++++++++
>   hw/ppc/ppc405_boards.c           |   6 +-
>   hw/sh4/r2d.c                     |   2 +-
>   MAINTAINERS                      |   6 +
>   hw/arm/Kconfig                   |   2 +
>   hw/m68k/Kconfig                  |   1 +
>   hw/misc/Kconfig                  |   3 +
>   hw/misc/meson.build              |   1 +
>   16 files changed, 375 insertions(+), 83 deletions(-)
>   create mode 100644 include/hw/misc/aliased_region.h
>   create mode 100644 hw/misc/aliased_region.c

Now this is interesting. Are there any limits to the number of aliased memory regions 
supported? In my q800 dev branch I have the following commit: 
https://github.com/mcayland/qemu/commit/272547abbca69906dab5d94af32c5117691a1050 
("q800: reimplement mac-io region aliasing using IO memory region") to implement 
similar functionality because adding just one more device into the aliased region is 
enough to cause QEMU to assert with "phys_section_add: Assertion `map->sections_nb < 
TARGET_PAGE_SIZE'
failed" on startup.


ATB,

Mark.
