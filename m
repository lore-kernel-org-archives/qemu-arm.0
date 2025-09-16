Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B584ACAC598
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Sep 2025 10:33:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyT0J-0006wM-Av; Tue, 16 Sep 2025 06:33:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerkolothum@gmail.com>)
 id 1uyT0D-0006vu-Cu
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 06:33:37 -0400
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shameerkolothum@gmail.com>)
 id 1uyT0A-0002Kt-VS
 for qemu-arm@nongnu.org; Tue, 16 Sep 2025 06:33:37 -0400
Received: by mail-qt1-x830.google.com with SMTP id
 d75a77b69052e-4b5e35453acso64018221cf.2
 for <qemu-arm@nongnu.org>; Tue, 16 Sep 2025 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758018812; x=1758623612; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aMFnDBrQGvaoHCf6yuyUB7OkjeOL++XZzfVLWKNUD6U=;
 b=cRj/hfCP6zCXIv490JkoA5rwbgHMYOESJoRu8FvGxoK7S+UzvU605tzdA1SK7TL6gp
 noZZC21s+3ySks7FTIf5mCX0HPHaTdhafNe5yAJG0uY8eK863H9gJ5Wfo17v10F58oqK
 u2hN9SrjaBl2TlHXmQ12jb/P/Od0bIZaKS+YvTbLRzUIH7+CCEeiIZ/PAQ9hFz0p5mPm
 hXRqvaE0vZbeKsrgJYB/22ZUoCiULcryyYLWraVoWt2dCWHxN1VINMZtU8YQhYfy8Qtu
 d7yUESmb0nwCqNZANyq4bRb32Wsn7JMnGqDaeKwj5bPwDzFxKuZ3fQmUbZp/d5novVUj
 Vpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758018812; x=1758623612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aMFnDBrQGvaoHCf6yuyUB7OkjeOL++XZzfVLWKNUD6U=;
 b=qieCM1FzFxVAv6cZf+z39btLhvcVr8lrSstqmorfE6EX4mOg3pDPRzzhXanRKiVieO
 JzKoX7tC42x+z2u03dVD44eKA+ATJZwZOfLBG9M7MYgdV1f5d2tX0An/qmoaiBlfrZCP
 hj/YUW43nJreS7bxPazdxnp27jf22xbhj4SCR2RWXfdzyYSGq5usb8DA38j+nVdPa5pf
 7atFn39+lrJQpf4lcI4SsdsbPvR07ZXlJO3xApmUOZM/PiWDQ6wJSPECr9CPCP7EIvmT
 WOTbXnnO5NniNG+/AWjc0svEQbknmcn981CvO1me7+k3E35JPKv2UUOO/H7mG8NCAFrL
 hQZQ==
X-Gm-Message-State: AOJu0YzGoGfgnDvU3h2LveUBp4tVHX1a2na2rxkKFjl/uZhxxeBXO9IY
 Q70pYEVRuxsyiYni1162CN8LgKU5pNluF/YSDpnIBlt4G69rEB+aD2yqAU5VQrPYZCBdhgBPq6D
 T1Pd72IEVAgE+fI797xtiCHllucqL8gY=
X-Gm-Gg: ASbGncsj+wgfvJ/WotAdSk8v0UflMngBPr4c5KFrCYtyHLQjtB2/NYszBTipJRS8mqU
 mp6CMWHxkS0gDg6dOaFPCNqVnNoLC9Nx1U2uxBdxwZ+BMpjFWRGqans+8fKUmlCcsNCinESu7R9
 UO0uQRPez6H3Vv+Rv4+8iwAhkmVvnkk56z5wUvyvLAVdIlNXsJLyUeXXSbMkzLDvlhs4ejTEoCq
 kB5qV/Y
