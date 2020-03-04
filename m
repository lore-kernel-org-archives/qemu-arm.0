Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1819966lfi;
        Wed, 4 Mar 2020 08:47:56 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvyPknUk0B9wZq6AWunFjy87aWjcHQ3qSq/gypGgQF4vjHhMdRGFCOT5CeVS+Zl2vrXXa4c
X-Received: by 2002:ac8:13c1:: with SMTP id i1mr3268759qtj.115.1583340475859;
        Wed, 04 Mar 2020 08:47:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583340475; cv=none;
        d=google.com; s=arc-20160816;
        b=gwNHCTxo4kNXDtFSLj15VNfAfGtarmUGhtKhW6rVNTGjZ2G/gZMNWYF+GJm7SN8Ev+
         pFKUOwEZAmady2to31ljo+cIh8RoEZOL/u8Mu2M6l0cKF2P2TpP4Dyd3THwLjZ5dnwFW
         QyHj9SnOy54yk1S9APubI+1vAe071o3zqtSTvcdmO0RgzEAuYbCyoqRs10mSK+xBsctU
         P9ir88fOXtUB0zf6GMfAA17xulVmk0KRdJTwgfHs2SpVqOWIPExdm4e3ZtyW4XlsnTUl
         lTPLkz+/T7SWOaOzZyELmpRQcRmS9ZC6BtNEX5f5f9YianFp6wep9Jt51d3V5Awn47J1
         q+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=yjMcTrrPUqGAVqCDBmURXzvZ/ldll76NPxiriK8Dd38=;
        b=TLL832RxGmLcTuzHqW3LXr6ZWF5AjKx+b7zKDtDs+lN09qEmO0ilV+lpuH5RHcazDe
         5j/q6WRX3bWY+njwAgxIA2Ca63xhjj2z3q4nshfUZ7f8FKpnwUyZLqEPpGn0zIQ0+xnP
         kDLh7EDUVZ4vxEI2dpoOAHt6sZixgzCgSha1KDuWTcIv4/UsZP+qRLhSVJY2n0HmQC9Z
         uGl0PtfrkCPy+2xqX/ss58raapl4lDgomi66OQXwDHbh6WM3evq0iJcfoh/xwRYCf2J4
         kSkEW8OmTwT+4pRRT/hX6sW2nLDzV0vBJ+I1l744mmgWlYCxUPI1K0SpRYxd8RzY36a+
         ugPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gA5qSsP0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21si1198179qtw.225.2020.03.04.08.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 08:47:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=gA5qSsP0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9XBb-0007z7-6N
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 11:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1j9XBA-0007vS-7m
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 11:47:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1j9XB8-0004r2-Ev
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 11:47:27 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45842)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1j9XB8-0004oa-6w
 for qemu-devel@nongnu.org; Wed, 04 Mar 2020 11:47:26 -0500
Received: by mail-wr1-x443.google.com with SMTP id v2so3222538wrp.12
 for <qemu-devel@nongnu.org>; Wed, 04 Mar 2020 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yjMcTrrPUqGAVqCDBmURXzvZ/ldll76NPxiriK8Dd38=;
 b=gA5qSsP0ywWfbYjZfFa2WdFmoqSn8BNUZcWhHi7pLeIDOijzidX8MYJLymWpb3ixar
 y+i1oRxMbR9s+qMlBc7Wm6IHNbZa2o+q6m20IySvhBevqFiTORjDVpR+9pXdJvjiCjIB
 nsKAmQsoer+2ajQfw/k4q4NZgnm1P7ReQXPjJshawH39fhqOI+LtQa8JJmmNP9a1jaeg
 mVEZgNpwMcGNtKSziy5LCfwk47Ks1hx3xaF3Qh1nMLAZUmTdogCOB8IIZVuaLONWa3oJ
 kK8p5K0l19gZeNcAl3W81ax6ysRvieAuz7Iy4OtqbMLPkvijFD7TciHx4Hy8o6gIWn+j
 1eHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yjMcTrrPUqGAVqCDBmURXzvZ/ldll76NPxiriK8Dd38=;
 b=MQZvAQ/W28pG2ETk1/2+YgGdOFeBzPm/h/jK2Q27VjTRJPAsopI6VNudNV+lCXpLyE
 dVPVTNyLtcV3K2Gl2AHPPL2S6jct3ti/qVmk9Q/EgA7P7TgobSzhEQzubLsX7DiufJlC
 NHmGklGTm9BavqzkBM3q0Q3sx7u2X9PmqbhZBBexEYPOVler9GQHklsHKRItpK2QPXs/
 hXLlsya6/djC1xdZobZ8udJtfiam6213dnZBbfrV3i5T0QNM+bLt2PfEqjG9PYCbNW/c
 VxqqWOOx5uaWxzmG2cvdRBoVeI19yffjvFym70Mnv3hiuUuki3FOXBu9k4PDBx6Esd/e
 WomA==
