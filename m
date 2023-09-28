Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp2660160ejc;
        Thu, 28 Sep 2023 09:04:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhZqSqDc3Au8trMTA0kGlenMky5+hZtsjtZnOYhMu17Z8ZPEsHeeA06EuRvUB+o+vzmTyo
X-Received: by 2002:a0c:b450:0:b0:64f:5261:55e9 with SMTP id e16-20020a0cb450000000b0064f526155e9mr1495077qvf.41.1695917074603;
        Thu, 28 Sep 2023 09:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695917074; cv=none;
        d=google.com; s=arc-20160816;
        b=hAm1Bza8qN+Quk3hiJ2HDedLqt5LEsvobcF0A8HhEdRV9Yy0gWNazIPnitDb6s9TSQ
         MeXPtf9VhvahWBrAM7NfnD9xIcPrxt41g5rBPB8wcnvWSBJe+G6bInm9Al9wWWWaSOB1
         Y5HeyEBldOMb7jXjyoQES8xZHiWjumlonGrklD9SN0mSDHJh6Lwl3qMtsbsNFhsxH3DH
         3cxEhGi7zV9M+gymnZi9sfyIPpoxMjdXJG10qbavuZVoV1zYXlT5MFtYD8r7ydn+LRlm
         qVMEC3OwmaPbzlPsbX5EcBH0aC+Ks1baoOl98+bWacwWHFcWkL9+P1oACaYJutjZ86cC
         HhpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=ZOQgVLsbuMrPSf/Jx0DHkFlYs9kb8w8JidOeEoT1pYE=;
        fh=ZRCWf4yV3eAZ19vKH9ehB5dJBKziwZ+00wdEL38TX7Y=;
        b=pO7LGtU2yN208mlfqIfIS5X83ADnGXOQgJMNAtY2Z2nC6R2nrzQrGxHNjtZrhybFnH
         /FunjBP4Bx3FO4yHY6fNrNucaxZJH8y2tkuib/ohCauCaBlJ2XWJ0FqRyD6edAjLsTSn
         Aqk0ipw2aqAMhBa9NB8udsfpvgHE5UWU1ye2u5dUBiJYBVZyE7cjkNFhre+tZ2AL5+S+
         9YlzTGoPQ3yGw1jpz5NTLRFJHxNpguGwlcIEq3kqwVDH0ijEywlSgOL1zhulEYA/jmpO
         KtxkUGC0GBi4UnoNk+ABhzSQTOpS3c5xE8EuzdjcGMeL7GTilJcWqbabUE7HcGBkv14B
         nagw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2-20020a0ce282000000b0065b1ded1828si3399724qvl.202.2023.09.28.09.04.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Sep 2023 09:04:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qltV4-0001dl-22; Thu, 28 Sep 2023 12:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qltV2-0001dJ-AG; Thu, 28 Sep 2023 12:04:24 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qltUz-0008WC-9X; Thu, 28 Sep 2023 12:04:23 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RxJBl2hjPz6HJmr;
 Fri, 29 Sep 2023 00:01:51 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 28 Sep
 2023 17:04:16 +0100
Date: Thu, 28 Sep 2023 17:04:15 +0100
To: Vikram Sethi <vsethi@nvidia.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>, David Hildenbrand
 <david@redhat.com>, =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, Andy Currid <ACurrid@nvidia.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, Gavin Shan <gshan@redhat.com>, "ira.weiny@intel.com"
 <ira.weiny@intel.com>, "navneet.singh@intel.com" <navneet.singh@intel.com>,
 Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
Message-ID: <20230928170415.00005190@Huawei.com>
In-Reply-To: <BYAPR12MB33369DCC79212D6040F00560BDC2A@BYAPR12MB3336.namprd12.prod.outlook.com>
References: <d09b3df6-74f8-c93b-b26e-59de5b2dd114@redhat.com>
 <20230915084754.4b49d5c0.alex.williamson@redhat.com>
 <f129b30b-bd0c-4e30-6be9-384b2b79a26b@redhat.com>
 <BY5PR12MB3763FA9922B9059DC14CA80DB0FFA@BY5PR12MB3763.namprd12.prod.outlook.com>
 <b67c18d1-a648-81bc-1144-33fb839f2aa3@redhat.com>
 <BY5PR12MB37636F9E84CF92020769D859B0C3A@BY5PR12MB3763.namprd12.prod.outlook.com>
 <769b577a-65b0-dbfe-3e99-db57cea08529@redhat.com>
 <20230926131427.1e441670.alex.williamson@redhat.com>
 <BY5PR12MB37630E29E6E83BCD63FB3F2BB0C2A@BY5PR12MB3763.namprd12.prod.outlook.com>
 <20230927123318.00005aad@Huawei.com>
 <20230927135336.GA339126@nvidia.com>
 <20230927082434.3583361c.alex.williamson@redhat.com>
 <BYAPR12MB33369DCC79212D6040F00560BDC2A@BYAPR12MB3336.namprd12.prod.outlook.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9z987zl0ZpjY

