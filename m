Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2461989lfe;
        Thu, 19 Mar 2020 10:51:54 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtERR8LQ4DMd/Ww24rAoFVcIxbj7pjgYRSCoQOJA//9KilkwLYWdPcAPMu5ds9Ccp/d0DgB
X-Received: by 2002:a0c:9b96:: with SMTP id o22mr4021496qve.169.1584640314195;
        Thu, 19 Mar 2020 10:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584640314; cv=none;
        d=google.com; s=arc-20160816;
        b=rFB86q7aXhWxNYTq8u1TTEObkq2GFr7OHWBlfhLFwhMPQqEQXRfxg/AAk3hmsLMAGb
         wQb3jBp3LdkouJo/jXXPjzOsE58MNyRs5aA/PWmP3849Z/Qk1t5vsLcywEWJdqRZVaRw
         g+zHB08B7Cx/rguLos7yZpA0T5+1SMo9fjNx6qq1JSJKaLFduJigi6xpEMZap0yWWnD0
         E2jg6GKOEc01Xt8fbBH2iiBaG9xEG0d7rRwTOrcrt+LRqMmKjoVNo0nsaNbL60NZ6Qvs
         bMFozaKxUNq6MBHb2hfxDxN9H7eGxJ9KlTifZAVQUw/jsXLc7cngWPfy++HI1al3VAdN
         krMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=67Bo3Fn3C9eI70cMGeWwenPHG7Er2q5TOkI0N4H0nhk=;
        b=FFX6hapwIPyrh4TapBX4cYrgyJ3vD6lfC0FBo7KYJCkwx4aveFgY/3H3gtzXiRSZ4X
         VBxxfLnzdPtDwCKXT5fQYNdR/NbarNqX+tciKAaweTQBbkAdTzhUpHqtVdailUm7CzJv
         3v6WzdInIEm96fJXVo8MkkvnV52oH0E1NURQORBtfN0HOP2rlxIGtTlGLcWGv+Y7knPH
         12fwsC/5wHxO4yk2rvnuEFk2OQCPFHp8w9b/IMaSYpqiVfXCJEGfOqyKS0f+J6dcu6c7
         hJLwEcu9H/OPA+xDtdj7oDqmOiGBs/WBTAo0jerYGP0/QAM5ZZ/B+Uqdtmj4vcj/gnx0
         1Qaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRWGv2Pa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q4si1785343qkm.187.2020.03.19.10.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Mar 2020 10:51:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IRWGv2Pa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEzKj-0004gd-Jb
	for alex.bennee@linaro.org; Thu, 19 Mar 2020 13:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jEzKZ-0004en-Kd
 for qemu-arm@nongnu.org; Thu, 19 Mar 2020 13:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jEzKX-0006tn-Jh
 for qemu-arm@nongnu.org; Thu, 19 Mar 2020 13:51:43 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:36622)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jEzKX-0006tV-El
 for qemu-arm@nongnu.org; Thu, 19 Mar 2020 13:51:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584640301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67Bo3Fn3C9eI70cMGeWwenPHG7Er2q5TOkI0N4H0nhk=;
 b=IRWGv2Paqkd7ZHqqsSTpBwyUIVftLr45MffJqVJxX71VL3Hc1ulkifQsYJ1HOKiWdSxaoR
 j/p8UBjy2LTEtUdsjSlgdo77pVP4qSJx+TD1kU1F07MYtLtkeJseXKDCcudVNYqzirn1Lb
 un07BLmEPm2XTzGTo7fzb+Zau2mbtEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-oCew87XWMFC6xbza7JXz6A-1; Thu, 19 Mar 2020 13:51:36 -0400
X-MC-Unique: oCew87XWMFC6xbza7JXz6A-1
Received: by mail-wm1-f70.google.com with SMTP id v184so1009229wme.7
 for <qemu-arm@nongnu.org>; Thu, 19 Mar 2020 10:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2N//owuS+c+y07/E5X0sKjlUEpAAWMDPfM51J8LpXrU=;
 b=BiftcLTL2ZliCCQh3HPns+KszeMyNw57hHFgO/oO9ZxSr158+KMagMJC4O70+CLhpv
 GUkF5DwG3IRTcHdu63kad5cFSVkDlK3olBMsZV90N1QTbGCgmBDbN3FDrYXteTtvPXTr
 gp82WgppgnROEwHXpQqgb1PblwT39gdoMy/U6m4SJpL/9MwgHwjoxjhgi/nY6bGhq33g
 ltUwZGD+6yMGN9cOlNobSgUEGofCKDnpB0t4qdjMhKdPXMJ03Pugv4Aw4obeCi4XsvJp
 CvGMlOzpnjwLzAKqky5/H1/PPz7KlAZmGz45CEWFydYSdpNMISGG2uBqeqEtoqhiKE2c
 KcxA==
