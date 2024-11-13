Received: by 2002:a17:505:7d82:b0:1be9:327d:8ee3 with SMTP id wv2csp483074njc;
        Wed, 13 Nov 2024 08:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDbyUqd+deyJmJiko2RhDW9YzfFt0Y8oozTxywNitQdLyzbERGOYdFHmcDp+Ahv3T9+Fb0Q3bHUAxCbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE7zhV9Xgvm5e9Pe2u52urxna/ZdB2FmD6ZW/cnXXhnGqdMs+Ive2Mn++hVqj4v//cwIuBT
X-Received: by 2002:aca:1105:0:b0:3e7:a15c:4692 with SMTP id 5614622812f47-3e7a15c4fb5mr10314244b6e.27.1731514628311;
        Wed, 13 Nov 2024 08:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731514628; cv=none;
        d=google.com; s=arc-20240605;
        b=PgvciGmbBo9TLubvol8UJ+3lDJrLDTa2f5n9SGDPw+yNeQjAWRwuOw0nEgvh3yH5MU
         yBwMejV4do0uOSavqaPF/PiMu8i22Wua7qm723VbMrC+E14eM5mElJ+APkREOvxeXmJa
         Gd18Sr0ee65AcVF+xc6+A0LDLtfDFrrTebuB/XscJIHTv2Y3VEqAUfmPG9mTA4vUpKN8
         9TEeVyAROlDWC4PQSCbcEHr2p2GW7y25rBTgbrbuWqQu73PKT10GgXNspPRXUnPHQQwM
         s/OH4tdBR3iVCIMNOBUM/O97fsOBT0S6eRoEoHd3rM/7oWN0IhY5K2gtkiyX4ZbsUv52
         Yw/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=LiSHDbLAv6mIXLorT18cINUKafJvqOrs9fp4p3I+ElY=;
        fh=Zb2kcfsRNwOyZCFsdnJ9ji6Ko91sfAa5DXFIGHnC+qw=;
        b=LvKSYBASAY209zQa/o+o04TT32dURiTvi/mBy6gIq8t/yaWUA/ehIpxasiC91LM46E
         lL9ExbB5Dl5c/hTNp3BvimSvVI8B65KeGtH7d7Q29yle9nqwcudkbhF2s90Ix1qfTQSu
         QjQiXqkZHtFS8Eu6YwhlAy50qBJ/B9KtL/W/pMOp5yhGwkb/mjny56r0LnLMxS9+drga
         Pz9i5oRsXMpY9gP4K/3epW/JAga4+YbLLlxD2ZAPlci23ezzy+L1swKwasdvev2imCZS
         pWDY6mC+D6nvNumsj9xwgDj+PzgUYav5xw5QK9E/DH+Nf+w0YlI681nwSOgcevD9JFuo
         5TQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gUAa1Ene;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4aaa7bfb150si4442367137.504.2024.11.13.08.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Nov 2024 08:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=gUAa1Ene;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBG2z-0007S8-6M; Wed, 13 Nov 2024 11:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1tBG2w-0007QK-Sl
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 11:16:47 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1tBG2u-0005BP-O7
 for qemu-arm@nongnu.org; Wed, 13 Nov 2024 11:16:46 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53da266cf37so4754e87.1
 for <qemu-arm@nongnu.org>; Wed, 13 Nov 2024 08:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731514602; x=1732119402; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=LiSHDbLAv6mIXLorT18cINUKafJvqOrs9fp4p3I+ElY=;
 b=gUAa1EneOjWJuSmW5/r0xYkEQHVjjpbrm+cWPwEWhIQ/h4LHGC0V/cLocvb2REqywn
 r/JkZsfQ5EMtu1+HFiNtB1iNglecR2cHEpYCB8ES8UCRv4k/5DEgAEx5DcuY1PhJnlzj
 cneHyMkryOC4FYV47x6RYN7YT/hQfpbVH7H1Oiyd0o3TyIPO5DUZoNOlrXbPVKa6fXEj
 cnSWvhFM6McOPQmAqi/JtQJ+jMFcMdOP+qgzCJCFQJz82X8/r7fjgUbfGJNmtRyH24kQ
 OSuAPrNvlwfYopUlZ7UESeZKCqIuKTK+L4HRCMLTTOFXnBqIP2QD/vCX8JELZRYXGsf0
 dsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731514602; x=1732119402;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LiSHDbLAv6mIXLorT18cINUKafJvqOrs9fp4p3I+ElY=;
 b=HmWRG4OU50BiYcfi5wzQLSlA+J0x4QjE1kEEYBdNBpZV/Yw7ums5gEIofTJVpycpWj
 vi4cnn75BvJ4mSp+nDecbJ+H2rF4P1CGUZxiROUcNAr+YT0pICGXmzYcNp1rU8Ii0BsV
 GawqviHyvrPrCtRGjHxAuFh7i2Zm9HpXp8QHkgERVfnn/VmvvJ5nJyX2wsR+OcK1aGeX
 qq72E4o4ln+ipaQbVD5+ubEScs0p97vUAypKv3y6HSyu8jrSEP/+86yh6r17qTJMEMPv
 e5ljnkMcne6HwfBb1WqfDaBEBLGBOL20YMD4Qy7pvwb02RLJ1Oh9HNDuXgbrJHDM0N0w
 t8Tg==
