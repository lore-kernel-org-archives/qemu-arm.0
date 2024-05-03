Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp39184ejc;
        Fri, 3 May 2024 12:59:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDJBNc72bRBcq3cCucg6/ZxGkrud0akxAL7a2kV7ZzHyLqOjtulwweg5i9EAnq5X4ArXH0gbuM42GgFwg6JWcWRdejqzc5
X-Google-Smtp-Source: AGHT+IHC+tOzRXRHHj0WRLvn5Ifq/z2YotlrLloXd65OphPIufpxgV3CeoMfxIx8kyoDf5XN/rys
X-Received: by 2002:a5d:6b81:0:b0:349:bd11:1bea with SMTP id n1-20020a5d6b81000000b00349bd111beamr2675050wrx.11.1714766374036;
        Fri, 03 May 2024 12:59:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714766374; cv=none;
        d=google.com; s=arc-20160816;
        b=iUY+4TLQs6Hp8y9oEmzpO+1UW6JwV3ZGEX4kfzTL7zAKLlZ4WnYrbUs2OxqKsGlAkM
         vDdphzD0qxRMI9IvnBfB/XTbcatPLINFgStdh6N9jg/W8lvHc+lzqqs197IpYQd80kMw
         6t5t2PHzqqINUWU01/dp1kerR9cxeALLc/0ZwF7/VbS2G43q4xdSP0TO3vpBIBd4zQMb
         bxrR+A9Dofduzqyu5CiMrmiGmuweDjpZXqVBkUVhRJhg9w2SGuRHhiOLhbOx+OuODXX+
         4cRYaUEcOGm6YrkvVbV0YGc9GrdYBDR9gqTIhvIwyDtDjcEuVlxouP6J6y+46OKARQZ5
         0fDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=6JFLbVW8UGYy/v8I8G7IzXcL8Y/xBch5pgSaFGik+XE=;
        fh=JUAhTZNpIXDOxE6oCPYbnC0e2WiCK91mRYTxlCLT+Vs=;
        b=Syg6lfAqhJfHc6enptMZbKibAKdZNyrtW5h1HbN5L8kI1I0VAt/+s7HulNfagZQQiR
         gQEJ40bSqIl43J9vD9BVoNnGt5c3cJ3OvBsQB5ToO/I0ILdoCD8mXkVA8BuDMLshfc04
         HjLKeVrGd5ozuA/a1CuvPh2DfddugE+oa13Ou0kbeD4QpFUDgoHce55wkLjyzpPPCKyz
         aI9t/neKjTMdYRRZmED8LnGGxXpeUjhihPIJmaOvQNTJ5Vgdm2yL5q8icjpqYR2lGhFs
         7SlSMY7Kawr3yuVGQpZixpE6zJcxf7tV3VEwZ38oNfJd+Q2YCHIWUDrHZ5tfuXyF/cA+
         OC/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id g11-20020adff3cb000000b0034a197dfba7si2266846wrp.329.2024.05.03.12.59.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2024 12:59:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4VWM555CgXz67VkC;
	Sat,  4 May 2024 03:56:41 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
	by mail.maildlp.com (Postfix) with ESMTPS id CE790140B54;
	Sat,  4 May 2024 03:59:32 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500006.china.huawei.com (7.191.161.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 3 May 2024 20:59:32 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Fri, 3 May 2024 20:59:32 +0100
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
Thread-Index: AQHadCE2/9My+8CRgUW+VfhEC8BhG7E1MwcAgFEMEIA=
Date: Fri, 3 May 2024 19:59:32 +0000
Message-ID: <6acc5b10128d431ca8bfa26ec45ae0f6@huawei.com>
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-4-salil.mehta@huawei.com> <ZfFEKgpRiEOZo9xd@intel.com>
In-Reply-To: <ZfFEKgpRiEOZo9xd@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.152.25]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: ARYhlN75JCsH

Hello,

Sorry, I missed this earlier.

>  From: Zhao Liu <zhao1.liu@intel.com>
>  Sent: Wednesday, March 13, 2024 6:14 AM
>  To: Salil Mehta <salil.mehta@huawei.com>
> =20
>  Hi Salil,
> =20
>  It seems my comment [1] in v7 was missed, but I still hit the same issue=
. Pls
>  let me paste the previous comment here again.
> =20
>  [1]: https://lore.kernel.org/qemu-devel/ZXCqp32ggIFvUweu@intel.com/

Yes, I have this in my mind.=20

> =20
>  [snip]
> =20
>  > @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>  >      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>  >                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>  >      sysbus_init_mmio(sbd, &ged_st->regs);
>  > +
>  > +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp
>  container",
>  > +                       ACPI_CPU_HOTPLUG_REG_LEN);
>  > +    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container_cpuhp);
>  > +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>  > +                        &s->cpuhp_state, 0);
>  >  }
>  >
> =20
>  I find this cpu_hotplug_hw_init() can still cause qtest errors (for v8) =
on x86
>  platforms as you mentioned in v6:
>  https://lore.kernel.org/qemu-devel/15e70616-6abb-63a4-17d0-
>  820f4a254607@opnsrc.net/T/#m108f102b2fe92b7dd7218f2f942f7b233a9d6a
>  f3
> =20
>  IIUC, microvm machine has its own 'possible_cpus_arch_ids' and that is
>  inherited from its parent x86 machine.
> =20
>  The above error is because device-introspect-test sets the none-machine:
> =20
>  # starting QEMU: exec ./qemu-system-i386 -qtest unix:/tmp/qtest-
>  3094820.sock -qtest-log /dev/null -chardev socket,path=3D/tmp/qtest-
>  3094820.qmp,id=3Dchar0 -mon chardev=3Dchar0,mode=3Dcontrol -display none=
 -
>  audio none -nodefaults -machine none -accel qtest
> =20
>  So what about just checking mc->possible_cpu_arch_ids instead of an
>  assert in cpu_hotplug_hw_init()?
> =20
>  diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c index
>  4b24a2500361..303f1f1f57bc 100644
>  --- a/hw/acpi/cpu.c
>  +++ b/hw/acpi/cpu.c
>  @@ -221,7 +221,10 @@ void cpu_hotplug_hw_init(MemoryRegion *as,
>  Object *owner,
>       const CPUArchIdList *id_list;
>       int i;
> =20
>  -    assert(mc->possible_cpu_arch_ids);
>  +    if (!mc->possible_cpu_arch_ids) {
>  +        return;
>  +    }
>  +


Yes, we can do this with some debug print or trace maybe.


>       id_list =3D mc->possible_cpu_arch_ids(machine);
>       state->dev_count =3D id_list->len;
>       state->devs =3D g_new0(typeof(*state->devs), state->dev_count);
> =20
>  This check seems to be acceptable in the general code path? Not all
>  machines have possible_cpu_arch_ids, after all.

True. BTW, have you tested this with Qtest?

Thanks
Salil.