X-Gm-Message-State: ANhLgQ1WBhobZWgzFiOiXQuwDGYh+9WZZvwQPWHNK/3ziUKyJbFhzH0A
 h1pK2LJyWJYGI59aOnJP4efFxyK35tduJtdHHhIlS5Y1t2qvkzP8H5IH78WqWBwpWEyx2VTW1g6
 EfyTr7Pmb3Qrw
X-Received: by 2002:a1c:f401:: with SMTP id z1mr4976261wma.18.1584640293417;
 Thu, 19 Mar 2020 10:51:33 -0700 (PDT)
X-Received: by 2002:a1c:f401:: with SMTP id z1mr4976229wma.18.1584640293105;
 Thu, 19 Mar 2020 10:51:33 -0700 (PDT)
Received: from redhat.com (bzq-109-66-39-109.red.bezeqint.net. [109.66.39.109])
 by smtp.gmail.com with ESMTPSA id b80sm4304468wme.24.2020.03.19.10.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 10:51:32 -0700 (PDT)
Date: Thu, 19 Mar 2020 13:51:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 02/10] fw_cfg: Migrate ACPI table mr sizes separately
Message-ID: <20200319135036-mutt-send-email-mst@kernel.org>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-3-shameerali.kolothum.thodi@huawei.com>
 <20200311170827-mutt-send-email-mst@kernel.org>
 <cf6384c5b66a4c9ba37c39a07ec9ed6a@huawei.com>
MIME-Version: 1.0
In-Reply-To: <cf6384c5b66a4c9ba37c39a07ec9ed6a@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "david@redhat.com" <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/u+r9E+w3/q

On Thu, Mar 12, 2020 at 09:27:32AM +0000, Shameerali Kolothum Thodi wrote:
>=20
>=20
> > -----Original Message-----
> > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > Sent: 11 March 2020 21:10
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; imammedo@redhat.com; peter.maydell@linaro.org;
> > shannon.zhaosl@gmail.com; xiaoguangrong.eric@gmail.com;
> > david@redhat.com; xuwei (O) <xuwei5@huawei.com>; lersek@redhat.com;
> > Linuxarm <linuxarm@huawei.com>
> > Subject: Re: [PATCH v3 02/10] fw_cfg: Migrate ACPI table mr sizes separ=
ately
> >=20
> > On Wed, Mar 11, 2020 at 05:20:06PM +0000, Shameer Kolothum wrote:
> > > Any sub-page size update to ACPI table MRs will be lost during
> > > migration, as we use aligned size in ram_load_precopy() ->
> > > qemu_ram_resize() path. This will result in inconsistency in sizes
> > > between source and destination. In order to avoid this, save and
> > > restore them separately during migration.
>=20
>=20
> > Is there a reason this is part of nvdimm patchset?
>=20
> Not really. But this problem is more visible if we have nvdimm hotplug
> support added to arm/virt. On x86, both acpi table and linker MRs are alr=
eady
> aligned and I don't know a use case where you can change RSDP MR size(See=
 below).
>=20
> >
> > Hmm but for old machine types we still have a problem right?
> > How about aligning size on source for them?
> > Then there won't be an inconsistency across migration.
> > Wastes some boot time/memory but maybe that's better
> > than a chance of not booting ...
>=20
> Right. That was considered. On x86, except RSDP MR, both the LINKER and A=
CPI
> TABLE MRs are already aligned/padded. And we cannot make RSDP mr aligned
> as it will break the seabios based boot.

Hmm. So right now if we migrate just before RSDP is read, there's
a failure?

