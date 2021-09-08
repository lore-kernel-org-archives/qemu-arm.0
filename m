Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp279216lfb;
        Wed, 8 Sep 2021 02:50:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxFk/ycVK0UkbY9QBPM9p8Tz8hPM02yI68lauvQK3q8Wr05xnheXQVwCMCIgCxchp8GIJI
X-Received: by 2002:a25:1bc3:: with SMTP id b186mr4023747ybb.284.1631094632175;
        Wed, 08 Sep 2021 02:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631094632; cv=none;
        d=google.com; s=arc-20160816;
        b=YHJyBxQouqhNDF7xFXmdaVJyAVL+cJCoLsRrf9kcgT2OjkF3Eqam2Mx1ld0I6E0GcN
         DJSw5fF74fZuH4ZCEHCpUpJZ0b4R3i+sfuvXn77GMNtX1EJwZnF2SWwy9N288ddGB4pD
         m++CTubUbsgWJR+hF7TkyVXBI48Q19qmZslgJVnoJG92ua1lsZshuYlkNSN4nYW1X4Tp
         OtxVZLM9+eDG9Oe2y2AbIpWtEWACQRSG/MJ8NwL989w9mjiZ2wR35jhbd1iVEUzA83cF
         V/ztoUfOa33FetYZm7kst4xKrO28OHGP9jhsZbMEoW+C4E9R7i1S8lJnAKLe9Kau6mZx
         iYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=RqEVGoYp0CsB3m9INu/2TqECTBzYNXbDBTSGLpHKkSU=;
        b=WJFLuNO3llV4hGSovDLHuR9BmHVMPGKClb7hPu07d71F5vz3qFLEZGNKVoTCv3vwev
         BfDgbzGTN7khOiNDuSljx1cfhaZO46p3ibwV3msPdOipLd5OI2IMSd4TSrZ0XPdNH9LO
         8t5uH0FDJSdKChn4kvZDDZHggnV6tUQiaNEu71EL/O27/ANFLGoZ3kAx08Ug/cy3mhDF
         t1cJfbpNXE9v/5nxEcrg6K76yB/d0+1q8UCpjBesWQlOomVi084LuY2Otowj4bkVUVjU
         opkOHHRI/P91aDRTl1GVua6f0MRN6r64rge9dkPhtlZhHclE5OUIPPnlh7zal5VujNzW
         pcLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ITkCBPOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8si1832062yba.349.2021.09.08.02.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Sep 2021 02:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ITkCBPOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNuDv-0006SY-GK
	for alex.bennee@linaro.org; Wed, 08 Sep 2021 05:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuDT-0006Rz-4v
 for qemu-arm@nongnu.org; Wed, 08 Sep 2021 05:50:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:37668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mNuDQ-0007Em-NF
 for qemu-arm@nongnu.org; Wed, 08 Sep 2021 05:50:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso1087473wmb.2
 for <qemu-arm@nongnu.org>; Wed, 08 Sep 2021 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RqEVGoYp0CsB3m9INu/2TqECTBzYNXbDBTSGLpHKkSU=;
 b=ITkCBPOlIuEulOfEsWLjuOlVSFil4sNjosGgNJMkIm4HbpAAm4A7eZqFewNfEgPjSh
 hvs/O/0Oq1NTrdqIkJi0H398u0pT1hkSYc17SOzzBXg7xTWIi0kOkF1HseCoQ882vHLw
 xMwqGhkh/BgQx5lLzIN5VW9rA38OI23DUmI/YjKGeQojn+oEOQDsTzmg7b2IUsybtH6b
 YrF09Jet97WhX9x4kwddeaDCZqO56jq0Pol+o2mUqAOvVr55FVu1A7VAP5P6qWeONkFo
 xjiwqbbO1p9ZOPcor66eanabR1yldiwPQgAE8ymYXh1reSGy52BP1MhKhrOXOJB9SuWk
 zj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RqEVGoYp0CsB3m9INu/2TqECTBzYNXbDBTSGLpHKkSU=;
 b=Fe9cCuqmB0ukLmytJ/k5vCVrD91/Ni4fO0TpS6Cfm0UBRa1oHJSCiB9KeCq0+ATboJ
 PZK3zPLQDeJm1JTi4QlQYqLRVZtGT3RmwOzDjnMi2Gc83dWdYFb+dv91ZBqirlU4pr0T
 yA602g6y4jaHkI0jtnvaiOurxgp3qXMREeId3KqQeB8pK8mOT23E8xcwUQOCcLv3n6II
 6W01oXo0OHK3EkKkTjJuLtNsajdFHcPztr/++/kHuncNycb3NHD2iIhV0qL8ylYKDd8C
 2gi6d4g96L728Wp9/8xMR9inFsf436hbsmy855lIeFpRta1uuUdS9nDoLYvXWwCSUXm3
 b/Kg==
