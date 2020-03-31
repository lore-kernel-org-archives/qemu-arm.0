Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3811283lfi;
        Tue, 31 Mar 2020 03:46:19 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuANLZEPAEkMKl/8zjH5BmSRp4gtguo/kuxO+5UVb5sF5Hr9Ldyao+4kt8Hyex+2jtMYna/
X-Received: by 2002:ac8:5252:: with SMTP id y18mr4228005qtn.311.1585651579664;
        Tue, 31 Mar 2020 03:46:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585651579; cv=none;
        d=google.com; s=arc-20160816;
        b=Wyh1/OsCkLjF8PHcryxJOVR9gO/W2vzkh56MeqdKQF7Tt/aTMMNu55aJ1LkMl1E/Ll
         YlO/TNPRNbjBtWOXcPVFHeFYOhsf8JfV5o2nkrdgsT0z6urINuwkVRby2cL4+5/nM5Kl
         0Pe5iUvOD18ormxopAg5arBgV2B+QRUW9aItq0z6CrdDOsziagDCEz/KPlUJ1/otx5c3
         BeM1l/T538tmgg/wJ9UezmPsp0xj87auLUsVp5ViLiRjql25O5X83n8fdo8NY2vNhe61
         Fr7zPRYBPUIG+Sqdjy9POS/dx7hO5ivIfDbtawVPxKBKPuh0pYJqwUU/9GJITBuNeeoq
         QMpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:user-agent:in-reply-to:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=BjLdfkZky3cghMEqgCcq1KUPOCycddc4qMo0vtDVe14=;
        b=kvI4pSAbn5xtPhKgwq41rxZv84FiOpEWb9e7p9+ezR8dcyKjWvuAVAJ6iencoru5iZ
         RYI4jWW5UK1295+Mopi4qPWobIuHsFN1QEjrn+ckvuNmthRhNahtWH1wXBQB0a9H7tdn
         rXfZ2HHnFaLfbh1GLxdT5971wNYUf5quScuDPEBvPEmEGBmxWnDBWULaaYoOFWlONV+v
         n9D2iSc7rMjcrXaAQ//YHb3GHuom63U+5MpoKDSKg7rsbK3MK2TzP+/tqCOwihxGuW61
         SCnfZFEipQBgQT/HVDKEauBvaHLUw+aKxO8uYbbCmr4CLu+TGUhYptKdAydc72SMkPHO
         G2eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cd77cSkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bx9si9625412qvb.43.2020.03.31.03.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 03:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cd77cSkr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJEPS-00075W-Va
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 06:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jJEPH-00072b-B8
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 06:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jJEPF-0001bZ-Dv
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 06:46:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24201
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jJEPF-0001bD-9L
 for qemu-arm@nongnu.org; Tue, 31 Mar 2020 06:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585651564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BjLdfkZky3cghMEqgCcq1KUPOCycddc4qMo0vtDVe14=;
 b=cd77cSkr5Fm+PElebdO3FT/vjZEv8pNt37YWsM4dnEHcBA+OEKHzNmdaTdirxpF1iVjyh1
 RyS5TZNOVXr01Q1R7koEnATqmKr6P9/+nRGCG10poNzWUW2byXET7QslWr0XYXVvYLbFFF
 dWPxWGGla3EqM0jqOMAiLPr93LDcASI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-fP2F3uZvM0iR0ufYGC5AOA-1; Tue, 31 Mar 2020 06:45:59 -0400
X-MC-Unique: fP2F3uZvM0iR0ufYGC5AOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53EFA108442F;
 Tue, 31 Mar 2020 10:45:58 +0000 (UTC)
