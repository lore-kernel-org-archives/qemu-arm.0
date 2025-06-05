Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp201796njc;
        Thu, 5 Jun 2025 05:20:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVZPJoKD1JVzcgPctUOShivvp77m2ho+Z6MaNpXeFSolxYlDnfSmsq85EnhXhZ2saPnWp7a+JxzdsQvg==@linaro.org
X-Google-Smtp-Source: AGHT+IG34usaG/73P64PEhd3WrFNkldKNMwMinZqVHdevXiFJF1LW859kR7XLB/cS9wDD3Nhjsig
X-Received: by 2002:a05:622a:5c96:b0:476:875e:516d with SMTP id d75a77b69052e-4a5a58019f2mr85513851cf.36.1749126015328;
        Thu, 05 Jun 2025 05:20:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749126015; cv=none;
        d=google.com; s=arc-20240605;
        b=IRzcr7lSfdoLA8Ysti8Grz0YT2ZSORHDqqJ38FVd0pX6by6luYjNS2oDCqlVf4+/Xj
         0CiRCODtZfrZ3V3rGKpejIGVxzReIe52nnBWWnGn5gpb4XSzkiy5F5xuQn3/VBa0abtu
         9mOfY8ueRsUkm4op9DyAHzXKdGj/XOafDCILaOBlu0C6hqH8IBAez2HR8u8I84B8xj8G
         nUdaHTgJ9rSHmyg6qMlL2oQqSfCv/ety4VjNz3NZhc30M1QcHAlMIIBvoj/SATueU69K
         9bLVMuI80sOlcyPhfCPaOumOXl9oVo92YesZBUqVrG6vO4EC2rdDVokTsAOAPYSFuSZW
         FJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=P15UNYtaWqC98xkia4uszjquNEcwMlFZgR/PvlOmpIk=;
        fh=Nns/UyXhMDEolhYbPD0qBJcZtow7fDxi37BYlvPTPRI=;
        b=Ml8oCeM3xxMMpJhwvVpqgMewv7OOUA1litRfB7/qVEvOzYXjiV+xOJMIH9gQJPeIo5
         n/JRl6+zqAUvq6MguNmc9moGGuYNlN7/3QZwP5wMks0kj0mc3LjAL1HRKfDAlS7T5zDO
         sJsGi221EEG8+57ksjCtWDoy54nPnPtWsj/MfQvVlaY8laa1ZGazjKP3xaKI/B60kktX
         0YcTFuBMDWuvVWUur95zL+opFETS06tDBIdjIum9dIRLQy9Yz8xWe5S1etgeKx64gQ4s
         Zo8WUsflyQvuNW7/fvSmRhe+VPgp3k0SNN3czPjTz/BAOUkpjft9vNyLhDYU/41atyFH
         eBBA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gS90Aynj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a4359f8e9asi177707161cf.308.2025.06.05.05.20.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 05:20:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gS90Aynj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN9Zd-00057w-8b; Thu, 05 Jun 2025 08:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uN9ZR-000573-3s
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 08:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uN9ZK-0002ZF-4L
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 08:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749125976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P15UNYtaWqC98xkia4uszjquNEcwMlFZgR/PvlOmpIk=;
 b=gS90AynjZnXIc88szqiraHXdg/QZdYrCLGy24fCwv76kXCTiHfVp/maqvvitvXxKOLdLy0
 gdJL4XfhQMkKerkIyEjecSDJdD/gE56/uAmaUWizR1CIMkFrFaK/bS2XbMEeKgTub0Xfnj
 dS8memT33b8IHo/vXbB1kDXSNpSG/OM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-99-6TACGa4CMgiwIKdQbTf1MQ-1; Thu, 05 Jun 2025 08:19:35 -0400
