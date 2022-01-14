Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp35298lfj;
        Fri, 14 Jan 2022 03:02:51 -0800 (PST)
X-Received: by 2002:adf:db0c:: with SMTP id s12mr7640115wri.429.1642158171494;
        Fri, 14 Jan 2022 03:02:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642158171; cv=none;
        d=google.com; s=arc-20160816;
        b=lQu1SDchS2aBVIAyPR8MdjioR7n3q1qS6olJ98ZteZmdbHrcIZUJ09lgyejB3bAph9
         ttYuN+T9kug/thCk0GXJlJ9Vq4QL0TTu8ScOQHfWH+OfNzvn0JkWn8preEmS43f8xUaN
         mB554XWH+2aXlpwMtg+qw01jqvkuTC1rdpX9v2hMvBRxOvSZbFORfXeDhH4Jr/IU5MVY
         rc5eYJ7KTT1R9AM/hovoTjNOKfRnBxZQ5sfN7qnS42f1e4hrzL0aK29OgvC+SiI0B8JK
         Ho+AJrNDlMzuk07o+3LTrMQjPwt7o2RSSC0EDfT7nqyJGvK/IXlLmqKlEA3ulNmz+aEE
         UccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=t/G7JZA9GQDFGfYcKoq7rnD+jJp/08VTYN/09/cRKc4=;
        b=uY2yBxqPWWhhym6jd+NRYiHbAeu0R2v88Q29lHKl/ZeMOw1Kwm65u2Bc376BdTMVe0
         jjVHcJ6v63l2q+fwuUN0XlO8NJJMFSNMJ650uGxJ+NnRpSXRsGQ2FjkiMXxS9W4WGDV/
         KBlt76D9xNqdIRzQ7p34sdcyaH/NcxIkJ3D93hL6h9yzAJLTiqIGoHas8iSq0VFj5pRU
         jug0iK+h869/tr0ILZeLpHHJ5/lte9A7+DYmKcN+l06eaDPxQl2iLCBWc1BnLB+hAaiS
         q2gIoTC9NZTn+E7D3l8VY73VvosSRCTyNrk4CYBdHXI5utNkwbkIzoeU/U2KZ32y1Foi
         cQ+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=X3EnmfRz;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t16sor3372647wrm.74.2022.01.14.03.02.51
        (Google Transport Security);
        Fri, 14 Jan 2022 03:02:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=X3EnmfRz;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t/G7JZA9GQDFGfYcKoq7rnD+jJp/08VTYN/09/cRKc4=;
        b=X3EnmfRzzUCkoKzau5pNnZ7iZ+INseRQ75C1ofylalMX35Y+WBDgf63tSrFdlRtmkE
         1RDXrAlKxXoJ/LIpqzSUPWdEJhaGIlWYaP1esYACXAaThenXrolN2IZxgxT+5J39O7tf
         5s18Wu+2nzl3U1GsTI/vXDZq3yjjnYQssPJ2sYp4/cle1aTEyxIa+q33XEslVWkNe5/4
         Sc+SQaZOF5Ht82sLMEoPn4964FDR1qrVMkaKe8APogfjFrMVpz9QkLAE8k+OkbkIAONu
         7L4SQopTl5UrzOoRb1/mxsUgRsSbRk+FhktijIblNYpJym+DjHzkDOEn6KtFr8taDPkw
         XbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t/G7JZA9GQDFGfYcKoq7rnD+jJp/08VTYN/09/cRKc4=;
        b=nUckK/tbcF9rHUxf150iDy14+w8e4TITnoBsMKERtEmaFRawfjZS+nt+4BLwyLkPty
         WuW61X+dW6vRcIj/pXF8n5dsrbNdylHRUmdr3OimoBx1SODCwlVyT9FtHvk5bbkEURFl
         ZrzFa6QF6Og2gg6E9tq9WVHtXyd4w9L3BiV/yOau5+KP67vElEc7VmjtLF1oUDcaNbar
         5KkNxArb6ng3ticw+n0mFCmWD6KxwSEHCPaGjYVq4/SYuSCsG2KnJtHqzuNpLTAlS2zt
         rjzZvXujTjbLQA+GzP03zwyTW4R2gZuIfZhNdKLIsu6Y0Kv+74i09sZ0fc6CEsj/jG/J
         qY+A==
X-Gm-Message-State: AOAM5329YLvXCnFvO5JxDeV7C/HsDqmvjUkAhrWCmHK24jwNhNrBmD68
	k2FTMfIPg09Ua408LuYb2Dw=
X-Google-Smtp-Source: ABdhPJw1Lp+pfkjhVE9hqZpenPO4cc2wMslXnA7d/8vNWyF1R90+TCqWN2cNZc8fAi3rAX94d3L6pw==
X-Received: by 2002:adf:cd8f:: with SMTP id q15mr2214666wrj.118.1642158171105;
        Fri, 14 Jan 2022 03:02:51 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951? ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
        by smtp.gmail.com with ESMTPSA id v13sm5729254wro.90.2022.01.14.03.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 03:02:50 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <abbe1a9b-96ea-26d5-0375-1eeb7f5e4e42@amsat.org>
Date: Fri, 14 Jan 2022 12:02:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] Mark remaining global TypeInfo instances as const
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
References: <20220113171038.18128-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220113171038.18128-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AUdsrSzyjsBC

On 13/1/22 18:10, Bernhard Beschow wrote:
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
> 
> diff --git a/hw/core/generic-loader.c b/hw/core/generic-loader.c
> index 9a24ffb880..eaafc416f4 100644
> --- a/hw/core/generic-loader.c
> +++ b/hw/core/generic-loader.c
> @@ -207,7 +207,7 @@ static void generic_loader_class_init(ObjectClass *klass, void *data)
>       set_bit(DEVICE_CATEGORY_MISC, dc->categories);
>   }
>   
> -static TypeInfo generic_loader_info = {
> +static const TypeInfo generic_loader_info = {

Good cleanup. If you use a sed expression to automatically replace,
it would be nice to mention it (see i.e. commit f548f20176cb5f4406).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

To avoid further non-const static TypeInfo introduced, we should
add a check in scripts/checkpatch.pl. Maybe a simple "static TypeInfo"
line comparison is enough. Do you mind having a look for a patch?

Thanks,

Phil.
