Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp6050552lfc;
        Wed, 27 Nov 2019 04:07:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4Qe+xzUwCtqDLKqAhRwA7oENMwTNuQ0PjLD6S1G3UaZsB/vu+SC001ATaUhuFfMPxcVrM
X-Received: by 2002:ac8:36f5:: with SMTP id b50mr30590206qtc.268.1574856430420;
        Wed, 27 Nov 2019 04:07:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574856430; cv=none;
        d=google.com; s=arc-20160816;
        b=rkiV59bKRSwl5FT8UpXOlqoDgjWwOGkndjRAtkssVsG/zeZ+hEUwwL9Shd8DNUYfnq
         pwUjwcUlNPLiqNSf3DWKui28NwUY4Cv6cb+AGheFXvykMzAlaDWu2mQ5lUzNJ08gacRa
         lIFHYNNcdmN9UeCrID8vanutUzoDqt5mL//nLm3iBsYRyHqAijVtJdccyYP/tFzxtFO0
         F/IkiEsEpT58aMj3z/pJa6dEgcjjvPxohBaVjccXQQ8qu0TQNm+aBuAYY0p0d4Hdr1Zn
         lna3ugxaQ11Qqva95jBT9iXSXav0LkT6mWL3a8h9p9gyvaYGQ/NA7E4zuIdcuNgPU6wO
         taWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=SrILFCGHJnwMVvogxicaYHFqxItfgFN5vrkccrFPrL0=;
        b=wJOoA+Frkh6EusdRS2H9Z0tCr7glApTMwqm3WoJEwJ60TkewmWvY9Pbk9GKaXpyafQ
         HNi9BgVdfzxmu/4O2VgfwrgFP95U14PFfKAs52bq3Bj8+7Q+FDTlLQprNgKt8jFG4Fzb
         /LDVWkKeRmDs5YgSVoQr2NUu0am6U7VntUv6wufvy4lWrcJcYBy7apJLFKMsP9LbApc3
         JUrUyHVKGRFl12pD4DmbUduSKgHU7p5e+O5ehgp/Me5HclozmI7XR6e0GSeqeXxdEvPO
         Z6tDVtz+dzxBQ8omwmExNF47XeL94dUKFizzkzICXaTAWTn7aSv4Q60wI7NEMCVWv7sa
         BAfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bahhfdlW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si10419128qti.199.2019.11.27.04.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2019 04:07:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=bahhfdlW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iZw69-0001jy-IC
	for alex.bennee@linaro.org; Wed, 27 Nov 2019 07:07:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iZw5x-0001gn-Jo
 for qemu-arm@nongnu.org; Wed, 27 Nov 2019 07:06:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iZw5w-0006Ud-9j
 for qemu-arm@nongnu.org; Wed, 27 Nov 2019 07:06:57 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22589
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iZw5w-0006UD-5r
 for qemu-arm@nongnu.org; Wed, 27 Nov 2019 07:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574856415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrILFCGHJnwMVvogxicaYHFqxItfgFN5vrkccrFPrL0=;
 b=bahhfdlWi5DpAImnqVgGvojxmygpUKAMVRGYVt87D6iYTaXVpPMohMk+i4aJUDjfNHAHmI
 SY/D7G8+eVj9Nups76z08JsMTQ/kIlz6gS3sndTIn1cLXQVXbKh6vJmugiw3e37bGYGvGR
 94wzuxjSYi0vGZ/zOfAaDovpbzatzDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-9wi4a9VHMLWnt_WPV3URJg-1; Wed, 27 Nov 2019 07:06:48 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23A7A800C78;
 Wed, 27 Nov 2019 12:06:46 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.46])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F120C3C1D;
 Wed, 27 Nov 2019 12:06:35 +0000 (UTC)
Date: Wed, 27 Nov 2019 12:06:32 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 18/20] virtio-iommu: Support migration
Message-ID: <20191127120632.GH3016@work-vm>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-19-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122182943.4656-19-eric.auger@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 9wi4a9VHMLWnt_WPV3URJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VEZH6vlmV4Ds

* Eric Auger (eric.auger@redhat.com) wrote:
> Add Migration support. We rely on recently added gtree and qlist
> migration. Besides, we have to fixup end point <-> domain link.
>=20
> Indeed each domain has a list of endpoints attached to it. And each
> endpoint has a pointer to its domain.
>=20
> Raw gtree and qlist migration cannot handle this as it re-allocates
> all the nodes while reconstructing the trees/lists.
>=20
> So in post_load we re-construct the relationship between endpoints
> and domains.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

