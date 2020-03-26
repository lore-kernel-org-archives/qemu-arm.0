Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1864452lfi;
        Thu, 26 Mar 2020 05:58:41 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv4uLftO2536xQhKgbEk4agi8Ytt60noGsHNJSrO9v9MkBtclJIzjL8DZKAfkqXGKk/wZhQ
X-Received: by 2002:aed:20e3:: with SMTP id 90mr7871744qtb.142.1585227521044;
        Thu, 26 Mar 2020 05:58:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585227521; cv=none;
        d=google.com; s=arc-20160816;
        b=z52DynICQzJ6Dk0+bTWkil12xk4TbLCXEDFDm3GkMvYaJ1Xf878aW/WYpBdaKTjTpW
         3cy3OlCxSqmU9eWagvW+Dq25ltYTnKgMbnoxUTvFGkmO+5UlAR7kxKZ5L8zlLUBtCUP2
         TwvEvVc3dKZGCUxRDQOJC7sfHBndYny1TtR/33V7zbYTvpni2mJYoFYkRVBrtJLwbouc
         aFzuff2CZ1qVM7OT26OlgNE9fjgsZagVIyGzrjiKi5a7Gbr7MWnUq/wFbts0tpFzo9cF
         zoVeSpBbZlMORpa9vT5RE6U/xj0MLLLkElqPL0yrqfiCEYS1fHqtR9WzA5ykMUDxGgM7
         LAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:ironport-sdr
         :ironport-sdr;
        bh=g+WLEaUArkZRtILj1aHpFyi5USAuWiRgAmhQQ2mSLa8=;
        b=s2axG6y6uMZNkQW+ypI7VF8tdJVmMk8IfTOUvUSWrDEiUFwcK1HD4ZzWAP8nWu96xs
         BQwU1cGAZyITeYrS1ykOX3VQ4GQFITTCLnicysWZcfp/o6uiV2ylCB4skXJxWFBNvIWf
         oxQs5ZBurGf4/BxwqRmm8p010VZZGCYZTIxI8P9/rO5g6k6vu4sajFEUsU+2ur4B5jCz
         TSJJM1S1OSYjTlcHjfLANdK7uT3cKk/zLn2b1fdzH6PzEH1dpNwEsWSDY7aU+EbuG279
         f8CSLkfev5rxgtnpq7mqjqnbYcmZmkWKJit8eLFG9wiQs8jzhz2ymw9jQCQ2zt5Kksq/
         luVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p47si1172779qtb.64.2020.03.26.05.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 05:58:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:51010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHS5o-0006lG-Gk
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 08:58:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49278)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yi.l.liu@intel.com>) id 1jHS5g-0006i8-J3
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 08:58:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yi.l.liu@intel.com>) id 1jHS5c-0006fU-J0
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 08:58:32 -0400
Received: from mga17.intel.com ([192.55.52.151]:14599)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <yi.l.liu@intel.com>)
 id 1jHS5Z-0006ap-6Y; Thu, 26 Mar 2020 08:58:25 -0400
IronPort-SDR: T1teCXClYK8nLHUXsxmHfMTrDS2PxIJvcGOOHv/dqzhUNKwK60UVPJIDHRrML7H4rqGx0MurKi
 1Q4Ttefepx9Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 05:58:20 -0700
IronPort-SDR: O25GPqu9zdTdvlw2uc9GXZpHYSbvS8/6PjRrWR8kPtE+pIdaB2LWPOeCPepcaLgYqDI2Fnl1Mc
 cdyIjytpu51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,308,1580803200"; d="scan'208";a="282488364"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2020 05:58:20 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 05:58:20 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 05:58:20 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.145]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 20:58:18 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Eric Auger <eric.auger@redhat.com>, "eric.auger.pro@gmail.com"
 <eric.auger.pro@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "mst@redhat.com" <mst@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>
Subject: RE: [RFC v6 01/24] update-linux-headers: Import iommu.h
Thread-Topic: [RFC v6 01/24] update-linux-headers: Import iommu.h
Thread-Index: AQHV/tjqulacwOwv+ki+tG8kmRIeoKha3mEg
Date: Thu, 26 Mar 2020 12:58:17 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A204428@SHSMSX104.ccr.corp.intel.com>
References: <20200320165840.30057-1-eric.auger@redhat.com>
 <20200320165840.30057-2-eric.auger@redhat.com>
In-Reply-To: <20200320165840.30057-2-eric.auger@redhat.com>
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
X-Received-From: 192.55.52.151
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
X-TUID: HUQFuF2N3drV

> From: Eric Auger <eric.auger@redhat.com>
> Sent: Saturday, March 21, 2020 12:58 AM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-devel@nongnu.or=
g;
> Subject: [RFC v6 01/24] update-linux-headers: Import iommu.h
>=20
> Update the script to import the new iommu.h uapi header.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  scripts/update-linux-headers.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-heade=
rs.sh index
> 29c27f4681..5b64ee3912 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -141,7 +141,7 @@ done
>=20
>  rm -rf "$output/linux-headers/linux"
>  mkdir -p "$output/linux-headers/linux"
> -for header in kvm.h vfio.h vfio_ccw.h vhost.h \
> +for header in kvm.h vfio.h vfio_ccw.h vhost.h iommu.h \
>                psci.h psp-sev.h userfaultfd.h mman.h; do
>      cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
>  done

Hi Eric,

This patch already got acked by from Cornelia. :-)

https://patchwork.ozlabs.org/patch/1259643/

Regards,
Yi Liu
