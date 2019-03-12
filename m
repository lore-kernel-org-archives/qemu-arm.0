Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp610880wrs;
        Tue, 12 Mar 2019 08:21:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyd0TiC43PhVL4/Q3xVjeEnzvF/BdJdNXjmed89gaiDG0Oa6hWP7jbmfljIURFzwBPyyi12
X-Received: by 2002:a81:6345:: with SMTP id x66mr29953039ywb.306.1552404114250;
        Tue, 12 Mar 2019 08:21:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552404114; cv=none;
        d=google.com; s=arc-20160816;
        b=rc/ef2bXAmdBmavA+SlT00KuKjh20hboFIPxd7rSDqI4nZUUp50v4zGT9CebJ5JS2G
         5LL9bNPR9W2E3kCrlQ/29hBcje6BmbkcECRxp8reYozG6KKJ8zlI+UOr66B7iQ/8m0qp
         rwprBA+z1N3SKODHakHM/VHP6plNMdDcPk3FbsN/r75ZdJB1RcnL7g+CUuxLDon9KQzc
         pAI11gn/k8zCrNhpb6hZ7J+/eTRXZhfAMIYjNV11UhZzepwzfLQTXimjYUoHDlTjvSQA
         yvaXe3JTPZP/Wl1vBbVXA1ezUYq1vte8V476/HpU3+YgeO/vr5emsu2tJO9fyQoNiGHs
         zpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from;
        bh=kASzlww4omsHnrJwNCcomfHfY1l5Cm/bz36SW24Wqlc=;
        b=fOmpgcHT7d96RMI3eWyEZUFkG/WfNNbZkdiAFQlr5HbCKsVO7ImccJsLs090obANXZ
         06Rv2Newp7BMuilhwu8gckLsMsWNvVw3BBl3e04q1IRSgTT5Dnj9FjcKR0j+XvM90oiV
         M2YyXKEhROMgC0ruF3avXRWnRfAA+XlZfMhj3T6Al5KcvKir5S5nFOxtOvrfPOeJvuEd
         1yY+yAgfBMYXotUOf8qDEVOzOSBmrm6r0Kvf8vBgIR1bG7bQtZIw/+LrwfFrHQbk04cB
         IAK3/c5oEiQvCtz3xOpevDqvFYdaswv9QzqA9lJXm+Zr3Ln00oS2kUFUFadxjS9HduGa
         pyVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si5396747ywg.149.2019.03.12.08.21.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 08:21:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3jE1-0006uG-JR
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 11:21:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3jCu-00066F-Jv
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 11:20:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3j5x-0001QE-Jo
	for qemu-arm@nongnu.org; Tue, 12 Mar 2019 11:13:35 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:45363 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1h3j5s-0001Lo-T7; Tue, 12 Mar 2019 11:13:31 -0400
Received: from lhreml701-cah.china.huawei.com (unknown [172.18.7.106])
	by Forcepoint Email with ESMTP id A22995B102EFDD498E1F;
	Tue, 12 Mar 2019 15:13:21 +0000 (GMT)
