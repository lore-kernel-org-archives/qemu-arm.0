Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5498683wrp;
        Sun, 29 Sep 2019 00:10:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5yjd7zSpalcgw1bB7VBHCvtfcA4DCMWu7IyafRa3UsQ8oE8upXVP2SaYMpZ3auZF6dLNk
X-Received: by 2002:a37:c0f:: with SMTP id 15mr13636584qkm.73.1569741021322;
        Sun, 29 Sep 2019 00:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569741021; cv=none;
        d=google.com; s=arc-20160816;
        b=HldBn4u4Z5UmjMkwuohbzaI1yDeI3FNZEmBr7TIQoGHWncbe3PSMH3fatT6XyET+np
         LWYa1U2757iDQsd4d3nMwzVinx2EbB0prbS8cXjKIemFsZtC4Vv5iHYb0Bx7AYtW590D
         APKs0N1FKFKvuTj5qI5a52wObjqCm/kpn4RFtLWsRYr+tsbf1puPo0LtPiS0dk4kApOz
         sSYr09t1UWf1V/SuAos3wf5zHIyeNhAqao/Gflhv+HettH911ZZlRaVPIBmr9WrqhGbK
         ebtriqrDffGhSvQxpZK4ltkOc/iFMAE2zqQT36Yc3V9A1qpm3oI/PGEce6qB3+WOtYF8
         2gzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=s7i94r9jVLYBrEfAacu+dnXrhslHQJNgnVnCHgloqlU=;
        b=R+d6gk5Fm5kFLbCaQoOoBNHN4IZEKR2zDZDZuJHbnxDuid27/qz3Q4fpL8CN6vJG+I
         CmTJaCyybPtFAN68RV3VEOTsrbfETI/Nt+ZmPi/UOeOe2YlSwtVKk6COfNRNMT8ajVgo
         OSb22lhP6sLgsCEhkJ4gHO62/Nt90dGGn24urKKiXQeZ45IL8z5SaHj8uPd+3FZEVK+h
         ewFYuvSGRxaaNUv79V2xH91Cgv5Bgm4VGH6J2vFpF2D7LLNeLOB6xNPKvs7lofcDHJbC
         wr0H2ae5p4LAYjYeibDzqYzWkSf1Um8589rpANyyCIG1nPJGwPWRQOKWGFnrnn4P7arj
         OxTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p7V7dNkK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20si9730241qvh.194.2019.09.29.00.10.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 Sep 2019 00:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=p7V7dNkK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iETLY-0004Xe-I8
	for alex.bennee@linaro.org; Sun, 29 Sep 2019 03:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53405)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iETKL-0003md-6K
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 03:09:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iETKJ-0001JY-Mt
 for qemu-devel@nongnu.org; Sun, 29 Sep 2019 03:09:04 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46436)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iETKJ-0001Hk-Ds; Sun, 29 Sep 2019 03:09:03 -0400
Received: by mail-wr1-x443.google.com with SMTP id o18so7417064wrv.13;
 Sun, 29 Sep 2019 00:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=s7i94r9jVLYBrEfAacu+dnXrhslHQJNgnVnCHgloqlU=;
 b=p7V7dNkK2XirgogQ4/lWeB7DtNNo03EOn6mp5ubYguMUhoEjnEiNBRnZEl78/apJSg
 DAalM/fJ1Ouuc6sPNr0gorx8vXQoc5KK1cG7CsgHLTa2vnTXsEAu/ahfzyhmX7WoqajH
 o97yv3umuuUCrIgCczNeyfj/7aKs39u0FFDtc9hlMUsJcQcintmJhpwYU1LkI9gGm1zu
 qutolXKlqpxROrMjKGDlYz07+z093Tj/12BghgzacKDavy8xwEqD1sO24Qi5CKNTGOeQ
 1otcUmGocjMdmYHDWDXteJdNQ5Pmgj/qM1O8VLLhlnRvPv4foITuctePb5TrtxBt6VJv
 Vz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=s7i94r9jVLYBrEfAacu+dnXrhslHQJNgnVnCHgloqlU=;
 b=fI+7/pFrbqpBUqdyPhUR26aJ9oDYV6dfZSzJecpjACIBP8EBGAVKIGEG+tGC1mCu1Z
 +SWWvPKYAzNuFuZ3w5WKLhyU8gZhxPltpGxLm5Ueei9zm6GXrik3X4nS5oylbRVjxB2i
 CZJNydjkaoRQZBa6mRRQPLTLt+kpRx821+23pLmEPTd9wDHQqNEH/rWHDJlOP8NddAfW
 bwBRDF1MpaHl9FBrS8Xd7ltxLl22rHeIUABRLu01A9p4JVXRhPtLU7qxZ7jcxBQVByp4
 eGDez9Kt1pZ0Owbw9fecKxqTqojdV4wOalbEHD37EB3v5PzBaERUqAM6sXYCaevihGHA
 jjtQ==
X-Gm-Message-State: APjAAAVCy37vo5DPe9u7NBqFkvv/q2aU4do0ZhWZuXS8cuB6r/M/b1H7
 ZxIuQ7hZdg7uhkU6AZWaaGE=
