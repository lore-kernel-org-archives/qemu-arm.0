Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp960593ejc;
        Fri, 26 Jan 2024 07:53:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0Fvk8MBr//J5CJs5hV0Rus5TAhBdhAJ7oVsPo3QiIunafSUAQII9RpFh6JaTf6nP/jrtK
X-Received: by 2002:a05:6808:1a0b:b0:3bd:e26f:9b6e with SMTP id bk11-20020a0568081a0b00b003bde26f9b6emr2933106oib.5.1706284380472;
        Fri, 26 Jan 2024 07:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706284380; cv=none;
        d=google.com; s=arc-20160816;
        b=BMaRWENcCVsxA5Be/3vdJJXCIA7Ll7gDb/q8IVSgiv1iStNrTKFxkg6nuntKhlmifP
         F+zFDWaIJJRqSgWGfqUThbOK77+GrQ6w34GjeS63yfBgvbDsXvtjZnI+dJZRW8LPMgAA
         fxUWXZShMelU7c7ahmlrUeoa5sBosMfTEqwLgWyhb8nx7HWd8mad/lU/2Se7zDVx5VZn
         usyR/CoSyr3Oe0iepV8oIzDzU4NjVXaWTOzU5lFoS3E4kwnJ+41KS5Jq9PkbfJsOqDXk
         lYEu74bI8667fpBXW28udlb6MfvYbvID/Xl37wHB7jSfyYqIy+ePN/M3AV3rqD5mklEQ
         04Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:sender:precedence:errors-to
         :list-subscribe:list-help:list-post:list-unsubscribe:list-id;
        bh=GVRU4JY42t0XtQar0MLRcTymoBOobeZe42nuYzL2Zis=;
        fh=RIVWBOSs2OZlP7XXIPkGQw38oz8oDq1OvCeujjh55qg=;
        b=EaqoGOrbadodsKkQt8ou5oTk149aqKx5kJeAO3KmfGLXf3eMs8sBXZd6eS5f8cbCu5
         EFQe4Y2iDuvug8z4Rm4xIoj8R/gMVx30H/wZ7Eajk4ffiOZGkfuQxm2SVOZe6+WXTEPK
         3jsLs3/YG6zVXMCmET00HiVpFJxCi1tCWHMkhw6rj1sHS6V9/vjJyW6x3u1KJskQ+Qdh
         nwZRQWdsJaIjXpKSfrpY5wkK/OvvOBcyByL2QDpPhQmyYPT0keWLALWvHj8wsTJpE7Te
         22IF0PVSWq1KeXL6LBFaE6vBtdEc7t1NTtRUomfJjdDxMjn2iDbR7CDp6hXS/zbEJr3g
         CY2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KfUJ35dD;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <xen-devel-bounces@lists.xenproject.org>
Received: from lists.xenproject.org (lists.xenproject.org. [192.237.175.120])
        by mx.google.com with ESMTPS id t17-20020ac85891000000b0042a87eeae1bsi122640qta.745.2024.01.26.07.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 07:53:00 -0800 (PST)
Received-SPF: pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) client-ip=192.237.175.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KfUJ35dD;
       spf=pass (google.com: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.672126.1045843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOUo-0001Xo-S5; Fri, 26 Jan 2024 15:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672126.1045843; Fri, 26 Jan 2024 15:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOUo-0001Xh-OW; Fri, 26 Jan 2024 15:51:58 +0000
Received: by outflank-mailman (input) for mailman id 672126;
 Fri, 26 Jan 2024 15:51:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UtOA=JE=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1rTOUn-0001WN-Jp
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:51:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d427a763-bc62-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 16:51:55 +0100 (CET)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-mMxpJthxMyeqSLfeljI6Xg-1; Fri, 26 Jan 2024 10:51:53 -0500
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-783163c7c38so63211385a.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:51:52 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-176-119.web.vodafone.de.
 [109.43.176.119]) by smtp.gmail.com with ESMTPSA id
 i28-20020a05620a145c00b0078199077d0asm666795qkl.125.2024.01.26.07.51.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 07:51:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d427a763-bc62-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706284314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GVRU4JY42t0XtQar0MLRcTymoBOobeZe42nuYzL2Zis=;
	b=KfUJ35dD1fEjw5e1fM4PZ6FcCMxyGKL8L2cI9HO3Wee9MKwlKYZ6o3KprIsvJlI/LkRgLN
	eL0IfQgsD3Z0bR8aHkcgWht2XHG5cnN9sLkRaO/FTaGEtd+4NoTzV757nkQlhtvcETfXjH
	/n8B5A2VJksWWxGt8pHKTDmgW/QRht0=
