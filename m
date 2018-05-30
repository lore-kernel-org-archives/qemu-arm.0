Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4828732wre;
        Wed, 30 May 2018 07:47:25 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKF4GvmsoIhBpTZvLqNm+8ByuEJC7nvvdfD+nXbR5Z/RcU/MnEjxAeqTL9UtHWbr493ROAr
X-Received: by 2002:ae9:c00f:: with SMTP id u15-v6mr2611905qkk.383.1527691645105;
        Wed, 30 May 2018 07:47:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527691645; cv=none;
        d=google.com; s=arc-20160816;
        b=e7O5V+EMP2fpyoqd5d0S3elkfNDvKokdNiNJnXuPVG8YpEopnRk4pKks0QkJWn0Zwm
         YQ6wYPgt8fyGEfSIPS7E71ecUi5nHrP8F5X+znwDND7M4NsiDgLOCXrSIkKJLBGhat+J
         cvNOsRns919oKCiISoLpXGbFhfVd8LEY5WAjcptpaMvedz8L/F0gH0n/i7Hao6gjoj/c
         k5+hyP1q3A644kH+WNisrNqh9q2FIP8UZEQ+2sfNv1EaOX/HTIy58aP3tRzsYIz8a88k
         T2XjfGRgUCvxZCEPSXtIT5JBD9GLx7OrfHYHcl7znc9vaF2hLxsGoQ/h4YVfO2k013Od
         Khhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic:to
         :from:arc-authentication-results;
        bh=ZtmfxIaCiVBfE5seAQLSgqq6lqHXNO/jZvusZKfZERI=;
        b=nkURFJogsHwlPaMWKTzOXf/GSdd7JQX8wWOLuaQhvLFoYUxfhCXud+mv5URmKpxqP1
         FvnScHrWuK7xRDFTvKjYOesEDdxeczubezdpM4kOkr4psmM682qivH++YWcScN76kph7
         tsVsS1XQ5BXhn7x9Lm1CdHZGGSDEHF/p+xyDU/bdH8Mep4QkzWEfGw2pZojXhtDLLiKH
         YB+rFqiwz01M2l3UAzfsLirsqdiSwROJ1bNhk4TsBzpPBOmnmZilaf/CGhyfG5EOBYXn
         M38vNIMLrQduBp4QWseMomdbpp9y4kRN16SRfhNWsNvkCnyiju+Zs+HNBWpMmNBLmgc+
         gO3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c37-v6si5071427qta.384.2018.05.30.07.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 07:47:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39089 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO2No-00073D-HZ
	for alex.bennee@linaro.org; Wed, 30 May 2018 10:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2NV-00070N-SD
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:47:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2NR-0001Rb-Bq
	for qemu-arm@nongnu.org; Wed, 30 May 2018 10:47:05 -0400
Received: from lhrrgout.huawei.com ([194.213.3.17]:4229 helo=huawei.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
	id 1fO2NR-0001Qr-1Z; Wed, 30 May 2018 10:47:01 -0400
Received: from lhreml701-cah.china.huawei.com (unknown [172.18.7.108])
	by Forcepoint Email with ESMTP id 29424297139F6;
	Wed, 30 May 2018 15:46:58 +0100 (IST)
Received: from FRAEMA707-CHM.china.huawei.com (10.206.14.56) by
	lhreml701-cah.china.huawei.com (10.201.108.42) with Microsoft SMTP
	Server (TLS) id 14.3.382.0; Wed, 30 May 2018 15:46:59 +0100
Received: from FRAEML521-MBX.china.huawei.com ([169.254.1.176]) by
	FRAEMA707-CHM.china.huawei.com ([169.254.7.63]) with mapi id
	14.03.0382.000; Wed, 30 May 2018 16:46:50 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Auger Eric <eric.auger@redhat.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Thread-Topic: [Qemu-devel] [RFC v2 4/6] hw/arm: Changes required to
	accommodate non-contiguous DT mem nodes
Thread-Index: AQHT7SmmjI9wXobakkeIh2MtVt+x86RFIokAgAMZtSA=
Date: Wed, 30 May 2018 14:46:49 +0000
Message-ID: <5FC3163CFD30C246ABAA99954A238FA8386F17E6@FRAEML521-MBX.china.huawei.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-5-shameerali.kolothum.thodi@huawei.com>
	<fb37761c-6e74-5aca-b258-8d8c060ca4dc@redhat.com>
In-Reply-To: <fb37761c-6e74-5aca-b258-8d8c060ca4dc@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.237]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.213.3.17
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 4/6] hw/arm: Changes required
 to accommodate non-contiguous DT mem nodes
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
	"drjones@redhat.com" <drjones@redhat.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	Zhaoshenglong <zhaoshenglong@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wn9qSKjbXXA0

