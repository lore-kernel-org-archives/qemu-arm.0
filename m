Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6271138lff;
        Tue, 10 Dec 2019 11:39:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7Gj2Hyw5JYkrG3vUdAZqx4ErC3SDGzNGxYckY5HFGr6pBYgzuMCVND1FRsbzhzAbkGv9/
X-Received: by 2002:a05:6830:1db3:: with SMTP id z19mr28614279oti.152.1576006762338;
        Tue, 10 Dec 2019 11:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576006762; cv=none;
        d=google.com; s=arc-20160816;
        b=DQUCizADIeL3PseAyl3U8rvITtC4sNPtJ5GpbpbsgUgAcRpGQjwfEAtaZvCkwl2PjT
         HJhSrvG30IwVKo2PmXsQ1zbdpUdEJ+nux/OrrIFZa5gtYwhX9xceikxBU/4PqMhAntvJ
         HYGvQ5m0q+YoalXfj3lZ+V2BBnDj2p16QFK4WhmOPRKPz68xd1U0AmnSbJbxYb+Wn5Q4
         39AbbTZbZybpbHjEL7ewcB6LxCsqDBmDShQzKRDJkUSVxz7Tk/kcMVIQ9SE3MoX2h3//
         PIb9bQIzKnWxNDXqjUWO2Y5AF7SkQAZl+ix0e6QLgmH9Y98RVxkgph/UVNzy7eMmU8TU
         znCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=FgAyacV+nZ8CBkg+wqkyy4NV8IkZ01Jpe3cd7x9PNsc=;
        b=IamflifceWsuH/L9AQfThq4iqewszLd0LRtHAtbZcTIMdFoij3lSzwZ834631PDTA9
         Eyt8x2xMsOFi33A8g9C6syH1wISAyhems2gk88vnJhztGofIVAU3GqNz3Akv2F6zKLpa
         kepqsV5B96yPXvbGCm/WDGXH/VMuRptxGstsBXS2z48Mgwt6ai5+IbyZ9e3iqxdcmld+
         FDOY0PXIYrPk/I6zifkIftbruF0ze69u3CtLg3ISk6yvVtftJEHOG/HtMJTffHgZi+ex
         5dcuCe8P4mjTvkhJHqvkIvmpoOC3v482eF43WfOkJX3sDD8Na+sOuupkwGHx67SN9g7k
         M9xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="A62Io/+s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si2311595otn.117.2019.12.10.11.39.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 11:39:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="A62Io/+s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ielLs-0007tA-Ds
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 14:39:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ielLh-0007sa-7P
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:39:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ielLg-0001hu-3s
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:39:09 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21697
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ielLf-0001hf-Vh
 for qemu-arm@nongnu.org; Tue, 10 Dec 2019 14:39:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576006747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FgAyacV+nZ8CBkg+wqkyy4NV8IkZ01Jpe3cd7x9PNsc=;
 b=A62Io/+s42Ok+rXV4l7NNHYNtY1/FXOmD5L/wHDKjN6fd/n2FKXMRVmlbYAopW2WzQhHXn
 ytBVhoLCmI2N2zxQC/AItHleWCh0KSjmKqSUC7xS3FHDKliFIL208zBmgWqKAENDqwS4DL
 o6LEoTneNTxc4t6T/g1P9SUy/fRReKQ=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-MRagr9PlMuqZ7MXx_R-2sw-1; Tue, 10 Dec 2019 14:39:05 -0500