X-MC-Unique: mMxpJthxMyeqSLfeljI6Xg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706284312; x=1706889112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVRU4JY42t0XtQar0MLRcTymoBOobeZe42nuYzL2Zis=;
        b=brae2XO68jBZEynd0KthBWkqhITedQgXxg0BbygoquwkQsNfb4JvypBu3CArLlVSem
         QvJL5uHMKhwVAvNgp2krsICeBfiTQigQYgORcDKOEf114fTdT+ekwDqY8XeANnH9TXTl
         z8VW2qHtJEEiMFO/572qRLztBFuDMZujZIIs5VSyRBnBTvS2tmccyqnuT2GCZ/wkwD+q
         3aAWjytqoucfcn6d0AxXuSaM5LBVeH1snkcK2SLkbWwD3qXvO47S2m6pvLYjiKfwGJ0X
         9vl/Fm03iQeWDStQ5iJvPnTvPH9KxRDuE7Wy1XRC0nFPtmoDGcQqpqU36IWY8kFDJJE4
         KjZw==
X-Gm-Message-State: AOJu0YzF2DOaHYy1gO9h7vEyEy174+F5VfJKxs4unPE4SGX48pr2dxnF
	UvcaS8r+a78sdCcniDxZDxS4SG/lDs/0cLfGGdOuyzPEku5rEIi7LVuu4RhgXy9BRdjAECMXh9l
	4T5Dpb/62N4G24zaWp9QYGiquAc7slIfZ/cb4RLNETc0uKaJiKg6SxpRYhXkJc4WO
X-Received: by 2002:a37:e317:0:b0:783:b889:30d3 with SMTP id y23-20020a37e317000000b00783b88930d3mr1427761qki.15.1706284312511;
        Fri, 26 Jan 2024 07:51:52 -0800 (PST)
X-Received: by 2002:a37:e317:0:b0:783:b889:30d3 with SMTP id y23-20020a37e317000000b00783b88930d3mr1427741qki.15.1706284312247;
        Fri, 26 Jan 2024 07:51:52 -0800 (PST)
Message-ID: <c39be436-2790-42ff-8886-59925330b7d5@redhat.com>
Date: Fri, 26 Jan 2024 16:51:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 32/46] hw/m68k/mcf5208: use qemu_create_nic_device()
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
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>
References: <20240108204909.564514-1-dwmw2@infradead.org>
 <20240108204909.564514-33-dwmw2@infradead.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240108204909.564514-33-dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: t2t2VAzkBer2

On 08/01/2024 21.27, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/m68k/mcf5208.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index d22d8536db..0cfb806c20 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -206,16 +206,16 @@ static void mcf5208_sys_init(MemoryRegion *address_space, qemu_irq *pic)
>       }
>   }
>   
> -static void mcf_fec_init(MemoryRegion *sysmem, NICInfo *nd, hwaddr base,
> -                         qemu_irq *irqs)
> +static void mcf_fec_init(MemoryRegion *sysmem, hwaddr base, qemu_irq *irqs)
>   {
>       DeviceState *dev;
>       SysBusDevice *s;
>       int i;
>   
> -    qemu_check_nic_model(nd, TYPE_MCF_FEC_NET);
> -    dev = qdev_new(TYPE_MCF_FEC_NET);
> -    qdev_set_nic_properties(dev, nd);
> +    dev = qemu_create_nic_device(TYPE_MCF_FEC_NET, true, NULL);
> +    if (!dev) {
> +        return;
> +    }
>   
>       s = SYS_BUS_DEVICE(dev);
>       sysbus_realize_and_unref(s, &error_fatal);
> @@ -267,14 +267,7 @@ static void mcf5208evb_init(MachineState *machine)
>   
>       mcf5208_sys_init(address_space_mem, pic);
>   
> -    if (nb_nics > 1) {
> -        error_report("Too many NICs");
> -        exit(1);
> -    }

I wonder whether we'd need a different mechanism to specify the maximum 
amount of on-board NICs now... Anyway, we can also think of that later, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>


