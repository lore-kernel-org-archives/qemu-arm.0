Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2804032lfi;
        Thu, 26 Mar 2020 22:34:16 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtutk+AF6k7q9GQ0DpYLSKu1xk0BTJGBebILckC5tQrv85eoGk7dm92Jm/7gifkOUUvnhHz
X-Received: by 2002:a37:6808:: with SMTP id d8mr12151084qkc.4.1585287256272;
        Thu, 26 Mar 2020 22:34:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1585287256; cv=pass;
        d=google.com; s=arc-20160816;
        b=pV2jAYPDPDvoOa7DLoJIlFY5otLZXSkW83VRKwibk/Bgt5Keo4fqQhIhEOxBcyo0qD
         fZFxq1ZCYrrLFtA4gDmUmjnutOQCxc6DyGOClpVkBs7xa7kbIC73Cnzsygp25HjRmhtw
         WA5mYYo/SoxhL9Wz0AuXVQK5sN34SDu4JUQzFizd6mLdPHSjRq2JqW/nFd1s81MNe4ww
         XVLKDs7m35R4OUXVsPjeSIfErIperlL0+/yny/RKfezGYE/6AR8StYmbxzBbhAW8wIMO
         occrpKYcr/oZZ1P0WPajXfFY/+3gjPh0P5pSFUGvNUESYYpf5Xf+Aykjbs+3VpnkR8fr
         9H8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:dkim-signature:dkim-signature;
        bh=ckpQet2GRmVJlYZBPEEcGZXk62DFNmQiKiSyl2pe+ec=;
        b=pT49fqwovFE2AkYKC3p5lql8FLAL+Yq+KDTL0sZYVT8mtMl7rpcUbji8Jkozd7yvba
         qv7VfqPz7ssi4CR8tQ4BwsgrWqrFVk880gmUiKNEF4EsidehT3QHYawY27AV7Ig0B5w6
         jaQ9cHVAfRzw5Fvis7SXZKvBCGjtUgHnZkDqM3ylfsN9y9r5MdS2VVoIyOaAIySkToTO
         H6MgoXmnchZJh7cbb/i5l3cILvq8cwg1zhvJRUXvgnOJNfZ9snwo6FXME4Pd6IyiGchy
         Iy5tsxCFeyQxsfOGftNQIH4tuMRz6cMTZ+irA41rz23gqILTEJLqoV3i9fkBeNHEznRn
         NLvw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=AgecPfze;
       dkim=pass header.i=@marvell.onmicrosoft.com header.s=selector1-marvell-onmicrosoft-com header.b=GM3arHpi;
       arc=pass (i=1 spf=pass spfdomain=marvell.com dkim=pass dkdomain=marvell.com dmarc=pass fromdomain=marvell.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11si1973825qvf.221.2020.03.26.22.34.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 22:34:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@marvell.com header.s=pfpt0818 header.b=AgecPfze;
       dkim=pass header.i=@marvell.onmicrosoft.com header.s=selector1-marvell-onmicrosoft-com header.b=GM3arHpi;
       arc=pass (i=1 spf=pass spfdomain=marvell.com dkim=pass dkdomain=marvell.com dmarc=pass fromdomain=marvell.com);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=marvell.com
Received: from localhost ([::1]:37292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHhdH-0005FN-N8
	for alex.bennee@linaro.org; Fri, 27 Mar 2020 01:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45934)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2355768c4b=bbhushan2@marvell.com>)
 id 1jHhd8-0005FF-RR
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 01:34:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2355768c4b=bbhushan2@marvell.com>)
 id 1jHhd6-00059x-NY
 for qemu-arm@nongnu.org; Fri, 27 Mar 2020 01:34:06 -0400
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:56200
 helo=mx0b-0016f401.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2355768c4b=bbhushan2@marvell.com>)
 id 1jHhd6-0004wD-8Q; Fri, 27 Mar 2020 01:34:04 -0400
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
 by mx0a-0016f401.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02R5UYDi021550; Thu, 26 Mar 2020 22:34:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfpt0818;
 bh=ckpQet2GRmVJlYZBPEEcGZXk62DFNmQiKiSyl2pe+ec=;
 b=AgecPfzeA8vEB7PObYMtn1KtfFQ/GQCJCyuYpfpm7jJ3Q0TaXG7knmcbxO4N8LXiKSl2
 5RMsMHhmo+OmxrJoh5rP2TJA4jvogMXD/2wFWVAIO4y1WjwPMvtWBGONU41JFgVD5NFq
 F1zjl1gemVfaKY5k388To9Gd7G39MRSV7CkRgQpI9OxdLDdTJ1yCWlTfFQclhUFtNYhZ
 gA8Od1rgaF/kewcYPEqUUCbmKc0cZK5muyvp2JSp3fBeUTmvh2wYTXGciqCSDUiO/Ja4
 1vaV5xFB3ppUQ9niwVC+vgaZpp07M4Vj2Tour/FxDELugLBovS8Pcl+2k9lxDQYryMmq OQ== 
