Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3610866lfi;
        Mon, 30 Mar 2020 23:35:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu2Zjctz+unEIKp9CIMH33TjMoxBwasmVfUM4zvAOyUUtXPT/DqYcXBtjawp2JrY1rfMric
X-Received: by 2002:a0c:fdc3:: with SMTP id g3mr6183583qvs.184.1585636510024;
        Mon, 30 Mar 2020 23:35:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585636510; cv=none;
        d=google.com; s=arc-20160816;
        b=hqE94fk/gBxHEuXQxtPsweaMMl/DFNo/r9w2O84FjphkooGNUNgxYl11sHvC5tSe6T
         BfPKviuoH1ZTTxLPUZZlTziK32ch/d4+QsGj4/79aeHUqv+TgRkp22VFeA/avN0B7eXQ
         uVCx8ft8mKyoO/qybiDM6l2vpQEfq4NgWTKngShJhsudEUXlR+Vku4FXavaEzQevFEta
         yRcwYPIIbPFG5DphKX0nAGGoAsmtRvylpec7xzxKbQ4cPpKBl/g7c21a+3iz9bqH8pTM
         6dQSO0PFGN4x1pqJcoLDl6/61N8ZUYxagki5eFM/fBVLyCCoFsHrfjtB1EbgzrG89QJ0
         nA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:ironport-sdr
         :ironport-sdr;
        bh=a3ztng2oh9sKLpnYXbwjqtA+D3LmleazR9t7dHGI7Go=;
        b=E/gS7gKcFuz04K1/TdUZDqoFO8GJeDrDu8bmgnbLeaPbQUO81R3gLbPBL7/ZhuFofe
         1Xh/hOurxnX34ctqHu2yi4sIPOTkk9swLakmO5KEzRFz8rf6Y+XJKakEY4jRnZ1KBPHv
         wP2u/zFwRfgogjk9Y/bKBKmHuDajZNGF1RArCoDamvGQDqJrpb0qe27OgEF/8tc0FVWs
         QqBE2n8sb9clU6xvypato5sTSOH2K9ul74JUNMvwa0u/HsbxKTq8X4axr5HEPHfWRYv/
         9Mb7Ce6A3tOoHkHGF0dwFkyRPIbje0yU71O1iPkQzT4LdoBN3xyxuiO2gNpyGTUylELf
         isjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z54si2225765qtz.178.2020.03.30.23.35.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 23:35:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:32836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJAUP-0003Qk-DF
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 02:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1jJAUH-0003O4-5o
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 02:35:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1jJAUF-0005Ba-Uf
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 02:35:01 -0400
Received: from mga03.intel.com ([134.134.136.65]:58702)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>)
 id 1jJAUC-00056n-N5; Tue, 31 Mar 2020 02:34:56 -0400
IronPort-SDR: J1dGsHU307ViwV6HFf+yj67v87+Pd508GIxMt00+zqvvRLq6RaIQZ2fpjM021WyalFtLCgLxzd
 WoZhtAjFw+Rg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 23:34:52 -0700
IronPort-SDR: T8BVdaiCpI80rxSWdUpaNaD2gb5xZvhpuIIUY5ylnn7730BWU21UP8A6lKlY/m/J0WPSJA+tjh
 QI1iUCdXjU+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; d="scan'208";a="395390940"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga004.jf.intel.com with ESMTP; 30 Mar 2020 23:34:52 -0700
Received: from fmsmsx162.amr.corp.intel.com (10.18.125.71) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Mar 2020 23:34:35 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx162.amr.corp.intel.com (10.18.125.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Mar 2020 23:34:35 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.138]) with mapi id 14.03.0439.000;
 Tue, 31 Mar 2020 14:34:33 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>
Subject: RE: [RFC v6 09/24] vfio: Force nested if iommu requires it
Thread-Topic: [RFC v6 09/24] vfio: Force nested if iommu requires it
Thread-Index: AQHV/tkoyufwzZuw+kOQFrVm2InyoqhiSCKw
Date: Tue, 31 Mar 2020 06:34:32 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A21A69E@SHSMSX104.ccr.corp.intel.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
 <20200320165840.30057-10-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-10-eric.auger@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 134.134.136.65
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
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "tnowicki@marvell.com" <tnowicki@marvell.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "zhangfei.gao@foxmail.com" <zhangfei.gao@foxmail.com>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 "bbhushan2@marvell.com" <bbhushan2@marvell.com>,
 "will@kernel.org" <will@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OC+lubd+8+xt

