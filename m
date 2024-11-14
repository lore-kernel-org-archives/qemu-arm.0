Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp180426njc;
        Thu, 14 Nov 2024 00:48:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeJkU253ODr2+3CPH/P1h/WlM+3c8iWp1MGmneByPGZaEC5yM9u3Y4/7im3V9L+agRIOX4Wl4lYZkauA==@linaro.org
X-Google-Smtp-Source: AGHT+IHd6F7s5bJejJlohxfpLkJGArPep2M59acvqeHfWuRCT34+2HyJVl/6dMyL9u1f9rMsrS4z
X-Received: by 2002:a05:6214:5342:b0:6d3:526e:91c4 with SMTP id 6a1803df08f44-6d3dd075178mr76389236d6.41.1731574128962;
        Thu, 14 Nov 2024 00:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731574128; cv=none;
        d=google.com; s=arc-20240605;
        b=hZ5hPsYx4Q2iDLUBVkISs08uDRP5oqyLzODyXlZE+SnvkEPU1tm5VihV/j0D2/fWO/
         xYukGsVOhEcWCuPCyg02inFaRzRZQZauJdWMLk0XL//E9gsYX4PfRAo/LqJx2L8JHdqh
         V+WxX5UMCtKgk4lkpQH1CfsMIpDQuldJvCLZY5Fhwxsv0q1gl6kIiThqZM/UwcHCy1CG
         esGXSCWNiS2Ifjc/DruRHadcIcu3UdToE9RJuyRU55zie/+bbWswQBHhlDZPOC+7ndEB
         L1rJdvEUkVudbjXkFCDFFyl8CCGqZdHghgoycmOzuhcPoz4Vy+n1ytBgNVdXXzqQMWk/
         TW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=su/Rog6yiMKQzhhRrE6Fck0nuOAo3bGebEMfLoSoQZo=;
        fh=SxKlX6GqXD55EMB3sC/XQHOKdHr3I93AWwhAE1qtX1w=;
        b=e2xW0lTSW8k2URTHqU+40+WIj1lOzRQxxPEBrXPEeszIH0FP/1kuSyLqNRiPnkJnBv
         HqvhLESik/7DtO717mUkOmj86ZNpR21aUKfzHH2kl2TFX3iqDio6qqURIW6cKjigc8PL
         bLpCN6WcBpKqxxV63pSQkvMMmrw3/V2bHg2MNNVZ2fTaueoBBTeRJUMqadI3cMHlObE0
         Wh6b9nGj8cxDv/1C++tVW2QfA7Giew+Cp3s6CM4Sr2w97OgIRLorTXydWMbbekqyTZYK
         DWbkq9cRfyfvi2vtrMVtgI32u/+Deed8XT3Oko7FnJpYJ58AOEZ3lfCPvt4nWDnhyNo7
         +cRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3ee7956b3si7253916d6.152.2024.11.14.00.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2024 00:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tBVWw-0001MS-Pr; Thu, 14 Nov 2024 03:48:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBVWt-0001M8-2u; Thu, 14 Nov 2024 03:48:43 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1tBVWo-0007hZ-Q1; Thu, 14 Nov 2024 03:48:42 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XptyP5yfLz67PFw;
 Thu, 14 Nov 2024 16:45:17 +0800 (CST)
Received: from frapeml500005.china.huawei.com (unknown [7.182.85.13])
 by mail.maildlp.com (Postfix) with ESMTPS id C7F01140AA7;
 Thu, 14 Nov 2024 16:48:29 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500005.china.huawei.com (7.182.85.13) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:48:29 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Thu, 14 Nov 2024 09:48:29 +0100
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm
 <linuxarm@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [RFC PATCH 5/5] hw/arm/virt-acpi-build: Add IORT RMR regions to
 handle MSI nested binding
Thread-Topic: [RFC PATCH 5/5] hw/arm/virt-acpi-build: Add IORT RMR regions to
 handle MSI nested binding
Thread-Index: AQHbMeh+2ch4+CPl40qxn8LRgKg97rK1f8yAgAD7vvA=
Date: Thu, 14 Nov 2024 08:48:29 +0000
Message-ID: <cf0d88bc649344a4b396575cc58394ac@huawei.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <20241108125242.60136-6-shameerali.kolothum.thodi@huawei.com>
 <ZzTwZWXp0dIZB3E4@Asurada-Nvidia>
In-Reply-To: <ZzTwZWXp0dIZB3E4@Asurada-Nvidia>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.738, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NZ8gfr97MEQb



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, November 13, 2024 6:31 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> ddutile@redhat.com; Linuxarm <linuxarm@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>;
> zhangfei.gao@linaro.org
> Subject: Re: [RFC PATCH 5/5] hw/arm/virt-acpi-build: Add IORT RMR regions
> to handle MSI nested binding
>=20
> On Fri, Nov 08, 2024 at 12:52:42PM +0000, Shameer Kolothum wrote:
> > From: Eric Auger <eric.auger@redhat.com>
> >
> > To handle SMMUv3 nested stage support it is practical to expose the
> > guest with reserved memory regions (RMRs) covering the IOVAs used by
> > the host kernel to map physical MSI doorbells.
>=20
> There has been an ongoing solution for MSI alternative:
> https://lore.kernel.org/kvm/cover.1731130093.git.nicolinc@nvidia.com/
>=20
> So, I think we should keep this patch out of this series, instead put it =
on top
> of the testing branch.

Yes. I think then we can support DT solution as well.=20

On that MSI RFC above, have you seen Eric's earlier/initial proposal to bin=
d the Guest MSI in
nested cases. IIRC, it was providing an IOCTL and then creating a mapping i=
n the host.

I think this is the latest on that.
https://lore.kernel.org/linux-iommu/20210411114659.15051-4-eric.auger@redha=
t.com/

But not sure, why we then moved to RMR approach. Eric?

Thanks,
Shameer
