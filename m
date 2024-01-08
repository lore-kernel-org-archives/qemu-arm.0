Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2345749ejo;
        Mon, 8 Jan 2024 07:20:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5jInCQN+cSdKxwiBk4cNlLOBfsUhwIcXBm7vGPskrNCyCHWxqim+cVpnnZbgB5v7QuUmB
X-Received: by 2002:a05:620a:1470:b0:783:22a9:9cc1 with SMTP id j16-20020a05620a147000b0078322a99cc1mr1535373qkl.95.1704727209267;
        Mon, 08 Jan 2024 07:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704727209; cv=none;
        d=google.com; s=arc-20160816;
        b=R5bSJPKbscjpUvgnteQc7Rt5xVp4+uvfBbJP7qySIk0xu84vBSLrlImFIXFlaBdRsG
         zK84BWefh7vGt5WIQYKfnHMm2sRCkrEWW2ZCKHqH5/5JoQUYhu4mVvcLZ/gHOQhenUgu
         QEqabMdgaALgbB9Byj54ADy2Ksmd+dPMg4LYKG8c3De9qm7nXju3hyOZXw6rtumV3O1P
         SGCmwOy6UA9Gngg/rljc11WMiPt1p3zZu6egC6cnCtqw33zx7XMl6eU5EttolAQvd0E9
         mWYm65VcWueEZRcl3wQcBhleUVvBpvejTYkMCEJF5ZEPEIQktkB9H8RYUZ++nIqTHrJV
         UoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=K+osPsFOJQ0Mo4THPwnyg9SyaD9dN1OwJU4TLjAUKa0=;
        fh=KlMGm1mrCnwsnKfhEn7lY1Smhl6zVU7EG8tbsQKM8NY=;
        b=iPWR0pz6DQ2d8+RigHEyBKKD0ZKrnn0PwXAav+51FTdCv+J4ZUinPb2eUO354tCgQx
         wn/L4lJsy5nimXx03GAv0y7/Mp4xTsKwFvuL6zu9KMJx9je9mTySq2K7VE5pShuGBjzY
         WNknrX2WC7XF2DGxpOxcAewTUfNFmCTNh6fsjYhRCJDTXeB+Vzdoulod7AnLa1/h+W1G
         O+Kgxu22TlgJin9ieXphkFU3aiaGlyVEt2dFz5v2uqY1yTR87ypTr1W9yT3KcVmBZ/PQ
         bXPVocvpdlNX0+GEqvNv+Ipj+HksyrOpRJIFXZxKxrBx327h3vsvW0Yqhdqy+OhBLqLQ
         bOFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Inl02+or;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p19-20020a05620a22b300b0077eceefcd8dsi7654964qkh.466.2024.01.08.07.20.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 07:20:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Inl02+or;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMrQ0-0005ru-4x; Mon, 08 Jan 2024 10:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMrPv-0005qx-M9
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 10:19:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rMrPq-0004ws-Ec
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 10:19:52 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-336746c7b6dso1867924f8f.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 07:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704727178; x=1705331978; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+osPsFOJQ0Mo4THPwnyg9SyaD9dN1OwJU4TLjAUKa0=;
 b=Inl02+or0gSuJ/nqbg4pDalEUKBaIIG/esgk53qdEqL8XEynycINQn+6l/cZI9FnxK
 CmGf7DqfbjnztIM2KqmKQAtdPXe8jRnO5x3Y0H7NrQcfgsPaOU8tcQ+5XXknHHLka3fb
 hFHZ9Wp7rLqxcGwIR2Uy/9vMP0DE/3cQGN+qZ5KEskIVPZrYvz/OUcNKwMN6m7SE1ajE
 lMXAon/Q1yFPnt37NzbuHOdsgBlVu2y9la9KH1s/VD7Y3D9zEc8Od9uGr89SRFHtRREu
 cYEtC9x4SH2D9LhiYeuXfeH6DchEsPPQCfEacIV0wmAuydopC8FdeCqwXFX2Piw1U7Hl
 Hucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704727178; x=1705331978;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+osPsFOJQ0Mo4THPwnyg9SyaD9dN1OwJU4TLjAUKa0=;
 b=FPoeShvGiwr24gvvdrYlJCn5ezVYhlqhrW5KFUNuRdhTGGibljSdj4WDXuSKk1z0xl
 KrRYD37yH1BW+yZfPGWHPYQao01aFSmlLj81NjwvIE3+3n3Md+Ncx46M+AHEx/kUir+w
 DosZnO92lIQXa+w44uLt7jVfM7EDayEmnPE0TBqTRQD3+4MnoIA8nF7f7+u+KgM/ByE9
 8rUZvMGLwcc3P4TonBOS78tIB1S8PFz6rQREBYYqFwnqmNc/hnqC0CAz1rWaviwBBhAg
 MJIlD7pw1j53xdvGC9MxFENZkHF+YKvimSAlZ8vIs9VHP8QDqHVqO5Zl4OkDGQbycCdO
 3Izg==
