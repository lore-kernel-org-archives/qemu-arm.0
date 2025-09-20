Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A4DCAC5A5
	for <qemu-arm@archiver.kernel.org>; Sat, 20 Sep 2025 13:04:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzxG3-0000c4-Du; Sat, 20 Sep 2025 09:04:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uzxG1-0000bb-Kv
 for qemu-arm@nongnu.org; Sat, 20 Sep 2025 09:04:05 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uzxFz-0005eO-Qd
 for qemu-arm@nongnu.org; Sat, 20 Sep 2025 09:04:05 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-ea5ca8dbd37so1933772276.2
 for <qemu-arm@nongnu.org>; Sat, 20 Sep 2025 06:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758373442; x=1758978242; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xiQ+B8haY8wM2ZYMlbbGQ0QYSn3IkE1oi1qDQl7choQ=;
 b=V5ld5g2MPbswcwzaamgbGVh+P1X76ZQRQdYgt42I0RzHvj+9qbwMw7CIV9kgCWRt0J
 ekIQunAWjcpBaUijafhTGK8SQizZG3X1qBFl73kd20Z2Kj1urTHE+Vz6FNMbHuzAeBAR
 aqBdjkyinOePpaw1OIR0BWkmjSe/rHZMP5JUmb+quGbrdScm23Xgdtj9fK9fjgsPsrhM
 hwV2k7SuuIB047CAFS9UDsSa4Qx4XjLFLRVdkpOG67MFjLEETSIF5Lq2keiCYUDMxwkL
 ANvRqgHmJSCmQtvtp9t0naP27NaT7cIIXx3VPK0gQKERfWLdra6/KFj8e64ohM7zwoSC
 jjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758373442; x=1758978242;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xiQ+B8haY8wM2ZYMlbbGQ0QYSn3IkE1oi1qDQl7choQ=;
 b=Lf00fisIVcv1ZWfPGkL14jpE/XcVGGPHYZ1Gju6Wc7twruxzOloYN1xyYL+/EG8an3
 QJPG1lgTlzglJ1oI3/pLfZ+Y54f+mPMLYeAX1uXdWoEq9qOQI8msUQWZU0AlbhiMgGu8
 2p07EihBuAMXPw+T+zL/NIOEw4bttcRyNuDidn+lo0D+DiTdSBF3ZZsEpNsO+LZ6LGhf
 C5EPIXmBDczI2Ztri6l5Oiq8Kr8ndMVEn4X4q699P/C6cOzaMriJVPm5r8BqVF+I7y3X
 4YgyZFzQaBc0ae96LNe0WTPwmCENQtAAodA+DrlFTZ9koB6ytys+A52Zg7XWOySV6AT/
 0ytA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH2o0N+3OTt5V/ECqBOKPvLpDfTcO+/kM0j0eJKegSqC5gag5Wmm4iBlv017dUG2UjXDa5xc8tpA==@nongnu.org
X-Gm-Message-State: AOJu0YwIZqztWweybViWbnN8/fr/aJwYK5MhVRU9lNJrOMZP+A0QkqRK
 cQ3Kdd9x5RlnDL6ATaGxjGub0AP3y7VteCkAREbaWeERGaM4j3fvIHReg5c2eLUS/VnWvzgAjv0
 ui0DwKmbEfkVZeQKvuVRzDwU+EqsgHbHsJFKU5qg3qw==
X-Gm-Gg: ASbGncsCOtH7vjSEgX5+bI3Z3AN8qETNufzTFH5G06b7ZHU5Zv0Dpg6TJSnwrpUJao6
 HBPushVDNYDd9Xq+If+EYsTkVn6J7ANced/UegmTOfgKKCWck2uNmzjjv5xURtjKInlVaBVgQq5
 rt7dsK4927MzbiwLzOBq6dNmwGAoFZzHsQJifkxTcSMQEYF9ByNLDu3xgEBBTQ3TaEFVUjI1U3b
 yAYdXUp
X-Google-Smtp-Source: AGHT+IFKwN5ap9KeqRJ3xvA+lwfDLFWJcD261r4mg6q0sJjVXfcAGGpIEh1vlGOAzDVYm4zomNSSIxvUoDBCsLg5YQQ=
X-Received: by 2002:a05:690c:6f12:b0:722:85cc:3970 with SMTP id
 00721157ae682-73d1efe5fc7mr57062327b3.4.1758373441842; Sat, 20 Sep 2025
 06:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250714155941.22176-1-shameerali.kolothum.thodi@huawei.com>
 <20250714155941.22176-7-shameerali.kolothum.thodi@huawei.com>
 <aJKn650gOGQh2whD@Asurada-Nvidia>
 <CAHy=t28z=wrXbXOJjD4sFw0RxJR3fccqF-EdaQDB_s_F6RC4FQ@mail.gmail.com>
 <aMsBvSSEzsgeMHkK@Asurada-Nvidia>
 <CH3PR12MB7548347E93651468E70B2470AB17A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <CH3PR12MB7548B6A98B640192579078EBAB16A@CH3PR12MB7548.namprd12.prod.outlook.com>
 <aMyA4AHf7pqnOzSV@Asurada-Nvidia>
 <CH3PR12MB7548BB774BB375D5056C062CAB11A@CH3PR12MB7548.namprd12.prod.outlook.com>