Hi Eric,

> -----Original Message-----
> From: Auger Eric [mailto:eric.auger@redhat.com]
> Sent: Monday, May 28, 2018 3:22 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
> qemu-devel@nongnu.org; qemu-arm@nongnu.org
> Cc: peter.maydell@linaro.org; drjones@redhat.com; Jonathan Cameron
> <jonathan.cameron@huawei.com>; Linuxarm <linuxarm@huawei.com>;
> alex.williamson@redhat.com; Zhaoshenglong <zhaoshenglong@huawei.com>;
> imammedo@redhat.com
> Subject: Re: [Qemu-devel] [RFC v2 4/6] hw/arm: Changes required to
> accommodate non-contiguous DT mem nodes
>=20
> Hi Shameer,
>=20
> On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> > This makes changes to the DT mem node creation such that its easier
> > to add non-contiguous mem modeled as non-pluggable and a pc-dimm
> > mem later.
> See comments below. I think you should augment the description here with
> what the patch exactly adds:
> - a new helper function
> - a new dimm node?
>=20
> and if possible split functional changes into separate patches?

Agree. It is better to split this.

> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > ---
> >  hw/arm/boot.c        | 91 ++++++++++++++++++++++++++++++++++++--------=
--
> ------
> >  include/hw/arm/arm.h | 12 +++++++
> >  2 files changed, 75 insertions(+), 28 deletions(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index 26184bc..73db0aa 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -486,6 +486,27 @@ static void fdt_add_psci_node(void *fdt)
> >      qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
> >  }
> >
> > +static char *create_memory_fdt(void *fdt, uint32_t acells, hwaddr
> mem_base,
> > +                                          uint32_t scells, hwaddr mem_=
len)
> Other dt node creation functions are named fdt_add_*_node

Ok.

