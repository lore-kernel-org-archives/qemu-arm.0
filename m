Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp326207wrv;
        Wed, 10 Jul 2019 23:18:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweh4vzAbiiF1eYh6/mbivugx3gKna3CuGG3uAW0TOMlO9KwIZ/+tgGWG7a64SLErhOaN+e
X-Received: by 2002:a50:fa42:: with SMTP id c2mr1792817edq.48.1562825936663;
        Wed, 10 Jul 2019 23:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562825936; cv=none;
        d=google.com; s=arc-20160816;
        b=usAmUdNAs+vx36BsZ6dNs/obNR9zm2gr8WCHMNUlVgb3S+dnw6r9IcZDrEwBvYMdKi
         oi1toXjcQNSqDKFUG8D8S47GfQdAXAntzGxTobHvlFwt+oujk/tKtVNEuK/fDbD4seJb
         z84mnkM6qzst1okl/NZD0tLcmxdE4w+Jp4kn9aJm864LWyO/iHGf9g3CKWwElxqP3V+/
         VW4T13i2+FiYTV2coz0WBV4SMhdcBc9mjicYKkokC9L1q+Odv2xtR9V0hVDWa7PcXwSM
         JhVAVWTCN4egoWTolV48e69EcvPsEy1Zimd/y0oeSMtAk9lEhhq2wO4GdZD6UqE88jF3
         nQvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TJmy5H0e5agOkYhjDUwVG337cCXOuWwtBnZk7RCksfo=;
        b=OZjgCuLuDTtb0W/IogaQv0JhB3j16I2GveOR3j+tXEMI53ZGCeVEW7qkfZamh49dat
         g0FPYwiq/tFShCR/B+gO/gY5AaCJ3tHgd7A56k/czFsL8Lw3kuPZjlZo1Pe+HxFt+YWs
         NnSuyYlFcAA91zmWtdVyx0h+oNDw25uULVT5ZG97Qhw1c/zQw14V4u6R7zgas9jNfaZ9
         qlBDBibVFMAMfZjpkvJ6ciwmp57HZcs+yHoijoLHBiOQyrXPDfNYoLnVH9zoRo6rOVNQ
         8gOlTVe9JJQ52jo8YP6mMuwxpmnBrku4+8avU2rjTBT7fJgh7MCUWkp4s7/ohNs7tJ7k
         9Zjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mHLq3BEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v29si2946204edc.115.2019.07.10.23.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jul 2019 23:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mHLq3BEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlSPv-000500-PK
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 02:18:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41141)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <zhangfei.gao@gmail.com>) id 1hlSPo-0004xi-8e
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhangfei.gao@gmail.com>) id 1hlSPm-00085K-U8
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 02:18:48 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:41093)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zhangfei.gao@gmail.com>)
 id 1hlSPk-0007zT-A4; Thu, 11 Jul 2019 02:18:44 -0400
Received: by mail-io1-xd42.google.com with SMTP id j5so5851439ioj.8;
 Wed, 10 Jul 2019 23:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TJmy5H0e5agOkYhjDUwVG337cCXOuWwtBnZk7RCksfo=;
 b=mHLq3BEwBg/5Va0jmUIkeSxESnS1GVM3LYMcP+gV0aKOO+Oc6RhydfC2Lq9DqxMcU8
 UA0AuK17qrokUD52Bskvngjc0lBCsTVyhO7pPsMMOvRraKpaOMcFfvv8ujWYvqRnQgxW
 GHMQq2Ce3wvxolnw9gCiUg0CTqVF1GZody3qs2RN3oUSM0lGT0hdtUPXGntfOzu0vBCI
 mmjwck+h7EqqVU8b/Q8e8F8VXskgteP2xObO+pHsUyxO20+T3ZRAzKBVoXxV9EZXRa/Y
 pHITaNzvRUeFLEZmw1zUX1JmmXKIHirW/cV2fK15Mfc9zddSZfr/XtZgEA9F6ZJw9NrU
 /U8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TJmy5H0e5agOkYhjDUwVG337cCXOuWwtBnZk7RCksfo=;
 b=uK2BnJaRwCdQ481ve76i9ZMi+gcrHGflQCgUIrbV6leDhp/ytE/w7MXva2CTsSFSkp
 dw9FBTg8DpzZtzEXypuazgseiqriy3AwnnRLTofWO6RcNpS3ncH8h2jz0W8hafD6zYcb
 bWCh5kJhX6bIAadwBuauCCB3qQC/nq8T9VKihQYIEBM40c7YJFijLyWQfM919uHRWh48
 79chNI4psZI8hTk0BxDpDINtp6d6u0K1il77/E6pOnmxVH9Vsq94LCevR99xZdLTjEXF
 houdJquGb0sC2oqOOW61dnUsaN+VAuUKljt5llxc01wpBDxBJF1Frm6QYYJwyOrdY4j8
 KkQQ==
