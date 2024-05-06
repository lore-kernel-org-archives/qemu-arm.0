Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1440067ejc;
        Mon, 6 May 2024 02:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsN7dsTdhKFkQkPUSgpGUB4oiF/6Tw0QbIrB7zVXp1TMADgDbUn0AX8DcHO9UUEAhEMVsDPiVvz48pXT+NH2tKfFggqqc/
X-Google-Smtp-Source: AGHT+IHE/B8rL7rB1yR+UxF0nYPI82qLD/sqQO9/Naq+0DHPRJl3ptTwYhFEd/9oDA5lfWIfUi3i
X-Received: by 2002:a2e:b1ca:0:b0:2e1:e0cc:e4e1 with SMTP id e10-20020a2eb1ca000000b002e1e0cce4e1mr5374503lja.50.1714987650784;
        Mon, 06 May 2024 02:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714987650; cv=none;
        d=google.com; s=arc-20160816;
        b=j9syg4G1m5158Vylsqo0fBgwg2BeGVeI/Wb8XLBMOlvrLf+sfdBOp6IfY+RLjOStXp
         3w+0V0egTrnJWvTEZXOaaZBbt0M+poCzHO5cMF1EmiWRc73MkYDKbg4FtEfbXyCa4lCD
         UFJLHH1RC9VoePWYXVA1J0MeR3NKHnDFG47GDomUd6vVCyie0ROlLasC7dtFtq4oGZdS
         hiGDiBZBdKAL43Oy+AUCiGUw4WjMzfvHuWUk3NMwlPn7IHpyzMuixcsSRFfBxfY7AYNZ
         fdEez9+BHsH3JPbtpv7p3D7600nmOMrDHSNfO8CehzUAmR2O9MXvTKG7i3+g3sBwAJSS
         W6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=wFZYH6vps3XEI0Q5n+ystOrT/Ruz8qsLNL96+UvSuAs=;
        fh=JUAhTZNpIXDOxE6oCPYbnC0e2WiCK91mRYTxlCLT+Vs=;
        b=unuYj1LlJWAnA3pVEQxFFIMKVhdQ3tUYe/iNA4IBKQKaQkqYMwPLQoUY74uMf1IIXU
         UmCAsLd+i4eISVDk5X6S94aC8kec+1qhprlQbk+f9aNA96SHCQeLdPd576+7EL7UW8zp
         r7bKhNotTuXUwjjbgi3fLgxTJlb9oafIvgcuQ3WHsW0TB931QOn2I7y7ZUA4Tl0np7fK
         F/ZT3BIWmkM2bZJKpnEi4lyNelnsyrGEtVftNHySQCPY51Z8kRscQKqVOFlYZgYwcrBs
         VG4fF+qGRQRXqLeupGQH27HG/gq9nz7buQThkwbcGfUxQLOmhlvW0iqk28rEAFCoy5UN
         eqfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id e41-20020a05600c4ba900b0041eb1af67cesi1784871wmp.94.2024.05.06.02.27.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2024 02:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VXwwG4sNnz6K5tD;
	Mon,  6 May 2024 17:24:30 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 80F6E1400DB;
	Mon,  6 May 2024 17:27:29 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 6 May 2024 10:27:29 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 6 May 2024 10:27:29 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
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
Subject: RE: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to support vCPU
 Hotplug
Thread-Topic: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
Thread-Index: AQHadCE2/9My+8CRgUW+VfhEC8BhG7E1MwcAgFEMEICAA/EUgIAAFh/A
Date: Mon, 6 May 2024 09:27:29 +0000
Message-ID: <9fb53b83fa9e43c5a10eacce2108f7b6@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-4-salil.mehta@huawei.com> <ZfFEKgpRiEOZo9xd@intel.com>
 <6acc5b10128d431ca8bfa26ec45ae0f6@huawei.com> <ZjidcX8p1ERW276J@intel.com>
In-Reply-To: <ZjidcX8p1ERW276J@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.159.236]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: fH69ZS/XT/b8


