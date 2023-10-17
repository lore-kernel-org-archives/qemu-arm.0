Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4176128ejc;
        Tue, 17 Oct 2023 13:17:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBQn9e00byHgT4BuGw2SjZ3MiJrmjrOuZ2WBdr3niDiuZvB0XUJUsyx9h2gpD0T+MGrqVc
X-Received: by 2002:a05:6214:19cf:b0:65a:fe1f:3cc2 with SMTP id j15-20020a05621419cf00b0065afe1f3cc2mr3906281qvc.38.1697573820218;
        Tue, 17 Oct 2023 13:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697573820; cv=none;
        d=google.com; s=arc-20160816;
        b=UTAgzCuX30cVUn6rdY10cYsJ+uwI7dWWEEk3+ELvbJQ/IEN2ohsUbkqxJrrXoYHT0r
         OoNjMmR4Our+3BhCdzquMSBWdJHvZBKcUvDWWsdwVsY66KBZ0tB/LDhJAaua1KLqbUMn
         mpENeKR7g+msYzWwYasASiucKshBwtQwnRW2xVSVB9WUTBAOTyU4hVTeUveYJYM7tyGu
         ZdSxx8iLd3E5x3FFsR6iGDXBbPsaDxuKYyq54J9gwMlzIMVTIT39AL9u/U8Gjd9NdXgS
         45/Odk8kxwhOTcV5RyDHE6yeVWorYm5AYWwVl+GJUawjPK8Pv2xSoiTpSvgqsiB1t5Tg
         9IBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cxDBOTosnupmuqxX/7kQ2aAGEAHbnqEna4Z9DvcsP7E=;
        fh=hOIYQAkp+qllEZGDaNYMtbC69yK4JPmV8Zv5L5YpIPE=;
        b=aFQgexQGxMth9qZVoHsXkYmvnUeZguonT9KGDSr+esoP9lvGV2fPWFUWhscrKgcF0B
         M5J/ysR8oIY5BzoVF+Jz89JUsA+5xrzl0SeYylccNmz31Q+AH3SjMNRoL+8+gYh2wWi5
         88ncUafRZnQ3gLrmY6odM8+CtWBQvEwDTf0YxVTXWyU9ut23xjC0UwwCZOXzhcQ0i0dt
         heh7t6bZOh2dSvbANN2iFEsc7eYF7C9Wa/gEMUISTMXjFqq3O8DHSn136UIxDUU4cUa9
         gjxMxpOv+57aAYY+SfNWyZvCtPmqm8Ndwm6/A1CcgwqthdTv4MUrutZwmbQn5bnHbGJL
         DjYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=yh2cE7bB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br20-20020a05620a461400b0076cae48eb5dsi1634111qkb.234.2023.10.17.13.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 13:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=yh2cE7bB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsqUV-00085c-Jf; Tue, 17 Oct 2023 16:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqUS-00082C-Jm; Tue, 17 Oct 2023 16:16:33 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqUQ-0007D9-Ta; Tue, 17 Oct 2023 16:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cxDBOTosnupmuqxX/7kQ2aAGEAHbnqEna4Z9DvcsP7E=; b=yh2cE7bBOK6i1mBL5zS0G8pN2e
 QIVgndEUIcN4EWizRtM7LCKa2/dvP4hG8GzAsrn6LapInDBhwap5X2qVyODHYc8jqloWF5HZucwJv
 9BVZW/zr9tq3HpBCBlSQ7PvvejDXBWR32QuPgR2Dpb8G4JvCXIUEVVWSuc+u5sFFNme/e/IZeb7v+
 GXwmdGBhwxSca/mSkK513n63Yc/vFWuQF1mDxsX+RTMgdEHd2pyMk7HUODfjSCMFyqXQ/xY6pwC7J
 F0pTdmxDC3iAvYocSPCbludaZ7Z9QSbEXmvGvEFhuZfV8XRSnMDKyW91WF94VattTp8FZ05ljWnRE
 gRkRz6rN3hu0A6xz+hXBoN+KogV3G9SKRxdDIK/2sqEbascfWcriwt3/ek3b32oKQ7aok6PFDiLAG
 gIjchKMQ8Rj+mlvVUCNq60hbWiO3yBj+y0FORDGqjR4qmnKCHBzDpSzWiwTjxM8e5uAUmFaDHgueX
 HBVmQC5JaRPEucfiH0g7yjgcynp57d0OmrWDOyQlMwdtOnSKQws6/M8VURmCYGdoY+3Yw+hlKQ4IF
 iQPkq44vGkme1YBoDjAzQ+VHfx4S24oLPnZtmAxtJYwjYfV4Czr0PG2nVWrcsdWRy/SmWKScAT4EU
 zP8dJzVNVCuM/pqRaSUvwmGSgXK9CW6WHqY8YcR9g=;
