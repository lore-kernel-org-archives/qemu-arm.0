Received: by 2002:a0c:90cc:0:0:0:0:0 with SMTP id p70csp1798871qvp;
        Fri, 8 Oct 2021 08:21:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT4gJTH8wo0eUgYSDeIhhFeKR15FjAC1sSB9hG0wxDUwk+C53Xm42A6nzi2eL76d6kLTeC
X-Received: by 2002:a37:670d:: with SMTP id b13mr3345216qkc.420.1633706471252;
        Fri, 08 Oct 2021 08:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633706471; cv=none;
        d=google.com; s=arc-20160816;
        b=LVw3GMhvg3XItPgPaSFF4fP6LA9GJLRmraUbp5YYxF1lIXTG8V0f7Mk/DixCDlAAcB
         JyW2ESSMuCiMqno7Eje5R2LUpX4L4Psm3jQ6BgsBh6UNVuQ4BK7INvEc62QZcKCFmPkJ
         Io2efvxtK37xextWOLBGdVVLKP/+AX9qoMb/rQ4vPI1Q//Z4/arofBcIqaIHTVNDVwLi
         bwzbsjDYeEPpgeT/VZopaJKrfWbPAqWy4rXBNKhtPtvn99rmLbspwQI/Fk2aBhCUpdtA
         WR2ua3TgQahXCJSANNlVVn+ATRdokqOssEy1OCrRmtPPK1Z4u12sUDAKz5IdJTH1uUpn
         Goyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5agtqILj6wbiAhAxlZtBSzhi/9gtCeT24zYTXd11dHA=;
        b=yc+R6NRwNd1KRnp0dqH71uHwwLq3lIxosl+dNCQWDomL0NfWWbfdG3+Ja86kQWFtQj
         WgHZWCV/EfYx5IlHtR2e6WmMnGtckb/HeaTafUH1+GGS24At+znW03Ybt1NnATkJG2CW
         YhrmoiUyeweHzMXYm6hQK8PxcAO7oFppPVE+JbTlHYSKXqvRofvgskDY2UL3GZZQyBc8
         EeyJcB/wz5htTFPVxPkHd7gE5z2rPHtoxdNycwjfHiOrMf6Ki4uRraiSStJP3wsdLdLb
         Bkil1wKiB00WHj7fQG2QnO7A7BtfW78edcGgMIRzyFHpaYqHiNxOBif9We0MEHv9D3eJ
         +Y8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wF0pqLLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c28si1920199qkl.17.2021.10.08.08.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Oct 2021 08:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wF0pqLLu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mYrgM-0003Dl-Qc
	for alex.bennee@linaro.org; Fri, 08 Oct 2021 11:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrfs-0003CW-D8
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:20:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrfo-0001Zd-Eg
 for qemu-arm@nongnu.org; Fri, 08 Oct 2021 11:20:40 -0400
Received: by mail-wr1-x429.google.com with SMTP id e12so30908738wra.4
 for <qemu-arm@nongnu.org>; Fri, 08 Oct 2021 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5agtqILj6wbiAhAxlZtBSzhi/9gtCeT24zYTXd11dHA=;
 b=wF0pqLLu6VtjlAESt406DIXfZ3HM3jS2x1PkXliBQfRisnKR22HVVgaNhqOSAGRJFg
 xLhZmHRlL4CHCT9GlDPgGfUJAKtsCL+4AQIoZGz6ZSd/ODjLd111er1CZt7R7pIq7A8I
 dH0AKELYylOI9gEYE8B3qdwnnR+kytFc9JI37GIHu1W94PkKnJPr6L9uSwJJMA1gsGAQ
 kQ8vTN8cS0ZTazykNUZwHlNsOHOMPzKjQ5pQhqA4d8eq+8IIfY1BMJf7YhJfYI4HMUz/
 ddhnVgjFkSPhWYBnxYbNLF+tNT1xAm0oIxlRuZJVNxqMGzNUlIdq4UYOXxrJ7eIlie0c
 LfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5agtqILj6wbiAhAxlZtBSzhi/9gtCeT24zYTXd11dHA=;
 b=OHQkJ1l8RgP018JRcpCg4YIp5vU6g6oDwoEbKpfWiAVj6h9WdE0JYo5jOF0qV21ItA
 9slqQhrdgR0DJa9oCuElHF5txL8WVkyQV0Dzcx3H9++REY97+4bjazs+7hn5bKCCCwQY
 SD45vOdyOSSxBtY4KP45LIwkId8fPukKdmNpMK0GS0vOeOHlACa0DfS+xvUoSx9Q1oF/
 OB9SSuXirjGVArwAN4jChZ1AkLJ7oEpEGBUNJlV3i7eRNb63BGjbN9dRIgT3Ny76FLRV
 B78GeLlnFLpy7z543xGo0d8hWM0HWiSTuVcx9XW0RNkIsTo+n9/l6Phb9JQrroK8RNAf
 G4kQ==