On Wed, 27 Sep 2023 15:03:09 +0000
Vikram Sethi <vsethi@nvidia.com> wrote:

> > From: Alex Williamson <alex.williamson@redhat.com>
> > Sent: Wednesday, September 27, 2023 9:25 AM
> > To: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>; Ankit Agrawal
> > <ankita@nvidia.com>; David Hildenbrand <david@redhat.com>; C=E9dric Le
> > Goater <clg@redhat.com>; shannon.zhaosl@gmail.com;
> > peter.maydell@linaro.org; ani@anisinha.ca; Aniket Agashe
> > <aniketa@nvidia.com>; Neo Jia <cjia@nvidia.com>; Kirti Wankhede
> > <kwankhede@nvidia.com>; Tarun Gupta (SW-GPU) <targupta@nvidia.com>;
> > Vikram Sethi <vsethi@nvidia.com>; Andy Currid <ACurrid@nvidia.com>;
> > qemu-arm@nongnu.org; qemu-devel@nongnu.org; Gavin Shan
> > <gshan@redhat.com>; ira.weiny@intel.com; navneet.singh@intel.com
> > Subject: Re: [PATCH v1 0/4] vfio: report NUMA nodes for device memory
> >=20
> >=20
> > On Wed, 27 Sep 2023 10:53:36 -0300
> > Jason Gunthorpe <jgg@nvidia.com> wrote:
> >  =20
> > > On Wed, Sep 27, 2023 at 12:33:18PM +0100, Jonathan Cameron wrote:
> > > =20
> > > > CXL accelerators / GPUs etc are a different question but who has one
> > > > of those anyway? :) =20
> > >
> > > That's exactly what I mean when I say CXL will need it too. I keep
> > > describing this current Grace & Hopper as pre-CXL HW. You can easially
> > > imagine draping CXL around it. CXL doesn't solve the problem that
> > > motivates all this hackying - Linux can't dynamically create NUMA
> > > nodes. =20
> >=20
> > Why is that and why aren't we pushing towards a solution of removing th=
at
> > barrier so that we don't require the machine topology to be configured =
to
> > support this use case and guest OS limitations?  Thanks,
> > =20
>=20
> Even if Linux could create NUMA nodes dynamically for coherent CXL or CXL=
 type devices,=20
> there is additional information FW knows that the kernel doesn't. For exa=
mple,
> what the distance/latency between CPU and the device NUMA node is. While =
CXL devices
> present a CDAT table which gives latency type attributes within the devic=
e, there would still be some
> guesswork needed in the kernel as to what the end to end latency/distance=
 is.=20
FWIW

Shouldn't be guess work needed (for light load case anyway which is what wo=
uld be
in HMAT). That's what the Generic Ports were added to SRAT for. Dave Jiang =
has a
patch set
https://lore.kernel.org/all/168695160531.3031571.4875512229068707023.stgit@=
djiang5-mobl3/
to do the maths...  For CXL there is no problem fully describing the access=
 characteristics.

> It's probably not the best outcome to just consider this generically far =
memory" because=20
> is it further than Intersocket memory access or not matters.=20
> Pre CXL devices such as for this patchset don't even have CDAT so the ker=
nel by itself has
> no idea if this latency/distance is less than or more than inter socket m=
emory access latency
> even.

Just because I'm feeling cheeky - you could emulate a DOE and CDAT :)?
Though I suppose you don't want to teach the guest driver about it.

> So specially for devices present at boot, FW knows this information and s=
hould provide it.=20
> Similarly, QEMU should pass along this information to VMs for the best ou=
tcomes.
No problem with the argument that FW has the info and should provide it,
just on the 'how' part.

Jonathan

>=20
> Thanks
> > Alex =20
>=20

