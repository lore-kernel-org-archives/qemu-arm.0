Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3562071njc;
        Wed, 6 Nov 2024 06:45:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXrd8o9HFTBo/vAK4+7c5d8ltE3YY3l7P9cgD/nBgpqQVyDC3DfbmhuJjcrRas+dreTQno3FYikUgXzOQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFDDfkHUEtNDozA/3EimWshj9DQ36XWLljUDtGfWAfkTsXGUeWCBwsgUc21vfpAeKf+ccfZ
X-Received: by 2002:a17:903:1c2:b0:20c:a175:1943 with SMTP id d9443c01a7336-210c6c6d9a5mr543368475ad.40.1730904348877;
        Wed, 06 Nov 2024 06:45:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730904348; cv=none;
        d=google.com; s=arc-20240605;
        b=K4rnYnAF0e4aFKanRN1kn+f5shclIZuRsx3aS+ZOQkm8BJ8TKBeMaWFZK/8XOqgfpY
         AqEQu7Zy0eiMGE2KQ231+TTj+F7/I4s8FtB6+6PIQo6XN0j0npneUYDYNx/Q2enX3k8u
         1I6wDrUSZqcta+ekv6e3KYMJumal5rB3J/Tqi15AUKZbLsPkeDZIkZJIu7Usj5BdKZRF
         Casg2PXgsfw8HstgnwkTNOkkeJScNbbNe3Q/c2pCHldWvxP6K2BHUmBb+WMtXkllLmK1
         vTlaer9IpoJqHmDkUxd4xuvKt2RetB9buV2SkSYFJHVT5CrdjA7dgq8rO6Nyes7MsJAR
         9coQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=9UxL0cPmccouLgbuDTBY6/YfzFLNIqRDwPJlyvXOPck=;
        fh=Nez8zrmKCjCutbNo/j68/izbwT5Kw1c1Hq/bj7m1JEA=;
        b=ELaPCTmplz369CxPIV+0AjPb7nicHs6buz8G6efNR5cbH8sBf2k7+CZMoC7Ce/7kxf
         j2AQIyB06SVQSayGOZm1ww/ld/YGG9JB46F+Ao47AdmMQYMzFFZ17d+eDJW+MHZ54f1f
         NfziQPAeIJuN85/FQDaGGNtyNhE0baJuvmIUToKKTzafaHdN6bvRrJQSg860DHfqkp7d
         /rbmb2f0brtzS4Br4IHkpfbJ+E5r/YfIJ6dqc1wfHJsFZAMNerf9B+nWAtQVJT+WqCJ1
         pbUoreN8I/Sv4532vtdE6ASjqsmvm40Cq7bClvrJYX47wgmZNpP9bBHouWJ9nPK0XOll
         SLLQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-2115da995c5si48420635ad.402.2024.11.06.06.45.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2024 06:45:48 -0800 (PST)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xk7Gm55Vfz6J6sP;
	Wed,  6 Nov 2024 22:42:56 +0800 (CST)
Received: from frapeml500006.china.huawei.com (unknown [7.182.85.219])
	by mail.maildlp.com (Postfix) with ESMTPS id 36396140B2F;
	Wed,  6 Nov 2024 22:45:44 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 15:45:42 +0100
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Wed, 6 Nov 2024 15:45:42 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "anisinha@redhat.com" <anisinha@redhat.com>,
	"eduardo@habkost.net" <eduardo@habkost.net>, "marcel.apfelbaum@gmail.com"
	<marcel.apfelbaum@gmail.com>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "peterx@redhat.com"
	<peterx@redhat.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gshan@redhat.com" <gshan@redhat.com>, "borntraeger@linux.ibm.com"
	<borntraeger@linux.ibm.com>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>,
	"gustavo.romero@linaro.org" <gustavo.romero@linaro.org>
Subject: RE: [PATCH 2/3] Fix: Reverse CPUs presence check logic for x86
 backward compatability
Thread-Topic: [PATCH 2/3] Fix: Reverse CPUs presence check logic for x86
 backward compatability
Thread-Index: AQHbMExwRTIJtUKJlEic/SrRi9Z39bKqNgWAgAAbf+A=
Date: Wed, 6 Nov 2024 14:45:42 +0000
Message-ID: <28a19ad7554e4b70819e1435669eeba3@huawei.com>
References: <20241106130331.205020-1-salil.mehta@huawei.com>
 <20241106130331.205020-3-salil.mehta@huawei.com>
 <20241106145635.77332d7c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241106145635.77332d7c@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.170.112]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: FM3l0/J3+NZA

