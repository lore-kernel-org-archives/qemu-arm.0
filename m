Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4072816lfi;
        Tue, 31 Mar 2020 08:03:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtmUniGrDQ+WHrTdEFjYp6GCnTwoBSTW5pKJhpPQhNUKhGJCK+l+2A1xIVgTf02Q2GNu4XA
X-Received: by 2002:ad4:5283:: with SMTP id v3mr17264023qvr.84.1585667015826;
        Tue, 31 Mar 2020 08:03:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585667015; cv=none;
        d=google.com; s=arc-20160816;
        b=hZRb2WLwlLYrr04rkyVe/Ug4zd6GU0MUutw8s4gqHSMYOV84dnmfOOHnRYTGi0n5zZ
         jG/v/8XJM1u9+RsyR+rBBaWqprvH2DHzEtU5qghpZwb36qv4qk3w/xU0T+1c/2a3ZnR8
         DZUJPwgNDR/r176q/oSjdu8HPSfih4mQyA/oaqyCGR7HpvyXF6ftCxd3+XYleISUZWXd
         FX58jT1uBq8gHgVrbHbzwD+HZO0TQIwpIUMAaEAH/5kvrnK01GtrpIji2XfO6YF8un5B
         puuqO9IpJQwN4JRAatYOInjUcorhJ4pLqqd4440NzRamgziix2VvBiJ3xkYiDX2c2qaS
         cmYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=XZ0tzGCXAQ2leWxVfbtmR6QPbdc6PvcCmv7fE9WVCEA=;
        b=tFkLo5Do5s/tsi0CVjVl1z8kaQRBH4yWvbW+Ku49rAuhVYb6l6/buqGE8Pm6VcL6Qz
         M8ZjI0haAEC0DQmPCDBsI07Q3wU7YXA7DGVLPVkRmE2mmUL0dFKXsgim8XNZZuv3SGma
         WBfXLLPUghMosduoM2i/DtPsxVFlA/f6HXx8Ig4JPL4ifzzPaoMQ/s07NbckMZ/uungH
         GYLerMHEjTQOTxzS1p6bxTs4QBGHI8THuKC/Npmz2PTIjEqGlq8+kjYRsIH1SieCfSoE
         7p4VYEu/Koc+gH+LuvwDBi2g3zDjvA0+V8rx5DqT/5jMZon5BoBNFjGNxdPMEw70cr7S
         20pA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DpwaDf5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u187si10126903qkb.229.2020.03.31.08.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 08:03:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DpwaDf5C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJIQR-0001eV-8k
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 11:03:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jJIP6-0007cn-Ja
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 11:02:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jJIP4-0000KA-Cu
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 11:02:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:26013
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jJIP4-0000JM-8Q
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 11:02:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585666929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XZ0tzGCXAQ2leWxVfbtmR6QPbdc6PvcCmv7fE9WVCEA=;
 b=DpwaDf5CBWDULYmHUZgwc0/dDwffmBM9+CKIPtU4tRZd7TAmHWcrgR3mSGlwgxdwLuYksE
 3CQU4ZpWMJ0wJ9uIrpNZ3lZCFm8plTStJ3qB67rSx7MUS3WKdWNfVSL6Iviqfb+cJuPum1
 5ecvtFcpRm1tuB0zLfxAa2HAQIO+F6w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-hWSmza5BM_GyAU4YBEOLzA-1; Tue, 31 Mar 2020 11:02:07 -0400