> So a generic solution based on alignment=20
> is not possible unless we guarantee that RSDP is not going to be modified=
.
>=20
> What we could do for Arm/virt is just follow the x86 way and add padding =
for
> table and linker MRs. But this was discussed before and IIRC, was not wel=
l
> received.
>=20
> Thanks,
> Shameer
>=20
> > > Suggested-by: David Hildenbrand <david@redhat.com>
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com=
>
> > > ---
> > > Please find the discussion here,
> > > https://patchwork.kernel.org/patch/11339591/
> > > ---
> > >  hw/core/machine.c         |  1 +
> > >  hw/nvram/fw_cfg.c         | 86
> > ++++++++++++++++++++++++++++++++++++++-
> > >  include/hw/nvram/fw_cfg.h |  6 +++
> > >  3 files changed, 92 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 9e8c06036f..6d960bd47f 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -39,6 +39,7 @@ GlobalProperty hw_compat_4_2[] =3D {
> > >      { "usb-redir", "suppress-remote-wake", "off" },
> > >      { "qxl", "revision", "4" },
> > >      { "qxl-vga", "revision", "4" },
> > > +    { "fw_cfg", "acpi-mr-restore", "false" },
> > >  };
> > >  const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat_4_2);
> > >
> > > diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> > > index 179b302f01..36d1e32f83 100644
> > > --- a/hw/nvram/fw_cfg.c
> > > +++ b/hw/nvram/fw_cfg.c
> > > @@ -39,6 +39,7 @@
> > >  #include "qemu/config-file.h"
> > >  #include "qemu/cutils.h"
> > >  #include "qapi/error.h"
> > > +#include "hw/acpi/aml-build.h"
> > >
> > >  #define FW_CFG_FILE_SLOTS_DFLT 0x20
> > >
> > > @@ -610,6 +611,50 @@ bool fw_cfg_dma_enabled(void *opaque)
> > >      return s->dma_enabled;
> > >  }
> > >
> > > +static bool fw_cfg_acpi_mr_restore(void *opaque)
> > > +{
> > > +    FWCfgState *s =3D opaque;
> > > +    return s->acpi_mr_restore;
> > > +}
> > > +
> > > +static void fw_cfg_update_mr(FWCfgState *s, uint16_t key, size_t siz=
e)
> > > +{
> > > +    MemoryRegion *mr;
> > > +    ram_addr_t offset;
> > > +    int arch =3D !!(key & FW_CFG_ARCH_LOCAL);
> > > +    void *ptr;
> > > +
> > > +    key &=3D FW_CFG_ENTRY_MASK;
> > > +    assert(key < fw_cfg_max_entry(s));
> > > +
> > > +    ptr =3D s->entries[arch][key].data;
> > > +    mr =3D memory_region_from_host(ptr, &offset);
> > > +
> > > +    memory_region_ram_resize(mr, size, &error_abort);
> > > +}
> > > +
> > > +static int fw_cfg_acpi_mr_restore_post_load(void *opaque, int versio=
n_id)
> > > +{
> > > +    FWCfgState *s =3D opaque;
> > > +    int i, index;
> > > +
> > > +    assert(s->files);
> > > +
> > > +    index =3D be32_to_cpu(s->files->count);
> > > +
> > > +    for (i =3D 0; i < index; i++) {
> > > +        if (!strcmp(s->files->f[i].name, ACPI_BUILD_TABLE_FILE)) {
> > > +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i,
> > s->table_mr_size);
> > > +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_LOADER_FI=
LE)) {
> > > +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i,
> > s->linker_mr_size);
> > > +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_RSDP_FILE=
)) {
> > > +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i,
> > s->rsdp_mr_size);
> > > +        }
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >  static const VMStateDescription vmstate_fw_cfg_dma =3D {
> > >      .name =3D "fw_cfg/dma",
> > >      .needed =3D fw_cfg_dma_enabled,
> > > @@ -619,6 +664,20 @@ static const VMStateDescription
> > vmstate_fw_cfg_dma =3D {
> > >      },
> > >  };
> > >
> > > +static const VMStateDescription vmstate_fw_cfg_acpi_mr =3D {
> > > +    .name =3D "fw_cfg/acpi_mr",
> > > +    .version_id =3D 1,
> > > +    .minimum_version_id =3D 1,
> > > +    .needed =3D fw_cfg_acpi_mr_restore,
> > > +    .post_load =3D fw_cfg_acpi_mr_restore_post_load,
> > > +    .fields =3D (VMStateField[]) {
> > > +        VMSTATE_UINT64(table_mr_size, FWCfgState),
> > > +        VMSTATE_UINT64(linker_mr_size, FWCfgState),
> > > +        VMSTATE_UINT64(rsdp_mr_size, FWCfgState),
> > > +        VMSTATE_END_OF_LIST()
> > > +    },
> > > +};
> > > +
> > >  static const VMStateDescription vmstate_fw_cfg =3D {
> > >      .name =3D "fw_cfg",
> > >      .version_id =3D 2,
> > > @@ -631,6 +690,7 @@ static const VMStateDescription vmstate_fw_cfg =
=3D {
> > >      },
> > >      .subsections =3D (const VMStateDescription*[]) {
> > >          &vmstate_fw_cfg_dma,
> > > +        &vmstate_fw_cfg_acpi_mr,
> > >          NULL,
> > >      }
> > >  };
> > > @@ -815,6 +875,23 @@ static struct {
> > >  #define FW_CFG_ORDER_OVERRIDE_LAST 200
> > >  };
> > >
> > > +/*
> > > + * Any sub-page size update to these table MRs will be lost during m=
igration,
> > > + * as we use aligned size in ram_load_precopy() -> qemu_ram_resize()=
 path.
> > > + * In order to avoid the inconsistency in sizes save them seperately=
 and
> > > + * migrate over in vmstate post_load().
> > > + */
> > > +static void fw_cfg_acpi_mr_save(FWCfgState *s, const char *filename,
> > size_t len)
> > > +{
> > > +    if (!strcmp(filename, ACPI_BUILD_TABLE_FILE)) {
> > > +        s->table_mr_size =3D len;
> > > +    } else if (!strcmp(filename, ACPI_BUILD_LOADER_FILE)) {
> > > +        s->linker_mr_size =3D len;
> > > +    } else if (!strcmp(filename, ACPI_BUILD_RSDP_FILE)) {
> > > +        s->rsdp_mr_size =3D len;
> > > +    }
> > > +}
> > > +
> > >  static int get_fw_cfg_order(FWCfgState *s, const char *name)
> > >  {
> > >      int i;
> > > @@ -914,6 +991,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,
> > const char *filename,
> > >      trace_fw_cfg_add_file(s, index, s->files->f[index].name, len);
> > >
> > >      s->files->count =3D cpu_to_be32(count+1);
> > > +    fw_cfg_acpi_mr_save(s, filename, len);
> > >  }
> > >
> > >  void fw_cfg_add_file(FWCfgState *s,  const char *filename,
> > > @@ -937,6 +1015,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const ch=
ar
> > *filename,
> > >              ptr =3D fw_cfg_modify_bytes_read(s, FW_CFG_FILE_FIRST + =
i,
> > >                                             data, len);
> > >              s->files->f[i].size   =3D cpu_to_be32(len);
> > > +            fw_cfg_acpi_mr_save(s, filename, len);
> > >              return ptr;
> > >          }
> > >      }
> > > @@ -973,7 +1052,10 @@ static void fw_cfg_machine_ready(struct Notifie=
r
> > *n, void *data)
> > >      qemu_register_reset(fw_cfg_machine_reset, s);
> > >  }
> > >
> > > -
> > > +static Property fw_cfg_properties[] =3D {
> > > +    DEFINE_PROP_BOOL("acpi-mr-restore", FWCfgState, acpi_mr_restore,
> > true),
> > > +    DEFINE_PROP_END_OF_LIST(),
> > > +};
> > >
> > >  static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
> > >  {
> > > @@ -1097,6 +1179,8 @@ static void fw_cfg_class_init(ObjectClass *klas=
s,
> > void *data)
> > >
> > >      dc->reset =3D fw_cfg_reset;
> > >      dc->vmsd =3D &vmstate_fw_cfg;
> > > +
> > > +    device_class_set_props(dc, fw_cfg_properties);
> > >  }
> > >
> > >  static const TypeInfo fw_cfg_info =3D {
> > > diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> > > index b5291eefad..457fee7425 100644
> > > --- a/include/hw/nvram/fw_cfg.h
> > > +++ b/include/hw/nvram/fw_cfg.h
> > > @@ -53,6 +53,12 @@ struct FWCfgState {
> > >      dma_addr_t dma_addr;
> > >      AddressSpace *dma_as;
> > >      MemoryRegion dma_iomem;
> > > +
> > > +    /* restore during migration */
> > > +    bool acpi_mr_restore;
> > > +    size_t table_mr_size;
> > > +    size_t linker_mr_size;
> > > +    size_t rsdp_mr_size;
> > >  };
> > >
> > >  struct FWCfgIoState {
> > > --
> > > 2.17.1
> > >

