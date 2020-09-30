Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5340998lfq;
        Wed, 30 Sep 2020 02:23:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKq+AMGa/xMCDa65b785ySWAu/mg8BdArWyN10scDTuu5nzYGoX0xFPIBuGotRj8HQT6G6
X-Received: by 2002:a25:e0d2:: with SMTP id x201mr2020644ybg.180.1601457817532;
        Wed, 30 Sep 2020 02:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601457817; cv=none;
        d=google.com; s=arc-20160816;
        b=M/5Ag0Q4YBHoNEPXsa+uiranXKDJAIm89fRtylpvUvTfBoE0PRORHMnXpqmW7rpcYm
         3wH3sK28n/4Rjl6wEWP4S7pl02IFth81wB1i70fvFuI7zEXt3qbel0N5QNeyTlEz/xik
         Y2EzRSnsTZfWpfYAwNjP61RFyKsnWldGfq2+uFJxmYgogIRIQj0ApuPZl6mr1LCOrfeP
         EkxdtM3kk4t0dxy/+EPZPl8xOZ2ZnIJ703OF6E0oaV6q9TocwX4LGHngZitkNQSBQ7Y2
         +UoFQActxs5qq+onu3NbdIXE0ZDG1m5qP0tMq7mzyaNZMsnRX9/KXCVqMWaZgoc4Oj+W
         r70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=owz3HwVppTAtTe1AsZH8ihXWtgDRkufigx8d3LlmVbc=;
        b=0gn3+qFPv+3bVXMq5Pvco7t2bwLgxrQcQAnNKS3vy0ytobCluJbbc85SugLvCeQ+as
         WQKv6RLaQgCphtCAV48wL7bexcKXFoQZSpTL80oEULJORxt+OL1YUbMLroCP0UnIVaMZ
         3ojWg+IW2iArl/3kMv/If0wLdw3vRvMMSr0eUtZEYLUj3L6S8fuuj5i15s9fV7rNzevz
         14U4guSmfFX41Xbti5tCCWhviBdkxPqY2KfxDWME6EhHfI1mxGrLH9vJuziKvz3lcDMP
         r6IUts3jgluGwpx3UISUpUXKVL64XTJrMHxH5rIibtdiDc592SoV+r2ZdOJBTITLQB0m
         fGxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G1USCJgB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p124si1099447ybc.7.2020.09.30.02.23.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 02:23:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G1USCJgB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNYKm-0007zb-Tr
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 05:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNYKe-0007zO-IH
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 05:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kNYKc-0002GB-Ov
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 05:23:28 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601457805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=owz3HwVppTAtTe1AsZH8ihXWtgDRkufigx8d3LlmVbc=;
 b=G1USCJgBxu58nrzmX8v2N3ftzozPBEF9wMfpNUl72rBx5m7N0LoiPPP9QCTWfvVYXSEV14
 OitL4vUKDB118IuphwMjjcX3O/nNCRIRd3pzzROwszC+VPRORCs532PppWu4K3+J2HAFWj
 UgtpgxKrFaXRNBG6eqvJmpeIphTwAAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-s6MHC3INMpmnFhasMx4MxA-1; Wed, 30 Sep 2020 05:23:20 -0400
X-MC-Unique: s6MHC3INMpmnFhasMx4MxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A270164082;
 Wed, 30 Sep 2020 09:23:19 +0000 (UTC)
Received: from localhost (ovpn-114-33.ams2.redhat.com [10.36.114.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 245565D9D3;
 Wed, 30 Sep 2020 09:23:18 +0000 (UTC)
Date: Wed, 30 Sep 2020 10:23:17 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/2] NVMe passthrough: Take into account host IOVA
 reserved regions
Message-ID: <20200930092317.GD201070@stefanha-x1.localdomain>
References: <20200929085550.30926-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200929085550.30926-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RYJh/3oyKhIjGcML"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, lvivier@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, kwolf@redhat.com, philmd@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yo6vlD1XL2Ep

--RYJh/3oyKhIjGcML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2020 at 10:55:48AM +0200, Eric Auger wrote:
> The current IOVA allocator allocates within the [0x10000, 1ULL << 39]
> window, without paying attention to the host IOVA reserved regions.
> This prevents NVMe passthtrough from working on ARM as the fixed
> IOVAs rapidly grow up to the MSI reserved region [0x8000000, 0x8100000]
> causing some VFIO MAP DMA failures. This series collects the usable
> IOVA regions using VFIO GET_INFO (this requires the host to support
> VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE) and rework the fixed and
> temporary IOVA allocators to avoid those latter.
>=20
> For the time being we do not change the arbitrary min/max IOVAs.
> In theory they could be dynamically determined but the kernel
> currently fails to expose some HW limitations described in the ACPI
> tables (such as PCI root complex Device Memory Address Size Limit).
> See kernel thread related to "[RFC 0/3] iommu: Reserved regions for
> IOVAs beyond dma_mask and iommu aperture" for more details:
> https://lkml.org/lkml/2020/9/28/1102
>=20
> Best Regards
>=20
> Eric
>=20
> This series can be found at:
> https://github.com/eauger/qemu/tree/nvme_resv_v2
>=20
> This was tested on ARM only.
>=20
> History:
> v1 -> v2:
> - remove "util/vfio-helpers: Dynamically compute the min/max IOVA" to
>   relax the kernel dependency
> - Fix cabapbility enumeration loop
> - set s->usable_iova_ranges=3DNULL to avoid double free
> - handle possible u64 wrap
>=20
> Eric Auger (2):
>   util/vfio-helpers: Collect IOVA reserved regions
>   util/vfio-helpers: Rework the IOVA allocator to avoid IOVA reserved
>     regions
>=20
>  util/vfio-helpers.c | 129 +++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 123 insertions(+), 6 deletions(-)
>=20
> --=20
> 2.21.3
>=20

Thanks, applied to my block tree:
https://github.com/stefanha/qemu/commits/block

Stefan

--RYJh/3oyKhIjGcML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl90ToUACgkQnKSrs4Gr
c8gAGwf/TJ37FKH9VTr7GZxX7+oYWcyUhmO3ECWC6G2/h8eTXHQ48T+oANfVbAuD
tAPIYm0QqgPn0XTHBzdzASZq2f5RGokDqmqoBtxhrirokv4/ennyZUivgSunJ08/
ERJPgdi9aM02/gWhYf/L9JNS/EJNfWOCgq2W7MAMU4Sq9zEAQ6CQHpi4cJAR6w/2
PyskYk8GMA5AlCP94g38oLEIKveXX7lEdFtuVo+A93OP7XsKJKiqgZmlLStZrBMu
mRCtyWVnxbTBzHGvchJj0T9xuo77n1zJs1FvyOCthvM8OLKyg6NYA8OhOGRMqD7x
NALPNsrZPKOC2qlLkLQ66nVTP9Q42w==
=P5el
-----END PGP SIGNATURE-----

--RYJh/3oyKhIjGcML--