X-MC-Unique: hWSmza5BM_GyAU4YBEOLzA-1
Received: by mail-wm1-f69.google.com with SMTP id c21so809002wmb.3
 for <qemu-arm@nongnu.org>; Tue, 31 Mar 2020 08:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=APsZpkeTEMgD4YADkOknnrhPr6Dn2lLyPIH8CwXUb80=;
 b=mBX+1kErio6xOlFlHCH1umNrwceMWR4XWSf4QR8xlI4enH6mEhhYr9B3cfEF62vzDc
 l+n/+9mZLgEE+HtMeFzWapCEJJiAULrf6A7LeuaulTgt8ortiuH+cc5IiO6d+qe0F141
 oyJ0VtGNkJ9KPPYjNb2fy97nKzc19IAdLkaGGnqV5vb0fvc03cVQYVPU8k1dCAiuFTBC
 H+QwMSA89dyDWQJmFkX11y4Dhkj/tl5Fob8/id+SjAqUpJLWE/fKUiYMQ4QBKctyA/af
 SY1IbIjHRtwvl1zZyTOLnczPp/iVyJx+jr9JvFar+inlDk5rTgaDZpQNlZEVFmcGGA9M
 XYjg==
X-Gm-Message-State: ANhLgQ0oSczksPyYzTg1xkMvIU8niJ3dk7fj23Ndn+MMpQOzQ9AlVObU
 yT9dpWMcQ3znQqWMSlm98L8nWhLc42tS/pgP2AW8CJNfSZZEXp3/HAgDbAeh1XpUpDGe47yOZyD
 fM5VJdP7IbNTB
X-Received: by 2002:adf:e650:: with SMTP id b16mr19988883wrn.328.1585666926457; 
 Tue, 31 Mar 2020 08:02:06 -0700 (PDT)
X-Received: by 2002:adf:e650:: with SMTP id b16mr19988845wrn.328.1585666926083; 
 Tue, 31 Mar 2020 08:02:06 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f187sm4257524wme.9.2020.03.31.08.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 08:02:05 -0700 (PDT)
Date: Tue, 31 Mar 2020 11:02:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH for-5.0 2/3] fw_cfg: Migrate ACPI table mr sizes separately
Message-ID: <20200331110028-mutt-send-email-mst@kernel.org>
References: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
 <20200330164909.28324-3-shameerali.kolothum.thodi@huawei.com>
 <20200331165038.2dddcedc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200331165038.2dddcedc@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, linuxarm@huawei.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, xuwei5@hisilicon.com,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EYZsu5xpf3bg

On Tue, Mar 31, 2020 at 04:50:38PM +0200, Igor Mammedov wrote:
> On Mon, 30 Mar 2020 17:49:08 +0100
> Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
>=20
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
>=20
> without 3/3, current master is fine (x86/arm acpi)
> 2-3/s looks to me a bit risky for hard freeze,
> so I'd postpone this series till the next merge window.

What worries me is if we do so, how are we going to
handle ACPI changes on arm going forward?
There are advantages in merging migration changes early
as this reduces need for compat hackery ...

