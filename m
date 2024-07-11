Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp266119nji;
        Thu, 11 Jul 2024 08:49:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXpPxyj0Qy/4OhO9yG2hDAREEXJiAf/xWwwCvVnkQ/gg+wDq+y38ZwCSrdn0qk4pfUT4XfLwtuN0ihU1J705ZwYD4wrslk0
X-Google-Smtp-Source: AGHT+IE51PlX54AkhJ6PyVAI1FBAqvD0FeuFOY/Rbkt6L9g58AVVlsh//kbXZRcdrDHkHMfnT3rY
X-Received: by 2002:a05:6902:4c7:b0:e03:a3ac:fb75 with SMTP id 3f1490d57ef6-e041b05ca71mr9630630276.23.1720712969998;
        Thu, 11 Jul 2024 08:49:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720712969; cv=none;
        d=google.com; s=arc-20160816;
        b=ufbaopxZPK+0GndTcewao9h0LI0G4lAFKK4mzS3w0QccO04xZA/DLYkUtzJhnjl+2W
         6o7jIHPxg3Ei/HcpViIh1anZHgvbTMrGKf2UgD3AMZPIIAgtQ2JiVMvuieRfM8rQ6Geo
         y+Hfm1tkTXyGhtVxkWeq3RNxyqarK+6NPf4c76KY6RzsAhlTXXiNrZem9fFKeujC+7gf
         b4KpVGTtWXYn5FsTtRZ2veAaSOu6/92pJjJfwk5fYW6ZVjB35dznFVwsBzvqBpy3Tt0m
         vVa35Skr+NC5OInWeRxYGQldYwpstq33Bn/3VPhRUoQwX3QqsZoQr/pcKB1xXNaf0N1c
         Gw/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :in-reply-to:mime-version:references:from:dkim-signature;
        bh=yqGhKTCLzV102CtXJNgKbffh4EHa55AzQPOPjiU5ZHw=;
        fh=9QS+pecEwBmLPUNYBQ2fhLlhrXrF0IQDGftRZ0ZJVxY=;
        b=TQ+pHnDEPS5RjNtNh8b2reU6TYKzpBeirPcad6Dzx7vfSkB5472jTzt1rdCBOgU23D
         0R3CZcMQpPmEcYigOHFTx4/KR/W9r4FXdtamqBpFryyeZbcIAqjrrzWOVifDqOFnIJo/
         esLsoSKAidMcKbS4YGV59P95Om2Y5Ol9RZlC+wffkVeRvEOH8Y2ozhKQP+Z/EtsiWscJ
         S63NKX2+mtyrQUzmLxE11lHMLhkjczPmkci5ctNaZRHoxvMmrSALjoV7HMKOavYlja/t
         gQivEnp3TUP49AiIe4a2PhXGNUNayjOY41uHUl3UXwmw9jmrQf/mVd5iPGzz0Y3q2mjp
         /IdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BZnQkW2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba904a9si71989336d6.251.2024.07.11.08.49.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 08:49:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BZnQkW2U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRw2t-0005H4-St; Thu, 11 Jul 2024 11:49:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1sRw2s-0005GB-U5
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 11:49:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abologna@redhat.com>)
 id 1sRw2r-0003B1-4F
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 11:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720712958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yqGhKTCLzV102CtXJNgKbffh4EHa55AzQPOPjiU5ZHw=;
 b=BZnQkW2Ufh54463r408qTAFm+rll9bbZBQqpUqtmyjC00V7p/55wNGSYK0vhnZmb9dGNmh
 V2pJ+rAkBLXF0SdohWoWlYAdTRwbMZbcPHdZuSdCceZ1AVmdU3cu4L/s3FvsH7SYV9Embp
 bkZdJh2b4uGLOMvUPgtGX9QtTSXefRs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-LzZ0JpqmPeqKfZ9U2HMQlw-1; Thu, 11 Jul 2024 11:48:12 -0400
