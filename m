Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp7170185lff;
        Wed, 15 Jan 2020 08:55:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqzovafjiRg5FzKOd8CuYLa0PuLm42oGvRFN0RFYytqH8by+nN3dlj5lbKiTNjuY4ILMwRJp
X-Received: by 2002:a50:d69a:: with SMTP id r26mr30643187edi.148.1579107358957;
        Wed, 15 Jan 2020 08:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579107358; cv=none;
        d=google.com; s=arc-20160816;
        b=RPBAVraxZzSS2tU9hWphp+ri/6ZR4oPtAO+DFWe9Az0aAbh9IFkANMNfXgCnAwKOGm
         7TJGqK9te9tj4vaJ8DBjHv4QYQ/BaIGXe6Es90whH1MhBfMYRXsqB38ObWZ+2JjXXKQm
         2RSrJT/albEjtNuD0MxGoBjR5rCVBSUsc2JoyVwnW80faHj6/TIhpgypNe6bL5BdhKfC
         +QMVUSOutxV9rb/7z26qDE85ixF+AlrH5C8zo+BTHB99+MdskwLuXPjeoUvrCu/x5ETZ
         3uLUphNrI7ZTsD31feP37uwkFuw8Ydya51xognRC/GmD8XclnHn6VWQrOYKm0Ek1B8dD
         4vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=t/wTDE4jdWS9FgI/GkDaABI42NAxsjSjCDyfRGFLSfc=;
        b=VlzvZhy19SKcwCIVeoLw4aAYjCNGs3PVjWyNBEi18dVbt6+jUxn1SCgILRtYp6hTIa
         np6/reT62ESKIQlHWUp2M4xI6SfAgu/Qy1CfJhUuCEPBumYPeBNGnbmkdbpqrpOtsA4K
         3fD9nTI60mAXnr+s0ip10z/Ys35UtctbFGaLHYYwMBVeVSDcJ//YXveVYbk5PTZcbVo0
         k4SoEe3Ap4pE2TaTAPu4FKx4/WYy/0JhTCHq88sU1k9DCKnqBc+hkAzUAZ1K3+9J23Hb
         wat+Lb84CPQWUm1hcdPcMOVFHL+fB+q8/EnJO2N+8ae44iV3VvJFlJkB6d8vwFloWYZh
         7vbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ha8ELRZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si12517807edn.314.2020.01.15.08.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2020 08:55:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ha8ELRZG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irlxV-00026f-Lg
	for alex.bennee@linaro.org; Wed, 15 Jan 2020 11:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39532)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1irlxH-00020F-FJ
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 11:55:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1irlxC-0005Jh-UE
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 11:55:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54257
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1irlxC-0005J2-Qh
 for qemu-arm@nongnu.org; Wed, 15 Jan 2020 11:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579107338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/wTDE4jdWS9FgI/GkDaABI42NAxsjSjCDyfRGFLSfc=;
 b=Ha8ELRZGtzcouE68kOTzp3wSTOYSR3wm9jicn3YbGMQqB0PJKSH7hb+DwKoG7brgmrOQ2m
 oPt4kC68IX33LOPCVOUNzGzSX/aucqXxG+IQw2cSABuMtifmPMluWZTDh4tRtE30EiJQ3w
 R9D+Sl78632F/Tq7rIzuTjzONDpB0TA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-w0KvfzskN1SbxspMeXOpvg-1; Wed, 15 Jan 2020 11:55:32 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 210762F2E;
 Wed, 15 Jan 2020 16:55:31 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6060C811E0;
 Wed, 15 Jan 2020 16:55:23 +0000 (UTC)
Subject: Re: [PATCH v12 05/13] virtio-iommu: Endpoint and domains structs and
 helpers
To: Peter Xu <peterx@redhat.com>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-6-eric.auger@redhat.com>
 <20200113202301.GD201624@xz-x1>
 <51267d84-c805-a4a1-8084-b278721a5b3f@redhat.com>
 <20200114180734.GB225163@xz-x1>
 <f3da181d-094b-a647-31ea-bdb47eab5c1b@redhat.com>
 <20200115145949.GC233443@xz-x1>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fefed4d1-9397-2e7a-703c-5571081019be@redhat.com>