Hi Igor,

>  From: qemu-arm-bounces+salil.mehta=3Dhuawei.com@nongnu.org <qemu-
>  arm-bounces+salil.mehta=3Dhuawei.com@nongnu.org> On Behalf Of Igor
>  Mammedov
>  Sent: Wednesday, November 6, 2024 1:57 PM
>  To: Salil Mehta <salil.mehta@huawei.com>
> =20
>  On Wed, 6 Nov 2024 13:03:30 +0000
>  Salil Mehta <salil.mehta@huawei.com> wrote:
> =20
>  > Checking `is_present` first can break x86 migration from new Qemu
>  > version to old Qemu. This is because CPRS Bit is not defined in the
>  > older Qemu register block and will always be 0 resulting in check
>  > always failing. Reversing the logic to first check `is_enabled` can
>  > alleviate below problem:
>  >
>  > -                If ((\_SB.PCI0.PRES.CPEN =3D=3D One))
>  > -                {
>  > -                    Local0 =3D 0x0F
>  > +                If ((\_SB.PCI0.PRES.CPRS =3D=3D One))
>  > +                {
>  > +                    If ((\_SB.PCI0.PRES.CPEN =3D=3D One))
>  > +                    {
>  > +                        Local0 =3D 0x0F
>  > +                    }
>  > +                    Else
>  > +                    {
>  > +                        Local0 =3D 0x0D
>  > +                    }
>  >                  }
>  >
>  > Suggested-by: Igor Mammedov <imammedo@redhat.com>
>  'Reported-by' maybe, but certainly not suggested.


No issues. I can change.


> =20
>  After more thinking and given presence is system wide that doesn't chang=
e
>  at runtime, I don't see any reason for introducing presence bit as ABI (=
and
>  undocumented on top of that).


This is a wrong assumption. Presence bit can change in future. We have take=
n
into account this aspect by design in the kernel code as well. Both virtual
and physical CPU hot plug can co-exists or entirely as sole features.  This=
 is
a requirement.


> =20
>  Instead changing AML code to account for it would be better, something l=
ike
>  this:
> =20
>  diff --git a/include/hw/acpi/cpu.h b/include/hw/acpi/cpu.h index
>  32654dc274..4a3e591120 100644
>  --- a/include/hw/acpi/cpu.h
>  +++ b/include/hw/acpi/cpu.h
>  @@ -55,6 +55,7 @@ void cpu_hotplug_hw_init(MemoryRegion *as, Object
>  *owner,  typedef struct CPUHotplugFeatures {
>       bool acpi_1_compatible;
>       bool has_legacy_cphp;
>  +    bool always_present_cpus;


This has to be fetched from architecture code. Please see other changes in =
the V3
patch-set.


>       bool fw_unplugs_cpu;
>       const char *smi_path;
>   } CPUHotplugFeatures;
>  diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c index 5cb60ca8bc..2bcce2b31c
>  100644
>  --- a/hw/acpi/cpu.c
>  +++ b/hw/acpi/cpu.c
>  @@ -452,15 +452,16 @@ void build_cpus_aml(Aml *table, MachineState
>  *machine, CPUHotplugFeatures opts,
> =20
>           method =3D aml_method(CPU_STS_METHOD, 1, AML_SERIALIZED);
>           {
>  +            uint8_t default_sta =3D opts.always_present_cpus?0xd:0;
>               Aml *idx =3D aml_arg(0);
>  -            Aml *sta =3D aml_local(0);
>  +            Aml *sta =3D aml_local(default_sta);
> =20
>               aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>               aml_append(method, aml_store(idx, cpu_selector));
>               aml_append(method, aml_store(zero, sta));
>               ifctx =3D aml_if(aml_equal(is_enabled, one));
>               {
>  -                aml_append(ifctx, aml_store(aml_int(0xF), sta));
>  +                aml_append(ifctx, aml_or(aml_int(0xF), sta, sta));
>               }
>               aml_append(method, ifctx);
>               aml_append(method, aml_release(ctrl_lock))
> =20
>  then for ARM set
>   CPUHotplugFeatures::always_present_cpus =3D true to get present flag
>  always enabled


We MUST fetch this from architecture code as this can dynamically change in
future and hence, we need to keep that flexibility

> =20
>  After that revert _all_ other presence bit related changes that were jus=
t
>  merged.
>  (I did ask to get rid of that in previous reviews but it came back again=
 for no
>  good reason).


The CPUs AML in the V2 patch-set would have broken the x86 functionality.


Thanks
Salil.
