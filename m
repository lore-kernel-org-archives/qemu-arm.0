Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1336463lfm;
        Wed, 19 May 2021 03:01:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcgYHrHL+Cc/d/WyuDN5p18W7u0bgbY7MvOxPIv3/BI5jiz0M4Saaeqr9hPh28WbYCfzwD
X-Received: by 2002:a2e:b5d5:: with SMTP id g21mr8228328ljn.157.1621418502382;
        Wed, 19 May 2021 03:01:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621418502; cv=none;
        d=google.com; s=arc-20160816;
        b=RM9R7BHJsuxNka4SKtBGUwYTKi4rjizlwLc9ahz3I4R7RzkWdVJTc3Jxn52pXEvOEo
         1gR8c+g5WdIMNwdbh8EhJ7/6o3YOuYBOMQAVbFaaA94pHpaBQ1QsZvWmCiY3ncY+YAkl
         brEU0Meiu+5pHh5rHkv8TB46FKdCzdPiKTGs3SDM8+YUM2F3sMWePlrHH8fL/W/BxBje
         WihJGlqItOJwN1Y+5DkZ5KZuqbYY6xsi0tZ1t8TjcqzYkHEdtHe3bSjL//GwFPN+zOH6
         kYEuJwkpyiNdhLhEzJI2R5nfe++Y++vJb7AoGyh0GVIA0iU81Sy2R9KzK910scoI0als
         arlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from;
        bh=VOLFJpgTGDCHNaqe6s5t2KW5tzNf9hhMBCq49gAAuBs=;
        b=hgEFvAz7jgeDzbYUM6PoM+F+r796U+BrGfm5AaML3EeLupLQQ+GC3rfKoGKfIJ2Wwf
         ZnMqP79nrf48qbwTYa/uKd3b/nFQ17/DOPjnko9J0KblTA2b0T8ODzfQIPzpunGCcf9G
         dieq5xYQRumzyFpn9N9Jd5TsNOqHye/DTfpWypp+4PVhpM97yscRntNxoLlFCj3fM8DW
         54qXO8Plvnj7qMT3VxyGbuAj5x9RCdX05SKmcaiPZf08vdVu/ydnldX5WiPVZwEQf5RP
         mavEw0LW2nl9F2zQyUu3vb2bk0tK3mJENHiVWlOnd7d60SrnxfAcQ54jNdfpiKM3ljXL
         1jaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si26814784ljh.48.2021.05.19.03.01.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 May 2021 03:01:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:53850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljJ1J-0004z3-6L
	for alex.bennee@linaro.org; Wed, 19 May 2021 06:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1ljJ0d-0004xr-09; Wed, 19 May 2021 06:00:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <salil.mehta@huawei.com>)
 id 1ljJ0Z-0007ai-Ly; Wed, 19 May 2021 06:00:58 -0400
Received: from dggems705-chm.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FlSwq6xFczsS5B;
 Wed, 19 May 2021 17:58:03 +0800 (CST)
Received: from dggpeml500021.china.huawei.com (7.185.36.21) by
 dggems705-chm.china.huawei.com (10.3.19.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 18:00:49 +0800
Received: from lhreml703-chm.china.huawei.com (10.201.108.52) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 18:00:48 +0800
Received: from lhreml703-chm.china.huawei.com ([10.201.68.198]) by
 lhreml703-chm.china.huawei.com ([10.201.68.198]) with mapi id 15.01.2176.012; 
 Wed, 19 May 2021 11:00:46 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Andrew Jones <drjones@redhat.com>
Subject: RE: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Topic: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Thread-Index: AQHXMDzb5q8WzYljr0ilpO+8Rxsx7Krg+0EAgAgNE7D///kagIAAE+FggACrCICAABT0MIAAdLEAgABcmnD///ZUgIAALRwQ
Date: Wed, 19 May 2021 10:00:46 +0000
Message-ID: <082ae8a278274dcab8bd3b78bbd514e7@huawei.com>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
 <20210518074221.umezsdedzyzmcbsk@gator.home>
 <80dca9f16c5b4bef9900f6cf76c99500@huawei.com>
 <20210518190539.fwsvl2ijb4jlzbyi@gator.home>
 <b61a7413f98a430685b838eecc2db74f@huawei.com>
 <224d54ac-0c03-afc4-4aec-ea3435aa68e7@huawei.com>
 <f766805215ac439bb988dab02247ec71@huawei.com>
 <20210519081507.mnk43k77wbekeany@gator.home>
In-Reply-To: <20210519081507.mnk43k77wbekeany@gator.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.67.225]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=salil.mehta@huawei.com; helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor
 Mammedov <imammedo@redhat.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie
 \(H\)" <lijiajie11@huawei.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8gPQ1DY3IzNy

> From: Andrew Jones [mailto:drjones@redhat.com]
> Sent: Wednesday, May 19, 2021 9:15 AM
>=20
> On Wed, May 19, 2021 at 07:54:37AM +0000, Salil Mehta wrote:
> > > From: wangyanan (Y)
> > > Sent: Wednesday, May 19, 2021 4:18 AM
> > >
> > >
> > > On 2021/5/19 3:22, Salil Mehta wrote:
> > > >> From: Andrew Jones [mailto:drjones@redhat.com]
> > > >> Sent: Tuesday, May 18, 2021 8:06 PM
> > > >> To: Salil Mehta <salil.mehta@huawei.com>
> > > >> Cc: wangyanan (Y) <wangyanan55@huawei.com>; Peter Maydell
> > > >> <peter.maydell@linaro.org>; Michael S . Tsirkin <mst@redhat.com>; =
Wanghaibin
> > > >> (D) <wanghaibin.wang@huawei.com>; qemu-devel@nongnu.org; Shannon Z=
hao
> > > >> <shannon.zhaosl@gmail.com>; qemu-arm@nongnu.org; Alistair Francis
> > > >> <alistair.francis@wdc.com>; Zengtao (B) <prime.zeng@hisilicon.com>=
;
> > > >> yangyicong <yangyicong@huawei.com>; yuzenghui <yuzenghui@huawei.co=
m>; Igor
> > > >> Mammedov <imammedo@redhat.com>; zhukeqian <zhukeqian1@huawei.com>;=
 lijiajie (H)
