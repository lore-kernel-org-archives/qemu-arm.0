Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6265339lff;
        Tue, 10 Dec 2019 11:34:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwb3dcNov8sSLGWlweJOxFCgLojbbWTkojoxirbcE4sZ+yp5dwR+MKFSiX+s1i2I3QH9xHA
X-Received: by 2002:a37:2f82:: with SMTP id v124mr5430347qkh.181.1576006452817;
        Tue, 10 Dec 2019 11:34:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576006452; cv=none;
        d=google.com; s=arc-20160816;
        b=EIyZdhqTbxWlyLNSAd9z24zgR3HxfA7fFMwkf6GbkAStHadQg30blFxpJ07w+lrXds
         r+lmiLZoUaQ1IVmKvTIS5Yq5EZGJsC4N/2RFJDiexclj2+bwu0LG7ioBHja7MeHDkG9a
         rQw8zKPDb5i8flNkQeEGyySjmCNzmxDtU/ddJaSYiVjcD822/I0DZY9qRvDFwQjnp1Wa
         cIzxmO6oFugTLYas0JYtg9ohbcE3OeR9C7Ki7oz2eH9w6mbPos6ggELhnTXTEoJP11ac
         80ldnTlSok+nqC0e62ew8QIWYdxz8flBCRCBpgFNB/HgBmehvsmqVNUG9R4bDQ5hBNj4
         z8Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=DZTfpCN1lANcpp5nvsLp60HOaf9LAi3l8OM391BbYxQ=;
        b=Aaqnjyxb+IEPdBiONMP66wAro3NU7v/I2PUwSkPCv5nPs4nGcAXLGzObqL2DN87gr5
         mjO/f5+tVYkFcWMnB0G+psrRP4DyG+Z7cOr8cRQ6eH/7Nvha+5Gq2mlcuycXnNg8e6H5
         E9E5sNYbYpS8XLh17jx1+GzBNYL7nA7PPT2P+pbm3mW5rsypJGWZ7z8cMsRFCYy17hwE
         LYO3RPOcEUZ4ShBL+ulImzPTLKdByA0PlMMtBc8P+TebNqfiFQ+r0lHVWfwWXqvMOsID
         wULtTTlrN0OhAOBZ4OkfUluHobPCkpmJj0AWA388VMN5H2Ca7AFU+6W0vB348WecPpSh
         JQpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TlfekM7Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si2332214qvt.161.2019.12.10.11.34.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 11:34:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=TlfekM7Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ielGu-0005C4-76
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 14:34:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58140)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ielGa-0005BD-64
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:33:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ielGX-00083o-6w
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:33:50 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49798
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ielGX-00082u-3L
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:33:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576006428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DZTfpCN1lANcpp5nvsLp60HOaf9LAi3l8OM391BbYxQ=;
 b=TlfekM7ZxXyMxaRr1RMFelGW8wo6wjZlllpb7rOftyERsldP/5cHYqa8rAKYvLRoZWzXRw
 5gHidyMooDYoYDSTs9TqInLbnw1xIFUnvT+Uww+Dzihk0azfJACaK193cppV7aL+qYUEhv
 qGpQuIhtPN2DzJAgH7r4dzs5PvDg0Ys=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-nc2qJw33M5CzqY3rLzczqw-1; Tue, 10 Dec 2019 14:33:47 -0500
Received: by mail-qt1-f198.google.com with SMTP id g22so2659944qtr.23
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 11:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HjCoFxij4to5Ve/wYhzyT1FW8VAPKljzlAY7EGytemQ=;
 b=SiTeBxBt397+mRKvmRxb8DS1jlH8z8q3w8BSmEKgtUIySlHltzahYyOlsEa+7Nr37f
 y6e+TKzTclylaDa8bQVP6MHDKY348kAYslzqJh+rEDJcLCHz2gibvew1hSevmlG3caOd
 xiJsjbRCXtYD3NT/ylrcfKv7W+cHGi0Sak+qvm9YqgmF1HTiysIzStdpVHJWR2xMrhK/
 JspdTDzsnVEJPbhp4CNRCv2zusxvBz6O6Hte8Tqi2sbarJWGOQUpXV+ve9p4qHMLeDIE
 e7NeC37X75Ecct9MkxGNUm/nwe9ugKdRMBWgHp6JRkhrw+6+UPBAtiRq9FnphSQ+2Kog
 G9Qw==
X-Gm-Message-State: APjAAAURmS7NjzqhtVG7OpuNyBghpxHxB5WbbXuJVoJNLBdQFqRQESAp
 uqk7+3Is72oJf0XBlwLzhvRQwde/B4T3kRDJ2Ag5OupVs93TZiTe9PW2U45L7ZRbOh1Ay/iCgWc
 xtIYC893XGx7Q
X-Received: by 2002:a37:2781:: with SMTP id
 n123mr33410474qkn.163.1576006424633; 
 Tue, 10 Dec 2019 11:33:44 -0800 (PST)
X-Received: by 2002:a37:2781:: with SMTP id
 n123mr33410449qkn.163.1576006424308; 
 Tue, 10 Dec 2019 11:33:44 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id k50sm1482555qtc.90.2019.12.10.11.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 11:33:43 -0800 (PST)
