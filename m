Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4706543ejc;
        Wed, 18 Oct 2023 08:07:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFguU6fkXX27t3Q9wnD+sSLa8W+u03FumKJ2Kmxmi5pex9+3Xr59l1OlEvMo2y9r2WDe5SU
X-Received: by 2002:a05:622a:1647:b0:40f:ce6d:775e with SMTP id y7-20020a05622a164700b0040fce6d775emr6623048qtj.42.1697641639973;
        Wed, 18 Oct 2023 08:07:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697641639; cv=none;
        d=google.com; s=arc-20160816;
        b=idmu7CHIYx+ifPSSLyqA7QJfBawi8joiClaO7Qe7yRgXGpQC5JpdAsoXyryyMad3hA
         KnUy37hK6czG2SiDitzPwFhgtSqSxhhnmC/HSQYTEHhab4+uGaf/oIW9sfXaML0RynII
         CujzA6BcCVkvuGUAF+uvVWPoRaoQTkZoNHWrDv7yLFgYbEi7BlyHPLryV8STPrgZZalt
         9nFWfS05tj7MbgMDEfBCAKoXgePnbDRDLrlt9zUCgosumBdLWhP9/r2AJM5MyfRI1sL8
         gnv/N+wz79/yVeKp9dyOwnT8AxIVqdX8bCyKIeZ3MqGkU/BE5oSLBth8+mIip8FFc4Vv
         1r3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=K19YvKZ66G4Wlr8bFlw0xry5+qJO69cqaJ6k2s51i1g=;
        fh=5KD7BjLGFDublHDNRImOelVUthgQZWbxdG3c9Bb6fGg=;
        b=cxilonn+hbDotX4DFaqVMmdf4FCdYFA3w4nE5O+p3jYwwoHzgGI8NgZL87ZZK/wcEE
         VnPD8FM7V+4ogwfvwa9r6Yk/51FilDVEJ/UJMIN7TenFuVL4SaHmocFj6gapvsV4aMlI
         zuxFdhzIu5rFo6KD6MqTUDcpHCTDFilktYpFp3kuLAzXXENb4WqTWA8aDpSEnzwMD/08
         3a5IBNR9AnDEtZwvpxI6+SRwY6ochriRMh9dGRtf1+hxxy+rVubEplBDXBzLloGz1EMq
         9OQ6JQUtXJpwNxHng0z9TgU65TPnUKiI/8YfiR5l2en/Z8CqJbKALXv76Zph7AxMI+rl
         nEGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dh3qKf6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o12-20020a05622a044c00b0040345635f05si57319qtx.132.2023.10.18.08.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 08:07:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dh3qKf6Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt88I-000323-Lu; Wed, 18 Oct 2023 11:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt88G-00031u-5n
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 11:06:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qt88C-0006Si-5S
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 11:06:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697641603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K19YvKZ66G4Wlr8bFlw0xry5+qJO69cqaJ6k2s51i1g=;
 b=dh3qKf6Y+tmnom3e+ST+QHeAGGyl73lO0LNh4kuYGM1YF9gl27xvuMm8MBT5FSpnDln5PM
 ZkAf61sOvM5i3lpC+c6KtVgo84zYk4/o5irkUI1g2S5bpZ+MsiIDb4OYOMI3Mb3THcZPQ6
 pWbi1SRO3GGa6KijOvJuA8cLYbK//8o=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-hVn__xGgMCG0m6Uphn0K4Q-1; Wed, 18 Oct 2023 11:06:30 -0400
X-MC-Unique: hVn__xGgMCG0m6Uphn0K4Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-77774341b3bso248203985a.3
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 08:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697641590; x=1698246390;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K19YvKZ66G4Wlr8bFlw0xry5+qJO69cqaJ6k2s51i1g=;
 b=qskpx8t7p9aBjTykgYwITlKXTiXM5B6HOgKNTT1iC9p0qexFbti/ng3G30LBifv4vx
 KpefZnH4jkVsIkwoCUZ1K+sIQ+IWHUm6mulZrpUFF1ScXQXP3l3AKFBbZoxBETnJ2keF
 SYeUf4JaaKwKsUIQUCTWagjHwejStGsneC/UYfC+sOhe0ITm3UG8AOriSxijkRhbNGXp
 2etvdheLwuKLEP8W0FzS1wYXpsatXAyRByCWPY2iMSl8YqTRd/IqDwh5jE1lDh4EiX2J
 qXCkNUlv0ItFwVqBXzyPsiy3uLh/G0zBlDmsPqFqSnj1L991fgmm1msV633xXJwrGyAl
 3D0w==
X-Gm-Message-State: AOJu0YxVkCBTu8MSu8uP0o+tQIRIgo7mIPSaQWfkGdOn/lWZO6LRQD4K
 jVS3bDI8N0X7Vhmns+KlRDPwU9pT0EJXGbgwr/EezCEM9/bbsD5dQn9SIqCAber2Z97O+w17rYp
 MEJAXG3RRk+uP
X-Received: by 2002:a05:620a:4547:b0:775:c335:1ee8 with SMTP id
 u7-20020a05620a454700b00775c3351ee8mr6665070qkp.54.1697641590372; 
 Wed, 18 Oct 2023 08:06:30 -0700 (PDT)
X-Received: by 2002:a05:620a:4547:b0:775:c335:1ee8 with SMTP id
 u7-20020a05620a454700b00775c3351ee8mr6665011qkp.54.1697641589893; 
 Wed, 18 Oct 2023 08:06:29 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 bk40-20020a05620a1a2800b00765ab6d3e81sm14980qkb.122.2023.10.18.08.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 08:06:28 -0700 (PDT)
Message-ID: <869ec507-0a64-4275-895d-dea04a79a1fc@redhat.com>
Date: Wed, 18 Oct 2023 17:06:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] hw/s390x/css-bridge: Realize sysbus device before
 accessing it
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <20231018141151.87466-10-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20231018141151.87466-10-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: DIsohBxNXsFk

On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
> sysbus_mmio_map() should not be called on unrealized device.

Can you elaborate? I don't see a sysbus_mmio_map() in this code here...?

  Thomas


> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/css-bridge.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
> index 4017081d49..15d26efc95 100644
> --- a/hw/s390x/css-bridge.c
> +++ b/hw/s390x/css-bridge.c
> @@ -95,7 +95,6 @@ static const TypeInfo virtual_css_bus_info = {
>   
>   VirtualCssBus *virtual_css_bus_init(void)
>   {
> -    VirtualCssBus *cbus;
>       BusState *bus;
>       DeviceState *dev;
>   
> @@ -103,19 +102,19 @@ VirtualCssBus *virtual_css_bus_init(void)
>       dev = qdev_new(TYPE_VIRTUAL_CSS_BRIDGE);
>       object_property_add_child(qdev_get_machine(), TYPE_VIRTUAL_CSS_BRIDGE,
>                                 OBJECT(dev));
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>   
>       /* Create bus on bridge device */
>       bus = qbus_new(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
> -    cbus = VIRTUAL_CSS_BUS(bus);
>   
>       /* Enable hotplugging */
>       qbus_set_hotplug_handler(bus, OBJECT(dev));
>   
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
>       css_register_io_adapters(CSS_IO_ADAPTER_VIRTIO, true, false,
>                                0, &error_abort);
>   
> -    return cbus;
> +    return VIRTUAL_CSS_BUS(bus);
>    }
>   
>   /***************** Virtual-css Bus Bridge Device ********************/