X-MC-Unique: LzZ0JpqmPeqKfZ9U2HMQlw-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-447fef8f3dbso12227791cf.0
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 08:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720712891; x=1721317691;
 h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yqGhKTCLzV102CtXJNgKbffh4EHa55AzQPOPjiU5ZHw=;
 b=GFX0Zkysw4fq0ZHkYsPfCe4NPyZrmfGdFEmYReuaznx+iNmgRoAz/iCfKznsEb6Brd
 o2kIB6WlJ/YFb5CErLSxtRGOrN4YV6gDp5N154iFw7pjtKN5RTS32Xenewtcg/VegEaz
 steRKut+g4rGG7EhSsAtgNtOWcisfdvz+kzPdgMmMC8IidTAS09uG78LKj43TDhjlHRE
 RIFiagrfiYHafK088QYh59Qek4r5IkW5WLKlsjQ4a4RoQCYeb1OIdEWK6ZftJHTDWbYa
 ATiyuvPbg9R8ykHABL8B1okW21FLsjMuXJaHib7CQTtl8Ioiha9ulBhxyURTmNozG2J9
 nxwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRHQOfHZ605LAekD7vu7Vlzhd0FoJLfzUPZH7xVuEHjOQd7/EDKITcHAFODpdj4nZrPeSMTgEGMwOJhbpBlDehH+G3
X-Gm-Message-State: AOJu0YyPQ1GeQRAuGjMsEfA+nuXfDCDCSWOSIJAMUTQ4c8AEw5rgEINm
 OVaoKVXJop87ZTM/rUTynxOV+SmMck2Bzo/fxqN0TiMhRG5bn82+RMJ8qAbawgLGr/AnCG/mQ5b
 ymi6MTdIPOWsa7uH2/fzg/V4ThxqNzIPYhmC1gKwB6/cuezeqLI3O9Si/l+CFisQroSgY6vlWus
 OjAp+5epe4ZRGebcWCHVgnkQqI
X-Received: by 2002:a05:622a:198a:b0:447:dbe8:5268 with SMTP id
 d75a77b69052e-447fa92d037mr102820791cf.37.1720712891591; 
 Thu, 11 Jul 2024 08:48:11 -0700 (PDT)
X-Received: by 2002:a05:622a:198a:b0:447:dbe8:5268 with SMTP id
 d75a77b69052e-447fa92d037mr102820481cf.37.1720712891239; Thu, 11 Jul 2024
 08:48:11 -0700 (PDT)
Received: from 744723338238 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 11 Jul 2024 08:48:10 -0700
From: Andrea Bolognani <abologna@redhat.com>
References: <cover.1719361174.git.nicolinc@nvidia.com>
 <bc7a57311ac4976699789ceca329edfdfe823c2d.1719361174.git.nicolinc@nvidia.com>
 <9c3e95c2-1035-4a55-89a3-97165ef32f18@redhat.com>
 <Zo16gnKKxXFg4LLE@Asurada-Nvidia>
MIME-Version: 1.0
In-Reply-To: <Zo16gnKKxXFg4LLE@Asurada-Nvidia>
Date: Thu, 11 Jul 2024 08:48:10 -0700
Message-ID: <CABJz62PVt9h9776DjXkPYq_Mf+AUJ-0YhnDi-OsaqCqrsrGSQQ@mail.gmail.com>
Subject: Re: [PATCH RFCv1 05/10] hw/arm/virt: Add VIRT_NESTED_SMMU
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Eric Auger <eric.auger@redhat.com>, peter.maydell@linaro.org, 
 shannon.zhaosl@gmail.com, mst@redhat.com, imammedo@redhat.com, 
 anisinha@redhat.com, peterx@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, jgg@nvidia.com, shameerali.kolothum.thodi@huawei.com, 
 jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=abologna@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.142,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: h1VC3jiFXVr+