X-Gm-Message-State: AOAM531cPM/vUOnW8OoHoDgJfkN2triM3Q48WYQvLorBWSJOPeG+oRqU
 PDBfyUm7K+QzD05DjIiWGIQC3Q==
X-Received: by 2002:a1c:9a8e:: with SMTP id c136mr1300789wme.191.1631094598928; 
 Wed, 08 Sep 2021 02:49:58 -0700 (PDT)
Received: from larix (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id i5sm1422168wmq.17.2021.09.08.02.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:49:58 -0700 (PDT)
Date: Wed, 8 Sep 2021 10:52:08 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 2/8] hw/acpi: Add VIOT table
Message-ID: <YTiHyBQFzv4ZXAOZ@larix>
References: <20210903143208.2434284-1-jean-philippe@linaro.org>
 <20210903143208.2434284-3-jean-philippe@linaro.org>
 <e3280e20-ca86-23a6-7ae4-6817b9a424e9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3280e20-ca86-23a6-7ae4-6817b9a424e9@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jTIrNprOcq/N

On Mon, Sep 06, 2021 at 02:58:55PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 9/3/21 4:32 PM, Jean-Philippe Brucker wrote:
> > Add a function that generates a Virtual I/O Translation table (VIOT),
> > describing the topology of paravirtual IOMMUs. The table is created when
> > instantiating a virtio-iommu device. It contains a virtio-iommu node and
> > PCI Range nodes for endpoints managed by the IOMMU. By default, a single
> > node describes all PCI devices. When passing the "default_bus_bypass_iommu"
> > machine option and "bypass_iommu" PXB option, only buses that do not
> > bypass the IOMMU are described by PCI Range nodes.
> 
> You may consider to add a test for the new VIOT table (However this may
> be added afterwards). See tests/qtest/bios-tables-test.c for the process
> and examples.

Sure, it adds 5 patches to the series

> > +/*
> > + * Generate a VIOT table with one PCI-based virtio-iommu that manages PCI
> > + * endpoints.
> Add a link to the doc + Table refs?
> 
> https://jpbrucker.net/virtio-iommu/viot/viot-v9.pdf

No, this document is only temporary until the next ACPI release. Although
the titles and text should be the same, I don't know the refs in the final
document but they will be different

> 
> > + */
> > +void build_viot(GArray *table_data, BIOSLinker *linker,
> > +                uint16_t virtio_iommu_bdf, const char *oem_id,
> > +                const char *oem_table_id)
> > +{
> > +    /* virtio-iommu node follows the header */
> > +    int viommu_off = sizeof(AcpiViot);
> > +    int viot_start = table_data->len;
> > +    struct viot_pci_ranges pci_ranges = {
> > +        .output_node = viommu_off,
> > +        .blob = g_array_new(false, true, 1),
> > +    };
> > +
> > +    /* Build the list of PCI ranges that this viommu manages */
> > +    object_child_foreach_recursive(object_get_root(), viot_host_bridges,
> > +                                   &pci_ranges);
> > +
> > +    /* VIOT header */
> > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> Depending on the order of landing, this may be replaced by Igor's
> 
> acpi_init_table() and associated with acpi_table_composed().

Ok I'll prepare that as a fixup, and send it or squash it after the ACPI
series lands

> <<<<<<< HEAD
> acpi_ss.add(when: 'CONFIG_ACPI_PIIX4', if_true: files('piix4.c'))
> acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
> acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false:
> files('acpi-pci-hotplug-stub.c'))
> =======
> acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))
> acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
> >>>>>>> hw/acpi: Add VIOT table

Indeed, fixed

Thanks,
Jean
