Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp621650lfc;
        Tue, 10 Mar 2020 04:22:25 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs/U4VL98vsC1v+hJlLM9XGhygsoCnnuYrzINgz7oLJUSvl1DRrOcSNL7hKI3ALMroPsbrr
X-Received: by 2002:a05:620a:11aa:: with SMTP id c10mr9036862qkk.375.1583839344999;
        Tue, 10 Mar 2020 04:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583839344; cv=none;
        d=google.com; s=arc-20160816;
        b=x4EhyvzglBPp5AoNomL0I+D8Q918872vllxApDZ+WlL/t1ag5EBiUWgg/6YWN/LWMM
         Oyfi7VYZFiGbZ/2WnY76BBOrcMuov5U3BMhztbd9j/3Qyh/gJrUEPCDE9yN21BomB7C1
         yy0aDbB2+1LXUIQnnUy+oC8oBAFflGIvHd97gC4/m7a9LkRN1e71GJ6uf1KsWB30uOw6
         HyKPLbogsSpDwKyrJfVrkUAxeL1Nb0Ttr6ubWaw9turygIK1kFmCZxJrLV1o56TGWKGP
         IpOpvXFAwFkyBw15mUdbbthIB04KNg3oFXJRohNgEozF6LX4Hp65Xomvs4S9t2pSAAXn
         aaAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=4puEK39gq43YrhgkTUDpnOiQGrjY951fbKvYaHNgZWE=;
        b=0w32TMq0/EABPH7NlGLvaGDvlSLQUpVuRQyy5fd70zohZee5KjRrX2KBIjpc9YhVyD
         jO+3GlqzylwT0w9QzfmaafRGsE2JrQ86scLda3Smk8/iwBKOnhbZ2PKVzEwX4R53j5MZ
         CWTvY+m7ly8Co1MGsTuX73Yn+E3q/HMDy+nqzbg8jY7O++1Vdre3eseOEVHiKfSHhhbS
         Akan0F0jknper09HnRi3rflmxtU+Gjb62ux+YtTEQT9lAaYQyw/3EM5Gmm7I0Tq9TyNF
         k33wFADpBFYI+YTJUwOVqHP8srjVR3Fsq9JDfYvQMEVG8rmZTPvIHhL1plPxvjqUM/2P
         AqCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c8si2527521qvm.180.2020.03.10.04.22.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Mar 2020 04:22:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBcxs-0006zG-DH
	for alex.bennee@linaro.org; Tue, 10 Mar 2020 07:22:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jBcxh-0006ww-W7
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 07:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jBcxg-0007sw-Dr
 for qemu-arm@nongnu.org; Tue, 10 Mar 2020 07:22:13 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2080 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jBcxg-0007gK-6j; Tue, 10 Mar 2020 07:22:12 -0400
Received: from LHREML712-CAH.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id B6295C1C3748F61208F1;
 Tue, 10 Mar 2020 11:22:05 +0000 (GMT)