Received: by mail-qt1-f198.google.com with SMTP id 42so2658521qtc.19
 for <qemu-arm@nongnu.org>; Tue, 10 Dec 2019 11:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1mymb3Sv3zpDU5FJ6RFLPGZz5uXl0s3penVzv5qXOaM=;
 b=IcUILK/jdpjRRjKJ/o8fPqCU7iVaONDK8y+t8lCfIsmEVXbzZhLWTj91vx9UP+COPH
 Hkr3Y0WF9ZQwFMns94cn0Rhn6IN8M86a9WKia4fqHgHykH4909w5lF6FTCqh0Zflm4J3
 kA62q338rNd0aQw0irtVnhRH3Bqer0Q+Lqi9q9WnUG9iDxhfdW7siqrCoqa/421VvQiz
 15pizpEfWJm0WDZ/22Kq6kCynNWCwIgOZicRtch2EcSnZ8kHaRr86FJzCA8AG88pht+A
 JSqwI15/3dkc4pvUz2Dd+IupyVzJSo52RzQxRTVr5MgNuxpJLhTbqk+y9GJy8p+pQ8Tn
 fqcQ==
X-Gm-Message-State: APjAAAVb93svo79NmSKRpEDm0Re6uAe6wwr9CKmGhTjkb9l85X2pjvTL
 +qcZUrNBjzWEgO2+eC747w3Uy7J/+qgDxuekVotbS6yz3nPQfsyjy9GmiMsscX4Qb+lKm/oPLYl
 TdPfuAhRI5KAD
X-Received: by 2002:ad4:498d:: with SMTP id t13mr29235093qvx.58.1576006745419; 
 Tue, 10 Dec 2019 11:39:05 -0800 (PST)
X-Received: by 2002:ad4:498d:: with SMTP id t13mr29235067qvx.58.1576006745175; 
 Tue, 10 Dec 2019 11:39:05 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id o10sm1346480qtp.38.2019.12.10.11.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 11:39:04 -0800 (PST)
Date: Tue, 10 Dec 2019 14:39:03 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 14/20] virtio-iommu: Handle reserved regions
 in the translation process
Message-ID: <20191210193903.GL3352@xz-x1>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-15-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191122182943.4656-15-eric.auger@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-MC-Unique: MRagr9PlMuqZ7MXx_R-2sw-1
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kW+u2izjq+HT

On Fri, Nov 22, 2019 at 07:29:37PM +0100, Eric Auger wrote:
> When translating an address we need to check if it belongs to
> a reserved virtual address range. If it does, there are 2 cases:
>=20
> - it belongs to a RESERVED region: the guest should neither use
>   this address in a MAP not instruct the end-point to DMA on
>   them. We report an error
>=20
> - It belongs to an MSI region: we bypass the translation.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v10 -> v11:
> - directly use the reserved_regions properties array
>=20
> v9 -> v10:
> - in case of MSI region, we immediatly return
> ---
>  hw/virtio/virtio-iommu.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 1ce2218935..c5b202fab7 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -548,6 +548,7 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemo=
ryRegion *mr, hwaddr addr,
>      uint32_t sid, flags;
>      bool bypass_allowed;
>      bool found;
> +    int i;
> =20
>      interval.low =3D addr;
>      interval.high =3D addr + 1;
> @@ -580,6 +581,22 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMem=
oryRegion *mr, hwaddr addr,
>          goto unlock;
>      }
> =20
> +    for (i =3D 0; i < s->nb_reserved_regions; i++) {
> +        if (interval.low >=3D s->reserved_regions[i].low &&
> +            interval.low <=3D s->reserved_regions[i].high) {
> +            switch (s->reserved_regions[i].type) {
> +            case VIRTIO_IOMMU_RESV_MEM_T_MSI:
> +                entry.perm =3D flag;
> +                goto unlock;

Might be a bit clearer to break here instead of goto, then..

> +            case VIRTIO_IOMMU_RESV_MEM_T_RESERVED:

               /* Passthrough */

> +            default:
> +                virtio_iommu_report_fault(s, VIRTIO_IOMMU_FAULT_R_MAPPIN=
G,
> +                                          0, sid, addr);
> +            goto unlock;

.. do the same thing here, and...

> +           }

.. goto unlock here..

> +        }
> +    }
> +
>      if (!ep->domain) {
>          if (!bypass_allowed) {
>              qemu_log_mask(LOG_GUEST_ERROR,
> --=20
> 2.20.1
>=20

--=20
Peter Xu