Date: Wed, 15 Jan 2020 17:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200115145949.GC233443@xz-x1>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: w0KvfzskN1SbxspMeXOpvg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 jean-philippe@linaro.org, quintela@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 mst@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bmxufSDBN5eE

Hi Peter,

On 1/15/20 3:59 PM, Peter Xu wrote:
> On Wed, Jan 15, 2020 at 02:00:22PM +0100, Auger Eric wrote:
>> Hi Peter,
>>
>>
>> On 1/14/20 7:07 PM, Peter Xu wrote:
>>> On Tue, Jan 14, 2020 at 09:51:59AM +0100, Auger Eric wrote:
>>>> Hi Peter,
>>>
>>> Hi, Eric,
>>>
>>> [...]
>>>
>>>>>
>>>>>> +{
>>>>>> +    VirtIOIOMMUEndpoint *ep;
>>>>>> +
>>>>>> +    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
>>>>>> +    if (ep) {
>>>>>> +        return ep;
>>>>>> +    }
>>>>>> +    if (!virtio_iommu_mr(s, ep_id)) {
>>>>>
>>>>> Could I ask when this will trigger?
>>>>
>>>> This can happen when a device is attached to a domain and its RID does
>>>> not correspond to one of the devices protected by the iommu.
>>
>>>
>>> So will it happen only because of a kernel driver bug?
>>
>> Yes, at the moment, because virtio_iommu_mr() only gets called on device
>> attach to a domain.
>>
>> The spec says:
>> "If the endpoint identified by endpoint doesn=E2=80=99t exist, the devic=
e MUST
>> reject the request and set status to VIRTIO_IOMMU_S_NOENT"
>=20
> Sure.  I just wanted to make sure I didn't miss anything, because I
> really can't see when this extra logic can help, say, right now we
> only have one vIOMMU at least for VT-d, so all devices will be managed
> by that.  But yeah if that's explicitly mentioned in the spec, I'd
> agree we should follow that.
>=20
>>>
>>> Also, I think the name of "virtio_iommu_mr" is confusing on that it
>>> returned explicitly a MemoryRegion however it's never been used:
>>
>> I use the same prototype as for smmu_iommu_mr(). Returning the iommu mr
>> will allow to proceed with further RID based operations like invalidatio=
ns.
>>
>> The same logic is used in vtd_context_device_invalidate.
>=20
> I'm fine with this.  Let's keep virtio_iommu_mr() as you prefer.
>=20
> Another thing I'd like to mention is that, I don't think "the same
> logic is used in VT-d" matters much. If we think something is wrong
> (even if it's the same in VT-d), why not we fix both? :-)
Sure ;-)

Thank you for your time

Eric
>=20
> Thanks,
>=20
>>
>>
>>>
>>> (since they're not in the same patch I'm pasting)
>>>
>>> static IOMMUMemoryRegion *virtio_iommu_mr(VirtIOIOMMU *s, uint32_t sid)
>>> {
>>>     uint8_t bus_n, devfn;
>>>     IOMMUPciBus *iommu_pci_bus;
>>>     IOMMUDevice *dev;
>>>
>>>     bus_n =3D PCI_BUS_NUM(sid);
>>>     iommu_pci_bus =3D iommu_find_iommu_pcibus(s, bus_n);
>>>     if (iommu_pci_bus) {
>>>         devfn =3D sid & 0xFF;
>>>         dev =3D iommu_pci_bus->pbdev[devfn];
>>>         if (dev) {
>>>             return &dev->iommu_mr;
>>>         }
>>>     }
>>>     return NULL;
>>> }
>>>
>>> Maybe "return !!dev" would be enough, then make the return a boolean?
>>> Then we can rename it to virtio_iommu_has_device().
>>>
>>> PS. I think we can also drop IOMMU_PCI_DEVFN_MAX (after all you even
>>> didn't use it here!) and use PCI_DEVFN_MAX, and replace 0xFF.
>> well intel iommu and smmu use a similar constant (PCI_DEVFN_MAX,
>> SMMU_PCI_DEVFN_MAX resp.). I use it in virtio_iommu_find_add_as
>=20

