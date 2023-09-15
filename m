Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1310872ejb;
        Fri, 15 Sep 2023 08:13:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRzevJH88Gf+Td67xMC5CoIeaego+LNfD4YcpFzOz9RauRcNBJyD3wZNUqONDrb78kgXIN
X-Received: by 2002:a05:6102:3022:b0:44e:9e6a:97b0 with SMTP id v2-20020a056102302200b0044e9e6a97b0mr1733563vsa.12.1694790824258;
        Fri, 15 Sep 2023 08:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694790824; cv=none;
        d=google.com; s=arc-20160816;
        b=Dcj/p4Odw40eBeiszlATDKGq9PWulJ4BBchlIMy2kPAwiedo+jht5mngG8PQ1YU35L
         rEGmgxx8thftP4YfoUeuOrx9xIWpXaiJl65yciv4EGkKi1Pl0R3XkESPODumyu+Ml0N+
         7/X4R/iLVTDHktrf9OFAAlIVsAidBW8GzmpLYVMJXrqbk+1+QKWVunYU6OFNwjCI81hD
         7MMlIyyH8olIcw2p80mwHp99RSX4ASv1jM5JD1pLynhzwXioZFDMp3isV5faiWdCFKls
         000jSojG887KFrZ+FxJ28TPwaJowI39MU1Hj6SG+giRZ1D3HalwMo7/NsyLxPLiZs0t+
         pnKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=NrmuwfORkHV088XJeZg8fDdUukeiMUFR5uqXJlDPelc=;
        fh=UyxF3ErB8HWkAb0wPwWtezp7aNFUT4I24HPLI2nza84=;
        b=QUqENvsraoeOs1AqvYzd9ok2NY3PsIyrX0SlNEOOsWFiSuYMmgWMbn2MYfPcm0Butg
         PWzO/5gcrk+/DYFbislRyuCo34BBxClEUHUffkOqjFMLira3yAYOCclD2NoynMw0NIeu
         Ydm72A1F+Yptio/HAg/b6F73PHjoMzT2C2YWP8pk0LQIes4/ia1fXJmaTA1DGW/D80+9
         RKkQlSQ1aPxR4L1PGVmZuVlgrNBy7WkGZhCyziTwE1dd9s2jo/L25lrxyEAqikkiy0/x
         hIG0FiBzlGZY6Wrv2nqXELwNv5yRKVOzwObFNMKsSG44fvuCZoBD+uJW30vC+CF8Lc/Z
         ocUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JuBDXJBn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19-20020a0cf093000000b0065610fb1269si2375914qvk.569.2023.09.15.08.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Sep 2023 08:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JuBDXJBn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qhAVe-0003sw-9Y; Fri, 15 Sep 2023 11:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qhAVY-0003l7-2N
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 11:13:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1qhAVV-00031M-1I
 for qemu-arm@nongnu.org; Fri, 15 Sep 2023 11:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694790800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NrmuwfORkHV088XJeZg8fDdUukeiMUFR5uqXJlDPelc=;
 b=JuBDXJBniphYk2ZkaF4bPyI4pydJ2mlAH0dcNZMoQQydlP6kAxEYYy2CjSvGtG2G6kgE4r
 fLtduHlvUxyS+n/FAnSNk7EtISKWyrhoXiltj//YDfnZSmpE3yljVigIK+Xs77czFioI9t
 Z406jM3+ujusf9/4iczAmcOGIK0jnZ0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-QJzzF9fgPtCbY1ruldlwNQ-1; Fri, 15 Sep 2023 11:13:16 -0400
X-MC-Unique: QJzzF9fgPtCbY1ruldlwNQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-51bee352ffcso1587978a12.1
 for <qemu-arm@nongnu.org>; Fri, 15 Sep 2023 08:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694790795; x=1695395595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NrmuwfORkHV088XJeZg8fDdUukeiMUFR5uqXJlDPelc=;
 b=KMRfe/A/LiVkfvO1XKlxn2vTV90XWq6CAyYZeThuXvIx9HkgkeMMXKY89HrcJy41aZ
 jlHZeYsXX2d73iMYW5DbBaE2QlO/EUlaaQJ2RSxYRTObkInyja06VplWYNQaBMpxre92
 F6mdI03mUAANeX3lfFb1UAD0MkQQ7LM9W1W9hdYbhEIilBWQNlQLpkvCFEqlUT/4Hqdk
 VH4ucb9qSjuPpLLI7YtdnyinrT4B/7BYCGKlw0DkynjiGP1h0OuHnhOJ8T/gT10Nqa9V
 N5uit5W2eDWzYVnYGbJJpnnzKI2QwxJNdj4jUiYTIQxha7w2/kUbcUkHxnxFXbgcqgy3
 Orvw==
X-Gm-Message-State: AOJu0Yx63RjSinCPpIDgn7q7jlnHdVcWw0WVYwVIOzFqS3zq3wa0W2MS
 bAdgsBp7OhTrK5cGpesAHp//yKjEISryF1/H/lE//zNPg++ZqqGVoB0/lBrOCiPYi/9NU62teCm
 W9I1JW8XAPM0S
X-Received: by 2002:a05:6402:d61:b0:530:9e59:5795 with SMTP id
 ec33-20020a0564020d6100b005309e595795mr1285266edb.4.1694790795407; 
 Fri, 15 Sep 2023 08:13:15 -0700 (PDT)
