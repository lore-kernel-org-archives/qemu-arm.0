Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp4074669lfi;
        Tue, 31 Mar 2020 08:05:01 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuzF4v/EqjpQuHuY2KPC8+9CiFmE5/hixLVUrhRBwZsN9ijasM20d4vwV7cwRGVkvN73CIp
X-Received: by 2002:a37:8046:: with SMTP id b67mr5362026qkd.207.1585667099961;
        Tue, 31 Mar 2020 08:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585667099; cv=none;
        d=google.com; s=arc-20160816;
        b=JMyUNOCbhavwbNv77dEcb45F6kF2fZJ+AYxi5iEtgWBrtNFPgWUweBwdFE52Av2BKs
         3+WNY8vbDCn6FQCAGRmpdy/O/AapMfpIIwwKzI2aRIYierJRBkN6K0szOFLNL7433wX4
         IYNAQvcZjdXxUMPKeB7hgsJ5SOQ9pHog70gYBtL41ZjHJNrNmn4+SkXv4W7iHZ3/53hO
         9/9KABvzhYtUKFoYHMASWZpLYtfhfoIroFoGxr4T9E5Cl36pa6cCYOthkJwd0q8FyqUV
         EUE3a5krfOKj3+feHFSNSxVm5T1w60iYzL8u+ktLBX+VINwbdxb4iButG5BJZsrH8ivt
         z4hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=FaJkiz10NQw9jlC+Kjcb9efmme9Mt48arhxpbww3o7w=;
        b=jNv54qj0oRUoju10SG1WcWTe32hJj+wW0cYy2NATMZlBqUb83ibwlDwqyGFtf/VZCb
         7PCj23rzAosIBuuKHZHs//Hp22FIwVA+JRaI7P2NiUi1ygqc95xRNIOjnRSkLgjhVpww
         Q/2lhsKkpxugyFP2old+0MyIMS4FfmfntnnvaGG1nKIYvj7f2q6mdSiv/JlhdOWotRI2
         Yb3ASosTMtnvLjP6MVfdWuphEO6SyrCxleQS1A8KZ8+xD9K1tqWGfb9i2sXu0HFkvRw5
         BYyUcdzp+am7ofxF4/+MGifYgYuLsPltYDxQ88h89v7o2j6mXKr6CJATh4TGCp6cz8oF
         ZqMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L5Kd1wu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e41si10229324qtk.202.2020.03.31.08.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 08:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=L5Kd1wu0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jJIRm-0003MK-UX
	for alex.bennee@linaro.org; Tue, 31 Mar 2020 11:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57451)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jJIQ5-0001BQ-Ss
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:03:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jJIQ4-00016p-4E
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:03:13 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22490
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jJIQ3-00016V-Vy
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 11:03:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585666991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaJkiz10NQw9jlC+Kjcb9efmme9Mt48arhxpbww3o7w=;
 b=L5Kd1wu0RMnriEj+o17EoIPwreBIB2kNGead2pqpTz1/nqaWLQgOFeEYHFe6MeqR5j1BlL
 j4qAYNqo//G/Dw4Ns1hDFe5n3j6nY1ETDGGcXlBtNkYzKkRDNnj4YsWIMqZUkgMcUhSVYe
 1Bsw7Uxno6//p4t3cyjFIYssimYXW7k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-UKkID49EMLO_D3Ff1g76Qg-1; Tue, 31 Mar 2020 11:03:09 -0400
X-MC-Unique: UKkID49EMLO_D3Ff1g76Qg-1
Received: by mail-wr1-f70.google.com with SMTP id t25so10746396wrb.16
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 08:03:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ulje8nREHKWin46TswSOrg0IkBb6Q1QSROXfvQkX3Ms=;
 b=uUTaZPDwBqdC8LTTVO9J5ZESmf6AS6ZfobkudjGip83SR6FW3oyJ5tHnWxrZdS5H0h
 all9jrh9h2E37kVgcgudUWj88L4XN0RuWjYdQ2etsCLxt3ArnAcHqdQFXOPg05w9SB3Q
 VNpD6hCDRDUWRe8etHr2YP5b8izTsUmSqO41YfNmgcrwASpmrMUoJ6Djhi7ZOgf6Kc9h
 ldUvNs2Y0oXvVtubafXFXZnw27CgpgxTbOeRAd7Zi8DDgwbbLY81s1YHrPhnIlUt8YQ6
 S9cuDLKN3D8Av/86FrDxBL9HIysYVcfxdCXPxQRftgoeq0EReAsbLVYD8MgslZL05ZE0
 1hNA==
X-Gm-Message-State: ANhLgQ3RjxukCxJuz26aEIr/8arVsGtYZYbDBDqnrG2+zWzTPQQkCzlW
 TZJI0x2bBZsaKZ00GF6wRpjotMu4EanaFc/iHLUibxs77YyPnqoL5I/92B8/Cij3r0RaE+OAwOV
 momYBd1zDL6VN28w=
X-Received: by 2002:a1c:6745:: with SMTP id b66mr3925923wmc.30.1585666987596; 
 Tue, 31 Mar 2020 08:03:07 -0700 (PDT)
X-Received: by 2002:a1c:6745:: with SMTP id b66mr3925889wmc.30.1585666987261; 
 Tue, 31 Mar 2020 08:03:07 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f20sm3908445wmc.35.2020.03.31.08.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 08:03:05 -0700 (PDT)
Date: Tue, 31 Mar 2020 11:03:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH for-5.0 2/3] fw_cfg: Migrate ACPI table mr sizes separately
Message-ID: <20200331110223-mutt-send-email-mst@kernel.org>
References: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
 <20200330164909.28324-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200330164909.28324-3-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, david@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GgsfVpC3p0vS

On Mon, Mar 30, 2020 at 05:49:08PM +0100, Shameer Kolothum wrote:
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

How about we limit this to the case where the address is
unaligned?

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