Received: from work-vm (ovpn-112-221.ams2.redhat.com [10.36.112.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6430ECDBC8;
 Tue, 31 Mar 2020 10:45:46 +0000 (UTC)
Date: Tue, 31 Mar 2020 11:45:43 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH for-5.0 2/3] fw_cfg: Migrate ACPI table mr sizes separately
Message-ID: <20200331104543.GA2942@work-vm>
References: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
 <20200330164909.28324-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200330164909.28324-3-shameerali.kolothum.thodi@huawei.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
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
 shannon.zhaosl@gmail.com, mst@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LSwFa+Ux0gXa

* Shameer Kolothum (shameerali.kolothum.thodi@huawei.com) wrote:
> Any sub-page size update to ACPI MRs will be lost during
> migration, as we use aligned size in ram_load_precopy() ->
> qemu_ram_resize() path. This will result in inconsistency in
> FWCfgEntry sizes between source and destination. In order to avoid
> this, save and restore them separately during migration.
>=20
> Up until now, this problem may not be that relevant for x86 as both
> ACPI table and Linker MRs gets padded and aligned. Also at present,
> qemu_ram_resize() doesn't invoke callback to update FWCfgEntry for
> unaligned size changes. But since we are going to fix the
> qemu_ram_resize() in the subsequent patch, the issue may become
> more serious especially for RSDP MR case.
>=20
> Moreover, the issue will soon become prominent in arm/virt as well
> where the MRs are not padded or aligned at all and eventually have
> acpi table changes as part of future additions like NVDIMM hot-add
> feature.
>=20
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> ---
> Please find previous discussions here,
> https://patchwork.kernel.org/patch/11339591/#23140343
> ---
>=20
>  hw/core/machine.c         |  1 +
>  hw/nvram/fw_cfg.c         | 86 ++++++++++++++++++++++++++++++++++++++-
>  include/hw/nvram/fw_cfg.h |  6 +++
>  3 files changed, 92 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index de0c425605..c1a444cb75 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,7 @@ GlobalProperty hw_compat_4_2[] =3D {
>      { "usb-redir", "suppress-remote-wake", "off" },
>      { "qxl", "revision", "4" },
>      { "qxl-vga", "revision", "4" },
> +    { "fw_cfg", "acpi-mr-restore", "false" },
>  };
>  const size_t hw_compat_4_2_len =3D G_N_ELEMENTS(hw_compat_4_2);
> =20
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 179b302f01..36d1e32f83 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -39,6 +39,7 @@
>  #include "qemu/config-file.h"
>  #include "qemu/cutils.h"
>  #include "qapi/error.h"
> +#include "hw/acpi/aml-build.h"
> =20
>  #define FW_CFG_FILE_SLOTS_DFLT 0x20
> =20
> @@ -610,6 +611,50 @@ bool fw_cfg_dma_enabled(void *opaque)
>      return s->dma_enabled;
>  }
> =20
> +static bool fw_cfg_acpi_mr_restore(void *opaque)
> +{
> +    FWCfgState *s =3D opaque;
> +    return s->acpi_mr_restore;
> +}
> +
> +static void fw_cfg_update_mr(FWCfgState *s, uint16_t key, size_t size)
> +{
> +    MemoryRegion *mr;
> +    ram_addr_t offset;
> +    int arch =3D !!(key & FW_CFG_ARCH_LOCAL);
> +    void *ptr;
> +
> +    key &=3D FW_CFG_ENTRY_MASK;
> +    assert(key < fw_cfg_max_entry(s));
> +
> +    ptr =3D s->entries[arch][key].data;
> +    mr =3D memory_region_from_host(ptr, &offset);
> +
> +    memory_region_ram_resize(mr, size, &error_abort);
> +}
> +
> +static int fw_cfg_acpi_mr_restore_post_load(void *opaque, int version_id=
)
> +{
> +    FWCfgState *s =3D opaque;
> +    int i, index;
> +
> +    assert(s->files);
> +
> +    index =3D be32_to_cpu(s->files->count);
> +
> +    for (i =3D 0; i < index; i++) {
> +        if (!strcmp(s->files->f[i].name, ACPI_BUILD_TABLE_FILE)) {
> +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->table_mr_size)=
;
> +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_LOADER_FILE))=
 {
> +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->linker_mr_size=
);
> +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_RSDP_FILE)) {
> +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->rsdp_mr_size);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_fw_cfg_dma =3D {
>      .name =3D "fw_cfg/dma",
>      .needed =3D fw_cfg_dma_enabled,
> @@ -619,6 +664,20 @@ static const VMStateDescription vmstate_fw_cfg_dma =
=3D {
>      },
>  };
> =20
> +static const VMStateDescription vmstate_fw_cfg_acpi_mr =3D {
> +    .name =3D "fw_cfg/acpi_mr",
> +    .version_id =3D 1,
> +    .minimum_version_id =3D 1,
> +    .needed =3D fw_cfg_acpi_mr_restore,
> +    .post_load =3D fw_cfg_acpi_mr_restore_post_load,
> +    .fields =3D (VMStateField[]) {
> +        VMSTATE_UINT64(table_mr_size, FWCfgState),
> +        VMSTATE_UINT64(linker_mr_size, FWCfgState),
> +        VMSTATE_UINT64(rsdp_mr_size, FWCfgState),

The checker found something I also spotted; which is you can't use a
VMSTATE_UINT64 against a field that is size_t - it's not portable;
I suggest the easiest fix is to make your fields in fw_cfg.h uint64's.

Dave

> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static const VMStateDescription vmstate_fw_cfg =3D {
>      .name =3D "fw_cfg",
>      .version_id =3D 2,
> @@ -631,6 +690,7 @@ static const VMStateDescription vmstate_fw_cfg =3D {
>      },
>      .subsections =3D (const VMStateDescription*[]) {
>          &vmstate_fw_cfg_dma,
> +        &vmstate_fw_cfg_acpi_mr,
>          NULL,
>      }
>  };
> @@ -815,6 +875,23 @@ static struct {
>  #define FW_CFG_ORDER_OVERRIDE_LAST 200
>  };
> =20
> +/*
> + * Any sub-page size update to these table MRs will be lost during migra=
tion,
> + * as we use aligned size in ram_load_precopy() -> qemu_ram_resize() pat=
h.
> + * In order to avoid the inconsistency in sizes save them seperately and
> + * migrate over in vmstate post_load().
> + */
> +static void fw_cfg_acpi_mr_save(FWCfgState *s, const char *filename, siz=
e_t len)
> +{
> +    if (!strcmp(filename, ACPI_BUILD_TABLE_FILE)) {
> +        s->table_mr_size =3D len;
> +    } else if (!strcmp(filename, ACPI_BUILD_LOADER_FILE)) {
> +        s->linker_mr_size =3D len;
> +    } else if (!strcmp(filename, ACPI_BUILD_RSDP_FILE)) {
> +        s->rsdp_mr_size =3D len;
> +    }
> +}
> +
>  static int get_fw_cfg_order(FWCfgState *s, const char *name)
>  {
>      int i;
> @@ -914,6 +991,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const c=
har *filename,
>      trace_fw_cfg_add_file(s, index, s->files->f[index].name, len);
> =20
>      s->files->count =3D cpu_to_be32(count+1);
> +    fw_cfg_acpi_mr_save(s, filename, len);
>  }
> =20
>  void fw_cfg_add_file(FWCfgState *s,  const char *filename,
> @@ -937,6 +1015,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *=
filename,
>              ptr =3D fw_cfg_modify_bytes_read(s, FW_CFG_FILE_FIRST + i,
>                                             data, len);
>              s->files->f[i].size   =3D cpu_to_be32(len);
> +            fw_cfg_acpi_mr_save(s, filename, len);
>              return ptr;
>          }
>      }
> @@ -973,7 +1052,10 @@ static void fw_cfg_machine_ready(struct Notifier *n=
, void *data)
>      qemu_register_reset(fw_cfg_machine_reset, s);
>  }
> =20
> -
> +static Property fw_cfg_properties[] =3D {
> +    DEFINE_PROP_BOOL("acpi-mr-restore", FWCfgState, acpi_mr_restore, tru=
e),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> =20
>  static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
>  {
> @@ -1097,6 +1179,8 @@ static void fw_cfg_class_init(ObjectClass *klass, v=
oid *data)
> =20
>      dc->reset =3D fw_cfg_reset;
>      dc->vmsd =3D &vmstate_fw_cfg;
> +
> +    device_class_set_props(dc, fw_cfg_properties);
>  }
> =20
>  static const TypeInfo fw_cfg_info =3D {
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index b5291eefad..457fee7425 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -53,6 +53,12 @@ struct FWCfgState {
>      dma_addr_t dma_addr;
>      AddressSpace *dma_as;
>      MemoryRegion dma_iomem;
> +
> +    /* restore during migration */
> +    bool acpi_mr_restore;
> +    size_t table_mr_size;
> +    size_t linker_mr_size;
> +    size_t rsdp_mr_size;
>  };
> =20
>  struct FWCfgIoState {
> --=20
> 2.17.1
>=20
>=20
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