X-MC-Unique: 6TACGa4CMgiwIKdQbTf1MQ-1
X-Mimecast-MFC-AGG-ID: 6TACGa4CMgiwIKdQbTf1MQ_1749125974
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a503f28b09so459463f8f.0
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 05:19:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749125974; x=1749730774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P15UNYtaWqC98xkia4uszjquNEcwMlFZgR/PvlOmpIk=;
 b=iVqV1ihj0MJyR4GUqIHrfzidaKoY2K/wrV4bYE6Td0vk667KXNmfSbKJiVGajRQZL0
 UdJOKQ/5Jv1IMv0CNmWRPjkk16hABYLsVKRE89XpZVF2qg6my4G0d8weZtF/d5D1S4d0
 tlTuna/mgdzPsmO/sGGyx3SQtVx9GB8VvMihuoqlQ/K1IX5wMfa1UKN4X3e0FCp9AxJn
 QhHRqX8UHPnaoWvspWCHqMabRBZhVbjz1BlZXypTSCcrlOQrGkrVXaCmv+sFxeQuLAGF
 bQICjZ6fdD6rDMzTiiV8WbVclJ9YfFLy2tzEPbKSo4nDuIzdvb9ivVB0Vk6GD+PF5INp
 8m2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQPr+AThLiMho4hlV+1kiCWuElh/VPd3OyoTkr1MtHRUE2jCwwhG4v6qxjDbMbqN+hicoMmEvovQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx8Tg/9je1B/0UXJdjtf8f+F3Q/nuHXrHUWRlEeG//8kMJGK/JS
 KKNnw9l2iK4vAhHFnrnFeiavoVEMbwtgsTcLCF6FwH9gaFbMZ/S4TWJKm+RX1+KYSfW/9Ouljb8
 5KCFK1p7IOc3bLev2tATdx9HXycmbsU6AxIQU1PdDHDFMMKq7Fm1n2EPWsmnkzQ1V
X-Gm-Gg: ASbGncsv/y6Wki3PflLDA9erac2PT+s852VB1BQHoyBABs3mhQ57rwb8haNoeJsMktg
 CmInTQTEUfdPbEysNgiyAc7pBtOSnC6sy4SrMzsyEK5QymdkgfYBKRVgcsSeDRPwazE1M4X9CW8
 Wes2AcNfzWejn316azZ0o6XF/ZlOFgG+AenTdVEcgAlv3smpXppwys99QA7Q9HyjB5cdazU2M48
 1D5BM3frwUS+ubMc8hbcrmbxkfLnXlKZ58rg0+F7kOi5R+dIODeLWQ8HtrkQjie+/XjkLqL/E+L
 NltT/Ijb7lrb0KuTCdWKBC/MGGLTVDxL
X-Received: by 2002:a05:6000:144e:b0:3a4:f607:a5ad with SMTP id
 ffacd0b85a97d-3a526e0cc7bmr3033433f8f.19.1749125973761; 
 Thu, 05 Jun 2025 05:19:33 -0700 (PDT)
X-Received: by 2002:a05:6000:144e:b0:3a4:f607:a5ad with SMTP id
 ffacd0b85a97d-3a526e0cc7bmr3033406f8f.19.1749125973382; 
 Thu, 05 Jun 2025 05:19:33 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4efe740bbsm24463605f8f.54.2025.06.05.05.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 05:19:32 -0700 (PDT)
Date: Thu, 5 Jun 2025 14:19:31 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Shameer Kolothum via <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
 <qemu-arm@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, "berrange@redhat.com"
 <berrange@redhat.com>, "nathanc@nvidia.com" <nathanc@nvidia.com>,
 "mochs@nvidia.com" <mochs@nvidia.com>, "smostafa@google.com"
 <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>, "Wangzhou (B)"
 <wangzhou1@hisilicon.com>, jiangkunkun <jiangkunkun@huawei.com>, Jonathan
 Cameron <jonathan.cameron@huawei.com>, "zhangfei.gao@linaro.org"
 <zhangfei.gao@linaro.org>
Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root
 Complex association
Message-ID: <20250605141931.1704c6a5@imammedo.users.ipa.redhat.com>
In-Reply-To: <065bbd4ee15442b58e15b298614cf5dd@huawei.com>
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-2-shameerali.kolothum.thodi@huawei.com>
 <20250605125518.138f5172@imammedo.users.ipa.redhat.com>
 <065bbd4ee15442b58e15b298614cf5dd@huawei.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wCsvAJjvruVmY-NhWuMCQ_BJwGC_DjlviggYeP8xwT4_1749125974
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: lie2zh5/F2QK

