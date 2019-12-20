Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3825404lff;
        Fri, 20 Dec 2019 08:27:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyVsGl/zk7wEXAv5vfSvH2jlxU+dpBhLkrQ2mV2StzTyvsx3A0vJrFVVuhPll953F06Qvm6
X-Received: by 2002:aed:2bc2:: with SMTP id e60mr12703029qtd.115.1576859222292;
        Fri, 20 Dec 2019 08:27:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576859222; cv=none;
        d=google.com; s=arc-20160816;
        b=zl5p4tqJTeYRHdDknUMqW7Ayf6wS6ZkuknPgFsU/vUSC4VQKbiTuwsksdxnbAHREvs
         JtA2UkAn0VDPDilMlYZtSESlfnZ14rdnAtrUNmNbSfy83gQzbgwEU5DHzX6iU7He03Xu
         3XxpsSOHc/Q5rbgkObAFtDToH6i5hM3w/rJP9dTq3HfiA1oRxO74pOlzwtvubhlpbXk5
         s1yzR13RFrI9VCrDfkiuKX59K/dS1sX/2UOvh3RsJNnRcltFU3QkiizXvWXvN4ktap9y
         FRciTyWF8eVceGpkyNVcdHD+xwLB/qf6Ie+f8z2/q5B+oq2TsD+rnbxjyVo453b2Ze28
         yz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=6nefJcLqMROs7pgWhMAAFl5DrgNVFm5Hyez90MlqG6M=;
        b=zKkAoaLHgly0LuYepf9uUiMfisOp2tl0nVW7V32G8DW44SD3hRKhDtFk3hcqU5Uw0B
         l8cEF8pz2L4n8BQkD13eyccwwKCr0qtOHLJjHHElLHUA9oUI3Z/ADFR92xLnQ5IO+7If
         NSyd/VkgqBKn2UqAnwXXv1zHXwiEpf1vTwej2DqH8cr7H+V5ip+LA6dNdW25vB5Pqgr1
         1NAc8QqKLCnV2ZGqoItNYF8ks1wAJhyxT1z9DOLCXjTdv+luWs96uTdO5Gislo8q3trl
         /TKA//gQkVZXrFQdygBuv9xpt/9AbsPAqCAWf2TTKX1ah7JgXjQA9DrsEU1OBPtvTVm2
         XvTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RuCRJ7HV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si1332386qto.344.2019.12.20.08.27.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 08:27:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RuCRJ7HV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiL7F-0000fI-Hs
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 11:27:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1iiL76-0000eZ-Fd
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 11:26:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1iiL74-00029x-IL
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 11:26:52 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36555)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1iiL74-00027a-Bh
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 11:26:50 -0500
Received: by mail-wm1-x343.google.com with SMTP id p17so9850587wma.1
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2019 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6nefJcLqMROs7pgWhMAAFl5DrgNVFm5Hyez90MlqG6M=;
 b=RuCRJ7HVSGtE/esNWSKUp2xkuuQwDFQAzzfIpq/sfMtWT0zmgRpYdBiywv67ju+kX+
 UpuvG2cvlLz6UVtmPZxbDwmu9stIgbfU2wvhAikF0HxgoneswGc/3w7m3ESCcp67x03R
 uPWeM/blvyDxyxN4aPFFaw9qkgAeBEEgk4g14u7TedV90RmFvULmYZX8koKstnEgz+Oi
 hYb8lMbGZdufuGwXfKH7OSKlJomWTt6iH8GeZRlRSJ3nJtzDsHVDUIA+I5Ha5Fko407N
 SuMZvIVqCFP7dSntaXeyH/Kwzm+SL9DS4zZnYxb4b72G3QbKMNerZ7g7fM6IjnzIV+I1
 f9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6nefJcLqMROs7pgWhMAAFl5DrgNVFm5Hyez90MlqG6M=;
 b=h5hTszREmYnJ91F/Zfr5SdBNW8GDn1u7f4UGDCJnicaVgy4s8a26y+tH4BKVB03BHv
 ajrVE2o0BOsr4OuqYXJduxUsQ0+YjCvtcejxdcgvLs8VY76lLgq9esc+UFGHhcSXjTOt
 IUtOnsfvJ1AH6NysUr40P2NpzN8DedBiebe9C63PUID1PB6xlY+uQ4qO5A5NcjOZhVJi
 NxrT0l9q2v7icL86/Db7lPNJBzgp1dfgHi1mFMmcNoBDnaXNvPEFMxX4ky1fkO7Bnhv1
 A/T8WHEv92zvs/6fw7axGdb9OMHpc5/Ea8xrNRCuiR98t7uMkJkaMHpZ4VqpIieCugmp
 aNCQ==