X-Google-Smtp-Source: AGHT+IHWlOKbveSieV8Ha5heT/51TQZIP85eBTLbZEPGwcQf6dB2awZ21xeH7XelylWC6N3uALSzzCs+bRv0M21bs8c=
X-Received: by 2002:ac8:5d92:0:b0:4b7:a68d:6797 with SMTP id
 d75a77b69052e-4b7a68d6ab9mr85174381cf.11.1758018812216; Tue, 16 Sep 2025
 03:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-7-shameerali.kolothum.thodi@huawei.com>
 <aJKn650gOGQh2whD@Asurada-Nvidia>
In-Reply-To: <aJKn650gOGQh2whD@Asurada-Nvidia>
From: Shameer Kolothum <shameerkolothum@gmail.com>
Date: Tue, 16 Sep 2025 11:33:21 +0100
X-Gm-Features: AS18NWDGx3Havi71e3FxDpSSeZulx78AOIHhLtH-1h_yBfoQmTvPscnmeNcVql4
Message-ID: <CAHy=t28z=wrXbXOJjD4sFw0RxJR3fccqF-EdaQDB_s_F6RC4FQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/15] hw/arm/smmuv3-accel: Restrict accelerated
 SMMUv3 to vfio-pci endpoints with iommufd
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 peter.maydell@linaro.org, jgg@nvidia.com, ddutile@redhat.com, 
 berrange@redhat.com, nathanc@nvidia.com, mochs@nvidia.com, 
 smostafa@google.com, linuxarm@huawei.com, wangzhou1@hisilicon.com, 
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com, zhangfei.gao@linaro.org, 
 zhenzhong.duan@intel.com, skolothumtho@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::830;
 envelope-from=shameerkolothum@gmail.com; helo=mail-qt1-x830.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Nicolin,