Received: from sc-exch02.marvell.com ([199.233.58.182])
 by mx0a-0016f401.pphosted.com with ESMTP id 2ywg9p1bsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Thu, 26 Mar 2020 22:34:00 -0700
Received: from SC-EXCH04.marvell.com (10.93.176.84) by SC-EXCH02.marvell.com
 (10.93.176.82) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 26 Mar
 2020 22:33:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by SC-EXCH04.marvell.com (10.93.176.84) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 26 Mar 2020 22:33:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hnwj6cQKIvMOZHEJ22atk9BcPT6XprFkhIY7ag7rdA00Tul1G3ESNRcmKr/qAxoOjhZvEiRZw+1t6PW1HI7dblWSAQU4wmCGdLh/h0Hk36yiXwwLyLDGJpb8XPdBTo8TvnNq8kOfgtInkwY/FdLuZjLAZpfqN/FShEwkfHi36362ApIXGCQsukNiNdAyd3QWLfF6T/u8ejrkWITkTJC/PNwF9uWB2HT00sqArz7L8pK+mft1zochRZlLnSeOjfLB911ki7abt3ZWYkg8kz8Lsh0foAFWkCv5TwII5taHozH91asnkzh1F97QJj5pqcKYRCYn2K9v8lzQc/J6+1FG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckpQet2GRmVJlYZBPEEcGZXk62DFNmQiKiSyl2pe+ec=;
 b=S6giLTEVgL45aZCAZuFcFfhKYd6XDDSeRU0d8ZFBCJ2B8eMegP3Khy9d1qYazzjJYPJsT9uD6SLzUGs1n4TuSChTbnlfZRO0kF3XM/EKYlIN6R+YN4aY4NK2bJ06qSWEE86CSP+COgKM1h7pfHEkO2MvCd3fHl1SiDcTw62rSK5RjFAs6ClCOfBKxB7fVZGTXH45PIy1lB4rYuXj1NKKAJu32YJ7ezvuvo9ShI9Nq2ervu7WpikALbWCNitjlI9bqH8j0PGL9t6zPr/BxB1bBhVKZY4QPz7JZAw33CcL5bdb6T9DY3r6JmGGDTHC5m47I2NInWrgEPE4kV7YMFaBVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckpQet2GRmVJlYZBPEEcGZXk62DFNmQiKiSyl2pe+ec=;
 b=GM3arHpi3cyY97zBTqIe8oIUDkOTBJPVF8xFa2Yx4DKWxOWAsHseATNE/6/uD6h7N5IireOMMDDF43/DpjcQLP1wDYEWJ7imP2kDFg6oMWMr+PcS6lxBeEWpcm/UUtXzkr8qp6RZxnDqCRhVOwtL9RafJa9fM796RXT8eRRw5Zs=