Received: from [2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqUF-0001jU-GM; Tue, 17 Oct 2023 21:16:23 +0100
Message-ID: <682c90c6-ee38-46c1-8236-895a37478a6c@ilande.co.uk>
Date: Tue, 17 Oct 2023 21:16:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Gerd Hoffmann <kraxel@redhat.com>
References: <20231017140150.44995-1-philmd@linaro.org>
 <20231017140150.44995-6-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Autocrypt: addr=mark.cave-ayland@ilande.co.uk; keydata=
 xsBNBFQJuzwBCADAYvxrwUh1p/PvUlNFwKosVtVHHplgWi5p29t58QlOUkceZG0DBYSNqk93
 3JzBTbtd4JfFcSupo6MNNOrCzdCbCjZ64ik8ycaUOSzK2tKbeQLEXzXoaDL1Y7vuVO7nL9bG
 E5Ru3wkhCFc7SkoypIoAUqz8EtiB6T89/D9TDEyjdXUacc53R5gu8wEWiMg5MQQuGwzbQy9n
 PFI+mXC7AaEUqBVc2lBQVpAYXkN0EyqNNT12UfDLdxaxaFpUAE2pCa2LTyo5vn5hEW+i3VdN
 PkmjyPvL6DdY03fvC01PyY8zaw+UI94QqjlrDisHpUH40IUPpC/NB0LwzL2aQOMkzT2NABEB
 AAHNME1hcmsgQ2F2ZS1BeWxhbmQgPG1hcmsuY2F2ZS1heWxhbmRAaWxhbmRlLmNvLnVrPsLA
 eAQTAQIAIgUCVAm7PAIbAwYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQW8LFb64PMh9f
 NAgAuc3ObOEY8NbZko72AGrg2tWKdybcMVITxmcor4hb9155o/OWcA4IDbeATR6cfiDL/oxU
 mcmtXVgPqOwtW3NYAKr5g/FrZZ3uluQ2mtNYAyTFeALy8YF7N3yhs7LOcpbFP7tEbkSzoXNG
 z8iYMiYtKwttt40WaheWuRs0ZOLbs6yoczZBDhna3Nj0LA3GpeJKlaV03O4umjKJgACP1c/q
 T2Pkg+FCBHHFP454+waqojHp4OCBo6HyK+8I4wJRa9Z0EFqXIu8lTDYoggeX0Xd6bWeCFHK3
 DhD0/Xi/kegSW33unsp8oVcM4kcFxTkpBgj39dB4KwAUznhTJR0zUHf63M7ATQRUCbs8AQgA
 y7kyevA4bpetM/EjtuqQX4U05MBhEz/2SFkX6IaGtTG2NNw5wbcAfhOIuNNBYbw6ExuaJ3um
 2uLseHnudmvN4VSJ5Hfbd8rhqoMmmO71szgT/ZD9MEe2KHzBdmhmhxJdp+zQNivy215j6H27
 14mbC2dia7ktwP1rxPIX1OOfQwPuqlkmYPuVwZP19S4EYnCELOrnJ0m56tZLn5Zj+1jZX9Co
 YbNLMa28qsktYJ4oU4jtn6V79H+/zpERZAHmH40IRXdR3hA+Ye7iC/ZpWzT2VSDlPbGY9Yja
 Sp7w2347L5G+LLbAfaVoejHlfy/msPeehUcuKjAdBLoEhSPYzzdvEQARAQABwsBfBBgBAgAJ
 BQJUCbs8AhsMAAoJEFvCxW+uDzIfabYIAJXmBepHJpvCPiMNEQJNJ2ZSzSjhic84LTMWMbJ+
 opQgr5cb8SPQyyb508fc8b4uD8ejlF/cdbbBNktp3BXsHlO5BrmcABgxSP8HYYNsX0n9kERv
 NMToU0oiBuAaX7O/0K9+BW+3+PGMwiu5ml0cwDqljxfVN0dUBZnQ8kZpLsY+WDrIHmQWjtH+
 Ir6VauZs5Gp25XLrL6bh/SL8aK0BX6y79m5nhfKI1/6qtzHAjtMAjqy8ChPvOqVVVqmGUzFg
 KPsrrIoklWcYHXPyMLj9afispPVR8e0tMKvxzFBWzrWX1mzljbBlnV2n8BIwVXWNbgwpHSsj
 imgcU9TTGC5qd9g=
In-Reply-To: <20231017140150.44995-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 5/7] hw/dma: Declare link using static DEFINE_PROP_LINK()
 macro
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DtDF/81l7xhC

