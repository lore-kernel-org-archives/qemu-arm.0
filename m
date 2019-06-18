Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3290057wrg;
        Mon, 17 Jun 2019 22:16:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyflrLP67XYbY53GzKxUKwAM7yWcX0d0Ge3zCXXR8cYCk2dsIm8k0uOdGkaIwYOUT8+Ct2q
X-Received: by 2002:a17:906:fcb8:: with SMTP id qw24mr2077069ejb.239.1560834962761;
        Mon, 17 Jun 2019 22:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560834962; cv=none;
        d=google.com; s=arc-20160816;
        b=xVlmKhQfrRSabruCDIwdBybkcDuuBLPxf9Lzm7ZItkIRlUXdK9JpsNII//IdJvptFr
         8UX2jfg9VPRgRuxAL9dwilXcyoV+c/QWfF2h+4TAnJSmrVqSWKyBTbP2x5IVejzBufTx
         kgcGFVUucLsWXp9xqayZV+9al4DNtTPMzrLmzVBoUkkvSAyZBoxDkO2jZaQkqiQOCUhK
         Q/XSHtqB+IexdaG/0cRa/NDW7og5sr6nui+DV6sQKmhhhDArZ+RCO1qhKEFZr4qHTL+K
         8JCkcvVxoFp4vACfbBDoX2vXv+oZdhj1FjdAaszwae+zUuslOtXUzP8eoet4QNDOX98Y
         aE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=GCk4qQeR5SdJGeBJfewhmQXKBbrGBzr1ytgOp2jg9As=;
        b=NzGWZnkLTk2bY5lVZ1LvopIxHUgmgWQYzv4yjtL7nkoMTbP4/axoSGWBtFi7tlKz+0
         MEArPNGym4b1LBMtEST2asZTMlLgONC8ocCAx99kH/nvWBGDeqK2QuBxeqStazs1L/GO
         sY1RWRLVoqYowQPgjSwpIowkeuCbqy2gAi08DFHt5MBqXrcOVf58Uc6eiQYZgWZPRSSy
         PHNgZ0UQb1k2brXozq/Kdm2O6NJG0BLdyvy0ljUmodVxiAAkppYIOjxJypEtmHV+NsSi
         00sEJnYg8qCsVTSW1na1vjn/k15u0pqEmUP5Sx9S9UyI1jQ0EgwGeH4n8AmtmNX+FCed
         MtdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si10251470edd.294.2019.06.17.22.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 22:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hd6TR-00030x-Ro
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 01:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hd6Sx-00030k-NR
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 01:15:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hd6Sw-0003wl-L6
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 01:15:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hd6Sw-0003w4-BV
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 01:15:30 -0400
Received: by mail-wr1-f66.google.com with SMTP id k11so12393625wrl.1
 for <qemu-arm@nongnu.org>; Mon, 17 Jun 2019 22:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GCk4qQeR5SdJGeBJfewhmQXKBbrGBzr1ytgOp2jg9As=;
 b=QMyNqvWaQ/909rKDlgqBYLkeZ2o3eiU1mveZrMIX6C5eqtxjYkGBYiX2AGh6YUlKU1
 mzpFl96L/E9yjhbBDM1PKKTJFBnTPHHDrV9F5i9PhxlhT9L41xTVOM0VHlPWmYukFRpG
 DkL3qtQnAfj8rS3cBfdbq17AlIWe74hsbgtGU+P+p+uN5/xbWIyZ96dB437NfqvQN/Vf
 DtkIiTpY0PDfGe6dNa3tSRbF1yQvGTlGMfk+LwzrtP/QK0vyK5ORwId0mrLHoo/BNuHb
 QVm7RB34wrtXJQ2v9AhwuAbmht42+hwtBGEqNqVQpKpemFeM7ItRJ34FynNwRqQl+im0
 SEOA==
X-Gm-Message-State: APjAAAXfpRD2xZEr54ZjZkCQmFy++LV7ot6+/vgTtfnMVLgDD3wLulSG
 izUwWX+FJFhXSNPw5yOZRzrmKA==
X-Received: by 2002:a5d:42ca:: with SMTP id t10mr65237998wrr.202.1560834929394; 
 Mon, 17 Jun 2019 22:15:29 -0700 (PDT)
Received: from [192.168.1.103] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id t14sm9729872wrr.33.2019.06.17.22.15.28
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 22:15:28 -0700 (PDT)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-2-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <02009ef4-a022-b8e8-ab3f-6256849c48c8@redhat.com>
Date: Tue, 18 Jun 2019 07:15:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416013902.4941-2-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/5] i.mx7d: Add
 no-op/unimplemented APBH DMA module
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5XgjebS2ATn

On 4/16/19 3:38 AM, Andrey Smirnov wrote:
> Instantiate no-op APBH DMA module. Needed to boot latest Linux kernel.
> 
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---
>  include/hw/arm/fsl-imx7.h | 3 +++
>  hw/arm/fsl-imx7.c         | 6 ++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
> index d848262bfd..aae4f860fc 100644
> --- a/include/hw/arm/fsl-imx7.h
> +++ b/include/hw/arm/fsl-imx7.h
> @@ -179,6 +179,9 @@ enum FslIMX7MemoryMap {
>      FSL_IMX7_PCIE_REG_SIZE        = 16 * 1024,
>  
>      FSL_IMX7_GPR_ADDR             = 0x30340000,
> +
> +    FSL_IMX7_DMA_APBH_ADDR        = 0x33000000,
> +    FSL_IMX7_DMA_APBH_SIZE        = 0x2000,

0x8000?

>  };
>  
>  enum FslIMX7IRQs {
> diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
> index 7663ad6861..1abfa5910c 100644
> --- a/hw/arm/fsl-imx7.c
> +++ b/hw/arm/fsl-imx7.c
> @@ -526,6 +526,12 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
>       */
>      create_unimplemented_device("lcdif", FSL_IMX7_LCDIF_ADDR,
>                                  FSL_IMX7_LCDIF_SIZE);
> +
> +    /*
> +     * DMA APBH
> +     */
> +    create_unimplemented_device("dma-apbh", FSL_IMX7_DMA_APBH_ADDR,
> +                                FSL_IMX7_DMA_APBH_SIZE);
>  }
>  
>  static void fsl_imx7_class_init(ObjectClass *oc, void *data)
> 
