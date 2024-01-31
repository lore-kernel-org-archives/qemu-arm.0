Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp1431503ejk;
        Wed, 31 Jan 2024 04:14:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFftIqv2eiBKgoAiq+CwtKMywBInhdiyqDf0dHZJSyLWDV7xxGV2DUmHcRjdlg3sH7WurvQ
X-Received: by 2002:a05:620a:2a15:b0:785:3f31:b660 with SMTP id o21-20020a05620a2a1500b007853f31b660mr598508qkp.16.1706703285420;
        Wed, 31 Jan 2024 04:14:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706703285; cv=none;
        d=google.com; s=arc-20160816;
        b=KumTduR+BX5bJoWxRIyemApz8Wo3D6smpC14eS4rF+sfp+hEw9aaSstxOl+KHRWpWP
         LNcYAAMp54kYAiX5DK6F/6lD1wySAVrDy+0fL58ofzmdhKifk25frkueRrcmb5aN7yPL
         zXDVrz3zrN8VMQZQ7WB49kRpC/h3wsaNFp8hs/LQQoJKsUgEQXBNzf+z0270I2eT7UlX
         tP5Rkid1IPGlRXUWp4k8yVQh0crwbxxulOG486iZZKMpeDncbnD7VAYePZdPjTMPU6KT
         a4EAghCt/1iPHy3Cs+LERzQBcgT3jiHBK/vo9bCpLSmu1zRWd8uwrxWHVmbE7S6I0JRI
         NWIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=ixbf8MQxGmVaSKrYxOhBY7rmtk7uk2A4FZyVUvl/PXo=;
        fh=n/++KNHAeKom0sLMRaijIHyWevvOu/sPIW8IqtemACE=;
        b=E8U4oa6sNozMP2GFfkCADUVJQwZhGdfo3MI7rkHAJcSpLRIQa8y3K/uwvIDIPiC1Yj
         UvxN/+XtJNQUY8zalUYKO4GAuSgw76dv40n/JOBv3FoFQuvxRYypUO8CiDCTYhxwi5qs
         GtWpBtfXLgOwsQnEb5YxHERG9kfwWGIWhUl8wFVYdO/4g33sQJWIxYlAr9Gwqv8gaHMm
         B03A3ryhCOI2OOIBJGozusHBhRPDMxaDVwzuhwbrFAF2DmGc5xIg9OlAh28DbuP3ZBFH
         h6P6Wzv21PoI8ZnhwbahuNiVm25pfvO7oVZbuhNGgm2eEOU1+3Hk1y6mI8Q1J9kwu0+J
         cJgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJiu6gx9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq27-20020a05620a611b00b0078335234933si11690551qkn.291.2024.01.31.04.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 Jan 2024 04:14:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MJiu6gx9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rV9Tv-0004vW-M6; Wed, 31 Jan 2024 07:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rV9Tt-0004s2-Fw
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 07:14:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rV9Tq-0008Ad-Jr
 for qemu-arm@nongnu.org; Wed, 31 Jan 2024 07:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706703253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ixbf8MQxGmVaSKrYxOhBY7rmtk7uk2A4FZyVUvl/PXo=;
 b=MJiu6gx92Ns92NjMd34rnAbGy1geoJpmuTHQyAYJyGhl174PcYUOF/Gmt7u4MZpdS8jO2U
 gAMPeE+jblzVcLZ26cXlTAUJZdNMTiuKe264govU4oatUKaPnvh2K7YGNm7ms6YV5ECXJX
 7XuKJQjhlAIa0PJu6hyjHT6ImxzVd4w=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-sZHqX0t8Oj2SmmQzPS9Ltw-1; Wed, 31 Jan 2024 07:14:12 -0500
X-MC-Unique: sZHqX0t8Oj2SmmQzPS9Ltw-1
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-dc3645a6790so10006159276.0
 for <qemu-arm@nongnu.org>; Wed, 31 Jan 2024 04:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706703251; x=1707308051;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ixbf8MQxGmVaSKrYxOhBY7rmtk7uk2A4FZyVUvl/PXo=;
 b=WLf2aHEgHW0L+60Sg7XL2kzXt0L4XKpeQA5Ku8kFG3gx69f4LWeILTMRrfWyiPeB/f
 CreMh8dJiCcDMCx/ju8tmmDwx7eHc5Rd3oAYmP3Gv/7mmoa81nWcqrG9yDG8eFzBDv4j
 IoD02sRWex82hVEawmoN8GYZ/CP6VxxEZ6RN28Nk/S4KGNrS26r6daAS4/AdaFpeY+mO
 3IBVQGXZjVw+yNSrY+AA2ybqUKEI/+Ls2iBjwbnIAtSVjxkV59xHRG+f7Hwby9zKgbev
 9fWD1/rVjeJ28V0+MoaExV8B1boNGH4ZG++OMjMwWf7C851nrUaBRq6WR071Lt+4z/7A
 GrDA==
