Received: by 2002:a05:6214:13e3:0:0:0:0 with SMTP id ch3csp2481916qvb;
        Fri, 18 Sep 2020 09:59:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbwTvSNALfrvhcvyL/t4EfgBJ/BYnW5OI61g4hPONGPK3YMxKLnzTjHt0FYienB3PfH75U
X-Received: by 2002:a25:ac28:: with SMTP id w40mr34920171ybi.359.1600448354512;
        Fri, 18 Sep 2020 09:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600448354; cv=none;
        d=google.com; s=arc-20160816;
        b=fDcTEkn9AX1oeUO5MqbkGM0jWkoVqg7TysnKdD8UPBtRMlTL6INEZsKNkwWLrzgK4e
         gHaUcISy77QgTsNUdkUEJZnikPfyVZuR2M0pB5wNQrQxR3ZwapMWoBxEwuo5jyLSuQnP
         /bDaxoUFj4VQSMAr+REIExzeMFZbRcg3qr9mn0/lwO4S8ERXvwBfiNnXSgKot3KBiDgx
         +lZ/ncuqR3vk3VwLdJ24kuqWFgc6H43vx8Ee2N3BjFERSCHfjlNUWr0zq3QgVmF/jR+a
         d+XEvwLIYWEUjL0/WjcMmO6a+0pYYatQVjHI6244elTrpOu12/phjTPVOrwu7CnFO2MR
         tJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=5v+VwXd0DomqxaRpx2v4emujqgUsxH/rzu95M/LVoy8=;
        b=UevNV4/1X9BZf1NFeLtbjG8y2Qb71LHxrTEhq6+eiUVHGn0cUcbGkNdVjW4V1ZcBgg
         oRGRwP2+GhFJcLyPIAfrB9trMErDWzJWdEaxAlZTnu1R/+61E8hOUup+W6JSwgvG0p0F
         pCg7qe0OJHq3E8eSep/IpoEgp5lUITlXS5/93Iq9iEOZmTjtUhQS5BheMuIdEn0HHPMk
         kwKoXNWDv5TJAe1oljU61FCEKNN9xF5UcB0BzXnvz7JSqOWHQTC84J5mJm2ZLPS7EbqQ
         g1MG8xJ5CEVDvwhKwCPY3Th5nrhmjg6Mdk5jW12lZA0d9IREOFTToUEznyCav9ygP53d
         c6WA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c186si4188482yba.132.2020.09.18.09.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Sep 2020 09:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kJJj8-0006wk-0k
	for alex.bennee@linaro.org; Fri, 18 Sep 2020 12:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1kJJiy-0006v5-QR; Fri, 18 Sep 2020 12:59:04 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2545 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1kJJiv-0002aB-27; Fri, 18 Sep 2020 12:59:04 -0400
Received: from nkgeml709-chm.china.huawei.com (unknown [172.30.72.54])
 by Forcepoint Email with ESMTP id 77DE2540EBD2317782A9;
 Sat, 19 Sep 2020 00:58:52 +0800 (CST)
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 nkgeml709-chm.china.huawei.com (10.98.57.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.1913.5; Sat, 19 Sep 2020 00:58:49 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.1913.007; 
 Fri, 18 Sep 2020 17:58:46 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Subject: RE: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
Thread-Topic: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
Thread-Index: AQHWjKHH5zES4p0+/UadBbZsJn/3JalsapaAgAEMekCAAGKzgIAAxAJQ
Date: Fri, 18 Sep 2020 16:58:46 +0000
Message-ID: <4147233067d04928a7255ce3f806a8a4@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
 <20200917032033.2020-5-fangying1@huawei.com>
 <20200917081239.bdfhkofodqvhg3i6@kamzik.brq.redhat.com>
 <a0ef33da132a411a8da14a8b05f78c1d@huawei.com>
 <20200918060649.oi5cdgouuopf45us@kamzik.brq.redhat.com>
In-Reply-To: <20200918060649.oi5cdgouuopf45us@kamzik.brq.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.65.147]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=salil.mehta@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 12:58:53
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
 Zhanghailiang <zhang.zhanghailiang@huawei.com>, Alexander Graf <agraf@suse.de>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Chenzhendong \(alex\)" <alex.chen@huawei.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "alistair.francis@wdc.com" <alistair.francis@wdc.com>,
 fangying <fangying1@huawei.com>, "imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7/EM4bfFp5vt

> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Friday, September 18, 2020 7:07 AM
>=20
> On Fri, Sep 18, 2020 at 12:25:19AM +0000, Salil Mehta wrote:
> >
> > > From: Qemu-arm
> [mailto:qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.org]
> > > On Behalf Of Andrew Jones
> > > Sent: Thursday, September 17, 2020 9:13 AM
> > > To: fangying <fangying1@huawei.com>
> > > Cc: peter.maydell@linaro.org; Zhanghailiang
> <zhang.zhanghailiang@huawei.com>;
> > > Alexander Graf <agraf@suse.de>; qemu-devel@nongnu.org; Chenzhendong (=
alex)
> > > <alex.chen@huawei.com>; shannon.zhaosl@gmail.com; qemu-arm@nongnu.org=
;
> > > alistair.francis@wdc.com; imammedo@redhat.com
> > > Subject: Re: [RFC PATCH 04/12] device_tree: add qemu_fdt_add_path
> > >
> > > On Thu, Sep 17, 2020 at 11:20:25AM +0800, Ying Fang wrote:
> > > > From: Andrew Jones <drjones@redhat.com>
> > > >
> > > > qemu_fdt_add_path works like qemu_fdt_add_subnode, except it
> > > > also recursively adds any missing parent nodes.
> > > >
> > > > Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> > > > Cc: Alexander Graf <agraf@suse.de>
> > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > ---
> > > >  device_tree.c                | 24 ++++++++++++++++++++++++
> > > >  include/sysemu/device_tree.h |  1 +
> > > >  2 files changed, 25 insertions(+)
> > > >
> > > > diff --git a/device_tree.c b/device_tree.c
> > > > index b335dae707..1854be3a02 100644
> > > > --- a/device_tree.c
> > > > +++ b/device_tree.c
> > > > @@ -524,6 +524,30 @@ int qemu_fdt_add_subnode(void *fdt, const char=
 *name)
> > > >      return retval;
> > > >  }
> > > >
> > > > +int qemu_fdt_add_path(void *fdt, const char *path)
> > > > +{
> > > > +    char *parent;
> > > > +    int offset;
> > > > +
> > > > +    offset =3D fdt_path_offset(fdt, path);
> > > > +    if (offset < 0 && offset !=3D -FDT_ERR_NOTFOUND) {
> > > > +        error_report("%s Couldn't find node %s: %s", __func__, pat=
h,
> > > > +                     fdt_strerror(offset));
> > > > +        exit(1);
> > > > +    }
> > > > +
> > > > +    if (offset !=3D -FDT_ERR_NOTFOUND) {
> > > > +        return offset;
> > > > +    }
> > > > +
> > > > +    parent =3D g_strdup(path);
> > > > +    strrchr(parent, '/')[0] =3D '\0';
> > > > +    qemu_fdt_add_path(fdt, parent);
> > > > +    g_free(parent);
> > > > +
> > > > +    return qemu_fdt_add_subnode(fdt, path);
> > > > +}
> > >
> > > Igor didn't like the recursion when I posted this before so I changed
> > > it when doing the refresh[*] that I gave to Salil Mehta. Salil also
> > > works for Huawei, are you guys not working together?
> > >
> > > [*] https://github.com/rhdrjones/qemu/commits/virt-cpu-topology-refre=
sh
> > >
> >
> >
> > I was not aware of this work going on. I am based at Cambridge and Fang=
ying
> > in Hangzhou and work for different teams.
> >
> > Yes, I have it and have integrated it with the Virtual CPU hotplug bran=
ch
> > and I am testing them.
> >
> > I have also rebased virtual cpu hotplug patches and integrated the PMU
> > related changes recently been discussed in other mail-chain. Plus, I am
> > also dealing with the MPIDR/affinity part from the Kernel which has bee=
n
> > discussed earlier with the Marc Zyngier.
> >
> > It looks some of the changes are common here like ability to set MPIDR
> > of the vcpus at the time of their creation inside KVM. And the PPTT
> > table changes which were present in your refresh branch as well. Change=
s
> > related to the possible and present vcpus might need a sync as well.
> >
> > @Andrew, should I take out the part which is common and affects the
> > virtual cpu hotplug and push them separately. This way I can have part
> > of the changes related to the vcpu hotplug done which will also cover
> > this patch-set requirements as well?
>=20
> Whatever works best for you and Ying Fang. It looks like this series
> only focuses on topology. It's not considering present and possible
> cpus, but it probably should. It also adds the cache hierarchy stuff,
> but I'm not sure it's approaching that in the right way. I think it
> may make sense to put this series on hold and take another look at
> your hotplug series when it's reposted before deciding what to do.


Ok fine. Let me collaborate with him internally first. Either of us
will have to rebase our patches on others code.


thanks


>=20
> Thanks,
> drew
>=20
> >
> > @Fangying, will this work for you?
> >
> >
> > Salil.
> >
> >