Received: from MWHPR1801MB1966.namprd18.prod.outlook.com (10.164.203.148) by
 MWHPR1801MB1839.namprd18.prod.outlook.com (10.164.192.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.22; Fri, 27 Mar 2020 05:33:57 +0000
Received: from MWHPR1801MB1966.namprd18.prod.outlook.com
 ([fe80::b417:ff60:caba:11a1]) by MWHPR1801MB1966.namprd18.prod.outlook.com
 ([fe80::b417:ff60:caba:11a1%7]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 05:33:57 +0000
From: Bharat Bhushan <bbhushan2@marvell.com>
To: Auger Eric <eric.auger@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "peterx@redhat.com" <peterx@redhat.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>, "mst@redhat.com"
 <mst@redhat.com>, "Tomasz Nowicki [C]" <tnowicki@marvell.com>,
 "drjones@redhat.com" <drjones@redhat.com>, "linuc.decode@gmail.com"
 <linuc.decode@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "bharatb.linux@gmail.com"
 <bharatb.linux@gmail.com>, "jean-philippe@linaro.org"
 <jean-philippe@linaro.org>, "yang.zhong@intel.com" <yang.zhong@intel.com>
Subject: RE: [EXT] Re: [PATCH v9 2/9] memory: Add interface to set iommu page
 size mask
Thread-Topic: [EXT] Re: [PATCH v9 2/9] memory: Add interface to set iommu page
 size mask
Thread-Index: AQHWAO+U287BbRFAv0SfWWGkXBLJyKhbDwUAgADe7fA=
Date: Fri, 27 Mar 2020 05:33:57 +0000
Message-ID: <MWHPR1801MB1966CDAEEB7C76ED465C10B2E3CC0@MWHPR1801MB1966.namprd18.prod.outlook.com>
References: <20200323084617.1782-1-bbhushan2@marvell.com>
 <20200323084617.1782-3-bbhushan2@marvell.com>
 <325b9322-54b9-e0ea-a67c-52fa91082173@redhat.com>
In-Reply-To: <325b9322-54b9-e0ea-a67c-52fa91082173@redhat.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [122.182.231.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 992197a2-146d-4e2d-584e-08d7d210722c
x-ms-traffictypediagnostic: MWHPR1801MB1839:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1801MB1839E62D45597339EBA4D845E3CC0@MWHPR1801MB1839.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(66946007)(86362001)(66446008)(66476007)(64756008)(52536014)(7416002)(6506007)(33656002)(53546011)(76116006)(478600001)(5660300002)(7696005)(9686003)(55016002)(26005)(66556008)(2906002)(186003)(81166006)(316002)(110136005)(8936002)(71200400001)(81156014)(8676002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR1801MB1839;
 H:MWHPR1801MB1966.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: marvell.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EA0XWTkSkhf5lX4y4bn2M36vffn66azpUE5iyNTC0liLq6WrQgakkHybOKh7deTHhvD7ULh0LLPdhw/q4qPmR9xxo6q5td/ZU3VdD0CLFaIOSI132NSAzXgHm7il6ycX2sY3l6vgWZp1AqxXscIxa7i/Nefo0TeShBN7NI4wVFyJqdW+aQewAmaR6/RIrjSit+qZFIfQMREeH8rRmxN/cn8mu41Kbc9iLiYc8Q5/5FpVgLcioVnPs9MB+OpHrCnYfpEoM/cMBSPYxnLF7Tf8RUYte7L6t9m7lvxcf2t6+PnCsSOObrG2vuPQKLNPG7eXkFI/cg8TzdRxHs7ikM4KmXEompaaQBS7DOs8XhIykMf/UTFIsH62hFDke4oJ8CCMO6ZXoIATmm7blnzQTwokMJQJKbt2qfleyRzEM4LGW+FEj3n5tpSH9YN797pocJWjnhG/t/6p7KgQfcrv/66OqBZh/JEBiOH1s8UerHmKKz8IQ6LjSkRRejDfJS5hv12K
x-ms-exchange-antispam-messagedata: VPlcWC6Oqdjkbsq30oKqRhqwTvglKgX+Kt1XQNLfsH07w+cKyvFem/dTffQUa6Dud1GIkBPNc5S3CqrvQFys5McgMxlIhv7u4kyMwTXFbCtJeL1kVLd/NOdF0mDO7wqCDIgFoe36K5vkLKWSIbTaOQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 992197a2-146d-4e2d-584e-08d7d210722c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 05:33:57.1683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyBgSu36/wEmkXIl2b7pvA9RF54T9Id5hClBnvivFY9oqlfovPKvf1T1M3RzOAuwbjUogh9SD8hTJAAXTtgVqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1801MB1839
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_14:2020-03-26,
 2020-03-26 signatures=0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.148.174
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kMs3d50jBEhS

Hi Eric,

> -----Original Message-----
> From: Auger Eric <eric.auger@redhat.com>
> Sent: Thursday, March 26, 2020 9:36 PM
> To: Bharat Bhushan <bbhushan2@marvell.com>; peter.maydell@linaro.org;
> peterx@redhat.com; eric.auger.pro@gmail.com; alex.williamson@redhat.com;
> kevin.tian@intel.com; mst@redhat.com; Tomasz Nowicki [C]
> <tnowicki@marvell.com>; drjones@redhat.com; linuc.decode@gmail.com; qemu-
> devel@nongnu.org; qemu-arm@nongnu.org; bharatb.linux@gmail.com; jean-
> philippe@linaro.org; yang.zhong@intel.com
> Subject: [EXT] Re: [PATCH v9 2/9] memory: Add interface to set iommu page=
 size
> mask
>=20
> External Email
>=20
> ----------------------------------------------------------------------
> Hi Bharat,
> On 3/23/20 9:46 AM, Bharat Bhushan wrote:
> > Allow to set page size mask to be supported by iommu.
> by iommu memory region. I mean this is not global to the IOMMU.

Yes.

> > This is required to expose page size mask compatible with host with
> > virtio-iommu.
> >
> > Signed-off-by: Bharat Bhushan <bbhushan2@marvell.com>
> > ---
> >  include/exec/memory.h | 20 ++++++++++++++++++++
> >  memory.c              | 10 ++++++++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/include/exec/memory.h b/include/exec/memory.h index
> > e85b7de99a..063c424854 100644
> > --- a/include/exec/memory.h
> > +++ b/include/exec/memory.h
> > @@ -355,6 +355,16 @@ typedef struct IOMMUMemoryRegionClass {
> >       * @iommu: the IOMMUMemoryRegion
> >       */
> >      int (*num_indexes)(IOMMUMemoryRegion *iommu);
> > +
> > +    /*
> > +     * Set supported IOMMU page size
> > +     *
> > +     * Optional method: if this is supported then set page size that
> > +     * can be supported by IOMMU. This is called to set supported page
> > +     * size as per host Linux.
> What about: If supported, allows to restrict the page size mask that can =
be
> supported with a given IOMMU memory region. For example, this allows to
> propagate host physical IOMMU page size mask limitations to the virtual I=
OMMU
> (vfio assignment with virtual iommu).

Much better=20

> > +     */
> > +     void (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
> > +                                      uint64_t page_size_mask);
> >  } IOMMUMemoryRegionClass;
> >
> >  typedef struct CoalescedMemoryRange CoalescedMemoryRange; @@ -1363,6
> > +1373,16 @@ int
> memory_region_iommu_attrs_to_index(IOMMUMemoryRegion *iommu_mr,
> >   */
> >  int memory_region_iommu_num_indexes(IOMMUMemoryRegion *iommu_mr);
> >
> > +/**
> > + * memory_region_iommu_set_page_size_mask: set the supported pages
> > + * size by iommu.
> supported page sizes for a given IOMMU memory region
> > + *
> > + * @iommu_mr: the memory region
> IOMMU memory region
> > + * @page_size_mask: supported page size mask  */ void
> > +memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion
> *iommu_mr,
> > +                                            uint64_t page_size_mask);
> > +
> >  /**
> >   * memory_region_name: get a memory region's name
> >   *
> > diff --git a/memory.c b/memory.c
> > index aeaa8dcc9e..14c8783084 100644
> > --- a/memory.c
> > +++ b/memory.c
> > @@ -1833,6 +1833,16 @@ static int
> memory_region_update_iommu_notify_flags(IOMMUMemoryRegion
> *iommu_mr,
> >      return ret;
> >  }
> >
> > +void memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion
> *iommu_mr,
> > +                                            uint64_t page_size_mask)
> > +{
> > +    IOMMUMemoryRegionClass *imrc =3D
> > +IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> > +
> > +    if (imrc->iommu_set_page_size_mask) {
> > +        imrc->iommu_set_page_size_mask(iommu_mr, page_size_mask);
> Shouldn't it return an int in case the setting cannot be applied?

iommu_set_page_size_mask() is setting page-size-mask for endpoint. Below fu=
nction from code

	static void virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
              	                              uint64_t page_size_mask)
	{
    		IOMMUDevice *sdev =3D container_of(mr, IOMMUDevice, iommu_mr);

	              sdev->page_size_mask =3D page_size_mask;
	}

Do you see any reason it cannot be applied, am I missing something?

Thanks
-Bharat

> > +    }
> > +}
> > +
> >  int memory_region_register_iommu_notifier(MemoryRegion *mr,
> >                                            IOMMUNotifier *n, Error
> > **errp)  {
> >
> Thanks
> Eric