Date: Tue, 10 Dec 2019 14:33:42 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Message-ID: <20191210193342.GJ3352@xz-x1>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-9-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122182943.4656-9-eric.auger@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-MC-Unique: nc2qJw33M5CzqY3rLzczqw-1
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8hcepe4FiVMY

On Fri, Nov 22, 2019 at 07:29:31PM +0100, Eric Auger wrote:
> This patch implements the translate callback
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v10 -> v11:
> - take into account the new value struct and use
>   g_tree_lookup_extended
> - switched to error_report_once
>=20
> v6 -> v7:
> - implemented bypass-mode
>=20
> v5 -> v6:
> - replace error_report by qemu_log_mask
>=20
> v4 -> v5:
> - check the device domain is not NULL
> - s/printf/error_report
> - set flags to IOMMU_NONE in case of all translation faults
> ---
>  hw/virtio/trace-events   |  1 +
>  hw/virtio/virtio-iommu.c | 63 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
> index f25359cee2..de7cbb3c8f 100644
> --- a/hw/virtio/trace-events
> +++ b/hw/virtio/trace-events
> @@ -72,3 +72,4 @@ virtio_iommu_get_endpoint(uint32_t ep_id) "Alloc endpoi=
nt=3D%d"
>  virtio_iommu_put_endpoint(uint32_t ep_id) "Free endpoint=3D%d"
>  virtio_iommu_get_domain(uint32_t domain_id) "Alloc domain=3D%d"
>  virtio_iommu_put_domain(uint32_t domain_id) "Free domain=3D%d"
> +virtio_iommu_translate_out(uint64_t virt_addr, uint64_t phys_addr, uint3=
2_t sid) "0x%"PRIx64" -> 0x%"PRIx64 " for sid=3D%d"
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index f0a56833a2..a83666557b 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -412,19 +412,80 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMe=
moryRegion *mr, hwaddr addr,
>                                              int iommu_idx)
>  {
>      IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);
> +    viommu_interval interval, *mapping_key;
> +    viommu_mapping *mapping_value;
> +    VirtIOIOMMU *s =3D sdev->viommu;
> +    viommu_endpoint *ep;
> +    bool bypass_allowed;
>      uint32_t sid;
> +    bool found;
> +
> +    interval.low =3D addr;
> +    interval.high =3D addr + 1;
> =20
>      IOMMUTLBEntry entry =3D {
>          .target_as =3D &address_space_memory,
>          .iova =3D addr,
>          .translated_addr =3D addr,
> -        .addr_mask =3D ~(hwaddr)0,
> +        .addr_mask =3D (1 << ctz32(s->config.page_size_mask)) - 1,
>          .perm =3D IOMMU_NONE,
>      };
> =20
> +    bypass_allowed =3D virtio_has_feature(s->acked_features,
> +                                        VIRTIO_IOMMU_F_BYPASS);
> +

Would it be easier to check bypass_allowed here once and then drop the
latter [1] and [2] check?

>      sid =3D virtio_iommu_get_sid(sdev);
> =20
>      trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
> +    qemu_mutex_lock(&s->mutex);
> +
> +    ep =3D g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
> +    if (!ep) {
> +        if (!bypass_allowed) {

[1]

> +            error_report_once("%s sid=3D%d is not known!!", __func__, si=
d);
> +        } else {
> +            entry.perm =3D flag;
> +        }
> +        goto unlock;
> +    }
> +
> +    if (!ep->domain) {
> +        if (!bypass_allowed) {

[2]

> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s %02x:%02x.%01x not attached to any domain\=
n",
> +                          __func__, PCI_BUS_NUM(sid),
> +                          PCI_SLOT(sid), PCI_FUNC(sid));
> +        } else {
> +            entry.perm =3D flag;
> +        }
> +        goto unlock;
> +    }
> +
> +    found =3D g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&i=
nterval),
> +                                   (void **)&mapping_key,
> +                                   (void **)&mapping_value);
> +    if (!found) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s no mapping for 0x%"PRIx64" for sid=3D%d\n",
> +                      __func__, addr, sid);

I would still suggest that we use the same logging interface (either
error_report_once() or qemu_log_mask(), not use them randomly).

> +        goto unlock;
> +    }
> +
> +    if (((flag & IOMMU_RO) &&
> +            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
> +        ((flag & IOMMU_WO) &&
> +            !(mapping_value->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Permission error on 0x%"PRIx64"(%d): allowed=3D%d=
\n",
> +                      addr, flag, mapping_value->flags);

(Btw, IIUC this may not be a guest error. Say, what if the device is
 simply broken?)

> +        goto unlock;
> +    }
> +    entry.translated_addr =3D addr - mapping_key->low + mapping_value->p=
hys_addr;
> +    entry.perm =3D flag;
> +    trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
> +
> +unlock:
> +    qemu_mutex_unlock(&s->mutex);
>      return entry;
>  }
> =20
> --=20
> 2.20.1
>=20

--=20
Peter Xu