Received: from lhreml707-chm.china.huawei.com (10.201.108.56) by
 LHREML712-CAH.china.huawei.com (10.201.108.35) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 10 Mar 2020 11:22:05 +0000
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml707-chm.china.huawei.com (10.201.108.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Tue, 10 Mar 2020 11:22:04 +0000
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1713.004; Tue, 10 Mar 2020 11:22:05 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: RE: [PATCH v2 2/7] hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM
 output buffer length
Thread-Topic: [PATCH v2 2/7] hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM
 output buffer length
Thread-Index: AQHV3Qdz5JGOPsnNwE6dDrrHrA5o8ahB4dxg
Date: Tue, 10 Mar 2020 11:22:05 +0000
Message-ID: <feb0b61b1bf741219e08b8c2dc6260f8@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-3-shameerali.kolothum.thodi@huawei.com>
 <20200206170604.12899caf@redhat.com>
In-Reply-To: <20200206170604.12899caf@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 185.176.76.210
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei
 \(O\)" <xuwei5@huawei.com>, "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wBoA8OTnjMPr



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 06 February 2020 16:06
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> xiaoguangrong.eric@gmail.com; mst@redhat.com; Linuxarm
> <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
> shannon.zhaosl@gmail.com; lersek@redhat.com
> Subject: Re: [PATCH v2 2/7] hw/acpi/nvdimm: Fix for NVDIMM incorrect DSM
> output buffer length
>=20
> On Fri, 17 Jan 2020 17:45:17 +0000
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > As per ACPI spec 6.3, Table 19-419 Object Conversion Rules, if the
> > Buffer Field <=3D to the size of an Integer (in bits), it will be
> > treated as an integer. Moreover, the integer size depends on DSDT
> > tables revision number. If revision number is < 2, integer size is 32
> > bits, otherwise it is 64 bits. Current NVDIMM common DSM aml code
> > (NCAL) uses CreateField() for creating DSM output buffer. This creates
> > an issue in arm/virt platform where DSDT revision number is 2 and
> > results in DSM buffer with a wrong
> > size(8 bytes) gets returned when actual length is < 8 bytes.
> > This causes guest kernel to report,
> >
> > "nfit ACPI0012:00: found a zero length table '0' parsing nfit"
> >
> > In order to fix this, aml code is now modified such that it builds the
> > DSM output buffer in a byte by byte fashion when length is smaller
> > than Integer size.
> >
> > Suggested-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> > Please find the previous discussion on this here,
> > https://patchwork.kernel.org/cover/11174959/
> >
> > ---
> >  hw/acpi/nvdimm.c                            | 36
> +++++++++++++++++++--
> >  tests/qtest/bios-tables-test-allowed-diff.h |  2 ++
> >  2 files changed, 35 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c index
> > 9fdad6dc3f..5e7b8318d0 100644
> > --- a/hw/acpi/nvdimm.c
> > +++ b/hw/acpi/nvdimm.c
> > @@ -964,6 +964,7 @@ static void nvdimm_build_common_dsm(Aml *dev)
> >      Aml *method, *ifctx, *function, *handle, *uuid, *dsm_mem,
> *elsectx2;
> >      Aml *elsectx, *unsupport, *unpatched, *expected_uuid, *uuid_invali=
d;
> >      Aml *pckg, *pckg_index, *pckg_buf, *field, *dsm_out_buf,
> > *dsm_out_buf_size;
> > +    Aml *whilectx, *offset;
> >      uint8_t byte_list[1];
> >
> >      method =3D aml_method(NVDIMM_COMMON_DSM, 5,
> AML_SERIALIZED); @@
> > -1117,13 +1118,42 @@ static void nvdimm_build_common_dsm(Aml *dev)
> >      /* RLEN is not included in the payload returned to guest. */
> >      aml_append(method,
> aml_subtract(aml_name(NVDIMM_DSM_OUT_BUF_SIZE),
> >                 aml_int(4), dsm_out_buf_size));
> > +
> > +    /*
> > +     * As per ACPI spec 6.3, Table 19-419 Object Conversion Rules, if
> > +     * the Buffer Field <=3D to the size of an Integer (in bits), it w=
ill
> > +     * be treated as an integer. Moreover, the integer size depends on
> > +     * DSDT tables revision number. If revision number is < 2, integer
> > +     * size is 32 bits, otherwise it is 64 bits.
> > +     * Because of this CreateField() canot be used if RLEN < Integer S=
ize.
> > +     * Hence build dsm_out_buf byte by byte.
> > +     */
> > +    ifctx =3D aml_if(aml_lless(dsm_out_buf_size,
> > + aml_sizeof(aml_int(0))));
>=20
> this decomplies into
>=20
>  If (Local1 < SizeOf ())
>=20
> which doesn't look right

Ok. I tried printing the value returned(SizeOf) and that looks alright.

Anyway, changed it into aml_int(1) which decompiles to

   If (Local1 < SizeOf (One))

Hope this is acceptable.

Thanks,
Shameer