> > +{
> > +    char *nodename =3D NULL;
> > +    int rc;
> > +
> > +    nodename =3D g_strdup_printf("/memory@%" PRIx64, mem_base);
> > +    qemu_fdt_add_subnode(fdt, nodename);
> > +    qemu_fdt_setprop_string(fdt, nodename, "device_type", "memory");
> > +    rc =3D qemu_fdt_setprop_sized_cells(fdt, nodename, "reg", acells,
> mem_base,
> > +                                      scells, mem_len);
> > +    if (rc < 0) {
> > +        fprintf(stderr, "couldn't set %s/reg\n", nodename);
> > +        g_free(nodename);
> > +        return NULL;
> > +    }
> > +
> > +    return nodename;
> > +}
> > +
> > +
> >  /**
> >   * load_dtb() - load a device tree binary image into memory
> >   * @addr:       the address to load the image at
> > @@ -567,50 +588,64 @@ static int load_dtb(hwaddr addr, const struct
> arm_boot_info *binfo,
> >          goto fail;
> >      }
> >
> > +    /*
> > +     * Turn the /memory node created before into a NOP node, then crea=
te
> > +     * /memory@addr nodes for all numa nodes respectively.
> > +     */
> > +    qemu_fdt_nop_node(fdt, "/memory");
> I don't really understand why this gets moved outside of the if
> (nb_numa_nodes > 0) { check. Also the comment above mention numa nodes
> whereas it are not necessarily in the numa case anymore.

Hmm..I think this is because virt.c has a create_fdt() where "/memory " sub=
node
is created. May be I can keep that and update with non-plug mem and create =
a new
"/memory @" for pc-dimm case. I will double check.

> > +
> >      if (nb_numa_nodes > 0) {
> > -        /*
> > -         * Turn the /memory node created before into a NOP node, then =
create
> > -         * /memory@addr nodes for all numa nodes respectively.
> > -         */
> > -        qemu_fdt_nop_node(fdt, "/memory");
> > +        hwaddr mem_sz;
> > +
> >          mem_base =3D binfo->loader_start;
> > +        mem_sz =3D binfo->ram_size;
> >          for (i =3D 0; i < nb_numa_nodes; i++) {
> > -            mem_len =3D numa_info[i].node_mem;
> > -            nodename =3D g_strdup_printf("/memory@%" PRIx64, mem_base)=
;
> > -            qemu_fdt_add_subnode(fdt, nodename);
> > -            qemu_fdt_setprop_string(fdt, nodename, "device_type", "mem=
ory");
> > -            rc =3D qemu_fdt_setprop_sized_cells(fdt, nodename, "reg",
> > -                                              acells, mem_base,
> > +            mem_len =3D MIN(numa_info[i].node_mem, mem_sz);
> I fail to understand how this change relates to the topic of this patch.
> If this adds a consistency check, this may be put in another patch?

Yes. It is not related to this patch per se. But without this and some of t=
he=20
related mem_len/ mem_sz  changes below it will end up creating more num
of memory nodes as the numa mem info is populated much earlier than we
modify the ram_size(non-plug) info. I can move this and your related commen=
t
for acpi patch (5/6) to a separate patch.

> > +
> > +            nodename =3D create_memory_fdt(fdt, acells, mem_base,
> >                                                scells, mem_len);
> You could simplify the review by just introducing the new dt node
> creation function in a 1st patch and then introduce the changes to
> support non contiguous DT mem nodes.

Ok. I will split.

> > -            if (rc < 0) {
> > -                fprintf(stderr, "couldn't set %s/reg for node %d\n", n=
odename,
> > -                        i);
> > +            if (!nodename) {
> >                  goto fail;
> >              }
> >
> >              qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id", i);
> > -            mem_base +=3D mem_len;
> >              g_free(nodename);
> > +            mem_base +=3D mem_len;
> > +            mem_sz -=3D mem_len;
> > +            if (!mem_sz) {
> > +                break;
> So what does it mean practically if we break here. Not all the num nodes
> will function? Outputting a mesg for the end user may be useful.

The break here means we have populated mem nodes for non-plug ram case
and the remaining mem(if any) will be based on the pc-dimm case. Yes, it=20
is possible that Guest kernel will report memory-less numa nodes. I will ad=
d
a msg here.

> > +           }
> >          }
> > -    } else {
> > -        Error *err =3D NULL;
> >
> > -        rc =3D fdt_path_offset(fdt, "/memory");
> > -        if (rc < 0) {
> > -            qemu_fdt_add_subnode(fdt, "/memory");
> > -        }
> > +        /* Create the node for initial pc-dimm ram, if any */
> > +        if (binfo->dimm_mem) {
> >
> > -        if (!qemu_fdt_getprop(fdt, "/memory", "device_type", NULL, &er=
r)) {
> > -            qemu_fdt_setprop_string(fdt, "/memory", "device_type", "me=
mory");
> > +            nodename =3D create_memory_fdt(fdt, acells, binfo->dimm_me=
m-
> >base,
> > +                                              scells, binfo->dimm_mem-=
>size);
> > +            if (!nodename) {
> > +                goto fail;
> > +            }
> > +            qemu_fdt_setprop_cell(fdt, nodename, "numa-node-id",
> > +                                                 binfo->dimm_mem->node=
);
> > +            g_free(nodename);
> >          }
> >
> > -        rc =3D qemu_fdt_setprop_sized_cells(fdt, "/memory", "reg",
> > -                                          acells, binfo->loader_start,
> > -                                          scells, binfo->ram_size);
> > -        if (rc < 0) {
> > -            fprintf(stderr, "couldn't set /memory/reg\n");
> > +    } else {
> > +
> > +        nodename =3D create_memory_fdt(fdt, acells, binfo->loader_star=
t,
> > +                                         scells, binfo->ram_size);
> > +        if (!nodename) {
> >              goto fail;
> >          }
> > +
> > +        if (binfo->dimm_mem) {
> > +            nodename =3D create_memory_fdt(fdt, acells, binfo->dimm_me=
m-
> >base,
> > +                                              scells, binfo->dimm_mem-=
>size);
> > +            if (!nodename) {
> > +                goto fail;
> > +            }
> > +            g_free(nodename);
> > +        }
> as this code gets duplicated, a helper function may be relevant?

Ok.

Thanks,
Shameer

> Thanks
>=20
> Eric
> >      }
> >
> >      rc =3D fdt_path_offset(fdt, "/chosen");
> > diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> > index ce769bd..0ee3b4e 100644
> > --- a/include/hw/arm/arm.h
> > +++ b/include/hw/arm/arm.h
> > @@ -48,6 +48,12 @@ typedef struct {
> >      ARMCPU *cpu; /* handle to the first cpu object */
> >  } ArmLoadKernelNotifier;
> >
> > +struct dimm_mem_info {
> > +    int node;
> > +    hwaddr base;
> > +    hwaddr size;
> > +};
> > +
> >  /* arm_boot.c */
> >  struct arm_boot_info {
> >      uint64_t ram_size;
> > @@ -124,6 +130,12 @@ struct arm_boot_info {
> >      bool secure_board_setup;
> >
> >      arm_endianness endianness;
> > +
> > +    /* This is used to model a pc-dimm based mem if the valid iova reg=
ion
> > +     * is non-contiguous.
> > +     */
> > +    struct dimm_mem_info *dimm_mem;
> > +
> >  };
> >
> >  /**
> >
