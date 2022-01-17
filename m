Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2122641lfj;
        Mon, 17 Jan 2022 07:01:58 -0800 (PST)
X-Received: by 2002:a7b:cb58:: with SMTP id v24mr20520366wmj.135.1642431718690;
        Mon, 17 Jan 2022 07:01:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642431718; cv=none;
        d=google.com; s=arc-20160816;
        b=IzjgPFj4GooY2KnrpqnUMx32qFxs2pSMH6tLhs5wrNC1xMbVgxEic7Hpr2vUx/GX7l
         OzJRheJygcADXExEHQGKLudB/qkwj8d1rX/srxJX1q7NFzSH3ZbOJWqetpMesBOyr9YI
         kpDTpbXo+o9+L07oOK2eSfXpnAuTJ8SwnMjX9dqJebAMPSaOU9PzIonnJ8rIa4nKtZeY
         MOf0buYoli/+ZHMAzMxJIvZSWb7u88ATMSTgJ87B3yDaOzSBkOvKfznwYWyH3j/WYx3Z
         tifzlF3g//0amzNCYjZySSfVwIToHx/gvFooM07hCnCc0i+1RTcjg9i+WFUsebjWYpB2
         h0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=bl19YmBKG/CvBuprfqQyHSekA4wIHWYuimC0Q30uqEQ=;
        b=0bc1gcFZegeMOi5nVfFa//boqTqYIfD4F/8xIUjU6gL4YqXfW2rIHKM5Wd1KSigvS2
         PDJl/NVx1Vk13F/2ge75jpVWCRa6LCGA3uDqpnEvxl9bjs15fyM/ZcZ2Vzv+zpIJPBbY
         rMGcaaoK/a2762h/Cw851YDddvFwIa5aVJVyz7Kjm0o91dDxLhNsi2WViIHukKGyhwRl
         WrZBOc0GLFkhiE03AvXzYk1EsZ7gH+Q7ztigUO5otmsYgyDCkX5E7HY0DCNhfbidGFhi
         ILbhoSnnTmjDls0NTT8/6FzxZel+j0J3alvAxwjiRxST9H41kKN5v/lHeZlCZ3ZzCIhP
         8xNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Cn/VS+Jx";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a23sor8061548wrc.77.2022.01.17.07.01.57
        (Google Transport Security);
        Mon, 17 Jan 2022 07:01:58 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="Cn/VS+Jx";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bl19YmBKG/CvBuprfqQyHSekA4wIHWYuimC0Q30uqEQ=;
        b=Cn/VS+JxHxHQZr+RcV6+ARHZuuyl6e5rsgaihvi38nX9XmzRL7NO5NHxFPDdHvIaUh
         n9pOu3BmkvFsBJ+WuA6Z5FW6DbAD1LTYzzEU10V2DbTA3wNFAuu7C8k6Dva7gT5vkUMv
         gFlSW+i2shazPD4cMqBIs2JkNx/vCZaHBug934IH0/tF6Skey7GwEqanrMg1DKDLN9Qa
         TZrBF90cHK9oTN8bc7fTtbEga91BQhsN0x2gxkw8rOx3COXfHuWki4jowTUiaEB1o51g
         1oHZ9shRixXSfO6Zq0YyZ5/IzrFneUi9ijLAS+yhBS0kRIvNpm+gEGGVapxfRmdv/l0J
         +C2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bl19YmBKG/CvBuprfqQyHSekA4wIHWYuimC0Q30uqEQ=;
        b=CDcU064ds+zZJJksO96ut3zLRLUEQxJ1nBbZ7+qo+e/wOAkwGm16xaIj7dtgBYMQr2
         9Y5x8r3xP2DSoacVyr3ZNdll/NM3areP5JpjTcKWKcfowJU56lgsbVOo2HoCk0C/c4Mx
         aMrF81yg7lR+CC7YMILaOeYRb7eZyAZrIzHOC5AhFr/qJiZZCRX0gK3+05Rn4TTOCYFu
         Jp9AEe1VM0eVgF0BwOQCZKH6LshzUDl6rqwL2xw0nqC2EAbgydHNgE4P5blqHwkTzEFK
         0u2RwjV8Sja8FOzlPCzh/Nsos4O05FxTp8Ja8ykU5YtYqD6envXR98+27jJBLH9oT9mS
         bKDQ==
