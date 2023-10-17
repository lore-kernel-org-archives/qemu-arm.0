Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4176373ejc;
        Tue, 17 Oct 2023 13:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbb75gvOHbYznNkhV16Z8jyUpZogjjo0jgAFU7LB1SimtCLdjFQdSYKgTWydYc2KT+oocZ
X-Received: by 2002:a05:620a:8d8b:b0:774:c82:7536 with SMTP id rc11-20020a05620a8d8b00b007740c827536mr2737121qkn.71.1697573851422;
        Tue, 17 Oct 2023 13:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697573851; cv=none;
        d=google.com; s=arc-20160816;
        b=ykmXEBK1zHtoeTM9aty1yiDyRTMnaHSOmyPzvpcbV5hGE9VYPg6LO6JNafSmH5gOJd
         4S294WnDQPZrOJYeeU/dE/813VK/UV4P2QeUmhznFgY6Ot7IcovrqDBdmyd4oURCmTLp
         A/wpkMxC1wKxZBpw2Hv/juJYuLTyFDnv/D/m3YMA8MKkN3z+bqntndjciXbQuxaMGEAY
         nlpmGdmVD9uHTR/KkjFsDUGG07DA9diPJtW6YPNZ9C758qf5nXqnu/07ujnjw6xvaIK6
         f6ihOW9/UcMOxq4edbPVOlYRflunx8IdeO9/EPXK0OSzfOcTmTJY1YTohpVP8zW2Gwvj
         kKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=lkxeu00A0vvBzRFphgu8OIn+3AkgcTlKikfqF4TJmuw=;
        fh=hOIYQAkp+qllEZGDaNYMtbC69yK4JPmV8Zv5L5YpIPE=;
        b=JwTKQz3kc+IzfxDXCpDLDwIBZ2SL4MM3A1Hmoz6umSLzioqtXZbdxrKQI3yTk8Ox8D
         gn9GchN1bNpIkMknUPrAUW5Y/G3uEpmSlmDjk89RUOujRnCThbO+AS07aEQUGot8Nb9n
         qSvSqsnAAxyLkXoIUWJPjLjdkyAel/peNqpe3btLUTAeSZ6QwW6gBTKOV5EnarFWvkYH
         ePch8pfaYJyET6c9UaCwxA9MGouvcpEppFRih9Cz7KzSM0AZJBLiIYOBG2z0tp+ly1ni
         fedQFjtEtyfzRFK/koOS3emx+rAPqDGAqWp9PuCICAuW2fpbSuOrq/J+gooqiNvIXlda
         t/Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="zWNlH/p2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3-20020a05620a06c300b0076f185b6bd7si1574245qky.432.2023.10.17.13.17.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 13:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b="zWNlH/p2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsqVK-0001Eh-Fp; Tue, 17 Oct 2023 16:17:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqVJ-0001D4-1v; Tue, 17 Oct 2023 16:17:25 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqVH-0007IK-Kj; Tue, 17 Oct 2023 16:17:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lkxeu00A0vvBzRFphgu8OIn+3AkgcTlKikfqF4TJmuw=; b=zWNlH/p2JasjbSpTmwyExcHlY3
 gKlBEMVeDjJ9Ayek2iPoK/fBHjyE79Z91t5LJqI5qNeTH+NuagwwtN52ATfoWYix+b/VnSmtaELDd
 NJ2RclO87kp6M9+6BmyRKuPkm/4jfbZ7+IrvGoCTUomxeHL00B8y9hvHSHWkQ5/leIDrYbYWrB9YG
 eM9V31bnyiuKEQtdFLYIXLFvj/fFW/t4e20W1SEN//Jk0vWWdJVF+e93xJ8FuUGKjIPFqsxmIy3Q/
 OOEZONHg03Bn+iafq4oXBy5+vtQEInqjUmZgfnHDDEz9cTGclZxi2CVdOavVtbJfZiwP5F6Xan++M
 fJZySWaiG6ch9pD1Ow/xIF3O5YPws4V8p9y3jHaFEvQAVtCKFCRgwCeFOy4iZeSAgLoYGWceHxPHZ
 hDgcOnKUoPBnO2LYHh/Kcd2Mf05qMIfVbcPM+1rNuVC7oUlbq/d9X4o3x2zMgKf/di/COq12uQ4so
 oCBMS6AU3QoJiSSh0VEZTQRGE6Umd1bKILIImji8/wG3a/JyyiMXfCNaqeamjEGe4byuP+4kmWqrh
 QYvfE1v2DroZCIduTrCeXuarq8PA1LTmP9GTJpzrpGM2pCuMHqmniXlfLDmVxChn/kWC7eko5ls4f
 hmTCwQh50UKXtB4bKT8IpzICcc0qHSHoBhMromzAM=;
Received: from [2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1qsqV6-0001jU-GS; Tue, 17 Oct 2023 21:17:16 +0100
Message-ID: <cff6e73c-ed58-4367-9a4d-e66df40e20b3@ilande.co.uk>
Date: Tue, 17 Oct 2023 21:17:15 +0100
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
 <20231017140150.44995-7-philmd@linaro.org>
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
In-Reply-To: <20231017140150.44995-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bb0:3200:407d:a65c:9fb4:b9b4
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 6/7] hw/net: Declare link using static DEFINE_PROP_LINK()
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
X-TUID: fvuIsABZLBij

On 17/10/2023 15:01, Philippe Mathieu-Daudé wrote:

> Declare link statically using DEFINE_PROP_LINK().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/net/cadence_gem.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index f445d8bb5e..37e209cda6 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -1654,11 +1654,6 @@ static void gem_init(Object *obj)
>                             "enet", sizeof(s->regs));
>   
>       sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
> -
> -    object_property_add_link(obj, "dma", TYPE_MEMORY_REGION,
> -                             (Object **)&s->dma_mr,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_STRONG);
>   }
>   
>   static const VMStateDescription vmstate_cadence_gem = {
> @@ -1691,6 +1686,8 @@ static Property gem_properties[] = {
>                         num_type2_screeners, 4),
>       DEFINE_PROP_UINT16("jumbo-max-len", CadenceGEMState,
>                          jumbo_max_len, 10240),
> +    DEFINE_PROP_LINK("dma", CadenceGEMState, dma_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST(),
>   };

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