X-Gm-Message-State: AOAM532E0eQ6Pk8jisEPtmZLwsjvsyfAtl8r6TMaOOPf3Xmu5lvYD1FN
 WhtsIrIzos2mObbfq4T+GMw26g==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr4134131wma.172.1633706434777; 
 Fri, 08 Oct 2021 08:20:34 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id u17sm2732779wrw.85.2021.10.08.08.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:20:34 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:20:11 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v4 01/11] hw/acpi: Add VIOT table
Message-ID: <YWBhq2T5oqeawJWW@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-2-jean-philippe@linaro.org>
 <20211006100950.12798a07@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006100950.12798a07@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, Cornelia Huck <cohuck@redhat.com>,
 ehabkost@redhat.com, shannon.zhaosl@gmail.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, ani@anisinha.ca,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nfglMQMQXp8R

On Wed, Oct 06, 2021 at 10:09:50AM +0200, Igor Mammedov wrote:
> On Fri,  1 Oct 2021 18:33:49 +0100
> Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:
> 
> > Add a function that generates a Virtual I/O Translation table (VIOT),
> > describing the topology of paravirtual IOMMUs. The table is created when
> > instantiating a virtio-iommu device. It contains a virtio-iommu node and
> 
> perhaps
> s/when instantiating ... ./if a virtio-iommu device present/
> 
> > PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> > node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> > machine option and "bypass_iommu" PXB option, only buses that do not
> > bypass the IOMMU are described by PCI Range nodes.
> 
> 
> modulo comments, patch looks fine to me from ACPI point of view.
> 
> but I don't know if values used for describing PCI structures
> make any sense so this might need an ACK from a person who knows
> PCI innards better.

For what it's worth I mainly looked at other similar tables (IORT, DMAR
and IVRS) to figure out what values I should use