On Wed, 6 Aug 2025 at 01:55, Nicolin Chen <nicolinc@nvidia.com> wrote:
>
> Hi Shameer,
>
> On Mon, Jul 14, 2025 at 04:59:32PM +0100, Shameer Kolothum wrote:
> > @@ -25,30 +31,72 @@ static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
> >
> >          sbus->pbdev[devfn] = sdev;
> >          smmu_init_sdev(bs, sdev, bus, devfn);
> > +        address_space_init(&accel_dev->as_sysmem, &s->s_accel->root,
> > +                           "smmuv3-accel-sysmem");
> >      }
> >
> >      return accel_dev;
> >  }
> [..]
> >  static AddressSpace *smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
> >                                                int devfn)
> >  {
> > +    PCIDevice *pdev = pci_find_device(bus, pci_bus_num(bus), devfn);
> >      SMMUState *bs = opaque;
> > +    bool vfio_pci = false;
> >      SMMUPciBus *sbus;
> >      SMMUv3AccelDevice *accel_dev;
> >      SMMUDevice *sdev;
> >
> > +    if (pdev && !smmuv3_accel_pdev_allowed(pdev, &vfio_pci)) {
> > +        error_report("Device(%s) not allowed. Only PCIe root complex devices "
> > +                     "or PCI bridge devices or vfio-pci endpoint devices with "
> > +                     "iommufd as backend is allowed with arm-smmuv3,accel=on",
> > +                     pdev->name);
> > +        exit(1);
> > +    }
> >      sbus = smmu_get_sbus(bs, bus);
> >      accel_dev = smmuv3_accel_get_dev(bs, sbus, bus, devfn);
> >      sdev = &accel_dev->sdev;
> >
> > -    return &sdev->as;
> > +    if (vfio_pci) {
> > +        return &accel_dev->as_sysmem;
>
> I found a new problem here that we initialize new as_sysmem per
> VFIO device. So, sdevs would return own individual AS pointers
> here at this get_address_space function, although they point to
> the same system address space.
>
> Since address space pointers are returned differently for VFIO
> devices, this fails to reuse ioas_id in iommufd_cdev_attach(),
> and ends up with allocating a new ioas for each device.
>
> I think we can try the following change to make sure all accel
> linked VFIO devices would share the same ioas_id, though I am
> not sure if SMMUBaseClass is the right place to go. Please take
> a look.

Ok. I think it is better to move that to SMMUv3AccelState and call
address_space_init() in smmuv3_accel_init() instead. Something like
below. Please take a look and let me know.

Thanks,
Shameer

diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
index 3b2f45bd88..e7feae931d 100644
--- a/hw/arm/smmuv3-accel.c
+++ b/hw/arm/smmuv3-accel.c
@@ -339,7 +339,6 @@ void smmuv3_accel_batch_cmd(SMMUState *bs, SMMUDevice *sdev,
 static SMMUv3AccelDevice *smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,
                                                 PCIBus *bus, int devfn)
 {
-    SMMUv3State *s = ARM_SMMUV3(bs);
     SMMUDevice *sdev = sbus->pbdev[devfn];
     SMMUv3AccelDevice *accel_dev;

@@ -351,8 +350,6 @@ static SMMUv3AccelDevice
*smmuv3_accel_get_dev(SMMUState *bs, SMMUPciBus *sbus,

         sbus->pbdev[devfn] = sdev;
         smmu_init_sdev(bs, sdev, bus, devfn);
-        address_space_init(&accel_dev->as_sysmem, &s->s_accel->root,
-                           "smmuv3-accel-sysmem");
     }

     return accel_dev;
@@ -518,6 +515,7 @@ static AddressSpace
*smmuv3_accel_find_msi_as(PCIBus *bus, void *opaque,
                                                   int devfn)
 {
     SMMUState *bs = opaque;
+    SMMUv3State *s = ARM_SMMUV3(bs);
     SMMUPciBus *sbus;
     SMMUv3AccelDevice *accel_dev;
     SMMUDevice *sdev;
@@ -534,7 +532,7 @@ static AddressSpace
*smmuv3_accel_find_msi_as(PCIBus *bus, void *opaque,
     if (accel_dev->s1_hwpt) {
         return &sdev->as;
     } else {
-        return &accel_dev->as_sysmem;
+        return &s->s_accel->as_sysmem;
     }
 }

@@ -558,6 +556,7 @@ static AddressSpace
*smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
 {
     PCIDevice *pdev = pci_find_device(bus, pci_bus_num(bus), devfn);
     SMMUState *bs = opaque;
+    SMMUv3State *s = ARM_SMMUV3(bs);
     bool vfio_pci = false;
     SMMUPciBus *sbus;
     SMMUv3AccelDevice *accel_dev;
@@ -575,7 +574,7 @@ static AddressSpace
*smmuv3_accel_find_add_as(PCIBus *bus, void *opaque,
     sdev = &accel_dev->sdev;

     if (vfio_pci) {
-        return &accel_dev->as_sysmem;
+        return &s->s_accel->as_sysmem;
     } else {
         return &sdev->as;
     }
@@ -612,6 +611,8 @@ void smmuv3_accel_init(SMMUv3State *s)
                              "smmuv3-accel-sysmem", get_system_memory(), 0,
                              memory_region_size(get_system_memory()));
     memory_region_add_subregion(&s_accel->root, 0, &s_accel->sysmem);
+    address_space_init(&s_accel->as_sysmem, &s_accel->root,
+                       "smmuv3-accel-sysmem");
 }

 static void smmuv3_accel_class_init(ObjectClass *oc, const void *data)
diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
index e1e99598b4..8f04f2fa5d 100644
--- a/hw/arm/smmuv3-accel.h
+++ b/hw/arm/smmuv3-accel.h
@@ -37,7 +37,6 @@ typedef struct SMMUS1Hwpt {

 typedef struct SMMUv3AccelDevice {
     SMMUDevice  sdev;
-    AddressSpace as_sysmem;
     HostIOMMUDeviceIOMMUFD *idev;
     SMMUS1Hwpt  *s1_hwpt;
     SMMUViommu *viommu;
@@ -48,6 +47,7 @@ typedef struct SMMUv3AccelDevice {
 typedef struct SMMUv3AccelState {
     MemoryRegion root;
     MemoryRegion sysmem;
+    AddressSpace as_sysmem;
     SMMUViommu *viommu;
     struct iommu_hw_info_arm_smmuv3 info;
 } SMMUv3AccelState;

