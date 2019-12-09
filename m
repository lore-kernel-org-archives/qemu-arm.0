Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4693157lff;
        Mon, 9 Dec 2019 09:39:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqzrUeS4chF5htTxMQhBnV0HNXhUipqHA0KsAnar7r1qo3pAjNwHYa+Y/vIZr3zfZN0hauMT
X-Received: by 2002:a9d:413:: with SMTP id 19mr22660760otc.11.1575913171154;
        Mon, 09 Dec 2019 09:39:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575913171; cv=none;
        d=google.com; s=arc-20160816;
        b=yZ9VYsC/RxriTA0OQiutnSgUyVupgS03Xqf5gmVl349GrVEkqKPop7UbTFjLjbhfm9
         ujw4Dv9VASXbn7cKJoJY0gwFNWhIg5lLeXeY1W5q+0Uqj/RJqgaZpETUCAtGkJqH4O5e
         +eYOmpeNZSi22I8ewbn/6st6vDZTyPsMfL6MXwGhXtGygewgQt0rQejW3Jk+q0rwC6iL
         qxMKuJ1ZyztFGxew2t7PgwKmFVSEelzxmNIkQnNbMJdDXKTyUqkDdzbz3vrrOfNuWCMg
         uLrDzy9PgrJuFV2Rj0TFzBkNtL1pdyDZR32aP486JNhrms5BgAZxJ9qDBN/RSmplHzkX
         P2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from;
        bh=SpJtUR4mfOpyy6WTKaMc2WyCzjaEYjw4J+DIbBygzXI=;
        b=cmFYydgmqgFChQlxIdCa5jP+0H2gOec3RVt8+Po6TKwkI7K5eoMUoiqMHcPzDnGuo+
         9Wnk0Gn9mTtIS7giagVZ4L6oJArqPIhABX+4Z6IaYH/j2vcd2cgJ1rRkYvEZfOM0kGkc
         4Z7OG3l6P4e6kkMg+28KkGGFfQjToBHVwhawMsIOEym4XpkEtZvAlezrAJl6bAIzVqcD
         1DrPOrRV1nhx+OSORRrl1NXushydmrpX1tXqXgcDank7EP492XjAfvHP3OHnwBG9pBfe
         ago8nfFq8AqzIk6epzWZK9NyPoqk61Dd6R21oqwoMUppvyXD7QFgHw4BG5QUNid3xaC/
         OWmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j71si260985oib.213.2019.12.09.09.39.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 09:39:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieN0M-0005jz-5U
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 12:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ieN0C-0005jR-UH
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:39:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ieN0B-0006Ks-JA
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 12:39:20 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2056 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ieN0B-0006Je-DP; Mon, 09 Dec 2019 12:39:19 -0500
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id 6CD5060A903E0C8C1D2D;
 Mon,  9 Dec 2019 17:39:16 +0000 (GMT)