X-Gm-Message-State: APjAAAXrszXEdRLeT73DzzIG3mKsnU+p7xGuMhjZUvp3VRZPIZ5Y1Fef
 CrMujSF9j1WTNzE6x105HNbTjUoiBd44qId+Z1A=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr2497670jah.140.1562825922265; 
 Wed, 10 Jul 2019 23:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190527114203.2762-1-eric.auger@redhat.com>
 <CAMj5BkgsJxKY89hURnf3dp2GE0quLr-NOPtQsYFQjOPEx6=Cqw@mail.gmail.com>
 <63543f88-bdf7-753d-0337-67e7e86f0893@redhat.com>
In-Reply-To: <63543f88-bdf7-753d-0337-67e7e86f0893@redhat.com>
From: Zhangfei Gao <zhangfei.gao@gmail.com>
Date: Thu, 11 Jul 2019 14:18:30 +0800
Message-ID: <CAMj5Bkj+gZkq9vrUMiDWKy3NdX=BNTHS2mL8W0SUWro=zqTyNA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 00/27] vSMMUv3/pSMMUv3 2 stage
 VFIO integration
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
 yi.l.liu@intel.com, "Michael S. Tsirkin" <mst@redhat.com>,
 jean-philippe.brucker@arm.com, zhangfei.gao@foxmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 vincent.stehle@arm.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8P/dXy19J/eo

On Thu, Jul 11, 2019 at 1:55 PM Auger Eric <eric.auger@redhat.com> wrote:
>
> Hi Zhangfei,
>
> On 7/11/19 3:53 AM, Zhangfei Gao wrote:
> > On Mon, May 27, 2019 at 7:44 PM Eric Auger <eric.auger@redhat.com> wrote:
> >>
> >> Up to now vSMMUv3 has not been integrated with VFIO. VFIO
> >> integration requires to program the physical IOMMU consistently
> >> with the guest mappings. However, as opposed to VTD, SMMUv3 has
> >> no "Caching Mode" which allows easy trapping of guest mappings.
> >> This means the vSMMUV3 cannot use the same VFIO integration as VTD.
> >>
> >> However SMMUv3 has 2 translation stages. This was devised with
> >> virtualization use case in mind where stage 1 is "owned" by the
> >> guest whereas the host uses stage 2 for VM isolation.
> >>
> >> This series sets up this nested translation stage. It only works
> >> if there is one physical SMMUv3 used along with QEMU vSMMUv3 (in
> >> other words, it does not work if there is a physical SMMUv2).
> >>
> >> The series uses a new kernel user API [1], still under definition.
> >>
> >> - We force the host to use stage 2 instead of stage 1, when we
> >>   detect a vSMMUV3 is behind a VFIO device. For a VFIO device
> >>   without any virtual IOMMU, we still use stage 1 as many existing
> >>   SMMUs expect this behavior.
> >> - We introduce new IOTLB "config" notifiers, requested to notify
> >>   changes in the config of a given iommu memory region. So now
> >>   we have notifiers for IOTLB changes and config changes.
> >> - vSMMUv3 calls config notifiers when STE (Stream Table Entries)
> >>   are updated by the guest.
> >> - We implement a specific UNMAP notifier that conveys guest
> >>   IOTLB invalidations to the host
> >> - We implement a new MAP notifiers only used for MSI IOVAs so
> >>   that the host can build a nested stage translation for MSI IOVAs
> >> - As the legacy MAP notifier is not called anymore, we must make
> >>   sure stage 2 mappings are set. This is achieved through another
> >>   memory listener.
> >> - Physical SMMUs faults are reported to the guest via en eventfd
> >>   mechanism and reinjected into this latter.
> >>
> >> Note: The first patch is a code cleanup and was sent separately.
> >>
> >> Best Regards
> >>
> >> Eric
> >>
> >> This series can be found at:
> >> https://github.com/eauger/qemu/tree/v4.0.0-2stage-rfcv4
> >>
> >> Compatible with kernel series:
> >> [PATCH v8 00/29] SMMUv3 Nested Stage Setup
> >> (https://lkml.org/lkml/2019/5/26/95)
> >>
> >
> > Have tested vfio mode in qemu on arm64 platform.
> >
> > Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> > qemu: https://github.com/eauger/qemu/tree/v4.0.0-2stage-rfcv4
> > kernel: https://github.com/eauger/linux/tree/v5.2-rc1-2stage-v8
>
> Your testing is really appreciated.
>
> Both kernel and QEMU series will be respinned. I am currently waiting
> for 5.3 kernel window as it will resolve some dependencies on the fault
> reporting APIs. My focus is to get the updated kernel series reviewed
> and tested and then refine the QEMU integration accordingly.
>
Thanks Eric, that's great
Since I found kernel part (drivers/iommu/arm-smmu-v3.c) will be
conflicting with Jean's sva patch.
Especially this one: iommu/smmuv3: Dynamically allocate s1_cfg and s2_cfg

Thanks
