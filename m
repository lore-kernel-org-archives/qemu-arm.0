Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1398515lfi;
        Mon, 23 Mar 2020 05:35:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvtJ/BrZ/gGJLGbmAHMW7Ka5VWC/gFnhxs1lZc0HbNEYDkgH1fLqnUqZ1lSc2heUB4OtOmy
X-Received: by 2002:ac8:7b39:: with SMTP id l25mr20833777qtu.72.1584966930648;
        Mon, 23 Mar 2020 05:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584966930; cv=none;
        d=google.com; s=arc-20160816;
        b=v0ik7R21i+YeTc4yTlqJrgZCH3d9pbxgTg3ole5vLIkU3UdAuvEAyfXDMyjt/o7Tyc
         /fd5e2kz6/Bo2vYBg73EBkYnzizwJwG96jps5PwjpUyBouPALtGXjD6BPK1VlaXLU80L
         aIFpv6j1oQJqu51asW2biegPLnRtgI3Y9tFVXhVEEm1eB480Aj/4AL2y4jFyjhClG4iu
         RbCkxSsMLGgWJ36yU+Ljra7x5jB4N/EMzyxcEIGvo6y21AfobeiAXhAGX6n64Bs1jx7X
         6sgsEGwoeIbDuN8BSNpk3EQnREQMB3UL83uKhIW47EwRBu4d6wB1QntpNl7Qmjj6gyIT
         uhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=/GJC9N4gq0co+skicPzvDbjxLzrHi9LuPkxH3vicEDs=;
        b=m/BkrEMrD75eTxH/FAQqo9XMxbBOgQZzzmJY1VvjuEJNXoMi4MhaSX3njX4phoVj2i
         wwzTGmA6BF4YHsf9DEAqvxTM9DSWgePmREO9xGf2qJ1nDk7nEO0DSOfZ1d32NfLyxM+d
         tes1HSBpTkAn2Sw98P42u39bJI508HXuGl0uZKWMqB5rl+jTFU+5mDlLMFGATclPyI8l
         5e6ilAkK75n5FWa0AxFWjzQE+fZOWJdhuOWTPHorEa1Scea9YOqLAd0cVRDd+YaFCfJk
         8HZnsNsnIDlgKVz4odFeVQZ8FqIy/qFHZzwjib1tQ9Ovj131R5+18YjOa/bKeLBmo+1G
         9tKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=avOP2qeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g125si8337392qkb.283.2020.03.23.05.35.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 05:35:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=avOP2qeb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGMIk-0006QQ-2C
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 08:35:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jGMIZ-0006PS-F3
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 08:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jGMIX-0003Xc-El
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 08:35:19 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:26506)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jGMIX-0003XH-A2
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 08:35:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584966916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/GJC9N4gq0co+skicPzvDbjxLzrHi9LuPkxH3vicEDs=;
 b=avOP2qebK2QFkQ3Y7ZyAhKekgWMUvafxxJatWwSdrMwgRGuwp7kDNGPQIqf0EmozCoVe9/
 rT3wQeP35HlUA+0A2ZUF7mVJg5ZT1kdM7LzR5XEO0dZ5ZmW2Vkx58VzzLyS6D7qBhZbc7B
 CDZkmMN6mh/hSaapRG2fFinVPAAOpKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-nDv4TMR-Oz6ZyhvZcDfrkA-1; Mon, 23 Mar 2020 08:35:10 -0400
X-MC-Unique: nDv4TMR-Oz6ZyhvZcDfrkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCEC9DB60;
 Mon, 23 Mar 2020 12:35:05 +0000 (UTC)