>  From: Zhao Liu <zhao1.liu@intel.com>
>  Sent: Monday, May 6, 2024 10:06 AM
> =20
>  Hi Salil,
> =20
>  On Fri, May 03, 2024 at 07:59:32PM +0000, Salil Mehta wrote:
>  > Date: Fri, 3 May 2024 19:59:32 +0000
>  > From: Salil Mehta <salil.mehta@huawei.com>
>  > Subject: RE: [PATCH V8 3/8] hw/acpi: Update ACPI GED framework to
>  > support  vCPU Hotplug
>  >
>  > Hello,
>  >
>  > Sorry, I missed this earlier.
>  >
>  > >  From: Zhao Liu <zhao1.liu@intel.com>
>  > >  Sent: Wednesday, March 13, 2024 6:14 AM
>  > >  To: Salil Mehta <salil.mehta@huawei.com>
>  > >
>  > >  Hi Salil,
>  > >
>  > >  It seems my comment [1] in v7 was missed, but I still hit the same
>  > > issue. Pls  let me paste the previous comment here again.
>  > >
>  > >  [1]: https://lore.kernel.org/qemu- devel/ZXCqp32ggIFvUweu@intel.com=
/
>  >
>  > Yes, I have this in my mind.
>  >
>  > >
>  > >  [snip]
>  > >
>  > >  > @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>  > >  >      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops,  ge=
d_st,
>  > >  >                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_CO=
UNT);
>  > >  >      sysbus_init_mmio(sbd, &ged_st->regs);
>  > >  > +
>  > >  > +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp
>  > >  container",
>  > >  > +                       ACPI_CPU_HOTPLUG_REG_LEN);
>  > >  > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
>  > >  > +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>  > >  > +                        &s->cpuhp_state, 0);
>  > >  >  }
>  > >  >
>  > >
>  > >  I find this cpu_hotplug_hw_init() can still cause qtest errors (for
>  > > v8) on x86  platforms as you mentioned in v6:
>  > >  https://lore.kernel.org/qemu-devel/15e70616-6abb-63a4-17d0-820f4a25=
4607@opnsrc.net/T/#m108f102b2fe92b7dd7218f2f942f7b233a9d6af3
>  > >
>  > >  IIUC, microvm machine has its own 'possible_cpus_arch_ids' and that
>  > > is  inherited from its parent x86 machine.
>  > >
>  > >  The above error is because device-introspect-test sets the none-mac=
hine:
>  > >
>  > >  # starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-
>  > > 3094820.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-
>  > >  3094820.qmp,id=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display=
 none
>  > > -  audio none -nodefaults -machine none -accel qtest
>  > >
>  > >  So what about just checking mc->possible_cpu_arch_ids instead of an
>  > > assert in cpu_hotplug_hw_init()?
>  > >
>  > >  diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c index
>  > > 4b24a2500361..303f1f1f57bc 100644
>  > >  --- a/hw/acpi/cpu.c
>  > >  +++ b/hw/acpi/cpu.c
>  > >  @@ -221,7 +221,10 @@ void cpu_hotplug_hw_init(MemoryRegion *as,
>  > > Object *owner,
>  > >       const CPUArchIdList *id_list;
>  > >       int i;
>  > >
>  > >  -    assert(mc->possible_cpu_arch_ids);
>  > >  +    if (!mc->possible_cpu_arch_ids) {
>  > >  +        return;
>  > >  +    }
>  > >  +
>  >
>  >
>  > Yes, we can do this with some debug print or trace maybe.
> =20
>  Here it is just to return early without touching mc->possible_cpu_arch_i=
ds().
>  If you adopt this workaround, then in the meantime I suggest adding a
>  comment to this "if" to clarify that it is for compatibility with certai=
n
>  machines that do not implement mc->possible_cpu_arch_ids().


sure.


> =20
>  > >       id_list =3D mc->possible_cpu_arch_ids(machine);
>  > >       state->dev_count =3D id_list->len;
>  > >       state->devs =3D g_new0(typeof(*state->devs), state->dev_count)=
;
>  > >
>  > >  This check seems to be acceptable in the general code path? Not all
>  > > machines have possible_cpu_arch_ids, after all.
>  >
>  > True. BTW, have you tested this with Qtest?
> =20
>  Yes, by "make check" on x86 platform. This workaround can help us pass t=
he
>  x86 tests.

thanks.

Best
Salil.

