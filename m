Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7135512njc;
        Mon, 11 Nov 2024 22:32:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXxEjqFFyji0XrLNcckvEQvmqQNmPyDk0Itewv2gJ3L0CobB7w8VxL6uJ0sSj7jHEXYQDHwLTjAtVahng==@linaro.org
X-Google-Smtp-Source: AGHT+IGAIcHCiHpi23siSv8w5LIBirlBlUX7aAv+fgWQKSFRP7OoX5dTcS7FyQcIkU/sxe41KEZS
X-Received: by 2002:a05:6214:3da0:b0:6d3:b886:5545 with SMTP id 6a1803df08f44-6d3d01fef4emr20413556d6.26.1731393159961;
        Mon, 11 Nov 2024 22:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731393159; cv=none;
        d=google.com; s=arc-20240605;
        b=hQl8cCBcI1HLoWtSb3HDDieIATCE5XiPVcwOQJl8zatjAg0baM0lCUtrMd8fYrdb6b
         b2T2vPEtID9PfZCFpsoRakhyGxhtr939G0DWqpAMp8QTTVNwYLLl9/Cteo7fCaq5KfqW
         JNIxurwcr9EmVu001FtAQIL8mb7+3vfXYdRS7S9jmTlPI51stxFBoK7wewUMuUUvdeNG
         P65ABbo2bACu/6LC5u0AgaHkVtwj7KVwxTr8qzsUYf1n6rI4lA0HkSwE3qhRFcVCTiJu
         W9C8ZtHfeqxypHwk9BzYTDEihxvXJTz/k2AMmzxcL3aoT6HTjBrDI/V8EV4j2aDOxX9q
         pscg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=0L/CgHHNNublx3TCfAwMAujjV8DdXdezaQK/9h7mk1A=;
        fh=c/DafolO1AODdY7W7Nno9/l/T4qMqacyf0iRepQZA6o=;
        b=caxRC6Ok871qp/LsuoTmu5D21xcYGqjKRHdIuqGZeWEA15LZrUzcfyigqEVPCmEXzq
         3XnSXtSmaEE3SQUulDvsSn1uIkFbLVSU8R50B1rdTNsU3jw6Vyxuogqi0wixVVSsRnsn
         GkCB9joJ6nEFJNTxjyWX5hur9gkmQ+pVYiU2UFJ4fwjyrrarE2GAyVllvLnxwzM2wg/B
         sHEfNW8MzyFtv/PUmy59p8graW/OAkSkkvKDcRRYX3I0RHrBzMU4uu2pat7uo0RLJuVh
         KkFjMVzFqlIknq3LaeG7KaiYzDDSOMFJEu81ocB9NWJNEgPffyTt26JzfNwhgcrNsq3+
         /6Ew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EOKuSoB2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3962286e9si144062916d6.149.2024.11.11.22.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 22:32:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EOKuSoB2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAkRy-000162-5J; Tue, 12 Nov 2024 01:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAkRv-00015E-Im
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 01:32:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tAkRq-0002Xo-Ek
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 01:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731393141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0L/CgHHNNublx3TCfAwMAujjV8DdXdezaQK/9h7mk1A=;
 b=EOKuSoB2ErXEiMuqdQfIlprRaaHhnaSX4B/PgwCCuE/EWB78pWytRLEX3xK1JRUnEI59mz
 n16E2Zu6DNVDsEt5RowWuN2dTt7qVZrs/140cOcWvXDufPxeZ9BRhiE26Wsl3r8oEId9fC
 K0lQLo+Mukl0FOW87cUldArn6nSZPXw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-rIhjfE3EMXKzLQfs2ZEZBw-1; Tue, 12 Nov 2024 01:32:16 -0500
X-MC-Unique: rIhjfE3EMXKzLQfs2ZEZBw-1
X-Mimecast-MFC-AGG-ID: rIhjfE3EMXKzLQfs2ZEZBw
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a9a01cba9f7so413643766b.3
 for <qemu-arm@nongnu.org>; Mon, 11 Nov 2024 22:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731393136; x=1731997936;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0L/CgHHNNublx3TCfAwMAujjV8DdXdezaQK/9h7mk1A=;
 b=dbr520KJK0KtlvopITgIxa/TtRdeAJBtPT0aghQZ9/oX7WjtnKp8cWJIaipB4aq7LK
 9jdClx2Wo1fa6u+dnDx1iqOaqXp0fCUXIWQKrrStuW4BDUQ9MEzhOwN6IloxAmT9GJZq
 xQwzQcOvcV4iqKucnQRf9pQeFyIU4dewSFoS5w9cW83yTzUBghDXYusbgSbuJBLWC0BF
 FwN1j1aAeLMd0eOcll1rYuss7sfsVZezHVDVWR4EXiQXdEUIVYDZ1IKvg3kDPGIHxy9p
 u62XoqPPp+qlnGZBkWEnAWnXkw6NC6GA1JO7yIxUABbTRV/49DtYHAlk1zzKyKDVLqKO
 fp7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4rv7awrNpNkEAtGVwgxU4PXpkGjqpAEr40DoGGH0nS4Ui2FKgMtMZT8ek0N1pzdvqX5w53KLZiA==@nongnu.org