[...]
> > +static int build_pci_range_node(Object *obj, void *opaque)
> > +{
> > +    struct viot_pci_ranges *pci_ranges = opaque;
> > +    GArray *blob = pci_ranges->blob;
> > +
> > +    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
> > +        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
> > +
> > +        if (bus && !pci_bus_bypass_iommu(bus)) {
> > +            int min_bus, max_bus;
> > +
> > +            pci_bus_range(bus, &min_bus, &max_bus);
> > +
> > +            /* Type (PCI range) */
> see [1] below
> 
> > +            build_append_int_noprefix(blob, 1, 1);
> > +            /* Reserved */
> > +            build_append_int_noprefix(blob, 0, 1);
> > +            /* Length */
> > +            build_append_int_noprefix(blob, 24, 2);
> 
> spec should be fixed to state length value for fixed length structures
> like it's done in ACPI specs, I who we should poke at to make this happen.

That doesn't seem to be applied rigorously. Several fixed-size structures
don't state their sizes, for example "5.2.25.7 NVDIMM Block Data Window
Region Structure", "5.2.25.9 Platform Capabilities Structure", "5.2.26.1.1
ACPI_NAMESPACE_DEVICE based Secure Device Structure".

> 
> zzzz
> > +            /* Endpoint start */
> > +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 4);
> > +            /* PCI Segment start */
> > +            build_append_int_noprefix(blob, 0, 2);
> > +            /* PCI Segment end */
> > +            build_append_int_noprefix(blob, 0, 2);
> zzzz
> see comment [2]
> 
> > +            /* PCI BDF start */
> > +            build_append_int_noprefix(blob, PCI_BUILD_BDF(min_bus, 0), 2);
> > +            /* PCI BDF end */
> > +            build_append_int_noprefix(blob, PCI_BUILD_BDF(max_bus, 0xff), 2);
> > +            /* Output node */
> > +            build_append_int_noprefix(blob, pci_ranges->output_node, 2);
> > +            /* Reserved */
> > +            build_append_int_noprefix(blob, 0, 6);
> > +
> > +            pci_ranges->count++;
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +/*
> > + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> > + * endpoints.
> > + */
> 
> this comment needs to state spec name/version, otherwise it's not clear
> what code below is based on (example: build_dmar_q35).
> 
> Also since there is no final spec yet and spec doesn't have permanent
> hosting place (i.e. hosted by one of specs org), I'd consider
> link in cover letter 'dead' and not suitable for long term use.

Yes, I'll throw those documents out once the final spec is out

> So we should shovel spec docs/specs and point to it in this comment

I could write "Defined in the ACPI Specification (Version TBD)"
For all I know it could be version 6.5 or 7.0...

> 
> > +void build_viot(MachineState *ms, GArray *table_data, BIOSLinker *linker,
> > +                uint16_t virtio_iommu_bdf, const char *oem_id,
> > +                const char *oem_table_id)
> > +{
> > +    /* The virtio-iommu node follows the 48-bytes header */
> > +    int viommu_off = 48;
> > +    AcpiTable table = { .sig = "VIOT", .rev = 0,
> > +                        .oem_id = oem_id, .oem_table_id = oem_table_id };
> > +    struct viot_pci_ranges pci_ranges = {
> > +        .output_node = viommu_off,
> > +        .blob = g_array_new(false, true /* clear */, 1),
> > +    };
> > +
> > +    /* Build the list of PCI ranges that this viommu manages */
> > +    object_child_foreach_recursive(OBJECT(ms), build_pci_range_node,
> > +                                   &pci_ranges);
> > +
> > +    /* ACPI table header */
> > +    acpi_table_begin(&table, table_data);
> > +    /* Node count */
> > +    build_append_int_noprefix(table_data, pci_ranges.count + 1, 2);
> > +    /* Node offset */
> > +    build_append_int_noprefix(table_data, viommu_off, 2);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 8);
> > +
> > +    /* Virtio-iommu node */
> > +    /* Type (virtio-pci IOMMU)  */
> 
> (1)
> /* Type */
> > +    build_append_int_noprefix(table_data, 3, 1);
>   s:3,:3 /* virtio-pci IOMMU */,:
> 
> check-patch will spit out warning but that kind comment
> is common practice with ACPI code

> 
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 1);
> > +    /* Length */
> > +    build_append_int_noprefix(table_data, 16, 2);
> > +    /* PCI Segment */
> > +    build_append_int_noprefix(table_data, 0, 2);
> (2)
> can we fetch _SEG value from device instead of hard-codding value here?

Looking for "segment" and "domain" I couldn't find any dynamic segment
number, 0 seems to be hardcoded everywhere (hw/acpi/pci.c,
hw/i386/acpi-build.c, hw/arm/virt.c, hw/arm/virt-acpi-build.c).

> 
> I might be obvious to PCI folks,
> but it would be better have at least a comment explaining
> where these values come from

I could add that "QEMU only implements segment 0"

Thanks,
Jean

> 
> Michael,
> what do you think?
> 
> > +    /* PCI BDF number */
> > +    build_append_int_noprefix(table_data, virtio_iommu_bdf, 2);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 8);
> > +
> > +    /* PCI ranges found above */
> > +    g_array_append_vals(table_data, pci_ranges.blob->data,
> > +                        pci_ranges.blob->len);
> > +    g_array_free(pci_ranges.blob, true);
> > +
> > +    acpi_table_end(linker, &table);
> > +}
> > +
> > diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> > index 3b5e118c54..622b0b50b7 100644
> > --- a/hw/acpi/Kconfig
> > +++ b/hw/acpi/Kconfig
> > @@ -51,6 +51,10 @@ config ACPI_VMGENID
> >      default y
> >      depends on PC
> >  
> > +config ACPI_VIOT
> > +    bool
> > +    depends on ACPI
> > +
> >  config ACPI_HW_REDUCED
> >      bool
> >      select ACPI
> > diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> > index 7d8c0eb43e..adf6347bc4 100644
> > --- a/hw/acpi/meson.build
> > +++ b/hw/acpi/meson.build
> > @@ -20,6 +20,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'), if_false: files(
> >  acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
> >  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
> >  acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
> > +acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
> >  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
> >  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
> >  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> 