X-Gm-Message-State: AOJu0YzsA9q8Pz6stkf1Tec6zgldxIZEVwH0Us3WgBX+f5KmlbF+MOYJ
 xFESjIMQsG8dUCgTfyg94c+l1tx7ApWFnw==
X-Received: by 2002:adf:fe8c:0:b0:337:689e:6616 with SMTP id
 l12-20020adffe8c000000b00337689e6616mr1229999wrr.10.1704727178327; 
 Mon, 08 Jan 2024 07:19:38 -0800 (PST)
Received: from [192.168.69.100] ([176.176.175.62])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a5d4f90000000b003366e974cacsm8075538wru.73.2024.01.08.07.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 07:19:37 -0800 (PST)
Message-ID: <68443785-d97d-412b-8c65-36865dd38803@linaro.org>
Date: Mon, 8 Jan 2024 16:19:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 08/10] hw/net: GMAC Rx Implementation
Content-Language: en-US
To: Nabih Estefan <nabihestefan@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com,
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com,
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
References: <20231219213255.604535-1-nabihestefan@google.com>
 <20231219213255.604535-9-nabihestefan@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231219213255.604535-9-nabihestefan@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QB/Rt0xQ2ctL

Hi Nabih,

On 19/12/23 22:32, Nabih Estefan wrote:
> From: Nabih Estefan Diaz <nabihestefan@google.com>
> 
> - Implementation of Receive function for packets
> - Implementation for reading and writing from and to descriptors in
>    memory for Rx
> 
> When RX starts, we need to flush the queued packets so that they
> can be received by the GMAC device. Without this it won't work
> with TAP NIC device.
> 
> When RX descriptor list is full, it returns a DMA_STATUS for software to handle it. But there's no way to indicate the software ha handled all RX descriptors and the whole pipeline stalls.
> 
> We do something similar to NPCM7XX EMC to handle this case.
> 
> 1. Return packet size when RX descriptor is full, effectively dropping these packets in such a case.
> 2. When software clears RX descriptor full bit, continue receiving further packets by flushing QEMU packet queue.
> 
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>   hw/net/npcm_gmac.c | 330 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 328 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/npcm_gmac.c b/hw/net/npcm_gmac.c
> index 44c4ffaff4..fe7b0421ef 100644
> --- a/hw/net/npcm_gmac.c
> +++ b/hw/net/npcm_gmac.c
> @@ -23,7 +23,11 @@
>   #include "hw/registerfields.h"
>   #include "hw/net/mii.h"
>   #include "hw/net/npcm_gmac.h"
> +#include "linux/if_ether.h"

This doesn't build on macOS:

[1116/1645] Compiling C object libcommon.fa.p/hw_net_npcm_gmac.c.o
../../hw/net/npcm_gmac.c:26:10: fatal error: 'linux/if_ether.h' file not 
found
#include "linux/if_ether.h"
          ^~~~~~~~~~~~~~~~~~
1 error generated.
FAILED: libcommon.fa.p/hw_net_npcm_gmac.c.o
ninja: build stopped: subcommand failed.

$ uname -o
Darwin

>   #include "migration/vmstate.h"
> +#include "net/checksum.h"
> +#include "net/net.h"
> +#include "qemu/cutils.h"
>   #include "qemu/log.h"
>   #include "qemu/units.h"
>   #include "sysemu/dma.h"