Hi Eric,

> From: Eric Auger <eric.auger@redhat.com>
> Sent: Saturday, March 21, 2020 12:58 AM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-devel@nongnu.or=
g;
> Subject: [RFC v6 09/24] vfio: Force nested if iommu requires it
>=20
> In case we detect the address space is translated by
> a virtual IOMMU which requires HW nested paging to
> integrate with VFIO, let's set up the container with
> the VFIO_TYPE1_NESTING_IOMMU iommu_type.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>=20
> ---
>=20
> v4 -> v5:
> - fail immediatly if nested is wanted but not supported
>=20
> v2 -> v3:
> - add "nested only is selected if requested by @force_nested"
>   comment in this patch
> ---
>  hw/vfio/common.c | 36 ++++++++++++++++++++++++++++--------
>  1 file changed, 28 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 0b3593b3c0..ac417b5dbd 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1155,27 +1155,38 @@ static void vfio_put_address_space(VFIOAddressSpa=
ce
> *space)
>   * vfio_get_iommu_type - selects the richest iommu_type (v2 first)
>   */
>  static int vfio_get_iommu_type(VFIOContainer *container,
> +                               bool want_nested,
>                                 Error **errp)
>  {
> -    int iommu_types[] =3D { VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
> +    int iommu_types[] =3D { VFIO_TYPE1_NESTING_IOMMU,
> +                          VFIO_TYPE1v2_IOMMU, VFIO_TYPE1_IOMMU,
>                            VFIO_SPAPR_TCE_v2_IOMMU, VFIO_SPAPR_TCE_IOMMU =
};
> -    int i;
> +    int i, ret =3D -EINVAL;
>=20
>      for (i =3D 0; i < ARRAY_SIZE(iommu_types); i++) {
>          if (ioctl(container->fd, VFIO_CHECK_EXTENSION, iommu_types[i])) =
{
> -            return iommu_types[i];
> +            if (iommu_types[i] =3D=3D VFIO_TYPE1_NESTING_IOMMU && !want_=
nested) {
> +                continue;
> +            }
> +            ret =3D iommu_types[i];
> +            break;
>          }
>      }
> -    error_setg(errp, "No available IOMMU models");
> -    return -EINVAL;
> +    if (ret < 0) {
> +        error_setg(errp, "No available IOMMU models");
> +    } else if (want_nested && ret !=3D VFIO_TYPE1_NESTING_IOMMU) {
> +        error_setg(errp, "Nested mode requested but not supported");
> +        ret =3D -EINVAL;
> +    }
> +    return ret;
>  }
>=20
>  static int vfio_init_container(VFIOContainer *container, int group_fd,
> -                               Error **errp)
> +                               bool want_nested, Error **errp)
>  {
>      int iommu_type, ret;
>=20
> -    iommu_type =3D vfio_get_iommu_type(container, errp);
> +    iommu_type =3D vfio_get_iommu_type(container, want_nested, errp);
>      if (iommu_type < 0) {
>          return iommu_type;
>      }
> @@ -1211,6 +1222,14 @@ static int vfio_connect_container(VFIOGroup *group=
,
> AddressSpace *as,
>      VFIOContainer *container;
>      int ret, fd;
>      VFIOAddressSpace *space;
> +    IOMMUMemoryRegion *iommu_mr;
> +    bool nested =3D false;
> +
> +    if (as !=3D &address_space_memory && memory_region_is_iommu(as->root=
)) {

I tried on my side. For virtual VT-d, it doesn't work as in intel_iommu,
we have a dynamic switch mechanism. Thus that, the
memory_region_is_iommu(as->root) won't return true as expected. I'm afraid
it doesn't work for virtual VT-d.  So firstly, I'm wondering if
as !=3D &address_space_memory is enough. Secondly, I'm considering if it is
good to let vfio_get_group() caller to provide a hint whether vIOMMU is
exposed. e.g. vfio_realize() in vfio/pci.c could figure out whether vIOMMU
is set easily. Thoughts?

Regards,
Yi Liu
