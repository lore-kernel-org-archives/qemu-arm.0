Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1933326ejb;
        Tue, 3 Oct 2023 05:27:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDtq10UWROnO6Y/cPM5t06u1szAIxJPbG5nFpcUsnEORh+PDvasC71KnR4R4yY5MSdrTI9
X-Received: by 2002:a5d:570d:0:b0:321:5e2f:37e1 with SMTP id a13-20020a5d570d000000b003215e2f37e1mr13502944wrv.19.1696336058759;
        Tue, 03 Oct 2023 05:27:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696336058; cv=none;
        d=google.com; s=arc-20160816;
        b=GgwtJbAnqlEi5TK6sz/jArZ+Zx9TJaGRs0qqZrT0RcBHuIg6ppFB2lXo02AeHvR1fJ
         ZTemoHMWyUQHvrH+ZeHdihXscCrpnQiipG5gmgfoMYnT6OXX3q4vtA6IYg1GOzNE8G4k
         lVp9YoOQFKpy27PYuDXaCLtJsNdml+gYnY92Qbs57IVmQlZdwZdD1ovyKZWk0eREZpxd
         807a1NKFdVKs4F31rgbKHNeHodRlVwPYvV8nZo0RSJwXtbSybsoJDQKVIZeyQG5vohRB
         Z4AMDcz1LMQT7gxSpVMRvVE30GM8ykG1wSnOK4ttSscBVgaLiQ//7d21bbYXp0aTCL2t
         f56w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=j531WFSE3H0CP2PcU3N/99ZZhGcugJtU87FrxFjLrU8=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=iwv/mSM6gI9ITuLFWRW2ztWrUS4lKfqxaJfGmzyLCyg0wjuKA/pEfVN8u1dWCM1Hus
         u96uhJp1qxEB2TZS71F+ea87qktQ5iymgpyyoCIHmx9/k8jnbGOBU3dibBd4F8O1ghCs
         O2MrqiGp/iCL4qYZiXhphH2bDdtYzCuli88zbvXOf/D5QjhB3QL60k7Hx/IiNsw3P3we
         oUTXS2h+i4TQg89Lz9tr6Auzs2ouUNl5MrgycC9cjTJT5C6p6M30RhMModJPNl9DoAKO
         iuLy6YAG8Xs3FGdShU9pXT8s+Zgq6OhFk6bFuiTfysr3y91ni4XeAItHi4zIh9R6Fd63
         LTUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id l17-20020adfe9d1000000b00323228004c7si751687wrn.283.2023.10.03.05.27.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Oct 2023 05:27:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500006.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S0H886vgMz6HJhS;
	Tue,  3 Oct 2023 20:24:56 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 3 Oct 2023 13:27:36 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Tue, 3 Oct 2023 13:27:36 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHZ8zPpn9wpwkR00kGhOJ6dnPJS7rA2mfgAgAFHXwCAAAdMgIAAFxrA
Date: Tue, 3 Oct 2023 12:27:36 +0000
Message-ID: <630c00201fd34c8fa307bed9c25bc334@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-2-salil.mehta@huawei.com>
	<20231002165322.00003a2e@Huawei.com>
	<761a05a972ae4aa088b8e984bd89889f@huawei.com>
 <20231003125111.00002013@Huawei.com>
In-Reply-To: <20231003125111.00002013@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.168.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: P4F2+v73Gvcz

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Tuesday, October 3, 2023 12:51 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> philippe@linaro.org; lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev=
;
> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
> will@kernel.org; gshan@redhat.com; rafael@kernel.org;
> alex.bennee@linaro.org; linux@armlinux.org.uk;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.co=
m>
> Subject: Re: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
> {creation,parking} code
>=20
> On Tue, 3 Oct 2023 12:05:11 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > Hi Jonathan,
> >
> > > From: Jonathan Cameron <jonathan.cameron@huawei.com>
> > > Sent: Monday, October 2, 2023 4:53 PM
> > > To: Salil Mehta <salil.mehta@huawei.com>
> > > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> > > philippe@linaro.org; lpieralisi@kernel.org; peter.maydell@linaro.org;
> > > richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux=
.dev;
> > > david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> > > oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
> > > will@kernel.org; gshan@redhat.com; rafael@kernel.org;
> > > alex.bennee@linaro.org; linux@armlinux.org.uk;
> > > darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> > > vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> > > miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> > > <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com=
>;
> > > wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> > > maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawe=
i.com>
> > > Subject: Re: [PATCH V2 01/10] accel/kvm: Extract common KVM vCPU
> > > {creation,parking} code
> > >
> > > On Sat, 30 Sep 2023 01:19:24 +0100
> > > Salil Mehta <salil.mehta@huawei.com> wrote:
> > >
> > > > KVM vCPU creation is done once during the initialization of the VM =
when Qemu
> > > > threads are spawned. This is common to all the architectures.
> > > >
> > > > Hot-unplug of vCPU results in destruction of the vCPU objects in QO=
M but
> > > > the KVM vCPU objects in the Host KVM are not destroyed and their re=
presentative
> > > > KVM vCPU objects/context in Qemu are parked.
> > > >
> > > > Refactor common logic so that some APIs could be reused by vCPU Hot=
plug code.
> > > >
> > > > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > >
> > > Hi Salil,
> > >
> > > A few trivial things inline, plus a question about why
> > > cpu->cpu_index can now be used but kvm_arch_vcpu_id(cpu);
> > > was previously needed.
> >
> > Good point. I used the API because it was returning
> > 'unsigned long' and it was being used across the archs.
> > I thought maybe the size of the index could vary across
> > archs. For example, for PowerPC above API returns vcpu_id
> > which presumably could have different data type than
> > an 'integer'.
> >
> > But after Alex's comment, I was made to believe that this
> > assumption might not be correct and CPU index is an
> > 'integer' across archs and perhaps semantics of above
> > API is not correct.
> >
> > But perhaps original code was functionally correct?
>=20
> I wasn't concerned with the type, but rather that the
> value comes from other places than cpu->cpu_index
> on some architectures.

Sure, I meant there is a reason why type was chosen as 'unsigned long'
and not an 'integer'. Perhaps the value can exceed the 'integer' size
limits because of the way CPU index is being created on certain archs?

If we try to put value from a larger container 'unsigned long' to a
smaller container 'integer' things can go wrong.


[...]

> > >
> > > > +    vcpu->kvm_fd =3D cpu->kvm_fd;
> > > > +    QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> > > > +}
> > > > +
> > > > +int kvm_create_vcpu(CPUState *cpu)
> > > > +{
> > > > +    int vcpu_id =3D cpu->cpu_index;
> > >
> > > See below. I'm not sure why it's safe not to use kvm_arch_vcpu_id()
> > > Seems a few architectures have less than trivial implementations of
> > > that function currently.
> >
> > I doubt this as well. Other architectures like PowerPC are returning
> > different type?
> >
> It wasn't the type that bothered, me but rather that the source of
> the data isn't always cpu->cpu_index so I have no idea if the values
> are consistent.

Got it.

I meant 'unsigned long' return type in the kvm_arch_vcpu_id(). On some
Architectures, the required container size for their vcpu-id could
exceed an 'integer'. Sorry, for not making it clear.

Thanks
Salil.
