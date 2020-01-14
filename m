Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5839426lff;
        Tue, 14 Jan 2020 10:07:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqzxHSwjf8jSSg8FQJKWeZ0sU/oCbvhdIfMqbPdMSvzlPVDDrOotsuffdiGJwROzcpyluNiv
X-Received: by 2002:a17:906:c44a:: with SMTP id ck10mr23895806ejb.149.1579025276025;
        Tue, 14 Jan 2020 10:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579025276; cv=none;
        d=google.com; s=arc-20160816;
        b=T84eT1b+aETCPHIjazUZKTpN7AmZe+WMA8SiXm4dcN5h5W0OH7TIigXq1y+EnNn7q5
         NgqP4u90st+ibPBgxOD474siOoMn+hehKfkgi+VOHLg2ozGImTHy9EbXVVLm8eYwfIxU
         O/r3T97EwQessR+aIKogUeFzGuYHY11mqC+eHqv4LvN7bg1oSgxeqiOwbvoFqDGHGF4D
         JxyYgEsWW68h5QvxXwqZl5+lW4U6K70LUG9MFq70zMl5TxqxB04XeJ0UZTSdZWKXi656
         vOm8kgSmPfNc6YiJHg35o8+0e0eQi46ePD4l6UER+l5KbpyXag2Bk+DQn5cP+1zrxdc0
         jnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=b0D2Zk5nViE/KJPekemIqHSmsw4Q4A+PCozkh7KIb4M=;
        b=Uwgd44n9lm96ODaPslMDuti4+bxX0qTa/4Miq1l9uBudTfvuG1xweOn4HQHnF47xJB
         MP78Ym2B8rneE6mHFzIZD8wH4wI1xa8KilU9Ij+LJbJiKKzyZnLCl/NJlpKg1aDTXb0w
         8dKAJPuaz3JqnklIyB81ExR6KlbCl6aiVTs7pmJZKEcISMyheX2p+NMgpOwR6gh8xMb/
         BWcsSoRBTVzeFVIruB0jAgmNtMwmhQoV4uAFwx1DJbC5Fw7soB/uFT5ocu9B0dQmzEPy
         KFmjq1F7yFWbDKYbKU4aiy1HijvdRbqeeFVfqfookbEAFDaQgt6NMgZiXXzwn9yqvhbr
         u9Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRgtXsAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y22si9987549edr.209.2020.01.14.10.07.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 10:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=BRgtXsAD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irQba-0004nN-Uv
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 13:07:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1irQbQ-0004n0-Ka
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:07:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1irQbN-0000Ya-L0
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:07:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53887
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1irQbN-0000Y7-HK
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 13:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579025260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b0D2Zk5nViE/KJPekemIqHSmsw4Q4A+PCozkh7KIb4M=;
 b=BRgtXsADLeywyRw1sYaaycYUFtoAvFmNsdjfsL89ubnGYqjkw0R99/U3u9RyncNeD69NnC
 d1u4o8GFC+TvlJLZFj70pAe/7F3XOw3a0ICyYDIIyR2wRm0DDBbCKmXT3uUG1zIFjH8kbU
 /bjoSG4E+42ueulQIX2mgrZQ0ctgo4s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-qBb4C0QRO0Keo45mwo4iNA-1; Tue, 14 Jan 2020 13:07:37 -0500
Received: by mail-qt1-f197.google.com with SMTP id d9so9464906qtq.13
 for <qemu-arm@nongnu.org>; Tue, 14 Jan 2020 10:07:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7kAoMg/jig+jnyuJ7iufD/gl40iBEov1qz8zo/twzMg=;
 b=W7WMR8wHvcu7G+yfli+dHBPIXA274Xylwlupg4tXbmPE33bgGDX4meQ1cTc9Aztxg2
 ioxidPblY5VvvRnHxIm7XtfELqAVg8Tce7l2aoZzlT3czMjcDvcKDPD/YKAD92uF7o/B
 EvyO8fdUI7AzmjlT+Qn9KpwDrUmWaShTDRvvfqAE9nqLbiZlpc6BSVdwo1jE3JEOVilL
 6PT+tUKz49f/N7OAvpm4KctLl6ZPkyq37BKAnmgCAJtJCYXor4M9u3nqAaX3IRlk41GE
 3J3U1WKTcSPQJ2rNJvz+CxcZCHurylelP027VfUhiB+GSQTlE6aShxKa+7WeFV1x7P58
 P0Wg==
X-Gm-Message-State: APjAAAVuzKMD42P9yv4g/woZJtx9CeKQDvdG1SMUE4DR+Pd1plFAIHAJ
 B+8nT2BUhzUSg8cTHMI3FGybU+cbFwkaa32YecJrPE1rIKoORQrvRl1FB9X7G+5R0ZQTr6zRSCv
 IBRgRwdXvV2i/
X-Received: by 2002:ac8:148b:: with SMTP id l11mr4828839qtj.390.1579025256699; 
 Tue, 14 Jan 2020 10:07:36 -0800 (PST)
X-Received: by 2002:ac8:148b:: with SMTP id l11mr4828815qtj.390.1579025256485; 
 Tue, 14 Jan 2020 10:07:36 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id d71sm7078517qkg.4.2020.01.14.10.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 10:07:35 -0800 (PST)
Date: Tue, 14 Jan 2020 13:07:34 -0500
From: Peter Xu <peterx@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v12 05/13] virtio-iommu: Endpoint and domains structs and
 helpers
Message-ID: <20200114180734.GB225163@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-6-eric.auger@redhat.com>
 <20200113202301.GD201624@xz-x1>
 <51267d84-c805-a4a1-8084-b278721a5b3f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <51267d84-c805-a4a1-8084-b278721a5b3f@redhat.com>
X-MC-Unique: qBb4C0QRO0Keo45mwo4iNA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-TUID: 8tOfJbrwz/pq

On Tue, Jan 14, 2020 at 09:51:59AM +0100, Auger Eric wrote:
> Hi Peter,

Hi, Eric,

[...]

> >=20
> >> +{
> >> +    VirtIOIOMMUEndpoint *ep;
> >> +
> >> +    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(ep_id));
> >> +    if (ep) {
> >> +        return ep;
> >> +    }
> >> +    if (!virtio_iommu_mr(s, ep_id)) {
> >=20
> > Could I ask when this will trigger?
>=20
> This can happen when a device is attached to a domain and its RID does
> not correspond to one of the devices protected by the iommu.

So will it happen only because of a kernel driver bug?

Also, I think the name of "virtio_iommu_mr" is confusing on that it
returned explicitly a MemoryRegion however it's never been used:

(since they're not in the same patch I'm pasting)

static IOMMUMemoryRegion *virtio_iommu_mr(VirtIOIOMMU *s, uint32_t sid)
{
    uint8_t bus_n, devfn;
    IOMMUPciBus *iommu_pci_bus;
    IOMMUDevice *dev;

    bus_n =3D PCI_BUS_NUM(sid);
    iommu_pci_bus =3D iommu_find_iommu_pcibus(s, bus_n);
    if (iommu_pci_bus) {
        devfn =3D sid & 0xFF;
        dev =3D iommu_pci_bus->pbdev[devfn];
        if (dev) {
            return &dev->iommu_mr;
        }
    }
    return NULL;
}

Maybe "return !!dev" would be enough, then make the return a boolean?
Then we can rename it to virtio_iommu_has_device().

PS. I think we can also drop IOMMU_PCI_DEVFN_MAX (after all you even
didn't use it here!) and use PCI_DEVFN_MAX, and replace 0xFF.

Thanks,

--=20
Peter Xu

