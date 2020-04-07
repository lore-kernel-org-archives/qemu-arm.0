Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp5284255lfi;
        Tue, 7 Apr 2020 07:34:24 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ1KfNxcOAjlsrKfhIaC92xdA/thk1gTL/5vV14VO1tghtBq6QCqu20hVmkSHepy+YGW+Xs
X-Received: by 2002:a37:270c:: with SMTP id n12mr2567539qkn.228.1586270064335;
        Tue, 07 Apr 2020 07:34:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586270064; cv=none;
        d=google.com; s=arc-20160816;
        b=k6XJwwNzIOfsAg4APZPXqhYceASGcvvAX/5H5w+6AGMd9B2gHjq22mAsqH2Sk8Kt/3
         TLVZdnT3L5ECPhhLWEzffe3kTQ0Abul03WuJLdc7GPTMyV2EyLAC0ZvjLsqJ2H84oXJl
         X5Ij56qh+2Rak8pLB5Xin6P1zSR4JcOlCSn0awo8DofxpEJIXo9duu/RmZ8EndnZua1w
         M4evO12DhLGw6mF34OlvPahSh46OXKyV/fLWJE6A7p2CmVIOvQVM3jptz8vWn7EWtlrZ
         yOqy3EloaQId+WAcXr8Nn90IX/GMucbm/2QbBYgoSXPOv6BNFnLvaaE09Jqayt2e9ulU
         jGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=G87QTEUQN/ZhiqAN34hjq5vWjWfmn5uz9Hp0Bk1AOag=;
        b=wqJ/E9chtXjP5911T17W4PcfWrwdNoUCmHTpj/2f8Ylm0f9XhV2nOev6jgGdjTvpD/
         TOtQTzE+rh92AMoVdy42nrtvMZL+9vrdW4AQ9hB4nmIVtE9O2T3M9IQzTuDm+2VWReMQ
         c7JDAQS6cZy2zDvgllvMc3+qhmK1L7zmPMtY5dOiPNuUsB86XXuFcDwC4RXFjCOl86BV
         rUtNERB6viwgMXmC8FSJFJZI69AUfifF/dHRGmnATQveiGBxPbnlaQQRDFBrqV+2cPmw
         c/ksIpJKtlGvyCVA7OHqeluKflDZEa3PpjlGYWOb4OguNTsXoATbbCjV05v9dVbAjCiZ
         Sd9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R3Z3lvKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bh17si2017186qvb.9.2020.04.07.07.34.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 07:34:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R3Z3lvKl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLpJ1-0004Bh-Nx
	for alex.bennee@linaro.org; Tue, 07 Apr 2020 10:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jLpIs-00048g-Lt
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 10:34:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jLpIq-0003ZK-Th
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 10:34:14 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44300
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jLpIq-0003Yo-P9
 for qemu-arm@nongnu.org; Tue, 07 Apr 2020 10:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586270051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G87QTEUQN/ZhiqAN34hjq5vWjWfmn5uz9Hp0Bk1AOag=;
 b=R3Z3lvKl2xdP1DyeCux4IA+X/wmtBBEqcSDwJFYatujRrasNiLIR8PAkU6cNPtqP5NnhVL
 pJrOfmuj82G3QSm3VUGDwktPTU+clz0stVWfY2vW64HFZL4ChSLXyqJXwMVXQd8VpyqW7f
 2/2/rN26nUHA8z0TCjjcuLEsdjo2pkA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-gJK_6_tbOrakoIyOlHlNfQ-1; Tue, 07 Apr 2020 10:34:09 -0400
X-MC-Unique: gJK_6_tbOrakoIyOlHlNfQ-1
Received: by mail-wr1-f72.google.com with SMTP id y1so2024436wrp.5
 for <qemu-arm@nongnu.org>; Tue, 07 Apr 2020 07:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n2EkigPvD/rR/2AozXAt3nrhY0UGHS+mDCKzb5agLKw=;
 b=oxCFsFk/5+zVhLbabP9MFT/xLUej5ETlfajFqOAjC2xmqSX6U5VGzVCrM3D9MTyP2W
 QkC+98PKr8nLAMpLQakomu/gwL+NLDagZx2O1zVt99Y8vRRh2/7uWEvvYVjzqG1ifVvP
 ool9Pn4OpiDVY7bgbkdlYNOWqZj+jiYmQDecgzhR2eyiKmLu97xtM+IPxdqGmMqfZxN/
 3zHXkrDMl7wSYEIaanmRLu2C/aJNR7Hsa2+zi90wQTRpWpfbF5HsekAKJUknIZw2xctC
 YmYrrYL+U1/asBA2plfC0Yh4276N1IKKzfwm2tKkhfe9Pnq+c8zLvyg5OVvXGh7iAI7r
 j01A==
