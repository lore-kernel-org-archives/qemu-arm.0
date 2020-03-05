Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2356064lfi;
        Wed, 4 Mar 2020 18:56:46 -0800 (PST)
X-Google-Smtp-Source: ADFU+vufJr8tKPQzqINJJjnAyuP90V1Gj8po0rKC4EKlVwHQLC+eWIiKRvpXFqbl5skhRV7WkkPd
X-Received: by 2002:a37:de0d:: with SMTP id h13mr6082377qkj.332.1583377005933;
        Wed, 04 Mar 2020 18:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583377005; cv=none;
        d=google.com; s=arc-20160816;
        b=V+6V+26u2iMPuZVdx8lfZIowI6Q/zanFkpmnoUotobuA8VdIqiWeGuw5JTJSRJZqOF
         yZABq5oMR/FCBCuC38PQRiHz7LRK8h7bOkXCtxTp3HM6RVmJtGV5ujUfJMAKKhbzuKOX
         7LUNK+1ikyJ1l1O4vnpWCiYlkjYVk0zfqOPbtFjSLDDFPCk/X9DF7vm1m/Ebw02yVw5a
         FteZx6qYLxQvK4O73TwxW9ZfkArZ9iHJ9mFLB2wnRyOqcsA7HR69lJbXK36KMI38D6Fa
         ltzsDkSWeLjV9gndJroqctOUldYmOoqn4q8bv1brrzZr8euyNm5oyAJEFHoWKSDlawU0
         DrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:dlp-reaction:dlp-version:dlp-product
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from;
        bh=LbaCqUokkUuI3xHsg5Pxz65cftlMFCYYk1I3uPAxNII=;
        b=DWzZWZ4eMnMN6tHPczJGFqVf3EAhEbXIwPz95u2UmLuDCStxAxvDxvJHr5WFB7r3lU
         T5iFAT960EFeowSo7dfP7IaFt0sjISU8XBiQZ0crl6r6V2vO53/k2Qq20r13UVaTAtkI
         Nibi3rlAEAmdjNuHEEKSdX2tO3GkOR7TxGUV/ESzGJzsED0tvSlYcQAj9sUn2vuE0c0f
         B7o8sjp4yXwgSPy62awjQjooZLr7YjnYRnLGywwOafUs0Hy7+aH1qtvoT+2Y+gyFG0iF
         LH7u3rWP6riVpKgDZxCfW4AgO1IdPp57NLnjG5T7/VqSJYI8FG6WSM+zMBSn7x3Rydrf
         mauA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h8si2103743qkm.128.2020.03.04.18.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Mar 2020 18:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:42710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9ggn-0005aS-Cx
	for alex.bennee@linaro.org; Wed, 04 Mar 2020 21:56:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56008)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kevin.tian@intel.com>) id 1j9ggf-0005aI-VU
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 21:56:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kevin.tian@intel.com>) id 1j9gge-0007ax-Vc
 for qemu-arm@nongnu.org; Wed, 04 Mar 2020 21:56:37 -0500
Received: from mga07.intel.com ([134.134.136.100]:34446)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kevin.tian@intel.com>)
 id 1j9ggb-00079S-Lm; Wed, 04 Mar 2020 21:56:33 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 18:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,516,1574150400"; d="scan'208";a="274920144"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2020 18:56:26 -0800
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Mar 2020 18:56:26 -0800
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 4 Mar 2020 18:56:25 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.235]) with mapi id 14.03.0439.000;
 Thu, 5 Mar 2020 10:56:21 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, Auger Eric
 <eric.auger@redhat.com>
Subject: RE: [PATCH v16 00/10] VIRTIO-IOMMU device
Thread-Topic: [PATCH v16 00/10] VIRTIO-IOMMU device
Thread-Index: AQHV4zqd/jWB2C+M5UeA/xtNxWrsyqgucl6AgAAqcACAByzBAIAAaY+AgAFXAoCAACrFAIAAh6qAgAEu9sA=
Date: Thu, 5 Mar 2020 02:56:20 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7BDFBB@SHSMSX104.ccr.corp.intel.com>
References: <20200214132745.23392-1-eric.auger@redhat.com>
 <20200227111717.GG1645630@redhat.com>
 <431cb39d-833c-6d02-d7b3-02b3e90446e2@redhat.com>
 <CAMj5Bkib3CTzCB02ScueFR84r28LGowF7uxYO8Ygmnj9X7oNOg@mail.gmail.com>
 <fea625f1-b58e-6da6-8e2a-f32fc9391fc8@redhat.com>
 <CAMj5Bkgm1LKbN3E2qTTxmrGhpmdL9NWarSfX-mYCWF0yt5E9eg@mail.gmail.com>
 <88e3b669-2998-41c0-83f7-de42a72a73e7@redhat.com>
 <20200304164717.GF646000@myrica>
In-Reply-To: <20200304164717.GF646000@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjM2NzUyZWEtODNmZi00N2YzLThmYjAtYjcyM2I3MjVmYzQ1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiRExuWnlNUTJIYWtPSHVNVzJuKzZxekEwczl4MU9hNG4yTXNmaGZjNEt2UzFUYUthc0xUQVFYSll0NGJjbm9KWSJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.100
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 "kenneth-lee-2012@foxmail.com" <kenneth-lee-2012@foxmail.com>,
 "tnowicki@marvell.com" <tnowicki@marvell.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "zhangfei.gao@foxmail.com" <zhangfei.gao@foxmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "bharatb.linux@gmail.com" <bharatb.linux@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "Wangzhou \(B\)" <wangzhou1@hisilicon.com>,
 Zhangfei Gao <zhangfei.gao@gmail.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LbsqfgwVHjeF

> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Sent: Thursday, March 5, 2020 12:47 AM
>
[...]
> > >
> > > * We can't use DVM in nested mode unless the VMID is shared with the
> > > CPU. For that we'll need the host SMMU driver to hook into the KVM
> VMID
> > > allocator, just like we do for the ASID allocator. I haven't yet
> > > investigated how to do that. It's possible to do vSVA without DVM
> > > though, by sending all TLB invalidations through the SMMU command
> queue.
> > > "
>=20
> Hm we're already mandating DVM for host SVA, so I'd say mandate it for
> vSVA as well. We'd avoid a ton of context switches, especially for the zi=
p
> accelerator which doesn't require ATC invalidations. The host needs to pi=
n
> the VMID allocated by KVM and write it in the endpoint's STE.
>=20

Curious... what is DVM and how is it related to SVA? Is it SMMU specific?