Received: from LHREML524-MBB.china.huawei.com ([169.254.3.135]) by
	lhreml701-cah.china.huawei.com ([10.201.108.42]) with mapi id
	14.03.0415.000; Tue, 12 Mar 2019 15:13:11 +0000
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
Thread-Topic: [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM nodes in the DT
Thread-Index: AQHU1aRx9hViP7MrKUKDA7jHJKP06KYGip6AgAGSmyA=
Date: Tue, 12 Mar 2019 15:13:11 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA839305DC1@lhreml524-mbb.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-9-shameerali.kolothum.thodi@huawei.com>
	<20190311155857.78c6703d@redhat.com>
In-Reply-To: <20190311155857.78c6703d@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.176.76.210
Subject: Re: [Qemu-arm] [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM
 nodes in the DT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IeEeNrpS7DHp



> -----Original Message-----
> From: Igor Mammedov [mailto:imammedo@redhat.com]
> Sent: 11 March 2019 14:59
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> eric.auger@redhat.com; peter.maydell@linaro.org;
> shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> <xuwei5@huawei.com>
> Subject: Re: [PATCH v2 08/11] hw/arm/boot: Expose the PC-DIMM nodes in th=
e
> DT
>=20
> On Fri, 8 Mar 2019 11:42:15 +0000
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
> > This patch adds memory nodes corresponding to PC-DIMM regions.
> >
> > NVDIMM and ACPI_NVDIMM configs are not yet set for ARM so we
> > don't need to care about NVDIMM at this stage.
> >
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > ---
> >  hw/arm/boot.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index a830655..4caaf91 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -19,6 +19,7 @@
> >  #include "sysemu/numa.h"
> >  #include "hw/boards.h"
> >  #include "hw/loader.h"
> > +#include "hw/mem/memory-device.h"
> >  #include "elf.h"
> >  #include "sysemu/device_tree.h"
> >  #include "qemu/config-file.h"
> > @@ -522,6 +523,41 @@ static void fdt_add_psci_node(void *fdt)
> >      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
> >  }
> >
> > +static int fdt_add_hotpluggable_memory_nodes(void *fdt,
> > +                                             uint32_t acells,
> uint32_t scells) {
> > +    MemoryDeviceInfoList *info, *info_list =3D qmp_memory_device_list(=
);
> > +    MemoryDeviceInfo *mi;
> > +    int ret =3D 0;
> > +
> > +    for (info =3D info_list; info !=3D NULL; info =3D info->next) {
> > +        mi =3D info->value;
> > +        switch (mi->type) {
> > +        case MEMORY_DEVICE_INFO_KIND_DIMM:
> > +        {
> > +            PCDIMMDeviceInfo *di =3D mi->u.dimm.data;
> > +
> > +            ret =3D fdt_add_memory_node(fdt, acells, di->addr,
> > +                                      scells, di->size, di->node);
> > +            if (ret) {
> > +                fprintf(stderr,
> > +                        "couldn't add PCDIMM /memory@%"PRIx64"
> node\n",
> > +                        di->addr);
> > +                goto out;
> > +            }
> > +            break;
> > +        }
> > +        default:
> > +            fprintf(stderr, "%s memory nodes are not yet supported\n",
> > +                    MemoryDeviceInfoKind_str(mi->type));
> > +            ret =3D -ENOENT;
> > +            goto out;
> > +        }
> > +    }
> > +out:
> > +    qapi_free_MemoryDeviceInfoList(info_list);
> > +    return ret;
> > +}
> > +
> >  int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
> >                   hwaddr addr_limit, AddressSpace *as)
> >  {
> > @@ -621,6 +657,12 @@ int arm_load_dtb(hwaddr addr, const struct
> arm_boot_info *binfo,
> >          }
> >      }
> >
> > +    rc =3D fdt_add_hotpluggable_memory_nodes(fdt, acells, scells);
> According to Eric's test, guest kernel picks this up. So it probably
> should be an opt-in feature to avoid conflict with ACPI definition in DSD=
T.

Ok. My take away from that discussion was that if we properly describe the
PNP0C80 (which is what #06 of this series does) then we don't have to worry
about DT entries as ACPI will "override" it.  But it looks like that is not=
 the case
and describing DT will anyway cause the memory being end up in UEFI
GeTMemoryMap() and results in being used as normal memory early at boot.

Hi Eric,

How do we verify that this is actually happening? I tried running the /proc=
/meminfo
on a Qemu build upto #06 of this series, and it reported memory including t=
he
cold plugged dimm memory.

But not sure how to verify that this dimm mem is being treated as normal me=
m on
boot time or not? Please let me know.

Thanks,
Shameer


> > +    if (rc < 0) {
> > +        fprintf(stderr, "couldn't add hotpluggable memory nodes\n");
> > +        goto fail;
> > +    }
> > +
> >      rc =3D fdt_path_offset(fdt, "/chosen");
> >      if (rc < 0) {
> >          qemu_fdt_add_subnode(fdt, "/chosen");

