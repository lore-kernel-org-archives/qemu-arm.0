Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp529567lfj;
        Thu, 13 Jan 2022 23:00:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxx7AXkPPL8P5xA3AcQAs2zs2vEHwjvn1hpB3SAbETdB7kWvdIpEM2maB94l8AwhEe15NjG
X-Received: by 2002:a17:906:2802:: with SMTP id r2mr6623802ejc.172.1642143604840;
        Thu, 13 Jan 2022 23:00:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642143604; cv=none;
        d=google.com; s=arc-20160816;
        b=NQRClB5hlZTXqOmpX6RqbhV3bvVHsh+yGGbTlMYtnSU7tDXG5my9vd81akascbfr/i
         A6pQ0aBvi57nfV71HYEUmRR9SkC605ANggTCBdo5/2PjFJAOmMIeZZt//YoREG/e6Dtj
         ZjK2H6dt/Mzs7Otj9NxQae/9XmC+We7b4a1nW5b7158EP8Ulnmwp83h+1jpD9cHPDA9w
         +MGmpjWYXlzLs9dkVVbRx/phxDYr4Ibv3F2StOFDtZv0zP/Da+xrs705HNUfdsJ3DT4Q
         EDwqCSjzzPpavnnav/0p1io/hb8fUR7f9RFI3ckHiZjXXsxttJA1kN1zA/ji6VMaWgJb
         TjXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yOK5xYSh1FtuE1McPhlJvPKMXYPSmh6qcCuMZNqtwrk=;
        b=PA5AKvxkp1KB9wpXB+u5+W4q7XrPNeTbFvaWz7NDhcfLMO5ZXVEvDbA9T1ZmH434Za
         mX3IrYMYb5YLrDrsf+due+72TjcPDZn95vm9nDDC6ffjtotzck5InJ0RbPe39cBxk98y
         aTdOIC8ES/E3TYvaqRUMr8mlZbpvgMx6TfTEBHFMyux9eFdLdZj6jOZPqtKRuD7Kwsys
         zgI97teQsyQcL+uTSHGkb/ykYf7i9uK8x8hPIe7l1zMZDnSkKwrs8VH/AlAf3kLk0woE
         C/oieYS9qAtVXHhVzBeLnxkbvMsDzqCp5qTMh9KDLyWgLcMQb6I4ONcDxN/ebUINqDaD
         DxYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fptl2zX3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a3si2337040ejd.117.2022.01.13.23.00.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jan 2022 23:00:04 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fptl2zX3;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642143603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOK5xYSh1FtuE1McPhlJvPKMXYPSmh6qcCuMZNqtwrk=;
	b=Fptl2zX3WJNitdb4GJmuB24/ZFBAfLidewC/s2MQqn8xUYpFjbJfFHOuY1wpFNx2XI937O
	U6W9Pp25+YzxjjzcX0huEEBIgkLvwIUA4081en/lOtUNUo/njgFmMrc1DzhJYZsvAgdimh
	WbuFXNhoOk2HhlT1gBjeeqcVUlDjzpQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-K4xc5ACPPC65KQ-7Hpxq-A-1; Fri, 14 Jan 2022 02:00:00 -0500
X-MC-Unique: K4xc5ACPPC65KQ-7Hpxq-A-1
Received: by mail-wr1-f70.google.com with SMTP id j19-20020adfa553000000b001a375e473d8so1518266wrb.4
        for <alex.bennee@linaro.org>; Thu, 13 Jan 2022 22:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yOK5xYSh1FtuE1McPhlJvPKMXYPSmh6qcCuMZNqtwrk=;
        b=I0uBc/eijglPq4YZhfWZQGCcN6TEmUs8vwgkgRY+mw0tsotlqG+fVpYOK1RP2CiAfr
         pdWL99G5WfYoCmjp5EFKGao+nd1g7682SYWE7g7OvVXq44i2Ac4Cp84CVQGdwW9c2K7m
         NXiGDIWFBJkZcxY4fJyukaTV7c3ZMLjnDzeh+WoClAgt0t812efvzXg6RDiHI0ydCkT4
         2oraDDUrXbUYimNv5a1wfaRZ9FTa5kIra88W5cfhdqFcyv5lzouR6dA07DNO+xb+tiqV
         Bw1Z0CiTaXsLawOgxmCWMWjZ07kdoHW091Ouh7lrHfFvwaXHOfMfkbooD16e6CVFhpa1
         dfFg==