>=20
> > ---
> > Please find previous discussions here,
> > https://patchwork.kernel.org/patch/11339591/#23140343
> > ---
> >=20
> >  hw/core/machine.c         |  1 +
> >  hw/nvram/fw_cfg.c         | 86 ++++++++++++++++++++++++++++++++++++++-
> >  include/hw/nvram/fw_cfg.h |  6 +++
> >  3 files changed, 92 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index de0c425605..c1a444cb75 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -39,6 +39,7 @@ GlobalProperty hw_compat_4_2[] =3D {
> >      { "usb-redir", "suppress-remote-wake", "off" },
> >      { "qxl", "revision", "4" },
> >      { "qxl-vga", "revision", "4" },
> > +    { "fw_cfg", "acpi-mr-restore", "false" },
> >  };
> >  const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat_4_2);
> > =20
> > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > index 179b302f01..36d1e32f83 100644
> > --- a/hw/nvram/fw_cfg.c
> > +++ b/hw/nvram/fw_cfg.c
> > @@ -39,6 +39,7 @@
> >  #include "qemu/config-file.h"
> >  #include "qemu/cutils.h"
> >  #include "qapi/error.h"
> > +#include "hw/acpi/aml-build.h"
> > =20
> >  #define FW_CFG_FILE_SLOTS_DFLT 0x20
> > =20
> > @@ -610,6 +611,50 @@ bool fw_cfg_dma_enabled(void *opaque)
> >      return s->dma_enabled;
> >  }
> > =20
> > +static bool fw_cfg_acpi_mr_restore(void *opaque)
> > +{
> > +    FWCfgState *s =3D opaque;
> > +    return s->acpi_mr_restore;
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
> >  static const VMStateDescription vmstate_fw_cfg_dma =3D {
> >      .name =3D "fw_cfg/dma",
> >      .needed =3D fw_cfg_dma_enabled,
> > @@ -619,6 +664,20 @@ static const VMStateDescription vmstate_fw_cfg_dma=
 =3D {
> >      },
> >  };
> > =20
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
> >  static const VMStateDescription vmstate_fw_cfg =3D {
> >      .name =3D "fw_cfg",
> >      .version_id =3D 2,
> > @@ -631,6 +690,7 @@ static const VMStateDescription vmstate_fw_cfg =3D =
{
> >      },
> >      .subsections =3D (const VMStateDescription*[]) {
> >          &vmstate_fw_cfg_dma,
> > +        &vmstate_fw_cfg_acpi_mr,
> >          NULL,
> >      }
> >  };
> > @@ -815,6 +875,23 @@ static struct {
> >  #define FW_CFG_ORDER_OVERRIDE_LAST 200
> >  };
> > =20
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
> >  static int get_fw_cfg_order(FWCfgState *s, const char *name)
> >  {
> >      int i;
> > @@ -914,6 +991,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const=
 char *filename,
> >      trace_fw_cfg_add_file(s, index, s->files->f[index].name, len);
> > =20
> >      s->files->count =3D cpu_to_be32(count+1);
> > +    fw_cfg_acpi_mr_save(s, filename, len);
> >  }
> > =20
> >  void fw_cfg_add_file(FWCfgState *s,  const char *filename,
> > @@ -937,6 +1015,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char=
 *filename,
> >              ptr =3D fw_cfg_modify_bytes_read(s, FW_CFG_FILE_FIRST + i,
> >                                             data, len);
> >              s->files->f[i].size   =3D cpu_to_be32(len);
> > +            fw_cfg_acpi_mr_save(s, filename, len);
> >              return ptr;
> >          }
> >      }
> > @@ -973,7 +1052,10 @@ static void fw_cfg_machine_ready(struct Notifier =
*n, void *data)
> >      qemu_register_reset(fw_cfg_machine_reset, s);
> >  }
> > =20
> > -
> > +static Property fw_cfg_properties[] =3D {
> > +    DEFINE_PROP_BOOL("acpi-mr-restore", FWCfgState, acpi_mr_restore, t=
rue),
> > +    DEFINE_PROP_END_OF_LIST(),
> > +};
> > =20
> >  static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
> >  {
> > @@ -1097,6 +1179,8 @@ static void fw_cfg_class_init(ObjectClass *klass,=
 void *data)
> > =20
> >      dc->reset =3D fw_cfg_reset;
> >      dc->vmsd =3D &vmstate_fw_cfg;
> > +
> > +    device_class_set_props(dc, fw_cfg_properties);
> >  }
> > =20
> >  static const TypeInfo fw_cfg_info =3D {
> > diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> > index b5291eefad..457fee7425 100644
> > --- a/include/hw/nvram/fw_cfg.h
> > +++ b/include/hw/nvram/fw_cfg.h
> > @@ -53,6 +53,12 @@ struct FWCfgState {
> >      dma_addr_t dma_addr;
> >      AddressSpace *dma_as;
> >      MemoryRegion dma_iomem;
> > +
> > +    /* restore during migration */
> > +    bool acpi_mr_restore;
> > +    size_t table_mr_size;
> > +    size_t linker_mr_size;
> > +    size_t rsdp_mr_size;
> >  };
> > =20
> >  struct FWCfgIoState {

