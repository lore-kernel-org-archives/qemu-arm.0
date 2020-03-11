Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1234484lfc;
        Wed, 11 Mar 2020 14:10:10 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvv6mRTS4mCypg8/lhtmEOVfFCfRXZS9RJDHQkkXWZobHXqx38LJ6XhHTcUSGSv59FC9M3R
X-Received: by 2002:aed:3c4b:: with SMTP id u11mr4483608qte.208.1583961009939;
        Wed, 11 Mar 2020 14:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583961009; cv=none;
        d=google.com; s=arc-20160816;
        b=Pl0moJGJEoW5hlARXwaoRhTKJKDQ3xBGMdbvp2IOqlUdSFD+kUE+0LAzy/Bq8AwLOu
         Djc04D+bZW6glRfmz/awOJmnvTdNq5cN0eE4twcPLzPGh2nrjkOKWaVW+eGBy9y4xyYL
         Lp10O/GJjtwz4POFQa6UF/RZ8vQbRh07g47fApikXSxQhcke6f/eUkLp9pbaxyY9bj/q
         Yy0RN5oxnJnk8Xt10SAdd4qXs0pGvr+RN2si/M9j+AJe1UmbaGwAq/lmWCVuxST8pyxQ
         +qi18o1NJjCOZco99JJ6uBp+2G5u+mVq6mUP7YVpHlWMruCSKl0TJiN5jC4ztiSrdxct
         pLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=iA81foUGliQJzZ8myPoyoLfTr3iG35RF+EQysrDYgxA=;
        b=CBmrkOP9599jw3Syf97OMI7PRLN/QSvg/YQYvi14TFgva+k2XvRQO/w+injipjTa1t
         zKud9vDviw726nxnmVpNgnDgRRHGaaEp2rFHXZ2IJdoMjTxhZ1ntJ8XtIXFA9aqumdU+
         KxbIVG1LM+OUM//47Gem+XcrpYdsGoSLXvyAX5/rQX+nsr8+asGhAOmIYj2RCmuQirPV
         cszVK+feL4Exn/XFv0anHY4VUbh07dApgaOcuLo0h0dcSuNCdHZasCyvNY1PcjXUVQqJ
         NGEcKnIiwfxhN+//fjxfBkhpYadwqemWMy7KHMuAw+WED9kSRpq7rW/Yllya/ZunNprk
         69lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fpNRnZJy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si1585892qkm.14.2020.03.11.14.10.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Mar 2020 14:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fpNRnZJy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jC8cD-0003E4-Az
	for alex.bennee@linaro.org; Wed, 11 Mar 2020 17:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1jC8c2-00039f-Ol
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 17:10:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1jC8c0-0000FN-PS
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 17:09:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27743
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1jC8c0-0000Eu-L3
 for qemu-arm@nongnu.org; Wed, 11 Mar 2020 17:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583960996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iA81foUGliQJzZ8myPoyoLfTr3iG35RF+EQysrDYgxA=;
 b=fpNRnZJyzUjEtkKwxLlw7HWYByXL5VhcuO5l89+oDb2TRTcNvVFzlm6HH6+LxQWuhJsb2k
 /+BbL9AKv7c//XWF5jMnksBhl5R44pitYgiZrI6xkZUo9Cs3LNZ7zmFc0IKJDmATSFCwy7
 28D48fCg76X1MZBNu28zze3/grN/tZ8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-ItruOIecO_2yu0_1LEJjrg-1; Wed, 11 Mar 2020 17:09:51 -0400
X-MC-Unique: ItruOIecO_2yu0_1LEJjrg-1
Received: by mail-qv1-f70.google.com with SMTP id r16so2186405qvp.13
 for <qemu-arm@nongnu.org>; Wed, 11 Mar 2020 14:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4QL4g+rHLrpNrDoQYTh5a0m2RcZImwxWp+8iTObuoQQ=;
 b=p3HYvIBu7DrVBVIo5eVH3gOYAVHKEIBjybvs6qDU2zYuNLnbwbbK03OuZiqMImj9wB
 Jxk4fpbOz5mslCGNRLVTrGKEghnyDCxrjkpops/AXfbx3rriqhyJ+p2TY/mRSqKOOiwO
 upGFiD5CZtNH77nVQu9ApuaobbnJygp1wJ92WaUqhialPnxIxz7usOER9p1jD/VBRLXr
 hBSO3QhtpvezE4R8jdBOT1bCQOXIpWojRdchX7vp97JF8soAqHH4MwxQBYIXkh6GAAHF
 1JqIE/oq8qpt8J7eIqKX34jYi7lYRmd5E/fbQJ8x+GDQe6wLUeXXoTPU28kUOqc0vApU
 3WXA==
X-Gm-Message-State: ANhLgQ3rVRVdWE3f7T5kFoq0Q2iPqb1DeWjipxCwn7sQdyeOzbAOpODx
 abmMygiPFIgU4dLS/mdCwxtQ3D3xYQOPIIIBOa0no/kq5xGibo0P4GbA8qRn5aUgKu5xIk6FsUx
 dgZRu2V01Q623
X-Received: by 2002:ac8:4c89:: with SMTP id j9mr4566953qtv.68.1583960988409;
 Wed, 11 Mar 2020 14:09:48 -0700 (PDT)
X-Received: by 2002:ac8:4c89:: with SMTP id j9mr4566865qtv.68.1583960986608;
 Wed, 11 Mar 2020 14:09:46 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id h6sm26126833qtr.33.2020.03.11.14.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 14:09:45 -0700 (PDT)
Date: Wed, 11 Mar 2020 17:09:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 02/10] fw_cfg: Migrate ACPI table mr sizes separately
Message-ID: <20200311170827-mutt-send-email-mst@kernel.org>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200311172014.33052-3-shameerali.kolothum.thodi@huawei.com>
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com,
 shannon.zhaosl@gmail.com, david@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XpoLvFoxvVL+

On Wed, Mar 11, 2020 at 05:20:06PM +0000, Shameer Kolothum wrote:
> Any sub-page size update to ACPI table MRs will be lost during
> migration, as we use aligned size in ram_load_precopy() ->
> qemu_ram_resize() path. This will result in inconsistency in sizes
> between source and destination. In order to avoid this, save and
> restore them separately during migration.

Hmm but for old machine types we still have a problem right?
How about aligning size on source for them?
Then there won't be an inconsistency across migration.
Wastes some boot time/memory but maybe that's better
than a chance of not booting ...

> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> Please find the discussion here,
> https://patchwork.kernel.org/patch/11339591/
> ---
>  hw/core/machine.c         |  1 +
>  hw/nvram/fw_cfg.c         | 86 ++++++++++++++++++++++++++++++++++++++-
>  include/hw/nvram/fw_cfg.h |  6 +++
>  3 files changed, 92 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9e8c06036f..6d960bd47f 100644
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

