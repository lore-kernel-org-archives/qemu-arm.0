Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1034767lfq;
        Thu, 17 Sep 2020 17:25:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxmJIxhZux9oSfHhwQKqoVCSYQe2V3MmGsasrCjJ3PTlOnP4HAX2/Sop4L0YPx5PAj0ZkQ
X-Received: by 2002:a25:7314:: with SMTP id o20mr44071829ybc.211.1600388757969;
        Thu, 17 Sep 2020 17:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600388757; cv=none;
        d=google.com; s=arc-20160816;
        b=RpjwNO0SV1rsQSevVG2EOWHfp36ECKNo5aoUYwrLnJSRmuDV4wriXuE+fOICVe3GYU
         1FBevQCzmeJlPX8jPl+bVMLhtL0Qsn7C2KTfru51aAaGUEwkvRNDTkcoyAlsrci5vj8h
         2JA3EuZBsa6XtQtXLC6HCOY/8up68agdZ/JiUOd0AZGqmuKXTVCf0MMutjybO9+OZXwj
         VKb2CDbpZQoaQ42Qvz4bXm1TiO+ifrBbW6qI4dBrK0MEh3W2UbQFsS2TxbyQnh9rLFb9
         s/uboRHupvErY9eU8LcnZNYgXN8cJu7I1lYiazC8FnFnRaxDTyeByY3sMY44YJUJJt0h
         Epvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=/b+PkUx51r1KWTDoPyNVGpUT127thu2+pUwTyN+3Bnc=;
        b=wpP0s5egOUOYODMTclBgfaSxDfijv3TZ+DZnwhy+ECLg8MQu9zG139YDOg4bDNag0A
         S+GoFiILqJoqjwD4HJ/iOCdgf++HRI3GE8yKmBT12aAfELTo8XvnYslYKcG2bzto/P1o
         ti0QGvaoE6njQHMoBbmym1Dbi4ZSB3d9N8dBN7G+AEGi1ljdSUBws7Flap2trBcnNBPU
         sVPIImgVpa3Xm4MF49ZbKu0ftMEaOrysx6bqULGF1Z4k7HnKE7oHijfNo6d/kBwVaQAk
         e1S5NA9ePUjP5wLSgzjObClUIGnLjskve0uAZ7C6r/GUu0pCLSRsyiLB1bsL5FIrfmMM
         h+UQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si1179940ybo.426.2020.09.17.17.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 17:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kJ4Dt-0000Dz-Dn
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 20:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1kJ4Dg-0000DV-Jz; Thu, 17 Sep 2020 20:25:44 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2979 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1kJ4Dc-0001pr-9s; Thu, 17 Sep 2020 20:25:44 -0400
Received: from nkgeml704-chm.china.huawei.com (unknown [172.30.72.53])
 by Forcepoint Email with ESMTP id BF03A8844843A18C743D;
 Fri, 18 Sep 2020 08:25:23 +0800 (CST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 nkgeml704-chm.china.huawei.com (10.98.57.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Fri, 18 Sep 2020 08:25:21 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Fri, 18 Sep 2020 01:25:19 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Andrew Jones <drjones@redhat.com>, fangying <fangying1@huawei.com>
Subject: RE: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
Thread-Topic: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
Thread-Index: AQHWjKHH5zES4p0+/UadBbZsJn/3JalsapaAgAEMekA=
Date: Fri, 18 Sep 2020 00:25:19 +0000
Message-ID: <a0ef33da132a411a8da14a8b05f78c1d@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-5-fangying1@huawei.com>
 <20200917081239.bdfhkofodqvhg3i6@kamzik.brq.redhat.com>
In-Reply-To: <20200917081239.bdfhkofodqvhg3i6@kamzik.brq.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.65.147]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 20:25:24
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Graf <agraf@suse.de>, "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VSKGRrvuIIo0


> From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.o=
rg]
> On Behalf Of Andrew Jones
> Sent: Thursday, September 17, 2020 9:13 AM
> To: fangying <fangying1@huawei.com>
> Cc: peter.maydell@linaro.org; Zhanghailiang <zhang.zhanghailiang@huawei.c=
om>;
> Alexander Graf <agraf@suse.de>; qemu-devel@nongnu.org; Chenzhendong (alex=
)
> <alex.chen@huawei.com>; shannon.zhaosl@gmail.com; qemu-arm@nongnu.org;
> alistair.francis@wdc.com; imammedo@redhat.com
> Subject: Re: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
>=20
> On Thu, Sep 17, 2020 at 11:20:25AM +0800, Ying Fang wrote:
> > From: Andrew Jones <drjones@redhat.com>
> >
> > qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
> > also recursively adds any missing parent nodes.
> >
> > Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> > Cc: Alexander Graf <agraf@suse.de>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  device_tree.c                | 24 ++++++++++++++++++++++++
> >  include/sysemu/device_tree.h |  1 +
> >  2 files changed, 25 insertions(+)
> >
> > diff --git a/device_tree.c b/device_tree.c
> > index b335dae707..1854be3a02 100644
> > --- a/device_tree.c
> > +++ b/device_tree.c
> > @@ -524,6 +524,30 @@ int qemu_fdt_add_subnode(void *fdt, const char *na=
me)
> >      return retval;
> >  }
> >
> > +int qemu_fdt_add_path(void *fdt, const char *path)
> > +{
> > +    char *parent;
> > +    int offset;
> > +
> > +    offset =3D fdt_path_offset(fdt, path);
> > +    if (offset < 0 && offset !=3D -FDT_ERR_NOTFOUND) {
> > +        error_report("%s Couldn't find node %s: %s", __func__, path,
> > +                     fdt_strerror(offset));
> > +        exit(1);
> > +    }
> > +
> > +    if (offset !=3D -FDT_ERR_NOTFOUND) {
> > +        return offset;
> > +    }
> > +
> > +    parent =3D g_strdup(path);
> > +    strrchr(parent, '/')[0] =3D '\0';
> > +    qemu_fdt_add_path(fdt, parent);
> > +    g_free(parent);
> > +
> > +    return qemu_fdt_add_subnode(fdt, path);
> > +}
>=20
> Igor didn't like the recursion when I posted this before so I changed
> it when doing the refresh[*] that I gave to Salil Mehta. Salil also
> works for Huawei, are you guys not working together?
>=20
> [*] https://github.com/rhdrjones/qemu/commits/virt-cpu-topology-refresh
>=20


I was not aware of this work going on. I am based at Cambridge and Fangying
in Hangzhou and work for different teams.

Yes, I have it and have integrated it with the Virtual CPU hotplug branch
and I am testing them.

I have also rebased virtual cpu hotplug patches and integrated the PMU
related changes recently been discussed in other mail-chain. Plus, I am
also dealing with the MPIDR/affinity part from the Kernel which has been
discussed earlier with the Marc Zyngier.=20

It looks some of the changes are common here like ability to set MPIDR
of the vcpus at the time of their creation inside KVM. And the PPTT
table changes which were present in your refresh branch as well. Changes
related to the possible and present vcpus might need a sync as well.

@Andrew, should I take out the part which is common and affects the
virtual cpu hotplug and push them separately. This way I can have part
of the changes related to the vcpu hotplug done which will also cover
this patch-set requirements as well?=20

@Fangying, will this work for you?


Salil.=20