On Thu, 5 Jun 2025 11:29:59 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov <imammedo@redhat.com>
> > Sent: Thursday, June 5, 2025 11:55 AM
> > To: Shameer Kolothum via <qemu-devel@nongnu.org>
> > Cc: Shameerali Kolothum Thodi
> > <shameerali.kolothum.thodi@huawei.com>; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> > nicolinc@nvidia.com; ddutile@redhat.com; berrange@redhat.com;
> > nathanc@nvidia.com; mochs@nvidia.com; smostafa@google.com; Linuxarm
> > <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> > jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> > <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> > Subject: Re: [PATCH v3 1/6] hw/arm/smmuv3: Check SMMUv3 has PCIe Root
> > Complex association
> > 
> > On Mon, 2 Jun 2025 16:41:05 +0100
> > Shameer Kolothum via <qemu-devel@nongnu.org> wrote:
> >   
> > > Although this change does not affect functionality at present, it is
> > > required when we add support for user-creatable SMMUv3 devices in
> > > future patches.
> > >
> > > Signed-off-by: Shameer Kolothum  
> > <shameerali.kolothum.thodi@huawei.com>  
> > > ---
> > >  hw/arm/smmuv3.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > > index ab67972353..7e934336c2 100644
> > > --- a/hw/arm/smmuv3.c
> > > +++ b/hw/arm/smmuv3.c
> > > @@ -24,6 +24,7 @@
> > >  #include "hw/qdev-properties.h"
> > >  #include "hw/qdev-core.h"
> > >  #include "hw/pci/pci.h"
> > > +#include "hw/pci/pci_bridge.h"
> > >  #include "cpu.h"
> > >  #include "exec/target_page.h"
> > >  #include "trace.h"
> > > @@ -1881,6 +1882,13 @@ static void smmu_realize(DeviceState *d, Error  
> > **errp)  
> > >      SMMUv3Class *c = ARM_SMMUV3_GET_CLASS(s);
> > >      SysBusDevice *dev = SYS_BUS_DEVICE(d);
> > >      Error *local_err = NULL;
> > > +    Object *bus;
> > > +
> > > +    bus = object_property_get_link(OBJECT(d), "primary-bus",  
> > &error_abort);
> > I'd replace this with direct field access like in smmu_base_realize  
> 
> Ok.
>  
> > in QEMU with PCI, usually we specify bus to attach to with 'bus' property,
> > wouldn't it better to rename "primary-bus" to 'bus' to be consistent with
> > the rest of PCI code (and before "primary-bus" shows up as a CLI option,
> > so far (before this series) it looks like it's an internal property)?  
> 
> That was tried in v2 and since SMMUv3 is not a pci device by itself(it is a 
> sysbus device) reusing the default "bus" property to establish an association
> with a PCI bus created problems,
> https://lore.kernel.org/qemu-devel/877c2ut0zk.fsf@pond.sub.org/

that was an approach was trying to workaround by patching dc->bus_type,
which is obviously wrong.

I'm not talking about changing device type or something similar,
but about renaming 'primary-bus' property name to 'bus'
so it would be consistent interface wise with PCI or other QEMU devices
that are attached to a bus.

> > > +    if (!bus || !object_dynamic_cast(bus->parent,  
> > TYPE_PCI_HOST_BRIDGE)) {
> > Also looking at smmu_base_realize, it has NULL pointer check already.
> > Which also rises question, shouldn't smmu_base_realize check for
> > TYPE_PCI_HOST_BRIDGE as well (aka can smmu be attached to anything
> > else but a host bridge)?  
> 
> Not at the moment in Qemu. Though the SMMUv3 specification allows it to
> be associated with non-pci devices as well.

then perhaps move, the check to smmu_base_realize() for now?

if smmu + non-pci ever materialize, it can be refactored at that time. 
 
> Thanks,
> Shameer
> 