X-Gm-Message-State: AOAM532xAwp6APPAdplljD3aaX143kZvCK3XlVrQqOhrTQ0mjo+6zdZn
	Y5Vuu7sAu95sm7e0gqIphYXszYobgRvgvxyFiJ28kTzkVbnu8O4+ZiXKuyDU6HEDLG37+hvnWZ/
	cp9EjErwyQ/u/RxS5
X-Received: by 2002:a05:6000:c8:: with SMTP id q8mr7029355wrx.611.1642143598833;
        Thu, 13 Jan 2022 22:59:58 -0800 (PST)
X-Received: by 2002:a05:6000:c8:: with SMTP id q8mr7029313wrx.611.1642143598578;
        Thu, 13 Jan 2022 22:59:58 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.42.76] (tmo-098-185.customers.d1-online.com. [80.187.98.185])
        by smtp.gmail.com with ESMTPSA id r205sm3437942wma.26.2022.01.13.22.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 22:59:57 -0800 (PST)
Message-ID: <a75789e0-0ace-c898-ea61-9b55624c772a@redhat.com>
Date: Fri, 14 Jan 2022 07:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] Mark remaining global TypeInfo instances as const
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Corey Minyard <minyard@acm.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Jason Wang <jasowang@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Fam Zheng
 <fam@euphon.net>, Beniamino Galvani <b.galvani@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Tyrone Ting
 <kfting@nuvoton.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>,
 "open list:e500" <qemu-ppc@nongnu.org>,
 "open list:S390 PCI" <qemu-s390x@nongnu.org>
References: <20220113171038.18128-1-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220113171038.18128-1-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 3uxpfC0a9joh

On 13/01/2022 18.10, Bernhard Beschow wrote:
> More than 1k of TypeInfo instances are already marked as const. Mark the
> remaining ones, too.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/core/generic-loader.c   | 2 +-
>   hw/core/guest-loader.c     | 2 +-
>   hw/display/bcm2835_fb.c    | 2 +-
>   hw/display/i2c-ddc.c       | 2 +-
>   hw/display/macfb.c         | 4 ++--
>   hw/display/virtio-vga.c    | 2 +-
>   hw/dma/bcm2835_dma.c       | 2 +-
>   hw/i386/pc_piix.c          | 2 +-
>   hw/i386/sgx-epc.c          | 2 +-
>   hw/intc/bcm2835_ic.c       | 2 +-
>   hw/intc/bcm2836_control.c  | 2 +-
>   hw/ipmi/ipmi.c             | 4 ++--
>   hw/mem/nvdimm.c            | 2 +-
>   hw/mem/pc-dimm.c           | 2 +-
>   hw/misc/bcm2835_mbox.c     | 2 +-
>   hw/misc/bcm2835_powermgt.c | 2 +-
>   hw/misc/bcm2835_property.c | 2 +-
>   hw/misc/bcm2835_rng.c      | 2 +-
>   hw/misc/pvpanic-isa.c      | 2 +-
>   hw/misc/pvpanic-pci.c      | 2 +-
>   hw/net/fsl_etsec/etsec.c   | 2 +-
>   hw/ppc/prep_systemio.c     | 2 +-
>   hw/ppc/spapr_iommu.c       | 2 +-
>   hw/s390x/s390-pci-bus.c    | 2 +-
>   hw/s390x/sclp.c            | 2 +-
>   hw/s390x/tod-kvm.c         | 2 +-
>   hw/s390x/tod-tcg.c         | 2 +-
>   hw/s390x/tod.c             | 2 +-
>   hw/scsi/lsi53c895a.c       | 2 +-
>   hw/sd/allwinner-sdhost.c   | 2 +-
>   hw/sd/aspeed_sdhci.c       | 2 +-
>   hw/sd/bcm2835_sdhost.c     | 2 +-
>   hw/sd/cadence_sdhci.c      | 2 +-
>   hw/sd/npcm7xx_sdhci.c      | 2 +-
>   hw/usb/dev-mtp.c           | 2 +-
>   hw/usb/host-libusb.c       | 2 +-
>   hw/vfio/igd.c              | 2 +-
>   hw/virtio/virtio-pmem.c    | 2 +-
>   qom/object.c               | 4 ++--
>   39 files changed, 42 insertions(+), 42 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