X-Gm-Message-State: APjAAAU82HBluwzfTBuelhlKEqykDJp9b85yAOQuTWPIUM66oPuytnAW
 7ZgMoC4aZXpqWlykzU72+k9elA==
X-Received: by 2002:a1c:3d07:: with SMTP id k7mr18505026wma.79.1576859208456; 
 Fri, 20 Dec 2019 08:26:48 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id g25sm14129132wmh.3.2019.12.20.08.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 08:26:47 -0800 (PST)
Date: Fri, 20 Dec 2019 17:26:42 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Message-ID: <20191220162642.GA2626852@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-9-eric.auger@redhat.com>
 <20191210193342.GJ3352@xz-x1>
 <44c0041d-68ad-796f-16cc-4bab7ba0f164@redhat.com>
 <20191219133308.GA4246@xz-x1>
 <9d58b293-ada0-353e-bba2-ad1f538dfc62@redhat.com>
 <20191219144936.GB50561@xz-x1>
 <9ec9d0d5-062b-f96b-c72c-4d15865ff9a1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ec9d0d5-062b-f96b-c72c-4d15865ff9a1@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZFUEmDkikbU+

On Thu, Dec 19, 2019 at 04:09:47PM +0100, Auger Eric wrote:
> >>>>>> @@ -412,19 +412,80 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >>>>>>                                              int iommu_idx)
> >>>>>>  {
> >>>>>>      IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> >>>>>> +    viommu_interval interval, *mapping_key;
> >>>>>> +    viommu_mapping *mapping_value;
> >>>>>> +    VirtIOIOMMU *s = sdev->viommu;
> >>>>>> +    viommu_endpoint *ep;
> >>>>>> +    bool bypass_allowed;
> >>>>>>      uint32_t sid;
> >>>>>> +    bool found;
> >>>>>> +
> >>>>>> +    interval.low = addr;
> >>>>>> +    interval.high = addr + 1;
> >>>>>>  
> >>>>>>      IOMMUTLBEntry entry = {
> >>>>>>          .target_as = &address_space_memory,
> >>>>>>          .iova = addr,
> >>>>>>          .translated_addr = addr,
> >>>>>> -        .addr_mask = ~(hwaddr)0,
> >>>>>> +        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
> >>>>>>          .perm = IOMMU_NONE,
> >>>>>>      };
> >>>>>>  
> >>>>>> +    bypass_allowed = virtio_has_feature(s->acked_features,
> >>>>>> +                                        VIRTIO_IOMMU_F_BYPASS);
> >>>>>> +
> >>>>>
> >>>>> Would it be easier to check bypass_allowed here once and then drop the
> >>>>> latter [1] and [2] check?
> >>>> bypass_allowed does not mean you systematically bypass. You bypass if
> >>>> the SID is unknown or if the device is not attached to any domain.
> >>>> Otherwise you translate. But maybe I miss your point.
> >>>
> >>> Ah ok, then could I ask how will this VIRTIO_IOMMU_F_BYPASS be used?
> >>> For example, I think VT-d defines passthrough in a totally different
> >>> way in that the PT mark will be stored in the per-device context
> >>> entries, then we can allow a specific device to be pass-through when
> >>> doing DMA.  That information is explicit (e.g., unknown SID will
> >>> always fail the DMA), and per-device.
> >>>
> >>> Here do you mean that you just don't put a device into any domain to
> >>> show it wants to use PT?  Then I'm not sure how do you identify
> >>> whether this is a legal PT or a malicious device (e.g., an unknown
> >>> device that even does not have any driver bound to it, which will also
> >>> satisfy "unknown SID" and "not attached to any domain", iiuc).
> >>
> >> The virtio-iommu spec currently says:
> >>
> >> "If the VIRTIO_IOMMU_F_BYPASS feature is negotiated, all accesses from
> >> unattached endpoints are
> >> allowed and translated by the IOMMU using the identity function. If the
> >> feature is not negotiated, any
> >> memory access from an unattached endpoint fails. Upon attaching an
> >> endpoint in bypass mode to a new
> >> domain, any memory access from the endpoint fails, since the domain does
> >> not contain any mapping.
> >> "
> >>
> >> I guess this can serve the purpose of devices doing early accesses,
> >> before the guest OS gets the hand and maps them?
> > 
> > OK, so there's no global enablement knob for virtio-iommu? Hmm... Then:

There is at the virtio transport level: the driver sets status to
FEATURES_OK once it accepted the feature bits, and to DRIVER_OK once its
fully operational. The virtio-iommu spec says:

  If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
  device SHOULD NOT let endpoints access the guest-physical address space.

So before features negotiation, there is no access. Afterwards it depends
if the VIRTIO_IOMMU_F_BYPASS has been accepted by the driver.

> well this is a global knob. If this is bot negotiated any unmapped
> device can PT.
> 
> My assumption above must be wrong as this is a negotiated feature so
> anyway the virtio-iommu driver should be involved.
> 
> I don't really remember the rationale of the feature bit tbh.

I don't remember writing down a rationale for this bit, it was in the very
first version (I think someone suggested it during the initial internal
discussion) and I didn't remove it afterwards because it seems useful:

Say a guest only wants to use the vIOMMU for userspace assignment and
wants all other endpoints to bypass translation, which is our primary
use-case. In other words booting Linux with iommu.passthrough=1. It can
either create an identity domain for each endpoint (one MAP request with
VA==PA) or it can set the VIRTIO_IOMMU_F_BYPASS bit. The device-side
implementation should be more efficient with the latter, since you don't
need to lookup the domain + address space for each access.

> In "[virtio-dev] RE: [RFC] virtio-iommu version 0.4 " Jean discussed
> that with Kevein. Sorry I cannot find the link.
> 
> " If the endpoint is not attached to any address space,
> then the device MAY abort the transaction."

Hmm, that was regarding a "bypass" reserved memory region, which isn't in
the current spec.

> Kevin> From definition of BYPASS, it's orthogonal to whether there is an
> address space attached, then should we still allow "May abort" behavior?
> 
> Jean> The behavior is left as an implementation choice, and I'm not sure
> it's worth enforcing in the architecture. If the endpoint isn't attached
> to any domain then (unless VIRTIO_IOMMU_F_BYPASS is negotiated), it
> isn't necessarily able to do DMA at all. The virtio-iommu device may
> setup DMA mastering lazily, in which case any DMA transaction would
> abort, or have setup DMA already, in which case the endpoint can access
> MEM_T_BYPASS regions.
> 
> Hopefully Jean will remember and comment on this.
> 
> Thanks
> 
> Eric
> 
> > 
> >   - This flag is a must for all virtio-iommu emulation, right?
> >     (otherwise I can't see how system bootstraps..)

What do you mean by system bootstrap?

One thing I've been wondering, and may be related, is how to handle a
bootloader that wants to read for example an initrd from a virtio-block
device that's behind the IOMMU. Either we allow the device to let any DMA
bypass the device until FEATURES_OK, which is a source of vulnerabilities
[1], or we have to implement some support for the virtio-iommu in the
BIOS. Again the F_BYPASS bit would help for this, since all the BIOS has
to do is set it on boot. However, F_BYPASS is optional, and more complex
support is needed for setting up identity mappings.

[1] See "IOMMU protection against I/O attacks: a vulnerability and a proof
of concept" by Morgan et al, where a malicious device bypassing the IOMMU
overwrites the IOMMU configuration as it is being created by the OS.
Arguably we're not too concerned about malicious devices at the moment,
but I'm not comfortable relaxing this.

> >   - Should this flag be gone right after OS starts (otherwise I think
> >     we still have the issue that any malicious device can be seen as
> >     in PT mode as default)?  How is that done?

Yes bypass mode assumes that devices and drivers aren't malicious, and the
IOMMU is only used for things like assigning devices to guest userspace,
or having large contiguous DMA buffers.

Thanks,
Jean