Received: from localhost (unknown [10.40.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC427E325;
 Mon, 23 Mar 2020 12:34:51 +0000 (UTC)
Date: Mon, 23 Mar 2020 13:34:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 02/10] fw_cfg: Migrate ACPI table mr sizes separately
Message-ID: <20200323133450.6fa65992@redhat.com>
In-Reply-To: <20200311172014.33052-3-shameerali.kolothum.thodi@huawei.com>
References: <20200311172014.33052-1-shameerali.kolothum.thodi@huawei.com>
 <20200311172014.33052-3-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
 qemu-arm@nongnu.org, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1QKXmywaZsDj

On Wed, 11 Mar 2020 17:20:06 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Any sub-page size update to ACPI table MRs will be lost during
> migration, as we use aligned size in ram_load_precopy() ->
> qemu_ram_resize() path. This will result in inconsistency in sizes
> between source and destination.
I'm not sure what problem is and if it matters in case of migration,
an example here with numbers from affected acpi blob would be useful here.

PS:
could you point to mail thread where problem was discussed

> In order to avoid this, save and
> restore them separately during migration.
> 
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
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 9e8c06036f..6d960bd47f 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,7 @@ GlobalProperty hw_compat_4_2[] = {
>      { "usb-redir", "suppress-remote-wake", "off" },
>      { "qxl", "revision", "4" },
>      { "qxl-vga", "revision", "4" },
> +    { "fw_cfg", "acpi-mr-restore", "false" },
>  };
>  const size_t hw_compat_4_2_len = G_N_ELEMENTS(hw_compat_4_2);
>  
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index 179b302f01..36d1e32f83 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -39,6 +39,7 @@
>  #include "qemu/config-file.h"
>  #include "qemu/cutils.h"
>  #include "qapi/error.h"
> +#include "hw/acpi/aml-build.h"
>  
>  #define FW_CFG_FILE_SLOTS_DFLT 0x20
>  
> @@ -610,6 +611,50 @@ bool fw_cfg_dma_enabled(void *opaque)
>      return s->dma_enabled;
>  }
>  
> +static bool fw_cfg_acpi_mr_restore(void *opaque)
> +{
> +    FWCfgState *s = opaque;
> +    return s->acpi_mr_restore;
> +}
> +
> +static void fw_cfg_update_mr(FWCfgState *s, uint16_t key, size_t size)
> +{
> +    MemoryRegion *mr;
> +    ram_addr_t offset;
> +    int arch = !!(key & FW_CFG_ARCH_LOCAL);
> +    void *ptr;
> +
> +    key &= FW_CFG_ENTRY_MASK;
> +    assert(key < fw_cfg_max_entry(s));
> +
> +    ptr = s->entries[arch][key].data;
> +    mr = memory_region_from_host(ptr, &offset);
> +
> +    memory_region_ram_resize(mr, size, &error_abort);
> +}
> +
> +static int fw_cfg_acpi_mr_restore_post_load(void *opaque, int version_id)
> +{
> +    FWCfgState *s = opaque;
> +    int i, index;
> +
> +    assert(s->files);
> +
> +    index = be32_to_cpu(s->files->count);
> +
> +    for (i = 0; i < index; i++) {
> +        if (!strcmp(s->files->f[i].name, ACPI_BUILD_TABLE_FILE)) {
> +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->table_mr_size);
> +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_LOADER_FILE)) {
> +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->linker_mr_size);
> +        } else if (!strcmp(s->files->f[i].name, ACPI_BUILD_RSDP_FILE)) {
> +            fw_cfg_update_mr(s, FW_CFG_FILE_FIRST + i, s->rsdp_mr_size);
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static const VMStateDescription vmstate_fw_cfg_dma = {
>      .name = "fw_cfg/dma",
>      .needed = fw_cfg_dma_enabled,
> @@ -619,6 +664,20 @@ static const VMStateDescription vmstate_fw_cfg_dma = {
>      },
>  };
>  
> +static const VMStateDescription vmstate_fw_cfg_acpi_mr = {
> +    .name = "fw_cfg/acpi_mr",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = fw_cfg_acpi_mr_restore,
> +    .post_load = fw_cfg_acpi_mr_restore_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT64(table_mr_size, FWCfgState),
> +        VMSTATE_UINT64(linker_mr_size, FWCfgState),
> +        VMSTATE_UINT64(rsdp_mr_size, FWCfgState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
>  static const VMStateDescription vmstate_fw_cfg = {
>      .name = "fw_cfg",
>      .version_id = 2,
> @@ -631,6 +690,7 @@ static const VMStateDescription vmstate_fw_cfg = {
>      },
>      .subsections = (const VMStateDescription*[]) {
>          &vmstate_fw_cfg_dma,
> +        &vmstate_fw_cfg_acpi_mr,
>          NULL,
>      }
>  };
> @@ -815,6 +875,23 @@ static struct {
>  #define FW_CFG_ORDER_OVERRIDE_LAST 200
>  };
>  
> +/*
> + * Any sub-page size update to these table MRs will be lost during migration,
> + * as we use aligned size in ram_load_precopy() -> qemu_ram_resize() path.
> + * In order to avoid the inconsistency in sizes save them seperately and
> + * migrate over in vmstate post_load().
> + */
> +static void fw_cfg_acpi_mr_save(FWCfgState *s, const char *filename, size_t len)
> +{
> +    if (!strcmp(filename, ACPI_BUILD_TABLE_FILE)) {
> +        s->table_mr_size = len;
> +    } else if (!strcmp(filename, ACPI_BUILD_LOADER_FILE)) {
> +        s->linker_mr_size = len;
> +    } else if (!strcmp(filename, ACPI_BUILD_RSDP_FILE)) {
> +        s->rsdp_mr_size = len;
> +    }
> +}
> +
>  static int get_fw_cfg_order(FWCfgState *s, const char *name)
>  {
>      int i;
> @@ -914,6 +991,7 @@ void fw_cfg_add_file_callback(FWCfgState *s,  const char *filename,
>      trace_fw_cfg_add_file(s, index, s->files->f[index].name, len);
>  
>      s->files->count = cpu_to_be32(count+1);
> +    fw_cfg_acpi_mr_save(s, filename, len);
>  }
>  
>  void fw_cfg_add_file(FWCfgState *s,  const char *filename,
> @@ -937,6 +1015,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
>              ptr = fw_cfg_modify_bytes_read(s, FW_CFG_FILE_FIRST + i,
>                                             data, len);
>              s->files->f[i].size   = cpu_to_be32(len);
> +            fw_cfg_acpi_mr_save(s, filename, len);
>              return ptr;
>          }
>      }
> @@ -973,7 +1052,10 @@ static void fw_cfg_machine_ready(struct Notifier *n, void *data)
>      qemu_register_reset(fw_cfg_machine_reset, s);
>  }
>  
> -
> +static Property fw_cfg_properties[] = {
> +    DEFINE_PROP_BOOL("acpi-mr-restore", FWCfgState, acpi_mr_restore, true),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
>  
>  static void fw_cfg_common_realize(DeviceState *dev, Error **errp)
>  {
> @@ -1097,6 +1179,8 @@ static void fw_cfg_class_init(ObjectClass *klass, void *data)
>  
>      dc->reset = fw_cfg_reset;
>      dc->vmsd = &vmstate_fw_cfg;
> +
> +    device_class_set_props(dc, fw_cfg_properties);
>  }
>  
>  static const TypeInfo fw_cfg_info = {
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
>  
>  struct FWCfgIoState {