X-Gm-Message-State: ANhLgQ2botNzz4WwC+6lArZTLazWRTiVgPxzdf9I7V08dHLOe2K8m542
 Hy/5hBOpeYqdSriAgSV5rJla2w==
X-Received: by 2002:a5d:4b11:: with SMTP id v17mr4730192wrq.375.1583340444352; 
 Wed, 04 Mar 2020 08:47:24 -0800 (PST)
Received: from myrica ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id c4sm5077334wml.7.2020.03.04.08.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 08:47:23 -0800 (PST)
Date: Wed, 4 Mar 2020 17:47:17 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v16 00/10] VIRTIO-IOMMU device
Message-ID: <20200304164717.GF646000@myrica>
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <20200227111717.GG1645630@redhat.com>
 <431cb39d-833c-6d02-d7b3-02b3e90446e2@redhat.com>
 <CAMj5Bkib3CTzCB02ScueFR84r28LGowF7uxYO8Ygmnj9X7oNOg@mail.gmail.com>
 <fea625f1-b58e-6da6-8e2a-f32fc9391fc8@redhat.com>
 <CAMj5Bkgm1LKbN3E2qTTxmrGhpmdL9NWarSfX-mYCWF0yt5E9eg@mail.gmail.com>
 <88e3b669-2998-41c0-83f7-de42a72a73e7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88e3b669-2998-41c0-83f7-de42a72a73e7@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, kevin.tian@intel.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 kenneth-lee-2012@foxmail.com, tnowicki@marvell.com,
 "Michael S. Tsirkin" <mst@redhat.com>, quintela@redhat.com,
 zhangfei.gao@foxmail.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 "Wangzhou \(B\)" <wangzhou1@hisilicon.com>,
 Zhangfei Gao <zhangfei.gao@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Eneeprmrymel

On Wed, Mar 04, 2020 at 09:41:44AM +0100, Auger Eric wrote:
> >>> Could I ask one question?
> >>> To support vSVA and pasid in guest, which direction you recommend,
> >>> virtio-iommu or vSMMU (your nested paging)
> >>>
> >>> Do we still have any obstacles?
> >> you can ask the question but not sure I can answer ;-)
> >>
> >> 1) SMMUv3 2stage implementation is blocked by Will at kernel level.
> >>
> >> Despite this situation I may/can respin as Marvell said they were
> >> interested in this effort.

Do you know if they want vSVA as well or only nested translation?