On Tue, Jul 09, 2024 at 10:59:30AM GMT, Nicolin Chen wrote:
> On Tue, Jul 09, 2024 at 03:26:58PM +0200, Eric Auger wrote:
> > > +    /* Build PCI Expander Bridge + Root Port from the top of PCI_BUS_MAX */
> > > +    if (vms->num_nested_smmus) {
> > > +        /* VIRT_NESTED_SMMU must hold all vSMMUs */
> > > +        g_assert(vms->num_nested_smmus <=
> > > +                 vms->memmap[VIRT_NESTED_SMMU].size / SMMU_IO_LEN);
> > > +
> > > +        vms->nested_smmu_phandle = g_new0(uint32_t, vms->num_nested_smmus);
> > > +
> > > +        for (i = 0; i < vms->num_nested_smmus; i++) {
> > > +            DeviceState *smmu_dev;
> > > +            PCIBus *pxb_bus;
> > > +
> > > +            pxb_bus = create_pcie_expander_bridge(vms, i);
> > > +            g_assert(pxb_bus);
> > > +
> > > +            vms->nested_smmu_phandle[i] = qemu_fdt_alloc_phandle(ms->fdt);
> > > +            smmu_dev = create_nested_smmu(vms, pxb_bus, i);
> > > +            g_assert(smmu_dev);
> > > +
> > > +            qemu_fdt_setprop_cells(ms->fdt, nodename, "iommu-map", 0x0,
> > > +                                   vms->nested_smmu_phandle[i], 0x0, 0x10000);
>
> > I think libvirt is supposed to create the pcie bus topology instead and
> > it shall not be created by qemu behind the scene.
> > The pcie elements you create here are not visible to libvirt and I guess
> > they may collide with elements explicitly created by libvirt at a given
> > pci bdf.
>
> Yea, the bdf conflict is a concern. So I allocated the bdf list
> from the top of the bus number... one of the reasons of doing
> this is to ease users so they don't need to deal with the over-
> complicated topology. I will try libvirt and see how it goes.

libvirt developer here. Eric is absolutely right that creating PCI
controllers implicitly will not fly, as libvirt's PCI address
allocation algorithm would not know about them and would produce
incorrect output as a result.

> > I think it would make more sense to be able to attach an smmu instance
> > to a given pci root or pxb either by adding an iommu id to a given
> > pxb-pcie option
> >
> > -device
> > pxb-pcie,bus_nr=100,id=pci.12,numa_node=0,bus=pcie.0,addr=0x3,iommu=<id>
> > or
> > adding a list of pxb ids to the iommu option. It is unfortunate the
> > iommu option is a machine option.
>
> Yes. I had thought about that too, but the virt-machine code
> creates all the instance at this moment...
>
> > platform bus framework could be considered to dynamically allocate them
> > using the -device option. This has been used along with dt generation
> > but with ACPI this would need to be studied. However at the time the
> > smmu was integrated the machine option was prefered.
> >
> > Maybe using the 1st option would allow to infer that if there are
> > different iommu ids this implies that several IOMMU instances need to be
> > created.
>
> Yea, I like the idea of creating iommu instance with a "-device"
> string.

This sounds like the best option to me as well. Incidentally, it's
also how the intel-iommu device works. From libvirt's test suite:

  -device '{"driver":"intel-iommu","id":"iommu0"}'

Looks like a sensible model to follow. You could then associate each
specific IOMMU instance to a PCI controller using an attribute, as
Eric suggested above.

> One more question. Let's say we have 2 smmus/pxb-buses:
>   [ pxb0] <---> vSMMU0/pSMMU0 [ devA, devB, devC ]
>   [ pxb1] <---> vSMMU1/pSMMU1 [ devD, devE, devF ]
> How would a user know that devA/devB should be attached to pxb0
> without doing like devA->pxb0 and devB->pxb1? Should QEMU just
> error out until the user associate them correctly? Or they may
> rely on libvirt to figure that out, i.e. moving the iommu node
> matching from QEMU to libvirt?

IIUC having devices associated to the "correct" SMMU is only a
requirement for optimal performance, not pure functionality, right?
In other words, getting the association wrong will make things slower
but they will keep working.

Is a 1:1 match between pSMMU and vSMMU mandatory? On a system with 4
SMMUs, could I create a VMs with

  vSMMU0 <-> pSMMU0
  vSMMU1 <-> pSMMU1

and another one with

  vSMMU0 <-> pSMMU2
  vSMMU1 <-> pSMMU3

assuming of course that devices are assigned to the correct VM?

How is the association between vSMMU and pSMMU created anyway? Is
that something that the user can control, or is it done automatically
somehow?

-- 
Andrea Bolognani / Red Hat / Virtualization