X-Gm-Message-State: AOJu0Yw3ojW4718ym6DNTc+ioOOIo6GBKVe/dGZ9SOGBuggsd244wgkP
 uzzSd37RnECsZQ7jggUG7aSKoTkulkCZycEuksX5jT1Yh5s8o6TesUyGqPt7GA==
X-Gm-Gg: ASbGnctlYxQkedJ8MJPkalK/07cblmtvsKgRZd9/dubSrJbtXBSLHyRi6PoYeH4VysK
 YYGmvs5zdikCSBua7tVeqX3uVKlr+CyHUHEOHyqu5Jto+hpd6Z3sYUrKTyZlbIqYSE5lhzmC+DX
 07kgamDAVcZ/xtgutWtjLCVwDGDzTYT9MhY2gdQdwwr2sfN3aL1iniizkl0R/FiNfBSvTlfu3qZ
 vv1h0TpnlLchmltTafY/c6MoVdeqO7q03TIEU/tWfE0ikDN3AFHEwpyKf6GKUBBncfjREhm4LKD
 v9kkmwKxhJbk
X-Received: by 2002:ac2:42d1:0:b0:53b:4c7c:a792 with SMTP id
 2adb3069b0e04-53da024641dmr101138e87.6.1731514601330; 
 Wed, 13 Nov 2024 08:16:41 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com.
 [34.79.100.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9978afsm18603259f8f.52.2024.11.13.08.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 08:16:40 -0800 (PST)
Date: Wed, 13 Nov 2024 16:16:36 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, linuxarm@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <ZzTQ5Dn8ckIJjxc-@google.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=smostafa@google.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: pO/dxrLdtwST

Hi Shameer,

On Fri, Nov 08, 2024 at 12:52:37PM +0000, Shameer Kolothum via wrote:
> Hi,
> 
> This series adds initial support for a user-creatable "arm-smmuv3-nested"
> device to Qemu. At present the Qemu ARM SMMUv3 emulation is per machine
> and cannot support multiple SMMUv3s.
> 

I had a quick look at the SMMUv3 files, as now SMMUv3 supports nested
translation emulation, would it make sense to rename this? As AFAIU,
this is about virt (stage-1) SMMUv3 that is emulated to a guest.
Including vSMMU or virt would help distinguish the code, as now
some new function as smmu_nested_realize() looks confusing.

Thanks,
Mostafa

> In order to support vfio-pci dev assignment with vSMMUv3, the physical
> SMMUv3 has to be configured in nested mode. Having a pluggable
> "arm-smmuv3-nested" device enables us to have multiple vSMMUv3 for Guests
> running on a host with multiple physical SMMUv3s. A few benefits of doing
> this are,
> 
> 1. Avoid invalidation broadcast or lookup in case devices are behind
>    multiple phys SMMUv3s.
> 2. Makes it easy to handle phys SMMUv3s that differ in features.
> 3. Easy to handle future requirements such as vCMDQ support.
> 
> This is based on discussions/suggestions received for a previous RFC by
> Nicolin here[0].
> 
> This series includes,
>  -Adds support for "arm-smmuv3-nested" device. At present only virt is
>   supported and is using _plug_cb() callback to hook the sysbus mem
>   and irq (Not sure this has any negative repercussions). Patch #3.
>  -Provides a way to associate a pci-bus(pxb-pcie) to the above device.
>   Patch #3.
>  -The last patch is adding RMR support for MSI doorbell handling. Patch #5.
>   This may change in future[1].
> 
> This RFC is for initial discussion/test purposes only and includes patches
> that are only relevant for adding the "arm-smmuv3-nested" support. For the
> complete branch please find,
> https://github.com/hisilicon/qemu/tree/private-smmuv3-nested-dev-rfc-v1
> 
> Few ToDos to note,
> 1. At present default-bus-bypass-iommu=on should be set when
>    arm-smmuv3-nested dev is specified. Otherwise you may get an IORT
>    related boot error.  Requires fixing.
> 2. Hot adding a device is not working at the moment. Looks like pcihp irq issue.
>    Could be a bug in IORT id mappings.
> 3. The above branch doesn't support vSVA yet.
> 
> Hopefully this is helpful in taking the discussion forward. Please take a
> look and let me know.
> 
> How to use it(Eg:):
> 
> On a HiSilicon platform that has multiple physical SMMUv3s, the ACC ZIP VF
> devices and HNS VF devices are behind different SMMUv3s. So for a Guest,
> specify two smmuv3-nested devices each behind a pxb-pcie as below,
> 
> ./qemu-system-aarch64 -machine virt,gic-version=3,default-bus-bypass-iommu=on \
> -enable-kvm -cpu host -m 4G -smp cpus=8,maxcpus=8 \
> -object iommufd,id=iommufd0 \
> -bios QEMU_EFI.fd \
> -kernel Image \
> -device virtio-blk-device,drive=fs \
> -drive if=none,file=rootfs.qcow2,id=fs \
> -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
> -device arm-smmuv3-nested,id=smmuv1,pci-bus=pcie.1 \
> -device vfio-pci,host=0000:7d:02.1,bus=pcie.port1,iommufd=iommufd0 \
> -device pxb-pcie,id=pcie.2,bus_nr=16,bus=pcie.0 \
> -device pcie-root-port,id=pcie.port2,bus=pcie.2,chassis=2 \
> -device arm-smmuv3-nested,id=smmuv2,pci-bus=pcie.2 \
> -device vfio-pci,host=0000:75:00.1,bus=pcie.port2,iommufd=iommufd0 \
> -append "rdinit=init console=ttyAMA0 root=/dev/vda2 rw earlycon=pl011,0x9000000" \
> -device virtio-9p-pci,fsdev=p9fs2,mount_tag=p9,bus=pcie.0 \
> -fsdev local,id=p9fs2,path=p9root,security_model=mapped \
> -net none \
> -nographic
> 
> Guest will boot with two SMMuv3s,
> [    1.608130] arm-smmu-v3 arm-smmu-v3.0.auto: option mask 0x0
> [    1.609655] arm-smmu-v3 arm-smmu-v3.0.auto: ias 48-bit, oas 48-bit (features 0x00020b25)
> [    1.612475] arm-smmu-v3 arm-smmu-v3.0.auto: allocated 65536 entries for cmdq
> [    1.614444] arm-smmu-v3 arm-smmu-v3.0.auto: allocated 32768 entries for evtq
> [    1.617451] arm-smmu-v3 arm-smmu-v3.1.auto: option mask 0x0
> [    1.618842] arm-smmu-v3 arm-smmu-v3.1.auto: ias 48-bit, oas 48-bit (features 0x00020b25)
> [    1.621366] arm-smmu-v3 arm-smmu-v3.1.auto: allocated 65536 entries for cmdq
> [    1.623225] arm-smmu-v3 arm-smmu-v3.1.auto: allocated 32768 entries for evtq
> 
> With a pci topology like below,
> [root@localhost ~]# lspci -tv
> -+-[0000:00]-+-00.0  Red Hat, Inc. QEMU PCIe Host bridge
>  |           +-01.0  Red Hat, Inc. QEMU PCIe Expander bridge
>  |           +-02.0  Red Hat, Inc. QEMU PCIe Expander bridge
>  |           \-03.0  Virtio: Virtio filesystem
>  +-[0000:08]---00.0-[09]----00.0  Huawei Technologies Co., Ltd. HNS Network Controller (Virtual Function)
>  \-[0000:10]---00.0-[11]----00.0  Huawei Technologies Co., Ltd. HiSilicon ZIP Engine(Virtual Function)
> [root@localhost ~]#
> 
> And if you want to add another HNS VF, it should be added to the same SMMUv3
> as of the first HNS dev,
> 
> -device pcie-root-port,id=pcie.port3,bus=pcie.1,chassis=3 \
> -device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0 \
> 
> [root@localhost ~]# lspci -tv
> -+-[0000:00]-+-00.0  Red Hat, Inc. QEMU PCIe Host bridge
>  |           +-01.0  Red Hat, Inc. QEMU PCIe Expander bridge
>  |           +-02.0  Red Hat, Inc. QEMU PCIe Expander bridge
>  |           \-03.0  Virtio: Virtio filesystem
>  +-[0000:08]-+-00.0-[09]----00.0  Huawei Technologies Co., Ltd. HNS Network Controller (Virtual Function)
>  |           \-01.0-[0a]----00.0  Huawei Technologies Co., Ltd. HNS Network Controller (Virtual Function)
>  \-[0000:10]---00.0-[11]----00.0  Huawei Technologies Co., Ltd. HiSilicon ZIP Engine(Virtual Function)
> [root@localhost ~]#
> 
> Attempt to add the HNS VF to a different SMMUv3 will result in,
> 
> -device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0: Unable to attach viommu
> -device vfio-pci,host=0000:7d:02.2,bus=pcie.port3,iommufd=iommufd0: vfio 0000:7d:02.2:
>    Failed to set iommu_device: [iommufd=29] error attach 0000:7d:02.2 (38) to id=11: Invalid argument
> 
> At present Qemu is not doing any extra validation other than the above
> failure to make sure the user configuration is correct or not. The
> assumption is libvirt will take care of this.
> 
> Thanks,
> Shameer
> [0] https://lore.kernel.org/qemu-devel/cover.1719361174.git.nicolinc@nvidia.com/
> [1] https://lore.kernel.org/linux-iommu/ZrVN05VylFq8lK4q@Asurada-Nvidia/
> 
> Eric Auger (1):
>   hw/arm/virt-acpi-build: Add IORT RMR regions to handle MSI nested
>     binding
> 
> Nicolin Chen (2):
>   hw/arm/virt: Add an SMMU_IO_LEN macro
>   hw/arm/virt-acpi-build: Build IORT with multiple SMMU nodes
> 
> Shameer Kolothum (2):
>   hw/arm/smmuv3: Add initial support for SMMUv3 Nested device
>   hw/arm/smmuv3: Associate a pci bus with a SMMUv3 Nested device
> 
>  hw/arm/smmuv3.c          |  61 ++++++++++++++++++++++
>  hw/arm/virt-acpi-build.c | 109 ++++++++++++++++++++++++++++++++-------
>  hw/arm/virt.c            |  33 ++++++++++--
>  hw/core/sysbus-fdt.c     |   1 +
>  include/hw/arm/smmuv3.h  |  17 ++++++
>  include/hw/arm/virt.h    |  15 ++++++
>  6 files changed, 215 insertions(+), 21 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