X-Gm-Message-State: AGi0PuY2lgqzhveDZ//nZ/vgwBa9VIMg0pYYCdLWLJ8Qbd8OGQQxYmuH
 ms+TEK0hct4CWi+yXFGWeCc3ywDvn1arlMMoZoWePNnEnL8XU9PgAb8k1YXk9r5ZdysZq6pvATQ
 SsjE7zHKu000x
X-Received: by 2002:a5d:6543:: with SMTP id z3mr353602wrv.396.1586270048575;
 Tue, 07 Apr 2020 07:34:08 -0700 (PDT)
X-Received: by 2002:a5d:6543:: with SMTP id z3mr353499wrv.396.1586270047486;
 Tue, 07 Apr 2020 07:34:07 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id k9sm13541896wrn.89.2020.04.07.07.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 07:34:06 -0700 (PDT)
Date: Tue, 7 Apr 2020 10:34:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH for-5.0 v2 2/3] fw_cfg: Migrate ACPI table mr sizes
 separately
Message-ID: <20200407103340-mutt-send-email-mst@kernel.org>
References: <20200403101827.30664-1-shameerali.kolothum.thodi@huawei.com>
 <20200403101827.30664-3-shameerali.kolothum.thodi@huawei.com>
 <00b69974-4b63-0c7c-c6ad-ed0f2eb712b9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <00b69974-4b63-0c7c-c6ad-ed0f2eb712b9@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 shannon.zhaosl@gmail.com, linuxarm@huawei.com, qemu-devel@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, dgilbert@redhat.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, xuwei5@hisilicon.com,
 imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/RkGpBZeaLG

