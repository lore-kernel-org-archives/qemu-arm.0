Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3182677wrt;
        Mon, 14 Jan 2019 07:55:57 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4+HffkrGnv/85MdDRSM62L+Bw1c6jE82LdsCjSEHikEriwIkA/wKsT6UZe5hztSicHLAL5
X-Received: by 2002:adf:e149:: with SMTP id f9mr26988081wri.42.1547481357199;
        Mon, 14 Jan 2019 07:55:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547481357; cv=none;
        d=google.com; s=arc-20160816;
        b=ouN9HWAPnuhL2fGzj9e4hVZbjCPvZpXyWXio+PhJtDBDjBvqxmSI4GS/HlpUineHZo
         c6Of1He0qZ/5xxZmbUrpt6F79DNrsdd6TXusGHpLhabCvIJtVFJpd2FnyOZMyjjUyELn
         jO0GVO5Ghk0rQAeTrcIK8OcI1aZ4mCDX3N6IaLuQkRg2Sux+OuVQfp58HIfyJrQ2tzZr
         iVskCpNbQ5aUahCXYYEg3govoUBsgjGbx2Y6zO+6cDAUp9IVXZWSlvLXORHiV0RExA0S
         it0V8Ku3xrm6VDYfExCBxiPVxvE3aRx3XVnw9q1vckbvzZtI8bqMeWoSgaXyZ9ytGZmb
         XrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:content-disposition
         :mime-version:references:message-id:to:from:date;
        bh=9XqfgCp3m7IgiM1C8yeoqp6Ix5TLYXWk+2HUqf7EvqY=;
        b=ae/hVPblFzcxajzDfxbQM0wPukqQC8j/NrQUv4zjbfNM+pxq3RnqQgtuO2nVsuIttD
         pMr0kfqeRz3hdiAyvHREcjQkRkEAc7yIDQTGo1VQARUIPyXO2aG0+Sh6R8FrOiO90xsb
         P5SfYdi8Jvz3hLxeKJPs06PgWt6s0/e50feDJWfWcirZtsGV77Z2gSeauc39wfkE395q
         76SBkIgPS8VNXou3CppTuHM6QFuyI7Gqyvwv2O2V2+3Vev1gr4Ma1IvUVsP2tgb/aVvP
         nQSuJb6waukT6jUUY8j9vJF6mYac3wurTh/abFqK7bvIUierMN66lmrHyE27M9LW6VBn
         BLNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t207si10171454wmt.144.2019.01.14.07.55.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 07:55:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj4ai-0002Dc-7H
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 10:55:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj4Uh-0006Ac-8l
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 10:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj4Uf-0004b7-Ro
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 10:49:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58494)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gj4Uf-0004Y4-Ip; Mon, 14 Jan 2019 10:49:41 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB3DFA8338;
	Mon, 14 Jan 2019 15:49:40 +0000 (UTC)