On 17/10/2023 15:01, Philippe Mathieu-Daudé wrote:

> Declare link statically using DEFINE_PROP_LINK().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/dma/xilinx_axidma.c |  6 ++----
>   hw/dma/xlnx-zdma.c     |  7 ++-----
>   hw/dma/xlnx_csu_dma.c  | 13 ++++---------
>   3 files changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
> index 12c90267df..0ae056ed06 100644
> --- a/hw/dma/xilinx_axidma.c
> +++ b/hw/dma/xilinx_axidma.c
> @@ -577,10 +577,6 @@ static void xilinx_axidma_init(Object *obj)
>       object_initialize_child(OBJECT(s), "axistream-control-connected-target",
>                               &s->rx_control_dev,
>                               TYPE_XILINX_AXI_DMA_CONTROL_STREAM);
> -    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
> -                             (Object **)&s->dma_mr,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_STRONG);
>   
>       sysbus_init_irq(sbd, &s->streams[0].irq);
>       sysbus_init_irq(sbd, &s->streams[1].irq);
> @@ -596,6 +592,8 @@ static Property axidma_properties[] = {
>                        tx_data_dev, TYPE_STREAM_SINK, StreamSink *),
>       DEFINE_PROP_LINK("axistream-control-connected", XilinxAXIDMA,
>                        tx_control_dev, TYPE_STREAM_SINK, StreamSink *),
> +    DEFINE_PROP_LINK("dma", XilinxAXIDMA, dma_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
> index 4eb7f66e9f..84c0083013 100644
> --- a/hw/dma/xlnx-zdma.c
> +++ b/hw/dma/xlnx-zdma.c
> @@ -795,11 +795,6 @@ static void zdma_init(Object *obj)
>                             TYPE_XLNX_ZDMA, ZDMA_R_MAX * 4);
>       sysbus_init_mmio(sbd, &s->iomem);
>       sysbus_init_irq(sbd, &s->irq_zdma_ch_imr);
> -
> -    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
> -                             (Object **)&s->dma_mr,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_STRONG);
>   }
>   
>   static const VMStateDescription vmstate_zdma = {
> @@ -817,6 +812,8 @@ static const VMStateDescription vmstate_zdma = {
>   
>   static Property zdma_props[] = {
>       DEFINE_PROP_UINT32("bus-width", XlnxZDMA, cfg.bus_width, 64),
> +    DEFINE_PROP_LINK("dma", XlnxZDMA, dma_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
> index 88002698a1..e89089821a 100644
> --- a/hw/dma/xlnx_csu_dma.c
> +++ b/hw/dma/xlnx_csu_dma.c
> @@ -702,6 +702,10 @@ static Property xlnx_csu_dma_properties[] = {
>        * which channel the device is connected to.
>        */
>       DEFINE_PROP_BOOL("is-dst", XlnxCSUDMA, is_dst, true),
> +    DEFINE_PROP_LINK("stream-connected-dma", XlnxCSUDMA, tx_dev,
> +                     TYPE_STREAM_SINK, StreamSink *),
> +    DEFINE_PROP_LINK("dma", XlnxCSUDMA, dma_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> @@ -728,15 +732,6 @@ static void xlnx_csu_dma_init(Object *obj)
>   
>       memory_region_init(&s->iomem, obj, TYPE_XLNX_CSU_DMA,
>                          XLNX_CSU_DMA_R_MAX * 4);
> -
> -    object_property_add_link(obj, "stream-connected-dma", TYPE_STREAM_SINK,
> -                             (Object **)&s->tx_dev,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_STRONG);
> -    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
> -                             (Object **)&s->dma_mr,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_STRONG);
>   }
>   
>   static const TypeInfo xlnx_csu_dma_info = {

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