> > > >> <lijiajie11@huawei.com>; David Gibson <david@gibson.dropbear.id.au=
>; Linuxarm
> > > >> <linuxarm@huawei.com>; linuxarm@openeuler.org
> > > >> Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT t=
able
> > > >>
> > > >> On Tue, May 18, 2021 at 06:34:08PM +0000, Salil Mehta wrote:
> > > >>>   Those benefits, when vcpu pinning is used, are the same benefit=
s
> > > >>>> as for the host, which already use PPTT tables to describe topol=
ogy, even
> > > >>>> though hot plug isn't supported.
> > > >>> yes sure, you mean pinning vcpus according to the cpu topology fo=
r performance?
> > > >> Yup
> > > > Already Agreed :)
> > > >
> > > >>>> Now, if you're saying we should only generate tables for smp.cpu=
s, not
> > > >>> Correct. This is what I thought we must be doing even now
> > > >>>
> > > >>>> smp.maxcpus, because hot plug isn't supported anyway, then I see=
 your
> > > >>>> point. But, it'd be better to require smp.cpus =3D=3D smp.maxcpu=
s in our
> > > >>>> smp_parse function to do that, which we've never done before, so=
 we may
> > > >>>> have trouble supporting existing command lines.
> > > >>> I am trying to recall, if the vcpu Hotplug is not supported then =
can they
> > > >>> ever be different?
> > > >>>
> > > >>> cpus =3D  (threads * cores * sockets)
> > > >>>
> > > >>> static void smp_parse(MachineState *ms, QemuOpts *opts)
> > > >>> {
> > > >>>       [...]
> > > >>>
> > > >>>          if (sockets * cores * threads !=3D ms->smp.max_cpus) {
> > > >>>              warn_report("Invalid CPU topology deprecated: "
> > > >>>                          "sockets (%u) * cores (%u) * threads (%u=
) "
> > > >>>                          "!=3D maxcpus (%u)",
> > > >>>                          sockets, cores, threads,
> > > >>>                          ms->smp.max_cpus);
> > > >>>          }
> > > >>>       [...]
> > > >>> }
> > > >>>
> > > >>> Although, above check does not exit(1) and just warns on detectin=
g invalid
> > > >>> CPU topology. Not sure why?
> > > >> Hmm, not sure what code you have there. I see this in
> > > >> hw/core/machine.c:smp_parse
> > > >>
> > > >>          if (ms->smp.max_cpus < cpus) {
> > > >>              error_report("maxcpus must be equal to or greater tha=
n smp");
> > > >>              exit(1);
> > > >>          }
> > > >>
> > > >>          if (sockets * cores * threads !=3D ms->smp.max_cpus) {
> > > >>              error_report("Invalid CPU topology: "
> > > >>                           "sockets (%u) * cores (%u) * threads (%u=
) "
> > > >>                           "!=3D maxcpus (%u)",
> > > >>                           sockets, cores, threads,
> > > >>                           ms->smp.max_cpus);
> > > >>              exit(1);
> > > >>          }
> > > >>
> > > >>> Well if you think there are subtleties to support above implement=
ation and
> > > >>> we cannot do it now then sure it is your call. :)
> > > Hi Salil, Drew,
> > > >> The problem is that -smp 4,maxcpus=3D8 doesn't error out today, ev=
en though
> > > >> it doesn't do anything. OTOH, -smp 4,cores=3D2 doesn't error out e=
ither, but
> > > >> we're proposing that it should. Maybe we can start erroring out wh=
en
> > > >> cpus !=3D maxcpus until hot plug is supported?
> > > > Agreed, both don't make any sense if hotplug is not supported and i=
deally should
> > > > fail with error. We should block any such topology configuration.
> > > In the ARM-specific function virt_smp_parse() (patch 9), there alread=
y
> > > have been some restrictions for the given -smp configuration.
> > > We now only allow:
> > > -smp N
> > > -smp maxcpus=3DM
> > > -smp N, maxcpus=3DM
> > >
> > > -smp N, sockets=3DX, cores=3DY
> > > -smp N, sockets=3DX, cores=3DY, threads=3DZ
> > >
> > > -smp maxcpus=3DM, sockets=3DX, cores=3DY
> > > -smp maxcpus=3DM, sockets=3DX, cores=3DY, threads=3DZ
> > >
> > > -smp N, maxcpus=3DM, sockets=3DX, cores=3DY
> > > -smp N, maxcpus=3DM, sockets=3DX, cores=3DY, threads=3DZ
> > >
> > > and disallow the other strange and rare formats that shouldn't be pro=
vided.
> > >
> > > It's reasonable to block the topology configuration which is not usef=
ul
> > > currently. I will add the requirement for "cpus=3D=3Dmaxcpus" in this=
 fuction
> > > if the possible conflict with existing command lines is not a big pro=
blem.
> >
> > Hi Yanan,
> > Makes sense. I did see your other patch-set in which cluster support ha=
s been
> > added. Are we deferring that too?
>=20
> The merge of that needs to be deferred, but for a different reason. It
> shouldn't impact hot plug, because if hot plug doesn't like clusters,
> then one could configure a topology which doesn't have clusters. But,

yes, agreed.

> it can't be merged to QEMU until the kernel has merged its support.

sure.