In-Reply-To: <CH3PR12MB7548BB774BB375D5056C062CAB11A@CH3PR12MB7548.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 20 Sep 2025 14:03:50 +0100
X-Gm-Features: AS18NWB4nIAqV6UXhK_FFSXUddoq4btZxagLVw_nJyLvtRc3Sn9gTTui00E7sP8
Message-ID: <CAFEAcA_MReA7Lx4Mm8x6mrO9rGaeH_zNYq+EWzS4Zh=j-h-23g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 06/15] hw/arm/smmuv3-accel: Restrict accelerated
 SMMUv3 to vfio-pci endpoints with iommufd
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
 Shameer Kolothum <shameerkolothum@gmail.com>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, 
 "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, 
 Nathan Chen <nathanc@nvidia.com>, Matt Ochs <mochs@nvidia.com>, 
 "smostafa@google.com" <smostafa@google.com>,
 "linuxarm@huawei.com" <linuxarm@huawei.com>, 
 "wangzhou1@hisilicon.com" <wangzhou1@hisilicon.com>,
 "jiangkunkun@huawei.com" <jiangkunkun@huawei.com>, 
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>, 
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>, 
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 19 Sept 2025 at 08:38, Shameer Kolothum <skolothumtho@nvidia.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Nicolin Chen <nicolinc@nvidia.com>
> > Sent: 18 September 2025 23:00
> > To: Shameer Kolothum <skolothumtho@nvidia.com>
> > Cc: Shameer Kolothum <shameerkolothum@gmail.com>; qemu-
> > arm@nongnu.org; qemu-devel@nongnu.org; eric.auger@redhat.com;
> > peter.maydell@linaro.org; Jason Gunthorpe <jgg@nvidia.com>;
> > ddutile@redhat.com; berrange@redhat.com; Nathan Chen
> > <nathanc@nvidia.com>; Matt Ochs <mochs@nvidia.com>;
> > smostafa@google.com; linuxarm@huawei.com; wangzhou1@hisilicon.com;
> > jiangkunkun@huawei.com; jonathan.cameron@huawei.com;
> > zhangfei.gao@linaro.org; zhenzhong.duan@intel.com
> > Subject: Re: [RFC PATCH v3 06/15] hw/arm/smmuv3-accel: Restrict
> > accelerated SMMUv3 to vfio-pci endpoints with iommufd
> >
> > On Thu, Sep 18, 2025 at 06:31:43AM -0700, Shameer Kolothum wrote:
> > > > > > @@ -37,7 +37,6 @@ typedef struct SMMUS1Hwpt {
> > > > > >
> > > > > >  typedef struct SMMUv3AccelDevice {
> > > > > >      SMMUDevice  sdev;
> > > > > > -    AddressSpace as_sysmem;
> > > > > >      HostIOMMUDeviceIOMMUFD *idev;
> > > > > >      SMMUS1Hwpt  *s1_hwpt;
> > > > > >      SMMUViommu *viommu;
> > > > > > @@ -48,6 +47,7 @@ typedef struct SMMUv3AccelDevice {  typedef
> > struct
> > > > > > SMMUv3AccelState {
> > > > > >      MemoryRegion root;
> > > > > >      MemoryRegion sysmem;
> > > > > > +    AddressSpace as_sysmem;
> > > > > >      SMMUViommu *viommu;
> > > > > >      struct iommu_hw_info_arm_smmuv3 info;  } SMMUv3AccelState;
> > > > >
> > > > > That's changing from an ioas_id per VFIO device to an ioas_id per
> > > > > vSMMU instance, right? I think it's still not enough.
> > > > >
> > > > > All vSMMU instances could share the same ioas_id. That is why I put in
> > > > > the SMMUBaseClass as it's shared structure across vSMMUs.
> > > >
> > > > Ah..you mean it is basically per VM then. Got it.
> > >
> > > Regarding using SMMUBaseClass for this, it looks like ObjectClass normally
> > holds
> > > function pointers. Eric has made a similar observation elsewhere in this
> > series.
> > >
> > >  @Eric, any suggestions?
> > >
> > > Is use of &address_space_memory directly in smmuv3_accel_find_add_as()
> > a complete
> > > no-go, given we are talking about having the system address space for all the
> > SMMUv3
> > > accelerated devices here?
> >
> > smmuv3_accel_find_add_as() is per instance. So, it wouldn't share.
>
> My suggestion was...
>
> static AddressSpace *smmuv3_accel_find_add_as(..)
> {
> ...
>     if (vfio_pci) {
>         return &address_space_memory;
>     } else {
>         return &sdev->as;
>     }
> }
>
> ie, use the global to system memory address space instead of creating an
> alias to the system memory and a different address space. This will provide
> the same pointer to VFIO/iommufd and  it can then reuse the ioas_id.
> I can see that QEMU uses "&address_space_memory" directly in many places
> (pci_device_iommu_address_space(), etc). I think the idea behind a separate
> address space is to have private ownership and lifetime management probably.
> Not sure there are any other concerns here. Please let me know if there are
> any.

I don't know about vfio, but why is it special here? Generally
directly doing stuff with address_space_memory is not a good
idea : you should be dealing with whatever address space the
board model handed you as what you do transactions to. We
have a lot of legacy code that assumes it can directly work
with address_space_memory, but we should usually try to avoid
adding new code that does that.

thanks
-- PMM