From the migration side of things,


Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/virtio/virtio-iommu.c | 127 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 117 insertions(+), 10 deletions(-)
>=20
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index c5b202fab7..4e92fc0c95 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -692,16 +692,6 @@ static void virtio_iommu_set_features(VirtIODevice *=
vdev, uint64_t val)
>      trace_virtio_iommu_set_features(dev->acked_features);
>  }
> =20
> -/*
> - * Migration is not yet supported: most of the state consists
> - * of balanced binary trees which are not yet ready for getting
> - * migrated
> - */
> -static const VMStateDescription vmstate_virtio_iommu_device =3D {
> -    .name =3D "virtio-iommu-device",
> -    .unmigratable =3D 1,
> -};
> -
>  static gint int_cmp(gconstpointer a, gconstpointer b, gpointer user_data=
)
>  {
>      uint ua =3D GPOINTER_TO_UINT(a);
> @@ -778,6 +768,123 @@ static void virtio_iommu_instance_init(Object *obj)
>  {
>  }
> =20
> +#define VMSTATE_INTERVAL                               \
> +{                                                      \
> +    .name =3D "interval",                                \
> +    .version_id =3D 1,                                   \
> +    .minimum_version_id =3D 1,                           \
> +    .fields =3D (VMStateField[]) {                       \
> +        VMSTATE_UINT64(low, viommu_interval),          \
> +        VMSTATE_UINT64(high, viommu_interval),         \
> +        VMSTATE_END_OF_LIST()                          \
> +    }                                                  \
> +}
> +
> +#define VMSTATE_MAPPING                               \
> +{                                                     \
> +    .name =3D "mapping",                                \
> +    .version_id =3D 1,                                  \
> +    .minimum_version_id =3D 1,                          \
> +    .fields =3D (VMStateField[]) {                      \
> +        VMSTATE_UINT64(phys_addr, viommu_mapping),    \
> +        VMSTATE_UINT32(flags, viommu_mapping),        \
> +        VMSTATE_END_OF_LIST()                         \
> +    },                                                \
> +}
> +
> +static const VMStateDescription vmstate_interval_mapping[2] =3D {
> +    VMSTATE_MAPPING,   /* value */
> +    VMSTATE_INTERVAL   /* key   */
> +};
> +
> +static int domain_preload(void *opaque)
> +{
> +    viommu_domain *domain =3D opaque;
> +
> +    domain->mappings =3D g_tree_new_full((GCompareDataFunc)interval_cmp,
> +                                       NULL, g_free, g_free);
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_endpoint =3D {
> +    .name =3D "endpoint",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(id, viommu_endpoint),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_domain =3D {
> +    .name =3D "domain",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .pre_load =3D domain_preload,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT32(id, viommu_domain),
> +        VMSTATE_GTREE_V(mappings, viommu_domain, 1,
> +                        vmstate_interval_mapping,
> +                        viommu_interval, viommu_mapping),
> +        VMSTATE_QLIST_V(endpoint_list, viommu_domain, 1,
> +                        vmstate_endpoint, viommu_endpoint, next),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static gboolean reconstruct_ep_domain_link(gpointer key, gpointer value,
> +                                           gpointer data)
> +{
> +    viommu_domain *d =3D (viommu_domain *)value;
> +    viommu_endpoint *iter, *tmp;
> +    viommu_endpoint *ep =3D (viommu_endpoint *)data;
> +
> +    QLIST_FOREACH_SAFE(iter, &d->endpoint_list, next, tmp) {
> +        if (iter->id =3D=3D ep->id) {
> +            /* remove the ep */
> +            QLIST_REMOVE(iter, next);
> +            g_free(iter);
> +            /* replace it with the good one */
> +            QLIST_INSERT_HEAD(&d->endpoint_list, ep, next);
> +            /* update the domain */
> +            ep->domain =3D d;
> +            return true; /* stop the search */
> +        }
> +    }
> +    return false; /* continue the traversal */
> +}
> +
> +static gboolean fix_endpoint(gpointer key, gpointer value, gpointer data=
)
> +{
> +    VirtIOIOMMU *s =3D (VirtIOIOMMU *)data;
> +
> +    g_tree_foreach(s->domains, reconstruct_ep_domain_link, value);
> +    return false;
> +}
> +
> +static int iommu_post_load(void *opaque, int version_id)
> +{
> +    VirtIOIOMMU *s =3D opaque;
> +
> +    g_tree_foreach(s->endpoints, fix_endpoint, s);
> +    return 0;
> +}
> +
> +static const VMStateDescription vmstate_virtio_iommu_device =3D {
> +    .name =3D "virtio-iommu-device",
> +    .minimum_version_id =3D 1,
> +    .version_id =3D 1,
> +    .post_load =3D iommu_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 1,
> +                                   &vmstate_domain, viommu_domain),
> +        VMSTATE_GTREE_DIRECT_KEY_V(endpoints, VirtIOIOMMU, 1,
> +                                   &vmstate_endpoint, viommu_endpoint),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +
>  static const VMStateDescription vmstate_virtio_iommu =3D {
>      .name =3D "virtio-iommu",
>      .minimum_version_id =3D 1,
> --=20
> 2.20.1
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

