Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4559889lff;
        Mon, 13 Jan 2020 11:54:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8KcxdBOG8LVUCKg/v/bWqbsW0TSecLXNLoicXvJWeW3BiNA0sun0Nwahny0JhNj4qWet9
X-Received: by 2002:ac8:3fd7:: with SMTP id v23mr206451qtk.293.1578945248819;
        Mon, 13 Jan 2020 11:54:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578945248; cv=none;
        d=google.com; s=arc-20160816;
        b=L4KQq/fqL/rct40B+NXZwmCi+Ab7s14SN5AhO/1Kt6TLoCsCimSd6QUEPV8ot8Awv1
         qf9Bgj5fzHdrhDAxa81gI1faFDrB10RO8V8odImN1XANMuOEhQoTxESwM+qRqApBsFUq
         BS021GcfhXuJcSKq9y7YGOo2LVnyPgsXSYEpMwvEBxN7Ebjbt0BYLMvP2lpl5cVkU6am
         fpRnL31Z0+0B2s4/KzSO8rCA64/y8Qz3//aInpTh2Azb4BnTmwWsJZpaj1EcTe2O2xd7
         UmlF3tBfeUfBgHSQdrVUNCDBMpZoNe4tUyFxqDewq+wsAOicBgyGvEPm1A26p/CaU03r
         Pv2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=fOUjPH+PsZUC/4Dxn9qSHU2eo/ZATKaAUDvGwicR+TY=;
        b=OnB1ymaTGHYfccVnC1X+FDs33EPOHCDYPMcpW06YdDN62lhSP2oYuol6zv/S9W3cZR
         jJ7kP8/OVkjyn/Lc7IH2REx4fNkRoZPmquNEMUjWzcz6mYJKUp4rD5dsgkQb0xyDOJfy
         IPe6UzRsw4KME5119Yz6htq07R+bEMqfUrRhT/mMW5MBUh8vlAXBoHJ5S37SCI5m+c4y
         NtQJk9HVpqHkYyQtwPNYVIgkjpmcWCPamxlucTpE1AfDAV76FUdS3O7Rs9q+N2ziPPeF
         +fXqmO7Y1WuzHYcXIHeN9LmowV+wakbi80vr9XBwIGWKGDNjL3FzT7bijgrLSRPkezUf
         X1bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YhQcZfb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si6764528qvj.192.2020.01.13.11.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 11:54:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YhQcZfb4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir5mp-0007pI-SD
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 14:54:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ir5mb-0007ik-D9
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 14:53:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ir5mZ-00084U-OZ
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 14:53:52 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37453
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ir5mZ-00083O-Jy
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 14:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578945230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fOUjPH+PsZUC/4Dxn9qSHU2eo/ZATKaAUDvGwicR+TY=;
 b=YhQcZfb4AKYFNOo8mVkEg9NBRnlgLaVou6nRTy4J33eDBrw/+fXS6tAe6FNZRMyV8CtdVb
 /wRFGXAtHuwBj/Hv3jnnbLsqQ59CsX1xOn7fg7o6Eax0qcoYkhZXU/qEMr9pG++iMigLaZ
 bcsXSvilvdLj9zd4GM+QzFPXV9np2FE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-g_gfF-HyPY24YBmDKGizKg-1; Mon, 13 Jan 2020 14:53:47 -0500
Received: by mail-qt1-f200.google.com with SMTP id m15so7302712qtc.18
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 11:53:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rOKPIBq72Ryae3sLHmLRve0xR3Sl9ydH9eOFAPkEEHg=;
 b=bWmP7Ht4iYC/r5DWnwyeSLFVMqjQFLdRgF7bLKzBqrD7BpdSCyxOkugt9ntJFS0hR9
 CrKxG5RW+UGY2igBWwXa1cm7qR35LzS/zNSO7h2ObCNrEYC1gqVqgRU7YZLxdyFaQC8A
 XDNNLWX2YPe4PJ4+pjQeD3UlAGk4SrbByXsQe72QqYv8SCvcusVHbGcz5FbL5qRVwOLe
 HZJv++VAxt52vx3RnOJYOXsVCZBhUN0IQcK0Hy7im2XujDhwn+r8Jo5tYDh6KrRx/HsA
 F/FXblNVRy1q0S1gwSGCkH2FQlYuHNKHoGl9FyKmhjo9Obz31mGZU1t3ekAni8I2V3Xl
 Nn+A==
X-Gm-Message-State: APjAAAXZpzf4QMZNrb5C6/4l91/Pfb8L0YU6YqRX5tnAK9AK4Fh3KOEh
 0P8jZuFzmbc7Z7fnb1pYlcByN3VfTJZlDx4HFt4sATNVjAvxANJegmbXgEvvcVjGPwyhlMcHFjF
 Fc4puRi0HQK0C
X-Received: by 2002:ac8:6f73:: with SMTP id u19mr235420qtv.326.1578945226770; 
 Mon, 13 Jan 2020 11:53:46 -0800 (PST)
X-Received: by 2002:ac8:6f73:: with SMTP id u19mr235394qtv.326.1578945226515; 
 Mon, 13 Jan 2020 11:53:46 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id x27sm5413115qkx.81.2020.01.13.11.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 11:53:45 -0800 (PST)
Date: Mon, 13 Jan 2020 14:53:44 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 04/13] virtio-iommu: Add the iommu regions
Message-ID: <20200113195344.GA201624@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-5-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109144319.15912-5-eric.auger@redhat.com>
X-MC-Unique: g_gfF-HyPY24YBmDKGizKg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-TUID: rfKy9AgdB0BN

On Thu, Jan 09, 2020 at 03:43:10PM +0100, Eric Auger wrote:
> Implement a callback called on PCI bus enumeration that
> initializes for a given device on the bus hierarchy
> an IOMMU memory region. The PCI bus hierarchy is stored
> locally in IOMMUPciBus and IOMMUDevice objects.
>=20
> At the time of the enumeration, the bus number may not be
> computed yet.
>=20
> So operations that will need to retrieve the IOMMUdevice
> and its IOMMU memory region from the bus number and devfn,
> once the bus number is garanteed to be frozen,
> use an array of IOMMUPciBus, lazily populated.
>=20
> virtio_iommu_mr() is the top helper that allows to retrieve
> the IOMMU memory region from the requester ID.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
> v11 -> v12:
> - add the iommu_find_iommu_pcibus() mechanics. Without it,
>   when attaching t device to a domain we could not check
>   the device is effectively protected by this IOMMU

Sorry I probably lost the context again after read the previous
version...  Could you hint me what does this used for?

In all cases, I see that virtio_iommu_mr() is introduced but not used.
Would be good to put it into the patch where it's firstly used.

Thanks,

--=20
Peter Xu