X-Gm-Message-State: AOJu0YzRPQPxggJKLyk5ZP69bUi4c/D9HOAQ9mdpAYXZZxsjj9Jo+rtP
 SozKYkFq2f1bYACNDm7UwHbixmEj809YAdZm5Z7ZhVk/Uw2xRG7K7HfslYCjtwulELoKUNmsozs
 85bBmCbBFASC+L9pbelhW5gZGGtiXMqMYyBMK60aAQJ9MrQzOSw==
X-Received: by 2002:a17:907:a4b:b0:a9a:dfa5:47d2 with SMTP id
 a640c23a62f3a-a9ef0019726mr1479030666b.59.1731393135682; 
 Mon, 11 Nov 2024 22:32:15 -0800 (PST)
X-Received: by 2002:a17:907:a4b:b0:a9a:dfa5:47d2 with SMTP id
 a640c23a62f3a-a9ef0019726mr1479028666b.59.1731393135305; 
 Mon, 11 Nov 2024 22:32:15 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-50-175.web.vodafone.de.
 [109.42.50.175]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a18854sm685703166b.29.2024.11.11.22.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 22:32:14 -0800 (PST)
Message-ID: <2a318a7f-dd37-4fce-9106-7a85236c9408@redhat.com>
Date: Tue, 12 Nov 2024 07:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/8] usb/uhci: Move PCI-related code into a separate
 file
To: Guenter Roeck <linux@roeck-us.net>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 BALATON Zoltan <balaton@eik.bme.hu>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org
References: <20240906122542.3808997-1-linux@roeck-us.net>
 <20240906122542.3808997-4-linux@roeck-us.net>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240906122542.3808997-4-linux@roeck-us.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OnjzmrlqsVmozD9KIbWkpqzI60yshlN8cn6t7Hk0KFI_1731393136
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.671,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3XITKroNYxJw

On 06/09/2024 14.25, Guenter Roeck wrote:
> Some machines (like Aspeed ARM) only have a sysbus UHCI controller.
> The current UHCI implementation only supports PCI based UHCI controllers.
> Move the UHCI-PCI device code into a separate file so that it is possible
> to create a sysbus UHCI device without PCI dependency.

  Hi Guenter,

I think there's a bug in here ...

> diff --git a/hw/usb/vt82c686-uhci-pci.c b/hw/usb/vt82c686-uhci-pci.c
> index 6162806172..7fdb4697f9 100644
> --- a/hw/usb/vt82c686-uhci-pci.c
> +++ b/hw/usb/vt82c686-uhci-pci.c
> @@ -1,17 +1,17 @@
>   #include "qemu/osdep.h"
>   #include "hw/irq.h"
>   #include "hw/isa/vt82c686.h"
> -#include "hcd-uhci.h"
> +#include "hcd-uhci-pci.h"
>   
>   static void uhci_isa_set_irq(void *opaque, int irq_num, int level)
>   {
> -    UHCIState *s = opaque;
> +    UHCIPCIState *s = opaque;

You use UHCIPCIState as parameter for the irq-related functions...

>       via_isa_set_irq(&s->dev, 0, level);
>   }
>   
>   static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>   {
> -    UHCIState *s = UHCI(dev);
> +    UHCIPCIState *s = UHCI_PCI(dev);
>       uint8_t *pci_conf = s->dev.config;
>   
>       /* USB misc control 1/2 */
> @@ -21,12 +21,12 @@ static void usb_uhci_vt82c686b_realize(PCIDevice *dev, Error **errp)
>       /* USB legacy support  */
>       pci_set_long(pci_conf + 0xc0, 0x00002000);
>   
> -    usb_uhci_common_realize(dev, errp);
> -    object_unref(s->irq);
> -    s->irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);
> +    usb_uhci_common_realize_pci(dev, errp);
> +    object_unref(s->state.irq);
> +    s->state.irq = qemu_allocate_irq(uhci_isa_set_irq, &s->state, 0);

... but you set it up with UHCIInfo as parameter here. I think this line 
should rather be:

     s->state.irq = qemu_allocate_irq(uhci_isa_set_irq, s, 0);

Shouldn't it?

  Thomas

