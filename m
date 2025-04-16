Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3125930njc;
        Tue, 15 Apr 2025 22:54:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYu66vxCImCzCWsvvzVrpdSk8quB+hIvTzq9/sEV/O57h2kB0S4PGCu2+87EOarX7Nej8Obr/f35KnWg==@linaro.org
X-Google-Smtp-Source: AGHT+IE7pexoMmEq0VoHUJBlSITL0Uq1wxAUSG7ZGdeZ2UGDe5eFX+uJlo4pdBzk4JpbnDte4OES
X-Received: by 2002:a05:620a:1a07:b0:7c5:4463:29aa with SMTP id af79cd13be357-7c9190650ecmr69048785a.40.1744782886299;
        Tue, 15 Apr 2025 22:54:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744782886; cv=none;
        d=google.com; s=arc-20240605;
        b=IiKC8nCLzkAwY4qeQd67qm0PFZr4IPe2RLjQUREGSa4BJvW96/glqh4V7sHF5QLKg/
         2plM5EQXXHcyGxxwLxKVSJxdE5AnHloUnWU8SnpwHOlAc0ZPKMbuDttW0EEQonNPPksZ
         wGBV2b6+PL6vdFmhfMh+mT+3b5/x/R9XYlKAYi6JOpu+p0nVfv48l8/uP95kgUC3/hf3
         3bY0XtiTDjVGoi3mlSMAiANzEaAhmlgaTwqDcbL9ohN/vvwyx1d0E51Vz0XwLsM28oE2
         3Gea5jOejnNw7QrfPC5zIoo4VnJL8dpmWKMgJhshSfR9lFxC6nNjrNzBJlfTDdXiDLDl
         eRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to;
        bh=YNbrqQmUYwUZhwL/jhCnlduaGi9dyhWToGHvvBNn0Zs=;
        fh=L5k2mRSqinh8rv+X+K9B0cKsw7VXHEq5HuwmzaH9KTE=;
        b=B/enQe0fUTEykl0aXDyQcSVD+SGF2/aglSpL+/vF61VTyH+S3ExFgf77CWphoMzvv+
         MPHHIxufnMzVMFS66xJnLsoBOcS+rClIgQfJaC3FBdE1LR+Sn+B0o5tEqcZbYuLk58S5
         HU8kY/NseN25WtBWv4QYpXz5l9bdRY+MFgpPnaA0VV6a22GqoR2L7WMkD14xJY3hmxlX
         U0hTUuvBL777XoC6EIrNCJ5aD6UV4WcH/aO0wv0TwZtEU6RNPz4L4voKyhBIgHBRe3gr
         uRbXoG5vrFpICYfHxW+hjP3+97XgMrJFF02NpWQccHtiQu/JtgQ9X0xZMAWjJV133ONo
         cb3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c7a894c8d3si1220793885a.107.2025.04.15.22.54.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Apr 2025 22:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u4vjB-0002ME-Cd; Wed, 16 Apr 2025 01:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4vj6-0002Bj-6l; Wed, 16 Apr 2025 01:54:25 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1u4vj3-0000iX-28; Wed, 16 Apr 2025 01:54:23 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Zcqqv0lPGz6M4KC;
 Wed, 16 Apr 2025 13:50:19 +0800 (CST)
Received: from frapeml500007.china.huawei.com (unknown [7.182.85.172])
 by mail.maildlp.com (Postfix) with ESMTPS id A6868140144;
 Wed, 16 Apr 2025 13:54:17 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500007.china.huawei.com (7.182.85.172) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Apr 2025 07:54:17 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 16 Apr 2025 07:54:17 +0200
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "jgg@nvidia.com"
 <jgg@nvidia.com>, "ddutile@redhat.com" <ddutile@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>, "nathanc@nvidia.com"
 <nathanc@nvidia.com>, "mochs@nvidia.com" <mochs@nvidia.com>,
 "smostafa@google.com" <smostafa@google.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>, jiangkunkun
 <jiangkunkun@huawei.com>, Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>
Subject: RE: [PATCH 3/5] hw/arm/virt: Factor out common SMMUV3 dt bindings code
Thread-Topic: [PATCH 3/5] hw/arm/virt: Factor out common SMMUV3 dt bindings
 code
Thread-Index: AQHbreQJ5nmGR2MrPk6zb0+HverIIrOlkfAAgAA5vqA=
Date: Wed, 16 Apr 2025 05:54:17 +0000
Message-ID: <922a3b3f19874210b61778882b2f3253@huawei.com>
References: <20250415081104.71708-1-shameerali.kolothum.thodi@huawei.com>
 <20250415081104.71708-4-shameerali.kolothum.thodi@huawei.com>
 <Z/8xSljew92Hhh99@Asurada-Nvidia>
In-Reply-To: <Z/8xSljew92Hhh99@Asurada-Nvidia>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.152.164]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: IDaOsgsasAiL



> -----Original Message-----
> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Wednesday, April 16, 2025 5:26 AM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-arm@nongnu.org; qemu-devel@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org; jgg@nvidia.com;
> ddutile@redhat.com; berrange@redhat.com; nathanc@nvidia.com;
> mochs@nvidia.com; smostafa@google.com; Linuxarm
> <linuxarm@huawei.com>; Wangzhou (B) <wangzhou1@hisilicon.com>;
> jiangkunkun <jiangkunkun@huawei.com>; Jonathan Cameron
> <jonathan.cameron@huawei.com>; zhangfei.gao@linaro.org
> Subject: Re: [PATCH 3/5] hw/arm/virt: Factor out common SMMUV3 dt
> bindings code
>=20
> On Tue, Apr 15, 2025 at 09:11:02AM +0100, Shameer Kolothum wrote:
> > No functional changes intended. This will be useful when we add
> > support for user-creatable smmuv3 device.
> >
> > Signed-off-by: Shameer Kolothum
> <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/virt.c | 55
> > +++++++++++++++++++++++++++------------------------
> >  1 file changed, 29 insertions(+), 26 deletions(-)
> >
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c index
> > a96452f17a..729f192558 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1417,19 +1417,42 @@ static void create_pcie_irq_map(const
> MachineState *ms,
> >                             0x7           /* PCI irq */);
> >  }
> >
> > +static void create_smmuv3_dt_bindings(const VirtMachineState *vms,
> hwaddr base,
> > +                                      int irq) {
> > +    char *node;
> > +    const char compat[] =3D "arm,smmu-v3";
> > +    const char irq_names[] =3D "eventq\0priq\0cmdq-sync\0gerror";
> > +    MachineState *ms =3D MACHINE(vms);
> > +
> > +    node =3D g_strdup_printf("/smmuv3@%" PRIx64, base);
> > +    qemu_fdt_add_subnode(ms->fdt, node);
> > +    qemu_fdt_setprop(ms->fdt, node, "compatible", compat,
> sizeof(compat));
> > +    qemu_fdt_setprop_sized_cells(ms->fdt, node, "reg", 2, base, 2,
> > + 0x20000);
>=20
> Nit: I would pass in the size from its caller, just to ease in the future=
 when
> we need to add an instance supporting a different MMIO range.

Yes, that makes sense. And probably will use #define for the current size.

Thanks,
Shameer