Received: from lhreml704-chm.china.huawei.com (10.201.108.53) by
 lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 9 Dec 2019 17:39:16 +0000
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 lhreml704-chm.china.huawei.com (10.201.108.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Mon, 9 Dec 2019 17:39:15 +0000
Received: from lhreml710-chm.china.huawei.com ([169.254.81.184]) by
 lhreml710-chm.china.huawei.com ([169.254.81.184]) with mapi id
 15.01.1713.004; Mon, 9 Dec 2019 17:39:16 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, "xiaoguangrong.eric@gmail.com"
 <xiaoguangrong.eric@gmail.com>
Subject: RE: [PATCH 0/5] ARM virt: Add NVDIMM support
Thread-Topic: [PATCH 0/5] ARM virt: Add NVDIMM support
Thread-Index: AQHVeswdQv2zL2ZjnU2+5S1CywnCCKdgnucAgAYn2ECANV3CUIAANK6AgAADjLCAARyUgIADW0wAgBGftAA=
Date: Mon, 9 Dec 2019 17:39:15 +0000
Message-ID: <c2bb0be09e244ee59d27c7aaab1783a9@huawei.com>
References: <20191004155302.4632-1-shameerali.kolothum.thodi@huawei.com>
 <a133d4c4-3f60-2bb1-a7d7-35cdb06af265@redhat.com>
 <441c818f24084b4191315cf2a6267cef@huawei.com>
 <20191125164541.3f0a593f@redhat.com>
 <444efcb441fe42e5aff58b3af3ab14b4@huawei.com>
 <20191126095655.27227f59@redhat.com> 
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
 "drjones@redhat.com" <drjones@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 Linuxarm <linuxarm@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Auger Eric <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +aAqst3PF2aQ

Hi Igor/ xiaoguangrong,

> -----Original Message-----
> From: Shameerali Kolothum Thodi
> Sent: 28 November 2019 12:36
> To: 'Igor Mammedov' <imammedo@redhat.com>;
> xiaoguangrong.eric@gmail.com
> Cc: peter.maydell@linaro.org; drjones@redhat.com;
> shannon.zhaosl@gmail.com; qemu-devel@nongnu.org; Linuxarm
> <linuxarm@huawei.com>; Auger Eric <eric.auger@redhat.com>;
> qemu-arm@nongnu.org; xuwei (O) <xuwei5@huawei.com>;
> lersek@redhat.com
> Subject: RE: [PATCH 0/5] ARM virt: Add NVDIMM support
>=20
>=20
>=20
> > -----Original Message-----
> > From: Qemu-devel
> >
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nongn
> > u.org] On Behalf Of Igor Mammedov
> > Sent: 26 November 2019 08:57
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: peter.maydell@linaro.org; drjones@redhat.com;
> > xiaoguangrong.eric@gmail.com; shannon.zhaosl@gmail.com;
> > qemu-devel@nongnu.org; Linuxarm <linuxarm@huawei.com>; Auger Eric
> > <eric.auger@redhat.com>; qemu-arm@nongnu.org; xuwei (O)
> > <xuwei5@huawei.com>; lersek@redhat.com
> > Subject: Re: [PATCH 0/5] ARM virt: Add NVDIMM support
>=20
> [..]
>=20
> > > > 0xb8 Dirty No.  -->Another read is attempted
> > > > > [Qemu]NVDIMM:nvdimm_dsm_func_read_fit: read_fit_out buf size 0x8
> > > > func_ret_status 3  --> Error status returned
> > > >
> > > > status 3 means that QEMU didn't like content of NRAM, and there is =
only
> > > > 1 place like this in nvdimm_dsm_func_read_fit()
> > > >     if (read_fit->offset > fit->len) {
> > > >         func_ret_status =3D NVDIMM_DSM_RET_STATUS_INVALID;
> > > >         goto exit;
> > > >     }
> > > >
> > > > so I'd start looking from here and check that QEMU gets expected da=
ta
> > > > in nvdimm_dsm_write(). In other words I'd try to trace/compare
> > > > content of DSM buffer (from qemu side).
> > >
> > > I had printed the DSM buffer previously and it looked same, I will do=
uble
> check
> > > that.
>=20
> Tried printing the buffer in both Qemu/AML code.
>=20
> On Amr64,

[...]
=20
> Attached the SSDT.dsl used for debugging. I am still not clear why on ARM=
64,
> 2nd iteration case, the created buffer size in NCAL and RFIT methods have
> additional 4 bytes!.
>=20
>     CreateField (ODAT, Zero, Local1, OBUF)
>     Concatenate (Buffer (Zero){}, OBUF, Local7)
>=20
> Please let me know if you have any clue.
>=20

I couldn't figure out yet, why this extra 4 bytes are added by aml code on =
ARM64
when the nvdimm_dsm_func_read_fit() returns NvdimmFuncReadFITOut without
any FIT data. ie, when the FIT buffer len (read_len) is zero.

But the below will fix this issue,

diff --git a/hw/acpi/nvdimm.c b/hw/acpi/nvdimm.c
index f91eea3802..cddf95f4c1 100644
--- a/hw/acpi/nvdimm.c
+++ b/hw/acpi/nvdimm.c
@@ -588,7 +588,7 @@ static void nvdimm_dsm_func_read_fit(NVDIMMState *state=
, NvdimmDsmIn *in,
     nvdimm_debug("Read FIT: offset %#x FIT size %#x Dirty %s.\n",
                  read_fit->offset, fit->len, fit_buf->dirty ? "Yes" : "No"=
);

-    if (read_fit->offset > fit->len) {
+    if (read_fit->offset >=3D fit->len) {
         func_ret_status =3D NVDIMM_DSM_RET_STATUS_INVALID;
         goto exit;
     }


This will return error code to aml in the second iteration when there is no=
 further
FIT data to report. But, I am not sure why this check was omitted in the fi=
rst place.

Please let me know if this is acceptable and then probably I can look into =
a v2 of this
series.

Thanks,
Shameer



