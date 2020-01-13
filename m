Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4574081lff;
        Mon, 13 Jan 2020 12:07:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwCAH5MUBsoVXLOaPJSbDyR0f9orTd0wqS+CPlJo4bGE2H9v+qcmVv+h2DNwfLB13wje3JV
X-Received: by 2002:a17:906:cccf:: with SMTP id ot15mr18601055ejb.7.1578946027534;
        Mon, 13 Jan 2020 12:07:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578946027; cv=none;
        d=google.com; s=arc-20160816;
        b=JCidBJPLg7zc0rrNEslNAe9+lSm4w3FwAijkSKi9TC6H6xRk68RAka640nboOZPu+1
         T8U1Q/zK/168wnId+3uIBxeyXEqThKe1gTb9vtV+MOSgGbb9X5/4wz/eHuf6KPMZKOLY
         vSegYbnl6p2W17iNW40JEpJVnBIVAUdvCuotPTbnbKAP07r0iwBuXoCyeqmAOxG8OaT6
         H0q1IMO2Z4naX380MIAC1TvYE7t10alJ3qrIfWrM18aVnuERU6nrbkeupCoGxerDusjG
         rGa3cIz6B53CXO+XcpMGj+JTN9MAv41DT2f80RR4nEz5YETo4YaLeZ8VmLvT/yijUvBv
         k1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=GPvRzQvIdaqqNb0HVBmmcAVMm4KHhNn/ND3/BBp73uI=;
        b=Yfxnmmaxwg2iNGuITe4jl686HWM8YhaJapPMp4Y9eWYk53J7jEC7ECQKPZd1TZNzzh
         Jsvu/PFYZiWr5d9l3MEtwDgsJvgqSKOp216Nv/CV5ZebiHCTLYXW6hCXyqdxALJOWEn4
         NC/wl/58W0bSF3HAUIoRdZg1dyk44ZuIjXwNMh2A9VFH4avxjovleYZu9XsSSS3RzHV+
         JpxvBEJ/aaQBTWqufZ9RxdSRD6plAzo+ZBVnBROSCSZZ2ZDh1exIH/CZpVNxhlgoN29P
         Hsb1rDN1WKU1wK3IRjhJmn/ECRgeP2NK1jl/eMgIN2Pz0jhMg+kZogYSNrtp5EZvLHwC
         MpHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ce3DnNXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si7359129eja.354.2020.01.13.12.07.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jan 2020 12:07:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ce3DnNXl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ir5zO-0000Yf-5G
	for alex.bennee@linaro.org; Mon, 13 Jan 2020 15:07:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45506)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ir5zC-0000VC-GO
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 15:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ir5zB-0002ef-GI
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 15:06:54 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40200
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ir5zB-0002eB-CW
 for qemu-arm@nongnu.org; Mon, 13 Jan 2020 15:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578946012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GPvRzQvIdaqqNb0HVBmmcAVMm4KHhNn/ND3/BBp73uI=;
 b=ce3DnNXlFEVx+2xMmZRWA5fH6+SOdjk/lnAAiPUTY63Dp+PnAApYq+8z7MIfSNGNu8V1E8
 Z9Ij2KoWaTeIDPHd99sBoUeEkBtmmZU9qOE0Sh/lg8NtYdYM+tF9b6SpywJO7Jkf6ZAPpJ
 WcuEux0TTcpcAHxzxVa8Y9NDSGd5uJM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-6wS1WwYZP9uuyeiAfN8YPw-1; Mon, 13 Jan 2020 15:06:51 -0500
Received: by mail-qt1-f200.google.com with SMTP id 38so7297410qty.15
 for <qemu-arm@nongnu.org>; Mon, 13 Jan 2020 12:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3zF0XGwwqTYlkck4hqT2NGqc4X5DVV63ye95UnKmVp8=;
 b=ljvOE4My5SVaZr0PiJ1Kbku+3xWFB60ez1LnEatlifehnyyCWyZlDgkxJVok6wcWS6
 QYA1xz/15b7PyEI4apTp2VHJtf0tQG0r9VUSZMZJgREBalmsvlqiHHE8DM2Fr8flJsQ7
 bT4emescv7WbkbuSMXY3AljjCX6Js6cuYv8HObbOphscQd+YQQpcvfwaRNiEXlNRQJcu
 +A8fnLruKCydrsw2CkXGWv50136upTiowl08uB6mhI/cke1Ev7RV5sCCy49QyPLDaS9r
 H5decEHPVO+0ss8CWfPfQs3x8QAK204ljTqh0gMUEGC/INvAZFCscpkOBwmli69zRJSf
 Cp0w==
X-Gm-Message-State: APjAAAUYRvrMenl5C3TLK4++dXjPJbERqbyCJj/1PbpZgaKt4EFjoSIL
 XP2ekVENWQt133gUIIOl6Q/cv9aHEpfs0vtI9f81EzuPkjW3cEEf9Kxv+VNGJ1FwVvkb73Xr5gr
 QysNj0h7O1ldP
X-Received: by 2002:ac8:408e:: with SMTP id p14mr333089qtl.66.1578946011160;
 Mon, 13 Jan 2020 12:06:51 -0800 (PST)
X-Received: by 2002:ac8:408e:: with SMTP id p14mr333068qtl.66.1578946010979;
 Mon, 13 Jan 2020 12:06:50 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id m5sm6221343qtq.6.2020.01.13.12.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 12:06:50 -0800 (PST)
Date: Mon, 13 Jan 2020 15:06:49 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v12 04/13] virtio-iommu: Add the iommu regions
Message-ID: <20200113200649.GC201624@xz-x1>
References: <20200109144319.15912-1-eric.auger@redhat.com>
 <20200109144319.15912-5-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200109144319.15912-5-eric.auger@redhat.com>
X-MC-Unique: 6wS1WwYZP9uuyeiAfN8YPw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
X-TUID: ByCWsNGk3uWI

On Thu, Jan 09, 2020 at 03:43:10PM +0100, Eric Auger wrote:
> +/**
> + * The bus number is used for lookup when SID based operations occur.
> + * In that case we lazily populate the IOMMUPciBus array from the bus ha=
sh
> + * table. At the time the IOMMUPciBus is created (iommu_find_add_as), th=
e bus
> + * numbers may not be always initialized yet.
> + */
> +static IOMMUPciBus *iommu_find_iommu_pcibus(VirtIOIOMMU *s, uint8_t bus_=
num)
> +{
> +    IOMMUPciBus *iommu_pci_bus =3D s->iommu_pcibus_by_bus_num[bus_num];
> +
> +    if (!iommu_pci_bus) {
> +        GHashTableIter iter;
> +
> +        g_hash_table_iter_init(&iter, s->as_by_busptr);
> +        while (g_hash_table_iter_next(&iter, NULL, (void **)&iommu_pci_b=
us)) {
> +            if (pci_bus_num(iommu_pci_bus->bus) =3D=3D bus_num) {
> +                s->iommu_pcibus_by_bus_num[bus_num] =3D iommu_pci_bus;
> +                return iommu_pci_bus;
> +            }
> +        }

Btw, we may need to:

           return NULL;

here.

> +    }
> +    return iommu_pci_bus;
> +}

--=20
Peter Xu