> >> If you are also interested in (I know you
> >> tested it several times and I am grateful to you for that), please reply
> >> to:
> >> [PATCH v9 00/14] SMMUv3 Nested Stage Setup (IOMMU part)
> >> (https://patchwork.kernel.org/cover/11039871/) and say you are
> >> interested in that work so that maintainers are aware there are
> >> potential users.
> >>
> >> At the moment I have not supported multiple CDs because it introduced
> >> other dependencies.
> >>
> >> 2) virtio-iommu
> >>
> >> So only virtio-iommu dt boot on machvirt is currently supported. For non
> >> DT, Jean respinned his kernel series
> >> "[PATCH v2 0/3] virtio-iommu on x86 and non-devicetree platforms" as you
> >> may know. However non DT integration still is controversial. Michael is
> >> pushing for putting the binding info the PCI config space. Joerg
> >> yesterday challenged this solution and said he would prefer ACPI
> >> integration. ACPI support depends on ACPI spec update & vote anyway.
> >>
> >> To support PASID at virtio-iommu level you also need virtio-iommu API
> >> extensions to be proposed and written + kernel works. So that's a long
> >> road. I will let Jean-Philippe comment on that.

Yeah, let's put that stuff on hold. vSVA with virtio-iommu requires about
the same amount of work in the host kernel as vSMMU, minus the NESTED_MSI
stuff. The device implementation would be simpler, but the guest driver is
difficult (I'd need to extract the CD table code from the SMMU driver
again). And obtaining better performance than vSMMU would then require
upstreaming vhost-iommu. I do have incomplete drafts and prototypes but
I'll put them aside until users (other than hardware validation) show up
and actually need performance or things like unpinned stage-2.

> >> I would just say that Intel is working on nested paging solution with
> >> their emulated intel-iommu. We can help them getting that upstream and
> >> partly benefit from this work.
> >>
> >>> Would you mind give some breakdown.
> >>> Jean mentioned PASID still not supported in QEMU.
> >> Do you mean support of multiple CDs in the emulated SMMU? That's a thing
> >> I could implement quite easily. What is more tricky is how to test it.
> > 
> > Thanks Eric
> > 
> > Discussed with Jean before, here are some obstacles for vSVA via nested paging.
> > Do you think they are still big issues?
> > 
> > Copy "
> > * PASID support in QEMU, I don't think there is anything yet
> > // this is not a big issue as your comments.
> > 
> > * Page response support in VFIO and QEMU. With Eric's series we can
> > inject recoverable faults into the guest, but there is no channel for
> > the guest to RESUME the stall after fixing it.
> I guess this matches a command sent through the SMMUv3 command queue
> (CMD_PRI_RESP) that should be trapped by QEMU and injected to the
> physical SMMU, right?
> 
> I think everybody misses that injection path and that's not specific to
> virtio-iommu. PRS is not currently addressed by in-flight Intel's kernel
> series ([PATCH V9 00/10] Nested Shared Virtual Address (SVA) VT-d
> support) either.
> 
> I think the topic is complex enough to separate the concerns and try to
> move forward in incremental steps hence my efforts to push for simple
> nested use case. Can't you support vSVA without PRS first (I think this
> Intel's strategy too)

Not really, for sharing guest process address spaces you need I/O page
faults. You can test PASID alone without PRI by using auxiliary domains in
the guest, so I'd advise to start with that, but it requires modifications
to the device driver.

> > 
> > * We can't use DVM in nested mode unless the VMID is shared with the
> > CPU. For that we'll need the host SMMU driver to hook into the KVM VMID
> > allocator, just like we do for the ASID allocator. I haven't yet
> > investigated how to do that. It's possible to do vSVA without DVM
> > though, by sending all TLB invalidations through the SMMU command queue.
> > "

Hm we're already mandating DVM for host SVA, so I'd say mandate it for
vSVA as well. We'd avoid a ton of context switches, especially for the zip
accelerator which doesn't require ATC invalidations. The host needs to pin
the VMID allocated by KVM and write it in the endpoint's STE.

Thanks,
Jean

> OK.
> 
> From the above arguments I am not sure there are technical blockers with
> nested paging implementation. For sure there are things that are not
> supported, because I did not address this topic yet.
> 
> If I were to work on this, you did not answer bout the testing feasibility.
> 
> Thanks
> 
> Eric
> > 
> > Thanks
> > 
> 