Received: from redhat.com (ovpn-123-100.rdu2.redhat.com [10.10.123.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E66963B88;
	Mon, 14 Jan 2019 15:49:38 +0000 (UTC)
Date: Mon, 14 Jan 2019 10:49:34 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190114104559-mutt-send-email-mst@kernel.org>
References: <20190114130829.21790-1-philmd@redhat.com>
	<20190114130829.21790-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190114130829.21790-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 14 Jan 2019 15:49:40 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 1/3] hw/nvram/fw_cfg: Remove various
 typedefs from "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-devel@nongnu.org,
	"open list:Virt" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRbfbT/0+lhr

On Mon, Jan 14, 2019 at 02:08:27PM +0100, Philippe Mathieu-Daud=E9 wrote:
> There are only three include files requiring these typedefs, let them
> include "hw/nvram/fw_cfg.h" directly to simplify "qemu/typedefs.h".
>=20
> To clean "qemu/typedefs.h", move the declarations to "hw/nvram/fw_cfg.h=
".
> Reorder two function declarations to avoid forward typedef declarations=
.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  include/hw/acpi/vmgenid.h |  1 +
>  include/hw/arm/virt.h     |  1 +
>  include/hw/mem/nvdimm.h   |  1 +
>  include/hw/nvram/fw_cfg.h | 22 ++++++++++++----------
>  include/qemu/typedefs.h   |  4 ----
>  5 files changed, 15 insertions(+), 14 deletions(-)

I am sorry I don't understand what this patchset is about.
Supposed to be a cleanup but instead it pulls
fw cfg into any user of unrelated headers.

More lines of code slower builds what's to like?

Shared typedefs is what typedefs.h is about.
These are clearly shared so let's keep it simple.


> diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
> index 38586ecbdf..be53de38f1 100644
> --- a/include/hw/acpi/vmgenid.h
> +++ b/include/hw/acpi/vmgenid.h
> @@ -3,6 +3,7 @@
> =20
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/qdev.h"
> +#include "hw/nvram/fw_cfg.h"
>  #include "qemu/uuid.h"
> =20
>  #define VMGENID_DEVICE           "vmgenid"
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4cc57a7ef6..fef632dcf5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
>  #include "hw/arm/arm.h"
> +#include "hw/nvram/fw_cfg.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
> =20
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index c5c9b3c7f8..51d3a52c4b 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -24,6 +24,7 @@
>  #define QEMU_NVDIMM_H
> =20
>  #include "hw/mem/pc-dimm.h"
> +#include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
> =20
>  #define NVDIMM_DEBUG 0
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index f5a6895a74..cc744d5268 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -14,15 +14,12 @@
>  #define FW_CFG_IO(obj)  OBJECT_CHECK(FWCfgIoState,  (obj), TYPE_FW_CFG=
_IO)
>  #define FW_CFG_MEM(obj) OBJECT_CHECK(FWCfgMemState, (obj), TYPE_FW_CFG=
_MEM)
> =20
> -typedef struct fw_cfg_file FWCfgFile;
> -
>  #define FW_CFG_ORDER_OVERRIDE_VGA    70
>  #define FW_CFG_ORDER_OVERRIDE_NIC    80
>  #define FW_CFG_ORDER_OVERRIDE_USER   100
>  #define FW_CFG_ORDER_OVERRIDE_DEVICE 110
> =20
> -void fw_cfg_set_order_override(FWCfgState *fw_cfg, int order);
> -void fw_cfg_reset_order_override(FWCfgState *fw_cfg);
> +typedef struct fw_cfg_file FWCfgFile;
> =20
>  typedef struct FWCfgFiles {
>      uint32_t  count;
> @@ -34,7 +31,9 @@ typedef struct fw_cfg_dma_access FWCfgDmaAccess;
>  typedef void (*FWCfgCallback)(void *opaque);
>  typedef void (*FWCfgWriteCallback)(void *opaque, off_t start, size_t l=
en);
> =20
> -struct FWCfgState {
> +typedef struct FWCfgEntry FWCfgEntry;
> +
> +typedef struct FWCfgState {
>      /*< private >*/
>      SysBusDevice parent_obj;
>      /*< public >*/
> @@ -53,17 +52,17 @@ struct FWCfgState {
>      dma_addr_t dma_addr;
>      AddressSpace *dma_as;
>      MemoryRegion dma_iomem;
> -};
> +} FWCfgState;
> =20
> -struct FWCfgIoState {
> +typedef struct FWCfgIoState {
>      /*< private >*/
>      FWCfgState parent_obj;
>      /*< public >*/
> =20
>      MemoryRegion comb_iomem;
> -};
> +} FWCfgIoState;
> =20
> -struct FWCfgMemState {
> +typedef struct FWCfgMemState {
>      /*< private >*/
>      FWCfgState parent_obj;
>      /*< public >*/
> @@ -71,7 +70,10 @@ struct FWCfgMemState {
>      MemoryRegion ctl_iomem, data_iomem;
>      uint32_t data_width;
>      MemoryRegionOps wide_data_ops;
> -};
> +} FWCfgMemState;
> +
> +void fw_cfg_set_order_override(FWCfgState *fw_cfg, int order);
> +void fw_cfg_reset_order_override(FWCfgState *fw_cfg);
> =20
>  /**
>   * fw_cfg_add_bytes:
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 30ad8b2d8d..293e47ef7c 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -28,10 +28,6 @@ typedef struct DriveInfo DriveInfo;
>  typedef struct Error Error;
>  typedef struct EventNotifier EventNotifier;
>  typedef struct FlatView FlatView;
> -typedef struct FWCfgEntry FWCfgEntry;
> -typedef struct FWCfgIoState FWCfgIoState;
> -typedef struct FWCfgMemState FWCfgMemState;
> -typedef struct FWCfgState FWCfgState;
>  typedef struct HVFX86EmulatorState HVFX86EmulatorState;
>  typedef struct I2CBus I2CBus;
>  typedef struct I2SCodec I2SCodec;
> --=20
> 2.17.2
>=20