X-Received: by 2002:adf:de08:: with SMTP id b8mr8636502wrm.200.1569740942163; 
 Sun, 29 Sep 2019 00:09:02 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:b200:7a70:bbc8:8101:45be?
 ([2a01:c22:b04f:b200:7a70:bbc8:8101:45be])
 by smtp.gmail.com with ESMTPSA id n22sm10005278wmk.19.2019.09.29.00.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2019 00:09:01 -0700 (PDT)
Message-ID: <d8f7c131cad2590ff2faf48076df510705090f54.camel@gmail.com>
Subject: Re: [PATCH 05/14] hw/arm/bcm2835_peripherals: Name various address
 spaces
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, Peter
 Maydell <peter.maydell@linaro.org>, Andrew Baumann
 <Andrew.Baumann@microsoft.com>,  qemu-devel@nongnu.org, Pekka Enberg
 <penberg@iki.fi>,  =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>
Date: Sun, 29 Sep 2019 09:08:51 +0200
In-Reply-To: <20190904171315.8354-6-f4bug@amsat.org>
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-6-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ALF0MJ87S31p

El mié, 04-09-2019 a las 19:13 +0200, Philippe Mathieu-Daudé escribió:
> Various address spaces from the BCM2835 are reported as
> 'anonymous' in memory tree:
> 
>   (qemu) info mtree
> 
>   address-space: anonymous
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-
> property
> 
>   address-space: anonymous
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-
> peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
>   [...]
> 
> Since the address_space_init() function takes a 'name' argument,
> set it to correctly describe each address space:
> 
>   (qemu) info mtree
> 
>   address-space: bcm2835-mbox-memory
>     0000000000000000-000000000000008f (prio 0, i/o): bcm2835-mbox
>       0000000000000010-000000000000001f (prio 0, i/o): bcm2835-fb
>       0000000000000080-000000000000008f (prio 0, i/o): bcm2835-
> property
> 
>   address-space: bcm2835-fb-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-
> peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
>   address-space: bcm2835-property-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-
> peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
>   address-space: bcm2835-dma-memory
>     0000000000000000-00000000ffffffff (prio 0, i/o): bcm2835-gpu
>       0000000000000000-000000003fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       0000000040000000-000000007fffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       000000007e000000-000000007effffff (prio 1, i/o): alias bcm2835-
> peripherals @bcm2835-peripherals 0000000000000000-0000000000ffffff
>       0000000080000000-00000000bfffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
>       00000000c0000000-00000000ffffffff (prio 0, i/o): alias bcm2835-
> gpu-ram-alias[*] @ram 0000000000000000-000000003fffffff
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/bcm2835_fb.c    | 2 +-
>  hw/dma/bcm2835_dma.c       | 2 +-
>  hw/misc/bcm2835_mbox.c     | 2 +-
>  hw/misc/bcm2835_property.c | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
> index 8f856878cd..85aaa54330 100644
> --- a/hw/display/bcm2835_fb.c
> +++ b/hw/display/bcm2835_fb.c
> @@ -425,7 +425,7 @@ static void bcm2835_fb_realize(DeviceState *dev,
> Error **errp)
>      s->initial_config.base = s->vcram_base + BCM2835_FB_OFFSET;
>  
>      s->dma_mr = MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_FB "-
> memory");
>  
>      bcm2835_fb_reset(dev);
>  
> diff --git a/hw/dma/bcm2835_dma.c b/hw/dma/bcm2835_dma.c
> index 6acc2b644e..1e458d7fba 100644
> --- a/hw/dma/bcm2835_dma.c
> +++ b/hw/dma/bcm2835_dma.c
> @@ -383,7 +383,7 @@ static void bcm2835_dma_realize(DeviceState *dev,
> Error **errp)
>      }
>  
>      s->dma_mr = MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_DMA "-
> memory");
>  
>      bcm2835_dma_reset(dev);
>  }
> diff --git a/hw/misc/bcm2835_mbox.c b/hw/misc/bcm2835_mbox.c
> index 7690b9afaf..77285624c9 100644
> --- a/hw/misc/bcm2835_mbox.c
> +++ b/hw/misc/bcm2835_mbox.c
> @@ -311,7 +311,7 @@ static void bcm2835_mbox_realize(DeviceState
> *dev, Error **errp)
>      }
>  
>      s->mbox_mr = MEMORY_REGION(obj);
> -    address_space_init(&s->mbox_as, s->mbox_mr, NULL);
> +    address_space_init(&s->mbox_as, s->mbox_mr, TYPE_BCM2835_MBOX "-
> memory");
>      bcm2835_mbox_reset(dev);
>  }
>  
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index ab66d3572e..3dff5a7157 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -417,7 +417,7 @@ static void bcm2835_property_realize(DeviceState
> *dev, Error **errp)
>      }
>  
>      s->dma_mr = MEMORY_REGION(obj);
> -    address_space_init(&s->dma_as, s->dma_mr, NULL);
> +    address_space_init(&s->dma_as, s->dma_mr, TYPE_BCM2835_PROPERTY
> "-memory");
>  
>      /* TODO: connect to MAC address of USB NIC device, once we
> emulate it */
>      qemu_macaddr_default_if_unset(&s->macaddr);

Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>