X-Gm-Message-State: AOAM531B+223Jq/9F5TdcJeLtGWnzTul7rMDXTUfZrfNLRZVHLSy0g/2
	Td6gbLgvhDKxRmjuYf+1eQM=
X-Google-Smtp-Source: ABdhPJz/mEEetxQErWu307pH6bwNz7zFs/TLJK1p1+lGmo5Ge9ZJUivdw14OnTj6xCuNpMWSO75Y1g==
X-Received: by 2002:a5d:6546:: with SMTP id z6mr19923603wrv.356.1642431717761;
        Mon, 17 Jan 2022 07:01:57 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id d16sm15564293wrq.27.2022.01.17.07.01.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 07:01:57 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <015bdcf4-6037-bffb-f181-4334d5a883a4@amsat.org>
Date: Mon, 17 Jan 2022 16:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 1/2] Mark remaining global TypeInfo instances as const
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
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
 Thomas Huth <thuth@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
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
References: <20220117145805.173070-1-shentey@gmail.com>
 <20220117145805.173070-2-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220117145805.173070-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +45Tw6/Jm+Px

On 1/17/22 15:58, Bernhard Beschow wrote:
> More than 1k of TypeInfo instances are already marked as const. Mark the
> remaining ones, too.
> 
> This commit was created with:
>   git grep -z -l 'static TypeInfo' -- '*.c' | \
>   xargs -0 sed -i 's/static TypeInfo/static const TypeInfo/'

Thanks for updating the commit description.

Since the code part is not changed, let's keep the previous Reviewed-by
tags to avoid reviewers spending time checking the same change:

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/core/generic-loader.c   | 2 +-
>  hw/core/guest-loader.c     | 2 +-
>  hw/display/bcm2835_fb.c    | 2 +-
>  hw/display/i2c-ddc.c       | 2 +-
>  hw/display/macfb.c         | 4 ++--
>  hw/display/virtio-vga.c    | 2 +-
>  hw/dma/bcm2835_dma.c       | 2 +-
>  hw/i386/pc_piix.c          | 2 +-
>  hw/i386/sgx-epc.c          | 2 +-
>  hw/intc/bcm2835_ic.c       | 2 +-
>  hw/intc/bcm2836_control.c  | 2 +-
>  hw/ipmi/ipmi.c             | 4 ++--
>  hw/mem/nvdimm.c            | 2 +-
>  hw/mem/pc-dimm.c           | 2 +-
>  hw/misc/bcm2835_mbox.c     | 2 +-
>  hw/misc/bcm2835_powermgt.c | 2 +-
>  hw/misc/bcm2835_property.c | 2 +-
>  hw/misc/bcm2835_rng.c      | 2 +-
>  hw/misc/pvpanic-isa.c      | 2 +-
>  hw/misc/pvpanic-pci.c      | 2 +-
>  hw/net/fsl_etsec/etsec.c   | 2 +-
>  hw/ppc/prep_systemio.c     | 2 +-
>  hw/ppc/spapr_iommu.c       | 2 +-
>  hw/s390x/s390-pci-bus.c    | 2 +-
>  hw/s390x/sclp.c            | 2 +-
>  hw/s390x/tod-kvm.c         | 2 +-
>  hw/s390x/tod-tcg.c         | 2 +-
>  hw/s390x/tod.c             | 2 +-
>  hw/scsi/lsi53c895a.c       | 2 +-
>  hw/sd/allwinner-sdhost.c   | 2 +-
>  hw/sd/aspeed_sdhci.c       | 2 +-
>  hw/sd/bcm2835_sdhost.c     | 2 +-
>  hw/sd/cadence_sdhci.c      | 2 +-
>  hw/sd/npcm7xx_sdhci.c      | 2 +-
>  hw/usb/dev-mtp.c           | 2 +-
>  hw/usb/host-libusb.c       | 2 +-
>  hw/vfio/igd.c              | 2 +-
>  hw/virtio/virtio-pmem.c    | 2 +-
>  qom/object.c               | 4 ++--
>  39 files changed, 42 insertions(+), 42 deletions(-)