X-Gm-Message-State: AOJu0Yy+Vzr0YyRwNCXURHCx3aVaZ5Xdgy/nV79JMOQErdQlC01Z49SJ
 W5+hyf446gm+SfKKz4z/ooroEZApfXn//t9IJvop45S2Uq2qtdsrFUnSGvPPs48jH7O87GJfRUQ
 YPdXX7SctyBnIE3MH/YEizi3DDbIe27YRzl74TRzHyAooJMySGQ==
X-Received: by 2002:a25:b2a2:0:b0:dc6:adf5:5a8e with SMTP id
 k34-20020a25b2a2000000b00dc6adf55a8emr1337564ybj.32.1706703251247; 
 Wed, 31 Jan 2024 04:14:11 -0800 (PST)
X-Received: by 2002:a25:b2a2:0:b0:dc6:adf5:5a8e with SMTP id
 k34-20020a25b2a2000000b00dc6adf55a8emr1337519ybj.32.1706703250875; 
 Wed, 31 Jan 2024 04:14:10 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 ph15-20020a0562144a4f00b0068c50dec857sm2740939qvb.128.2024.01.31.04.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 04:14:10 -0800 (PST)
Message-ID: <d3f5d8a7-a224-4269-9f17-5f411266ba64@redhat.com>
Date: Wed, 31 Jan 2024 13:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/47] hw/arm/stellaris: use qemu_find_nic_info()
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Rob Herring <robh@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Helge Deller <deller@gmx.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Song Gao
 <gaosong@loongson.cn>, Thomas Huth <huth@tuxfamily.org>,
 Laurent Vivier <laurent@vivier.eu>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
 Jia Liu <proljc@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Bin Meng
 <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20240126173228.394202-1-dwmw2@infradead.org>
 <20240126173228.394202-30-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240126173228.394202-30-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: UpLzLjqtZJb9

On 26/01/2024 18.25, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Rather than just using qemu_configure_nic_device(), populate the MAC
> address in the system-registers device by peeking at the NICInfo before
> it's assigned to the device.
> 
> Generate the MAC address early, if there is no matching -nic option.
> Otherwise the MAC address wouldn't be generated until net_client_init1()
> runs.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/arm/stellaris.c | 30 ++++++++++++++++++++++--------
>   1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index d18b1144af..34c5a86ac2 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -1028,7 +1028,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>       DeviceState *ssys_dev;
>       int i;
>       int j;
> -    const uint8_t *macaddr;
> +    NICInfo *nd;
> +    MACAddr mac;
>   
>       MemoryRegion *sram = g_new(MemoryRegion, 1);
>       MemoryRegion *flash = g_new(MemoryRegion, 1);
> @@ -1051,12 +1052,22 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>        * need its sysclk output.
>        */
>       ssys_dev = qdev_new(TYPE_STELLARIS_SYS);
> -    /* Most devices come preprogrammed with a MAC address in the user data. */
> -    macaddr = nd_table[0].macaddr.a;
> +
> +    /*
> +     * Most devices come preprogrammed with a MAC address in the user data.
> +     * Generate a MAC address now, if there isn't a matching -nic for it.
> +     */
> +    nd = qemu_find_nic_info("stellaris_enet", true, "stellaris");
> +    if (nd) {
> +        memcpy(mac.a, nd->macaddr.a, sizeof(mac.a));
> +    } else {
> +        qemu_macaddr_default_if_unset(&mac);
> +    }
> +
>       qdev_prop_set_uint32(ssys_dev, "user0",
> -                         macaddr[0] | (macaddr[1] << 8) | (macaddr[2] << 16));
> +                         mac.a[0] | (mac.a[1] << 8) | (mac.a[2] << 16));
>       qdev_prop_set_uint32(ssys_dev, "user1",
> -                         macaddr[3] | (macaddr[4] << 8) | (macaddr[5] << 16));
> +                         mac.a[3] | (mac.a[4] << 8) | (mac.a[5] << 16));

Out of scope of your patch, but I wonder why we didn't use 
qdev_prop_set_macaddr() with an according MAC address property for this 
device...?

>       qdev_prop_set_uint32(ssys_dev, "did0", board->did0);
>       qdev_prop_set_uint32(ssys_dev, "did1", board->did1);
>       qdev_prop_set_uint32(ssys_dev, "dc0", board->dc0);
> @@ -1269,10 +1280,13 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>       if (board->dc4 & (1 << 28)) {
>           DeviceState *enet;
>   
> -        qemu_check_nic_model(&nd_table[0], "stellaris");
> -
>           enet = qdev_new("stellaris_enet");
> -        qdev_set_nic_properties(enet, &nd_table[0]);
> +        if (nd) {
> +            qdev_set_nic_properties(enet, nd);
> +        } else {
> +            qdev_prop_set_macaddr(enet, "mac", mac.a);
> +        }
> +
>           sysbus_realize_and_unref(SYS_BUS_DEVICE(enet), &error_fatal);
>           sysbus_mmio_map(SYS_BUS_DEVICE(enet), 0, 0x40048000);
>           sysbus_connect_irq(SYS_BUS_DEVICE(enet), 0, qdev_get_gpio_in(nvic, 42));

Reviewed-by: Thomas Huth <thuth@redhat.com>