On Tue, Apr 07, 2020 at 04:17:46PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 4/3/20 12:18 PM, Shameer Kolothum wrote:
> > Any sub-page size update to ACPI MRs will be lost during
> > migration, as we use aligned size in ram_load_precopy() ->
> > qemu_ram_resize() path. This will result in inconsistency in
> > FWCfgEntry sizes between source and destination. In order to avoid
> > this, save and restore them separately during migration.
> >=20
> > Up until now, this problem may not be that relevant for x86 as both
> > ACPI table and Linker MRs gets padded and aligned. Also at present,
> > qemu_ram_resize() doesn't invoke callback to update FWCfgEntry for
> > unaligned size changes. But since we are going to fix the
> > qemu_ram_resize() in the subsequent patch, the issue may become
> > more serious especially for RSDP MR case.
> >=20
> > Moreover, the issue will soon become prominent in arm/virt as well
> > where the MRs are not padded or aligned at all and eventually have
> > acpi table changes as part of future additions like NVDIMM hot-add
> > feature.
> >=20
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > ---
> > v1 --> v2
> >   - Changed *_mr_size from size_t to uint64_t to address portability.
> >   - post_copy only done if sizes are not aligned.
> >=20
> > Please find previous discussions here,
> > https://patchwork.kernel.org/patch/11339591/#23140343
> > ---
> >   hw/core/machine.c         |  1 +
> >   hw/nvram/fw_cfg.c         | 91 ++++++++++++++++++++++++++++++++++++++=
-
> >   include/hw/nvram/fw_cfg.h |  6 +++
> >   3 files changed, 97 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index de0c425605..c1a444cb75 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -39,6 +39,7 @@ GlobalProperty hw_compat_4_2[] =3D {
> >       { "usb-redir", "suppress-remote-wake", "off" },
> >       { "qxl", "revision", "4" },
> >       { "qxl-vga", "revision", "4" },
> > +    { "fw_cfg", "acpi-mr-restore", "false" },
> >   };
> >   const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat_4_2);
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index 179b302f01..4be6c9d9fd 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -39,6 +39,7 @@
> >   #include "qemu/config-file.h"
> >   #include "qemu/cutils.h"
> >   #include "qapi/error.h"
> > +#include "hw/acpi/aml-build.h"
> >   #define FW_CFG_FILE_SLOTS_DFLT 0x20
> > @@ -610,6 +611,55 @@ bool fw_cfg_dma_enabled(void *opaque)
> >       return s->dma_enabled;
> >   }
> > +static bool fw_cfg_acpi_mr_restore(void *opaque)
> > +{
> > +    FWCfgState *s =3D opaque;
> > +    bool mr_aligned;
> > +
> > +    mr_aligned =3D QEMU_IS_ALIGNED(s->table_mr_size, qemu_real_host_pa=
ge_size) &&
> > +                 QEMU_IS_ALIGNED(s->linker_mr_size, qemu_real_host_pag=
e_size) &&
> > +                 QEMU_IS_ALIGNED(s->rsdp_mr_size, qemu_real_host_page_=
size);
> > +    return s->acpi_mr_restore && !mr_aligned;
>=20
> This code is hard to review.
>=20
> Is this equivalent?
>=20
>     if (!s->acpi_mr_restore) {
>         return false;
>     }
>     if (!QEMU_IS_ALIGNED(s->table_mr_size, qemu_real_host_page_size)) {
>         return false;
>     }
>     if (!QEMU_IS_ALIGNED(s->linker_mr_size, qemu_real_host_page_size)) {
>         return false;
>     }
>     if (!QEMU_IS_ALIGNED(s->rsdp_mr_size, qemu_real_host_page_size)) {
>         return false;
>     }
>     return true;

I think I prefer the original version though. Matter of taste?

> > +}
> > +
> > +static void fw_cfg_update_mr(FWCfgState *s, uint16_t key, size_t size)
> > +{
> > +    MemoryRegion *mr;
> > +    ram_addr_t offset;
> > +    int arch =3D !!(key & FW_CFG_ARCH_LOCAL);
> > +    void *ptr;
> > +
> > +    key &=3D FW_CFG_ENTRY_MASK;
> > +    assert(key < fw_cfg_max_entry(s));
> > +
> > +    ptr =3D s->entries[arch][key].data;
> > +    mr =3D memory_region_from_host(ptr, &offset);
> > +
> > +    memory_region_ram_resize(mr, size, &error_abort);
> > +}
> > +
> > +static int fw_cfg_acpi_mr_restore_post_load(void *opaque, int version_=
id)
> > +{
> > +    FWCfgState *s =3D opaque;
> > +    int i, index;
> > +
> > +    assert(s->files);
> > +
> > +    index =3D be32_to_cpu(s->files->count);
> > +
> > +    for (i =3D 0; i < index; i++) {
> > +        if (!strcmp(s->files->f[i].name, ACPI_BUILD_TABLE_FILE)) {
> > +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->table_mr_siz=
e);
> > +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_LOADER_FILE=
)) {
> > +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->linker_mr_si=
ze);
> > +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_RSDP_FILE))=
 {
> > +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->rsdp_mr_size=
);
> > +        }
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> >   static const VMStateDescription vmstate_fw_cfg_dma =3D {
> >       .name =3D "fw_cfg/dma",
> >       .needed =3D fw_cfg_dma_enabled,
> > @@ -619,6 +669,20 @@ static const VMStateDescription vmstate_fw_cfg_dma=
 =3D {
> >       },
> >   };
> > +static const VMStateDescription vmstate_fw_cfg_acpi_mr =3D {
> > +    .name =3D "fw_cfg/acpi_mr",
> > +    .version_id =3D 1,
> > +    .minimum_version_id =3D 1,
> > +    .needed =3D fw_cfg_acpi_mr_restore,
> > +    .post_load =3D fw_cfg_acpi_mr_restore_post_load,
> > +    .fields =3D (VMStateField[]) {
> > +        VMSTATE_UINT64(table_mr_size, FWCfgState),
> > +        VMSTATE_UINT64(linker_mr_size, FWCfgState),
> > +        VMSTATE_UINT64(rsdp_mr_size, FWCfgState),
> > +        VMSTATE_END_OF_LIST()
> > +    },
> > +};
> > +
> >   static const VMStateDescription vmstate_fw_cfg =3D {
> >       .name =3D "fw_cfg",
> >       .version_id =3D 2,
> > @@ -631,6 +695,7 @@ static const VMStateDescription vmstate_fw_cfg =3D =
{
> >       },
> >       .subsections =3D (const VMStateDescription*[]) {
> >           &vmstate_fw_cfg_dma,
> > +        &vmstate_fw_cfg_acpi_mr,
> >           NULL,
> >       }
> >   };
> > @@ -815,6 +880,23 @@ static struct {
> >   #define FW_CFG_ORDER_OVERRIDE_LAST 200
> >   };
> > +/*
> > + * Any sub-page size update to these table MRs will be lost during mig=
ration,
> > + * as we use aligned size in ram_load_precopy() -> qemu_ram_resize() p=
ath.
> > + * In order to avoid the inconsistency in sizes save them seperately a=
nd
> > + * migrate over in vmstate post_load().
> > + */
> > +static void fw_cfg_acpi_mr_save(FWCfgState *s, const char *filename, s=
ize_t len)
> > +{
> > +    if (!strcmp(filename, ACPI_BUILD_TABLE_FILE)) {
> > +        s->table_mr_size =3D len;
> > +    } else if (!strcmp(filename, ACPI_BUILD_LOADER_FILE)) {
> > +        s->linker_mr_size =3D len;
> > +    } else if (!strcmp(filename, ACPI_BUILD_RSDP_FILE)) {
> > +        s->rsdp_mr_size =3D len;
> > +    }
> > +}
> > +
> >   static int get_fw_cfg_order(FWCfgState *s, const char *name)
> >   {
> >       int i;
> > @@ -914,6 +996,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const=
 char *filename,
> >       trace_fw_cfg_add_file(s, index, s->files->f[index].name, len);
> >       s->files->count =3D cpu_to_be32(count+1);
> > +    fw_cfg_acpi_mr_save(s, filename, len);
> >   }
> >   void fw_cfg_add_file(FWCfgState *s,  const char *filename,
> > @@ -937,6 +1020,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char=
 *filename,
> >               ptr =3D fw_cfg_modify_bytes_read(s, FW_CFG_FILE_FIRST + i=
,
> >                                              data, len);
> >               s->files->f[i].size   =3D cpu_to_be32(len);
> > +            fw_cfg_acpi_mr_save(s, filename, len);
> >               return ptr;
> >           }
> >       }
> > @@ -973,7 +1057,10 @@ static void fw_cfg_machine_ready(struct Notifier =
*n, void *data)
> >       qemu_register_reset(fw_cfg_machine_reset, s);
> >   }
> > -
> > +static Property fw_cfg_properties[] =3D {
> > +    DEFINE_PROP_BOOL("acpi-mr-restore", FWCfgState, acpi_mr_restore, t=
rue),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> >   static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
> >   {
> > @@ -1097,6 +1184,8 @@ static void fw_cfg_class_init(ObjectClass *klass,=
 void *data)
> >       dc->reset =3D fw_cfg_reset;
> >       dc->vmsd =3D &vmstate_fw_cfg;
> > +
> > +    device_class_set_props(dc, fw_cfg_properties);
> >   }
> >   static const TypeInfo fw_cfg_info =3D {
> > diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> > index b5291eefad..25d9307018 100644
> > --- a/include/hw/nvram/fw_cfg.h
> > +++ b/include/hw/nvram/fw_cfg.h
> > @@ -53,6 +53,12 @@ struct FWCfgState {
> >       dma_addr_t dma_addr;
> >       AddressSpace *dma_as;
> >       MemoryRegion dma_iomem;
> > +
> > +    /* restore during migration */
> > +    bool acpi_mr_restore;
> > +    uint64_t table_mr_size;
> > +    uint64_t linker_mr_size;
> > +    uint64_t rsdp_mr_size;
> >   };
> >   struct FWCfgIoState {
> >=20