X-Received: by 2002:a05:6402:d61:b0:530:9e59:5795 with SMTP id
 ec33-20020a0564020d6100b005309e595795mr1285235edb.4.1694790795106; 
 Fri, 15 Sep 2023 08:13:15 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 q18-20020aa7da92000000b0052cdc596652sm2390205eds.23.2023.09.15.08.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 08:13:14 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:13:13 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: <ankita@nvidia.com>
Cc: <jgg@nvidia.com>, <alex.williamson@redhat.com>, <clg@redhat.com>,
 <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>, <ani@anisinha.ca>,
 <aniketa@nvidia.com>, <cjia@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <vsethi@nvidia.com>, <acurrid@nvidia.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 4/4] acpi/gpex: patch guest DSDT for dev mem information
Message-ID: <20230915171313.1a6cb98b@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230915024559.6565-5-ankita@nvidia.com>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <20230915024559.6565-5-ankita@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: T6bl9AReI7Zp

On Thu, 14 Sep 2023 19:45:59 -0700
<ankita@nvidia.com> wrote:

> From: Ankit Agrawal <ankita@nvidia.com>
> 
> To add the memory in the guest as NUMA nodes, it needs the PXM node index
> and the total count of nodes associated with the memory. The range of
> proximity domains are communicated to the VM as part of the guest ACPI

> using the nvidia,gpu-mem-pxm-start and nvidia,gpu-mem-pxm-count DSD
above examples should use devices that are (or to be) available in QEMU,
not some out of tree ones.

> properties. These value respectively represent the staring proximity
> domain id and the count. Kernel modules can then fetch this information
> and determine the numa node id using pxm_to_node().
> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>  hw/pci-host/gpex-acpi.c | 69 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 7c7316bc96..0548feace1 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -49,6 +49,72 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq)
>      }
>  }
>  
> +static void acpi_dsdt_add_cohmem_device(Aml *dev, int32_t devfn,
> +                                        uint64_t dev_mem_pxm_start,
> +                                        uint64_t dev_mem_pxm_count)
> +{
> +    Aml *memdev = aml_device("CMD%X", PCI_SLOT(devfn));
> +    Aml *pkg = aml_package(2);
> +    Aml *pkg1 = aml_package(2);
> +    Aml *pkg2 = aml_package(2);
> +    Aml *dev_pkg = aml_package(2);
> +    Aml *UUID;
> +
> +    aml_append(memdev, aml_name_decl("_ADR", aml_int(PCI_SLOT(devfn) << 16)));

PCI devices (especially endpoints) are typically enumerated by
bus specific means (i.e not by ACPI).

And whether OSPM will honor the remainder of AML here is very questionable.

> +
> +    aml_append(pkg1, aml_string("dev-mem-pxm-start"));
> +    aml_append(pkg1, aml_int(dev_mem_pxm_start));
> +
> +    aml_append(pkg2, aml_string("dev-mem-pxm-count"));
> +    aml_append(pkg2, aml_int(dev_mem_pxm_count));
> +
> +    aml_append(pkg, pkg1);
> +    aml_append(pkg, pkg2);
> +
> +    UUID = aml_touuid("DAFFD814-6EBA-4D8C-8A91-BC9BBF4AA301");

I'm not a fun of free form UUIDs and above one seems to be the case:
https://uefi.org/sites/default/files/resources/_DSD-device-properties-UUID.pdf

looking at above doc this UUID also requires HID/ACPI ID
to describe data structure definition which this patch is missing.
It's also questionable whether _HID and _ADR are allowed to go together.

PS:
Commit message and comments here should have appropriate pointers
to relevant specs.

> +    aml_append(dev_pkg, UUID);
> +    aml_append(dev_pkg, pkg);
> +
> +    aml_append(memdev, aml_name_decl("_DSD", dev_pkg));
> +    aml_append(dev, memdev);
> +}
> +
> +static void find_mem_device(PCIBus *bus, PCIDevice *pdev,
> +                            void *opaque)
> +{
> +    Aml *dev = (Aml *)opaque;
> +
> +    if (bus == NULL) {
> +        return;
> +    }
> +
> +    if (pdev->has_coherent_memory) {
> +        Object *po = OBJECT(pdev);
> +
> +        if (po == NULL) {
> +            return;
> +        }
> +
> +        uint64_t pxm_start
> +           = object_property_get_uint(po, "dev_mem_pxm_start", NULL);
> +        uint64_t pxm_count
> +           = object_property_get_uint(po, "dev_mem_pxm_count", NULL);
> +
> +        acpi_dsdt_add_cohmem_device(dev, pdev->devfn, pxm_start, pxm_count);
> +    }
> +}
> +
> +static void acpi_dsdt_find_and_add_cohmem_device(PCIBus *bus, Aml *dev)
> +{
> +    if (bus == NULL) {
> +        return;
> +    }
> +
> +    pci_for_each_device_reverse(bus, pci_bus_num(bus),
> +                                find_mem_device, dev);
> +
> +}
> +
>  static void acpi_dsdt_add_pci_osc(Aml *dev)
>  {
>      Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
> @@ -207,7 +273,10 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>  
>      acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>  
> +    acpi_dsdt_find_and_add_cohmem_device(cfg->bus, dev);
> +
>      method = aml_method("_CBA", 0, AML_NOTSERIALIZED);
> +
>      aml_append(method, aml_return(aml_int(cfg->ecam.base)));
>      aml_append(dev, method);
>  

